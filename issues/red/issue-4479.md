
#4479: [View] False on-over offsets crawl in at bubbling phase
================================================================================
Issue is closed, was reported by hiiamboris and has 20 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4479>

**Describe the bug**

![](https://i.gyazo.com/034f816e0ce4a5fad6c33ae2a19ebabe.gif)

**To reproduce**

This code should draw a freehand line:
```
Red [needs: view]

line1: [line]
line2: [line]
view/no-wait [
    p: panel purple 400x100
    draw compose/only [pen yello text 40x40 "DRAG FROM HERE" pen gold (line1)]
    [
        at 200x0 b: base 200x100 cyan brown font-size 10 "TO HERE"
        draw compose/only [translate -200x0 pen blue (line2)]
    ]
    all-over on-over [
        unless event/down? [exit]
        o: event/offset + either event/face =? p [0x0][b/offset]
        append line1 o
        append line2 o
        ; print [b =? event/face p =? event/face]
        print [event/offset "^-IN" pick [panel base] event/face =? face]
    ]
]
```
See also the output of `print`: half of the events reported for `base` have the offset relative to `panel`.

**Expected behavior**

Offsets should always be relative to `event/face`.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-03T06:55:00Z, qtxie, commented:
<https://github.com/red/red/issues/4479#issuecomment-637996967>

    This one is not easy to fix.

--------------------------------------------------------------------------------

On 2020-06-03T07:54:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4479#issuecomment-638027492>

    Without this fix I'm unable to do resizable columns in the table :(

--------------------------------------------------------------------------------

On 2020-06-03T18:47:15Z, greggirwin, commented:
<https://github.com/red/red/issues/4479#issuecomment-638390816>

    @qtxie can you describe briefly what the problem is?

--------------------------------------------------------------------------------

On 2020-06-04T01:56:34Z, qtxie, commented:
<https://github.com/red/red/issues/4479#issuecomment-638554706>

    We bypass the wndproc of each window and generate the `over` event manually: https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L1512-L1529
    
    Also the `on-over` handler of the `panel` should only receive events of the panel, not the base face. This is the proper way to write the code:
    ```
    line1: [line]
    line2: [line]
    view/no-wait [
        p: panel purple 400x100
        draw compose/only [pen yello text 40x40 "DRAG FROM HERE" pen gold (line1)]
        [
            at 200x0 b: base 200x100 cyan brown font-size 10 "TO HERE" all-over on-over [
           	    unless event/down? [exit]
                ;@@ event/face always equal to b
                ;@@ event/offset related to the base face
           	    print [face/type " " event/offset " " event/flags]
                append line2 event/offset
            ]
            draw compose/only [pen blue (line2)]
        ]
        all-over on-over [
            unless event/down? [exit]
            ;@@ event/face always equal to p
            ;@@ event/offset related to the panel face
            ;@@ no away flag when moving into the base face as the base face inside the panel
           	print [face/type " " event/offset " " event/flags]
            append line1 event/offset
        ]
    ]
    ```
    So there are two solutions:
    1. Register a wndproc for each window and handle the `over` event in the wndproc. This is the normal way when implementing a native GUI framework. In view backend we didn't use this way, I guess it's for reducing code?
    2. Write some sophisticate code in `process` to make it work as expected. ;-)

--------------------------------------------------------------------------------

On 2020-06-04T07:38:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4479#issuecomment-638665914>

    This is what I'm getting from your snippet:
    ![](https://i.gyazo.com/1b635e23abdf8ad457c9592abeb89fa2.png)
    
    So I suppose while it may be a correct way, it doesn't work yet ;)

--------------------------------------------------------------------------------

On 2020-10-14T08:25:42Z, bitbegin, commented:
<https://github.com/red/red/issues/4479#issuecomment-708245230>

    https://github.com/red/red/issues/1636

--------------------------------------------------------------------------------

On 2020-10-14T08:55:12Z, bitbegin, commented:
<https://github.com/red/red/issues/4479#issuecomment-708261412>

    ```
    line1: [line]
    line2: [line]
    view/no-wait [
        p: panel purple 400x100
    	draw compose/only [pen yello text 40x40 "DRAG FROM HERE" pen gold (line1)]
        [
            at 200x0 b: base 200x100 cyan brown font-size 10 "TO HERE" 
    		draw compose/only [translate -200x0 pen blue (line2)]
    		all-over on-over [
    			unless event/down? [exit]
    			print [2 event/offset]
    			;append line2 event/offset
    		]
        ]
        all-over on-over [
    		unless event/down? [exit]
    		if event/face = face [
    			print [1 event/offset]
    			;append line1 event/offset
    		]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-10-14T09:03:17Z, bitbegin, commented:
<https://github.com/red/red/issues/4479#issuecomment-708265886>

    https://github.com/red/red/blob/master/modules/view/backends/gtk3/handlers.reds#L463-L476
    
    only dispatch the events to back layer

--------------------------------------------------------------------------------

On 2022-09-17T14:01:47Z, dockimbel, commented:
<https://github.com/red/red/issues/4479#issuecomment-1250077010>

    @hiiamboris @qtxie Seems to have been fixed by the recent commits. Can you confirm?

--------------------------------------------------------------------------------

On 2022-09-17T14:20:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4479#issuecomment-1250080158>

    Confirmed, fixed in `red-view-17sep22-3d300ec6b`, was broken in `red-view-11sep22-85fa7e783`


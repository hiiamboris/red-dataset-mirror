
#3814: [View] rich-text metrics get corrupted by introducing new facets
================================================================================
Issue is open, was reported by hiiamboris and has 16 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/3814>

:point_up: [March 10, 2019 11:57 PM](https://gitter.im/red/red/gui-branch?at=5c857a30e527821f0a38208d)

**Describe the bug**
```
extend system/view/VID/styles [
	style1: [template: [type: 'rich-text junk1: junk2: 1]]
	style2: [template: [type: 'rich-text junk1: 1]]
	style3: [template: [type: 'rich-text line-spacing: handles: none junk1: junk2: 1]]
] 
view [
	style1 100x100  on-created [print ['style1 size-text/with face "A"]]
	style2 100x100  on-created [print ['style2 size-text/with face "A"]]
	style3 100x100  on-created [print ['style3 size-text/with face "A"]]
]
```
Output is:
```
style1 0x1
style2 0x11
style3 0x11
```

Same styles displayed:
```
view [
	style1 100x100 cyan "A^/A^/A^/A^/A^/A"
	style2 100x100 cyan "A^/A^/A^/A^/A^/A"
	style3 100x100 cyan "A^/A^/A^/A^/A^/A"
]
```
![](https://i.gyazo.com/eb90458b406e4f49811c1138014b4a22.png)

Style2 for some reason isn't broken yet (by adding `junk1`), Style3 is fixed by placing it after the RTD-specific facets (there are 3 that aren't present in a `face!`: `line-spacing`, `handles` and `tabs`)

**Expected behavior**

All styles should give the same value upon `size-text` and should be displayed correctly.
Regarding `0x` part see #3812 

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-14T16:05:36Z, qtxie, commented:
<https://github.com/red/red/issues/3814#issuecomment-472937309>

    @hiiamboris The rich-text face is extended with 3 facets (tabs: none line-spacing: 'default handles: none) in `styles.red`. Seems you already noticed that.
    ```
    rich-text: [
    	default-actor: on-change
    	template: [
    		type: 'rich-text size: 150x150 color: 255.255.255
    		tabs: none line-spacing: 'default handles: none
    	]
    ]
    ```
    If you want to add more facets, you should add them after those 3 facets. At least for now, I don't have better solution.

--------------------------------------------------------------------------------

On 2019-03-14T17:01:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/3814#issuecomment-472964295>

    What's the problem? Can't these facets be accessed by name, not by index?

--------------------------------------------------------------------------------

On 2019-03-14T20:07:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3814#issuecomment-473039949>

    Is there a `set` op on an object somewhere that trips this up @qtxie ?

--------------------------------------------------------------------------------

On 2019-04-20T08:31:58Z, qtxie, commented:
<https://github.com/red/red/issues/3814#issuecomment-485069982>

    @hiiamboris The problem is those 3 facets are not in the `rich-text type`, they are added in the `rich-text style` (https://github.com/red/red/blob/master/modules/view/styles.red#L40). If you want to define your own **style** which is an extending of the `rich-text style`, you need to keep those 3 facets in your style.

--------------------------------------------------------------------------------

On 2019-04-20T09:11:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/3814#issuecomment-485075046>

    @qtxie This doesn't work (I'm keeping the 3 facets like you say):
    ```
    extend system/view/VID/styles [
       style4: [template: [type: 'rich-text junk1: junk2: 1 line-spacing: handles: tabs: none]]
    ]
    view [style4 100x100  on-created [print ['style4 size-text/with face "A"]]]    ;) output is 0x1
    view [style4 100x100 cyan "A^/A^/A^/A^/A^/A"]                                  ;) same as style1
    ```

--------------------------------------------------------------------------------

On 2019-04-20T12:12:58Z, qtxie, commented:
<https://github.com/red/red/issues/3814#issuecomment-485106169>

    @hiiamboris You should add the junk1 and junk2 after those 3 facets.

--------------------------------------------------------------------------------

On 2019-04-20T12:14:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/3814#issuecomment-485106451>

    Why?

--------------------------------------------------------------------------------

On 2019-04-20T13:03:12Z, qtxie, commented:
<https://github.com/red/red/issues/3814#issuecomment-485115049>

    Current implementation use index to access those facets.


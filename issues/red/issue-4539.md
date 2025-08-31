
#4539: [CRASH] Reactively loading an area into a panel on MacOS
================================================================================
Issue is open, was reported by theSherwood and has 14 comment(s).
[type.bug] [GUI.macOS]
<https://github.com/red/red/issues/4539>

**Describe the bug**
```
Red []

view [
    h5 200x20 "Source" h5 200x20 "Output" return
    source: area 200x150 "a: area"
    panel react [
        attempt/safer [face/pane: layout/tight/only load source/text]
    ]
]
```
A series of clicks after running the above script, crashes the window and produces the following error in the console.
```
*** Runtime Error 1: access violation
*** at: 00036A78h
```

**To reproduce**
Steps to reproduce the behavior:
1. Run the above script.
2. Click on the "output" `area`
3. Click away
4. Click back to the "output" `area`

**Expected behavior**
The `area` face ought to be able to take focus again.

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 21-Nov-2018/18:40:38-06:00 commit #755eb94
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-23T11:56:45Z, 9214, commented:
<https://github.com/red/red/issues/4539#issuecomment-648098604>

    > 21-Nov-2018
    
    @theSherwood could you please re-test this on the [latest](https://static.red-lang.org/dl/auto/mac/red-latest) build?

--------------------------------------------------------------------------------

On 2020-06-23T15:34:37Z, theSherwood, commented:
<https://github.com/red/red/issues/4539#issuecomment-648242122>

    @9214 I'm getting an SSL error trying to get the latest build.:
    ```
    Error code: SSL_ERROR_RX_RECORD_TOO_LONG
    ```

--------------------------------------------------------------------------------

On 2020-06-23T15:41:16Z, 9214, commented:
<https://github.com/red/red/issues/4539#issuecomment-648246071>

    @theSherwood thanks for the heads-up! @x8x ☝️ I think this is under your purview.

--------------------------------------------------------------------------------

On 2020-06-23T15:54:51Z, 9214, commented:
<https://github.com/red/red/issues/4539#issuecomment-648254438>

    I can reproduce the crash on macOS 10.14.
    ```red
    Red 0.6.4 for macOS built 22-Jun-2020/10:27:56-07:00 commit #2142264
    ```
    
    @theSherwood FYI, if automatic builds are unaccessible for some reason, you can always build Red [from sources](https://github.com/red/red#running-red-from-the-sources-for-contributors). The process is relatively painless, although I recall Rebol/View being a bit problematic on *nix OSes. Ask around on Gitter if you'll stumble on any problems.

--------------------------------------------------------------------------------

On 2020-06-23T16:04:41Z, theSherwood, commented:
<https://github.com/red/red/issues/4539#issuecomment-648260239>

    @9214 Sounds good.
    
    Possibly related to this issue, but I'm not for sure; if you replace
    ```
    source: area 200x150 "a: area"
    ```
    in the script above with 
    ```
    source: area 200x150 "f: field"
    ```
    the script does not crash on clicking in and out of the field. However, it takes two clicks to give the field focus, whereas it only took one click to give the area focus.
    
    Should I open a separate issue for this or do you think it related in some way?

--------------------------------------------------------------------------------

On 2020-06-23T16:32:17Z, 9214, commented:
<https://github.com/red/red/issues/4539#issuecomment-648275863>

    @theSherwood in my testing it took two clicks to get back focus to area the first time I clicked away; the second time it crashed. Here's the detailed stack trace:
    ```red
    *** Runtime Error 1: access violation
    *** in file: .../red/runtime/datatypes/context.reds
    *** at line: 22
    ***
    ***   stack: red/_context/find-word 00000014h 108 true
    ***   stack: red/object/eval-path 0085C294h 014587A8h 00000000h 01458140h false
    ***   stack: red/actions/eval-path 0085C294h 014587A8h 00000000h 01458140h false
    ***   stack: red/interpreter/eval-path 014587A8h 01458150h 014581E0h false false true false
    ***   stack: red/interpreter/eval-expression 01458150h 014581E0h false true false
    ***   stack: red/interpreter/eval-arguments 0085C284h 01458140h 014581E0h 00000000h 00000000h
    ***   stack: red/interpreter/eval-code 0085C284h 01458140h 014581E0h false 00000000h 00000000h 0110FED8h
    ***   stack: red/interpreter/eval-expression 01458140h 014581E0h false false false
    ***   stack: red/interpreter/eval 01458078h true
    ***   stack: red/interpreter/eval-function 0085C234h 01458078h
    ***   stack: red/_function/call 0085C234h 00498D14h
    ***   stack: red/interpreter/eval-code 0085C234h 013DF880h 013DF880h false 00000000h 00000000h 0085C1A4h
    ***   stack: red/interpreter/eval-expression 013DF860h 013DF880h false false false
    ***   stack: red/interpreter/eval 0085C224h true
    ***   stack: red/natives/try* true 0
    ***   stack: do-safe
    ***   stack: ctx||458~awake 00498DACh
    ***   stack: gui/make-event 7715008 67108864 12
    ***   stack: gui/mouse-exited 7715008 -1857452995 24276768
    ***   stack: gui/process-mouse-tracking 81816000 24276768
    ***   stack: gui/app-send-event 78644784 -1857380749 24276768
    ***   stack: gui/do-events false
    ***   stack: ctx||467~do-event-loop false
    ***   stack: do-events
    ***   stack: view
    ...
    ```
    I can reproduce the field double-clicking that you've mentioned too, the same thing happens on Windows, and probably on GTK.
    
    This is expected, because you are replacing a face inside panel with an exact copy of it, yet it's not the _same_ face that had a focus — that one was thrown away as soon as you rebuilt the pane block from entered VID layout.

--------------------------------------------------------------------------------

On 2020-07-09T09:59:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4539#issuecomment-656033901>

    Funny, the stack trace is almost identical here: https://github.com/red/red/issues/4564


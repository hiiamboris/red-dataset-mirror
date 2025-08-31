
#1900: Alt+<key> is not detectable
================================================================================
Issue is closed, was reported by dockimbel and has 10 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/1900>

This is the log from a View session:

```
red>> system/view/debug?: yes
== true
red>> view []
... ;-- Pressing Alt+F
event> type: key-down offset: none key: left-menu flags: []
event> type: key-down offset: none key: #"F" flags: []
event> type: key-up offset: none key: #"F" flags: []
event> type: key-up offset: none key: left-menu flags: []
... ;-- Pressing right Alt+G
event> type: key-down offset: none key: left-control flags: [control]
event> type: key-down offset: none key: right-menu flags: [control]
event> type: key-down offset: none key: #"G" flags: [control]
event> type: key-up offset: none key: #"G" flags: [control]
event> type: key-up offset: none key: left-control flags: []
event> type: key-up offset: none key: right-menu flags: []
event> type: close offset: none key: none flags: []
```

[Alt] key should be a flag, rather than a key, allowing to detect combinations with other keys.

Also, right-Alt key wrongly generate a `left-control` key event (in addition to the `right-menu` key event) and wrongly sets the `control` flag.



Comments:
--------------------------------------------------------------------------------

On 2017-02-13T08:32:43Z, qtxie, commented:
<https://github.com/red/red/issues/1900#issuecomment-279323250>

    https://blog.molecular-matters.com/2011/09/05/properly-handling-keyboard-input/
    > “Alt Gr” on german (and other) keyboards – “Alt Gr” is not the same as right-hand “Alt” on US keyboards, it essentially is a short-cut for “Control” and right-hand “Alt”.

--------------------------------------------------------------------------------

On 2017-02-15T12:00:20Z, qtxie, commented:
<https://github.com/red/red/issues/1900#issuecomment-279992966>

    Here is a solution for `AltGr` issue: 
    https://github.com/mintty/mintty/blob/master/src/wininput.c#L642

--------------------------------------------------------------------------------

On 2019-05-13T19:00:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/1900#issuecomment-491945142>

    Works as expected for me on W7.
    
    Layout that maps AltGr to Alt, pressing Alt-F then AltGr-G:
    ```
    face> type: window event> type: key-down offset: -490x118 key: left-alt flags: [alt]
    face> type: window event> type: key-down offset: -490x118 key: #"F" flags: [alt]
    face> type: window event> type: key-up offset: -490x118 key: #"F" flags: [alt]
    face> type: window event> type: key-up offset: -490x118 key: left-alt flags: []
    face> type: window event> type: key-down offset: -490x118 key: right-alt flags: [alt]
    face> type: window event> type: key-down offset: -490x118 key: #"G" flags: [alt]
    face> type: window event> type: key-up offset: -490x118 key: #"G" flags: [alt]
    face> type: window event> type: key-up offset: -490x118 key: right-alt flags: []
    ```
    US International layout, pressing AltGr-C (©):
    ```
    face> type: window event> type: key-down offset: 128x-15 key: left-control flags: [control alt]
    face> type: window event> type: key-down offset: 128x-15 key: right-alt flags: [control alt]
    face> type: window event> type: key-down offset: 128x-15 key: #"C" flags: [control alt]
    face> type: window event> type: key offset: 128x-15 key: #"©" flags: [control alt]
    face> type: window event> type: key-up offset: 128x-15 key: #"C" flags: [control alt]
    face> type: window event> type: key-up offset: 128x-15 key: left-control flags: []
    face> type: window event> type: key-up offset: 128x-15 key: right-alt flags: []
    ```

--------------------------------------------------------------------------------

On 2019-05-13T21:13:55Z, greggirwin, commented:
<https://github.com/red/red/issues/1900#issuecomment-491989287>

    Seems OK on WIn10 as well.

--------------------------------------------------------------------------------

On 2020-03-21T18:57:34Z, 9214, commented:
<https://github.com/red/red/issues/1900#issuecomment-602087433>

    Cannot dupe this one either, W10.


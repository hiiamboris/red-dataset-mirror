
#1596: GROUP-BOX' text is changed when shown for second time
================================================================================
Issue is closed, was reported by rebolek and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1596>

If you have GROUP-BOX in some subwindow, close it and open it again, GROUP-BOX text is changed to text from its content. See this code:

```
Red [
    Needs: 'View
]

view [
    button "show" [
        view [      
            group-box "Original text" [
                field "New text"
            ]
            button "close" [unview]
        ]
    ]
]
```

Press [SHOW], then [CLOSE], then [SHOW] again. GROUP-BOX label now says "New text" instead of "Original text".



Comments:
--------------------------------------------------------------------------------

On 2016-02-05T10:06:51Z, rebolek, commented:
<https://github.com/red/red/issues/1596#issuecomment-180282005>

    Probably related to #1565

--------------------------------------------------------------------------------

On 2016-02-05T10:36:34Z, meijeru, commented:
<https://github.com/red/red/issues/1596#issuecomment-180288586>

    Are you even supposed to call `view` from within an action?

--------------------------------------------------------------------------------

On 2016-02-06T11:45:19Z, rebolek, commented:
<https://github.com/red/red/issues/1596#issuecomment-180743671>

    How else would you open a sub window?
    
    > 1. 2. 2016 v 11:36, Rudolf Meijer notifications@github.com:
    > 
    > Are you even supposed to call view from within an action?
    > 
    > —
    > Reply to this email directly or view it on GitHub https://github.com/red/red/issues/1596#issuecomment-180288586.

--------------------------------------------------------------------------------

On 2016-02-06T17:41:39Z, WiseGenius, commented:
<https://github.com/red/red/issues/1596#issuecomment-180818420>

    For me, previous builds give this issue, but this behaviour has since changed so that I get the same thing both times: It's a blank group-box with the correct text, but no contents:
    
    ![blank group-box](https://cloud.githubusercontent.com/assets/7657453/12868154/6aad9330-cd4c-11e5-82c9-40e538e964bc.png)
    
    Same on both Windows XP and Windows 7. This is basically #1592.

--------------------------------------------------------------------------------

On 2016-02-07T10:49:39Z, meijeru, commented:
<https://github.com/red/red/issues/1596#issuecomment-180994837>

    Could one define a sub-window by `layout` and open it by `show`? Or does that omit crucial steps?

--------------------------------------------------------------------------------

On 2016-02-10T05:43:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1596#issuecomment-182207996>

    Until recently, `view` was initializing the View engine, but now that is automated. `show` is fine now, though, it is a low-level way to open a window, so you don't get any default features provided by View (like a default title or automatic centering).

--------------------------------------------------------------------------------

On 2016-02-15T16:47:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1596#issuecomment-184295165>

    @rebolek The right way to open a sub-window is to use `view/no-wait` to avoid creating a new event loop.


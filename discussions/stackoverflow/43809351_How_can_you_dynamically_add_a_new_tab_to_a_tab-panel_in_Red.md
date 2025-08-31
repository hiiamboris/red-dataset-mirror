# How can you dynamically add a new tab to a tab-panel in Red

**Link:**
<https://stackoverflow.com/questions/43809351/how-can-you-dynamically-add-a-new-tab-to-a-tab-panel-in-red>

**Asked:** 2017-05-05 16:03:49 UTC

------------------------------------------------------------------------

Let\'s say you have a tab-panel like so :

    editor: layout [
        below
        t: tab-panel 350x350 [
            "tab 1" [
                below
                b: button 75x25 "Interpret" on-click [do a/text ]
                a: area 320x250
            ]
        ]
    ]

    view editor

How could I dynamically add a new tab to it so that has the contents of
the current tab?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

They are several ways to add a new tab dynamically, but in all cases, it
boils down to adding:

-   A tab label as a `string!` to `t/data` block.
-   A corresponding `panel` face `object!` to `t/pane` block.

Here is a fully working example code:

    tab1: [
        below
        button 75x25 "Interpret" on-click [do face/parent/pane/2/text ]
        area 320x250
    ]

    editor: layout compose/deep/only [
        below
        button "add tab" [
            append t/data "tab 2"
            append t/pane make face! [type: 'panel pane: layout/only tab1]
        ]
        t: tab-panel 350x350 ["tab 1" (tab1)]
    ]
    view editor

Some remarks:

-   `tab1` definition has been externalized, so its definition can be
    reused for another tab content (as per your request).
-   `a:` word has been removed as it cannot be duplicated, access to the
    current `area` face in current tab panel is now done by walking up
    the face tree. `b:` definition has been dropped for same reason (and
    it\'s not used anyway).

Examples of dynamic behaviors and dynamic face construction (without VID
dialect) are available
[here](https://github.com/red/red/blob/master/tests/view-test.red){rel="nofollow noreferrer"}.
`tab-panel` face type is described
[there](https://doc.red-lang.org/en/view.html#_tab_panel){rel="nofollow noreferrer"}.

*Comment by Alexander Ryan Baggett:* Can you explain what
compose/deep/only is used for in this context?

*Comment by Alexander Ryan Baggett:* Oh nevermind I see, you use that
with the \[\"tab 1\" (tab1) \]

------------------------------------------------------------------------

## Comments on question

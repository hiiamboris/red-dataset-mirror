
#4191: GTK: face added to panel's pane appear after exiting event handler, that caused it, instead immediately.
================================================================================
Issue is open, was reported by loziniak and has 4 comment(s).
[GUI] [GUI.GTK]
<https://github.com/red/red/issues/4191>

([original gitter post](https://gitter.im/red/help?at=5dfa2a160cb24d1d44df03aa))
With this code red square is shown AFTER `wait`, instead before:
```
Red [Needs: 'View]
a: make face! [
    type: 'base color: red size: 20x20

    showw: function [
        parent [object!]
        offs [pair!]
    ] [
        self/offset: offs
        self/parent: parent
        append parent/pane self
    ]

    hide: does [
        remove find self/parent/pane self
        self/parent: none
    ]
]

view [
    panel [
        button "show a" [
            a/showw face/parent 0x0    ; square appears after wait, not before
            wait 3.0
            ;a/hide                    ; if you uncomment it, red square disappears as soon as it is shown
        ]
    ]
]
```

Platform: Arch Linux, latest Red sources, GTK branch.
In Wine [and Win7](https://gitter.im/red/help?at=5dfa2cae8897197969ba024d) it works as expected.


Comments:
--------------------------------------------------------------------------------

On 2020-02-10T02:46:24Z, bitbegin, commented:
<https://github.com/red/red/issues/4191#issuecomment-583933496>

    this code will work:
    ```
    a: make face! [
        type: 'base color: red size: 20x20
    
        showw: function [
            parent [object!]
            offs [pair!]
        ] [
            self/offset: offs
            self/parent: parent
            append parent/pane self
        ]
    
        hide: does [
            remove find self/parent/pane self
            self/parent: none
        ]
    ]
    
    view [
        panel [
            button "show a" [
                a/showw face/parent 0x0    ; square appears after wait, not before
    			loop 100 [do-events/no-wait]
                wait 3.0
                a/hide                    ; if you uncomment it, red square disappears as soon as it is shown
            ]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-02-10T09:59:25Z, loziniak, commented:
<https://github.com/red/red/issues/4191#issuecomment-584043496>

    Thanks for the hack!



#2150: If a 'BASE has a 'FIELD as its child, the BASE will interfere the FIELD's event.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
<https://github.com/red/red/issues/2150>

``` Red
red [
    needs: 'view
]

view [
    container1: BASE 300x450 red    
    do [
        container1/pane: reduce [
            make face! [
                type: 'field
                offset: 10x10
                size: 250x40
                actors: object [
                    on-change: func [ face [face!] event [event!] ] [
                        print [ "change: " face/text]  
                    ]
                    on-enter: func [ face [face!] event [event!] ] [
                        print [ "enter: " face/text ]
                    ]
                ]
            ]
        ]
    ]
]
```

ON-CHANGE will never be called. ON-ENTER will print none, which is not right.

If I replace the base with a panel, everything will be just fine.



Comments:
--------------------------------------------------------------------------------

On 2016-12-12T14:14:59Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2150#issuecomment-266440938>

    In the latest Mac version. this bug is gone.



#1704: Within some tight loops, view does not seem to check events 
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1704>

```
Red []
view [
    t: text "abcd" button "Change" [forever [t/text: random "efgh"]]
    button "Quit" [quit]
]
```

The button Quit does not react once Change is clicked.



Comments:
--------------------------------------------------------------------------------

On 2016-03-12T11:11:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1704#issuecomment-195717324>

    You are creating an infinite loop, Red execution is single-threaded for now, so such code will freeze the GUI event loop.
    
    In such cases, you can run the event loop manually using `do-events/no-wait`:
    
    ```
    Red []
    view [
        t: text "abcd" button "Change" [forever [t/text: random "efgh" do-events/no-wait]]
        button "Quit" [quit]
    ]
    ```
    
    This will allow events to be processed again in such tight loop.

--------------------------------------------------------------------------------

On 2016-03-12T13:09:03Z, meijeru, commented:
<https://github.com/red/red/issues/1704#issuecomment-195738062>

    Thanks!  Worthwhile mentioning in View documentation??


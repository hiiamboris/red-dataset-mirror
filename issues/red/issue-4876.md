
#4876: Dynamically update face/pane crashes view
================================================================================
Issue is closed, was reported by qtxie and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4876>

**Describe the bug**
Run the following script, click on the window repeatedly.
```
Red []
getpanel: function [ i ] [ 
    compose/deep [ panel 200x55 0.30.30 [ ] draw []]
]
view [
    aa: panel 400x600 [ text "click to add panel" ] on-down [ 
        clear face/pane
        repeat n 10 [
            append face/pane layout/only getpanel n 
        ]
    ]
]
```
Crashes:
```
*** Runtime Error 1: access violation
*** at: 004341B7h
```

**Expected behavior**
No crash.

**Platform version**
Red 0.6.4 for Windows built 13-Apr-2021/6:52:09



Comments:
--------------------------------------------------------------------------------

On 2021-04-13T07:47:19Z, qtxie, commented:
<https://github.com/red/red/issues/4876#issuecomment-818522597>

    Related to GC.  No crash with `recycle/off`. No crash in debug mode.

--------------------------------------------------------------------------------

On 2021-04-14T01:30:32Z, qtxie, commented:
<https://github.com/red/red/issues/4876#issuecomment-819157495>

    Not related to view backend. This also crashes:
    ```
    loop 1000 [layout/only compose/deep [base draw []]]
    ```

--------------------------------------------------------------------------------

On 2021-04-14T02:25:34Z, qtxie, commented:
<https://github.com/red/red/issues/4876#issuecomment-819174787>

    ```
    loop 1000 [layout/only compose/deep [base draw []]]
    ```
    No crash if `compose` without `/deep`. Maybe it allocates more memory with `/deep`, which trigger the issue.
    No crash if the draw block is not empty. 
    
    It crashes inside `parse` when parsing empty draw block. It looks like the GC corrupted some states in parse. The parse is happened inside another `parse`, which makes it's even harder to find out which value was corrupted.


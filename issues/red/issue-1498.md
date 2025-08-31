
#1498: drop-down face does not allow value to be supplied by user
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
<https://github.com/red/red/issues/1498>

When you type into the field of the drop-down face, the following error occurs: 

```
*** Script error: new has no value
*** Where: series?
*** Stack: view either do-events do-event-loop ctx165~awake set do-actor if set do-safe if print =
type? do act on-change* if unless if any series?
*** Script error: old has no value
*** Where: series?
*** Stack: view either do-events do-event-loop ctx165~awake set do-actor if set do-safe if print =
type? do act on-change* if if any series?
```

The first script error occurs on the first letter typed in, and on each further letter the second script error occurs.



Comments:
--------------------------------------------------------------------------------

On 2015-12-09T13:34:59Z, dockimbel, commented:
<https://github.com/red/red/issues/1498#issuecomment-163234295>

    I cannot reproduce that in view-test.red script on Win7 platform.

--------------------------------------------------------------------------------

On 2015-12-09T15:15:13Z, meijeru, commented:
<https://github.com/red/red/issues/1498#issuecomment-163286155>

    It occurs with the following demo script:
    
    ```
    view [
        drop-down "Black" data ["Red" "Green" "Blue"] [
            d2/color: attempt [get to word! face/text]
        ]
        d2: base 20x20 black
        button "Exit" [quit]
    ]
    ```
    
    and it disappears when I comment out the line `d2/color:  attempt ...`
    
    It also disappears when I substitute a simple color value for `attempt ...`, so it must have something to do with the `get`

--------------------------------------------------------------------------------

On 2015-12-09T17:00:07Z, meijeru, commented:
<https://github.com/red/red/issues/1498#issuecomment-163324460>

    I discovered a way to avoid the errors: 
    
    ```
    set/any 'c get to word! face/text
    if value? 'c [d2/color: c]
    ```
    
    But there remains a problem with `get` see #1499

--------------------------------------------------------------------------------

On 2015-12-09T17:29:56Z, meijeru, commented:
<https://github.com/red/red/issues/1498#issuecomment-163332925>

    This problem has nothing to do with drop-down, therefore I close it

--------------------------------------------------------------------------------

On 2015-12-10T04:50:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1498#issuecomment-163487160>

    Thank you.


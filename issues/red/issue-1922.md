
#1922: WISH: Make SET-WORD!s in GUI actors local
================================================================================
Issue is closed, was reported by rebolek and has 12 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/1922>

Consider this code:

```
red>> warning
*** Script error: warning has no value
*** Where: do
red>> view [image 100x100 draw [line 0x0 100x100] on-over [probe warning: "I will leak"]]
"I will leak"
"I will leak"
red>> warning
== "I will leak"
```

`set-word!`s defined in actors are global. I would prefer they were local, because this can lead to unpredictable problems.



Comments:
--------------------------------------------------------------------------------

On 2016-05-23T07:50:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1922#issuecomment-220910101>

    If we make this change, then it won't be possible to access anymore a set-word from an external context inside the actor's body block...

--------------------------------------------------------------------------------

On 2016-05-23T08:23:26Z, rebolek, commented:
<https://github.com/red/red/issues/1922#issuecomment-220916596>

    I have to check how it’s done in R3GUI, where you can have local words in actors.

--------------------------------------------------------------------------------

On 2016-05-23T09:47:18Z, dockimbel, commented:
<https://github.com/red/red/issues/1922#issuecomment-220935354>

    Now, set-words inside actors bodies defined in VID will be captured as local by default. In order to modify external words, you need to provide an additional block of external words, just after the body block. Example:
    
    ```
    a: 100
    view [button "+" [probe a: a + 1][a]]
    ```

--------------------------------------------------------------------------------

On 2016-05-23T09:48:28Z, rebolek, commented:
<https://github.com/red/red/issues/1922#issuecomment-220935614>

    Thanks, I guess this is good solution.

--------------------------------------------------------------------------------

On 2016-05-23T09:49:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1922#issuecomment-220935922>

    I am not sure it will make things easier for beginners...anyway, we'll see.

--------------------------------------------------------------------------------

On 2016-06-21T07:41:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1922#issuecomment-227364252>

    This change has been reverte, as having local-by-default for VID handlers caused more troubles than gains. Alternative ways to make words locals exist.


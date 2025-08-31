
#3652: wait allows none as argument, but this always errors out
================================================================================
Issue is closed, was reported by meijeru and has 16 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/3652>

**Describe the bug**
The argument of `wait` may be `none`. It is not clear why. In any case, it always gives an error when used.

**To Reproduce**
>> wait none
*** Script Error: invalid argument: none
*** Where: wait

**Expected behavior**
Not documented (at least I have not found it).

**Platform version(please complete the following information):**
```
Presumably all
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-12T10:58:23Z, meijeru, commented:
<https://github.com/red/red/issues/3652#issuecomment-446547091>

    I have seen the commit, but what is the rationale? Could that be explained somewhere?!?

--------------------------------------------------------------------------------

On 2018-12-12T11:08:22Z, bitbegin, commented:
<https://github.com/red/red/issues/3652#issuecomment-446549883>

    In Rebol, `wait none` can also run

--------------------------------------------------------------------------------

On 2018-12-12T13:46:59Z, meijeru, commented:
<https://github.com/red/red/issues/3652#issuecomment-446593032>

    Fine, but what does it DO?

--------------------------------------------------------------------------------

On 2018-12-12T17:10:49Z, 9214, commented:
<https://github.com/red/red/issues/3652#issuecomment-446666363>

    Both in R2 and R3 `wait none` results in a breakable infinite loop.

--------------------------------------------------------------------------------

On 2018-12-12T19:46:06Z, greggirwin, commented:
<https://github.com/red/red/issues/3652#issuecomment-446719200>

    We need a design note for the intended purpose. For ports, you could have a port that failed to open, and is `none`. In a block of wait targets, having a single none should be a no-op. But `block!` is also not yet supported. `None` behavior isn't doc'd for Rebol, and even the `dispatch` func doesn't provide clues as I hoped it might.
    ```
    dispatch: func [
        {Wait for a block of ports. As events happen, dispatch port handler blocks.}
        port-block [block!] {Block of port handler pairs (port can be timeout too).}
        /local ports awake timeblk result
    ][
        ports: copy []
        foreach [port job] port-block: reduce port-block [
            if any [number? port time? port] [if none? timeblk [timeblk: :job]]
            append ports port
        ]
        forever [
            either awake: wait/all ports [
                if foreach item awake [
                    set/any 'result do select port-block item item
                    if all [value? 'result 'break = :result] [break/return true]
                ] [break]
            ] [do :timeblk]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2018-12-12T19:47:44Z, greggirwin, commented:
<https://github.com/red/red/issues/3652#issuecomment-446719670>

    I commented on @bitbegin's PR, so @qtxie or @dockimbel can weigh in.

--------------------------------------------------------------------------------

On 2018-12-13T11:54:46Z, dockimbel, commented:
<https://github.com/red/red/issues/3652#issuecomment-446942556>

    `wait` in Red is just a partial implementation until we get to full I/O.

--------------------------------------------------------------------------------

On 2018-12-21T12:37:43Z, dockimbel, commented:
<https://github.com/red/red/issues/3652#issuecomment-449378162>

    The `wait` spec block has just been copied from R2 in order to provide a partial implementation. This is a WIP, so I will close this ticket and the related PR as they are irrevelant right now.


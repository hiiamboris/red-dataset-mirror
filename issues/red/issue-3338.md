
#3338: unset crash console
================================================================================
Issue is closed, was reported by planetsizecpu and has 10 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3338>

### Expected behavior
If a word can't be unset issue an error

### Actual behavior
hang for a moment and crash console

### Steps to reproduce the problem
unset word [block]

### Red and platform version
Red 0.6.3 for Windows built 16-Apr-2018/11:21:12+02:00 commit #7c6d67f

```
>> about
Red 0.6.3 for Windows built 16-Apr-2018/11:21:12+02:00 commit #7c6d67f
a: [1]
unset a
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-17T06:46:02Z, meijeru, commented:
<https://github.com/red/red/issues/3338#issuecomment-381866897>

    It will also happen with `unset [1]`.

--------------------------------------------------------------------------------

On 2018-04-17T06:48:24Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3338#issuecomment-381867565>

    Instead  `unset 'a ` works properly, as usual.

--------------------------------------------------------------------------------

On 2018-04-17T07:47:23Z, meijeru, commented:
<https://github.com/red/red/issues/3338#issuecomment-381883931>

    Yes, that is because in `unset a`, there is an evaluation of `a`! The moral is: probably anything other than a `word!`  value leads to a crash.

--------------------------------------------------------------------------------

On 2018-04-17T08:46:10Z, 9214, commented:
<https://github.com/red/red/issues/3338#issuecomment-381904071>

    I can reproduce this with `block!` argument containing at least one non-`all-word!` value.
    ```Red
    >> unset [a 1]
    
    *** Runtime Error 1: access violation
    *** at: 0807583Ah
    ```

--------------------------------------------------------------------------------

On 2018-04-17T08:49:12Z, meijeru, commented:
<https://github.com/red/red/issues/3338#issuecomment-381905133>

    Conclusion: anything other than a word or block of words leads to a crash.



#1103: ?? function is not well handling undefined values
================================================================================
Issue is closed, was reported by Oldes and has 8 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1103>

```
red>> ?? foo
foo: *** Script error: probe does not allow unset for its value argument
*** Where: probe
```

I will post a fix soon.



Comments:
--------------------------------------------------------------------------------

On 2015-04-21T14:54:23Z, Oldes, commented:
<https://github.com/red/red/issues/1103#issuecomment-94829390>

    Now the result will be:
    
    ```
    red>> ?? foo
    foo: undefined
    ```

--------------------------------------------------------------------------------

On 2015-04-21T14:56:23Z, Oldes, commented:
<https://github.com/red/red/issues/1103#issuecomment-94830229>

    The output from ?? function is not useful much as it does not handle new-lines of the original, but anyway, with this little change it does not throw error where it's unnecessary.

--------------------------------------------------------------------------------

On 2015-04-21T15:00:01Z, Oldes, commented:
<https://github.com/red/red/issues/1103#issuecomment-94831114>

    But when I think about it, maybe it would be better to fix `probe` to return "unset!" if `unset!` is in its input. 

--------------------------------------------------------------------------------

On 2015-04-21T15:10:46Z, dockimbel, commented:
<https://github.com/red/red/issues/1103#issuecomment-94833973>

    About `unset!` support for PROBE, it would slowdown PROBE which is heavily used for debugging, so I think that the performance hit overweights the very rare cases where you would like it to support `unset!` values.
    
    About your proposition, what happens if your word's value is the string "undefined"? :-) Maybe it would be better to display simply "unset!", so that it matches the result of MOLD on an unset value.


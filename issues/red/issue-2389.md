
#2389: `to-error` doesn't work at all
================================================================================
Issue is closed, was reported by maximvl and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2389>

`to-error` raises exception that `to` cannot accept `error!` as value:
```
red>> to-error 5
*** Script Error: to does not allow error! for its type argument
*** Where: to
red>> source to-error
to-error: func ["Convert to error! value" value][to error! :value]
red>> 
```
I suggest either to allow `error!` argument to `to` or remove `to-error` shortcut.


Comments:
--------------------------------------------------------------------------------

On 2017-01-01T09:57:19Z, meijeru, commented:
<https://github.com/red/red/issues/2389#issuecomment-269897519>

    Please note: (1) `to` is not **yet** defined for `error!` values, but will eventually be (2) all `to-` shortcuts are generated automatically in `functions.red` so it would be bothersome to exclude it just for the time that `to error!` is not implemented.

--------------------------------------------------------------------------------

On 2017-02-14T15:47:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2389#issuecomment-279744922>

    There is no conversion rule for `to error!` in the conversion matrix. So it should be just excluded from the `to-<type>` building macro.

--------------------------------------------------------------------------------

On 2017-02-14T16:05:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2389#issuecomment-279750747>

    Now:
    ```
    red>> to-error
    *** Script Error: to-error has no value
    ```


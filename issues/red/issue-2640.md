
#2640: make does not allow an error value as first argument
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2640>

In expressions of the form `make <type> <spec>`, `<type>` may evaluate to a type (`datatype!` value) or to a value ("prototype") of the desired type. In most cases, the protype serves only to indicate the type, but this is not so (and for good reasons) for objects, where the prototype is _extended_ by the spec. But in the case of `make error!` an error value is not even allowed as first argument!


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T12:00:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2640#issuecomment-318634037>

    Works fine here:
    ```
    >> e: try [1 / 0] none
    == none
    >> type? e
    == error!
    >> make e [type: 'script id: 'invalid-arg arg1: 0]
    *** Script Error: invalid argument: 0
    *** Where: ??? 
    ```
    The `error/make` handler ignores the `proto` argument.


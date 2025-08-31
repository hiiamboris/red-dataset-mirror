
#1157: Cannot construct argument to make
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1157>

I tried to make a vector with a size dependent on the size of another variable, as follows:

```
make vector! reduce [integer! 8 length? line []]
```

This gave the following error:

```
*** Script error: datatype type is not allowed here
*** Where: make
```

Apparently, `make` does not evaluate its argument(s). Curiously, R3 DOES evaluate the second argument but gives an error anyhow.

Post-script: it is a general thing with `make`, e.g. `sz: 10 make string! sz` does not work either.



Comments:
--------------------------------------------------------------------------------

On 2015-05-28T10:34:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1157#issuecomment-106266101>

    `make vector!` expects a word! value, not a datatype! value (resulting from reducing `integer!` word), hence the legitimate error message. If you use a lit-word! for `integer!`, it will work as you expect:
    
    ```
    red>> line: [1 2 3]
    == [1 2 3]
    red>> make vector! reduce ['integer! 8 length? line []]
    == make vector! [integer! 8 [0 0 0]]
    ```

--------------------------------------------------------------------------------

On 2015-05-28T10:34:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1157#issuecomment-106266311>

    The `make string!` error is already referenced in another ticket.

--------------------------------------------------------------------------------

On 2015-05-29T07:47:04Z, meijeru, commented:
<https://github.com/red/red/issues/1157#issuecomment-106731112>

    I find the design decision to have the first argument in the block as a _word_ rather than a _datatype_ somewhat strange. 

--------------------------------------------------------------------------------

On 2015-05-29T08:32:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1157#issuecomment-106744354>

    If it was not a _word_, you would have to `reduce` the block systematically which would not be practical. This is also how types are specified in specification blocks in functions, as words instead of datatypes.

--------------------------------------------------------------------------------

On 2015-05-29T16:58:51Z, meijeru, commented:
<https://github.com/red/red/issues/1157#issuecomment-106870804>

    OK got you.


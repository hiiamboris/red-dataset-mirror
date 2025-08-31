
#2631: Inconsistency in map!: none is allowed as value upon making
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
<https://github.com/red/red/issues/2631>

```
>> m: #(a: none)
== #(
    a: none
)
>> m
== #(
    a: none
)
>> m/a
== none
>> put m 'a none
== none
>> m
== #()
```
I would think that `#(a: none)` should yield `#()` straight away!


Comments:
--------------------------------------------------------------------------------

On 2017-04-27T09:47:06Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2631#issuecomment-297667230>

    @meijeru It is understandable as using the literal syntax you have set a to a word! value (none) rather than a none! value.
    ```text
    red>> m: #(a: none)
    == #(
        a: none
    )
    red>> type? m/a
    == word!
    red>> m: #(a: #[none])
    == #(
    )
    ```
     

--------------------------------------------------------------------------------

On 2017-04-27T09:49:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2631#issuecomment-297667882>

    This is consistent with the behaviour demonstrated by make:
    ```text
    red>> m: make map! [a: none]
    == #(
        a: none
    )
    red>> m: make map! compose [a: (none)]
    == #(
    )
    ```

--------------------------------------------------------------------------------

On 2017-04-27T09:52:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2631#issuecomment-297668538>

    This behaviour is consistent with that of ```block!```  but differs from the of ```object!``` where the spec block is evaluated.
    
    ```text
    red>> b: [a: none]
    == [a: none]
    red>> type? second b
    == word!
    red>> o: make object! [a: none]
    == make object! [
        a: none
    ]
    red>> type? o/a
    == none!
    ```

--------------------------------------------------------------------------------

On 2017-04-27T09:53:40Z, meijeru, commented:
<https://github.com/red/red/issues/2631#issuecomment-297668750>

    I stand corrected and will close. It should be taken into account for documentation purposes, though.

--------------------------------------------------------------------------------

On 2017-04-27T09:55:18Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2631#issuecomment-297669095>

    @meijeru Yes, it should definitely be clearly documented. (I have been caught out by this many times.) 


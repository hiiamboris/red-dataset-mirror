
#3007: first of a get-path! value gives a word! instead of a get-word!
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.review]
<https://github.com/red/red/issues/3007>

This came up in the red/welcome chat:
```
>> type? quote :read/lines
== get-path!
>> type? first quote :read/lines
== word!
```
Why isn't the type `get-word!`? As it is, one has to resort to elaborate programming to extract the `get-word!` value from the `get-path!` value...


Comments:
--------------------------------------------------------------------------------

On 2017-09-12T14:35:28Z, dockimbel, commented:
<https://github.com/red/red/issues/3007#issuecomment-328872430>

    The "get" part of `get-path!` is a property of the whole path, not of one of its elements. `:read/lines` is a `get-path!` series made out of two `word!` values.
    
    > [...] extract the get-word! value from the get-path! value...
    
    There is no such thing.

--------------------------------------------------------------------------------

On 2017-09-12T14:39:41Z, Oldes, commented:
<https://github.com/red/red/issues/3007#issuecomment-328873724>

    ```
    >> first quote :read/lines
    == read
    >> second quote :read/lines
    == lines
    ```


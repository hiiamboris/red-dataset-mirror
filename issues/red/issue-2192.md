
#2192: CRASH: Directly DOing a native or action you GET
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2192>

Tested in GUI console.

```
>> word: "AbcD"
== "AbcD"
>> do get random/only [ lowercase uppercase ] word
<<interpreter console vanishes>>
```

`do get 'sign? 1`
`do get 'add 1 2`

Seems fine if you use an intermediate word to hold the function value.



Comments:
--------------------------------------------------------------------------------

On 2016-08-31T16:17:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2192#issuecomment-243817337>

    If your provide a proper block to `do`, including the required argument(s), it will work fine:
    
    ```
    do reduce [get random/only [ lowercase uppercase ] word]
    == "abcd"
    ```

--------------------------------------------------------------------------------

On 2017-02-19T12:04:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2192#issuecomment-280914690>

    Now the interpreter will not support variable-arity DO anymore (unlike R2/R3).


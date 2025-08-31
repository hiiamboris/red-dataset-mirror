
#3095: SPLIT does not mimic R2 behaviour with STRING! delimiter
================================================================================
Issue is closed, was reported by rebolek and has 8 comment(s).
<https://github.com/red/red/issues/3095>

### Expected behavior

This is R2 version of `parse`:

```
>> line: "a,s.d#f;g"
== "a,s.d#f;g"
>> parse line ",.#;"
== ["a" "s" "d" "f" "g"]
```

### Actual behavior

However, Red's `split` can’t reproduce the behaviour:

```
>> line: "a,s.d#f;g"
== "a,s.d#f;g"
>> split line ",.#;"
== ["a,s.d#f;g"]
```

### Steps to reproduce the problem

See above 👆.

### Red version and build date, operating system with version.

latest version on macOS


Comments:
--------------------------------------------------------------------------------

On 2017-11-02T09:38:03Z, xqlab, commented:
<https://github.com/red/red/issues/3095#issuecomment-341366458>

    It can
    ```
    >> line: "a,s.d#f;g"
    == "a,s.d#f;g"
    >> split line charset ",.#;"
    == ["a" "s" "d" "f" "g"]
    >>
    ```

--------------------------------------------------------------------------------

On 2017-11-03T07:16:38Z, rebolek, commented:
<https://github.com/red/red/issues/3095#issuecomment-341635042>

    Right, it can, but the question is, if it's bug or feature. I can live with both I guess 😃 

--------------------------------------------------------------------------------

On 2017-11-03T07:42:30Z, xqlab, commented:
<https://github.com/red/red/issues/3095#issuecomment-341638124>

    feature by design

--------------------------------------------------------------------------------

On 2017-11-06T05:03:15Z, dockimbel, commented:
<https://github.com/red/red/issues/3095#issuecomment-342047419>

    It's by design.
    
    Red's `split` is not meant to be limited to what R2's splitting with Parse could accomplish. Splitting with a sequence of characters instead of just a set of characters is an example of such extended feature. For splitting with a set of characters (like R2's parse), you have to provide a `bitset!` as shown above.


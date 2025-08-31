
#8: WISH: KEEP ONLY support in PARSE
================================================================================
Issue is open, was reported by rebolek and has 8 comment(s).
[Wish]
<https://github.com/red/REP/issues/8>

See this code:

```
>> parse "ab" [collect [set v1 "a" set v2 "b" keep (reduce [v1 v2])]]
== [[#"a" #"b"]]
```

This is actually `keep/only` equivalent, not `keep`.

Expected behaviour:
```
>> parse "ab" [collect [set v1 "a" set v2 "b" keep only (reduce [v1 v2])]]
== [[#"a" #"b"]]
>> parse "ab" [collect [set v1 "a" set v2 "b" keep (reduce [v1 v2])]]
== [#"a" #"b"]
```

See https://github.com/red/red/issues/2899 for reference.


Comments:
--------------------------------------------------------------------------------

On 2019-08-31T12:18:19Z, 9214, commented:
<https://github.com/red/REP/issues/8#issuecomment-526826015>

    With `any-string!` and `binary!` parsing, I think `keep only` should always return series with a respective datatype.
    
    Currently, `keep` may return either single element (`char!` in `any-string!`, `integer!` in `binary!`) or `any-string!`, depending on length of a match:
    ```red
    >> parse "ab" [collect [keep 1 skip]]
    == [#"a"]
    >> parse "ab" [collect [keep 2 skip]]
    == ["ab"]
    
    >> parse #{ABCD} [collect [keep 1 skip]]
    == [171]
    >> parse #{ABCD} [collect [keep 2 skip]]
    == [#{ABCD}]
    ```
    
    Or perhaps the other way around - `keep` always keeps series (even if there's only single element), while `keep pick` keeps element in series one-by-one.
    ```red
    >> parse "abcd" [collect some [keep 2 skip]] 
    == ["ab" "cd"]
    >> parse "abcd" [collect some [keep pick 2 skip]] 
    == [#"a" #"b" #"c" #"d"]
    ```

--------------------------------------------------------------------------------

On 2019-09-17T14:34:41Z, dockimbel, commented:
<https://github.com/red/REP/issues/8#issuecomment-532249178>

    It is currently possible to use `copy` to extract a series instead of a single element:
    ```
    >> parse "ab" [collect [keep copy tmp 2 skip]]
    == ["ab"]
    >> parse #{ABCD} [collect [keep copy tmp 2 skip]]
    == [#{ABCD}]
    ```

--------------------------------------------------------------------------------

On 2019-09-17T14:35:51Z, 9214, commented:
<https://github.com/red/REP/issues/8#issuecomment-532249658>

    @dockimbel yes, but at the cost of using dummy word to store a copy.

--------------------------------------------------------------------------------

On 2019-09-17T14:43:40Z, dockimbel, commented:
<https://github.com/red/REP/issues/8#issuecomment-532253028>

    That word could be made optional when `copy` is preceded by `keep`. Anyway, the extracted value is passed through the stack.


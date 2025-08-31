
#3003: sort/compare can't sort string as expected
================================================================================
Issue is closed, was reported by webcpu and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3003>

Environment:
Red: 0.6.3
OS: macOS 10.12.5

Test Procedure:
```
>> xs: "dcba"
== "dcba"
>> sort/compare xs func [x y][x < y]
== "abcd"
>> sort/compare xs func [x y][x > y]
== "abcd
```

Expected Result:
```
>> sort/compare xs func [x y][x > y]
== "dcba"
```

Actual Result:
```
>> sort/compare xs func [x y][x > y]
== "abcd
```



Comments:
--------------------------------------------------------------------------------

On 2017-08-29T00:39:17Z, geekyi, commented:
<https://github.com/red/red/issues/3003#issuecomment-325521067>

    This is simply not implemented yet: https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L1891
    The spec is there, but there's no code to do it.
    Works as you'd expect in Rebol 2.
    Also it looks like the mechanism for it to work is already there:
    ```red
    >> xs: random [d c b a]
    == [b d a c]
    >> sort/compare xs func [x y][x < y]
    == [a b c d]
    >> sort/compare xs func [x y][x > y]
    == [d c b a]
    ```
    
    ## workaround:
    ```red
    >> ys: [] xs: random "dcba"
    == "bcda"
    >> extract/into xs 1 ys
    == [#"b" #"c" #"d" #"a"]
    >> rejoin sort/compare ys func [x y][x > y]
    == "dcba"
    ```


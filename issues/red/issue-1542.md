
#1542: incorrect conversion from odd whole float! to integer!
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1542>

`to` converts `float!`s with odd integer values to `integer!`s incorrectly.

When the `float!`s value is a positive odd integer greater than `1`, it is decremented by `1`:

```
red>> f: to float! 7
== 7.0
red>> to integer! f
== 6
```

When the `float!`s value is a negative odd integer less than `-1`, it is incremented by `1`:

```
red>> f: to float! -7
== -7.0
red>> to integer! f
== -6
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-03T06:11:27Z, WiseGenius, commented:
<https://github.com/red/red/issues/1542#issuecomment-179030785>

    > Note: This fix is tricky. Maybe not working in some corner cases.
    
    Here's one important such case:
    
    ```
    red>> f: to float! 0
    == 0.0
    red>> to integer! f
    == -1
    ```
    
    Also:
    - Odd numbers from `-2147483647` to `-536870913` are incremented by `1`.
    - Odd numbers from `536870913` to `2147483647` are decremented by `1`.


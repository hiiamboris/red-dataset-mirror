
#3703: Inconsistency of Replace function with tag! value
================================================================================
Issue is closed, was reported by endo64 and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/3703>

**Describe the bug**
`replace` with `tag!` value behaves different than `string!` values

**To reproduce**

```
>> replace "aaa <tag> ccc" <tag> "bbb"
== "aaa bbb ccc" ; on R2 and R3
== "aaa <bbb> ccc" ; on Red
```

**Expected behavior**
Same result as R2 & R3

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Jan-2019/17:22:21+03:00 commit #8bf2cbe
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-04T04:25:12Z, dockimbel, commented:
<https://github.com/red/red/issues/3703#issuecomment-451350899>

    I think we might want to change `form` to include the angle brackets, as it does in Rebol.

--------------------------------------------------------------------------------

On 2019-01-04T15:59:34Z, endo64, commented:
<https://github.com/red/red/issues/3703#issuecomment-451484859>

    @dockimbel it is already:
    
    ```
    >> form <tag>
    == "<tag>"
    ```
    
    Or did I misunderstood your comment?

--------------------------------------------------------------------------------

On 2021-08-03T18:47:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/3703#issuecomment-892080414>

    Looks like `replace` went ahead of `find` here:
    ```
    >> find "ab<b>b" <b>
    == "b<b>b"
    >> replace "ab<b>b" <b> 1
    == "ab1b"
    ```
    Should we open another ticket for `find`?
    
    P.S. just checked - in R2 they are consistent.


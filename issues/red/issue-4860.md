
#4860: FIND for tag! seems to be off by one
================================================================================
Issue is closed, was reported by dsunanda and has 10 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4860>

**Describe the bug**
A find for a tag in a string returns one position too far.

**To reproduce**
```
find "aaa <bbb> ccc" <bbb>
== "bbb> ccc"

```

**Expected behavior**
```
find "aaa <bbb> ccc" <bbb>
== "<bbb> ccc"
```

**Platform version**

```
Red 0.6.4 for Windows built 19-Mar-2021/7:34:02  commit #7316b75
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-22T18:17:44Z, greggirwin, commented:
<https://github.com/red/red/issues/4860#issuecomment-804286941>

    Manually forming the value is a workaround until this is fixed.
    ```
    >> find "aaa <bbb> ccc" form <bbb>
    == "<bbb> ccc"
    ```

--------------------------------------------------------------------------------

On 2021-03-22T18:23:04Z, greggirwin, commented:
<https://github.com/red/red/issues/4860#issuecomment-804290425>

    Tags are a special case. `File!` matches R2's behavior. However we may want `ref!` to `form` with its sigil. 
    ```
    >> find "aaa @bbb ccc" @bbb
    == "bbb ccc"
    >> form @bbb
    == "bbb"
    >> find "aaa @bbb ccc" form @bbb
    == "bbb ccc"
    >> find "aaa @bbb ccc" mold @bbb
    == "@bbb ccc"
    
    >> find "aaa %bbb ccc"  %bbb
    == "bbb ccc"
    >> find "aaa %bbb ccc" form %bbb
    == "bbb ccc"
    >> find "aaa %bbb ccc" mold %bbb
    == "%bbb ccc"
    ```

--------------------------------------------------------------------------------

On 2021-03-22T19:04:06Z, Oldes, commented:
<https://github.com/red/red/issues/4860#issuecomment-804318058>

    @dsunanda it's not off by one.. it just does string search... check this one:
    ```red
    >> find "bbb aaa <bbb> ccc" <bbb>
    == "bbb aaa <bbb> ccc"
    ```

--------------------------------------------------------------------------------

On 2021-03-22T19:09:00Z, Oldes, commented:
<https://github.com/red/red/issues/4860#issuecomment-804323123>

    Btw.. it seems to be known issue also in R3 -> https://www.curecode.org/rebol3/ticket.rsp?id=1160

--------------------------------------------------------------------------------

On 2021-08-20T11:26:59Z, dockimbel, commented:
<https://github.com/red/red/issues/4860#issuecomment-902626472>

    Fixed by commits for #4944.


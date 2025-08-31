
#4999: `local` doesn't get reported in the stack trace
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.review]
<https://github.com/red/red/issues/4999>

**Describe the bug**
```
>> f: does [oabfoaw]

>> g: func [/x] [x: :f  x]
== func [/x][x: :f x]
>> g
*** Script Error: oabfoaw has no value
*** Where: x
*** Stack: g x             ;) notice 'x'

>> g: func [/local] [local: :f  local]
== func [/local][local: :f local]
>> g
*** Script Error: oabfoaw has no value
*** Where: local
*** Stack: g              ;) notice no 'local'
```

**Expected behavior**
```
*** Stack: g local
```

**Platform version**
```
Red 0.6.4 for Windows built 6-Nov-2021/19:36:18+03:00  commit #30e5312
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-09T16:53:43Z, dockimbel, commented:
<https://github.com/red/red/issues/4999#issuecomment-1033977167>

    `x` is not reported in the stack trace in the current commit:
    
    ```
    >> f: does [oabfoaw]
    == func [][oabfoaw]
    >>  g: func [/x] [x: :f  x]
    == func [/x][x: :f x]
    >> g
    *** Script Error: oabfoaw has no value
    *** Where: x
    *** Near : oabfoaw
    *** Stack: g  
    
    >>  g: func [/local] [local: :f  local]
    == func [/local][local: :f local]
    >> g
    *** Script Error: oabfoaw has no value
    *** Where: local
    *** Near : oabfoaw
    *** Stack: g  
    ```

--------------------------------------------------------------------------------

On 2022-02-09T17:07:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4999#issuecomment-1033991574>

    But this is the opposite of what I expected :)
    Now not only `local` but all local words disappear from the stack, making it harder to figure out what's happening, esp. on recursive calls.
    ```
    >> f: does [oabfoaw]
    >> g: does [f]
    >> h: func [/x] [x: :g x]
    >> h
    *** Script Error: oabfoaw has no value
    *** Where: f
    *** Near : oabfoaw
    *** Stack: h f     ;) where is x (aka g)?
    ```


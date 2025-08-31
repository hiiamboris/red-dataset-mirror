
#312: Local variable with same name as function gives strange error
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/312>

Further to #302, see this error:

```
f: func[/local f][]
-= Red Compiler =-
Compiling red/tests/mytest.red ...
...compilation time:     344 ms
Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/stack/mark
*** expected: [struct! [
        header [integer!]
        ctx [red/red-context!]
        symbol [integer!]
        index [integer!]
    ]], found: [struct! [
        header [integer!]
        data1 [integer!]
        data2 [integer!]
        data3 [integer!]
    ]]
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-22T12:57:21Z, dockimbel, commented:
<https://github.com/red/red/issues/312#issuecomment-10633627>

    Internal variable names clashing at Red/System level (the first struct is a red-word!, the second is a red-value!).


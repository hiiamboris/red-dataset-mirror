
#4938: Unable to compile paths inside inner functions in devmode
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/4938>

**Describe the bug**
```
Red []

f: function [] [
	b: []
	; b: ""
	g: does [b/1]
]

probe f
```
Compiler output `-c`:
```
Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/eval-int-path*
*** expected: [struct! [
        header [integer!]
        data1 [integer!]
        data2 [integer!]
        data3 [integer!]
    ]], found: [struct! [
        header [integer!]
        ctx [pointer! [integer!]]
        symbol [integer!]
        index [integer!]
    ]]
*** in file: %.../1.red
*** in function: exec/f_g
*** at line: 363
*** near: [
    stack/unwind
    stack/unwind-last
    ctx/values: saved
]
```

Some exports bug? Doesn't happen on `-r`.

**Expected behavior**

Produces exe that prints `none`

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-28T17:07:23Z, dockimbel, commented:
<https://github.com/red/red/issues/4938#issuecomment-888474869>

    Defining functions in functions in not fully supported by the compiler, especially when local variables are shared between nested functions.
    
    > Doesn't happen on -r.
    
    It does if you use a unique name for the `b` variable like `bzz` (the compiler has some `b` words used in the runtime, so the compiler reserves slots in global context for those).



#2207: Compiler error when redefining function
================================================================================
Issue is open, was reported by rebolek and has 6 comment(s).
[type.review] [type.compiler]
<https://github.com/red/red/issues/2207>

It’s possible to redefine word to different or same type:

```
Red []

f: func [a][a]
f: to float! 7
```

```
Red []

f: to float! 7
f: func [b][b]
```

```
Red []

f: func [a][a]
f: func [b][b]
```

However, it’s not possible to change the type from `function!` and then back again:

```
Red []

f: func [a][a]
f: to float! 7
f: func [b][b]
```

results in:

```
*** Compilation Error: attempt to redefine existing function name: exec/f_f
*** in file: %/E/Code/red-bugs/test.red
*** at line: 1
*** near: [
    f_f: func [/local ctx saved ~b] [
[...etc...]
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-07T09:25:47Z, rebolek, commented:
<https://github.com/red/red/issues/2207#issuecomment-245225250>

    This is similar problem, although the error message is different:
    
    ```
    Red[]
    print*: :print
    print: :*print
    ```
    
    results in:
    
    ```
    Compiling E:\Code\red-bugs\test.red ...
    *** Red Compiler Internal Error: Script Error : Cannot use path on none! value
    *** Where: repend
    *** Near:  [entry/2]
    ```

--------------------------------------------------------------------------------

On 2018-12-07T17:54:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/2207#issuecomment-445312700>

    Figured I shouldn't open a new issue on this, as it didn't surprise me:
    ```
    Red []
    
    f: func [x][x]   ; defined with 1 arg
    g: does [f]
    f: does [1]      ; redefined with 0
    ```
    ```
    *** Compilation Error: missing argument
    *** in file: D:\devel\red\red-src\red\tests\source\units\1.red
    *** near: [f]
    ```
    The annoying thing is that sometimes tests in the suite use the same word (e.g. `foo`) and fail due to this limitation.
    
    Note: it still allows to forward-reference `f` from `g` if `f` wasn't defined up to that point.

--------------------------------------------------------------------------------

On 2020-03-21T19:20:21Z, 9214, commented:
<https://github.com/red/red/issues/2207#issuecomment-602090468>

    https://github.com/red/red/issues/2133


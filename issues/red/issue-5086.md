
#5086: [Compiler] Crash & stack CORRUPTION after `return` from `try`
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[status.deferred] [type.bug] [type.compiler]
<https://github.com/red/red/issues/5086>

**Describe the bug**

Variant 1:
```
Red []
f: does [error? try [return 42]]
s: [0 0]
?? s
change/only s: [] r: probe f
?? s
?? r
```
Interpreted:
```
s: [0 0]
42
s: [42]
r: 42
```
Compiled `-c -d` or `-r -d`:
```
s: [0 0]
42

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/datatypes/context.reds
*** at line: 300
***
***   stack: red/_context/set 04864F7Ch 04864F8Ch
***   stack: red/word/set
```

Variant 2:
```
Red []
f: does [error? try [return 42]]
change/only s: [] r: probe f
?? s
?? r
```
Interpreted:
```
42
s: [42]
r: 42
```
Compiled `-c -d` or `-r -d`:
```
42
*** Script Error: 42 word is not bound to a context
*** Where: f
*** Near : at-arg2
*** Stack: probe f
```


**Expected behavior**

As interpreted

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-25T18:35:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5086#issuecomment-1051097965>

    I can't find any good fix as the current stack management implementation has grown too messy, with not well-defined purpose/usage of internal stack frame flags.
    
    I would defer that issue until the Red stack management gets reimplemented, to which point this issue should become non-existent.

--------------------------------------------------------------------------------

On 2022-02-25T19:32:58Z, greggirwin, commented:
<https://github.com/red/red/issues/5086#issuecomment-1051136205>

    Added to https://github.com/red/red/wiki/%5BNOTES%5D-Compiler-Limitations. A good way to deal with issues like this may be to prioritize a basic static analysis tool.

--------------------------------------------------------------------------------

On 2022-02-25T19:34:24Z, greggirwin, commented:
<https://github.com/red/red/issues/5086#issuecomment-1051137122>

    In some cases, especially those where it's a compiler limitation and interpreted works fine, it may be possible to automatically wrap the code in `do`, as an option for the user.

--------------------------------------------------------------------------------

On 2022-02-25T19:35:04Z, greggirwin, commented:
<https://github.com/red/red/issues/5086#issuecomment-1051137556>

    Or note that encap mode needs to be used.

--------------------------------------------------------------------------------

On 2022-02-27T02:12:09Z, dockimbel, commented:
<https://github.com/red/red/issues/5086#issuecomment-1052956038>

    Just to be clear, this is not a compiler (vs interpreter) limitation strictly speaking, but an implementation problem. The future unified Red stack will solve that issue.


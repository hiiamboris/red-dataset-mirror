
#5411: Compiler can't swallow parens in `system/words`
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[type.review] [status.wontfix] [type.compiler]
<https://github.com/red/red/issues/5411>

**Describe the bug**

Trying to compile this:
```
Red []
//: :system/words/('//)
probe 3 // 2
```
Getting:
```
*** Red Compiler Internal Error: Script Error : Expected one of: word! - not: paren!
*** Where: system-words-path?
*** Near:  [path/1: to get-word! path/1]
```
(any word behaves the same)

**Expected behavior**

Compiled as interpreted code.

**Platform version**
```
Red 0.6.4 for Windows built 18-Oct-2023/1:48:48+03:00  commit #c9f4194
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-02T17:24:04Z, dockimbel, commented:
<https://github.com/red/red/issues/5411#issuecomment-1791187071>

    Even after patching the compiler to accept it, it still would not run correctly, as the compiler would not statically recognize `:system/words/('//)` as a function, so would not compile `3 // 2`  as infix function call. This is as far as the compiler can go. Anyway, I'm working on the compiler amputation, so such issue will vanish once it's all strictly encapped and interpreted.


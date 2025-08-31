
#4139: Different behavior of #include when compiled and interpreted
================================================================================
Issue is open, was reported by toomasv and has 6 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4139>

**Describe the bug**
If `#include` is used inside the context, contents of included file is not bound to the context, if interpreted. When compiled, it is bound. This results in different behaviour of pure Red script when compiled or interpreted.

**To reproduce**
```
>> save/header %example [print a] []
>> save/header %example-main [a: 1 context [a: 2 #include %example]()][]
```
Interpreted:
```
>> do %example-main
1
```
Compiled:
```
>red -c example-main
...
>example-main
2
```
**Expected behavior**
Including files from inside context behaves same way when compiled or interpreted.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Nov-2019/15:08:45+02:00 commit #0865314
```

**Additional thoughts**
Above example is similar to these interpreted behaviours:
```
;Like compiled:
>> a: 1 context [a: 2 print a]()
2
;Like interpreted:
>> a: 1 context [a: 2 do "print a"]()
1
```
Latter should rather be:
```
>> a: 1 context [a: 2 do bind load "print a" self]()
2
```

Another difference concerns interpreting file-paths as shown in #3921


Comments:
--------------------------------------------------------------------------------

On 2019-11-20T03:28:29Z, greggirwin, commented:
<https://github.com/red/red/issues/4139#issuecomment-555820619>

    Other `include` related tickets are: #4128, #3464, and #2484. 
    
    @qtxie @dockimbel, if we can't solve it in the interpreter, and if it's not by design. then we need to document the issue and how to work around it. In this case, the workaround is:
    
    - Don't put everything in a main context
    - Keep included files top level
    
    If so, that makes it pretty easy, and we can explain why it doesn't work. Then it's a matter of a small best-practice doc about how to structure things. 

--------------------------------------------------------------------------------

On 2019-11-22T12:26:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4139#issuecomment-557513501>

    https://github.com/red/red/issues/3550 relates as well

--------------------------------------------------------------------------------

On 2020-07-09T16:32:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4139#issuecomment-656228545>

    This happens because preprocessor, when interpreted, just replaces `#include` with `do` and calls it a day. But when compiled, it inserts the whole file contents in place of `#include`, which naturally gets bound after that.



#510: SET block! doesn't resolve words in compiler
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/510>

```
Red []

set [x] []
x
```

-= Red Compiler =- 
**\* Compilation Error: undefined word x 
**\* near: [x]

red>> set [x] []
== []
red>> x
== none

It doesn't seem to me that a SET block! needs to be executed by the interpreter, so the compiler should be able to resolve the words.




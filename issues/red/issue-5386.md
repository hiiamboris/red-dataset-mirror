
#5386: [Preprocessor] Does not allow /extern in function spec
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/5386>

**Describe the bug**

When it's known that some macro is used only within Red, `function` helps avoid the tedious task of manually collecting words into `func` locals. But it's not fully supported:
```

>> expand-directives [#macro ['x] function [s e] [x: 1]]
== []
>> preprocessor/macros      ;) note that `function` itself works
== [s: ['x] e: (s: change/part s do-safe [func [s e /local x][x: 1] s e] e) :s | s:...

>> expand-directives [#macro ['x] function [s e /extern x] [x: 1]]
*** Macro Error: invalid specification
*** Where: [['x] function [s e /extern x]]
(halted)
```

**To reproduce**

`expand-directives [#macro ['x] function [s e /extern x] [x: 1]]`

**Expected behavior**

Working /extern 

**Platform version**
```
Red 0.6.4 for Windows built 11-Sep-2023/10:40:41+03:00  commit #def4b65
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-06T15:55:40Z, dockimbel, commented:
<https://github.com/red/red/issues/5386#issuecomment-1750976060>

    We could add support for `/extern`, but it would work only if code is run from Red. So the compiler could not compile such macro spec. The preprocessor would need in such case, to detect such patterns and provide an alternative `function` implementation. I'm not sure it's worth investing time there, when that toolchain is about to be droppped, and the issue can be easily worked around by using `func` constructor instead.

--------------------------------------------------------------------------------

On 2023-10-06T16:05:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/5386#issuecomment-1751003409>

    My workaround was to use a [fully qualified path](https://codeberg.org/hiiamboris/red-common/src/commit/19efadd4fa046748a37fa4e7baa8f50715c76f27/include-once.red#L62) as I'm simply unable to manually keep all those words in sync with the code changes, and always getting leaks.

--------------------------------------------------------------------------------

On 2023-10-06T16:06:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/5386#issuecomment-1751006076>

    I guess I could have also defined another function with `#do` and then dispatched into it from the macro.


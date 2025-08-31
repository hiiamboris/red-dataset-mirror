
#1119: Error is not raised when trying to set a function/refinement to a value
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1119>

A script error is not raised when trying to set a function/refinement to a value:

Console

```
>> append/only: [a b c] [d e]
== [a b c [d e]]
>> append/only
** Script Error: append expected series argument of type: series port
** Near: append/only
>> append: [a b c]
== [a b c]
>> append
== [a b c]
```

Compiled Code

```
Red[]
append/only: [a b c] [d e]
append/only
```

Compiler Output

```
-=== Red Compiler 0.5.2 ===- 

Compiling /Users/peter/VMShare/Code/Red/test.red ...
*** Compilation Error: missing argument 
*** in file: %/Users/peter/VMShare/Code/Red/test.red
*** near: [append/only]
```

Note: The compiler used was the source compiler on the latest master under OS X. It displays the 0.5.2 version number. 



Comments:
--------------------------------------------------------------------------------

On 2015-04-27T09:44:05Z, dockimbel, commented:
<https://github.com/red/red/issues/1119#issuecomment-96585836>

    It now returns an error for both the compiler and interpreter cases (though, the compiler error does not provide useful location information).



#4570: compiler trips up on OP!
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.review] [type.compiler]
<https://github.com/red/red/issues/4570>

**Describe the bug**
Compiler thinks that `op!` call is a `function!` call and compiles an expression with missing left argument.

**To reproduce**
Compile the script below:
```red
Red [] quote + 0 0
```
The 2nd `0` is mandatory because the compiler insists that it's an argument to `+` "function call".

Result:
```red
*** Script Error: + does not allow word for its value1 argument
*** Where: +
*** Stack:
```

And that's the best-case scenario, because `+` is derived from `add` action that has a form of type-checking... unlike, say, `>>` derived from `shift-right` routine:

```red
Red [] quote >> 0 0
```

```red
*** Runtime Error 98: assertion failed
*** in file: .../red/runtime/datatypes/integer.reds
*** at line: 66
***
***   stack: red/integer/get 00000062h
***   stack: red/integer/get 02BD32D4h
```

**Expected behavior**
Successful compilation; word set to `op!` is properly escaped by `quote`.

**Platform version**
a1d1495, W10.




Comments:
--------------------------------------------------------------------------------

On 2020-10-27T16:46:51Z, dockimbel, commented:
<https://github.com/red/red/issues/4570#issuecomment-717376664>

    @9214 I let you write the regression test(s).


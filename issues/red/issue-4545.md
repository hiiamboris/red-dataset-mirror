
#4545: [R/S] mandatory type specification for declared subroutines
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
<https://github.com/red/red/issues/4545>

**Describe the bug**
Red/System supports literal arrays (see [section 4.8.6](https://static.red-lang.org/red-system-specs.html#section-4.8)) and subroutines (undocumented). Both constructs are syntactically ambiguous if declared inside a function.

Cf. Red/System documentation, [section 3.3](https://static.red-lang.org/red-system-specs.html#section-3.3):
> Function local variables require to be declared, but the type specification part can be skipped if the variable is properly initialized.

In the case of `var: [...]` with type specification ommitted, `var` is assumed to be a literal array even if it's a subroutine.

**To reproduce**
```red
Red/System []

foo: func [/local sub][sub: [sub]]
```
```red
Compiling to native code...
*** Compilation Error: unknown identifier in literal array: sub
*** in file: ...
*** in function: foo
*** at line: 3
*** near: [[sub]]
```

**Expected behavior**
Either syntactic ambiguity should be resolved or this edge-case in Red/System typing rules should be documented. I expect the same error message as with type specification:
```red
Compiling to native code...
*** Compilation Error: infinite recursion in subroutine: sub
*** in file: ...
*** in function: foo
*** at line: 3
*** near: [sub]
```

**Platform version**
bb32462428d9fa0bf7f10079b9e91791e5717d73



Comments:
--------------------------------------------------------------------------------

On 2020-08-10T14:30:24Z, 9214, commented:
<https://github.com/red/red/issues/4545#issuecomment-671390556>

    Closing as being addressed by https://github.com/red/red/commit/ab1a8ebddfac721b8687754944070f6afdeb23a1.


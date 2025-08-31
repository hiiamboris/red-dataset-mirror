
#4568: "undefined symbol" compiler error
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/4568>

**Describe the bug**
Current AOT compiler cannot process expressions that use words not explicitly defined beforehand (see [here](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#compiled-versus-interpreted-behaviors) for a summary); this limitation can be bypassed by either using Encap mode or `red-strict-check?` configuration flag, but even then the issue still persists, albeit in a slightly different form.

**To reproduce**
Compile the script below:
```red
Red [Config: [red-strict-check?: off]] :layout
```

```red
*** Compilation Error: undefined symbol: ~layout
*** in file: %utils/preprocessor.r
*** at line: 1
*** near: [~layout #user-code]
```

**Expected behavior**
Successful compilation.

**Platform version**
 4e9d770, W10.


Comments:
--------------------------------------------------------------------------------

On 2020-10-27T17:07:13Z, dockimbel, commented:
<https://github.com/red/red/issues/4568#issuecomment-717389684>

    @9214 I let you write the regression test(s) for this one.



#3590: parse-func-spec in %help.red should be local
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
<https://github.com/red/red/issues/3590>

**Describe the bug**
The definition of `parse-func-spec` (an auxiliary function for `help`) is visible in the global context.
**To Reproduce**
Call `source parse-func-spec` in the console
**Expected behavior**
The definition should not be visible.




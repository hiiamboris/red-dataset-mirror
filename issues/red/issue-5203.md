
#5203: `Help` can't process func specs with attributes before doc strings.
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
<https://github.com/red/red/issues/5203>

**Describe the bug**

`Help` can't process func specs with attributes before doc strings.

**To reproduce**

>> help layout
Func spec couldn't be parsed, may be malformed.
...

**Expected behavior**

`Help` should work correctly. Side note: we haven't yet had an official definition for the func spec dialect, so there's sometimes confusion and differences between `help` and `function!` implementation. One reason spec work is on the new 1.0 roadmap.

**Platform version**

All



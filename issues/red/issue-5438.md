
#5438: No Cat For Throw hits preprocessor
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/5438>

**Describe the bug**

When #include %file is used and there's a preprocessing error, it all crashes with this nasty error.

**To reproduce**

1. Make `1.red` file: `Red [] #include %2.red`
2. Make `2.red` file: `Red [] #do [1 / 0]`
3. Run `1.red` from the console. Results in:
```
*** Preprocessor Error in #do
*** Math Error: attempt to divide by zero
*** Where: ???
*** Near : 1 / 0
*** Stack: expand-directives also expand attempt expand do-code do-safe

*** Runtime Error 95: no CATCH for THROW
*** at: 004218EFh
```

**Expected behavior**

Error, but no crash.

**Platform version**
```
Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df
```



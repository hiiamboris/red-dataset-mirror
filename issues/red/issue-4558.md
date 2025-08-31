
#4558: FIND cannot find ANY-LIST!
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
<https://github.com/red/red/issues/4558>

**Describe the bug**
Title.

**To reproduce**
```red
foreach x y: reduce [[foo] quote (bar) make hash! [qux]][probe find y x]
```
Gives
```red
none
none
none
```

**Expected behavior**
```red
[[foo] (bar) make hash! [qux]]
[(bar) make hash! [qux]]
[make hash! [qux]]
```

**Platform version**
3a79cbf


Comments:
--------------------------------------------------------------------------------

On 2020-06-28T19:18:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4558#issuecomment-650809579>

    `find/only`
    I often forget it too ;)

--------------------------------------------------------------------------------

On 2020-06-28T19:20:55Z, 9214, commented:
<https://github.com/red/red/issues/4558#issuecomment-650809849>

    Protip: don't code on weekends...


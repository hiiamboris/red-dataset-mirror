
#5448: `clean-path` accepts a string but fails
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/5448>

**Describe the bug**
```
>> clean-path "."
*** Script Error: dir? does not allow string! for its file argument
*** Where: dir?
*** Near : clean-path "."
*** Stack: clean-path dir?  
```

**Expected behavior**

If it accepts a string it should `to-red-file` it.

**Platform version**
`Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df`


Comments:
--------------------------------------------------------------------------------

On 2023-12-18T16:10:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5448#issuecomment-1860925428>

    Related https://github.com/red/red/issues/5447



#3595: `return:` for func now chokes if it has a doc string (interpreter)
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/3595>

**Describe the bug**
```
>> fn: func [return: [integer!]][1]
== func [return: [integer!]][1]
>> fn: func [return: [integer!] "Test"][1]
*** Script Error: invalid function definition: return:
*** Where: func
*** Stack: fn  
```

**To Reproduce**
Include a doc string for a `return:` spec in a function.

This is used in the `arg-info` function in help, been there a very long time, and Red still builds regularly, so seems to be interpreter only.

**Expected behavior**
Should be a valid func decl.

**Platform version(please complete the following information):**
Last GUI console I have that worked with this syntax was 09-Jul-2018.

```
Red 0.6.3 for Windows built 16-Nov-2018/15:15:54-07:00 commit #8b3128e
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-20T05:46:19Z, 9214, commented:
<https://github.com/red/red/issues/3595#issuecomment-440149885>

    Was discussed here https://github.com/red/REP/issues/24 and regression itself started from here https://github.com/red/red/issues/3454


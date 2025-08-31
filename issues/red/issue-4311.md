
#4311: Error message on invalid argument in chained infix expression is off by one
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4311>

**Describe the bug**

When the unallowed operand is used in infix expression, `where` points to the operator leftmost to the actual culprit.

**To reproduce**

```red
>> 0 = 1 - 1
*** Script Error: = does not allow logic! for its value1 argument
*** Where: =
*** Stack:  
```

**Expected behavior**

```red
>> (0 = 1) - 1
*** Script Error: - does not allow logic! for its value1 argument
*** Where: -
*** Stack: 
```

**Platform version**

```
Red 0.6.4 for Windows built 27-Feb-2020/4:07:00+01:00 commit #bf15211
```



Comments:
--------------------------------------------------------------------------------

On 2020-02-28T19:08:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4311#issuecomment-592679556>

    Could be a part of a bigger picture, this: https://github.com/red/red/issues/4260 https://github.com/red/red/issues/3910


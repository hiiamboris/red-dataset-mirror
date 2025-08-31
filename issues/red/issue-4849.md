
#4849: Lexer: bad money value with sign and no digits
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4849>

**Describe the bug**

If a money value is incomplete, but with a leading sign, you get a value of (+/-)$4.00 rather than an error.

**To reproduce**

```
>> $
*** Syntax Error: (line 1) invalid money at $
*** Where: case
*** Stack: load 
>> -$
== -$4.00
>> +$
== $4.00
```

**Expected behavior**

Errors in all cases.

**Platform version**

Red 0.6.4 for Windows built 24-Feb-2021/17:27:54-07:00 commit #0645c80



Comments:
--------------------------------------------------------------------------------

On 2021-03-08T19:16:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4849#issuecomment-793005392>

    If you include a denomination it works correctly.
    ```
    >> -USD$
    *** Syntax Error: (line 1) invalid money at -USD$
    *** Where: case
    *** Stack: load 
    >> USD$
    *** Syntax Error: (line 1) invalid money at USD$
    *** Where: case
    *** Stack: load 
    >> +USD$
    *** Syntax Error: (line 1) invalid money at +USD$
    *** Where: case
    *** Stack: load 
    ```


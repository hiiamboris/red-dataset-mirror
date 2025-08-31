
#3717: [Red lexer] when parse "]", `system/lexer/transcode/one` should give an error!
================================================================================
Issue is closed, was reported by bitbegin and has 2 comment(s).
<https://github.com/red/red/issues/3717>

**Describe the bug**

```
>> pos: "]"
== "]"
>> out: []
== []
>> w: system/lexer/transcode/one pos clear out false
== "]"
>> w = pos
== true
>> 
>> out
== []
>> 
```

`w` place should get an error!


**Expected behavior**

```
>> pos: "]"
== "]"
>> out: []
== []
>> w: system/lexer/transcode/one pos clear out false
; here should have an error!
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 4-Jan-2019/2:08:48+08:00 commit #af59285
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-08T09:51:27Z, bitbegin, commented:
<https://github.com/red/red/issues/3717#issuecomment-452238404>

    another test case:
    
    ```
    >> load/next "]" 'a
    == []
    >> a
    == "]"
    >> 
    ```


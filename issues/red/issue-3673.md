
#3673: to-date <string> script error
================================================================================
Issue is closed, was reported by gregit and has 2 comment(s).
<https://github.com/red/red/issues/3673>

**Describe the bug**
error when converting date as a string to date

**To reproduce**
```
>> to-date  now
== 20-Dec-2018/21:09:48+01:00
>> to-date to-string now
*** Script Error: cannot MAKE/TO date! from: "20-Dec-2018/21:09:55+01:00"
*** Where: to
*** Stack: to-date
```

**Expected behavior**
no script error when doing date conversion from string


**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for Linux built 22-Nov-2018/1:40:38+01:00 commit #755eb94
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-20T21:12:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3673#issuecomment-449137038>

    ```
    >> load to-string now
    == 20-Dec-2018/14:08:08-07:00
    ```
    For conversions, see: https://doc.red-lang.org/en/datatypes/date.html#_runtime_creation
    
    `Make` and `to` don't have exactly the same semantics. `To` allows integers to be used, where `make` does not, with the base value being the same as epoch time.
    


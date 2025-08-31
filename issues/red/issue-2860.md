
#2860: make date! has problems (2nd installment)
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/2860>

```
>> make date! [300 1 301]
== 12-Sep-0301                 ; largest of 1st and 2nd number is year, if >= 100
>> make date! [301 1 300]
== 12-Sep-0301                 ; but why does 300-Jan work out to be 12-Sep ??
>> d: 12-Sep-2017
== 12-Sep-2017
>> d/yearday
== 255                               ; it is not as if 12-Sep is 300th day of the year!
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-08T10:39:19Z, meijeru, commented:
<https://github.com/red/red/issues/2860#issuecomment-313848275>

    Since the latest commits, this is now OK


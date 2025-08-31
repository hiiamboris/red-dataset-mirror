
#5195: to-date to-integer now isn't the curent time zone
================================================================================
Issue is closed, was reported by isqwy and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5195>

```
>> now
== 3-Sep-2022/21:32:47+08:00
>> to-integer now
== 1662211977
>> to-date 1662211977
== 3-Sep-2022/13:32:57
>>
```
why turn back is not use the same time zone?



Comments:
--------------------------------------------------------------------------------

On 2022-09-03T13:41:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/5195#issuecomment-1236122820>

    and how do you suggest integer will hold a time zone?

--------------------------------------------------------------------------------

On 2022-09-03T13:57:03Z, dockimbel, commented:
<https://github.com/red/red/issues/5195#issuecomment-1236125395>

    `to-integer` on dates converts to Unix Epoch Time, which is a lossy conversion wrt to timezones. So you cannot expect that a round-trip will be lossless. See documentation: https://github.com/red/docs/blob/master/en/datatypes/date.adoc#epoch-time
    
    "Epoch time are expressed in UTC. If the argument date is not in UTC, it will be converted internally before converting to epoch time."


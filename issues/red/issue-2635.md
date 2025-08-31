
#2635: Wish: Allow time! and date! values as keys in map!s
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2635>

Allow ```time!``` and ```date!``` (when implemented) values to be keys in ```map!``` values.

```text
m: #( 9:30 "Meeting" 10:00 "Another Meeting" 11:00 "Long, long lunch")

mm: #(1-Apr-2018 "Travel to Red Conference" 2-Apr-2018 "Red Conference")
```


Comments:
--------------------------------------------------------------------------------

On 2017-05-05T08:41:54Z, qtxie, commented:
<https://github.com/red/red/issues/2635#issuecomment-299412463>

    Added `time!` support.

--------------------------------------------------------------------------------

On 2017-05-05T10:20:02Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2635#issuecomment-299430754>

    Thanks @qtxie 

--------------------------------------------------------------------------------

On 2017-07-28T12:03:01Z, dockimbel, commented:
<https://github.com/red/red/issues/2635#issuecomment-318634570>

    Works on date! too now, so I'm closing this ticket.


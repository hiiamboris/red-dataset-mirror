
#2014: Division of time by time is flawed
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2014>

The first example is impeccable, the second is worrisome.

```
red>> 1:00:00 / 3600
== 0:00:01.0
red>> 1:00:00 / 0:0:1
== 1:00:04.547473508864641e-13
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-15T08:35:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2014#issuecomment-226123233>

    @meijeru Your tickets were more helpful than I thought at first glance. ;-)

--------------------------------------------------------------------------------

On 2016-06-15T10:19:35Z, meijeru, commented:
<https://github.com/red/red/issues/2014#issuecomment-226147065>

    Glad to hear that!


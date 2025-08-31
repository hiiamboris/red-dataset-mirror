
#1: Mouse clicks on a text-list do not fill the `event/picked` field.
================================================================================
Issue is open, was reported by PeterWAWood and has 4 comment(s).
[Wish]
<https://github.com/red/REP/issues/1>

Clicking multiple times on different items in the following list:
```
view [text-list data ["a" "b" "c"] on-down [probe event/picked]]
```
produces:
```
0
0
0
0
0
0
0
````


Comments:
--------------------------------------------------------------------------------

On 2018-04-23T01:59:18Z, PeterWAWood, commented:
<https://github.com/red/REP/issues/1#issuecomment-383433498>

    This was previously red issue [2963](https://github.com/red/red/issues/2963) opened by @dockimbel.

--------------------------------------------------------------------------------

On 2018-08-18T23:34:39Z, endo64, commented:
<https://github.com/red/REP/issues/1#issuecomment-414092706>

    This can be closed I think, now it fills `event/picked`


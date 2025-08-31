
#2963: Mouse clicks on a text-list do not fill the `event/picked` field.
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[type.wish] [status.reviewed] [GUI]
<https://github.com/red/red/issues/2963>

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

On 2018-04-23T01:47:28Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2963#issuecomment-383432160>

    Moved to red/REP repo.


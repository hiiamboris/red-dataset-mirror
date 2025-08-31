
#477: Have CASE accept empty default
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.wish] [Red/System]
<https://github.com/red/red/issues/477>

```
Red/System []

case [
    no [print-line "No"]
    yes []
]
```

-= Red/System Compiler =- 
**\* Compilation Error: expected a non-empty block of code 
**\* at line: 3 
**\* near: [[false [print-line "No"] true []] 
]

Many CASEs take no action by default. It's inconvenient that Red/System generates a runtime error when no case is matched, but the fact that no empty default can be specified, either, makes it impossible to use CASE in such cases.

Note that SWITCH does allow an empty DEFAULT case.



Comments:
--------------------------------------------------------------------------------

On 2013-05-18T17:01:46Z, dockimbel, commented:
<https://github.com/red/red/issues/477#issuecomment-18104437>

    From what I remember, there was an implementation constraint that was forcing cases block to hold at least one expression. I usually just add a dummy 0 value in such blocks to workaround the limitation. I will have a look at the issue and see if it can be improved now.


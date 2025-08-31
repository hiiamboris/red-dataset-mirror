
#1755: Lowercase used on a text-list content does not update the widget on display.
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1755>

```
view [
    list: text-list data ["John" "Bob" "Alice"]
    button "Add" [append list/data "Sue"]
    button "Change" [lowercase list/data/1]
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-30T10:15:13Z, xqlab, commented:
<https://github.com/red/red/issues/1755#issuecomment-203366912>

    This works
    
    > view [
    >       list: text-list data ["John" "Bob" "Alice"]
    >       button "Add" [append list/data "Sue"]
    >       button "Change" [list/data/1: lowercase list/data/1]
    > ]


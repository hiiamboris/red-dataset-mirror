
#1884: Setting text-list/data directly is not taken into account
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/1884>

In following code:

```
view [list: text-list data [] button "populate" [list/data: ["a" "b" "c"] show list]]
```

When clicking on the button, the text-list does not change.




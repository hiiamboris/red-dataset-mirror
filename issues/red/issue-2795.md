
#2795: [VID] Group-box doesn't honor the origin setting as its bottom-right margin.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2795>

Run the following code, you will see that the group-box doesn't put the contained object (the red base) in the center. The top-left margin (aka origin) is greater than the bottom-right margin.
```Red
view [ group-box "OK" [  base red  ] ]
```



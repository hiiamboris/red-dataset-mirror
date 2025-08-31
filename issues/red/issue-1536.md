
#1536: TEXT-LIST should get data also from PATH!
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1536>

It’s possible to pass data to TEXT-LIST, but it accepts only WORD!, not PATH!.

Example code:

```
data: ["bob" "bobek"]
o: context [data: ["zikmund" "hanzelka"]]

win: layout [
    text-list data data
    text-list data o/data
]
view win
```




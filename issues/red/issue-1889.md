
#1889: Access error crash with compiled code
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1889>

Following code crashes Red when compiled:

```
Red [
    Needs: 'View
]

main: layout [
    text "test"
]

main/extra: context compose [
    old-size: (main/size)
]

print mold main
```




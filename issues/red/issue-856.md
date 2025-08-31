
#856: Load is not working properly with non Latin1 string! input
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/856>

```
red>> load "a bcr 10"
== [a bcr 10]

red>> load "a bčř 10"
== [a bčř 10崠
```




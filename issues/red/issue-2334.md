
#2334: make path! <block> gives path! in stead of path value
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2334>

```
red>> make path! [a b]
== path! ; expected a/b
```
Goes also for `lit-path!` etc



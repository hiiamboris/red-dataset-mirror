
#2592: map! access violation with typing/syntax mistake
================================================================================
Issue is closed, was reported by gltewalt and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2592>

```
m: make map! [foo 1 bar 2 baz 3]

;-- typing/syntax mistake
set m 'foo none    ;-- Runtime Error 1: access violation  at: 0044C796h
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-17T08:00:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2592#issuecomment-294427944>

    Thank you!


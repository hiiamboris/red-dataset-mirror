
#2072: save wrongly save a map! with a key/value pair containing a block!
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2072>

```
m: make map! 10
;   #()
  a: [1 2 3]
;   [1 2 3]
  m/a: a
;   [1 2 3]
  m
;   #(
    a: [1 2 3]
)
  save %file m
  read %file
;   "#(^/a: 1 2 3^/)"
  load %file
;   #(
    a: 1
    2 3
)
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-26T11:46:25Z, x8x, commented:
<https://github.com/red/red/issues/2072#issuecomment-228597319>

    Thanks Red Team!! Nobody expect to get fixes on Sunday, but well Red Team must be driven by passion!
    Much appreciated! 8-)


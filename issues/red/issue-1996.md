
#1996: PUT works like POKE if key is integer!
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1996>

```
red>> blk: [a b #x #y 2 3]
== [a b #x #y 2 3]
red>> put blk 2 4
== 4
red>> blk
== [a 4 #x #y 2 3]
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-11T17:03:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1996#issuecomment-225374961>

    Good catch!


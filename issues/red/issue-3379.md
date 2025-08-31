
#3379: Reverse on tuple value crashes interpreter
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3379>

### Expected behavior

`reverse` on tuple value should yield new tuple value with elements reversed
### Actual behavior

Crash of GUI console
### Steps to reproduce the problem

execute `reverse 1.2.3` in GUI console
### Red and platform version
```
Red 0.6.3 for Windows built 27-Apr-2018/12:07:23+02:00 commit #4c36108
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-09T21:48:10Z, qtxie, commented:
<https://github.com/red/red/issues/3379#issuecomment-387885922>

    When checking owner in `reverse` [(code)](https://github.com/red/red/blob/master/runtime/datatypes/tuple.reds#L634), the type of `path-parent` [(code)](https://github.com/red/red/blob/master/runtime/datatypes/object.reds#L32) should be `none`. But it's not when running the code in GUI console. 
    @dockimbel Do you have any glue about it?

--------------------------------------------------------------------------------

On 2018-05-10T08:07:40Z, meijeru, commented:
<https://github.com/red/red/issues/3379#issuecomment-387983757>

    Should a tuple be checked for ownership at all? I thought this was for series? When looking at the code in `%runtime/datatypes/tuple.reds` I also noted that there is an ownership check in `poke`, a function which is not registered because `poke` is not allowed on tuples.

--------------------------------------------------------------------------------

On 2018-11-19T22:59:37Z, qtxie, commented:
<https://github.com/red/red/issues/3379#issuecomment-440073115>

    It caused by the global `path-parent`.


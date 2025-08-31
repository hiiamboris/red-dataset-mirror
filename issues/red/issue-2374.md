
#2374: tuple is not handled correctly when compiling
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2374>

The following program behaves correctly when interpreted, but when compiled with `-t MSDOS` it produces the wrong result:
```
Red []
smpl: 1.2.3.4.5
print mold smpl    ; when interpreted, prints 1.2.3.4.5, when compiled prints 1.2.3.4.2
```



Comments:
--------------------------------------------------------------------------------

On 2016-12-20T20:43:42Z, meijeru, commented:
<https://github.com/red/red/issues/2374#issuecomment-268354278>

    Can be simplified to `print 1.2.3.4.5` -- still gives wrong result

--------------------------------------------------------------------------------

On 2016-12-20T23:57:39Z, qtxie, commented:
<https://github.com/red/red/issues/2374#issuecomment-268394714>

    I remember this issue happened before. 

--------------------------------------------------------------------------------

On 2016-12-21T01:37:14Z, qtxie, commented:
<https://github.com/red/red/issues/2374#issuecomment-268410159>

    Related issue #2068 .


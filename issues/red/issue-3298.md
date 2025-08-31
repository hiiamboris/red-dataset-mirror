
#3298: list-dir prints only dots and is very slow on GUI console
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3298>

### Expected behavior

Directory list should be printed.

### Actual behavior

Only dots `...` printed for every file.

### Steps to reproduce the problem

Open GUI console and type `ls` or `list-dir`

### Version

Red 0.6.3 for Windows built 30-Mar-2018/11:40:57 commit #317934fa
Win10 x64.



Comments:
--------------------------------------------------------------------------------

On 2018-04-10T08:48:30Z, qtxie, commented:
<https://github.com/red/red/issues/3298#issuecomment-380023655>

    Should be fixed now.


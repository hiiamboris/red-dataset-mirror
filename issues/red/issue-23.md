
#23: Documentation improvement
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built]
<https://github.com/red/red/issues/23>

In the draft specification, sections 4.6.3 and 4.6.5, there are several examples each containing the statement

```
p: as [pointer [integer!]] 40000000h
```

If I understand correctly, this should be 

```
p: as [pointer! [integer!]] 40000000h
```



Comments:
--------------------------------------------------------------------------------

On 2011-04-30T15:04:48Z, dockimbel, commented:
<https://github.com/red/red/issues/23#issuecomment-1080848>

    You are right, these are typos that I will fix in the next commit.
    Thanks!

--------------------------------------------------------------------------------

On 2011-04-30T16:39:21Z, dockimbel, commented:
<https://github.com/red/red/issues/23#issuecomment-1081057>

    Fixed in commit: https://github.com/dockimbel/Red/commit/e55327fc91c9ea156aaf5777f8face36abade25f


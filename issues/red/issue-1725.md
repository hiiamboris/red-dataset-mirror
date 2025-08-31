
#1725: Current directory is wrong after CD to non existing directory
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1725>

```
red>> change-dir some-nonsense
*** Access error: cannot open: %/E/Code/red/some-nonsense/
*** Where: set-current-dir
red>> pwd
%/E/Code/red/some-nonsense/
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-23T09:27:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1725#issuecomment-200266858>

    This requires to implement `exists?` native, to be able to check for folder's presence.


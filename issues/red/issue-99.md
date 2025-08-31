
#99: hex-delim should include /
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/99>

This is because I think the following should not be refused:

```
s: "abcd...." ; very long string
s/30h
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-21T09:15:14Z, dockimbel, commented:
<https://github.com/red/red/issues/99#issuecomment-1408960>

    Good catch!

--------------------------------------------------------------------------------

On 2011-06-21T09:46:59Z, dockimbel, commented:
<https://github.com/red/red/issues/99#issuecomment-1409111>

    Tested OK.


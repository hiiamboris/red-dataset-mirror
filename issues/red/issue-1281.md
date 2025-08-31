
#1281: 50 char limit on paths
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1281>

On Windows XP:

```
H:\>red-21jul15-895ec65.exe folder-length-16\dir-length-13\file-length-18.red
This is the test output.

H:\>red-21jul15-895ec65.exe folder-length-16\folder-length-16\file-length-18.red

*** Error: File not found
```

Both files exist.
There seems to be a limit of 50 characters for path lengths here.
Is this a bug, or temporarily intentional?



Comments:
--------------------------------------------------------------------------------

On 2015-07-22T03:36:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1281#issuecomment-123553502>

    I see no special limit in the source code about filename sizes.



#1553: Saving image leaves CompoundFile.cmp in working directory
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1553>

When you use this:

```
save %/r/test.png make image! 100x100
```

There is created `CompoundFile.cmp` file in the application folder.
I think it should be deleted as it's just temporary file and in Windows API documentation is:

_The caller is responsible for deleting the temporary file when finished with it, unless STGM_DELETEONRELEASE was specified for the grfMode parameter._
https://msdn.microsoft.com/en-us/library/windows/desktop/aa380323(v=vs.85).aspx





#1477: write/append overrides file contents
================================================================================
Issue is closed, was reported by xificurC and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1477>

Running this minimal example from console

```
out-file: %test.txt ; non-existent file yet
write/append out-file "hi"
write/append out-file "there"
```

the file only contains `there`, i.e. the write always overwrites the entire file with new contents.

Tested on win7 x64 with console compiled from gui on HEAD.



Comments:
--------------------------------------------------------------------------------

On 2016-01-15T11:09:38Z, dockimbel, commented:
<https://github.com/red/red/issues/1477#issuecomment-171935109>

    Caused by `not` bug in R/S, described in #1481.


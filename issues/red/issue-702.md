
#702: COMMENT processing inaccurate
================================================================================
Issue is closed, was reported by kealist and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/702>

The following script returns an error by evaluating the comment word within the block.  This is not the behavior in Rebol2

```
Red[]

command: [
    if-defined | if-not-defined | define | function | comment
]
```



Comments:
--------------------------------------------------------------------------------

On 2014-03-03T18:13:08Z, dockimbel, commented:
<https://github.com/red/red/issues/702#issuecomment-36539481>

    From now on, COMMENT is defined as a mezz function and not pre-processed anymore by the lexers.


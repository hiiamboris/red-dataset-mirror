
#3135: 'to-block' not putting new-line markers properly
================================================================================
Issue is closed, was reported by mikeyaunish and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3135>

### Expected behavior
```
>> to-block {one two three/free^/}
== [one two three/free]
```
### Actual behavior
```
>> to-block {one two three/free^/}
== [one two 
    three/free
]
```
### Steps to reproduce the problem
run 'to-block' on any string that contains a "/" in the last word followed immediately by a new line "^/"
### Red version and build date, operating system with version.
Red version: 0.6.3
date: 22-Nov-2017/23:06:38-07:00
Windows 10 Pro



Comments:
--------------------------------------------------------------------------------

On 2017-12-04T21:18:25Z, meijeru, commented:
<https://github.com/red/red/issues/3135#issuecomment-349108802>

    The "erroneousness" of this example has to do with the result of `mold`, and thus with the placement of new-line markers. The values in the block are not affected.

--------------------------------------------------------------------------------

On 2017-12-05T01:01:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3135#issuecomment-349160175>

    It's an interesting case, and affects any path type except `set-path!`. `Load` does the same thing, so it may be something we want to note when someone is in `system/lexer/transcode`, to see why a new-line marker is being set in this case.


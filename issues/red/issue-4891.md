
#4891: First selection of a row in a text-list raises an unfocus event.
================================================================================
Issue is closed, was reported by zwortex and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4891>

**Before submitting**
https://gitter.im/red/help?at=60944435963923553ae99c0e)

**Describe the bug**
First selection of a row in a text-list raises an unfocus event. 

To reproduce : run the following code, and select a row in the list. Unfocus will display in the console.

```
view/no-wait [
    text-list data [ "1" "2" ]
        on-focus [ print "Focus" ]
        on-unfocus [ print "Unfocus" ]
]
```

**Expected behavior**
Focus event instead

**Platform version**
Red 0.6.4 for Windows built 24-Apr-2021/19:27:28
OS: Windows 10 x64 / 20H2 




Comments:
--------------------------------------------------------------------------------

On 2021-05-06T20:17:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4891#issuecomment-833831398>

    Also related https://github.com/red/red/issues/3728



#3459: Access violation on IMAGE! creation with RTD usage
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3459>

### Expected behavior
Rich-text string is rendered on an image.
### Actual behavior
```
*** Runtime Error 1: access violation
*** at: 0041F95Ah
```
### Steps to reproduce the problem
```red
? (draw 100x100 compose [text 50x50 (rtd-layout [b "test" /b])])
```
### Red and platform version
W10, though, I also experienced this crash on Wine (which is expected I guess).
```
Red 0.6.3 for Windows built 5-Jul-2018/20:38:08+05:00 commit #963ec55
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-05T06:17:25Z, qtxie, commented:
<https://github.com/red/red/issues/3459#issuecomment-410498656>

    It should not crash, though it's not supported yet.

--------------------------------------------------------------------------------

On 2018-08-16T09:38:21Z, qtxie, commented:
<https://github.com/red/red/issues/3459#issuecomment-413486052>

    It will throw an error now.



#3130: VID: camera - GUI Console freeze when select is omitted in view [camera select 1]
================================================================================
Issue is closed, was reported by gltewalt and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3130>

### Expected behavior
If a mistake is made and `camera 1` is written instead of `camera select 1`
I expect view to treat it as a size and produce a camera object with size: 1x250
```
view [camera 1]
```


### Actual behavior
Will freeze GUI Console and GUI Console can not be killed until the computer is put back into sleep again or is rebooted.
Will freeze cli console but it can be escaped back to CMD.exe
### Steps to reproduce the problem
1) With GUI Console left open, put computer in to sleep mode. 2) Awaken computer, then type `view [camera 1]` in the GUI Console.
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 1-Dec-2017/16:58:47-07:00
Win7 Pro 64bit


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T08:30:04Z, qtxie, commented:
<https://github.com/red/red/issues/3130#issuecomment-384204860>

    I cannot reproduce it. @gltewalt Does this issue still existing?

--------------------------------------------------------------------------------

On 2018-04-25T18:18:27Z, gltewalt, commented:
<https://github.com/red/red/issues/3130#issuecomment-384384683>

    It no longer freezes with new GUI Console.


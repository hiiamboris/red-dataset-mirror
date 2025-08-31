
#3080: [crash] After two appends to hash! accessing it crashes Red
================================================================================
Issue is closed, was reported by maximvl and has 6 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/3080>

### Expected behavior
Accessing a hash works as usual
### Actual behavior
Acessing a hash crashes Red
```
> red typed-crashing.red
make hash! []
before append line executed
var: x
type: none
"before crash:"

*** Runtime Error 1: access violation
*** at: 0806D8DBh
```
### Steps to reproduce the problem
Run https://gist.github.com/maximvl/a4def0c51458c47ec5e7b0ad4aa51724
### Red version and build date, operating system with version.
```
>> system/version
== 0.6.3
>> system/build
== make object! [
    date: 16-Sep-2017/10:41:02+02:00
    config: make object! [
        config-name: 'Linux
        OS: 'Linux
        OS-version: 0
        ABI: none
        link?: true
```


Comments:
--------------------------------------------------------------------------------

On 2017-10-14T13:10:57Z, maximvl, commented:
<https://github.com/red/red/issues/3080#issuecomment-336634102>

    I also found that it has something to do with `type` being "broken" `none` and this line before the `append` fixes the crash: `if none? type [ type: none ]`

--------------------------------------------------------------------------------

On 2017-10-17T14:57:49Z, qtxie, commented:
<https://github.com/red/red/issues/3080#issuecomment-337259776>

    The process memory has been corrupted before append.

--------------------------------------------------------------------------------

On 2019-08-19T20:51:14Z, dockimbel, commented:
<https://github.com/red/red/issues/3080#issuecomment-522748652>

    We cannot reproduce the crash anymore, so we can consider it fixed.


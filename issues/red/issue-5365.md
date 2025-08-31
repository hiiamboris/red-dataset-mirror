
#5365: Transcode on file! scans different than previous Red version
================================================================================
Issue is closed, was reported by mikeyaunish and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5365>



**Describe the bug**
Transcode on file! produces a different sized token than previous Red version

**To reproduce**
Steps to reproduce the behavior:
1. Run the same transcode on different versions of Red.
```
>> about
Red 0.6.4 for Windows built 2-Aug-2023/17:10:02-06:00  commit #2c0a400
>> transcode/trace "%hello.txt" func [event input type line token] [?? token true]
token: 1x11
token: 1x12
token: %hello.txt
== [%hello.txt]
```

```
>> about
Red 0.6.4 for Windows built 7-Jun-2023/13:38:46-06:00  commit #01ab176
>> transcode/trace "%hello.txt" func [event input type line token] [?? token true]
token: 1x11
token: 1x11
token: %hello.txt
== [%hello.txt]
```
2. Notice the token size is not the same.

**Expected behavior**
Token size as shown above for current version of Red should return 'token: 1x11' 

**Platform version**
RED: [ branch: "master" tag: #v0.6.4 ahead: 4893 date: 2-Aug-2023/23:10:02 commit: #2c0a40018c3b226226adc41eb7994d3989bc43a4 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]




Comments:
--------------------------------------------------------------------------------

On 2023-08-10T08:12:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5365#issuecomment-1672766373>

    Note `12` is past tail

--------------------------------------------------------------------------------

On 2023-08-10T12:14:26Z, dockimbel, commented:
<https://github.com/red/red/issues/5365#issuecomment-1673104853>

    Most probably related to the recent fix for #5351.


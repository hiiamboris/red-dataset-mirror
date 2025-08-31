
#3567: 'put throws access violation after 'append to certain series!
================================================================================
Issue is closed, was reported by bferris413 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3567>

**Describe the bug**
While using the hash! datatype, it was discovered that appending a word! to the hash (append 'w my-hash) and then using put to set a value to the newly-added key throws an access violation.

**To Reproduce**
Steps to reproduce the behavior:
1. Open Red console.
2. Sample below using plain block! :
```
>> v: [ a "1"]
== [a "1"]
>> put v 'b "2"
== "2"
>> v
== [a "1" b "2"]
>> append v 'c
== [a "1" b "2" c]
>> put v 'c "3"

Runtime Error 1: access violation
at: 004546E6h
```

**Expected behavior**
I expected the series to be `[a "1" b "2" c "3"]` The issue manifests itself with at least block! and hash! types.

**Screenshots**
I think the code pasted in the steps covers the relevant info.

**Platform version(please complete the following information):**
```
Red 0.6.3 for Windows built 29-Sep-2018/19:46:19-04:00 commit #dd46e5a
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-16T10:25:57Z, endo64, commented:
<https://github.com/red/red/issues/3567#issuecomment-430185452>

    It happens to blocks as well not limited with hash values. @PeterWAWood could you mark this issue for 0.6.4.


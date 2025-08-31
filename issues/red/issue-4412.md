
#4412: Invalid trailing UTF-8 is ignored by to-string
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4412>

**Describe the bug**
`to-string` on a binary value is supposed to do UTF-8 decoding; invalid code combinations result in an error, except if they are at the _end_ of the binary sequence, in which case they are ignored

**To reproduce**
```
>> to-string #{62C3A9}
== "bé"                             ; correct
>> to-string #{62C3}
== "b"                              ; C3 ignored
>> to-string #{C362}       ; C3 with 62 gives error
*** Access Error: invalid UTF-8 encoding: #{C3620000}
```
**Expected behavior**
An error message as for invalid combinations _before_ the end of the binary sequence

**Platform version (please complete the following information)**
```
All, presumably
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-03T20:25:12Z, meijeru, commented:
<https://github.com/red/red/issues/4412#issuecomment-623175801>

    I think this works. What then is preventing this issue from being closed?



#5576: Something's wrong with the hash copying
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5576>

**Describe the bug**

One would expect copying to be equally fast on hash and block buffers, but in reality it seems that a copy of a hash takes as much time as initializing a new hash:
```
>> recycle/off h: make hash! 50 repeat i 50 [append h random 10]
== make hash! [3 1 7 1 3 4 3 1 8 2 6 1 4 8 9 4 2 9 4 4 6 5 1 3 8 6 7 7 5 8 10 10 4 10 4 10 3 8 2 4 3 10 7 2 8 9 2 1 10 7]
>> recycle clock/times [to block! h] 1e6
0.50 μs [to block! h]
== [3 1 7 1 3 4 3 1 8 2 6 1 4 8 9 4 2 9 4 4 6 5 1 3 8 6 7 7 5 8 10 10 4 10 4 10 3 8 2 4 3 10 7 2 8 9 2 1 10 7]
>> recycle clock/times [to hash! h] 1e6
6.12 μs [to hash! h]
== make hash! [3 1 7 1 3 4 3 1 8 2 6 1 4 8 9 4 2 9 4 4 6 5 1 3 8 6 7 7 5 8 10 10 4 10 4 10 3 8 2 4 3 10 7 2 8 9 2 1 10 7]
>> recycle b: to block! h clock/times [to hash! b] 1e6
6.04 μs [to hash! b]
== make hash! [3 1 7 1 3 4 3 1 8 2 6 1 4 8 9 4 2 9 4 4 6 5 1 3 8 6 7 7 5 8 10 10 4 10 4 10 3 8 2 4 3 10 7 2 8 9 2 1 10 7]
```
So, while RAM measurements show that hash is only about 3x bigger than block (which should have a negligible effect on copying performance IMO), timings of hash copy are 12x slower than of converting it to a block.

**To reproduce**
```
recycle/off h: make hash! 50 repeat i 50 [append h random 10] b: to block! h
recycle clock/times [to block! h] 1e6
recycle clock/times [to hash! h] 1e6
recycle clock/times [to hash! b] 1e6
```

**Expected behavior**

Copying should be on par with block copy. Why would it rehash itself on copy?

**Platform version**
```
RED: [ branch: "nodes-gc" tag: #v0.6.5 ahead: 346 date: 19-Dec-2024/23:56:07 commit: #25feec70a9fa14441859bba8a22cde32464d126e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
```


Comments:
--------------------------------------------------------------------------------

On 2024-12-22T09:20:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5576#issuecomment-2558389452>

    For the record, `map!` copy is about on par with `block!`. Maybe 50-70% slower only.


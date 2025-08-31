
#5276: Incorrect Order of Arithmetic Operations
================================================================================
Issue is closed, was reported by piotrbajdek and has 0 comment(s).
<https://github.com/red/red/issues/5276>

**Describe the bug**
Incorrect Order of Arithmetic Operations

**To reproduce**
Steps to reproduce the behavior:

>> 2 + 2 * 10
== 40
>> 2 + 2 ** 10
== 1048576
>> 2 * 2 ** 10
== 1048576

**Expected behavior**
Should be:
>> 2 + 2 * 10
== 22
>> 2 + 2 ** 10
== 1026
>> 2 * 2 ** 10
== 2048

**Platform version**
RED: [ branch: "master" tag: #v0.6.4 ahead: 4629 date: 28-Jan-2023/11:28:13 commit: #ec0c31279023590e285fb2e1869380670ee0239f ]
PLATFORM: [ name: "Fedora Linux 37 (Container Image)" OS: 'Linux arch: 'x86_64 version: 6.1.7 build: {#1 SMP PREEMPT_DYNAMIC Wed Jan 18 17:11:49 UTC 2023} ]



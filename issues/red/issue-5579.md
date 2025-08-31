
#5579: [Regression] Hash copy doesn't honor /part anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5579>

**Describe the bug**

```
$ red+view-debug-nodes-gc-2025-01-07-76b4067.exe
>> copy/part make hash! [1 2 3 4 5 6 7 8] 2
== make hash! [1 2]

$ red+view-debug-nodes-gc-2025-01-07-4df8e38.exe
>> copy/part make hash! [1 2 3 4 5 6 7 8] 2
== make hash! [1 2 3 4 5 6 7 8]
```

**Expected behavior**

As before.

**Platform version**
`Red 0.6.5 for Windows built 8-Jan-2025/9:22:24+08:00  commit #4182c4c`


Comments:
--------------------------------------------------------------------------------

On 2025-01-08T05:23:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/5579#issuecomment-2576779744>

    https://github.com/red/red/commit/4df8e38e62082bfe27339b029d77f610ccfd65f4 ?


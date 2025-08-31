
#5305: Stream output is not getting flushed on Linux
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5305>

**Describe the bug**

I wanted to divert stdout of a script into a log file:
```
Red []
print "before wait"
wait 5 
print "after wait"
```
Then:
```
red 1.red |tee log
```
But on Linux the only output I'm getting is after the script finishes. So:
- nothing is output neither on screen nor into a file until some buffer gets filled (I never could wait long enough to figure out buffer size)
- Ctrl-C during script execution will lose all output

**To reproduce**

Run the above script as `red 1.red |tee /dev/null` - after 5 seconds both lines are printed at once

**Expected behavior**

First line printed, after 5 seconds - second line.

**Platform version**
```
>> about/debug
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4666 date: 7-Apr-2023/9:22:44 commit: #f951159d5963490b658d19c273e5db011800c
600 ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.10.60 build: "#1 SMP Wed Aug 25 23:20:18 UTC
2021" ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-04-09T09:23:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5305#issuecomment-1501084989>

    thanks for the quick fix :+1:


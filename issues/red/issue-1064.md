
#1064: re-pre-compiles console
================================================================================
Issue is closed, was reported by WiseGenius and has 20 comment(s).
[status.built]
<https://github.com/red/red/issues/1064>

Red has regressed to re-pre-compiling the console every time it opens the interpreter.

```
Pre-compiling Red console...
```

This occurs both in Windows (XP) and Linux (Puppy). I haven't tested any others.

Consequently, if an instance is already running, it can't open another one.

Windows:

```
*** Linker Error: locked or unreachable file: /H/Documents and Settings/All Users/Application Data/Red/console.exe
```

Linux:

```
*** Linker Error: locked or unreachable file: /tmp/red/console
```



Comments:
--------------------------------------------------------------------------------

On 2015-03-15T11:55:41Z, pekr, commented:
<https://github.com/red/red/issues/1064#issuecomment-80983090>

    Confirmed on Windows 8.1

--------------------------------------------------------------------------------

On 2015-03-16T07:47:59Z, dockimbel, commented:
<https://github.com/red/red/issues/1064#issuecomment-81471531>

    Cannot reproduce it here on both Windows 7 and Linux. 
    
    Is the problem still present now for both of you?

--------------------------------------------------------------------------------

On 2015-03-16T08:11:03Z, pekr, commented:
<https://github.com/red/red/issues/1064#issuecomment-81482032>

    Sadly, not here anymore. Dunno what happened. I run it one hour ago, and it recompiled, but now it seems being stable. Deleted console.exe and tried again, now it recompiles only once. Strange ...

--------------------------------------------------------------------------------

On 2015-03-16T08:25:42Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1064#issuecomment-81494298>

    Could the issue possibly be related to a difference in the timezone between the timestamp of the binary and the console generated on the first run of it?

--------------------------------------------------------------------------------

On 2015-03-16T13:16:14Z, WiseGenius, commented:
<https://github.com/red/red/issues/1064#issuecomment-81657896>

    I ran them on both Windows and Linux again today, and they each pre-compiled again one more time, but then I can open them as many times as I like and they're fine.
    On both, I'm using the same binaries I downloaded yesterday which were pre-compiling every time yesterday.
    @PeterWAWood I was thinking something similar.

--------------------------------------------------------------------------------

On 2015-03-16T14:07:23Z, dockimbel, commented:
<https://github.com/red/red/issues/1064#issuecomment-81686538>

    It's still the timezone issue and the fact that you get an executable with a timestamp in your future for a few hours, so that the precompilation process is triggered on each run. I have tried to avoid that issue by setting manually the Linux and Mac binaries timestamp 24 hours in the past, but those timestamps were overwritten later by a new building batch process... I have automated that for Linux, so for next release, it should avoid those issues (at least I hope so).
    
    For Windows, I'm very surprised that it occurs there too, I never had any such problem on Windows 7, but don't have a 8.1 to test it. @pekr Can you tell me what is the last modification date of your red-051.exe file?

--------------------------------------------------------------------------------

On 2015-03-16T14:15:22Z, WiseGenius, commented:
<https://github.com/red/red/issues/1064#issuecomment-81691216>

    red-051.exe (in XP):
    Created: Sunday, 15 March 2015, 8:29:25 PM
    Modified: Sunday, 15 March 2015, 7:31:37 PM
    Accessed: Today, 17 March 2015, 12:09:16 AM
    
    I'm GMT+10:00.

--------------------------------------------------------------------------------

On 2015-03-16T16:52:27Z, pekr, commented:
<https://github.com/red/red/issues/1064#issuecomment-81799467>

    I am GMT + 1:
    
    created: 12 ‎March ‎2015, ‏‎19:23:45
    modified: ‎15 ‎March ‎2015, ‏‎9:32:10
    accessed: 12 ‎March ‎2015, ‏‎19:23:45

--------------------------------------------------------------------------------

On 2015-03-18T02:43:25Z, earl, commented:
<https://github.com/red/red/issues/1064#issuecomment-82697048>

    Re-using this ticket to carry over a suggestion from chat, because it to be spot on here. If it's off-topic, just say so, and I'll open a separate issue.
    
    [red.r:172-175](https://github.com/red/red/blob/master/red.r#L172-L175) has the current caching logic. I suggest that to more comprehensively avoid these issues going forward, we simply create the pre-compiled console binary cache by suffixing the console filename with the build-date of the originating Red binary.
    
    So e.g. for the latest stable Linux red-051 binary (`system/build: "18-Mar-2015/3:39:37+1:00"`), instead of pre-compiling to `/tmp/red/console`, we pre-compile to `/tmp/red/console-20150318T023937Z`. We can then simplify the caching logic to just check if this file exists, no longer having to rely on MODIFIED? with the timezone mess.
    
    This would also have the positive side-effect of allowing multiple encapped binaries (red-050, red-051, etc) to happily co-exist side-by-side.

--------------------------------------------------------------------------------

On 2015-03-20T06:52:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1064#issuecomment-83940211>

    Suggestion implemented, we will make a new small release in a few days, so we will be able to test this workaround.



#3261: CRASH on extensive map copying (not garbage collected?)
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [type.task.wish]
<https://github.com/red/red/issues/3261>

```
Red []
m: #(a: 1 b: 2 c: 3 d: 4 e: 5 f: "6" g: "7" h: "8")
loop 10000000 [copy m]
probe m
```
### Expected behavior
no crash
### Actual behavior
```
*** Runtime Error 19: stack error or overflow
*** at: 0041929Eh
```
note: address varies
### Steps to reproduce the problem
use big number in the loop above, 1e6 isn't enough, 1e7 is fine
### Red version and build date, operating system with version.
Red 0.6.3 system/build/config/build-basename = **%console-2017-8-3-49893** (stable) and **%console-2018-3-11-43723** (nightly)
OS: win7 x64 v6.1.7601


Comments:
--------------------------------------------------------------------------------

On 2018-03-15T03:58:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3261#issuecomment-373253440>

    It should not crash, you should rather get an out of memory error, as the GC is not plugged into the master branch yet.

--------------------------------------------------------------------------------

On 2018-03-15T04:19:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/3261#issuecomment-373256088>

    how do I manually free maps and objects until GC is there?

--------------------------------------------------------------------------------

On 2018-03-15T06:41:18Z, dockimbel, commented:
<https://github.com/red/red/issues/3261#issuecomment-373276317>

    For maps and objects, you can't. For series, you can re-use them, so you don't have to allocate new ones.

--------------------------------------------------------------------------------

On 2018-03-15T07:50:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3261#issuecomment-373289887>

    @hiiamboris, can we close this ticket, since we know GC isn't there yet?

--------------------------------------------------------------------------------

On 2018-03-15T11:02:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3261#issuecomment-373338671>

    as you wish :)

--------------------------------------------------------------------------------

On 2018-03-15T11:17:13Z, dockimbel, commented:
<https://github.com/red/red/issues/3261#issuecomment-373342437>

    We can leave it open for now, as we need to bring a specific handler for out-of-memory errors in extreme cases. I started working on such support in this branch: https://github.com/red/red/tree/issue-3261, though this require much more time to get it done, so I label this ticket as "deferred" for now.

--------------------------------------------------------------------------------

On 2018-11-22T11:25:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3261#issuecomment-441000437>

    now with the GC in 0.6.4 it's even worse:
    ```
    >> loop 3000 [copy #()]
    
    *** Runtime Error 1: access violation
    *** at: 0046D9CFh
    ```
    For the GUI console even 2000 is enough. Surely 2000 empty maps can't be RAM heavy:
    ```
    >> stats
    == 2006892
    >> loop 1000 [copy #()]
    == #()
    >> stats
    == 2445676
    ```
    So there's another bug somewhere.


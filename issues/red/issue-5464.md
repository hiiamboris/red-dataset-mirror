
#5464: `do string` should execute macros (like `do file` does)
================================================================================
Issue is closed, was reported by SkySpiral7 and has 12 comment(s).
[type.wish] [status.resolved]
<https://github.com/red/red/issues/5464>

**Describe the bug**
`do string` should behave the same as `do file`.

**To reproduce**
First create 2 files:
```red
Red [File: %top.red]
filepath: %cli-tests.red

do read filepath

;these work:
;#include filepath
;do filepath
```
```red
Red [File: %cli-tests.red]
#do [print "hi"]
```
Then run `red top.red`.

**Expected behavior**
Macros should be evaluated.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5085 date: 13-Jan-2024/15:32:59 commit: #4b95ca1924a59cece1465d57b317572f72a96571 ]
PLATFORM: [ name: "Ubuntu 22.04.3 LTS" OS: 'Linux arch: 'x86_64 version: 6.5.0 build: {#14~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Mon Nov 20 18:15:30 UTC 2} ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-01-14T08:38:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/5464#issuecomment-1890885728>

    `? do`
    `do/expand read filepath`

--------------------------------------------------------------------------------

On 2024-01-14T23:52:01Z, SkySpiral7, commented:
<https://github.com/red/red/issues/5464#issuecomment-1891116125>

    Thanks I didn't know about the `help` command (and `:? == :help`). It's actually helpful.
    
    https://www.red-by-example.org/#do says that `do` can take a string or file but doesn't indicate that macros would behave different and it doesn't mention a `/expand` refinement (maybe the webpage is out of date). Checking `? do` on the latest red does mention `/expand` but still gives no indication that string and file would behave differently. So I still question if this is a bug.
    
    Side note: it says that `/args` refinement only applies to files but it is possible to set `system/script/args` call a func then reset the args. So it is possible for `/args` to apply to any `do`.

--------------------------------------------------------------------------------

On 2024-01-15T15:28:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5464#issuecomment-1892381750>

    > Thanks I didn't know about the `help` command (and `:? == :help`). It's actually helpful.
    
    Whenever you run any Red console, this is the first thing you see:
    ```
    --== Red 0.6.4 ==--
    Type HELP for starting information.
    
    >>
    ```
    Though you're not the first person to miss it :)

--------------------------------------------------------------------------------

On 2024-01-15T22:28:45Z, greggirwin, commented:
<https://github.com/red/red/issues/5464#issuecomment-1892830809>

    > Thanks I didn't know about the `help` command (and `:? == :help`). It's actually helpful.
    > 
    > https://www.red-by-example.org/#do says that `do` can take a string or file but doesn't indicate that macros would behave different and it doesn't mention a `/expand` refinement (maybe the webpage is out of date). Checking `? do` on the latest red does mention `/expand` but still gives no indication that string and file would behave differently. So I still question if this is a bug.
    > 
    > Side note: it says that `/args` refinement only applies to files but it is possible to set `system/script/args` call a func then reset the args. So it is possible for `/args` to apply to any `do`.
    
    Good notes to add to a wiki page.

--------------------------------------------------------------------------------

On 2024-01-16T15:19:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5464#issuecomment-1893958940>

    > https://www.red-by-example.org/#do says that do can take a string or file but doesn't indicate that macros would behave different and it doesn't mention a /expand refinement (maybe the webpage is out of date).
    
    From what I remember, the Red preprocessor (and `/expand` refinement for `do`) were added after that site was created, and that site didn't get updates.
    
    `do` on strings usual use-cases are evaluation of dynamically built strings where you don't need a preprocessor pass. If you need it anyway, `do/expand` will cover that need.
    
     I consider this ticket solved then.

--------------------------------------------------------------------------------

On 2024-06-17T00:47:01Z, SkySpiral7, commented:
<https://github.com/red/red/issues/5464#issuecomment-2171974404>

    > normally `do string` doesn't need macros
    
    That doesn't explain why these are this way. Is `do/expand` slower when there are no macros? Is there any reason to intentionally disable macros (besides speed)? Why doesn't `do file` have a way to disable macros? So there's still a few inconsistencies. Updating documentation is an easy first step but orthogonal design demands more symmetry.
    
    The last comment sounds like "not going to bother updating since this is rarely needed" rather than "this is the way it should behave" so I'm not sure this should've been closed. Perhaps my questions do already have answers, if so I'd like to hear them. (I hope I don't sound mad because I'm not).
    
    Based on your comment it sounds like the red repl help command is the source of truth for documentation but red-16jun24-08d41eeae `? do` doesn't indicate that macros are treated differently based on the type of the value passed. Only /args indicates that type matters (it implies a file type without directly stating it).


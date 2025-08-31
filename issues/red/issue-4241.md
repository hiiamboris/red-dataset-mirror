
#4241: Console and `call` craziness on Windows
================================================================================
Issue is open, was reported by hiiamboris and has 30 comment(s).
[type.bug]
<https://github.com/red/red/issues/4241>

See also https://github.com/red/red/issues/4262 on Mac bugs

**Describe the bug**

## Simple call
```
>> call "console"
== 28696
```
`console.exe` stays in process list with constant 70% single-core load

---
```
>> call "gui-console"
== 28948
```
works totally fine!

---
```
>> call "red"
== 27280
```
`gui-console-.....exe` process can be seen in process list for 2-3 seconds, then it terminates for no apparent reason

---
```
>> call "cmd"
== 29580
```
Such PID doesn't exist! Or maybe not long enough to be noticed in task manager (same with call/shell)

---
```
>> call/output "cmd" %1
== 0
```
Returns immediately! In the output, some escape sequence trash: `←[92mD:\devel\red\red-src\red←[90m>←[m`

## Redirected output
```
>> call/output "console" %1
(does not return until console process is terminated)
== 1
```
Same high CPU load. The output file contains excessive GC output (it's a debug build): `root: 3018/4669, runs: 137, mem: 3362040 => 1642564, mark: 1.0ms, sweep: 1.0ms` etc.

---
```
>> call/output "gui-console" %1
(does not return until gui-console is closed)
== 0
```
The output file %1 contains all the output except the input prompt and commands typed into it (I typed '123'+Enter):
```
--== Red 0.6.4 ==--
Type HELP for starting information.

== 123
```
---
/error behaves same as /output, just the redirected file is empty (as should be)

---

## Redirected input
```
>> call/input "console" %1
(does not return until console process is terminated)
== 1
```
Stable 100% CPU load by the `console` process. The input file %1 is locked from even read-only access. Very high RAM usage growth speed (~10MB/sec)
In the terminal (it's a debug build), the output is:
```
Error Red/System call : write into pipe failed : 6
== 1
```
---
```
>> call/input "gui-console" %1
(does not return until gui-console is closed)
== 1
```
The input file %1 is locked from even read-only access.

## Two consoles outputting into the same file
```
>> call/output "console" %1      ;) twice from 2 different gui-consoles
(waits)
== 0
```
The file contains output from both consoles, but it's totally messed up - e.g. GC output of one console ends with `root: 3018/4669, runs: 40,` and then continues with `root: 3018/4669, runs: 75,`. Apparently consoles lock the file from shared writing but do not preserve the output that were unable to flush in time.



**Expected behavior**

---
1. Should not load the CPU or eat RAM up.

---
2. Without /wait refinement should:
- if any of (/input, /output, /error) is given a string or binary argument - should return with an error (incompatible arguments - string/binary pipe redirection requires /wait)
- if only file arguments are given to (/input, /output, /error) - should return immediately, with a PID

---
3. /input should not lock the file: the plan was to write/append into it! ;)

---
4. `call/wait "cmd"` should not terminate immediately IMO, though I've no idea why it does.

---
5. `call "red"` should not terminate in 2 seconds but show gui console.

---
6. The output file should probably also contain `>> ...` prompt with commands entered, e.g.:
```
--== Red 0.6.4 ==--
Type HELP for starting information.

>> 123
== 123
```
~~But it's not important.~~
I just realized issue #4189 could have been auto-testable (for regressions) if console copied the input prompt contents into stdout. Although it's not strictly a guarantee that what it copied is what it actually displayed...

---
7. Lack of shared writing support is a non-issue for me.

---
8. `call` docstring should clarify that it returns PID without /wait only, and process' return code with /wait (Like, it returned me `100` a few times. What is `100`?)

**EDIT: 9.** Another issue here is that later using this PID is a shot in the dark. It will *often* work fine. What about the cases where it won't? Quoting SO:
> There is an inherent race condition in the use of pid_exists function: by the time the calling program gets to use the answer, the process may have already disappeared, or a new process with the queried id may have been created. I would dare say that any application that uses this function is flawed by design and that optimizing this function is therefore not worth the effort.

At least on Windows - using process handle instead seems to be the reliable way to access the right process.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-15T13:27:11Z, dockimbel, commented:
<https://github.com/red/red/issues/4241#issuecomment-574658896>

    FYI, `/input`, `/output` and `/error` imply `/wait`.

--------------------------------------------------------------------------------

On 2020-01-15T13:51:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4241#issuecomment-574668323>

    Yes, I saw the code. But I disagree with it ;) Limits the usefulness of `call` by a lot

--------------------------------------------------------------------------------

On 2020-01-15T19:49:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4241#issuecomment-574827545>

    `input` seems to be the culprit of some issues mentioned.
    
    I have a file `worker-1.red`:
    ```
    Red []                                 
    forever [try/all [do probe load input]]
    ```
    
    I call it:
    `>red --cli worker-1.red <stdin-1.txt 1>stdout-1.txt 2>stderr-1.txt`
    
    And then add newline-terminated strings into %stdin-1.txt. `input` should read lines, right?
    
    But no matter what I add there - nothing happens. And worker stays as 100% CPU load.
    
    Then I add `write %con "wake up, Neo!"` string and immediately get excessive output into %stdout-1.txt. It's a block with ~10MB word consisting of letters 'D' only or 'A' only, and ending with my command, e.g. `[......DDDDDDDDDDDDprint 1]`. Of course that is a nonsense so it does nothing. But after that it starts outputting empty blocks `[]` rapidly and properly executes any code I add into %input.txt. But stays at 100% load since `input` returns at EOF rather than waiting for LF, or for any text at all.

--------------------------------------------------------------------------------

On 2020-01-16T20:56:37Z, greggirwin, commented:
<https://github.com/red/red/issues/4241#issuecomment-575342559>

    Coincidentally, I just hit this:
    ```
    >> err: copy ""
    == ""
    >> call/error "dir" err
    *** Script Error: call does not allow none! for its err argument
    *** Where: call
    *** Stack:  
    ```
    Any other word seems OK.
    ```
    >> call/error "dir" err: copy ""
    == 0
    ```

--------------------------------------------------------------------------------

On 2020-03-04T18:37:31Z, dockimbel, commented:
<https://github.com/red/red/issues/4241#issuecomment-594737490>

    @hiiamboris You should avoid generalizing about CALL behavior based on the calling of "red.exe". The Red toolchain executable is encapped Rebol, so its behavior is mostly out of our control. Encapped Rebol relies on custom executable image access that makes it incompatible with several shell usages. So please separate the reporting on any CALL malfunction from "red.exe" usage.

--------------------------------------------------------------------------------

On 2020-03-04T18:41:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4241#issuecomment-594740030>

    > >> call "cmd"
    == 29580
    Such PID doesn't exist! Or maybe not long enough to be noticed in task manager (same with call/shell)
    
    CMD.exe is a GUI app, so as such you need to use `call/show "cmd.exe"` in order for it to work properly. By default, CALL does not open a shell window as it's inconvenient. For any app opening a window, you need to explicitly use `/show` refinement when opened by CALL.

--------------------------------------------------------------------------------

On 2020-03-04T18:46:39Z, dockimbel, commented:
<https://github.com/red/red/issues/4241#issuecomment-594744006>

    > I call it:
    >red --cli worker-1.red <stdin-1.txt 1>stdout-1.txt 2>stderr-1.txt
    
    You should know by now that `red.exe` is only the Red toolchain executable, not the Red console (the console is dynamically generated and called by `red.exe`). `red.exe` acts as a proxy on the Red console executable when compilation is not invoked from command-line. This behavior comes with its own issues: Rebol encapped executable limitations wrt shell compatibility and missing or improper transfer of input/output pipes to Red console child process.
    
    If you want proper shell behavior from Red, please use only the Red console executable (CLI version preferably on Windows).
    
    This is another good reason to separate more clearly the toolchain from the console, until we can get rid of Rebol altogether.

--------------------------------------------------------------------------------

On 2020-03-04T19:42:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4241#issuecomment-594787114>

    > > call "cmd"
    > > == 29580
    > > Such PID doesn't exist! Or maybe not long enough to be noticed in task manager (same with call/shell)
    > 
    > CMD.exe is a GUI app, so as such you need to use `call/show "cmd.exe"` in order for it to work properly. By default, CALL does not open a shell window as it's inconvenient. For any app opening a window, you need to explicitly use `/show` refinement when opened by CALL.
    
    I think you're mistaken here. Whether it shows on the screen or not, it should always be present in the process list with a PID returned by `call`. `cmd` is no exception - it just stays there until you kill it. You can reproduce it with Rebol's `call "cmd"` easily - just watch the process list.
    
    Besides, /show doesn't save the day in Red: `call/show "cmd"` or even `call/show "c:\windows\system32\cmd.exe"` all open up an instantly close a shell window for me.
    
    > So please separate the reporting on any CALL malfunction from "red.exe" usage.
    > If you want proper shell behavior from Red, please use only the Red console executable (CLI version preferably on Windows).
    
    Fair point ☺ But it behaves the same in my case:
    1. Save `Red [] forever [try/all [do probe load input]]` to `worker-1.red`
    2. Create an empty(!) `stdin-1.txt`
    3. Call (from the shell) `console-view.exe worker-1.red <stdin-1.txt 1>stdout-1.txt 2>stderr-1.txt`
    4. Try adding newline-terminated(!) strings to `stdin-1.txt` - commands are not being executed
    5. Add `write %con "wake up, Neo!"` spell to `stdin-1.txt` - if not instantaneously then after a few seconds you'll receive a ~15MB output with junk in `stdout-1.txt`. And it's spamming empty blocks very fast there.
    6. From now on, every command added to stdin (try `view []`) gets executed.

--------------------------------------------------------------------------------

On 2020-03-04T20:52:34Z, dockimbel, commented:
<https://github.com/red/red/issues/4241#issuecomment-594831934>

    > I think you're mistaken here. Whether it shows on the screen or not, it should always be present in the process list with a PID returned by call. cmd is no exception - it just stays there until you kill it. You can reproduce it with Rebol's call "cmd" easily - just watch the process list.
    
    Indeed. Red's CALL is not behaving properly in such case.
    
    > Besides, /show doesn't save the day in Red: call/show "cmd" or even call/show "c:\windows\system32\cmd.exe" all open up an instantly close a shell window for me.
    
    It works on Win10. Though, the CMD window does not seem to run input commands and CALL returns immediatly, so the behavior is not correct anyway.
    
    > Call (from the shell) console-view.exe worker-1.red <stdin-1.txt 1>stdout-1.txt 2>stderr-1.txt
    
    Did you try with a console compiled with `-t MSDOS`?

--------------------------------------------------------------------------------

On 2020-03-04T21:01:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4241#issuecomment-594838555>

    > Did you try with a console compiled with `-t MSDOS`?
    
    Yes, indeed. It's a CLI console with View support. Build command I'm using is:
    `start /min cmd /s /c "rebol --do "do/args %%red.r {-r -d %* environment/console/CLI/console-view.red} quit""`
    where `-t MSDOS` is the default build mode (no need to specify it), which it outputs as `Target: MSDOS` during compilation
    

--------------------------------------------------------------------------------

On 2020-04-20T13:30:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4241#issuecomment-616554607>

    Meanwhile the story goes on...
    
    ---
    **To reproduce**:
    
    1. Start a fresh `console` in `cmd`
    2. Type in `call/show {console}` (you should have it available in the path). (you can specify /shell as well - doesn't affect a thing)
    ```
    >> call/show {console}
    == 3904
    ```
    3. **Nothing appears** on the screen! Although you can tell from the process list that the console with such PID exists.
    4. Try typing anything in the console where you wrote `call`
    5. Observe how it **eats keystrokes**: sometimes randomly, sometimes you have to press and hold the key, else no character will be input.
    6. Be persistent and repeat step 2 a few times: it will eat more and more input and will become **very laggy**
    7. Count how many times you started the console - in the process list. Now quit the console and count again - some of them will close, some will not (e.g. I started 6 consoles + the starter one, after quitting I had 3 of them left unclosed)
    
    **Expected:**
    - A console window with a new console must appear
    - Should not affect parent's keyboard input
    - All of the child processes should terminate with Red (we can probably add a refinement to control forking, but meanwhile OS facilities (e.g. `start`) are enough for that)

--------------------------------------------------------------------------------

On 2020-05-13T06:33:00Z, qtxie, commented:
<https://github.com/red/red/issues/4241#issuecomment-627776920>

    Calling a console inside a console creates troubles. I'm not sure we can support it easily.

--------------------------------------------------------------------------------

On 2020-05-13T07:20:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4241#issuecomment-627798074>

    What in your opinion is causing the troubles?

--------------------------------------------------------------------------------

On 2020-05-13T09:12:38Z, qtxie, commented:
<https://github.com/red/red/issues/4241#issuecomment-627857530>

    Two red consoles are in the same windows console session. There are two ways to fix it:
    1. Each red console allocate a new console session. https://docs.microsoft.com/en-us/windows/console/allocconsole
    2. The first red console release the control of the session.

--------------------------------------------------------------------------------

On 2020-05-13T11:10:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4241#issuecomment-627913313>

    Understood. Thanks
    
    Well, since the first console continues running after the `call`, it shouldn't let child processes inherit it's own console handles (unless /wait is also specified)


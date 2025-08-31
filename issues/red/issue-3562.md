
#3562: Can't run Red from other programs
================================================================================
Issue is closed, was reported by maximvl and has 20 comment(s).
[status.resolved]
<https://github.com/red/red/issues/3562>

**Describe the bug**
When I try to execute Red from another program it fails with ```PROGRAM ERROR: Invalid encapsulated data.```

**To Reproduce**
Steps to reproduce the behavior:
1. Install Elixir
2. Clone https://gitlab.com/maxvel/reddish.git
3. In the repo run `iex -S mix`
4. In the REPL type
```
p = Reddish.start
Reddish.send_input(p, "5 + 5\n")
flush()
```

5. See message `{#PID<0.170.0>, :data, :out, "PROGRAM ERROR: Invalid encapsulated data.\n"}`
6. After this I can't even run Red as regular:
```
> red
PROGRAM ERROR: Invalid encapsulated data.
```
7. And in a new shell instance:
```
> red
** Script Error: Invalid compressed data - problem: -3
** Near: script: decapsulate 
if none? script
```

**Expected behavior**
`flush()` prints message with "10" returned by Red, Red is runnable.

**Screenshots**
![screenshot](https://i.imgur.com/LpGHVrT.png)

**Platform version(please complete the following information):**
```
Red 0.6.3 for Linux built 11-Oct-2018/3:00:23+02:00 commit #b1f01cc
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-12T09:31:20Z, 9214, commented:
<https://github.com/red/red/issues/3562#issuecomment-429265296>

    #543, #1547

--------------------------------------------------------------------------------

On 2018-10-12T09:51:27Z, maximvl, commented:
<https://github.com/red/red/issues/3562#issuecomment-429270989>

    I also tried to create a wrapper like this:
    ```
    #!/bin/bash
    red $@
    ```
    With it I don't get the error, but got no output either. From what I tried this works with `cat`, `bash` and `ipython`, but doesn't work with `python` (same no output). So it might be more than just fixing encapping.

--------------------------------------------------------------------------------

On 2018-10-19T19:19:03Z, dockimbel, commented:
<https://github.com/red/red/issues/3562#issuecomment-431470316>

    If you need only the Red interpreter, compile the CLI console and use that binary instead of `red.exe`.

--------------------------------------------------------------------------------

On 2018-10-20T10:51:11Z, x8x, commented:
<https://github.com/red/red/issues/3562#issuecomment-431569890>

    I work around this issue by wrapping the Red call into `sh` like this:
    ```sh
    sh -c "red -r code.red"
    ```
    I suspect a path issue in certain environment ~where the console called from red binary can't find the crush decompressor~ maybe not as in the example the toolchain is called not the console.., but haven't investigated further.
    
    Other example, given `%code.red`:
    ```
    Red []
    print 123
    ```
    Run a Red Console:
    ```
      o: "" call/output {red code.red} o print o
    ** Script Error: Invalid compressed data - problem: -3
    ** Near: script: decapsulate 
    if none? script
    
      o: "" call/output {sh -c "red code.red"} o print o
    123
    ```
    Wondering if it's a regression, must have had similar code working without wrapping long ago.
    
    Not really related.. we should really have something like `rebol --do "print 123"` for quickies.

--------------------------------------------------------------------------------

On 2019-05-23T02:55:54Z, beenotung, commented:
<https://github.com/red/red/issues/3562#issuecomment-495048500>

    I found similar bug on windows.
    I saved red as red.exe, and add the containing folder into PATH.
    I found it will raise below error when launch form cmd:
    ```
    PROGRAM ERROR: Invalid encapsulated data.
    ```
    
    ## below case will trigger error
    1. if the current directory is not containing red, and using `red` or `red.exe`
    2. if the current directory is not containing red, and using `..\local\bin\red`
    
    ## below case will not trigger error
    1. if the current directory is containing red, and using `red` or `red.exe`
    2. if the current directory is not containing red, and using `..\local\bin\red.exe` 

--------------------------------------------------------------------------------

On 2019-05-23T02:59:45Z, beenotung, commented:
<https://github.com/red/red/issues/3562#issuecomment-495049150>

    I tried the test cases with rebol-core and rebol-view, all the two cases trigger error for red do not trigger error for rebol.

--------------------------------------------------------------------------------

On 2019-05-23T17:13:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3562#issuecomment-495306079>

    Thanks for the note @beenotung.

--------------------------------------------------------------------------------

On 2020-07-06T13:21:35Z, pierstitus, commented:
<https://github.com/red/red/issues/3562#issuecomment-654233606>

    I get the same error when running from ipython3:
    
    ```
    Python 3.8.2 (default, Apr 27 2020, 15:53:34) 
    Type 'copyright', 'credits' or 'license' for more information
    IPython 7.13.0 -- An enhanced Interactive Python. Type '?' for help.
    
    In [1]: import subprocess
    
    In [2]: subprocess.run('./red-064')
    ** Script Error: Invalid compressed data - problem: -3
    ** Near: script: decapsulate 
    if none? script
    Out[2]: CompletedProcess(args='./red-064', returncode=0)
    ````
    
    Running from python3 gives a slightly different error:
    ```
    Python 3.8.2 (default, Apr 27 2020, 15:53:34) 
    [GCC 9.3.0] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import subprocess
    >>> subprocess.run('./red-064')
    ** Script Error: Not enough memory
    ** Near: script: decapsulate 
    if none? script
    CompletedProcess(args='./red-064', returncode=0)
    ```
    
    It doesn't matter what arguments are given, `subprocess.run(['./red-064','hello.red'])` or `subprocess.run(['./red-064','-V'])` give the same error. Compiled red programs do run normally.

--------------------------------------------------------------------------------

On 2021-02-26T12:09:55Z, endo64, commented:
<https://github.com/red/red/issues/3562#issuecomment-786609591>

    I just realized that, on Windows, if your `red.exe` is located in your `PATH`, you get `PROGRAM ERROR: Invalid encapsulated data.` if you execute `red.exe` in command prompt (`cmd.exe`), but it works if you use Powershell.
    
    And also the output speed is much faster on Powershell.

--------------------------------------------------------------------------------

On 2022-09-28T21:49:38Z, dockimbel, commented:
<https://github.com/red/red/issues/3562#issuecomment-1261500349>

    The Red binary is now separated in several binaries. The CLI console binary can be called from other languages if needed.


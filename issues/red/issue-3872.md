
#3872: Call/input not providing stdin for compiled executable under Windows 7
================================================================================
Issue is closed, was reported by loziniak and has 8 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3872>

Consider two scripts:
```
Red [File: %adapter.red]
#include %red-github/environment/console/CLI/input.red
arg-str: ask ""
print to binary! arg-str
```
and:
```
Red [File: %run.red]
out: copy ""
call/wait/input/output %adapter.exe "test" out
print "out" probe out
```
Compile the first one (`adapter.red`) with `-r` option, resulting in `adapter.exe` file.
Run second script (`run.red`).
`adapter.exe` crashes, because it gets no stdin piped into. The output from `run.red` is:
```
out
{^/*** Runtime Error 1: access violation^/*** at: 0041F70Dh^/}
```

Expected output is:
```
out
"#{74657374}^/"
```

(Compiled with `red-13may19-973dcd65.exe` downloaded from official downloads page)


Comments:
--------------------------------------------------------------------------------

On 2019-05-13T18:44:15Z, qtxie, commented:
<https://github.com/red/red/issues/3872#issuecomment-491939859>

    @loziniak Does it still crash with the latest Red version?

--------------------------------------------------------------------------------

On 2019-05-13T19:21:46Z, loziniak, commented:
<https://github.com/red/red/issues/3872#issuecomment-491952222>

    Yes, it crashes as well.

--------------------------------------------------------------------------------

On 2019-05-13T19:25:44Z, loziniak, commented:
<https://github.com/red/red/issues/3872#issuecomment-491953459>

    Now I realized, that this issue is about two problems:
    1. `call/input` not piping stdin for `adapter.exe`
    2. `adapter.exe` crashing when not getting stdin.
    
    I've created new issue about second problem (crash): #3874 , as it crashes under Linux as well. I'll change current issue's description and title, to focus on the first problem.

--------------------------------------------------------------------------------

On 2019-05-13T19:49:41Z, loziniak, commented:
<https://github.com/red/red/issues/3872#issuecomment-491961008>

    Everything executes OK, when we implement `adapter.red` using `read-stdin`:
    ```
    Red [File: %adapter_readstdin.red]
    #include %red-github/environment/console/CLI/input.red
    input: copy #{}
    until [
    	buff: copy #{}
    	read-stdin buff 10
    	append input buff
    	0 >= length? buff
    ]
    print input
    ```
    After compilation, the results are:
    ```
    >red-13may19-973dcd65.exe run.red
    out
    "#{7400650073007400}^/"
    ```
    So, most probably, the problem lays again in `ask ""`, not in `call/input`.


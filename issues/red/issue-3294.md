
#3294: Symantic Endpoint false positive on binary installer
================================================================================
Issue is closed, was reported by ocket8888 and has 14 comment(s).
[status.resolved] [type.AV]
<https://github.com/red/red/issues/3294>

### Expected behavior
For the program to install
### Actual behavior
Symantic Endpoint flagged it as a virus at multiple points during execution.
Output when run in an admin command prompt:
```rebol
Compiling Red GUI console...
*** Compilation Error: word text-box-layout not defined in system/view/platform/text-box-layout
*** in file: C:\ProgramData\Red\red-console.red
*** near: [
    system/view/platform/text-box-layout self
    system/view/platform/text-box-metrics self/state self 3
]
```
I was able to get a gui console running by cross-compiling from the Ubuntu subsystem (though the 32-bit binaries don't work through the subsystem itself, despite following the instructions on red-lang.org - file a separate issue?).
### Steps to reproduce the problem
1. Have x64 Windows 10 with Symantec Endpoint Protection
2. Attempt to run the red-063.exe binary
### Version (run `about` in the Red Console and paste the result here) also add OS version.
OS: Windows 10 Enterprise v1703 (build 15063.909)
about*: `Red 0.6.3 for Windows built 29-Mar-2018/17:56:26`

_*: From the cross-compiled GUI console obtained from github source_



Comments:
--------------------------------------------------------------------------------

On 2018-03-29T18:14:00Z, ocket8888, commented:
<https://github.com/red/red/issues/3294#issuecomment-377324940>

    Also, I was unable to cross-compile a console interpreter for Windows; it said `Compilation Error: Windows target requires View module ('Needs: View' in the header)`, which makes me think it's more of a limitation than an error. Is it true that I can't get a non-GUI interpreter for Windows - even through the Ubuntu subsystem?

--------------------------------------------------------------------------------

On 2018-03-29T20:49:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3294#issuecomment-377367875>

    @ocket8888, did you use `-t Windows` or `-t MSDOS`?

--------------------------------------------------------------------------------

On 2018-03-29T20:50:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3294#issuecomment-377368171>

    The team is also in the process of merging the new 0.6.4 GUI console code, so it could be related to that.

--------------------------------------------------------------------------------

On 2018-03-29T22:23:57Z, ocket8888, commented:
<https://github.com/red/red/issues/3294#issuecomment-377390869>

    well, the _working_ install is from source and the broken one is from the static binary hosted on red-lang.org. I used `-t Windows` to build the one that _works_, but as I said the broken one was using a static binary so I didn't specify a target; I just double-clicked and hoped for the best

--------------------------------------------------------------------------------

On 2018-03-30T06:12:01Z, dockimbel, commented:
<https://github.com/red/red/issues/3294#issuecomment-377454596>

    @qtxie Please have a look at this error.

--------------------------------------------------------------------------------

On 2019-09-05T17:09:10Z, dockimbel, commented:
<https://github.com/red/red/issues/3294#issuecomment-528479763>

    Cross-compilation of the non-GUI console from Ubuntu to Windows works fine using the latest `red` binary toolchain:
    ```
    dk@ubuntu:~/dk/red$ wget https://static.red-lang.org/dl/auto/linux/red-latest
    --2019-09-05 10:04:09--  https://static.red-lang.org/dl/auto/linux/red-latest
    Resolving static.red-lang.org (static.red-lang.org)... 35.190.28.0
    Connecting to static.red-lang.org (static.red-lang.org)|35.190.28.0|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1336288 (1.3M) [application/octet-stream]
    Saving to: ‘red-latest’
    
    red-latest                   100%[==============================================>]   1.27M   827KB/s    in 1.6s    
    
    2019-09-05 10:04:11 (827 KB/s) - ‘red-latest’ saved [1336288/1336288]
    
    dk@ubuntu:~/dk/red$ chmod +x red-latest 
    dk@ubuntu:~/dk/red$ ./red-latest -t MSDOS environment/console/CLI/console.red 
    
    -=== Red Compiler 0.6.4 ===- 
    
    Compiling /home/dk/dk/red/environment/console/CLI/console.red ...
    Compiling compression library...
    ...compilation time : 2241 ms
    
    Target: MSDOS 
    
    Compiling to native code...
    ...compilation time : 103253 ms
    ...linking time     : 1953 ms
    ...output file size : 818176 bytes
    ...output file      : /home/dk/dk/red/console.exe 
    ```

--------------------------------------------------------------------------------

On 2019-09-05T17:15:57Z, dockimbel, commented:
<https://github.com/red/red/issues/3294#issuecomment-528482384>

    Symantec seems to not flag the `red.exe` binary anymore, nor do others (using `red-05sep19-3d7b470f.exe`): https://www.virustotal.com/gui/file/bc79b8e7323067b0f324188f399c5b40a713c701da22bf2d11da56d76f53ac31/detection



#1772: Regression: Compiling R/S code with `-r` flag creates executables which do not run.
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1772>

See Gitter Chats ->
[April 1, 2016 9:45 AM](https://gitter.im/red/red?at=56fdf5ed11ea211749c3c016)
[April 1, 2016 10:04 AM](https://gitter.im/red/red?at=56fdfa45d9b73e635f6834e2)
[April 1, 2016 10:13 AM](https://gitter.im/red/red?at=56fdfc741720648112da41a1)

OR

nc-x: 

> Compiling an empty (or non-empty) R/S file (file contains appropriate header.) with -r (no-runtime) on windows compiles the executable but running it gives -
> Access is denied. in the command prompt.
> and it also gives https://files.gitter.im/red/red/H0br/Untitled.png
> Is it a bug or am I doing something wrong?

nc-x: 

> ```
> Red/System []
> "This is ..." 
> ```
> 
> `red -r -c a.reds` and running the resulting executable crashes with https://files.gitter.im/red/red/9rdk/Untitled.png

dockimbel:

> `-r` with empty R/S program used to work fine, so it's a regression.



Comments:
--------------------------------------------------------------------------------

On 2016-05-07T10:06:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1772#issuecomment-217625876>

    After having a deeper look at it, I remembered that even if you don't have a runtime, you still need to provide a few elements in order to generate a valid executable:
    1. At least one static allocation to avoid a data segment of size 0 (causing the crash)
    2. A call to a system exit function (on non-Windows systems, else it will segfault).
    
    So for the record, here is a minimal Red/System program which would compile without a runtime and run properly on Windows:
    
    ```
    Red/System []
    
    #import [
        "kernel32.dll" stdcall [
            quit: "ExitProcess" [code [integer!]]
        ]
    ]
    
    ret: 0
    quit ret
    ```
    
    Works fine on Windows 7, untested on other versions.


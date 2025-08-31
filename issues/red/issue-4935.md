
#4935: CRASH when using `context?` (GC bug)
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4935>

This is enough to reproduce the crash:
```red
f: func [arg][p: 'arg]
f 1
f: none
recycle
context? p ;<--- will CRASH!!
```
Meanwhile, I think, that inaccessible context (as in the example above) should not be reported from `context?`.
My reason was mentioned here: https://gitter.im/red/bugs?at=60f8be0e1a1db149e9d4c622


Comments:
--------------------------------------------------------------------------------

On 2021-07-23T16:29:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4935#issuecomment-885756794>

    I cannot write a regression test for this issue as the crash only happens when the code is run from the GUI console (does not even work if script is run from command-line...). I suppose that the GUI console once started produces enough values to be GCed that trigger the `f` context corruption that results in a crash.
    
    Anyway, thanks a lot to @Oldes for reporting that issue that revealed a missing marking case in the GC! 👍 

--------------------------------------------------------------------------------

On 2021-07-24T00:58:46Z, PeterWAWood, commented:
<https://github.com/red/red/issues/4935#issuecomment-885978281>

    @dockimbel I used to run the Red tests on macOS in the console by using Apple's scripting facilities. The tests could be run in the GUI console on Windows using PyWinAuto. (There are no doubt many paid tools that could do so too.)
    
    Could the console be built with the testing backend to perfom these type of tests?



#2723: Slow `print` from pure Red/System compiled app on Windows
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[status.built] [type.review] [status.contribution]
<https://github.com/red/red/issues/2723>

Using `print` functions in Red/System compiled code is like 10x slower than output from `.red` code as there is no output buffer involved and used `putchar` is slow in Windows Console.


Comments:
--------------------------------------------------------------------------------

On 2017-05-30T15:23:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2723#issuecomment-304913654>

    How is that a problem? Having to handle the flushing of the buffer manually would create new problems we don't have right now. Moreover, the Red buffering on print is the cause of many unsolved issues so far, because the flushing cannot always be done at the right time.

--------------------------------------------------------------------------------

On 2017-05-31T15:41:42Z, Oldes, commented:
<https://github.com/red/red/issues/2723#issuecomment-305228170>

    Actually I'm not aware about any issues with current buffering... if you mean the problem with `prin` followed with `ask` than it is not because of any buffering, but because internal input implementation is forcing screen cleanup and also always sets position of the cursor on 0 (+prompt size).
    
    Anyway.. I made experiments with buffering in R/S only and as the buffer is flushed after each `prin`, and usual user scenario is using multiple prints, the speed up is not so significant - used when parsing (and printing) tags in my SWF parser with large file I had something like 5s with buffering and 6.7s with current version. So I'm quite not sure if I should use it or not.

--------------------------------------------------------------------------------

On 2017-06-01T14:30:10Z, Oldes, commented:
<https://github.com/red/red/issues/2723#issuecomment-305510908>

    Btw... the output in GUI console is awesome.. where printing in cli version needs 10s, in gui-console it is in 0.15s. The CLI version could be probably optimized by not using print for each value, but with intermediate c-string which would be printed in one call.

--------------------------------------------------------------------------------

On 2019-09-06T09:27:49Z, qtxie, commented:
<https://github.com/red/red/issues/2723#issuecomment-528783222>

    @Oldes IIRC, you added the buffer in CLI console. Are we Ok to close it?

--------------------------------------------------------------------------------

On 2019-10-15T23:53:01Z, endo64, commented:
<https://github.com/red/red/issues/2723#issuecomment-542451268>

    Are we good to close this? Printing from Red/System compiled app looks fast enough on my test on Win10.


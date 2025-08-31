
#2753: Output doesn't work in a loop that runs forever in the Windows GUI console
================================================================================
Issue is closed, was reported by nd9600 and has 6 comment(s).
[status.deferred] [status.reviewed]
<https://github.com/red/red/issues/2753>

Nothing is output in the Windows GUI console when commands like 
`forever [print 0]` 
or 
`i: 0 while [i < 10] [print i]`
 are ran, while a command like
`i: 0 while [i < 10] [print i i: add i 1]`
prints out the numbers 0 to 9, as expected.

This isn't a problem with the Windows CLI console - both of the two commands at the top print 0, forever.

I don't know if the same problem exists with input, as I can't really test it if output doesn't work.



Comments:
--------------------------------------------------------------------------------

On 2017-06-05T03:01:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2753#issuecomment-306092309>

    This is fixed in the new console engine which will be released in 0.6.4. In the meantime, you can insert a call to `do-events/no-wait` after `print` if you need to see the output from an infinite loop. ;-)

--------------------------------------------------------------------------------

On 2017-07-30T08:26:37Z, fvanzeveren, commented:
<https://github.com/red/red/issues/2753#issuecomment-318886751>

    Hi dockimbel
    
    Why did you mention to add the `do-events/no-wait` **after** the `print `statement?
    I tried to put this statement at the top of the forever block and it just works fine.
    ```
    i: 1
    forever [
        do-events/no-wait 
        print "stoppez-moi !!!"
        print i    
        i: add i 1
    ]
    ```
    Note: it is impossible to stop the execution with the ESC key (in rebol, you can). Is it normal behaviour?
    
    Thank you
    
    François

--------------------------------------------------------------------------------

On 2017-07-30T13:28:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2753#issuecomment-318901956>

    @fvanzeveren Because `print` generates GUI events, so it is logical to put `do-events` call *after* that to process those events. As you loop, even if you fail to put it after, next loop will run it anyway. Though, strictly speaking the last `print` will not show up as one `do-events` will be missing on exit. But in practice, you are saved by the GUI console, which will process the extra events for you.
    
    > Note: it is impossible to stop the execution with the ESC key (in rebol, you can). Is it normal behaviour?
    
    That feature is not implemented yet, it should be there in the next release.



#232: Simple Error Trapping Method
================================================================================
Issue is closed, was reported by PeterWAWood and has 10 comment(s).
[status.dismissed] [type.wish] [Red/System]
<https://github.com/red/red/issues/232>

Is it possible to add a simple error trapping mechanism to Red/System?

I was thinking of something like PL/1's ON ERROR block, a single block that is activated for all errors and gets the same information as is printed in the current runtime errors via a standard structure.

Something like this:

``` rebol
on-error: func [
  error    [struct! [
     number   [integer!]
     location  [pointer! [byte!]]
     ..
     ..
  ]
][

  if my-tracking-ctx/updating-database? [
    print ["The program encountered a fatal error when writing to the database." lf]
    print["Please restore the database before trying to run the program again" lf]
  ]

  exit 16
]
```



Comments:
--------------------------------------------------------------------------------

On 2012-08-12T16:48:44Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/232#issuecomment-7677465>

    That would be nice, but in Red/System, it would remain rather limited. Red/System has no knowledge of the semantics of library calls, so checking those will be the domain of the higher level Red. The errors that Red/System checks for are typically system signals. You can already divert those with the on-signal and on-quit functions in the C library binding. You could extend it into your own error handler by using the signal function to send signals to yourself.
    
    Maybe it would be worth it to formalise such a framework in the language to integrate it better and make it independent from a C library.

--------------------------------------------------------------------------------

On 2012-08-12T19:13:08Z, dockimbel, commented:
<https://github.com/red/red/issues/232#issuecomment-7678837>

    I agree with Kaj's comment.
    
    The application crashing errors are already caught by the Red/System runtime to display a message (with source file name and error line number in debug mode). It could be possible to resume execution with a user-provided `on-error` handler but, as such crashes can mess up memory and execution stack, it would be unsafe. The best thing to do currently is to let it crash, provide minimal information for the crash, and exit nicely and asap. On this aspect, Red/System is already doing better than C programs, that need external tool (IDE, gdb,...) for retrieving the location of the error in the source code, while Red/System programs are able to do that themselves (when compiled in debug mode).
    
    Red will be able to avoid those system crashes by catching dangerous cases earlier (e.g. division by zero) in the same way REBOL does.

--------------------------------------------------------------------------------

On 2012-08-12T23:23:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/232#issuecomment-7680951>

    I wasn't thinking in terms of resuming execution following an error, just a means to crash gracefully. Closing files, closing connections, etc.
    
    On reflection, I guess that it will be easy enough to achieve with a simple Red wrapper:
    
    ``` rebol
        if error? try [
            #include %my-program.reds
        ][
            crash-nicely
        ]
    ```
    
    Though it would be a great feature for smaller environments that won't be able to run Red.

--------------------------------------------------------------------------------

On 2012-08-13T05:56:53Z, dockimbel, commented:
<https://github.com/red/red/issues/232#issuecomment-7683952>

    Right, you should be able to do that in Red. From Red/System, as Kaj said, you can use the `on-quit` C wrapper right now. For a Red/System native solution (independent from C lib), I need to investigate how it could be implemented.

--------------------------------------------------------------------------------

On 2012-10-25T11:07:51Z, dockimbel, commented:
<https://github.com/red/red/issues/232#issuecomment-9773709>

    For Red, there's no problem catching errors in a controlled manner, TRY and ERROR? are part of the functions that will be built in Red. For Red/System, it is just impossible to provide any reliable error catching mechanism as stack and memory corruption can occur before a "catchable" error happens. The current runtime error catching built in Red/System is just there to provide debugging info...when the crash is not too severe. So, this wish is dismissed.



#2463: Compiling code in debug mode (`-d`) does not work unless release mode (`-r`) is used 
================================================================================
Issue is closed, was reported by ghost and has 6 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/2463>

Debug mode (`-d`) only works in release mode.

When using libred, it produces a normal executable without any debugging code.

Either this is an intended side-effect of libredRT and needs to be documented at the time of 0.6.2 release
*or*  
This is a an unintended side-effect of libredRT (bug) and needs to be fixed.


Comments:
--------------------------------------------------------------------------------

On 2017-03-10T10:07:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2463#issuecomment-285629239>

    The debug mode works fine without having to use release mode (regardless how libRedRT is compiled):
    ```
    Red [file: %debug.red]
    
    #system [
        probe #either debug? = yes ["debug mode"]["normal mode"]
    ]
    
    > red -c -d debug.red
    > debug
    debug mode
    ```
    
    If you need a debugging version of libRedRT, then you need to refresh it with `-d` mode on:
    ```
    > red clear
    > red -c -d debug.red
    ```
    So you can have "release libRedRT" or "debug libRedRT" with your own code in release or debug mode. That gives you 4 possible combinations depending on what/how you want to debug.

--------------------------------------------------------------------------------

On 2017-03-10T10:27:53Z, ghost, commented:
<https://github.com/red/red/issues/2463#issuecomment-285633741>

    Okay, it is due to `release libRedRT` and `debug libRedRT` -
      
    I took a piece of code from one of the open issues on github and -
    ` red -c -d test.red` gives only
    ```
    *** Runtime Error 1: access violation
    *** at: 100853A7h
    ```
    whereas 
    ```
    red clear
    red -c -d test.red
    ```
    gives the expected stack trace.
      
    **Only the second output is expected and not the first one. This is gonna be plain confusing.**
      
    As I have commented over here https://github.com/red/red/issues/2371, I would prefer to have the `libRedRT-<some_hash>.dll` file in the standard folder. And along with that, I would now prefer to have another `libRedRT-debug-<some_hash>.dll` file present in that folder. Then the compiler should link to the `libRedRT-debug-<some_hash>.dll` when `-d` is passed. And only when R/S code is present in the program, the libRedRT.dll and/or libRedRT-debug.dll should be rebuilt, locally in the folder of the project. 
    (Right now, it is too confusing, and also libredrt.dll is built everywhere if you have multiple projects even when they don't have any R/S code.)
    This is gonna bite a lot of people, so I highly suggest doing the above said thing, or if there is any better alternative, then that needs to be done. Because, I don't really see any advantage to `That gives you 4 possible combinations depending on what/how you want to debug.`

--------------------------------------------------------------------------------

On 2019-09-11T16:17:01Z, dockimbel, commented:
<https://github.com/red/red/issues/2463#issuecomment-530454358>

    > I took a piece of code from one of the open issues on github and -
    
    But you didn't say which one, so we cannot reproduce, nor say much about your results...
    
    For your proposition, it's doable, but that's significant work that I doubt we can afford until 1.0, given how many other higher-priority tasks we have.
    
    I deferred it to 0.9.x, when we'll make the final decisions about the features we should have in 1.0.


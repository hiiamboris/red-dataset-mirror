
#2239: Wish: console clear within script
================================================================================
Issue is open, was reported by Rebol2Red and has 14 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2239>

Console can be cleared with ctrl-L but i want it to be cleared within a script like cls or clearscreen in other programming languages.



Comments:
--------------------------------------------------------------------------------

On 2016-09-27T19:12:36Z, iArnold, commented:
<https://github.com/red/red/issues/2239#issuecomment-249967496>

    < just a hint >
    < Look in environment/console/terminal.reds for RS_KEY_CTRL_L see what it does (line 1325) >

--------------------------------------------------------------------------------

On 2016-09-27T20:47:42Z, geekyi, commented:
<https://github.com/red/red/issues/2239#issuecomment-249993613>

    From [this commit?](https://github.com/red/red/commit/6afc3fb001ff24ffe08f635e3847c95c152e108f)
    What I see is this:
    
    ```
    RS_KEY_CTRL_L [
       reset-vt vt
       emit-char vt -1 no
    ]
    ```
    
    I see `reset-vt` function is inside `terminal`, so I tried (to no avail):
    
    ```
    system/console/terminal
    system/terminal
    terminal
    ```
    
    I don't think I'm doing anything particularly wrong here, but _I'm not that familiar with `context`_
    
    Whatever the case, I can't seem to access `terminal`
    
    Looking at environment/console/gui-console.red:
    
    ```
       21  
       22  #system [
       23:  #include %terminal.reds
       24  ]
    ```
    
    So does the `#system` directive hide it?
    Perhaps I only need to `#include %terminal.reds`?
    
    ### Alternatively
    
    I could copy and paste the code for `reset-vt`, but might need the rest of the `terminal` object?

--------------------------------------------------------------------------------

On 2016-09-27T20:52:17Z, iArnold, commented:
<https://github.com/red/red/issues/2239#issuecomment-249994899>

    It is Red/System code. Are the two accounts Rebol2Red and Geekyi for the same person?

--------------------------------------------------------------------------------

On 2016-09-27T21:47:52Z, geekyi, commented:
<https://github.com/red/red/issues/2239#issuecomment-250009131>

    @iArnold Hehe no, I was curious. Perhaps it is time I learned a bit of Red/System though

--------------------------------------------------------------------------------

On 2016-09-28T11:29:40Z, Rebol2Red, commented:
<https://github.com/red/red/issues/2239#issuecomment-250141366>

    I would like to clear the screen within a script not before or after a script has been executed
    - Not using Red/System ( because my knowledge about this is not sufficient )
    - Not after compiling a script ( because compiling time is way too long )
      but with a keycode or another statement
    
    In other languages these statements are called cls or clearscreen.
    (I must admit the programs are being compiled and not interpreted)

--------------------------------------------------------------------------------

On 2019-09-23T15:32:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/2239#issuecomment-534153787>

    @Rebol2Red 
    for the GUI console: `cls: does [gui-console-ctx/terminal/clean  show gui-console-ctx/win  ()]`
    CLI console buffer is (obviously) outside of the Red's reach and can only be cleared with TERM commands which are not widely supported on Windows, and even in W10 may require some setup.

--------------------------------------------------------------------------------

On 2019-09-23T15:49:55Z, meijeru, commented:
<https://github.com/red/red/issues/2239#issuecomment-534161468>

    @hiiamboris Tried your `cls` function in the console itself. It leaves one line at the top which says `>> cls`. But from a program it will work I suppose.


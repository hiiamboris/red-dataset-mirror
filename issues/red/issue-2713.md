
#2713: macOS/Interpreter: Crash with help in script
================================================================================
Issue is closed, was reported by x8x and has 16 comment(s).
<https://github.com/red/red/issues/2713>

File `%test`:
```
Red []

help system/script
```
Run:
```
  # red test

*** Runtime Error 27: non-existent physical address
*** at: A17340E4h
```


Comments:
--------------------------------------------------------------------------------

On 2017-05-26T21:20:24Z, greggirwin, commented:
<https://github.com/red/red/issues/2713#issuecomment-304390665>

    Works on Windows in GUI console, but produces the same error with CLI.
    
    ```
    *** Runtime Error 1: access violation
    *** at: 76B6ABA6h
    ```

--------------------------------------------------------------------------------

On 2017-05-26T21:22:35Z, greggirwin, commented:
<https://github.com/red/red/issues/2713#issuecomment-304391040>

    Happens for any object, not just `system/script`.

--------------------------------------------------------------------------------

On 2017-05-26T21:35:42Z, greggirwin, commented:
<https://github.com/red/red/issues/2713#issuecomment-304393138>

    It looks like `system/console/size/x` is `0` when this happens, so the dynamic calc for the help width goes negative and blows up. Looks like `mold/flat/part` doesn't like the negative `/part` arg, but I haven't duped it in a simple case yet.

--------------------------------------------------------------------------------

On 2017-05-26T21:43:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2713#issuecomment-304394386>

    Next clue here is that the `/part` arg has to be -4 or less to trigger the problem in the `help` code.

--------------------------------------------------------------------------------

On 2017-05-26T22:09:34Z, greggirwin, commented:
<https://github.com/red/red/issues/2713#issuecomment-304398272>

    I'm fixing help, so it won't cause this problem, but still can't narrow it down outside of that.

--------------------------------------------------------------------------------

On 2017-10-22T00:02:05Z, x8x, commented:
<https://github.com/red/red/issues/2713#issuecomment-338440937>

    Now it doesn't crash anymore, thought, it returns:
    ```red
         title   none!         ...
         header  none!         ...
         parent  none!         ...
         path    none!         ...
         args    string!       ...
    ```
    while running `help system/script` directly inside the interpreter returns:
    ```red
      help system/script
         title   none!         none
         header  none!         none
         parent  none!         none
         path    none!         none
         args    none!         none
    ```
    not sure if it's an issue or this can be closed.

--------------------------------------------------------------------------------

On 2018-07-29T12:41:18Z, x8x, commented:
<https://github.com/red/red/issues/2713#issuecomment-408675269>

    @greggirwin Just rechecked this, fell free to close this if behaviour per my last comment is expected.

--------------------------------------------------------------------------------

On 2018-07-29T17:40:53Z, greggirwin, commented:
<https://github.com/red/red/issues/2713#issuecomment-408693443>

    `Help` is meant to be used interactively, but there is now `help-string` which is usable in scripts. But you do still need to compile with the console or help environment code included. *However* the help support funcs do currently depend on the console object being there. I'll make a note to address that. 
    
    I'll close this and make that a new ticket.


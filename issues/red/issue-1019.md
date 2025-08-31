
#1019: Can not build curses examples
================================================================================
Issue is closed, was reported by bitbegin and has 20 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/1019>

λ red-26jan15-3d48d15.exe system\library\curses\examples\curses-example.reds
Pre-compiling Red console...
**\* Script error: invalid function definition: compare
**\* Where: make-hexa



Comments:
--------------------------------------------------------------------------------

On 2015-01-26T15:13:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1019#issuecomment-71475304>

    By default, the `red` binary will try to run directly the argument script using the interpreter. Red/System code cannot be run by the interpreter that would require a JIT-compiler that will only come in Red 2.0 ;-).
    
    In order to compile the argument script, you just need to use the `-c` option.

--------------------------------------------------------------------------------

On 2015-01-26T15:20:00Z, bitbegin, commented:
<https://github.com/red/red/issues/1019#issuecomment-71476389>

    λ ared-26jan15-3d48d15.exe system/library/curses/examples/curses-example.reds -c
    Pre-compiling Red console...
    **\* Script error: invalid function definition: compare
    **\* Where: make-hexa

--------------------------------------------------------------------------------

On 2015-01-26T15:23:23Z, dockimbel, commented:
<https://github.com/red/red/issues/1019#issuecomment-71476912>

    Options come first, see the [README](https://github.com/red/red) or just type `red -h` on command line to see the syntax.
    
    So, it should be:
    
    ```
    red-26jan15-3d48d15.exe -c system/library/curses/examples/curses-example.reds
    ```
    
    Also, you can get real time help through the Stackoverflow [chat group](chat.stackoverflow.com/rooms/291/rebol-and-red) if you have a Stackoverflow account with at least 20 rep. points.

--------------------------------------------------------------------------------

On 2015-01-26T15:25:12Z, bitbegin, commented:
<https://github.com/red/red/issues/1019#issuecomment-71477224>

    λ red-26jan15-3d48d15.exe -c system/library/curses/examples/curses-example.reds
    
    -=== Red Compiler 0.5.0 ===-
    
    Compiling /E/work/github/red/system/library/curses/examples/curses-example.reds ...
    
    Compiling to native code...
    **\* Syntax Error: Missing matching ]
    **\* line: 371
    **\* at: "[^/ #L 30 ^-;-----------------------------"

--------------------------------------------------------------------------------

On 2015-01-26T15:28:34Z, bitbegin, commented:
<https://github.com/red/red/issues/1019#issuecomment-71477873>

    λ red--26jan15-3d48d15.exe -c system/library/curses/examples/panel-example.reds
    
    -=== Red Compiler 0.5.0 ===-
    
    Compiling /E/work/github/red/system/library/curses/examples/panel-example.reds ...
    
    Compiling to native code...
    **\* Syntax Error: Missing matching ]
    **\* line: 40
    **\* at: {[
     #L 31 ^-wid: 0
     #L 32 ^-;--------------}

--------------------------------------------------------------------------------

On 2015-01-26T15:30:40Z, dockimbel, commented:
<https://github.com/red/red/issues/1019#issuecomment-71478236>

    No luck, it seems we have a regression on that library...looking at it...

--------------------------------------------------------------------------------

On 2015-01-26T15:38:16Z, dockimbel, commented:
<https://github.com/red/red/issues/1019#issuecomment-71479626>

    Issue fixed. You can now compile the curses example and run it if you have the pdcurses 3.4 or higher library installed. 

--------------------------------------------------------------------------------

On 2015-01-26T16:12:29Z, bitbegin, commented:
<https://github.com/red/red/issues/1019#issuecomment-71485990>

    1. Not Support unicode?
       
       谀 Window 1 哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪?
       ?T谀 Window 2 哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪?
       ? ?T谀 Window 3 哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪?
       ?T? ?T谀 Window 4 哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪?
       ?U?T? ?T谀 Window 5 哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪?
       ?U?U?T? ?The Red/System panel Show                           ?
       ? ?U?U?T?                                                    ?
       ?C? ?U?U?Tab to browse through windows                       ?
       滥某 C? ?U?Use arrow keys to move                              ?
         滥某 C? ?Use Ctrl+arrow keys to resize                       ?
            滥某 C?                                                    ?
               滥某 Ctrl+Q to exit                                      ?
                  滥哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪?
    2. λ red-26jan15-48c5719.exe -c system/library/curses/examples/curses-example.reds
    
    -=== Red Compiler 0.5.0 ===-
    
    Compiling /E/work/github/red/system/library/curses/examples/curses-example.reds ...
    
    Compiling to native code...
    **\* Syntax Error: Missing matching ]
    **\* line: 371
    **\* at: "[^/ #L 30 ^-;-----------------------------"

--------------------------------------------------------------------------------

On 2015-01-26T16:27:05Z, dockimbel, commented:
<https://github.com/red/red/issues/1019#issuecomment-71488629>

    Issue fixed. 
    
    For the display, I am not sure if pdcurses supports Unicode. Anyway, it's possible to make it work by switching to a US codepage using `chcp 437`, then you can switch back to Chinese simplified using `chcp 936`.
    
    EDIT: after checking pdcurses does [support](http://pdcurses.sourceforge.net/doc/PDCurses.txt) Unicode using a UCS-2 encoding, so it might rather be an issue with DOS console not processing it correctly.

--------------------------------------------------------------------------------

On 2015-01-26T23:54:59Z, qtxie, commented:
<https://github.com/red/red/issues/1019#issuecomment-71564038>

    @bitbegin I'm using `pdc32dllw.zip` from here: http://sourceforge.net/projects/pdcurses/files/pdcurses/3.4/
    It works. :)
    
    ```
      ┌─ Window 1 ───────────────────────────────
      │ T┌─ Window 2 ─────────────────────────────
      │  │ T┌─ Window 3 ───────────────────────────
      │ T│  │ T┌─ Window 4 ─────────────────────────
      │ U│ T│  │ T┌─ Window 5 ───────────────────────
      │ U│ U│ T│  │ The Red/System panel Show                           │
      │  │ U│ U│ T│                                                     │
      │ C│  │ U│ U│ Tab to browse through windows                       │
      └──│ C│  │ U│ Use arrow keys to move                              │
         └──│ C│  │ Use Ctrl+arrow keys to resize                       │
            └──│ C│                                                     │
               └──│ Ctrl+Q to exit                                      │
                  └───────────────────────────────
    ```


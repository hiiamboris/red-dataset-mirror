
#4032: Can't find how to clear Red Cli 
================================================================================
Issue is closed, was reported by lepinekong and has 6 comment(s).
<https://github.com/red/red/issues/4032>

Ctrl+L works in Red GUI Console not in Cli console and I can't find info anywhere


Comments:
--------------------------------------------------------------------------------

On 2019-09-15T08:20:17Z, 9214, commented:
<https://github.com/red/red/issues/4032#issuecomment-531545283>

    Please use dedicated [chat room](https://gitter.im/red/help) for asking questions, and keep issue tracker for bug reports only.
    
    [ANSI escape sequence](https://en.wikipedia.org/wiki/ANSI_escape_code) for clearing terminal screen is:
    ```red
    prin "^[[2J"
    ```

--------------------------------------------------------------------------------

On 2019-09-15T20:16:25Z, endo64, commented:
<https://github.com/red/red/issues/4032#issuecomment-531595825>

    @lepinekong You can also use below function for CLI:
    
    ```
    cls: func [][
        unless system/console/gui? [
            call/console pick ["cls" "clear"] 'Windows = system/platform
        ]
        prin ""
    ]
    ```
    
    But as @9214 said better to ask questions on gitter or stackoverflow.

--------------------------------------------------------------------------------

On 2019-09-16T00:02:16Z, greggirwin, commented:
<https://github.com/red/red/issues/4032#issuecomment-531610959>

    @lepinekong please find or create a good wiki page for the answers here, and add them. Thanks!


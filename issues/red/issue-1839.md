
#1839: red-22apr16-930d811 word INPUT not recognized by compiler
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1839>

**\* Compilation Error: undefined word input
**\* in file: %/E/Websites/Red-by-Example/auto/test.red
**\* near: [input "Enter something ... " print ["You entered: " x] quit]



Comments:
--------------------------------------------------------------------------------

On 2016-04-22T10:16:26Z, dockimbel, commented:
<https://github.com/red/red/issues/1839#issuecomment-213368200>

    `input` is currently only defined for console, so you need to include the %input.red file manually if you compile your code. This is temporary until we gets ports and full I/O in 0.7.0.
    
    ```
    #include %environment/console/input.red
    ```


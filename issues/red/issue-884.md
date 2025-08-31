
#884: header case sensitive to compiler
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/884>

To the interpreter, the `Red` header is not case sensitive, but to the compiler `Red` and `Red/System` both are. So for each of the following headers, the compiler throws `*** Syntax Error: Invalid Red program`:

red []
RED []
ReD []
red/system []
RED/SYSTEM []
Red/system []
red/System []



Comments:
--------------------------------------------------------------------------------

On 2014-07-15T04:25:58Z, dockimbel, commented:
<https://github.com/red/red/issues/884#issuecomment-48989255>

    Now the console will do a case-sensitive `Red` header checking.

--------------------------------------------------------------------------------

On 2016-09-29T06:23:07Z, rebolek, commented:
<https://github.com/red/red/issues/884#issuecomment-250380821>

    @dockimbel This bug should be reopened. The title says **"header case sensitive to compiler"** and that’s still true.
    
    Example:
    
    ```
    Red/system []
    print "1"
    ```
    
    Output:
    
    ```
    *** Syntax Error: Invalid Red program
    *** line: 1
    *** at: {/system []
    ```


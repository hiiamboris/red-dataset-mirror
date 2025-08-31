
#68: implicit type casting allowed for math-ops between pointer types and bytes 
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/68>

In the title, pointer types stands for [c-string! pointer!  struct!]. The same implicit type conversion is not allowed for assignment. This extension may be deliberate, but is it really? Bytes are too short to be pointers.



Comments:
--------------------------------------------------------------------------------

On 2011-06-01T13:33:18Z, dockimbel, commented:
<https://github.com/red/red/issues/68#issuecomment-1274314>

    Agreed. Implicit type casting shouldn't happen for pointers with a type that are not of the same memory size.

--------------------------------------------------------------------------------

On 2011-06-01T16:27:25Z, dockimbel, commented:
<https://github.com/red/red/issues/68#issuecomment-1275448>

    A new compilation error will prevent such implicit casting.
    
    The following code will raise a compilation error: 
    
    ```
    p: pointer [integer!]
    p: p + #"0"
    ```
    
    This one will compile:
    
    ```
    p: pointer [integer!]
    p: p + as integer! #"0"
    ```
    
    Tested OK.


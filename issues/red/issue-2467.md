
#2467: Doc-string in #import function without return value fails compilation 
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2467>

Although it is not [in current documentation](http://static.red-lang.org/red-system-specs.html#section-15.1), it looks that a few years ago it was possible to use string inside function imports, like [here](https://github.com/ldci/glfw-red/blob/master/glfw.reds#L320)

Now it is not supported. I understand, that in Red/System code the doc string is without any meaning, but as *code is data* in Red, the same code for `#import` may be used later for FFI definitions, where the doc string could be used for help.

Also string for each argument should be accepted to be consistent with function definitions.


Comments:
--------------------------------------------------------------------------------

On 2017-03-07T11:11:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2467#issuecomment-284692475>

    I cannot reproduce the issue, the following code compiles fine:
    ```
    Red []
    
    #system [
        #import [
            "kernel32.dll" stdcall [
                AllocConsole: "AllocConsole" [
                    "This is a docstring!"
                    return: [logic!]
                ]
            ]
        ]
        AllocConsole
    ]
    ```

--------------------------------------------------------------------------------

On 2017-03-07T11:40:38Z, Oldes, commented:
<https://github.com/red/red/issues/2467#issuecomment-284698666>

    @dockimbel your code compiles, but I'm not sure if it would work... check this line:
    https://github.com/red/red/blob/master/system/compiler.r#L1560
    
    And try some code with no return, but doc string.. like [this](https://github.com/ldci/glfw-red/blob/master/glfw.reds#L324-L326)

--------------------------------------------------------------------------------

On 2017-03-07T11:42:45Z, Oldes, commented:
<https://github.com/red/red/issues/2467#issuecomment-284699043>

    Ah... your code would work.. as there is used `clear-docstrings` when there is more values in the spec block.. so only the case with no return fails.

--------------------------------------------------------------------------------

On 2017-03-07T12:07:50Z, Oldes, commented:
<https://github.com/red/red/issues/2467#issuecomment-284704085>

    @dockimbel easy fix is to move `clear-docstrings` from [this line](https://github.com/red/red/blob/master/system/compiler.r#L1572) before the `either` execution.

--------------------------------------------------------------------------------

On 2017-03-07T12:11:13Z, Oldes, commented:
<https://github.com/red/red/issues/2467#issuecomment-284704767>

    And sorry.. I should test the issue more deeply to find, that the issue is only with this one special import case. With the change mentioned above I can compile GLFW examples without code change (except the path to DLL)


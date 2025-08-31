
#215: #define has trouble with newline 
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.resolved]
<https://github.com/red/red/issues/215>

If there is a newline between the identifier and the defined text, any usage of the defined identifier will be substituted by the text followed by newline and #L. This #L will then give rise to a compilation error: "compiler directives are not allowed in code blocks".
Try this program:

```
Red/System []
define one
 1
a: one
```



Comments:
--------------------------------------------------------------------------------

On 2012-03-17T17:32:18Z, dockimbel, commented:
<https://github.com/red/red/issues/215#issuecomment-4555597>

    Good catch!

--------------------------------------------------------------------------------

On 2012-05-10T16:12:35Z, dockimbel, commented:
<https://github.com/red/red/issues/215#issuecomment-5629420>

    There is no simple and fully reliable way to fix this, but there is a workaround, just use square brackets when you need to have a defined text with multiple lines. So this code compiles correctly:
    
    ```
    Red/System []
    
    #define one [
        1
    ]
    a: one
    ```


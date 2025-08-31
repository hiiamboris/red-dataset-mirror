
#2546: Calling "cmd dir" hangs the GUI console
================================================================================
Issue is closed, was reported by pekr and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2546>

Experimenting with the CALL, the following code hangs the Red GUI console:

buffer: "" call/output "cmd dir" buffer


Comments:
--------------------------------------------------------------------------------

On 2017-04-06T14:03:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2546#issuecomment-292184175>

    Works fine on Win7 64 bit.  Moreover:
    
    * Why call `cmd`, when you have `/shell` refinement?
    * `cmd` takes some [options](https://technet.microsoft.com/en-us/library/cc771320(v=ws.11).aspx) to work properly.

--------------------------------------------------------------------------------

On 2017-04-06T14:23:50Z, pekr, commented:
<https://github.com/red/red/issues/2546#issuecomment-292190306>

    Well, it does not work under Win 10. I admit the code might not make much sense, but I would not expect that particular code to hang the process ...
    
    The reason why I tried to get "whater that works", is because I am getting this (which is unrelated to this ticket):
    
    >> buffer: copy "" call/output "dir" buffer
    *** Access Error: invalid UTF-8 encoding: #{FF393631}
    *** Where: call



#3354: Wallet code uses diverging macro definitions for HIWORD and LOWORD
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
<https://github.com/red/red/issues/3354>

### Expected behavior

Once a useful macro has been defined, other code should use it as is, or define another one with a different name.

### Actual behavior

In the wallet folder:

    #define LOWORD(param) (param and FFFFh << 16 >> 16)
    #define HIWORD(param) (param >> 16)

In Red toolchain:

    #define LOWORD(int) (int and FFFFh)
    #define HIWORD(int) (int >>> 16)

These are not identical.
### Steps to reproduce the problem

There may not yet be a problem, but confusion and difficult to detect errors seem possible.



Comments:
--------------------------------------------------------------------------------

On 2018-04-29T13:32:39Z, dockimbel, commented:
<https://github.com/red/red/issues/3354#issuecomment-385251779>

    That's a wallet issue, not a Red issue.

--------------------------------------------------------------------------------

On 2018-04-29T19:35:38Z, meijeru, commented:
<https://github.com/red/red/issues/3354#issuecomment-385275620>

    Depending on which formulation of the HIWORD/LOWORD definitions is considered better/more appropriate. And in any case, compilation of the wallet code gives a compiler warning (duplicate definition). 

--------------------------------------------------------------------------------

On 2018-05-10T03:18:07Z, qtxie, commented:
<https://github.com/red/red/issues/3354#issuecomment-387939799>

    The code in wallet has been changed now.

--------------------------------------------------------------------------------

On 2018-05-13T21:01:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3354#issuecomment-388655688>

    @meijeru they were renamed in the wallet:
    ```
    	;--extract the short type data from integer!
    	#define HID_LOWORD(param) (param and FFFFh << 16 >> 16)
    	#define HID_HIWORD(param) (param >> 16)
    ```


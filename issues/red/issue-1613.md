
#1613: `to number! "1"` crashes Red
================================================================================
Issue is closed, was reported by xqlab and has 12 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1613>

`to number! "1"`
and 
`to series!  "1"`
crashes Red without an error message



Comments:
--------------------------------------------------------------------------------

On 2016-02-10T07:41:31Z, WiseGenius, commented:
<https://github.com/red/red/issues/1613#issuecomment-182238951>

    For both lines, I get:
    
    ```
    *** Runtime Error 1: access violation
    *** at: 004197BDh
    ```
    
    When interpreted on both Windows XP and Windows 7.

--------------------------------------------------------------------------------

On 2016-02-10T08:05:40Z, ghost, commented:
<https://github.com/red/red/issues/1613#issuecomment-182246715>

    @WiseGenius cli-console displays error. But Gui-Console crashes...

--------------------------------------------------------------------------------

On 2016-02-10T08:12:59Z, WiseGenius, commented:
<https://github.com/red/red/issues/1613#issuecomment-182247967>

    @nc-x The GUI console never displays such errors when it crashes. That's why if there is a crash I use the CLI console in CMD to find the errors I may have missed otherwise, remembering to compile it with `Needs: 'View` in the header to test GUI stuff.

--------------------------------------------------------------------------------

On 2016-02-11T13:11:17Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1613#issuecomment-182857772>

    Both consoles crash under Wine also. No error displayed
    
    Whenever Gui console crashes, terminal remains busy with this message
    `satish@satish-Aspire:~/Downloads/red$ fixme:dwmapi:DwmIsCompositionEnabled 0x33fc78
    ^C
    satish@satish-Aspire:~/Downloads/red$ 
    `
    I have to press ctrl+c to get it back

--------------------------------------------------------------------------------

On 2016-06-17T10:47:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1613#issuecomment-226739307>

    `to` is only partially implemented.

--------------------------------------------------------------------------------

On 2017-02-16T09:12:46Z, dockimbel, commented:
<https://github.com/red/red/issues/1613#issuecomment-280275372>

    `to` has been now fully implemented, and those above cases are now raising proper errors.


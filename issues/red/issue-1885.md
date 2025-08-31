
#1885: output of gui-console goes to command console, not gui-console  
================================================================================
Issue is closed, was reported by xqlab and has 2 comment(s).
<https://github.com/red/red/issues/1885>

a compiled gui-console opens a command console and prints all output to that console, not to the grapical console 



Comments:
--------------------------------------------------------------------------------

On 2016-05-06T10:28:46Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1885#issuecomment-217406661>

    You need to compile the gui-console using `-t Windows` for the output to be directed to the gui-console.
    
    The default target on Windows is `MSDOS` where output is directed to the Windows command shell or PowerShell that you launched the compiled application from.



#2478: call/console "cmd" freezes gui-console 
================================================================================
Issue is closed, was reported by xqlab and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2478>

`--== Red 0.6.1 ==-- 
Type HELP for starting information. 

red>> help system/options/boot
system/options/boot is a string! of value: {C:\ProgramData\Red\gui-console-2017-3-14-39755.exe} 

red>> call/console "cmd"
`


Comments:
--------------------------------------------------------------------------------

On 2017-03-15T03:09:59Z, qtxie, commented:
<https://github.com/red/red/issues/2478#issuecomment-286628414>

    `call/console` is not implemented in gui-console.
    I push a fix to fire an error when use `call/console` inside gui-console.


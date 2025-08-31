
#1050: In the spec part of a FUNC, putting a /LOCAL without anything following will cause a Red Compiler Internal Error
================================================================================
Issue is closed, was reported by JerryTsai and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1050>

add: func [ a b /local ] [ a + b ]

**\* Red Compiler Internal Error: Script Error : Expected one of: word! - not: none! 
**\* Where: check-spec 
**\* Near:  [append symbols to word! pos/1] 



Comments:
--------------------------------------------------------------------------------

On 2015-03-09T09:41:34Z, iArnold, commented:
<https://github.com/red/red/issues/1050#issuecomment-77824088>

    I "reported" this too on 23 febr in Red group. http://chat.stackoverflow.com/transcript/50258?m=21719837#21719837


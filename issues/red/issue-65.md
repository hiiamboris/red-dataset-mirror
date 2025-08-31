
#65: another curious type-casting matter
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/65>

The lines
    s: "A"
    b: 255 and s/1
give a curious error:
*\* Script Error: Invalid argument: s/1
*\* Where: cast
*\* Near: value: to integer! value
whereas
    c: #"A" b: 255 and c
compiles correctly



Comments:
--------------------------------------------------------------------------------

On 2011-05-30T04:39:15Z, PeterWAWood, commented:
<https://github.com/red/red/issues/65#issuecomment-1259791>

    Is s used anywhere before you assign the value "A" to it?
    
    I compiled this program:
    
      Red/System []
      #include %prin-int.reds
      s: "A"
      b: 255 and s/1
      prin-int b
    
    and got this result:
    
    C:\Red\red-system\builds>test
    65
    
    I am using the latest version - commit https://github.com/dockimbel/Red/commit/c61a92b99b69dba0d958cd26a22803157c92bac7

--------------------------------------------------------------------------------

On 2011-05-31T21:43:45Z, dockimbel, commented:
<https://github.com/red/red/issues/65#issuecomment-1270462>

    Tested OK.


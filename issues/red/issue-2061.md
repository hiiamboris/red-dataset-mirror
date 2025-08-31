
#2061: Cross compile-error (RPi)  in function: ***-on-div-error
================================================================================
Issue is closed, was reported by vdsfr and has 4 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/2061>

Red [ ] 
;--------------------------------
 add-digs: func [digs [block!]][
 ;
 ]

digs: [ 1 2 3 4 5]
add-digs digs
;------------------------------

-=== Red Compiler 0.6.0 ===-

;--Compiling code above for Windows works. 
For **RPi** it fails with error message:

**\* Compilation Error: undefined symbol: address 
**\* in file: %common.reds 
**\* in function: _**-on-div-error
*_\* at line: 167 
**\* near: [address]



Comments:
--------------------------------------------------------------------------------

On 2016-06-22T09:04:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2061#issuecomment-227685198>

    @vdsfr Did you try with latest Red binary? It compiles fine here with latest version.

--------------------------------------------------------------------------------

On 2016-06-23T21:57:21Z, vdsfr, commented:
<https://github.com/red/red/issues/2061#issuecomment-228197298>

    Confirming the latest Red binary Red24june16 worked.


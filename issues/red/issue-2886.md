
#2886: *** Compilation Error: attempt to redefine existing function name: red/object/ge t-values
================================================================================
Issue is closed, was reported by TimeSlip and has 4 comment(s).
<https://github.com/red/red/issues/2886>

libRedRT-include.red has duplicate definition 
lines 591 and 595
get-values: "red/object/get-values" [obj [red-object!] return: [cell!]] 



Comments:
--------------------------------------------------------------------------------

On 2017-07-13T04:27:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2886#issuecomment-314967400>

    It works fine here:
    ```
    C:\Dev\Red>red clear
    C:\Dev\Red>red -c tests/hello.red
    
    -=== Red Compiler 0.6.2 ===-
    
    Compiling C:\Dev\Red\tests\hello.red ...
    Compiling compression library...
    Compiling libRedRT...
    ...compilation time : 1696 ms
    
    Compiling to native code...
    ...compilation time : 47709 ms
    ...linking time     : 564 ms
    ...output file size : 931328 bytes
    ...output file      : C:\Dev\Red\libRedRT.dll
    
    ...compilation time : 40 ms
    
    Target: MSDOS
    
    Compiling to native code...
    ...compilation time : 1422 ms
    ...linking time     : 76 ms
    ...output file size : 67584 bytes
    ...output file      : C:\Dev\Red\hello.exe
    ```
    You probably didn't clear the old files after upgrading.

--------------------------------------------------------------------------------

On 2017-07-13T16:03:01Z, TimeSlip, commented:
<https://github.com/red/red/issues/2886#issuecomment-315123727>

    Yes, Doc I think that was it although there were two entries of the same definition. In any case, all is well here.
    James


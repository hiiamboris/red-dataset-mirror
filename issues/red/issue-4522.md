
#4522: [CRASH] In compiled `find/skip` with unset argument
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4522>

**Describe the bug**

Compile this (`-r -d`):
```
Red []
find/skip [1] [1] ()
```
Run, results in:
```
*** Runtime Error 98: assertion failed                                                                                          
*** in file: /D/devel/red/red-src/red-master/datatypes/block.reds                                                               
*** at line: 886                                                                                                                
***                                                                                                                             
***   stack: red/block/find 00000062h 00430018h 0018FE64h true true false false 00000000h 00000000h true true true false        
***   stack: red/block/find 029D32B4h 029D32C4h 029D32A4h false false false false 029D32A4h 029D32D4h false false false false   
***   stack: red/actions/find 029D32B4h 029D32C4h 029D32A4h false false false false 029D32A4h 029D32D4h false false false false 
***   stack: red/actions/find* -1 -1 -1 -1 -1 -1 2 -1 -1 -1 -1                                                                  
```

**Expected behavior**

Error message.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-08-03T16:33:42Z, 9214, commented:
<https://github.com/red/red/issues/4522#issuecomment-668119887>

    It will crash with anything other than `integer!` actually.


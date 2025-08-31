
#3550: access violation on recursive inclusion of a script containing at least 3 blocks
================================================================================
Issue is open, was reported by 9214 and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/3550>

### Expected behavior
A proper error message is displayed.
### Actual behavior
Access violation.
### Steps to reproduce the problem
```red
Red [File: %bug.red]

#include %bug.red
[][][]
```
Some observations: this script, copyed as-is
```red
Red [File: %bug.red]

#include %bug.red
a b [[]] c 0
d/e/f []
```
Results in:
```
*** Script Error: set does not allow È          @
                                                 8k
                                                    ╗  Þ╔  ║   for its word argument
*** Where: set
*** Stack:
```
But a slightly modified version (empty line after inclusion is removed):
```red
Red [File: %bug.red]
#include %bug.red
a b [[]] c 0
d/e/f []
```
Again results in access violation. I surmise this has something to do with lexer or preprocessor.

Note that header structure matters. If it has at least one `any-word! any-string!` pair inside, you'll get access violation, and otherwise:
```red
Red []
#include %bug.red
[][][]
```
```
*** Script Error: invalid id field in spec block
*** Where: body
*** Stack:
```

### Red and platform version
```
Red 0.6.3 for Windows built 2-Oct-2018/8:13:15+05:00 commit #bceaf7c
```


Comments:
--------------------------------------------------------------------------------

On 2019-09-15T07:50:09Z, 9214, commented:
<https://github.com/red/red/issues/3550#issuecomment-531543348>

    I can no longer reproduce segfault, but weird script error still persists in all cases.
    ```
    Red 0.6.4 for Windows built 31-Aug-2019/17:47:43+05:00 commit #b28d8f5
    ```

--------------------------------------------------------------------------------

On 2020-07-13T19:09:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/3550#issuecomment-657738877>

    The crash is back since late of May 2020, let's hail it:
    ```
    *** Runtime Error 98: assertion failed                                                                   
    *** in file: /D/devel/red/red-src/red-master/runtime/parse.reds                                          
    *** at line: 1070                                                                                        
    ***                                                                                                      
    ***   stack: red/parser/process 00000062h 0047E752h 127 3213292 00000001h                                
    ***   stack: red/parser/process 02C3C060h 028A81B4h 0 0 028A8194h                                        
    ***   stack: red/natives/parse* true -1 0 -1                                                             
    ***   stack: ctx||405~expand 002EC174h                                                                   
    ***   stack: red/_function/call 028A7F84h 002EC174h                                                      
    ***   stack: red/interpreter/eval-code 02B17AD0h 02B8CC58h 02B8CC58h false 00000000h 00000000h 02B17AD0h 
    ***   stack: red/interpreter/eval-expression 02B8CC28h 02B8CC58h false false false                       
    ***   stack: red/interpreter/eval 028A7F74h true                                                         
    ***   stack: red/natives/try* true -1                                                                    
    ***   stack: attempt                                                                                     
    ***   stack: red/_function/call 028A7F34h 002F3884h                                                      
    ***   stack: red/interpreter/eval-code 02981BB8h 02B8CBC0h 02B8CC00h false 00000000h 00000000h 02981BB8h 
    ***   stack: red/interpreter/eval-expression 02B8CBB0h 02B8CC00h false false false                       
    ***   stack: red/interpreter/eval 028A7F14h true                                                         
    ***   stack: red/natives/either* false                                                                   
    ***   stack: red/interpreter/eval-arguments 028A7EF4h 02B8CAD8h 02B8CAD8h 00000000h 00000000h 02980A48h  
    ***   stack: red/interpreter/eval-code 02980A48h 02B8CA98h 02B8CAD8h false 00000000h 00000000h 02980A48h 
    ***   stack: red/interpreter/eval-expression 02B8CA98h 02B8CAD8h false false false                       
    ***   stack: red/interpreter/eval 028A7EE4h true                                                         
    ***   stack: red/natives/if* false                                                                       
    ***   stack: red/interpreter/eval-arguments 028A7EC4h 02B8CA70h 02B8CA70h 00000000h 00000000h 0297FED8h  
    ***   stack: red/interpreter/eval-code 0297FED8h 02B8CA50h 02B8CA70h false 00000000h 00000000h 0297FED8h 
    ***   stack: red/interpreter/eval-expression 02B8CA50h 02B8CA70h false false false                       
    ***   stack: red/interpreter/eval 02B8C4E8h false                                                        
    ***   stack: red/parser/eval 02B8C4E8h true true                                                         
    ***   stack: red/parser/process 02C3C050h 028A7EA4h 0 0 028A7E84h                                        
    ***   stack: red/natives/parse* true -1 0 -1                                                             
    ***   stack: ctx||405~expand 002EC174h                                                                   
    ***   stack: red/_function/call 028A7C74h 002EC174h                                                      
    ***   stack: red/interpreter/eval-code 02B17AD0h 02B8CC58h 02B8CC58h false 00000000h 00000000h 02B17AD0h 
    ***   stack: red/interpreter/eval-expression 02B8CC28h 02B8CC58h false false false                       
    ***   stack: red/interpreter/eval 028A7C64h true                                                         
    ***   stack: red/natives/try* true -1                                                                    
    ***   stack: attempt                                                                                     
    ***   stack: red/_function/call 028A7C24h 002F3884h                                                      
    ***   stack: red/interpreter/eval-code 02981BB8h 02B8CBC0h 02B8CC00h false 00000000h 00000000h 02981BB8h 
    ***   stack: red/interpreter/eval-expression 02B8CBB0h 02B8CC00h false false false                       
    ***   stack: red/interpreter/eval 028A7C04h true                                                         
    ***   stack: red/natives/either* false                                                                   
    ***   stack: red/interpreter/eval-arguments 028A7BE4h 02B8CAD8h 02B8CAD8h 00000000h 00000000h 02980A48h  
    ```
    
    All of the provided snippets now cause it. And no need to add empty blocks - any recursive inclusion crashes.

--------------------------------------------------------------------------------

On 2021-06-20T16:32:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/3550#issuecomment-864579828>

    Of note, this crash is easier to trigger with cyclic includes. E.g. `a.red` includes `b.red`, `b.red` includes `c.red`, and `c.red` includes `a.red` (because who can possibly remember what included what).


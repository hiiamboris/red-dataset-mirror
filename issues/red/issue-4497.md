
#4497: [View] CRASH with pane change & auto-sync off
================================================================================
Issue is closed, was reported by hiiamboris and has 20 comment(s).
[status.built] [GUI]
<https://github.com/red/red/issues/4497>

See also https://github.com/red/red/issues/4465

**Describe the bug**
```
recycle/off
view/no-wait [p: panel [panel [f1: field on-focus [show p]] f2: text]]

set-focus f1
system/view/auto-sync?: no
change p/pane copy p/pane
system/view/auto-sync?: yes
show p
```
Output:
```
*** View Error: CreateWindowEx failed!                                                                  
*** View Error: CreateWindowEx failed!                                                                  
*** View Error: CreateWindowEx failed!                                                                  
                                                                                                        
*** Runtime Error 1: access violation                                                                   
*** in file: /D/devel/red/red-src/red-master/modules/view/backends/windows/gui.reds                     
*** at line: 132                                                                                        
***                                                                                                     
***   stack: gui/get-face-values 00000000h                                                              
***   stack: gui/update-layered-window 00000000h 00000000h 00000000h 00000000h -1                       
***   stack: gui/OS-show-window 0                                                                       
***   stack: gui/change-parent 02D7A1E0h 02A3A544h                                                      
***   stack: gui/change-faces-parent 02A3A564h 02A3A544h 00000000h 0 2                                  
***   stack: gui/OS-update-facet 02A3A544h 02A3A554h 02A3A564h 02A3A574h 00000000h 0 2                  
***   stack: ctx||463~on-change-facet 02A3A544h 02A3A554h 02A3A564h 02A3A574h 00000000h 0 2             
***   stack: on-face-deep-change*                                                                       
***   stack: show                                                                                       
***   stack: red/_function/call 02A3A1D4h 00923884h                                                     
***   stack: red/interpreter/eval-code 02A3A1D4h 02D730F0h 02D730F0h false 00000000h 00000000h 02B20D08h
***   stack: red/interpreter/eval-expression 02D730E0h 02D730F0h false false false                      
***   stack: red/interpreter/eval 02A3A1B4h true                                                        
***   stack: red/natives/catch* true 1                                                                  
***   stack: ctx||560~try-do 02861DB4h                                                                  
***   stack: ctx||560~launch 02861DB4h                                                                  
***   stack: ctx||594~launch 0286153Ch                                                                  
```

**Expected behavior**

No crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 4-Jun-2020/17:57:26
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-04T19:40:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4497#issuecomment-639074552>

    Variant 2:
    ```
    recycle/off
    view/no-wait [p: panel 100x100 [panel [f1: field on-focus [show p]]]]
    
    set-focus f1
    system/view/auto-sync?: no
    change p/pane copy p/pane
    show p
    system/view/auto-sync?: yes
    ```
    Output:
    ```
    *** View Error: CreateWindowEx failed!    
    *** View Error: CreateWindowEx failed!    
    none                                      
                                              
    *** Runtime Error 95: no CATCH for THROW  
    *** in file: common.reds                  
    *** at line: 269                          
    ***                                       
    ***   stack: ***-uncaught-exception       
    ***   stack: ***-uncaught-exception       
    ```

--------------------------------------------------------------------------------

On 2020-06-04T19:50:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4497#issuecomment-639079325>

    Variant 3 that doesn't use auto-sync (another issue??):
    ```
    recycle/off
    insert-event-func function [fa ev] [if ev/type = 'focus [makeanerror]]
    view/no-wait [c: panel [panel [f1: field] text]]
    set-focus f1
    change c/pane copy c/pane
    ```
    Output:
    ```
    *** Script Error: makeanerror has no value                                                                
    *** Where: if                                                                                             
    *** Stack: view show do-safe                                                                              
    *** Script Error: makeanerror has no value                                                                
    *** Where: if                                                                                             
    *** Stack: set-focus eval-set-path show do-safe                                                           
    *** Script Error: makeanerror has no value                                                                
    *** Where: if                                                                                             
    *** Stack: on-face-deep-change* do-safe                                                                   
                                                                                                              
    *** Runtime Error 98: assertion failed                                                                    
    *** in file: /D/devel/red/red-src/red-master/modules/view/backends/windows/gui.reds                       
    *** at line: 2260                                                                                         
    ***                                                                                                       
    ***   stack: gui/change-parent 00000062h 005208CCh                                                        
    ***   stack: gui/change-parent 02F7BE48h 02B5A3C4h                                                        
    ***   stack: gui/change-faces-parent 02B5A3E4h 02B5A3C4h 00000000h 0 2                                    
    ***   stack: gui/OS-update-facet 02B5A3C4h 02B5A3D4h 02B5A3E4h 02B5A3F4h 00000000h 0 2                    
    ***   stack: ctx||463~on-change-facet 02B5A3C4h 02B5A3D4h 02B5A3E4h 02B5A3F4h 00000000h 0 2               
    ***   stack: on-face-deep-change*                                                                         
    ***   stack: red/_function/call 02B5A284h 00913884h                                                       
    ***   stack: red/interpreter/eval-code 02B5A284h 02F77FF0h 02F77FF0h false 00000000h 00000000h 02C43E18h  
    ***   stack: red/interpreter/eval-expression 02F77F60h 02F77FF0h false false false                        
    ***   stack: red/interpreter/eval 02F77EE8h true                                                          
    ***   stack: red/interpreter/eval-function 02F73108h 02F77EE8h                                            
    ***   stack: red/_function/call 02F73108h 0217FBECh                                                       
    ***   stack: red/object/fire-on-deep 02C9BC60h 02C9BC70h 02B5A1E4h 02B3E224h 0054C370h 0 2                
    ***   stack: red/ownership/check 02B5A1E4h 02B3E224h 00000000h 0 2                                        
    ***   stack: red/_series/change 02B5A1E4h 02B5A1F4h 02B5A1D4h false 02B5A1D4h                             
    ***   stack: red/actions/change 02B5A1E4h 02B5A1F4h 02B5A1D4h false 02B5A1D4h                             
    ***   stack: red/actions/change* -1 -1 -1                                                                 
    ***   stack: red/interpreter/eval-arguments 02B5A1D4h 02F68928h 02F68948h 00000000h 00000000h             
    ***   stack: red/interpreter/eval-code 02B5A1D4h 02F688F8h 02F68948h false 00000000h 00000000h 02C3FFE8h  
    ***   stack: red/interpreter/eval-expression 02F688F8h 02F68948h false false false                        
    ***   stack: red/interpreter/eval 02B5A1B4h true                                                          
    ***   stack: red/natives/catch* true 1                                                                    
    ***   stack: ctx||560~try-do 00931DB4h                                                                    
    ***   stack: ctx||560~launch 00931DB4h                                                                    
    ***   stack: ctx||594~launch 0093153Ch                                                                    
    ```

--------------------------------------------------------------------------------

On 2020-06-04T21:10:58Z, greggirwin, commented:
<https://github.com/red/red/issues/4497#issuecomment-639118315>

    Only v3 crashes here. 

--------------------------------------------------------------------------------

On 2020-06-05T07:17:22Z, qtxie, commented:
<https://github.com/red/red/issues/4497#issuecomment-639303990>

    Variant 3 related to error handling, not a view issue. Seems the error `makeanerror` mess up the stack. No `makeanerror` no crashes.
    ```
    recycle/off
    insert-event-func function [fa ev] [if ev/type = 'focus [1]]
    view/no-wait [c: panel [panel [f1: field] text]]
    set-focus f1
    change c/pane copy c/pane
    ```

--------------------------------------------------------------------------------

On 2020-06-05T07:21:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4497#issuecomment-639305791>

    @qtxie but if you remove `text` or extra `panel` - also no crash.

--------------------------------------------------------------------------------

On 2020-06-05T07:29:18Z, qtxie, commented:
<https://github.com/red/red/issues/4497#issuecomment-639309044>

    > but if you remove text or extra panel - also no crash.
    
    I think the stack still messed up, just that we're lucky that the assertion passed.

--------------------------------------------------------------------------------

On 2021-09-29T07:09:08Z, qtxie, commented:
<https://github.com/red/red/issues/4497#issuecomment-929898740>

    No crashes in the latest version.

--------------------------------------------------------------------------------

On 2021-09-29T07:47:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4497#issuecomment-929925863>

    Confirmed. But it makes me wonder if bug just escaped the tests and will resurface later.
    If we care about stability we should track these bugs in old releases where they appear and copy the fix over the current release.
    Also I don't have W7 around to test the variant 1 right now.

--------------------------------------------------------------------------------

On 2021-09-29T08:01:11Z, qtxie, commented:
<https://github.com/red/red/issues/4497#issuecomment-929935039>

    > If we care about stability we should track these bugs in old releases where they appear and copy the fix over the current release.
    
    We have been fixed many bugs since then, maybe some of them related to this issue. Especially some deep changes in the runtime, e.g. FEAT: [R/S] more robust `loop` counter handling 1465fb1d0e9581174453eb030b0d3366fb7479ee.

--------------------------------------------------------------------------------

On 2021-09-29T08:12:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4497#issuecomment-929943643>

    Well let's hope so. Do you have a W7 machine around to test on it?


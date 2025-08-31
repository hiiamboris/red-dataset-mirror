
#4486: Crash when inserting a face into window's pane
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4486>

**Describe the bug**
`insert`ing a face to a window's pane crashes while `append`ing works

**To reproduce**
```
face1: make face! [
    type:    'base
    size:    100x100
    offset: 10x10
    color: blue
]

face2: make face! [
    type: 'base
    size: 100x100
    offset: 130x130
    color: red
]

win: make face! [
    type:    'window
    size:    800x600
    pane:    reduce [face1]
]

view/no-wait win
;append win/pane face2    ; this works
insert win/pane face2     ; this crashes
show win
do-events
```

```
*** Runtime Error 1: access violation
*** at: 00437D70h
```

Tested on Windows 10

Here's the stack trace of @hiiamboris' tested on Win7:
```
*** Runtime Error 98: assertion failed                                                                   
*** in file: /d/devel/red/red-src/red/modules/view/backends/windows/gui.reds                             
*** at line: 232                                                                                         
***                                                                                                      
***   stack: gui/get-face-handle 00000062h                                                               
***   stack: gui/get-face-handle 02A3A024h                                                               
***   stack: gui/change-parent 02A3A024h 02A39FE4h                                                       
***   stack: gui/change-faces-parent 02A3A004h 02A39FE4h 02A3A024h 0 1                                   
***   stack: gui/OS-update-facet 02A39FE4h 02A39FF4h 02A3A004h 02A3A014h 02A3A024h 0 1                   
***   stack: ctx||460~on-change-facet 02A39FE4h 02A39FF4h 02A3A004h 02A3A014h 02A3A024h 0 1              
***   stack: on-face-deep-change*                                                                        
***   stack: red/_function/call 02A39EA4h 003C3884h                                                      
***   stack: red/interpreter/eval-code 02A39EA4h 02E42CC8h 02E42CC8h false 00000000h 00000000h 02B24138h 
***   stack: red/interpreter/eval-expression 02E42C38h 02E42CC8h false false false                       
***   stack: red/interpreter/eval 02E42BC0h true                                                         
***   stack: red/interpreter/eval-function 02E3DDE0h 02E42BC0h                                           
***   stack: red/_function/call 02E3DDE0h 008C1350h                                                      
***   stack: red/object/fire-on-deep 02B7BC20h 02B7BC30h 02A39E14h 02A1E0E4h 02A39E24h 0 1               
***   stack: red/ownership/check 02A39E14h 02A1E0E4h 02A39E24h 0 1                                       
***   stack: red/block/insert 02A39E14h 02A39E24h 02A39E04h false 02A39E04h false                        
***   stack: red/actions/insert 02A39E14h 02A39E24h 02A39E04h false 02A39E04h false                      
***   stack: red/actions/insert* -1 -1 -1                                                                
***   stack: red/interpreter/eval-arguments 02B1FEC8h 02E336A0h 02E336D0h 00000000h 00000000h            
***   stack: red/interpreter/eval-code 02B1FEC8h 02E33680h 02E336D0h false 00000000h 00000000h 02B1FEC8h 
***   stack: red/interpreter/eval-expression 02E33680h 02E336D0h false false false                       
***   stack: red/interpreter/eval 02A39DE4h true                                                         
***   stack: red/natives/catch* true 1                                                                   
***   stack: ctx||557~try-do 003E1DA4h                                                                   
***   stack: ctx||557~launch 003E1DA4h                                                                   
***   stack: ctx||590~launch 003E14F8h
```

Here is the [gitter](https://gitter.im/red/bugs?at=5ed41af3549761730b6d4973) conversation.

**Expected behavior**
No crash.

**Platform version (please complete the following information)**
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 3133 date: 31-May-2020/20:52:20 commit: #81ffa66484e24b5ff07b49ce05a818c9a457e1f8 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 18363 ]
```





#4548: [View] make-actor does not allow (stuff) for its <anon> argument
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/4548>

**Describe the bug**

```
Red [needs: view]                                   
                                                    
extend system/view/VID/styles [                     
    yourbase1: [                                    
        default-actor: 'on-down                     
        template: [type: 'base size: 10x10]         
    ]                                               
    yourbase2: [template: [type: 'base size: 10x10]]
]                                                   
                                                    
view [c: yourbase1 []]                              
; view [c: yourbase2 []]                            
; view [c: base []]                                 
```
`yourbase1` gives:
```
*** Script Error: make-actor does not allow lit-word for its <anon> argument
*** Where: make-actor                                                       
*** Stack: view layout                                                      
```
`yourbase2` gives:
```
*** Script Error: make-actor does not allow none for its <anon> argument
*** Where: make-actor                                                   
*** Stack: view layout                                                  
```
The error message is not very informative. Turns out `default-actor` expects a `word!`, but who will remember that?

**Expected behavior**

1. Accept lit-words on par with words
2. Output a normal error message, saying that `default-actor` of style `yourbase1` should be of `word` type and be defined.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```




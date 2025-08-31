
#5160: [Draw] (translate + font + text) more than once = CRASH
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5160>

**Describe the bug**
```
Red [needs: view]

fonte: make font! [size: 20]

draw 100x100 compose/deep [    
    translate 0x0 [    
        font (fonte) 
        text 20x20 "ABCDEF"
    ]
    translate 0x0 [    
        font (fonte) 
        text 20x20 "ABCDEF"
    ]
]
```
Evaluated:
```
*** Runtime Error 1: access violation
*** in file: K.
*** at line: 1818845542
***
```

**Expected behavior**

text string "ABCDEF" on the image

**Platform version**
```
Red 0.6.4 for Windows built 27-Jun-2022/11:51:28+03:00  commit #ed73e33 
```




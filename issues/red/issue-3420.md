
#3420: Bug: set-focus crashes console and compiled script, when closing popup window 
================================================================================
Issue is closed, was reported by pixel40 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3420>

Using set-focus on field in main window causes crash when popup window is unviewed. <br /><br />
**Expected behaviour**<br /><br />
Program to stay open after unview.<br /><br />
**Actual behaviour**<br /><br />
gui console crashes, compiled version crashes.<br/><br/>
**Steps to reproduce the problem**<br/><br/>
```
lay1: layout [
    panel [
        f1: field 200x20 "Hello, I am assisting with crash test"
        return
        button "Press Me First" [
            view [
                button "First step to Crash" [
                    set-focus f1
                    unview
                ]
            ]
        ]
        button "Press Me Second" [
            view [
                text "Do you think this will cause crash?"
                return
                button "Yes" [
                    unview
                ]
            ]
        ]
    ]
]
view lay1
``` 

**Red and platform version**<br/><br/>
Red 0.6.3 for Windows 10 red-07jun18-3f3c037f




Comments:
--------------------------------------------------------------------------------

On 2018-06-12T00:37:34Z, endo64, commented:
<https://github.com/red/red/issues/3420#issuecomment-396429153>

    Confirmed. Non-GUI console also crashes.



#2820: [macOS View] Clicking on a button will not make the button get the focus
================================================================================
Issue is open, was reported by JenniferLee520 and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/2820>

Try the following code. Click the button. On Windows 10, the button will get the focus. On macOS, it will not.
```Red
view [ 
    field 100 
    button "OK" [ print "OK" ] 
]
```



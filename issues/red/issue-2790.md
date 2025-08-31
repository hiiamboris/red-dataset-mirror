
#2790: Compilation Error: undefined symbol  in Windows Automated Build [red-11jun17-025efbd.exe]
================================================================================
Issue is closed, was reported by gltewalt and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2790>

```
C:\Users\Old Man>red --cli
Compiling compression library...
Compiling Red console...
*** Compilation Error: undefined symbol: exec/terminal/emit-string
*** in file: %/C/ProgramData/Red/red-console.red
*** in function: exec/ctx434~terminate
*** at line: 338
*** near: [
    terminal/emit-string "^[[?2004l"
]
```



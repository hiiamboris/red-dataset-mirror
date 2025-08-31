
#1943: Auto Compile fail on build red-28may16-692ad47.exe
================================================================================
Issue is closed, was reported by SteeveGit and has 0 comment(s).
<https://github.com/red/red/issues/1943>

```
a@Ubun:~/Desktop/red-master$ ./red-28may16-692ad47.exe 
Compiling Red GUI console...
*** Compilation Error: argument type mismatch on calling: exec/gui/get-text-size 
*** expected: [struct! [
        header [integer!] 
        padding [integer!] 
        x [integer!] 
        y [integer!]
    ]], found: [integer!] 
*** in file: %/C/users/Public/Application%20Data/Red/red-console.red 
*** in function: exec/ctx226~size-text
*** at line: 1750 
*** near: [pair]
```




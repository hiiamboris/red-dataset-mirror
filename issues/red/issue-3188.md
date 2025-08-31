
#3188: Red/System literal array beginning with a word literal gives a compilation error
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3188>

### Expected behavior
Compilation without error
### Actual behavior
```
---------- Capture Output ----------
> "C:\Program Files (x86)\Red\red.exe" -t MSDOS -c C:\Projects\Red\programs\test\test.reds

-=== Red Compiler 0.6.3 ===- 

Compiling C:\Projects\Red\programs\test\test.reds ...

Target: MSDOS 

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : first expected series argument of type: series pair event money date object port time tuple any-function library struct event 
*** Where: get-type 
*** Near:  [all [
find [float! float64! c-string!] first type: get-type value/1 
type: [integer!]
] 
next next reduce
] 


> Terminated with exit code 1.
```

### Steps to reproduce the problem
Compile the following `%test.reds`
```
Red/System []
a: [true false]
```
Compilation is without error when the first item is NOT a word.
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 19-Dec-2017/19:19:55+01:00
running on W10



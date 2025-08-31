
#2871: Macro inclusion from separate file works inconsistently
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2871>

Regarding wish #2847 - suppose I have two separate files:
```Red
Red [File: %macro.red]

#macro answer: func [][42]
```
```Red
Red [File: %main.red]

#include %./macro.red

probe [answer]
```
Evaluation of `%main.red` with `F6` hotkey from VSCode gives me `[answer]` no matter what, but evaluating file from console works:
```Red
>> do %main.red
[42]
== [42]
```
But if I try to evaluate it from "clean" console, it works only on second try:
```Red
--== Red 0.6.2 ==-- 
Type HELP for starting information. 

>> do %main.red
[answer]
== [answer]
>> do %main.red
[42]
== [42]
```




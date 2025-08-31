
#5585: In func specs, 2 RETURN: without strings causes invalid specs, but they are accepted if the first has string
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5585>


**Describe the bug**
Specs with 2 `return:` causes error. But if you add the description string on the first one, the invalid specs is accepted.
 

**To reproduce**

This is rejected

```
func [
  return: [integer!] 
  return: [integer!]  
  /local xx
][
123456
]
```
The error:
```
*** Script Error: invalid function definition: [return: [integer!] return: [integer!] /local xx]
*** Where: either
*** Near : func [return: [integer!] return: [integer!]]
*** Stack:  
```
This is accepted

```
func [
  return: [integer!] "abcd" 
  return: [integer!]
  /local xx
][
123456
]
```
No error!

**Expected behavior**
Throw an error for invalid specs

**Platform version**

;-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 374 date: 10-Jan-2025/11:17:29 commit: #68f6dd532a4cd9c53fa68656805bc59390a6ab42 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 ve




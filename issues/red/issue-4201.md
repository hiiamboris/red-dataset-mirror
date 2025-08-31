
#4201: [Compiler] Does not call functions defined in interpreted code
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4201>

**Describe the bug**
```
Red []
do [c: context [f: does [print "called"]]]
probe c/f
```
Should call `c/f`, but prints it, when compiled:
```
func [][print "called"]
```

If I remove `context` from it:
```
Red []                       
do [f: does [print "called"]]
probe f                      
```
Then it simply doesn't see the function:
```
*** Compilation Error: undefined word f
*** in file: D:\devel\red\red-cli\mockups\bug2.red
*** near: [f]
```

**Expected behavior**

I'd like it place an interpreted function call.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 12-Dec-2019/11:14:17+03:00 commit #61d4d36
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-21T14:35:24Z, 9214, commented:
<https://github.com/red/red/issues/4201#issuecomment-602053760>

    #420 † #924 #1144 #2010 #2114 #2485 #2511 #2541 #2542 #2910 #2975 #3597 #4053 #4463
    
    † `#420 = #420 ; 1 = #4201`



#5336: Bugs in negative time values
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [type.design]
<https://github.com/red/red/issues/5336>

From https://github.com/red/red/issues/4397

**Describe the bug**

Current implementation has some serious flaws, mainly the /hour bug:
```
>> t/hour: 0 t/hour
== 0
>> t/hour: -1 t/hour
== 0
>> t/hour: -2 t/hour
== -1
```
And inability to make sub-hour negative times using `make` from block spec:
```
>> make time! [0 0 -3]
*** Script Error: cannot MAKE/TO time! from: [0 0 -3]
*** Where: make
*** Near : make time! [0 0 -3]
*** Stack:  

>> make time! [-0.0 0 3]
*** Script Error: cannot MAKE/TO time! from: [-0.0 0 3]
*** Where: make
*** Near : make time! [-0.0 0 3]
*** Stack: 
```
Also accessors sign varies:
```
>> t: -1:2:3
== -1:02:03
>> print [t/hour t/minute t/second]
-1 2 -3.0
```

**Expected behavior**

1. consistency of /hour access
2. make with block spec being able to cover whole time range
3. minute & second nonnegative

**Platform version**
```
Red 0.6.4 for Windows built 7-Jun-2023/22:38:46+03:00  commit #01ab176
```



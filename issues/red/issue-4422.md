
#4422: `do` reincludes every #include in the intepreter, and multiple times
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.design]
<https://github.com/red/red/issues/4422>

**Describe the bug**

Performance left alone, this forbids me from having any control over where to enable assertions and where not, because everything is just so messed up. In the script below, I'm setting a global interpreter-level flag, which gets reset unfortunately.

**To reproduce**

For convenience, here's a full listing of test files:
```
1.red:  
Red []
#do [print "INCLUDING 1.RED"]
#do [global-value: 1]
#do [print ["global-value =" global-value]]

2.red:  
Red []
#do [print "INCLUDING 2.RED"]
#include %2a.red
#include %2a.red

2a.red:  
Red []
#do [print "INCLUDING 2A.RED"]

3.red:  
Red [] #do [print "INCLUDING 3.RED"]

4.red:  
Red []
#do [print "INCLUDING 4.RED"]

inc.red:  
Red []
#do [print "INCLUDING INC.RED"]
print "^/START OF EVALUATION"
#include %1.red
print "1.red done"
#do [global-value: 2] #do [print ["global-value =" global-value]]
#include %2.red
print "2.red done"
#do [print "END OF INCLUDES"]
print "DOING 3 & 4"
do %3.red
do %4.red
```

- They can be created using the following:
```
write %1.red  {Red []^/#do [print "INCLUDING 1.RED"]^/#do [global-value: 1]^/#do [print ["global-value =" global-value]]}
write %2.red  {Red []^/ #do [print "INCLUDING 2.RED"] #include %2a.red #include %2a.red}
write %2a.red {Red []^/ #do [print "INCLUDING 2A.RED"]}
write %3.red  {Red [] #do [print "INCLUDING 3.RED"]}
write %4.red  {Red [] #do [print "INCLUDING 4.RED"]}
write %inc.red {Red []^/#do [print "INCLUDING INC.RED"]^/print "^^/START OF EVALUATION"^/#include %1.red^/print "1.red done"^/#do [global-value: 2] #do [print ["global-value =" global-value]]^/#include %2.red^/print "2.red done"^/#do [print "END OF INCLUDES"]^/print "DOING 3 & 4"^/do %3.red^/do %4.red}
```
- Now let's test it: `red --cli inc.red`:
```
INCLUDING INC.RED
INCLUDING 1.RED
global-value = 1
global-value = 2
INCLUDING 2.RED
INCLUDING 2A.RED
INCLUDING 2A.RED
END OF INCLUDES

START OF EVALUATION
INCLUDING 1.RED
global-value = 1
1.red done
INCLUDING 2.RED
INCLUDING 2A.RED
INCLUDING 2A.RED
INCLUDING 2A.RED
INCLUDING 2A.RED
2.red done
DOING 3 & 4
INCLUDING 3.RED
INCLUDING 4.RED
```

As you can see, #include executed all preprocessor code, then got replaced by `do`. And `do` executed that code again. And also doubled some of it. What's worst, it reset my `global-value` which I wanted to use to control the preprocessing.

**Expected behavior**

Maybe something like this for starters?
```
INCLUDING INC.RED
INCLUDING 1.RED
global-value = 1
global-value = 2
INCLUDING 2.RED
INCLUDING 2A.RED
INCLUDING 2A.RED
END OF INCLUDES

START OF EVALUATION
1.red done
2.red done
DOING 3 & 4
INCLUDING 3.RED
INCLUDING 4.RED
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-May-2020/20:26:38+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-16T13:59:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4422#issuecomment-629650234>

    I have a file `dope.red` in the View test system, which I'm using in other parts of it, so it's included in 3 scripts. This helps me to test those scripts separately. But when I start the whole system, it gets preprocessed 8 times and included 3 times, leading to load time of about 20 seconds ;)
    
    I'll find a workaround, but wanted to note how bad it is.


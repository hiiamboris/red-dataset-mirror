
#5123: stack overflow on unique 
================================================================================
Issue is closed, was reported by bubnenkoff and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5123>

**Describe the bug**
```
out: copy []
loop 10000 [collect/into [keep [[a: 1]] ] out] 
 [[a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1] [a: 1...
unique out
```
error:
```
*** Internal Error: stack overflow
*** Where: unique
*** Near : out
*** Stack:
```

**Expected behavior**
Getting unique list of blocks. In this case is: `[a: 1]`

More examples: https://gitter.im/red/bugs?at=625919878db2b95f0ab88c99

**Platform version**
```
>> about
Red 0.6.4 for Windows built 3-Feb-2022/20:16:35+03:00  commit #fbdf84d
```



Comments:
--------------------------------------------------------------------------------

On 2022-07-19T13:19:12Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5123#issuecomment-1189044179>

    I confirm this bug, I can't use `unique` and `difference` on data coming from the server of my company because I am always hit by a stack overflow.
    
    Thread here: https://gitter.im/red/help?at=62c871ea9a314a3ec44f658c
    (Note it starts with `unique set1 set2` but should be `difference`)
    
    



#4903: A type declaration after a refinement does not trigger a syntax error
================================================================================
Issue is closed, was reported by zwortex and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4903>

**Before submitting**
https://gitter.im/red/bugs?at=60a2add15fff1f4a98e14323

**Describe the bug**
The following script evals properly, though it shows a type block after a refinement declaration.
```
Red []
a-func: function [ /ref [logic!] return: [unset!] ] [ either ref [ print "with ref" ] [ print "without ref" ] ]
a-func ;= without ref
a-func/ref ;= with ref
```

Rightly however it triggers an error when being compiled :
```
*** Compilation Error: invalid function spec block: [[logic!] return: [unset!]]                       
*** in file: D:\Developpements\RedTest\thetest.red                                                    
*** near: [[/ref [logic!] return: [unset!]] [either ref [print "with ref"] [print "without ref"]]     
    a-func                                                                                            
    a-func/ref                                                                                        
] 
```

**Expected behavior**
Consistency between interpretation and evaluation

**Platform version**
Red 0.6.4 for Windows built 16-May-2021/15:45:17+02:00  commit #0fac62e




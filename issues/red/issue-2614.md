
#2614: [cross-compiling][view] Regression on compiling with `self` word
================================================================================
Issue is open, was reported by maximvl and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/2614>

Following code compilation:
```
Red [
   needs: 'view
]

f: function [] [
   self: 5
]
```
fails with:
```
> red62 -t Windows compiler-bug.red 

-=== Red Compiler 0.6.2 ===- 

Compiling /home/max/red/compiler-bug.red ...
*** Red Compiler Internal Error: Script Error : bind-function expected shadow argument of type: object 
*** Where: comp-func 
*** Near:  [bind-function body shadow 
body-code: either
] 
```

Same for `Darwin` target, but it compiles fine for Linux without `view` and for all platforms if `self` is changed to another word. Compiling for Windows from Windows red binary works.



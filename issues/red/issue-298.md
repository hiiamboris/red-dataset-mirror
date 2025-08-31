
#298: Compiler chokes on size? of enum type
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/298>

```
#enum color! [a b c] print size? color!

-= Red/System Compiler =-
Compiling tests/mytest.reds ...
*** Compiler Internal Error: Script Error : any-float? expected type argument of type: block
*** Where: with-width-of
*** Near:  [either compiler/any-float? compiler/get-variable-spec value [
emit-float-variable value
#{DD05}
#{DD45}
]]
```




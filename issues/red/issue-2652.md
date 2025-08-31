
#2652: Type-checking missing in interpreter for op! made out of action!
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2652>

With runtime compiled in debug mode:
```
do [1 + none]
````
will crash with following error report:
```
*** Runtime Error 98: assertion failed
*** in file: /C/dev/Red/runtime/datatypes/integer.reds
*** at line: 229
***
***   stack: red/integer/do-math 98
***   stack: red/integer/do-math 0
***   stack: red/integer/add
***   stack: red/actions/add*
***   stack: red/interpreter/eval-infix 0270A1ECh 027EB770h 027EB770h true
***   stack: red/interpreter/eval-expression 027EB750h 027EB770h false true fale
***   stack: red/interpreter/eval 026742F4h true
...
```` 



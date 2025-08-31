
#1868: Compilation internal error on word redefinition
================================================================================
Issue is closed, was reported by nodrygo and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1868>

this code end with compiler error below 
according @dockimbel this is a compiler error due to the  _a_  redefinition 

```
Red [ ]

dot2d: func [a [pair!] b [pair!] return: [float!]][
       (to float! a/x * to float! b/x) + (to float! b/y * to float! b/y)
]

norm:  func [a [pair!] return: [integer!] /local d2 ][
       d2: dot2d a a 
       res: to integer! (square-root d2) 
       return res 
]
distance:  func [a [pair!] b [pair!] return: [integer!] /local res ][
       norm (a - b)
]
```

```
Z:\devygo\red\win\DemosRed\simpleCAD>..\..\red-29apr16-c32cd7a.exe -d -c calcs.r
ed

-=== Red Compiler 0.6.0 ===-

Compiling /Z/devygo/red/win/DemosRed/simpleCAD/calcs.red ...
...compilation time : 531 ms

Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/stack/push
*** expected: [struct! [
        header [integer!]
        data1 [integer!]
        data2 [integer!]
        data3 [integer!]
    ]], found: [struct! [
        header [integer!]
        ctx [pointer! [integer!]]
        symbol [integer!]
        index [integer!]
    ]]
*** in file: %/Z/devygo/red/win/DemosRed/simpleCAD/calcs.red
*** in function: exec/f_norm
*** at line: 1
*** near: [
    stack/push ~a223
    f_dot2d
    stack/unwind
    word/set
    stack/unwind
    stack/reset
    stack/mark-native
]
```




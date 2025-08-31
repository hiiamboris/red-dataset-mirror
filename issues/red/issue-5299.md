
#5299: emit-load not working within a R/S function or routine as expected.
================================================================================
Issue is closed, was reported by TimeSlip and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5299>

`buff: #{415555020F}` used in an R/S  func or routine produces compilation error. It works outside this context

````
test: func [
    /local buff [byte-ptr!]
][
    buff: #{415555020F}
]
````

````
c:\red>red-toolchain -c testloop2.red
-=== Red Compiler 0.6.4 ===-
Compiling c:\red\testloop2.red ...
Target: MSDOS

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : emit-load expected value argument of type: char logic integer word string path paren get-word object decimal issue
*** Where: comp-expression
*** Near:  [emitter/target/emit-load expr]
````

Tested on Windows




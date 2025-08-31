
#1427: Objects that return objects through "methods" do not work with make
================================================================================
Issue is closed, was reported by JacobGood1 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1427>

``` red
Red []

obj1: object [
    make: function [return: [object!]] [
        temp: object []
        temp
    ]
]
obj2: object [

]

make obj1/make obj2
```

**\* Red Compiler Internal Error: Script Error : any-function? expected value argument of type: word
**\* Where: comp-word



Comments:
--------------------------------------------------------------------------------

On 2015-11-12T02:58:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1427#issuecomment-155983168>

    The compiler forbids redefining core words, though it should provide you an nice error in that case instead of crashing. 

--------------------------------------------------------------------------------

On 2015-11-12T04:47:38Z, dockimbel, commented:
<https://github.com/red/red/issues/1427#issuecomment-155996691>

    Fixing the crash showed that the compiler _can_ handle redefinition of core words _inside_ object contexts, though, this is untested area.


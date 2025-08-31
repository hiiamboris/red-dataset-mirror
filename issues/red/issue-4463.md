
#4463: [Compiler] Internal error when overriding face's facet with an object
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4463>

**Describe the bug**

Compile this (in any mode):
```
Red [needs: 'view]
context [
	lay: make-face 'window
	lay/data: object [smth: does []]
]
```
The output is:
```
*** Red Compiler Internal Error: Script Error : Invalid path value: ctx||510
*** Where: get-prefix-func
*** Near:  [objects/context/ctx||510]
```

**Expected behavior**

Successful compilation

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 21-May-2020/6:17:34+03:00 commit #398d733
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-22T13:04:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4463#issuecomment-632680152>

    It works without outer `context` btw

--------------------------------------------------------------------------------

On 2020-05-22T18:31:26Z, meijeru, commented:
<https://github.com/red/red/issues/4463#issuecomment-632842591>

    A `window` face does not have a `data` facet specified in the docs.

--------------------------------------------------------------------------------

On 2020-05-22T18:33:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4463#issuecomment-632843188>

    Face type doesn't matter

--------------------------------------------------------------------------------

On 2021-05-18T14:30:24Z, zwortex, commented:
<https://github.com/red/red/issues/4463#issuecomment-843222680>

    As discussed here : https://gitter.im/red/help?at=60a3bf925ca66330b04dfba2
    
    A similar compile issue occurs in the snippet below that is trimmed down from a real-case issue with layout as the function f returning a window face :
    ```
    Red []
    f: function [] [ object [ x: none ] ]
    a: object [
        ;y: object [ x: none ]
        y: f
        y/x: object [
            g: function [] [ print "Hello" ]
            ;z: 1
        ]
    ]
    probe a
    ```
    
    Provokes the following compilation error :
    ```
    *** Red Compiler Internal Error: Script Error : Invalid path value: ctx||560   
    *** Where: get-prefix-func                                                     
    *** Near:  [objects/a/ctx||560]                                                
    ```
    
    The function f returns an object in a slot y, to which you subsequently assign another object to one of its slot (y/x:). If the object, assigned to y/x, has no function it works (comment g, uncomment z). If the object assigned to y/x is not returned by a function, but created within a, it works also (uncomment y: object ... comment y:f). It fails however, if the object is returned by a function and assigned an object that has a function.
    Compilation works also if you replace y/x: object... by y/x: make object! ...


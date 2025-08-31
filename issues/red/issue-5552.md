
#5552: Function is 'missing its local argument' 🤔
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5552>

**Describe the bug**

Here's two nearly identical function definitions which seem valid to my eye:
```
>> fun: function [/ref x /local y return: [block!]                             ] [a: 1 print "OK"]
*** Script Error: invalid function definition: [/ref x /local y return: [block!] a]
*** Where: native-function
*** Near : native-function spec body
*** Stack: probe function 

>> fun: function [/ref x /local y return: [block!] "locals follow docstring ->"] [a: 1 print "OK"]
== func [/ref x /local y return: [block!] "locals follow docstring ->" a][a: 1 print "OK"]

>> fun/ref 1
*** Script Error: fun is missing its local argument        ;) ???
*** Where: fun
*** Near : fun/ref 1
*** Stack: fun  
```

**To reproduce**
```
fun: function [/ref x /local y return: [block!]                             ] [a: 1 print "OK"]
fun: function [/ref x /local y return: [block!] "locals follow docstring ->"] [a: 1 print "OK"]
fun/ref 1
```

**Expected behavior**

- Personally I don't think that `return:` should be forced in between two refinements `/ref` and `/local`, though that's the only way it works currently. I would prefer to list in the spec ins first (arguments, refinements), outs second (return:)
- `function` should not produce invalid `func` specs
- Invalid `func` specs should not be accepted to create invalid functions that can't be called

**Platform version**
`Red 0.6.5 for Windows built 23-Oct-2024/2:43:13+07:00  commit #17c374f`


Comments:
--------------------------------------------------------------------------------

On 2024-10-30T13:37:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/5552#issuecomment-2447192278>

    Related:
    ```
    >> f: func [a [block!] return: [block!] /ref   /local x] []        ;) okay?
    == func [a [block!] return: [block!] /ref /local x][]
    
    >> f/ref []
    *** Script Error: f has no refinement called ref                   ;) ??
    *** Where: f
    *** Near : f/ref []
    *** Stack: f  
    
    >> f: func [a [block!] return: [block!] /ref y /local x] []        ;) only Y added
    *** Script Error: invalid function definition: [a [block!] return: [block!] /ref y /local x]
    *** Where: func
    *** Near : f: func [a [block!] return: [block!] /ref ] 
    *** Stack: f 
    ```

--------------------------------------------------------------------------------

On 2024-11-04T16:43:14Z, dockimbel, commented:
<https://github.com/red/red/issues/5552#issuecomment-2455198393>

    Usage of  `/local` as a marker for local words is problematic since Rebol2 days, it's meant to be replaced by something else, though we haven't decided yet what (`local:` was the candidate, maybe they are better options). Anyway `/local` is not part of the external interface, so that sticking `return:` after the input arguments is correct design, leaving internal words to be specified after that.



#1850: Calling a function passed as get argument inside another function does not work
================================================================================
Issue is closed, was reported by Zamlox and has 16 comment(s).
[status.waiting] [type.review]
<https://github.com/red/red/issues/1850>

Red 0.6.0:

```
red>> f2: func [:f][f]
== func [:f][f]
red>> f1: func [][print "f1 called"]
== func [][print "f1 called"]
red>> f2 f1
== f1
```

Rebol2:

```
>> f2: func [:f][f]
>> f1: func [][print "f1 called"]
>> f2 f1
f1 called
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-25T12:36:37Z, meijeru, commented:
<https://github.com/red/red/issues/1850#issuecomment-214296851>

    The desired effect is obtained with `f2: func [:f] [do f]`

--------------------------------------------------------------------------------

On 2016-04-25T13:58:07Z, Zamlox, commented:
<https://github.com/red/red/issues/1850#issuecomment-214339210>

    True. I would like to know if this will stay like this or it will change in future.
    Thanks.

--------------------------------------------------------------------------------

On 2016-04-27T05:19:46Z, dockimbel, commented:
<https://github.com/red/red/issues/1850#issuecomment-214972306>

    Red follows Rebol3's semantics for get-word/lit-word in function's spec block.
    
    Rebol3:
    
    ```
    >> f2: func [:f][f]
    >> f1: func [][print "f1 called"]
    >> f2 f1
    == f1
    ```
    
    This design choice will be re-examined to see which of Rebol2 or Rebol3 semantics for these features is the best to have in Red.

--------------------------------------------------------------------------------

On 2017-07-03T14:00:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1850#issuecomment-312653166>

    Rebol2 semantics seem better suited for cases like this one: https://gitter.im/red/bugs?at=595a427b329651f46e4ab00b

--------------------------------------------------------------------------------

On 2020-03-21T18:37:45Z, 9214, commented:
<https://github.com/red/red/issues/1850#issuecomment-602084888>

    For the reference, this type of semantics is [documented](https://github.com/red/red/wiki/[DOC]-Guru-Meditations#literal-arguments-and-get-arguments) in our wiki.

--------------------------------------------------------------------------------

On 2020-03-22T01:42:21Z, greggirwin, commented:
<https://github.com/red/red/issues/1850#issuecomment-602134054>

    There are many aspects to consider, including target use cases, call site usability, composition, ultimate goals, reasoning, and even performance. 
    
    Keeping things easy to reason about is my highest priority, which means defining goals and use cases. Ultimately, of course, it all comes down to understanding and controlling when evaluation occurs. Once it does, you can't go back. But we can control it at call sites at the top level, and in funcs that take unevaluated args. 
    
    Can we mock up a matrix, or more than one, laying out exactly what happens in various cases? There are a lot of combinations to consider, and doc'ing that very clearly should save us a lot of time explaining things, once a decision is made.
    
    ```
    ; Types to consider: [any-word! any-path! any-function! paren!]
    ; For this space-thought, use only parametersless funcs beyond `inner`.
    ;   Ops are an important consideration though.
    ;
    ; TBD tag things to see what evaluates.
    
    fn: does [print "func" none]
    par: quote (print "paren")
    
    outer: func [std* 'lit* :get*][
    	std*    lit*   get*
    	:std*  :lit*  :get*
    	; no need for lit option here
    
    	do  std*  do  lit*  do  get*
    	do 'std*  do 'lit*  do 'get*
    	do :std*  do :lit*  do :get*
    
    	inner  std*   lit*   get*
    	inner 'std*  'lit*  :get*
    	inner :std*  :lit*  'get*
    
    	() ; return unset for console
    ]
    
    inner: func [std* 'lit* :get*][
    	std* lit* get*
    ]
    
    outer   fn   fn   fn
    outer  'fn  'fn  'fn
    outer  :fn  :fn  :fn
    
    outer   par   par   par
    outer  'par  'par  'par
    outer  :par  :par  :par
    
    ;TBD  paths
    ```

--------------------------------------------------------------------------------

On 2020-07-17T16:24:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/1850#issuecomment-660202868>

    Red semantics is very easy to understand and remember. R2 is a total mess. I propose closing this.

--------------------------------------------------------------------------------

On 2020-07-17T20:25:23Z, greggirwin, commented:
<https://github.com/red/red/issues/1850#issuecomment-660321869>

    Closing. I added a note to the wiki entry on this, if someone would like to cook up an `arg-lab` tool, based on the matrix idea above, that would be cool.


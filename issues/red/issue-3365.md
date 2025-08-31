
#3365: rebind is too aggressive when copying a context
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[status.problem] [type.review] [type.compiler]
<https://github.com/red/red/issues/3365>

Originated from discussion https://redd.it/8g7oce

### Steps to reproduce the problem
Limited test case:
```
a: context [x: 1]
b: context [f: does [print x]]
x: 0
c: make a b
d: make b a
e: make b [x: 2]
f: copy d
g: copy e
h: make d []
i: make e []
b/f
c/f
d/f
e/f
f/f
g/f
h/f
i/f
```
B/F is supposed to be a *working* method that uses a global `x` word for it's purposes. All the copies (or make-s) that introduce a local `x` should not break the behavior of `f`. After all, what's the point of a copy if this copy is broken and does not function as the original?

General logic that seems valid to me is: if an object `b` is based on object `a` then *only* words of `a` (including those in the funcs of `a`) *that are bound to `a`* should be rebound to `b`.

### Actual behavior
```
>> b/f
0
>> c/f
1
>> d/f
0
>> e/f
0
>> f/f
1
>> g/f
2
>> h/f
1
>> i/f
2
```
### Expected behavior
Compare that to R2 (which follows the outlined logic, except it doesn't support `copy` on objects, so I omit those two):
```
>> b/f
0
>> c/f
0
>> d/f
0
>> e/f
0
;>> f/f
;>> g/f
>> h/f
0
>> i/f
0
```
Note `c` and `d` provide symmetric results, and all `f` funcs do what was intended at the time of their definition.
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 688 date: 5-May-2018/11:50:50 commit: #9ce2aacce1509943ac11efa3b13457e8a66f03b4 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-31T21:44:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/3365#issuecomment-393690572>

    See also https://github.com/red/red/issues/3406

--------------------------------------------------------------------------------

On 2022-09-01T21:44:18Z, dockimbel, commented:
<https://github.com/red/red/issues/3365#issuecomment-1234813491>

    Making a test implementation for supporting that feature works fine in the interpreter, but it seems too expensive to support in the compiler (makes test [dyn-4](https://github.com/red/red/blob/master/tests/source/units/object-test.red#L567) fail in objects tests). 
    
    The main issue then is that object's function evaluation switching from compiled code to evaluating saved body in Redbin format creates hard to fix binding issues (happens when `make` is used on an existing object in a dynamic way, such that the compiler cannot identify the prototype object statically). It seems possible to improve the compiler internals to better account for such cases, but it's a pretty heavy task, so we won't do it as the current compiler will be soon deprecated.
    
    Once we switch mezz code from compilation to full encapping model, we'll be able to add support for this ticket feature in the interpreter easily. (We could do it know, but that would break the compiled code in such a way that several object tests won't be passing anymore).


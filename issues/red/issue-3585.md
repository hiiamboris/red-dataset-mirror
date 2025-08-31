
#3585: Optional lit-word argument does not permit operator symbol as actual argument
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[type.review]
<https://github.com/red/red/issues/3585>

**Describe the bug**
Optional arguments, i.e. those occurring in the function spec *after*  a refinement, may be lit-words, just as regular (non-optional) arguments. However, when an operator symbol such as `*` is supplied as actual argument, it is not treated as  it should.
**To Reproduce**
```
>> f: func [/opt 'arg][print arg]
== func [/opt 'arg][print arg]
>> f/opt a
a
>> f/opt *
*** Script Error: * operator is missing an argument
*** Where: catch
*** Stack:  
```
Compare:
```
>> f: func ['arg][print arg]
== func ['arg][print arg]
>> f *
*
```
**Expected behavior**
```
>> f/opt *
*
```
**Platform version(please complete the following information):**
```
all, I presume
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-12T18:57:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3585#issuecomment-437991783>

    Good catch.

--------------------------------------------------------------------------------

On 2018-12-12T12:08:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3585#issuecomment-446565690>

    At first look, the performance cost for supporting that feature is so high, that I really doubt we will implement it. It would involve a deep analysis of the `path!` value during evaluation, searching for a possible function call in the path.
    
    Having the function's lit-word take precedence over the infix operator is already a very costly feature, that slows down the evaluation of most infix expressions (the ones in form of `<word> <op> ...`). Related implementation is [here](https://github.com/red/red/blob/master/runtime/interpreter.reds#L32). Have a look at `literal-first-arg?` to see how much processing is done there... just for checking if it's an infix expression or not...
    
    If consistency is to be enforced in this case, I am for removing that specific code, and giving back predecence to infix evaluation over literal argument fetching. 
    
    An alternative option would be to redesign the infix checking method in order to make it cheaper, so that we can enforce the literal argument fetching first, before having to do a premptive infix check.

--------------------------------------------------------------------------------

On 2018-12-12T13:11:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/3585#issuecomment-446583104>

    To make things worse:
    ```
    >> quote *
    == *
    >> system/words/quote *
    *** Script Error: * operator is missing an argument
    *** Where: catch
    *** Stack:
    ```
    Personally, I'm for consistency over anything else.

--------------------------------------------------------------------------------

On 2018-12-12T13:46:18Z, meijeru, commented:
<https://github.com/red/red/issues/3585#issuecomment-446592833>

    There is consistency between non-optional and optional arguments, there is also consistency with R2/3 - although that is normally called compatibility. Both R2 and R3 cope with this successfully...


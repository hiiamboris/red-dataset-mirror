
#4541: curious case of empty typesets in function's spec
================================================================================
Issue is closed, was reported by 9214 and has 10 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4541>

**Describe the bug**
Function specs permit optional typesets for arguments. If such typeset is empty, then the function does not accept any kind of actual parameters.

**To reproduce**
```red
>> anything: func [x][]
== func [x][]
>> nothing: func [x []][]
== func [x []][]

>> anything 1
>> anything "foo"
>> anything /bar

>> nothing 1
*** Script Error: nothing does not allow integer for its x argument
*** Where: nothing
*** Stack: nothing  

>> nothing "foo"
*** Script Error: nothing does not allow string for its x argument
*** Where: nothing
*** Stack: nothing  

>> nothing /bar
*** Script Error: nothing does not allow refinement for its x argument
*** Where: nothing
*** Stack: nothing  
```

**Expected behavior**
```red
*** Script Error: invalid function definition: []
*** Where: func
*** Stack:  
```

**Platform version**
2142264


Comments:
--------------------------------------------------------------------------------

On 2020-06-23T19:54:59Z, meijeru, commented:
<https://github.com/red/red/issues/4541#issuecomment-648384388>

    Is this a bug or a feature???

--------------------------------------------------------------------------------

On 2020-08-03T16:16:50Z, 9214, commented:
<https://github.com/red/red/issues/4541#issuecomment-668111674>

    Same behavior in both R2 and R3:
    ```red
    >> foo: func [x []][]
    >> foo 1
    ** Script Error: foo expected x argument of type:
    ** Near: foo 1
    ```
    ```red
    >> foo: func [x []][]
    >> foo 1
    ** Script error: foo does not allow integer! for its x argument
    ```
    I can't really see any use-case for that, except maybe for "clamping" function that you want to disable, but explicitly throwing a custom error message from within its body is IMO a more reasonable approach. Not to mention that modifying the spec after the function was created won't currently affect its behavior (but modifying body will).

--------------------------------------------------------------------------------

On 2020-08-05T14:48:32Z, 9214, commented:
<https://github.com/red/red/issues/4541#issuecomment-669237392>

    Another detail:
    ```red
    >> foo: func [return: [] /local x []][x: 1]
    == func [return: [] /local x []][x: 1]
    >> foo
    == 1
    ```
    Both type-specs are ignored though, the returned value can be anything, so as the value to which local word is set.

--------------------------------------------------------------------------------

On 2020-10-13T22:00:23Z, greggirwin, commented:
<https://github.com/red/red/issues/4541#issuecomment-708032812>

    I can't think of a use case either. Disallowing this seems like it won't cause anyone grief.

--------------------------------------------------------------------------------

On 2022-09-16T14:20:23Z, dockimbel, commented:
<https://github.com/red/red/issues/4541#issuecomment-1249424806>

    An empty spec block now is treated the same as no spec block and the allowed types fall back to `default!`.


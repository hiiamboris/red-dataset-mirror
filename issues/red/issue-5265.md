
#5265: Local words break SORT/COMPARE
================================================================================
Issue is closed, was reported by dsunanda and has 10 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5265>



**Describe the bug**
A SORT/COMPARE witt /LOCALs behaves badly

**To reproduce**
```
o1: make object! [x: 1 y: 90]
o2: make object! [x: 2 y: 1]
o3: make object! [x: 2 y: 2]

data: reduce [o1 o2 o3]

sort/compare data func [a b /local ra rb][
   ra: a/x + a/y
   print [ra a/x a/y]
   rb: b/x + b/y
   print [rb b/x b/y]
   return ra < rb
   ]
 probe data
```

Different results happen if either of the PRINTs are commented out. The results are not right, with or without either of the PRINTs. Repeated running can crash the console with no message.

**Expected behavior**
The data to be sorted.
It works just fine if the local words are global, or local to a function containing the SORT....
This works just fine:

```
my-func: func [/local o1 o2 o3 data ra rb][

o1: make object! [x: 1 y: 90]
o2: make object! [x: 2 y: 1]
o3: make object! [x: 2 y: 2]

data: reduce [o1 o2 o3]

sort/compare data func [a b][
   ra: a/x + a/y
   print [ra a/x a/y]
   rb: b/x + b/y
   print [rb b/x b/y]
   return ra < rb
   ]
 probe data
 
 ]
 
 my-func
```

**Platform version**

-----------RED & PLATFORM VERSION----------- 

RED: [ branch: "master" tag: #v0.6.4 ahead: 4610 date: 7-Dec-2022/11:23:15 commit: #864cd973f53298228f242f5653843cbd61b7cbe0 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22621 ]
--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2023-01-05T21:04:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/5265#issuecomment-1372753220>

    It's clear some stack misuse is going on here. Related: https://github.com/red/red/issues/4854 https://github.com/red/red/issues/4543
    I vaguely recall having similar problem with sort, one I couldn't reproduce reliably. Thanks for finding this @dsunanda :)

--------------------------------------------------------------------------------

On 2023-01-05T21:08:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5265#issuecomment-1372761311>

    Example outputs (commenting out `print`, removing `return`, etc):
    ```
    ra a/x a/y 2 1
    ... 1 90
    *** Script Error: cannot compare make vector! [] with [value make typeset! [datatype! unset! none! logic! block! paren! string! file!
    *** Where: <
    *** Near : return ra < rb
    *** Stack:
    ```
    ```
    ra a/x a/y 2 1
    ... 1 90
    *** Script Error: ra has no value
    *** Where: <
    *** Near : ra < rb
    *** Stack:
    ```

--------------------------------------------------------------------------------

On 2023-01-08T12:23:57Z, dsunanda, commented:
<https://github.com/red/red/issues/5265#issuecomment-1374823530>

    Hiiamboris says: the fix counts locals, so it misses refinements.
    
    Here's an example with a refinement that exhibits the original (bad!) behaviour:
    
    ```
    o1: make object! [x: 1 y: 90]
    o2: make object! [x: 2 y: 1]
    o3: make object! [x: 2 y: 2]
    data: random reduce [o1 o2 o3 o1 o1 o2 o3 o2]
    
    s-func: func [a b /x /local ra rb][
       ra: a/x + a/y
       print [ra a/x a/y]
       rb: b/x + b/y
      print [rb b/x b/y]
       return ra < rb
       ]
    sort/compare data :s-func
    
    *** Script Error: rb is missing its value argument
    *** Where: rb
    *** Near : return ra < rb
    ```

--------------------------------------------------------------------------------

On 2023-01-10T18:10:14Z, dockimbel, commented:
<https://github.com/red/red/issues/5265#issuecomment-1377657184>

    The callback function spec should be validated before sorting occurs. It needs to test for 2 argument words, possible `return:` and no other refinement than an eventual `/local`.
    
    We should do such user-provided callback spec validation systematically for all other similar cases (e.g. tracing callbacks).

--------------------------------------------------------------------------------

On 2023-01-15T09:41:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/5265#issuecomment-1383104073>

    should this issue stay open then?


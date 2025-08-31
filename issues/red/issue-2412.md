
#2412: Being able to take address of a struct! member using a get-path
================================================================================
Issue is closed, was reported by Zamlox and has 12 comment(s).
[status.built] [status.tested] [type.wish] [test.written]
<https://github.com/red/red/issues/2412>

Curently in Red/System it's not possible to get the address of a ```struct!``` member using ```:```. Doing pointer math calculation might be tedious if the ```struct!``` is large and members of different types.

Following construct would be much easier and elegant:
```
x: declare struct! [
    a   [integer!]
    b   [integer!]
]

y: :x/a
```
where ```y``` is of type ```int-ptr!```



Comments:
--------------------------------------------------------------------------------

On 2017-01-15T15:00:50Z, meijeru, commented:
<https://github.com/red/red/issues/2412#issuecomment-272700516>

    👍 The current system is not only tedious but also error prone in the sense that it depends on detailed knowledge of the way memory is allocated for structs. I would not be surprised if the Red runtime could benefit from this enhancement also.

--------------------------------------------------------------------------------

On 2017-03-31T10:19:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2412#issuecomment-290675753>

    All pointers taken to struct members are `pointer! [integer!]` by default (most common case).

--------------------------------------------------------------------------------

On 2017-03-31T12:25:23Z, Zamlox, commented:
<https://github.com/red/red/issues/2412#issuecomment-290698239>

    Thank you for implementing this feature.
    
    I have done a test with latest sources and I have an issue.
    Source code:
    ```
    Red/System []
    
    a: declare struct! [
        val [integer!]
    ]
    
    a/val: 23
    
    p-val: :a/val
    print [" p-val: " p-val/value lf]
    ```
    
    When I compile I get following output:
    ```
    Compiling d:\dev\work\fork_red\tests\test.reds ...
    
    Target: Windows
    
    Compiling to native code...
    *** Compilation Error: invalid path value: p-val/value
    *** in file: %/d/dev/work/fork_red/tests/test.reds
    *** at line: 1
    *** near: [10x1 " p-val: " p-val/value lf]
    ```
    
    
    Red info: 
    ```
    --== Red 0.6.2 ==-- 
    Type HELP for starting information. 
    
    >> about
    Red 0.6.2 - 31-Mar-2017/15:11:15+3:00
    ```

--------------------------------------------------------------------------------

On 2017-03-31T13:08:26Z, Zamlox, commented:
<https://github.com/red/red/issues/2412#issuecomment-290707208>

    I haven't tested with latest automated build which contains this fix. This might explain the issue I have.

--------------------------------------------------------------------------------

On 2017-03-31T13:51:44Z, Zamlox, commented:
<https://github.com/red/red/issues/2412#issuecomment-290717663>

    Tested with latest automated build and I got rid of compilation error.
    
    I run another test with embedded ```struct!``` and the result is not as expected.
    Test program:
    ```
    Red/System []
    
    b!: alias struct! [
        b1  [byte!]
        b2  [integer!]
    ]
    a: declare struct! [
        x   [byte!]
        bb  [b!]
        val [integer!]
    ]
    
    a/bb: as b! allocate size? b!
    a/bb/b1: #"A"
    
    p-bb-b1: :a/bb/b1
    print [" a/bb/b1: " a/bb/b1 lf]
    print [" p-bb-b1/value: " as byte! p-bb-b1/value lf]
    ```
    
    Result:
    ```
     a/bb/b1: A
     p-bb-b1/value: Ï
    ```
    
    Value of ```p-bb-b1/value``` should be ```A```.

--------------------------------------------------------------------------------

On 2017-04-01T04:28:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2412#issuecomment-290894092>

    Thank you for pointing out this issue with deeper get-paths. It should be fixed now.


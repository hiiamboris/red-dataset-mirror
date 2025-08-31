
#861: Handling float! pointer argument incorrectly in function on Linux-ARM
================================================================================
Issue is closed, was reported by qtxie and has 10 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/861>

Test code as below.

```
Red/System []

int64!: alias struct! [int1 [integer!] int2 [integer!]]

print-float-hex: func [
    number  [float!]
    tmp     [integer!]
    /local
        f   [int64!]
][
    f: as int64! :number   
    print-line ["value in print-float-hex " as byte-ptr! f/int2 " " as byte-ptr! f/int1]
]

foo-test: func [
    /local
        f   [float!]
        p   [pointer! [float!]]
        a   [int64!]
        tmp [integer!]
][
    f: 0.0
    a: as int64! :f
    p: as pointer! [float!] a
    tmp: 20
    print-line ["value before calling print-float-hex " as byte-ptr! a/int2 " " as byte-ptr! a/int1]
    print-float-hex p/value tmp         ;@@ tmp will impact p/value
    print-line ["value after calling print-float-hex " as byte-ptr! a/int2 " " as byte-ptr! a/int1]

]

foo-test
```

Results on Windows (Correct)

```
value before calling print-float-hex 00000000 00000000
value in print-float-hex 00000000 00000000
value after calling print-float-hex 00000000 00000000
```

Results on Linux-ARM (Incorrect)

```
value before calling print-float-hex 00000000 00000000
value in print-float-hex 00000014 00000000             ;@@
value after calling print-float-hex 00000000 00000000
```



Comments:
--------------------------------------------------------------------------------

On 2014-06-24T09:32:35Z, dockimbel, commented:
<https://github.com/red/red/issues/861#issuecomment-46950495>

    You are assuming there that `struct!` can be passed by value on the stack, but only passing them by reference is currently supported by the Red/System's compiler. So `a [int64!]` is reserving only the size of a pointer! to the struct on the stack (32-bit only) while you expect is will reserve 64-bit, hence the corruption. 
    
    The same applies for both current CPU backends, so the fact that the result is correct on x86 is just a lucky side-effect (in memory, the corruption occurs) ;-)

--------------------------------------------------------------------------------

On 2014-06-24T13:06:20Z, qtxie, commented:
<https://github.com/red/red/issues/861#issuecomment-46967918>

    @dockimbel `a` is only used to print the hex value of the float.
    Change `p: as pointer! [float!] a` to `p: as pointer! [float!] :f`, also get wrong result.
    
    ```
    foo-test: func [
        /local
            f   [float!]
            p   [pointer! [float!]]
            a   [int64!]
            tmp [integer!]
    ][
        f: 0.0
        a: as int64! :f
        p: as pointer! [float!] :f                ;@@
        tmp: 20
        print-line ["value before calling print-float-hex " as byte-ptr! a/int2 " " as byte-ptr! a/int1]
        print-float-hex p/value tmp         ;@@ tmp will impact p/value
        print-line ["value after calling print-float-hex " as byte-ptr! a/int2 " " as byte-ptr! a/int1]
    ]
    ```

--------------------------------------------------------------------------------

On 2014-06-24T22:08:20Z, qtxie, commented:
<https://github.com/red/red/issues/861#issuecomment-47037532>

    And note that `tmp`'s value will influence the results.
    
    ```
    value in print-float-hex 00000014 00000000             ;@@ tmp = 20 (20 = 14h)
    ```
    
    Set `tmp` to `10`
    
    ```
    value in print-float-hex 0000000A 00000000             ;@@ tmp = 10 (10 = 0Ah)
    ```

--------------------------------------------------------------------------------

On 2014-06-25T05:38:07Z, dockimbel, commented:
<https://github.com/red/red/issues/861#issuecomment-47062373>

    I had a doubt about it yesterday, you did well by reopening it, I need to reexamine that again.

--------------------------------------------------------------------------------

On 2014-06-26T07:26:24Z, dockimbel, commented:
<https://github.com/red/red/issues/861#issuecomment-47195403>

    The cause was a wrong argument stack layout when calling `print-float-hex` caused by the type of <last> value not refreshed, so a 32-bit push is done instead of a 64-bit push for the float! value.


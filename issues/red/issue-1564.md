
#1564: layout variables are undefined when compiled
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/1564>

This code works as expected when interpreted:

```
l: layout [
    x: text "Hello, World!"
]

probe x

view l
```

However, when compiling (with `needs: 'View` in the header):

```
*** Compilation Error: undefined word x
*** in file: %/H/Work/Red/Tests%20Red/2016-02-01-16-32-07-red-master/red-master/test2.red
*** near: [x view l]
```

However, the code compiles and runs as expected if `probe x` is replaced with `probe x/text` or `x/text: "Χαῖρε, κόσμε!"`, etc.



Comments:
--------------------------------------------------------------------------------

On 2016-02-04T03:00:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1564#issuecomment-179591657>

    This is by design. The compiler tries to be helpful by identifying, ahead of time, undefined variables by doing a static analysis of the code.Such approach is limited in an homoiconic language as it is not possible, for the compiler, to always distinguish _code_ from data, like for example here:
    
    ```
    data: [x: 123]
    do data
    print x
    ```
    
    However, there is a compilation option provided to relax this kind of checking, and allow compilation of more dynamic code using the `red-strict-check?` compilation option (see [config file](https://github.com/red/red/blob/master/system/config.r#L10)). It is possible since a recent commit, to insert compilation options directly into the Red header. The following code shows how to use it to achieve compilation of more dynamic code:
    
    ```
    Red [
        Needs: View
        Config: [red-strict-check?: no]
    ]
    
    l: layout [x: text "Hello, World!"]
    probe x
    view l
    ```


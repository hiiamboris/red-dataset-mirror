
#211: Float32! arguments to typed functions appear incorrect 
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/211>

Passing two float32! arguments to a typed function appears to generate incorrect results:

Code

``` rebol


Red/System []

print ["declarations" lf]

myfunc: function [
    [typed]
    count [integer!]
    list [typed-value!]
        return: [float32!]
        /local
          a [float32!]
          b [float32!]
    ][
     a: as float32! list/value
     list: list + 1
     b: as float32! list/value
     a + b
    ]

print ["started" lf]

y: myfunc as-float32 1.0 as-float32 2.0

if y =  as-float32 3.0 [print ["3.0" lf]]
if y <  as-float32 3.0 [print ["< 3.0" lf]]
if y >  as-float32 3.0 [print ["> 3.0" lf]]

print ["finished" lf]

```

Output

```
declarations
started
< 3.0
finished

```



Comments:
--------------------------------------------------------------------------------

On 2012-03-06T23:24:35Z, dockimbel, commented:
<https://github.com/red/red/issues/211#issuecomment-4358731>

    Your example does not do what you think it should do because you are passing only one argument to `myfunc` instead of two. You need to add square brackets to pass several arguments to a variadic or typed function, like this:
    
    ```
    y: myfunc [as-float32 1.0 as-float32 2.0]
    ```
    
    Doing so, will make your program correctly output `3.0` instead of `< 3.0`.

--------------------------------------------------------------------------------

On 2012-03-07T02:04:31Z, PeterWAWood, commented:
<https://github.com/red/red/issues/211#issuecomment-4360802>

    Oops I forgot the [] !!!


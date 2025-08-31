
#1135: `error? try` inside a function crash the console
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1135>

`try` outside a function, no problem:

``` rebol
red>> error? try [unset-word]
== true
```

inside a function it crash the console:

``` rebol
red>> a: func [v [block!]][error? try v]
== func [v [block!]][error? try v]
red>> a [unset-word]

*** Runtime Error 1: access violation
*** at: 0001C70Eh
```

while this looks like inconsistent, should return an error, not the molded function:

``` rebol
red>> a: func [v [block!]][try v]
== func [v [block!]][try v]
red>> a [unset-word]
== "func [v [block!]][try v]"
```




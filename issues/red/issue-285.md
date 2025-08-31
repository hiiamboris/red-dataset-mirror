
#285: Infix function defined in context will not compile, gives strange error message
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/285>

I compiled

```
c: context [
    f: func [[infix] a [integer!] b [integer!] return: [integer!]][a + b]
    print 1 f 2
]
```

Result:

```
*** Compilation Error: missing argument
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-04T14:45:00Z, dockimbel, commented:
<https://github.com/red/red/issues/285#issuecomment-10051153>

    Fixed by commit [d490d2c4](https://github.com/dockimbel/Red/commit/d490d2c4a61da63cc4a30471d913d053b74cac2a).


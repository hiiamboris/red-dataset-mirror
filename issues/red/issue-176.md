
#176: Callbacks cconv are not resolved when passed to variadic functions
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [status.resolved]
<https://github.com/red/red/issues/176>

The compiler is not able to pass the limit of a variadic function to determine the right calling convention to apply to a callback function. 

Example code:

```
#import [
    "barlib.dll" cdecl [
        bar: "bar" [ptr [integer!]]
    ]
]

action: func [[callback]][]

foo: func  [[variadic] count [integer!] list [int-ptr!]][
    bar list/value
]

foo [:action]
```

In this example, the calling convention for `action` is undetermined at the end of the compilation, so the default stdcall convention will be applied resulting in stack corruption.




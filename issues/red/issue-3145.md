
#3145: Compilation of Red/System import in Red file fails if "data" ist defined
================================================================================
Issue is closed, was reported by a-nick-fischer and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3145>

(English is not my first language, if something is unclear, just ask)

### Expected behavior
Compiles as usual.
### Actual behavior
```
PS C:\Users\User\Desktop\OrdeR\gs> red -r a.red

-=== Red Compiler 0.6.3 ===-

Compiling C:\Users\User\Desktop\OrdeR\gs\a.red ...
...compilation time : 3895 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: invalid struct syntax: [
    extra [integer!]
    path-data [red/PATHDATA]
    points-data [red/tagPOINT]
    matrix [integer!]
    colors [pointer! [integer!]]
    colors-pos [pointer! [float32!]]
    spread [integer!]
    type [integer!]
    count [integer!] struct! [dummy [integer!]] [tagPOINT]
    positions? [logic!]
    created? [logic!]
    transformed? [logic!]
]
*** in file: %/C/Users/User/Desktop/OrdeR/gs/definitions.reds
*** at line: 207
*** near: [alias struct! [
        extra [integer!]
        path-data [red/PATHDATA]
        points-data [red/tagPOINT]
        matrix [integer!]
        colors [pointer! [integer!]]
        colors-pos [pointer! [float32!]]
        spread [integer!]
        type [integer!]
        count [integer!] struct! [dummy [integer!]] [tagPOINT]
        positions? [logic!]
        created? [logic!]
        transformed? [logic!]
    ]
    curve-info!: alias struct! [
        type [integer!]
        control [tagPOINT]
    ]
    arcPOINTS!:
]
```
### Steps to reproduce the problem
Create a file named `a.red` with the following content:
``` Red
Red []
#system-global [
    #include %b.reds
]
```

Then, create a file `b.reds` with the following content:
``` Red/System
Red/System []
#define data 1
```

Then, try to compile `a.red` in release mode.
### Red version and build date, operating system with version.
```
Windows 10 x64
Red 0.6.3 build 12-Aug-2017/21:38:44+02:00
```


Comments:
--------------------------------------------------------------------------------

On 2017-12-19T09:11:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3145#issuecomment-352683096>

    When I compile your files here, I get:
    ```
    *** Compilation Error: invalid struct syntax: [
        extra [integer!]
        path-data [red/PATHDATA]
        points-data [red/tagPOINT]
        matrix [integer!]
        colors [pointer! [integer!]]
        colors-pos [pointer! [float32!]]
        spread [integer!]
        type [integer!]
        count [integer!] 1 [tagPOINT]
        positions? [logic!]
        created? [logic!]
        transformed? [logic!]
    ]
    *** in file: %/C/dev/Red/runtime/definitions.reds
    *** at line: 207
    *** near: ...
    ```
    
    The compiler complains because the `gradient!` structure in the runtime library contains an invalid entry: `1 [tagPOINT]`, which is caused by your new definition of `data` (original struct member is `data [tagPOINT]`). So the compiler's complaint there is legitimate.
    
    The preprocessor in Red/System (and Red too) is global, so you need to be careful about which identifiers you are redefining. Once we get support for modular compilation, we should be able to restrict it per-modules, but until then, you need to be careful (prefixing with a unique name is the usual way to avoid clashes).
    


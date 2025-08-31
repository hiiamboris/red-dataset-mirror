
#195: Incorrect/Duplicate warning messages about unnecessary cast
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/195>

Under certain circumstances duplicate and incorrect:

Case 1

Code

``` rebol
Red/System []

1000 = as integer! (1000 * #"^(01)")
```

Result

```
Compiling /Users/peter/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^A")]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^A")]
Script: "Red/System Mach-O format emitter" (none)

...compilation time:     94 ms
...linking time:         8 ms
...output file size:     16384 bytes
```

 Case 2

Code

``` rebol

Red/System []

1000 = as integer! (1000 * #"^(01)")
2000 = as integer! (1000 * #"^(02)")
3000 = as integer! (1000 * #"^(03)")
4000 = as integer! (1000 * #"^(04)")

```

Result

```

-= Red/System Compiler =- 
Compiling /Users/peter/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^A") 
    2000 = as integer! (1000 * #"^B") 
    3000 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^A") 
    2000 = as integer! (1000 * #"^B") 
    3000 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^B") 
    3000 = as integer! (1000 * #"^C") 
    4000 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^B") 
    3000 = as integer! (1000 * #"^C") 
    4000 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^C") 
    4000 = as integer! (1000 * #"^D")
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^C") 
    4000 = as integer! (1000 * #"^D")
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^D")]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^D")]
Script: "Red/System Mach-O format emitter" (none)

...compilation time:     100 ms
...linking time:         8 ms
...output file size:     16384 bytes

```

Case 3

Code 

``` rebol

Red/System []

1000 = as integer! (1000 * #"^(01)")
10 = as integer! (#"^(01)" * 10)

```

Result

```
-= Red/System Compiler =- 
Compiling /Users/peter/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^A") 
    2000 = as integer! (1000 * #"^B") 
    3000 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^A") 
    2000 = as integer! (1000 * #"^B") 
    3000 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^B") 
    3000 = as integer! (1000 * #"^C") 
    4000 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^B") 
    3000 = as integer! (1000 * #"^C") 
    4000 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^C") 
    4000 = as integer! (1000 * #"^D") 
    10 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^C") 
    4000 = as integer! (1000 * #"^D") 
    10 =
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^D") 
    10 = as integer! (#"^A" * 10)
]
*** Warning: type casting from integer! to integer! is not necessary 
*** in: %/Users/peter/Code/Red-System/test.reds 
*** at: [(* 1000 #"^D") 
    10 = as integer! (#"^A" * 10)
]
Script: "Red/System Mach-O format emitter" (none)

...compilation time:     99 ms
...linking time:         11 ms
...output file size:     16384 bytes

```



Comments:
--------------------------------------------------------------------------------

On 2012-03-12T13:12:45Z, dockimbel, commented:
<https://github.com/red/red/issues/195#issuecomment-4451287>

    After deeper analysis of this behavior, it seems that having two warnings is legitimate from the compiler point of view. For example, given the following expression:
    
    ```
    1000 = as integer! (1000 * #"^(01)")
    ```
    - one warning is raised when `as integer!` is compared to the type returned by `(1000 * #"^(01)")`
    - another warning is raised when the left `1000` value type is compared to the type of the expression at right of `=`.
    
    So, the compiler is right in this case, even if it can look a bit odd to the user, I think we should keep it as is.


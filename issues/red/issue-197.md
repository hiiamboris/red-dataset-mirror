
#197: Compile error when using initialised local variable in until loop
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/197>

If a local variable is both declared and initialised in a function and then used inside an until loop, the compiler gives an error message saying the local variable is uninitialised. Although the message refers to a local variable, it seems that until is looking for a global variable (see second code sample).

Code 

``` rebol
Red/System []
f: func [
  i               [integer!]
  /local
  divisor         [integer!]
][
  ﻿divisor: 1000000000
  until [
    divisor = 1000000000
  ]  
]

f 1
```

Output

```
Compiling /Users/peter/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compilation Error: local variable divisor used before being initialized! 
*** in file: %/Users/peter/Code/Red-System/test.reds 
*** in function: f
*** at line: 9 
*** near: [
    divisor 1000000000
]

```

Code Sample 2

``` rebol
Red/System []
divisor: 1000000000
f: func [
  i               [integer!]
][
  until [
    divisor = 1000000000
  ]  
]

f 1

print ["finished" lf]
```

Output

```
-= Red/System Compiler =- 
Compiling /Users/peter/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
Script: "Red/System Mach-O format emitter" (none)

...compilation time:     122 ms
...linking time:         9 ms
...output file size:     16384 bytes
finished

```



Comments:
--------------------------------------------------------------------------------

On 2012-01-12T23:36:14Z, dockimbel, commented:
<https://github.com/red/red/issues/197#issuecomment-3472704>

    When I copy/paste your first code sample in my code editor, this is what I get:
    
    ```
    Red/System []
    f: func [
      i               [integer!]
      /local
      divisor         [integer!]
    ][
      ﻿?divisor: 1000000000
      until [
        divisor = 1000000000
      ]  
    ]
    
    f 1
    ```
    
    Notice the `?` in front of `?divisor`. It seems that your editor had an issue probably related to Unicode encoding. When I removed that extra character, it compiles fine. You are using two different variable names in the function body, so that the compiler's complaint seems legitimate.

--------------------------------------------------------------------------------

On 2012-01-13T02:39:43Z, PeterWAWood, commented:
<https://github.com/red/red/issues/197#issuecomment-3474532>

    Thanks.


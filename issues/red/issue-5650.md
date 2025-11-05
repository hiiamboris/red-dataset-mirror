# Issue #5650: [RS] Some issues with return keyword
<https://github.com/red/red/issues/5650>

**To reproduce**
```
Red/System []

castb: func [pos [integer!] return: [logic!]] [return as-logic (#"^(01)" << pos)]
; b: as-integer (as-logic (#"^(01)" << 3)) ; Compiler internal error

b2: castb 3
print-line as-integer b2 ; 4206600 - Wrong

b3: as-logic (#"^(01)" << 3)
print-line as-integer b3 ; 1 - Correct
```
There are two issues in above script.
1. `castb` returns unexpected value. It works as expected if remove the `return` keyword in function body.
```
castb: func [pos [integer!] return: [logic!]] [as-logic (#"^(01)" << pos)]
````
2. Compilation error for this line of code:
```
b: as-integer (as-logic (#"^(01)" << 3)) ; Compiler internal error
```

**Platform version**
All platforms, latest Red with commit: https://github.com/red/red/commit/c0a87fbe6b9813bdeb4cdea2e41512bb718fafa4



<no comments>

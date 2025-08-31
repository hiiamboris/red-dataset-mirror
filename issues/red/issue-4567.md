
#4567: mysterious "argument type mismatch" compiler error
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4567>

**Describe the bug**
A "what the actual fbugck?!" award nominee.

**To reproduce**
Compile the script below:
```red
Red [] objects/1
```

```red
Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/eval-int-path*

*** expected: [struct! [
        header [integer!]
        data1 [integer!]
        data2 [integer!]
        data3 [integer!]
    ]], found: [integer!]
*** in file: %utils/preprocessor.r
*** at line: 1
*** near: [1
    stack/unwind #user-code
```

Now change `objects` to some other word _and it will compile_.

**Expected behavior**
Ideally and in all cases: an "undefined symbol" error. Else a successful compilation with a subsequent run-time error.

**Platform version**
4e9d770, W10.




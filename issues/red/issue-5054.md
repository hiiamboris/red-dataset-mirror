
#5054: [Regression] R/S Compiler won't accept float arguments to % and // anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.dismissed] [Red/System] [type.compiler]
<https://github.com/red/red/issues/5054>

**Describe the bug**

The following script:
```
Red/System []
probe 123.0 // 10.0
probe 123.0 % 10.0
```
With:
- `red-01jun19-66d20bd7.exe` compiles, outputs `3.0` for both
- `red-23jul19-613d71cf.exe` and later errors out:
```
*** Compilation Error: argument type mismatch on calling: //
*** expected: [number!], found: [float!]
*** in file: %/D/devel/red/unicode/1.red
*** at line: 2
*** near: [123.0 10.0]
```

**Expected behavior**

`3.0`

**Platform version**
```
Red 0.6.4 for Windows built 14-Jan-2022/17:48:17+03:00  commit #4923e32
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-26T01:47:19Z, qtxie, commented:
<https://github.com/red/red/issues/5054#issuecomment-1021777378>

    Those operators are only for integer! now.
    https://static.red-lang.org/red-system-specs.html#section-4.3
    
    > 4.3.3 Math operations
    > 
    > All Red/System math operators (+, -, *, /, //, %) are supported. The default rounding method on results is "rounding to nearest". Both operands need to be of float! types (no implicit casting).
    > 
    > The modulo (//) and remainder (%) operators are not defined for float! values (use the C `fmod()` function if such feature is needed).

--------------------------------------------------------------------------------

On 2022-01-26T11:16:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5054#issuecomment-1022102696>

    OK in that case I expect the compiler to tell me that instead of saying that `float!` doesn't fit the `number!` somehow

--------------------------------------------------------------------------------

On 2022-01-26T12:57:59Z, qtxie, commented:
<https://github.com/red/red/issues/5054#issuecomment-1022173284>

    Don't expect a _temporary_ compiler works perfectly. We'll do better in the self-hosted toolchain.

--------------------------------------------------------------------------------

On 2022-01-26T13:03:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5054#issuecomment-1022177045>

    OK feel free to close it then.

--------------------------------------------------------------------------------

On 2022-01-26T15:38:03Z, dockimbel, commented:
<https://github.com/red/red/issues/5054#issuecomment-1022319427>

    We have dropped native support for modulos on floats as the behavior differs between platforms. `fmod()` is the only consistent way.


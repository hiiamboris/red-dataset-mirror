
#2672: Compiling XOR in PAREN can throw "more than one expression..." error
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
<https://github.com/red/red/issues/2672>

I have this line of Red/System code:
```
pos/value and (as-byte 128 >> (bit and 7) xor 255)
```

it used to compile fine, but now I get an error:
```
*** Compilation Error: more than one expression found in parentheses
*** in file: %/e/Code/some-dir/some-file.reds
*** in function: exec/set-bit
*** at line: 41
*** near: (xor 255)
```

Putting the `xor` expression into `paren!` does not help, it still throws same error.


Comments:
--------------------------------------------------------------------------------

On 2017-06-21T12:07:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2672#issuecomment-310058585>

    I cannot reproduce the error using the following code:
    ```
    pos: as byte-ptr! 0
    bit: 58
    
    probe pos/value and (as-byte 128 >> (bit and 7) xor 255)
    ```


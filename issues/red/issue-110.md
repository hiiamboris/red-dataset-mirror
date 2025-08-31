
#110: PRIN-HEX on a negative integer aborts the program silently
================================================================================
Issue is closed, was reported by dockimbel and has 10 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/110>

```
print "starting"
prin-hex -1
prin newline
print "finished"
```

outputs:

```
starting
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-25T22:02:33Z, dockimbel, commented:
<https://github.com/red/red/issues/110#issuecomment-1439368>

    The issue is caused by `prin-hex` expecting a positive remainder when dividing by 16. But as 16 is a power of 2, the code emitter chooses SAR mnemonic instead of IDIV. Moreover, there is a difference in the calculation of the remainder when applied to negative integers, as stated by Intel's "IA32 Intruction Set Reference Vol.2", page 3-623:
    
    <blockquote>Using the SAR instruction to perform a division operation does not produce the same result as
    the IDIV instruction. The quotient from the IDIV instruction is rounded toward zero, whereas
    the “quotient” of the SAR instruction is rounded toward negative infinity. This difference is
    apparent only for negative numbers. For example, when the IDIV instruction is used to divide
    -9 by 4, the result is -2 with a remainder of -1. If the SAR instruction is used to shift -9 right by
    two bits, the result is -3 and the “remainder” is +3; however, the SAR instruction stores only the
    most significant bit of the remainder (in the CF flag). </blockquote>

--------------------------------------------------------------------------------

On 2011-06-26T11:29:12Z, dockimbel, commented:
<https://github.com/red/red/issues/110#issuecomment-1440658>

    I think it is necessary to support both "modulo" and "remainder" operations. The current `//` operator produces a remainder result, so a new operator name/symbol needs to be introduced. In most other programming languages, (e.g. in C, Java, Javascript, Perl and Python), the remainder operator is `%`, wrongly called "modulo".
    
    As shown on [this page](http://en.wikipedia.org/wiki/Modulo_operation), modulus/remainder support across languages is not consistent.
    
    For Red and Red/System, we could use:
    - `//` as the modulo operator returning always a positive value: -5 // 2 = 1 (equivalent to REBOL's `modulo` function)
    - `%` as the remainder operator returning a value which sign is the sign of the dividend: -5 % 2 = -1 (equivalent to REBOL's `remainder` function and `//` operator)
    
    This choice would privilege C/Java/Python compatibility rather than REBOL's one. 
    
    _Side note_: REBOL returns a syntax error on `%` in order to catch literal file! values typos (my guess). Red will use the same syntax for literal files, but as it will be statically analysed for correctness, such typo cases could be caught at compile-time, so could not be misinterpreted as a remainder operator.

--------------------------------------------------------------------------------

On 2011-06-26T12:48:39Z, dockimbel, commented:
<https://github.com/red/red/issues/110#issuecomment-1440780>

    Discussion moved out of this ticket to the [mailing-list](http://groups.google.com/group/red-lang/browse_thread/thread/2052370d03cb4567?hl=en).

--------------------------------------------------------------------------------

On 2011-07-02T13:25:08Z, dockimbel, commented:
<https://github.com/red/red/issues/110#issuecomment-1489349>

    The crash is caused by `prin-hex` going into an infinite loop when `-1` is passed as argument. The missing runtime error is caused by the data segment being corrupted, so the runtime error messages are lost.
    
    The infinite loop is caused by `i: i / 16` resulting in `-1` if `i = -1`. The wanted operation is a logical right shift by 4 bits, but only arithmetic shifts are currently supported in the compiler. A new  [bitshifts](https://github.com/dockimbel/Red/tree/bitshifts) branch has been created to extend the support for shift operations.
    
    Note: store error messages in a read-only section/segment in the executable to avoid such corruption.

--------------------------------------------------------------------------------

On 2011-07-03T14:43:49Z, dockimbel, commented:
<https://github.com/red/red/issues/110#issuecomment-1493310>

    `prin-hex` changed to use new `>>>` operator for unsigned right shifting of input value. Now works correctly for negative values.


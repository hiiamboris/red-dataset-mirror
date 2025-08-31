
#3613: integer overflow in pair values is not handled correctly
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
<https://github.com/red/red/issues/3613>

**Describe the bug**
A `pair!` literal with a component larger than (2 ** 31 - 1) is not giving an error. Instead, the component is changed to - (2 ** 31), regardless of its value.

**To Reproduce**
```
>> p: 0x2147483648  ;; 1 larger than allowed - an overflow error should be reported
== 0x-2147483648
>> p: 0x2147483649  ;; 2 larger
== 0x-2147483648
>> p: 0x2147483650  ;; 3 larger
== 0x-2147483648
```
**Platform version(please complete the following information):**
```
presumably all
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-26T21:34:30Z, meijeru, commented:
<https://github.com/red/red/issues/3613#issuecomment-441807076>

    I hit on this when playing around with `0x...` lexemes that may be used for `hex!` literals. There is a potential ambiguity between those literals and the ones for `pair!` values. 
    
    In parallel, I observed that `load` converts strings that are "overflowing integers" into floats, e.g.
    `load "2147483648"` => `2147483648.0`

--------------------------------------------------------------------------------

On 2018-11-26T21:43:38Z, endo64, commented:
<https://github.com/red/red/issues/3613#issuecomment-441810179>

    Behavior of converting to float of overflowing integers is same as R2.

--------------------------------------------------------------------------------

On 2018-11-26T21:45:16Z, 9214, commented:
<https://github.com/red/red/issues/3613#issuecomment-441810708>

    This was already reported https://github.com/red/red/issues/3228

--------------------------------------------------------------------------------

On 2018-11-26T21:49:09Z, meijeru, commented:
<https://github.com/red/red/issues/3613#issuecomment-441811896>

    Sorry! It is increasingly difficult to check if an issue has already been reported, since there are so many... I came to this from an angle which in itself has some interest (literals for hex!) but will close it anyhow.

--------------------------------------------------------------------------------

On 2018-11-27T00:57:49Z, greggirwin, commented:
<https://github.com/red/red/issues/3613#issuecomment-441857283>

    It will only get worse, until there's a better system than github tickets, because some things get closed, and reported anew. 


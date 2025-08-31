
#2997: mod and modulo
================================================================================
Issue is open, was reported by 419928194516 and has 10 comment(s).
[type.design]
<https://github.com/red/red/issues/2997>

Currently mod is implemented as:
```red
func [
    "Compute a nonnegative remainder of A divided by B" 
    a [number! char! pair! tuple! vector! time!] 
    b [number! char! pair! tuple! vector! time!] "Must be nonzero" 
    return: [number! char! pair! tuple! vector! time!] 
    /local r
][
    if (r: a % b) < 0 [r: r + b] ; <-- Assumes a non composite type 0 <> vec[0]
    a: absolute a ; ; <-- Assumes a non composite type, absolute not defined on vectors!
    either all [a + r = (a + b) r + r - b > 0] [r - b] [r]  ; <-- Assumes a non composite, type 0 <> vec[0]
]
```
and "modulo" is implemented as:
```red
func [
    {^{Wrapper for MOD that handles errors like REMAINDER. Negligible values (compared to A and B) are rounded to zero} 
    a [number! char! pair! tuple! vector! time!] 
    b [number! char! pair! tuple! vector! time!] 
    return: [number! char! pair! tuple! vector! time!] 
    /local r
][
    r: mod a absolute b ; <-- Assumes a non composite type, absolute not defined on vectors!
    either any [a - r = a r + b = b] [0] [r] ; <-- Assumes a non composite type 0 <> vec[0]
]
```

My suggestion would be to implement mod as:
```red
mod: function[
    "Compute the mathematical modulus for integers and their composite types"
    a [integer! char! pair! tuple! vector! time!]
    b [integer! char! pair! tuple! vector! time!]
    return: [integer! char! pair! tuple! vector! time!]
][
    a % b + b % b ; well defined on all types in the signature, but not non-negative, e.g.
    ; compose [(mod 7 4) (mod -7 4)(mod 7 -4) (mod -7 -4)]
    ; => [3 1 -1 -3]
    ; compared to 
    ; compose [(7 % 4) (-7 % 4) (7 % -4) (-7 % -4)]
    ; [3 -3 3 -3]
]
```
With a possible refinement to handle b = 0

I'd also suggest deleting modulo entirely and if desired implement an fmod that handles very small and very nearby floats
with possible refinements that handle rounding and division by zero
```red
fmod: function[
    "floating modulus semantics"
    a [float! percent! vector!]
    b [float! percent! vector!]
    return: [float! percent! vector!]
][
    ; tricky impl
]
```

The reason this wasn't caught was that there are no tests for the composite type mod operation.




Comments:
--------------------------------------------------------------------------------

On 2017-08-23T21:08:59Z, geekyi, commented:
<https://github.com/red/red/issues/2997#issuecomment-324463212>

    Related #2674 (from chat)

--------------------------------------------------------------------------------

On 2018-07-14T12:36:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/2997#issuecomment-405021089>

    I totally support that. Not just the logic of mod/modulo is super fuzzy, it's also totally wrong as shown by the reporter. I'll add a few cents: apart from not supporting composite types, it also returns wrong types:
    ```
    >> mod 0:0:1 10:0:0
    == 0:00:01
    >> mod 0:0:0 10:0:0
    == 0:00:00
    >> modulo 0:0:0 10:0:0
    == 0
    ```
    (the last one should obviously be 0:00:00)
    The proposed solution would fix that:
    ```
    >> 0:0:0 % 10:0:0 + 10:0:0 % 10:0:0
    == 0:00:00
    ```

--------------------------------------------------------------------------------

On 2018-10-12T08:33:27Z, bitbegin, commented:
<https://github.com/red/red/issues/2997#issuecomment-429248794>

    > The quotient, q = a / n, is calculated according to the ROUNDING-MODE that corresponds to the chosen MODULO-MODE.
    >The remainder, r, is calculated as: r = a - n * q.
    
    So, we should use MODULO-MODE (or ROUNDING-MODE, like below) to get `q`, and the modulo is `r`
    
    
    Value | Description
    -- | --
    UP | Rounds away from zero
    DOWN | Rounds towards zero
    CEIL | Rounds towards  Infinity
    FLOOR | Rounds towards  -Infinity
    HALF_UP | Rounds towards nearest neighbour.  If equidistant, rounds away from zero
    HALF_DOWN | Rounds towards nearest neighbour.  If equidistant, rounds towards zero
    HALF_EVEN | Rounds towards nearest neighbour.  If equidistant, rounds towards even neighbour
    HALF_CEIL | Rounds towards nearest neighbour.  If equidistant, rounds towards  Infinity
    HALF_FLOOR | Rounds towards nearest neighbour.  If equidistant, rounds towards  -Infinity
    
    then, `mod` = `modulo`

--------------------------------------------------------------------------------

On 2020-03-21T20:00:16Z, 9214, commented:
<https://github.com/red/red/issues/2997#issuecomment-602095938>

    https://github.com/red/red/issues/2708

--------------------------------------------------------------------------------

On 2020-07-14T14:25:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/2997#issuecomment-658211510>

    https://github.com/red/red/issues/2433#issuecomment-538468036 and below
    
    [Working implementation is now here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/modulo.red)


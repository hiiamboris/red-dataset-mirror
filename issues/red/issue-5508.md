
#5508: `round/even/to` doesn't work on `money!`
================================================================================
Issue is open, was reported by greggirwin and has 6 comment(s).
<https://github.com/red/red/issues/5508>

**Describe the bug**

```
>> round/even/to 0.125 0.01
== 0.12
>> round/even/to 0.135 0.01
== 0.14
>> round/even/to $0.125 0.01
== $0.13
>> round/even/to $0.135 0.01
== $0.14
```

Looks like it just checks the whole value for evenness, not the scale.
```
_even?     [either all [half? even? value][down][away]]
```

**Expected behavior**

Same as for float!


**Platform version**

-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.0 ahead: 9031 date: 26-May-2024/2:09:32 commit: #b26ec93344128ae0d49aeb5f6d46ecd5f005631b ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------


Comments:
--------------------------------------------------------------------------------

On 2025-03-14T17:03:55Z, 9214, commented:
<https://github.com/red/red/issues/5508#issuecomment-2725265207>

    Well, since I was assigned to this ticket... 👀 
    
    Banker's rounding (aka round-half-even) should round half-way values to the nearest even multiple, but the definition of "half-way value" is misinterpreted in `money!` implementation. "Half-way" doesn't mean `0.5` fractional part specifically, but rather, more generally, an equal distance between either multiple, away or towards zero.
    
    And if both multiples are odd (e.g. `14.25` is half-way between `9.5` and `19.0`), at least this relation should hold:
    
    ```red
    (round/to/even X Y) == (Y * round X / Y)
    ```
    
    So, `half?` flag needs to be tweaked (I think checking `lower` and `upper` equality will do), and `HALF_FRACTIONAL` with `KEEP_FRACTIONAL` macros should be be done away with.
    
    And the relevant `case` branch should be something like `either all [half? even? down][down][away]`, except that you'll need an extra stack slot for that and calling `down` subroutine twice is icky.

--------------------------------------------------------------------------------

On 2025-03-14T18:13:19Z, greggirwin, commented:
<https://github.com/red/red/issues/5508#issuecomment-2725429784>

    Thanks @9214!

--------------------------------------------------------------------------------

On 2025-03-14T19:55:43Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5508#issuecomment-2725624595>

    Thanks @9214 hope one day you will be with us again. We miss you! 


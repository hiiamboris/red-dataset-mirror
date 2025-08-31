
#707: Expecting availability actions. Remainder crashes console.
================================================================================
Issue is closed, was reported by iArnold and has 4 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/707>

After typing "help action!" I see a list of available actions in Red.
Users might think they can use these when playing around with the console.

Action remainder is missing in action:
C:\dosprompt>console.exe

-=== Red Console alpha version ===-
Type HELP for starting information.

red>> ? action!
    make        => Returns a new value made from a spec for that value's type.
    reflect     => Returns internal details about a value via reflection.
    form        => Returns a user-friendly string representation of a value.
    mold        => Returns a source format string representation of a value.
    absolute    => Returns the non-negative value.
    add => Returns the sum of the two values.
    divide      => Returns the quotient of two values.
    multiply    => Returns the product of two values.
    negate      => Returns the opposite (additive inverse) value.
    power       => Returns a number raised to a given power (exponent).
    remainder   => Returns what is left over when one value is divided by anothe
r.
    round       => TBD: Returns the nearest integer. Halves round up (away from
zero) by default.
    subtract    => Returns the difference between two values.
    even?       => Returns true if the number is evenly divisible by 2.
    odd?        => Returns true if the number has a remainder of 1 when divided
by 2.
    complement
    append      => Inserts value(s) at series tail; returns series head.
    at  => Returns a series at a given index.
    back        => Returns a series at the previous index.
    clear       => Removes series values from current index to tail; returns new
 tail.
    copy        => Returns a copy of a non-scalar value.
    find        => Returns the series where a value is found, or NONE.
    skip        => Returns the series relative to the current index.
    tail        => Returns a series at the index after its last value.
    head        => Returns a series at its first index.
    head?       => Returns true if a series is at its first index.
    index?      => Returns the current series index, relative to the head.
    insert      => Inserts value(s) at series index; returns series head.
    length?     => Returns the number of values in the series, from the current
index to the tail.
    next        => Returns a series at the next index.
    pick        => Returns the series value at a given index.
    poke        => Replaces the series value at a given index, and returns the n
ew value.
    remove      => Returns the series at the same index after removing a value.
    select      => Find a value in a series and return the next value, or NONE.
    tail?       => Returns true if a series is past its last value.
red>> help remainder

USAGE:
    remainder value1 value2

DESCRIPTION:
    Returns what is left over when one value is divided by another..
    remainder is type: action!

ARGUMENTS:
    value1 [number!]
    value2 [number!]

REFINEMENTS:
red>> remainder 12 5

**\* Runtime Error 1: access violation
**\* at: 00000000h

C:\dosprompt>



Comments:
--------------------------------------------------------------------------------

On 2014-03-04T14:18:54Z, dockimbel, commented:
<https://github.com/red/red/issues/707#issuecomment-36627603>

    @iArnold For each action defined in %boot.red and not implemented in %actions,reds, please insert a "(not yet implemented)" message at the beginning of the description docstring. Send a PR once done, that would be really helpful for the newcomers (and others).

--------------------------------------------------------------------------------

On 2014-03-04T18:54:00Z, iArnold, commented:
<https://github.com/red/red/issues/707#issuecomment-36659735>

    OK will do that. 


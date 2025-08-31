
#1813: Conflict between `not` behaviour and docstring
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1813>

Not of an integer returns a logic! value rather than the logical complement of the value as described in the DocString. 

``` Red
red>> ? not

USAGE:
    not value

DESCRIPTION:
     Returns the negation (logical complement) of a value. 
     not is of type: native!

ARGUMENTS:
     value  [any-type!]

REFINEMENTS:
red>> not FEh
== false
red>> not 1
== false
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-14T04:09:00Z, SteeveGit, commented:
<https://github.com/red/red/issues/1813#issuecomment-209753192>

    Did you expect the one's complement of a binary number ?
    If so, that's the purpose of the func COMPLEMENT.
    (logical complement) vs (binary complement)

--------------------------------------------------------------------------------

On 2016-04-14T05:02:08Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1813#issuecomment-209763017>

    The DocString says `not` returns the one's complement of a binary number. It does not. The DocString needs to be corrected.

--------------------------------------------------------------------------------

On 2016-04-18T04:49:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1813#issuecomment-211199477>

    Docstring changed to `Returns the boolean complement of a value`.


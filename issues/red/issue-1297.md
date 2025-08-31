
#1297: MODIFY is specified for map! values, but not (yet) implemented
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1297>

map! occurs in the spec of the modify action

red>> help modify

USAGE:
    modify target  field  value  /case

DESCRIPTION:
     Change mode for port/file or change the value of a key in a map.
     modify is of type: action!

ARGUMENTS:
     target  [map! file!]
     field  [word!]
     value  [any-type!]

REFINEMENTS:
     /case => Perform a case-sensitive lookup.

red>> modify #(a 1) 'a 2
**\* Script error: modify does not allow map for its target argument
**\* Where: modify



Comments:
--------------------------------------------------------------------------------

On 2016-02-03T03:28:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1297#issuecomment-178980607>

    `map!` removed from spec block until it gets implemented.


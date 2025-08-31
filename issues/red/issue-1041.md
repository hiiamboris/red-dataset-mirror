
#1041: Compiler crash unknown word 'FOUND?
================================================================================
Issue is closed, was reported by iArnold and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1041>

Difference in interpreted and compiled Red.
This code works fine on try.rebol.nl
Red []

element-in-collection: function [
    input [integer! char! string!]
    collection [series!]
    return: [logic!]
][
    found? find collection input
]

element: 1
mycollection: [1 2 3]
if element-in-collection element mycollection [print ["I found" element " in collection" mycollection]]

with result: I found 1  in collection 1 2 3
but compiling crashes:

-=== Red Compiler 0.5.0 ===-

Compiling /C/ .. /test/elincol.red ...
**\* Compilation Error: undefined word found?
**\* in file: %/C/ .. /test/elincol.red
**\* near: [found? find collection input]



Comments:
--------------------------------------------------------------------------------

On 2015-02-23T12:13:20Z, dockimbel, commented:
<https://github.com/red/red/issues/1041#issuecomment-75531390>

    As the compiler says, `found?` is not defined in Red. Most probably the try.rebol.nl Red interpreter version is extended with some of Kaj's extensions. You should _always_ check with the Red interpreter before reporting an error here.


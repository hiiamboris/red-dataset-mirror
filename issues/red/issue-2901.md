
#2901: make url! <block> could be a trifle smarter and recognize allowed protocols
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2901>

There is a list of allowed protocols (`http` etc.). The first component of the block is assumed to be a protocol word, so this could be checked. By-product: the separator inserted after the protocol is now always `://` but this could depend on the protocol, e.g. after `mailto` it should be `:`.


Comments:
--------------------------------------------------------------------------------

On 2017-07-19T06:12:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2901#issuecomment-316282904>

    Why should we restrict the scheme part of `url!` datatype to any given list? This would make the datatype a no-go for schemes which are not part of that list, and make people use `string!` instead, defeating the purpose of `url!` as a datatype.

--------------------------------------------------------------------------------

On 2017-07-19T06:51:40Z, meijeru, commented:
<https://github.com/red/red/issues/2901#issuecomment-316289824>

    But at least it would be worthwhile having `mailto:` instead of `mailto://` as currently!


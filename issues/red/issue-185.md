
#185: Is +1 a valid integer?
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/185>

In REBOL 2 it is, and therefore also in Red/System. In Red it is not, for the moment. The lexer interprets +1 as a word. 



Comments:
--------------------------------------------------------------------------------

On 2011-10-21T09:34:02Z, dockimbel, commented:
<https://github.com/red/red/issues/185#issuecomment-2479376>

    I have hesitated about allowing or not that syntax in Red. It now looks to me that it is worth supporting it, because it can be a useful literal form for dialects.


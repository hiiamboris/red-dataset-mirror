
#181: order of parse rules in lexer is important
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/181>

Currently, an integer is recognized as a word since digits are allowed in a word and the word-rule precedes the integer-rule. Putting the integer-rule first solves the problem.



Comments:
--------------------------------------------------------------------------------

On 2011-10-13T08:19:01Z, meijeru, commented:
<https://github.com/red/red/issues/181#issuecomment-2392327>

    Correction: it is more complicated than than, because now `'a` is parsed as integer! `0` followed by word! `a`.


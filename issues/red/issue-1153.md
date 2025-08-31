
#1153: system/words is not filled with all definitions
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1153>

`system/words/float!` has value `float!` as expected, but e.g. `system/words/symbol!` is unset!, and this has some consequences, e.g. it breaks up `help system/words`



Comments:
--------------------------------------------------------------------------------

On 2015-05-09T11:28:28Z, ghost, commented:
<https://github.com/red/red/issues/1153#issuecomment-100467254>

    Don't know if this is related:
    --== Red 0.5.3 ==--
    Type HELP for starting information.
    
    red>> print system/words
    Memory error: allocate memory > 2MB (--NOT_IMPLEMENTED--)
    
    **\* Runtime Error 1: access violation
    **\* at: 0041F6ACh

--------------------------------------------------------------------------------

On 2015-05-09T12:59:20Z, meijeru, commented:
<https://github.com/red/red/issues/1153#issuecomment-100480748>

    Yes, precisely! Both help and print will evaluate `system/words/<unset word>` at some point and blow up.



#1684: text-list crashes for non-string! values
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1684>

Below code produces the issue:

`
view [text-list data [1]]
`



Comments:
--------------------------------------------------------------------------------

On 2016-03-11T10:43:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1684#issuecomment-195313200>

    Thanks for reporting it, it revealed a coding issue in `text-list` support.


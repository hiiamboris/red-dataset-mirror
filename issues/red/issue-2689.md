
#2689: View does not allow direct access to pair members
================================================================================
Issue is closed, was reported by sylvievathoux and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2689>

This code does not work:

`
view [
    size 300x300
    f: field "Test" react [f/data: form bx/offset/x]
    return bx: base 100x100 loose
]
`

But the following does: 

`
view [
    size 300x300
    f: field "Test" react [ofst: bx/offset f/data: form ofst/x]
    return bx: base 100x100 loose
]
`




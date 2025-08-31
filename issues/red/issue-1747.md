
#1747: 'TO STRING! #"a" == "97"
================================================================================
Issue is closed, was reported by DideC and has 6 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/1747>

"'to string!" of a character give a string of the integer value of the chararacter. Must give a string with this only chararacter.

ie:

> > to string! #"a"
> > == "97"        ; not very usefull !
> > ; Must give :
> > == "a"



Comments:
--------------------------------------------------------------------------------

On 2016-03-29T09:49:43Z, dockimbel, commented:
<https://github.com/red/red/issues/1747#issuecomment-202810048>

    I am not sure this conversion is implemented (TO is only partially implemented, as we didn't decide yet on the conversion rules to follow). @qtxie will answer that.

--------------------------------------------------------------------------------

On 2016-03-29T10:18:37Z, qtxie, commented:
<https://github.com/red/red/issues/1747#issuecomment-202822111>

    Convert char! to string! is not implemented yet. And yes, convert it to "a" is more reasonable.

--------------------------------------------------------------------------------

On 2016-05-09T05:10:05Z, dockimbel, commented:
<https://github.com/red/red/issues/1747#issuecomment-217777110>

    Closing this ticket, as it is about a non-implemented feature (`to` action).


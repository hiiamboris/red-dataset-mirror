
#556: reduce/into & compose/into APPEND instead of INSERT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/556>

red>> b: next [1 2]
== [2]
red>> reduce/into [yes] b
== [2 true]
red>> compose/into [no] b
== [2 true no]
red>> b
== [2 true no]
red>> head b
== [1 2 true no]

R3:

> > b: next [1 2]  
> > == [2]
> > reduce/into [yes] b
> > == [2]
> > compose/into [no] b 
> > == [true 2]
> > b
> > == [no true 2]
> > head b
> > == [1 no true 2]



Comments:
--------------------------------------------------------------------------------

On 2013-11-05T11:09:00Z, dockimbel, commented:
<https://github.com/red/red/issues/556#issuecomment-27764521>

    /INTO option was added before INSERT was coded, so it could only be APPENDed.


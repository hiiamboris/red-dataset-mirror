
#2691: 'help system' under Linux throws an error
================================================================================
Issue is closed, was reported by pekr and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2691>

>> help system
*** Script Error: image! has no value
*** Where: =

Tested in terms of Ubuntu server, Cloud9 instance and by Dave Dander under his Docker instance, today's automated build ....


Comments:
--------------------------------------------------------------------------------

On 2017-05-15T18:14:24Z, greggirwin, commented:
<https://github.com/red/red/issues/2691#issuecomment-301558637>

    `image?` is the cause. No `image!` type under Linux yet?

--------------------------------------------------------------------------------

On 2017-05-15T18:18:20Z, pekr, commented:
<https://github.com/red/red/issues/2691#issuecomment-301559672>

    Yes, `make image! 200x200` results in the same error message. The feature might not be there yet, so if it is not a bug, but just a missing feature, this ticket could be closed, sorry for that ...
    
    Well, the only thing is, if `help system` should error out this way ...


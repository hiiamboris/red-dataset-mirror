
#3032: Showing current face during on-create quits Red
================================================================================
Issue is closed, was reported by luce80 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3032>

this quits Red 0.6.3 on Win7:

`view [base on-create [show face]]`



Comments:
--------------------------------------------------------------------------------

On 2017-09-22T11:10:19Z, dockimbel, commented:
<https://github.com/red/red/issues/3032#issuecomment-331419086>

    The cause of the crash is not related to View engine, but a deeper issue, so I opened another ticket to process it: #3052.

--------------------------------------------------------------------------------

On 2017-09-25T12:53:38Z, dockimbel, commented:
<https://github.com/red/red/issues/3032#issuecomment-331871430>

    #3052 has been fixed.


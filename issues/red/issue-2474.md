
#2474: Manual compilation using 'rc does not work anymore
================================================================================
Issue is closed, was reported by pekr and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2474>

I am used to using the R2 console session and in the past, following aproach worked (if the 1) is an intended change, ok then):

1) double click the red.r file got me into the R2 console. Does not work anymore

2) Using 'rc to manually compile scripts, does not seem to work either:

>> rc "-t Windows %environment/console/gui-console.red"
*** Driver Internal Error: Script Error : Cannot use path on none! value
*** Where: parse-options
*** Near:  [system/script/parent/path]


Comments:
--------------------------------------------------------------------------------

On 2017-03-10T08:12:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2474#issuecomment-285605072>

    The fix is for 2. Could you test if that fixes 1. too?

--------------------------------------------------------------------------------

On 2017-03-10T12:34:45Z, pekr, commented:
<https://github.com/red/red/issues/2474#issuecomment-285658343>

    Compilation 2) works OK now. 1) still does not work. So one has to launch R2 and use 'change-dir. Not a big deal eventually, if it needs to stay that way ...

--------------------------------------------------------------------------------

On 2017-03-11T05:36:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2474#issuecomment-285844857>

    You can now force the `red.r` script to halt in the console. Make a shortcut icon from `red.r` icon and edit the properties to use `red.r halt`. Click on that shortcut icon instead of `red.r` to open a console.


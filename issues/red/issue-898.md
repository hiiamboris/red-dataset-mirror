
#898: Red 0.4.3 for Mac incorrect first massage and version
================================================================================
Issue is closed, was reported by iArnold and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/898>

Downloading Red 0.4.3 for Mac from the download page:
Used the link: static.red-lang.org/dl/mac/…
(The link for the daily build static.red-lang.org/dl/auto/… returns a 404 Not Found message.)

Running it does not precompile Red console, shows old welcome message and incorrect system/version.

$ ./red-043

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> system/version
== "0.4.1, 13-Aug-2014/16:01:32+2:00"
red>> 



Comments:
--------------------------------------------------------------------------------

On 2014-08-15T05:58:55Z, dockimbel, commented:
<https://github.com/red/red/issues/898#issuecomment-52276730>

    The Mac binary is fine, the issue was local to your machine, so I am dismissing this ticket.

--------------------------------------------------------------------------------

On 2014-08-15T14:51:26Z, iArnold, commented:
<https://github.com/red/red/issues/898#issuecomment-52314287>

    I seldomly retstart my Macbook too. An improvement would be if there was a version check and if the version was not up to date the (old console was removed and the) console got recompiled still.

--------------------------------------------------------------------------------

On 2014-08-15T15:26:43Z, dockimbel, commented:
<https://github.com/red/red/issues/898#issuecomment-52318695>

    The console gets recompiled automatically if the red binary is more recent than the precompiled console binary. It seems you messed up something on your machine.

--------------------------------------------------------------------------------

On 2014-08-15T19:46:19Z, iArnold, commented:
<https://github.com/red/red/issues/898#issuecomment-52349645>

    In that case the mess up I made on my machine was doubleclicking accidentally on the wrong binary, the red-041binary. After that it was more recent than the one it was gonna get from the red-043 download.


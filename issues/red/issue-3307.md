
#3307: GUI Console nightly build - color chooser not working
================================================================================
Issue is closed, was reported by gltewalt and has 6 comment(s).
[type.bug] [status.duplicate] [GUI]
<https://github.com/red/red/issues/3307>

### Expected behavior
Clicking on a background color, or font color changes the background color or font color.
### Actual behavior
Clicking a color in the color pallet does not change the RGB value.
### Steps to reproduce the problem
Download latest build, compile GUI Console. Select `Options` then `Settings`, click on a color.
### Version (run `about` in the Red Console and paste the result here) also add OS version.
Red 0.6.3 for Windows built 1-Apr-2018/18:57:10 commit #ddacd32c

Win7 Pro


Comments:
--------------------------------------------------------------------------------

On 2018-04-01T19:33:38Z, greggirwin, commented:
<https://github.com/red/red/issues/3307#issuecomment-377810989>

    Confirmed.

--------------------------------------------------------------------------------

On 2018-04-01T23:39:08Z, qtxie, commented:
<https://github.com/red/red/issues/3307#issuecomment-377825482>

    It's a regression. https://github.com/red/red/issues/3300

--------------------------------------------------------------------------------

On 2018-04-06T11:59:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3307#issuecomment-379232284>

    #3300 is fixed, so I'm closing this ticket.


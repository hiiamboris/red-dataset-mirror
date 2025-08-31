
#1453: window opens behind console
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1453>

In Windows XP, when using `view` for the first time in a console session, whether it's directly or by `do`ing a file which uses it, the resulting window is displayed behind the console window. After the new window has been clicked to the front and closed, all later uses of `view` in that session open the window at the front.
This is the case whether the console is started from CMD or Windows gui.
The console has of course been compiled with `Needs:     'View` in the header.

Windows 7 doesn't seem to have this issue.



Comments:
--------------------------------------------------------------------------------

On 2015-11-17T08:33:31Z, WiseGenius, commented:
<https://github.com/red/red/issues/1453#issuecomment-157308332>

    I only remember noticing this since yesterday or the day before, so it might be a regression, but I could be wrong.


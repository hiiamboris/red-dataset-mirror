
#3589: Unexpected window minimization
================================================================================
Issue is closed, was reported by dsunanda and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3589>

**Describe the bug**
Console window (and/or) VID window expectedly minimized if moved rapidly

**To Reproduce**
 1. View [box 200x200 red]   ;; any GUI structure seems to work

 2. Move the VID window rapidly back and forth - the console window will soon minimize

 3. Move the console window rapidly back and forth - the VID window will soon minimize
  
**Expected behavior**
Windows don't minimize

**Platform version:**
Red 0.6.3 for Windows built 13-Nov-2018/15:49:48 commit #7404492



Comments:
--------------------------------------------------------------------------------

On 2018-11-16T16:11:48Z, meijeru, commented:
<https://github.com/red/red/issues/3589#issuecomment-439442875>

    Cannot reproduce; with my set-up (W10) it is the other open windows that minimize under this treatment. Perhaps a Windows question rather than a Red one?

--------------------------------------------------------------------------------

On 2018-11-16T16:34:55Z, greggirwin, commented:
<https://github.com/red/red/issues/3589#issuecomment-439450301>

    I also can't dupe on Win10.

--------------------------------------------------------------------------------

On 2018-11-16T23:56:27Z, greggirwin, commented:
<https://github.com/red/red/issues/3589#issuecomment-439563977>

    Determined by Sunanda and ToomasV not to be a Red issue.

--------------------------------------------------------------------------------

On 2018-11-20T08:55:06Z, DideC, commented:
<https://github.com/red/red/issues/3589#issuecomment-440193220>

    That seems to be "Aero shake" behaviour.
    
    https://winaero.com/blog/disable-aero-shake-in-windows-10-windows-8-and-windows-7/


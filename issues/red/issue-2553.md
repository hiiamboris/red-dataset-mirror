
#2553: Text is not sharp
================================================================================
Issue is closed, was reported by Immortalin and has 24 comment(s).
[status.waiting] [type.wish] [GUI]
<https://github.com/red/red/issues/2553>

The text created by the GUI is not as sharp as native text


Comments:
--------------------------------------------------------------------------------

On 2017-04-09T01:58:14Z, dockimbel, commented:
<https://github.com/red/red/issues/2553#issuecomment-292758376>

    The GUI is using native text. You might want to provide us with:
    * a code example
    * a screenshot
    * OS name and version on which you are running the code

--------------------------------------------------------------------------------

On 2017-04-09T22:13:54Z, Immortalin, commented:
<https://github.com/red/red/issues/2553#issuecomment-292817420>

    ![image](https://cloud.githubusercontent.com/assets/7126128/24841314/d8c2c3f0-1d36-11e7-8853-53b420b2d2a3.png)
    
    
    The 17LOC spreadsheet example
    The difference is pretty clear. I noticed that this problem generally occurs with SDL apps and custom widgets, most .NET/native do not have this problem. 
    
    OS is Windows 10 

--------------------------------------------------------------------------------

On 2017-04-09T22:15:59Z, Immortalin, commented:
<https://github.com/red/red/issues/2553#issuecomment-292817525>

    Another example:
    
    ![image](https://cloud.githubusercontent.com/assets/7126128/24841348/5d195556-1d37-11e7-8af6-10c46d00ecfe.png)

--------------------------------------------------------------------------------

On 2017-04-10T00:51:52Z, qtxie, commented:
<https://github.com/red/red/issues/2553#issuecomment-292826096>

    @Immortalin I think it causes by the font. 
    * In Red PicoSheet demo, You can see thant the text `PicoSheet` in the title is more sharp than the text `A` above the cell.
    * In Execl, the text `Format Painter` is not sharp, but `A` above the cell is sharp.

--------------------------------------------------------------------------------

On 2017-04-10T08:58:47Z, dockimbel, commented:
<https://github.com/red/red/issues/2553#issuecomment-292889992>

    @Immortalin The cause of the light blurring is the automatic upscaling Win10 is applying to apps not declaring that they can handle high DPI. This can be disabled by the users, right click on `gui-console` executable name from the tasks bar -> Properties -> Compatibility -> "Disable display scaling on high DPI settings".
    
    We should set it directly in the console's manifest file anyway, but we need then to adjust the sizes/offsets calculation accordingly.

--------------------------------------------------------------------------------

On 2018-08-03T12:04:48Z, mohd-akram, commented:
<https://github.com/red/red/issues/2553#issuecomment-410233368>

    This is still the case with the latest Red. Perhaps the issue should be reopened.

--------------------------------------------------------------------------------

On 2018-08-03T16:50:40Z, greggirwin, commented:
<https://github.com/red/red/issues/2553#issuecomment-410312448>

    @mohd-akram is it still the case if you disable high DPI scaling?

--------------------------------------------------------------------------------

On 2018-08-04T13:08:44Z, mohd-akram, commented:
<https://github.com/red/red/issues/2553#issuecomment-410448387>

    Disabling high DPI scaling works, but users shouldn't have to do that.

--------------------------------------------------------------------------------

On 2018-08-04T16:02:20Z, meijeru, commented:
<https://github.com/red/red/issues/2553#issuecomment-410459230>

    @dockimbel The Windows 10 setting you recommend is not available as such on my version of W10. See the attched screenshot.
    ![capture](https://user-images.githubusercontent.com/743227/43678256-788ce028-9810-11e8-99d3-4e718f0e6c82.PNG)

--------------------------------------------------------------------------------

On 2018-08-04T16:02:23Z, greggirwin, commented:
<https://github.com/red/red/issues/2553#issuecomment-410459237>

    What we should do, then, is open a new ticket that references this one, based on @dockimbel's comment. i.e. FEAT: (Win10) Disable High DPI display scaling in manifest file
    
    Would you like to do that @mohd-akram?

--------------------------------------------------------------------------------

On 2018-08-04T16:04:11Z, greggirwin, commented:
<https://github.com/red/red/issues/2553#issuecomment-410459364>

    @meijeru, I believe it's the second/bottom one under `Change high DPI setttings`.

--------------------------------------------------------------------------------

On 2018-08-04T18:08:13Z, meijeru, commented:
<https://github.com/red/red/issues/2553#issuecomment-410467483>

    In that case, @dockimbel 's instructions were too brief ;-)



#1954: Error in view-test.red
================================================================================
Issue is closed, was reported by TimeSlip and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1954>

Hello Doc,
This is a simple one. 
image: load %./bridges/android/samples/eval/res/drawable-xxhdpi/ic_launcher.png
(line 533)
requires an extra period?
image: load %../bridges/android/samples/eval/res/drawable-xxhdpi/ic_launcher.png

BTW, this implementation of VID is incredible. Love it already. Regards, James



Comments:
--------------------------------------------------------------------------------

On 2016-06-02T12:09:52Z, dockimbel, commented:
<https://github.com/red/red/issues/1954#issuecomment-223272822>

    James, thanks! Could you submit a Pull Request with the change. You can use only Github for that if your are not used to Git:
    1. Fork red/red repo using the "Fork" button.
    2. Navigate to the right file, open it and then click on the pen icon ("Edit this file").
    3. Make the change, save it, then click the "New Pull Request", then "Create Pull Request".
    4. Wait for us to review and accept it. That's all.

--------------------------------------------------------------------------------

On 2016-06-02T14:53:40Z, qtxie, commented:
<https://github.com/red/red/issues/1954#issuecomment-223316796>

    Actually it depends on where you put your `view-test.exe` or what the current dir is in console.
    In gui-console:
    
    ```
    cd %/d/red-repo     ;-- my red repository
    do %tests/view-test.red
    ```
    
    It works fine without error.

--------------------------------------------------------------------------------

On 2016-06-06T21:37:23Z, TimeSlip, commented:
<https://github.com/red/red/issues/1954#issuecomment-224096274>

    The thing is that yes it works depending on where you are. @qtxie, in your case, you're in the %/d/red-repo directory and from that level and position it's fine. I'm just worried that it's not obvious that one has to be in a particular level, calling the app which is located in a different folder if you know what I mean. @dockimbel Rather than me messing it up some more, could I make the suggestion that you either leave it as is or add an "either" call to a load http://where-the-image-can-be-found and/or perhaps even an dummy image (generated on the fly maybe), so although it is dependent on having connectivity, it does not stop the application completely.
    Anyway, you're the best my friend. I still remember the little show-n-tell we had with Henrik and Gabriele in the early days.

--------------------------------------------------------------------------------

On 2016-06-17T06:47:56Z, dockimbel, commented:
<https://github.com/red/red/issues/1954#issuecomment-226693704>

    The %view-test.red is really a "test" script used for development, so, like all other test scripts, it should be run from the Red root folder.


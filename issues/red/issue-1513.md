
#1513: changing panel content makes changed image disappear and decouples the pane from the window
================================================================================
Issue is closed, was reported by iArnold and has 24 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1513>

https://gist.github.com/iArnold/2bd823cb5c2ba8abf6e0
Contains the minimal source code for this program. Only two pictures needed, (could be the same)
Now selecting one image to drag around makes it disappear., It should be placed on top so it drags over the other image.

Second issue: After selecting and removing one image, drag the window around on the screen. The remaining image stays on its place on the screen.



Comments:
--------------------------------------------------------------------------------

On 2015-12-18T15:09:21Z, Oldes, commented:
<https://github.com/red/red/issues/1513#issuecomment-165800145>

    The issue is not related to images, but that removing from `pane` starts making problems... here is more simplified test: https://gist.github.com/Oldes/5b549aa56391542a9b5d

--------------------------------------------------------------------------------

On 2015-12-18T16:29:20Z, Oldes, commented:
<https://github.com/red/red/issues/1513#issuecomment-165826356>

    More issues... 
    1. having in my code `piece-panel/color: none` with type `base`, it display no content
    2. switch `piece-panel/type` to `panel` and using image in `piece-A` instead of color prevents the `piece-B` to be over even with `swaping`, which works with just colors.

--------------------------------------------------------------------------------

On 2015-12-18T16:30:12Z, Oldes, commented:
<https://github.com/red/red/issues/1513#issuecomment-165826545>

    `piece-panel/type` with `base` prevents displaying images, is it ok?

--------------------------------------------------------------------------------

On 2015-12-28T09:22:59Z, iArnold, commented:
<https://github.com/red/red/issues/1513#issuecomment-167520515>

    Testing this on Windows 8 I can see no images, where on WIndows 7 I did see them.

--------------------------------------------------------------------------------

On 2016-01-04T20:22:20Z, iArnold, commented:
<https://github.com/red/red/issues/1513#issuecomment-168794017>

    Testing on Win7 again, pics show, but the swap does not result in change in position (z-order), one of the pieces still drags under the other.

--------------------------------------------------------------------------------

On 2016-01-06T09:14:52Z, iArnold, commented:
<https://github.com/red/red/issues/1513#issuecomment-169273020>

    Ok, Oldes' swapping method had another difference I didnot notice, causing this last remark. Images do get swapped and using my method to include the pieces-panel it can be done with color: none (nevertheless remains that Oldes' method should also work and not need a filled color.) 
    
    **Also please notice the remark by Oldes on his line 26, the on-over event gets called too often.**

--------------------------------------------------------------------------------

On 2016-01-07T07:29:35Z, iArnold, commented:
<https://github.com/red/red/issues/1513#issuecomment-169585666>

    Issue on Windows 8 still holds. Working with visible images/pieces on Windows 7, no pieces/images visible under Windows 8

--------------------------------------------------------------------------------

On 2016-02-03T10:11:01Z, qtxie, commented:
<https://github.com/red/red/issues/1513#issuecomment-179143533>

    @iArnold @Oldes Seems it works fine with the latest version.

--------------------------------------------------------------------------------

On 2016-02-12T07:31:30Z, iArnold, commented:
<https://github.com/red/red/issues/1513#issuecomment-183214904>

     I dl'd the latest zip, unpacked, started R3 view and compiled and tested. On win8 I did not see any images.

--------------------------------------------------------------------------------

On 2016-02-24T08:12:31Z, iArnold, commented:
<https://github.com/red/red/issues/1513#issuecomment-188134169>

    Downloaded latest Red master (commit count 5702) and tested (R2 view off course not R3 my mistake above) I made the size of the panel larger than the 0x0 which helps to make the images visible on Windows 8 machine too. Dragging the images was not possible though. 

--------------------------------------------------------------------------------

On 2016-03-04T11:18:08Z, iArnold, commented:
<https://github.com/red/red/issues/1513#issuecomment-192237776>

    Win7 commit count 5748. Panel needs size to make contents (images) visible. Panel pane is not transparent. Using 'base and not 'panel is not a solution too.

--------------------------------------------------------------------------------

On 2016-05-09T04:58:21Z, dockimbel, commented:
<https://github.com/red/red/issues/1513#issuecomment-217776096>

    The source code from Oldes (which is the only one testable, as the other ones have external dependencies), works fine now.


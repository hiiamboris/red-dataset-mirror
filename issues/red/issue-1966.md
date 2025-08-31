
#1966: Not found image breaks program
================================================================================
Issue is closed, was reported by iArnold and has 8 comment(s).
<https://github.com/red/red/issues/1966>

``` Red
view [image load %image/no-image-here.png]
```

This program when compiled will not start because the picture cannot be opened. 
Situation can easily occur when program is relocated and image was not moved along with it.
Red should open the program and display a "not-found" image for the missing image.



Comments:
--------------------------------------------------------------------------------

On 2016-06-04T08:29:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1966#issuecomment-223744018>

    When compiling and running it, I get:
    
    ```
    *** Script error: VID - invalid syntax at: [load %image/no-image-here.png]
    *** Where: do
    *** Stack: view if set either layout while switch unless throw-error cause-error do
    ```
    
    which is a valid error as `image` does not evaluate arbitrary expressions. When your VID code is fixed:
    
    ```
    view [image %image/no-image-here.png]
    ```
    
    it retuns a proper error on start:
    
    ```
    C:\Dev\Red>bug
    *** Access error: cannot open: %image/no-image-here.png
    *** Where: decode
    *** Stack: view if set either layout while switch set fetch-options until unless
     either set switch select type? set pre-load if set load switch foreach if do de
    code
    ```

--------------------------------------------------------------------------------

On 2016-06-04T08:46:33Z, iArnold, commented:
<https://github.com/red/red/issues/1966#issuecomment-223744652>

    Correct my reproduction was in between I typed 'load here too. 
    Point is. When starting the program by double clicking the icon or filename there will be no warning message in a cmd window and the user is left without a clue why his program does no longer work.
    I know there are workarounds for this problem, like loading the image beforehand and if not available load a binary image like the smileyface in view-test.red or show a popup window warning the image could not be found, or make all images available in binary format in the code itself.
    These workarounds are ok but not the most friendly for the user or programmer. So would be nice to have this case backed up by not having the program end like it does now.
    Hope this clarifies my point.

--------------------------------------------------------------------------------

On 2016-06-04T10:36:36Z, dockimbel, commented:
<https://github.com/red/red/issues/1966#issuecomment-223748799>

    _Correct my reproduction was in between I typed 'load here too._ Grammar rules are now optional in English? Please take care about writing as clearly and as accurately as possible when posting here.
    
    I'm replacing this confusing ticket with a more appropriate one: #1967

--------------------------------------------------------------------------------

On 2016-06-04T12:34:16Z, iArnold, commented:
<https://github.com/red/red/issues/1966#issuecomment-223753311>

    Not used typing commas anymore in fact I am thinking about having them surgically removed from my keyboard need some salt to go with the snails? ;)


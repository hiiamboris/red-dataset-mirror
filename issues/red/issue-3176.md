
#3176: VID: camera does not capture images consistently
================================================================================
Issue is open, was reported by gltewalt and has 4 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/3176>

### Expected behavior
With GUI Console - Expect an image to be captured and saved each time the "Save Picture" button is clicked.
### Actual behavior
Most images that are saved are all black. No image showing.
No files are saved at all if `jpg` is used instead of `jpeg`, and no files are saved at all if ran from `red --cli`
### Steps to reproduce the problem
```
; only intermittently captures webcam images
acc: 0
image-name: does [
  load rejoin [mold '% 'temp acc: acc + 1 '.jpeg]
]
view [ 
  cam: camera 800x600 select 1 
  button "Save picture" [save/as image-name to-image cam 'jpeg]
]
```
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 21-Dec-2017/14:43:43-07:00
Windows7 Pro 64bit



Comments:
--------------------------------------------------------------------------------

On 2018-01-01T06:41:29Z, ghost, commented:
<https://github.com/red/red/issues/3176#issuecomment-354639012>

    I am on a slightly older build (15-Dec-2017), Windows 10, 64 bit.
    
    > Most images that are saved are all black. No image showing.
      
    Can't reproduce
      
    > No files are saved at all if jpg is used instead of jpeg,
      
    Probably because we have `'jpeg` in [here](https://github.com/red/red/blob/40c3358ae24faa80caa9a33e01a6795e20784c29/environment/codecs/jpeg.red#L13) but no `'jpg` . So `'jpg` is currently an invalid format but `jpg` is pretty common usage, so it should be there.
      
    If invalid arguments given to `save/as`, currently it just [returns from the function](https://github.com/red/red/blob/96b4dcdb47d6f47781ed1853d10a066d23aa530e/environment/functions.red#L414). **IMO it would be a good idea to produce an error instead of silently returning.**
    
      
    > and no files are saved at all if ran from red --cli
      
    Works for me in cli console.

--------------------------------------------------------------------------------

On 2018-12-23T00:38:57Z, endo64, commented:
<https://github.com/red/red/issues/3176#issuecomment-449606401>

    It all worked for me (on Win10)
    Can someone test it on MacOS?
    
    > IMO  it would be a good idea to produce an error instead of silently returning.
    
    This also implemented, if it works on MacOS as well, then we are good to close @greggirwin ?


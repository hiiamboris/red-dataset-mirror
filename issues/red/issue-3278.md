
#3278: Direct download of image does not work
================================================================================
Issue is closed, was reported by Oleg-N-Cher and has 6 comment(s).
<https://github.com/red/red/issues/3278>

Tried in stable Red 0.6.3 for Windows and the latest red-23mar18-5f9c4283.exe

It doesn't work:

`  view [image load http://rebol.com/view/bay.jpg]`

*** Script Error: VID - invalid syntax at: [load http://rebol.com/view/bay.jpg]
*** Where: do
*** Stack: view layout cause-error  


The same happens when to download an image from a file:

`  view [image load %/n/gLf0HJEKI1M.jpg]`


Although it works:

```
  img: load http://rebol.com/view/bay.jpg
  view [image img]
```


Can I assume that this is a bug, and not some feature of Rebol that is not present in Red?

The example given from lesson Computer Programming Tutorial, by Nick Antonaccio (#03) and looks (in Rebol):

`  view layout [image load http://rebol.com/view/bay.jpg]`

Thanks.


Comments:
--------------------------------------------------------------------------------

On 2018-03-24T02:09:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3278#issuecomment-375839207>

    Red is not going to be 100% compatible with Rebol. This particular bit may come later but your workaround is fine. You can also see, and add to, notes @gltewalt put together at: https://github.com/red/red/wiki/Differences-between-Red-and-Rebol

--------------------------------------------------------------------------------

On 2018-03-24T02:10:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3278#issuecomment-375839248>

    Also, even in the best case, you may eventually need to use a `paren!` for the loading part. 

--------------------------------------------------------------------------------

On 2018-03-24T02:12:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3278#issuecomment-375839358>

    Another, shorter workaround is just to directly reference the URL, which is the best solution.
    ```
     view [image http://rebol.com/view/bay.jpg]
    ```


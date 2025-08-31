
#2752: `mandelbrot.red` gives error if closed abruptly
================================================================================
Issue is closed, was reported by dockimbel and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2752>

@nc-x commented on [Sun Jun 04 2017](https://github.com/red/code/issues/49)

1.    From the console, run [mandelbrot.red](https://github.com/red/code/blob/master/Scripts/mandelbrot.red)
  
2.    Now click on `Draw`.
  
3.    Now close the GUI window before drawing is complete.

=> The console display error 
```
*** View Error: CreateWindowEx failed!
*** Script Error: path none is not valid for none! type
*** Where: eval-set-path
*** Stack: view do-events do-actor do-safe mandelbrot do-events eval-set-path
```




Comments:
--------------------------------------------------------------------------------

On 2017-06-16T06:15:57Z, qtxie, commented:
<https://github.com/red/red/issues/2752#issuecomment-308942715>

    Seems no error anymore.

--------------------------------------------------------------------------------

On 2017-06-16T09:12:00Z, dockimbel, commented:
<https://github.com/red/red/issues/2752#issuecomment-308975601>

    No more crash, though the events in the console are not processed anymore. After the drawing finishes, we should be back in the event loop. Could we improve that?

--------------------------------------------------------------------------------

On 2017-06-16T09:34:35Z, ghost, commented:
<https://github.com/red/red/issues/2752#issuecomment-308980495>

    I still have the error on latest automated build.
    ![error](https://user-images.githubusercontent.com/16458742/27221071-ea96d44c-52a4-11e7-8c77-87e54b2bb6c3.gif)


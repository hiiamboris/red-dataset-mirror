
#3317: Issue when Drawing a face with 01apr18 build
================================================================================
Issue is closed, was reported by virtualAlan and has 2 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/3317>

### Expected behavior
Best way to explain it is to use Greggs example from here:
https://gist.github.com/greggirwin/e40459503f75a748b056d08b3f8289ea
Try this script using the 05jan18 or 03feb18 builds and it works as expected
### Actual behavior
But try it with the newer 27mar18 or 01apr18 builds and it 
does not draw the face after dragging button.
### Steps to reproduce the problem
Use Greggs script (above) on latest 01apr18  build.
'repend face/parent/draw ['box p  p + face/size 'text p + 4x5 name]'  does not draw the face
### Version (run `about` in the Red Console and paste the result here) also add OS version.
03feb18 build it works as expected , 01apr18 build it does not.  using Win 10.


Comments:
--------------------------------------------------------------------------------

On 2018-04-06T11:28:32Z, dockimbel, commented:
<https://github.com/red/red/issues/3317#issuecomment-379225980>

    The lack of refreshing is caused by the usage of `repend` which calls internaly `reduce/into` when `/only` refinement is not used. `reduce` does not trigger any object events, so the face is not refreshing. If you replace `repend` with `append ... reduce`, it works as expected.
    
    Though, `reduce/into` should be triggering object events if the target block is owned by an object.



#1555: Loading image puts file lock on source file
================================================================================
Issue is closed, was reported by Oldes and has 12 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1555>

It looks that using system apis has also dark side.... for example, on Windows Red is using ``GdipCreateBitmapFromFile` call when you load image from file, but this call puts file lock on the file as the GDI may defer the decoding of raw image bits until the bits are required by the image. So at this moment on Windows, when you do this:

```
red>> save %test.png make image! 10x10
red>> img: load %test.png
== make image! [10x10 #{
00000000000000000000000000000000000000000000...
red>>
```

You are not able to overwrite the file:

```
red>> save %test.png img
*** Access error: cannot open: test.png
*** Where: write
red>>
```

As there is no GC in Red, it's also not possible to release the loaded image and it's not accessible for writing or deleting until you quit Red session.
I found that one can bypass the default load using:

```
red>> save %test2.png img
red>> img: system/codecs/png/decode read/binary %test2.png
== make image! [10x10 #{
00000000000000000000000000000000000000000000...
red>> save %test2.png img
```

So it would not be a show-stopper.... but anyway... as on other OSes the file lock may not be necessary, I wonder if the not locking load should not be default.



Comments:
--------------------------------------------------------------------------------

On 2016-01-26T21:56:36Z, Oldes, commented:
<https://github.com/red/red/issues/1555#issuecomment-175250292>

    I think the problem source is, that `GdipCreateBitmapFromFile` is used here: https://github.com/red/red/blob/master/runtime/platform/image-gdiplus.reds#L348
    
    I think loading from stream should be used instead... but please confirm if the file lock is not what you want (which would be crazy imho).

--------------------------------------------------------------------------------

On 2016-01-26T22:08:16Z, Oldes, commented:
<https://github.com/red/red/issues/1555#issuecomment-175255575>

    Here is some documentation explaining, why the lock is used: https://support.microsoft.com/en-us/kb/814675

--------------------------------------------------------------------------------

On 2016-01-26T22:18:38Z, Oldes, commented:
<https://github.com/red/red/issues/1555#issuecomment-175261406>

    And here is some VB code reading: http://stackoverflow.com/questions/18250848/how-to-prevent-the-image-fromfile-method-to-lock-the-file

--------------------------------------------------------------------------------

On 2016-01-26T22:34:08Z, Oldes, commented:
<https://github.com/red/red/issues/1555#issuecomment-175270625>

    Here is possible workaround so far:
    
    ```
    red>> i: system/codecs/png/decode read/binary %temp.png
    == make image! [10x10 #{
    00000000000000000000000000000000000000000000...
    red>> save %temp.png i
    red>>
    ```

--------------------------------------------------------------------------------

On 2016-01-26T23:13:46Z, Oldes, commented:
<https://github.com/red/red/issues/1555#issuecomment-175288120>

    If I understand it well... the above workaround would lead into memory leaks without not yet implemented GC in Red.

--------------------------------------------------------------------------------

On 2016-01-27T08:27:35Z, qtxie, commented:
<https://github.com/red/red/issues/1555#issuecomment-175478107>

    Thanks. Now it should work. :-)


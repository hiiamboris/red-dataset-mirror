
#4700: Compiled script can't load images on Linux
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4700>

**Describe the bug**

1. Create an image (or use any existing image): `reddo "save/as %test.png draw 100x100 [line-width 10 pen red circle 50x50 40] 'png"`

2. Create a loader script `1.red`:
```
Red []
i: load/as %test.png 
?? i
```

3. Compile & run: `red -r -e 1.red; ./1`, output is:
```
i: %test.png
```

**Expected behavior**

A dump of image data. When interpreted it works as expected.

**Platform version**
```
Red 0.6.4 for Linux built 16-Oct-2020/21:35:47+03:00 commit #df54dcd
```



Comments:
--------------------------------------------------------------------------------

On 2020-10-31T03:47:29Z, qtxie, commented:
<https://github.com/red/red/issues/4700#issuecomment-719878363>

    `View` module is needed in order to use image! on Linux. There are two ways to solve this issue:
    1. Throw an error when loading image.
    2. Support image! in Red/Core on Linux. Then we have to install `libgdk-pixbuf` on Linux. Ubuntu as an example:
    ```
    $ sudo apt install libgdk-pixbuf2.0-0:i386
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following additional packages will be installed:
      libblkid1 libblkid1:i386 libbsd0:i386 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common
      libglib2.0-0:i386 libjbig0 libjbig0:i386 libjpeg-turbo8 libjpeg-turbo8:i386 libjpeg8 libjpeg8:i386 liblzma5
      liblzma5:i386 libmount1 libmount1:i386 libpcre2-8-0:i386 libpcre3:i386 libpng16-16:i386 libselinux1:i386
      libtiff5 libtiff5:i386 libwebp6 libwebp6:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdmcp6:i386
      libzstd1:i386
    The following NEW packages will be installed:
      libblkid1:i386 libbsd0:i386 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-0:i386 libgdk-pixbuf2.0-bin
      libgdk-pixbuf2.0-common libglib2.0-0:i386 libjbig0 libjbig0:i386 libjpeg-turbo8 libjpeg-turbo8:i386
      libjpeg8 libjpeg8:i386 liblzma5:i386 libmount1:i386 libpcre2-8-0:i386 libpcre3:i386 libpng16-16:i386
      libselinux1:i386 libtiff5 libtiff5:i386 libwebp6 libwebp6:i386 libx11-6:i386 libxau6:i386 libxcb1:i386
      libxdmcp6:i386 libzstd1:i386
    The following packages will be upgraded:
      libblkid1 liblzma5 libmount1
    3 upgraded, 28 newly installed, 0 to remove and 62 not upgraded.
    Need to get 5,179 kB of archives.
    After this operation, 15.4 MB of additional disk space will be used.
    ```



#251: Red doesn't find source in working directory
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [Red/System]
<https://github.com/red/red/issues/251>

bash-4.0# ls -l  
total 44
drwxr-xr-x 2 system system   296 Feb 23  2012 Fibonacci
drwxr-xr-x 2 system system   312 Feb 22  2012 Mandelbrot
-rw-r--r-- 1 system system  1255 Jan 10  2012 bug.reds
-rwxr--r-- 1 system system 30932 Sep 17 03:28 test
-rw-r--r-- 1 system system    42 Sep 17 03:28 test.red
-rw-r--r-- 1 system system   208 Aug 21 03:04 test.reds
bash-4.0# red test.red
Cannot access source file: test.red

bash-4.0# r2 -sw /resources/Red/framework/REBOL/red.r test.red
Cannot access source file: test.red



Comments:
--------------------------------------------------------------------------------

On 2012-10-25T17:35:44Z, dockimbel, commented:
<https://github.com/red/red/issues/251#issuecomment-9786623>

    Dealing correctly with working directories from REBOL is a complex issue that needs time (and lot of code) to handle correctly. This is postpone until encapping of Red and Red/System compiler is added.


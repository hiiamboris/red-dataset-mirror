
#793: console fails to load libedit.so.2 (wrong version in system)
================================================================================
Issue is closed, was reported by IngoHohmann and has 10 comment(s).
[status.resolved]
<https://github.com/red/red/issues/793>

Which version of libedit are you using in the console builds? It seems that libedit versions are less standard than libreadline.

In my manjaro Linux I only have 

```
lrwxrwxrwx 1 root root     17 18. Mär 17:22 libedit.so -> libedit.so.0.0.48*
lrwxrwxrwx 1 root root     17 18. Mär 17:22 libedit.so.0 -> libedit.so.0.0.48*
-rwxr-xr-x 1 root root 207584 18. Mär 17:22 libedit.so.0.0.48*
```

So I get the following error

```
./console: error while loading shared libraries: libedit.so.2: cannot open shared object file: No such file or directory
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-28T13:09:31Z, earl, commented:
<https://github.com/red/red/issues/793#issuecomment-41555702>

    Thanks for the report, Ingo. The Ubuntu Linux this was originally tested on uses a package called "libedit2" (the actual version being 3.1-20130712-2). I think we'll just have to relax the linking to use `libedit.so` instead of the more specific `libedit.so.2`.

--------------------------------------------------------------------------------

On 2014-04-28T13:18:50Z, IngoHohmann, commented:
<https://github.com/red/red/issues/793#issuecomment-41556589>

    Funnily the version in Manjaro (and thus, I guess, all Arch based distributions) has a later date, but a smaller version.
    
    core/libedit 20140213_3.1-1 [installed]

--------------------------------------------------------------------------------

On 2014-04-28T17:27:48Z, dockimbel, commented:
<https://github.com/red/red/issues/793#issuecomment-41587490>

    We have switched back to readline, so I am closing this issue.

--------------------------------------------------------------------------------

On 2014-04-28T19:48:11Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/793#issuecomment-41604445>

    By the way, libedit.so is usually a development link, for compilation time. The runtime linker should use the specific version which API was compiled in.

--------------------------------------------------------------------------------

On 2014-04-28T19:53:34Z, earl, commented:
<https://github.com/red/red/issues/793#issuecomment-41605000>

    The different versioning between Debian (libedit.so.2) and Arch, Fedora (libedit.so.0) for the same API version of the library (at least Arch and Debian build from the very same libtoolized version by Jess Thrysoee) is rather unfortunate. That'll make a pre-built dynamically linked binary that works across different Linux distros impossible, for now.
    
    As Nenad already mentioned, we have switched back to GNU Readline for the time being.


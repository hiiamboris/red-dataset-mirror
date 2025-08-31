
#834: Missing libreadline.so.6
================================================================================
Issue is closed, was reported by user1020 and has 10 comment(s).
<https://github.com/red/red/issues/834>

On my Ubuntu 12.04 64bit desktop, I got error:

```
 ./red-042 test.red
/tmp/red/console: error while loading shared libraries: libreadline.so.6: cannot open shared object file: No such file or directory
```

Since I do have libreadline6 library installed, I guess the problem is that red-042 is 32-bit application.  Wonder if there is a 64-bit application?

Thanks



Comments:
--------------------------------------------------------------------------------

On 2014-05-25T22:44:39Z, PeterWAWood, commented:
<https://github.com/red/red/issues/834#issuecomment-44147738>

    Red is currently 32-bit only and I would expect that a 64-bit version will be produced after Red reaches version 1.0

--------------------------------------------------------------------------------

On 2014-05-25T22:46:36Z, user1020, commented:
<https://github.com/red/red/issues/834#issuecomment-44147778>

    Thanks.  I will run it in a 32-bit VM then.  

--------------------------------------------------------------------------------

On 2014-05-26T21:26:44Z, earl, commented:
<https://github.com/red/red/issues/834#issuecomment-44219009>

    You could also install the 32-bit libs on your main 64-bit desktop using Debian/Ubuntu's "multiarch" support:
    
    ```
    dpkg --add-architecture i386
    apt-get update
    apt-get install libc6:i386 libreadline6:i386
    ```

--------------------------------------------------------------------------------

On 2014-09-27T10:00:34Z, giuliolunati, commented:
<https://github.com/red/red/issues/834#issuecomment-57048140>

    But in Ubuntu 12.04 multiarch don't work (dpkg --add-architecture fails).
    Works only for 13.10+ ...

--------------------------------------------------------------------------------

On 2014-09-27T20:56:43Z, earl, commented:
<https://github.com/red/red/issues/834#issuecomment-57065508>

    On Ubuntu 12.04, you don't need the `dpkg --add-architecture` call. You can directly install a 32-bit libreadline via:
    
    ```
    apt-get install libreadline6:i386
    ```


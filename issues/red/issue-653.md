
#653: Linux version cannot handle long strings in script header
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/653>

The Linux version cannot find the end of a string inside the Header block when the string is longer than 952 bytes:

Code

```
Red [A: { 
0123456789012345678901234567890123456789012345678 
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123
}]

print 1

;; NOTE the missing 9 at the end of each line of 50 has been substituted with
;;      a linefeed

```

Output 

```
peter@schulz-xubuntu:/media/sf_VMShare/Languages/Red$ ./red-041-linux ../../Code/Red/test.red
*** Interpreter Error: missing argument...
```

If the length of the string is increased by another 3 characters the error message changes to 

```
peter@schulz-xubuntu:/media/sf_VMShare/Languages/Red$ ./red-041-linux ../../Code/Red/test.red
*** Error: word has no value!
```

if the length of the string is increased further, the message changes to:

```
peter@schulz-xubuntu:/media/sf_VMShare/Languages/Red$ ./red-041-linux ../../Code/Red/test.red
*** Load Error: string ending delimiter } not found!
```

This doesn't happen on Darwin or Windows.

I compiled a console from the latest Master branch; it does the same.



Comments:
--------------------------------------------------------------------------------

On 2014-01-10T06:03:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/653#issuecomment-32004691>

    Doesn't seem to be a problem in my console versions.

--------------------------------------------------------------------------------

On 2014-01-10T15:21:19Z, hostilefork, commented:
<https://github.com/red/red/issues/653#issuecomment-32035621>

    Reproduces for me under an installation of Debian:
    
    ```
    $ uname -a
    Linux debian-qt-creator 3.2.0-2-686-pae #1 SMP Mon Jun 11 18:27:04 UTC 2012 i686 GNU/Linux
    ```
    
    _(Note: Bug was discovered because someone was [trying my dungeon.red](https://groups.google.com/forum/#!topic/red-lang/Imdo7oRdOok), which is cool...!)_

--------------------------------------------------------------------------------

On 2014-02-11T11:40:10Z, dockimbel, commented:
<https://github.com/red/red/issues/653#issuecomment-34746676>

    It seems to be related to a different [stat](http://linux.die.net/man/2/stat) structure than expected, used by the simple-io library to read a file size. Testing on my Linux 64-bit image shows that it matches rather [stat64](http://lxr.free-electrons.com/source/arch/x86/include/uapi/asm/stat.h?a=sh#L39). I am waiting to install a 32-bit Linux image to confirm that.


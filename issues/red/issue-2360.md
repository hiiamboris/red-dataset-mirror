
#2360: Linux port does not work on Ubuntu 16.04 Server
================================================================================
Issue is closed, was reported by typeless and has 8 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2360>

TL;DR: The library name on Ubuntu 16.04 should be `libcurl.so` instead of `libcurl.so.4`

It can probably be fixed by creating symlinks given the user has administrator privilege. But it'd better be fixed and can work out-of-the-box anyway.

```
mura@eeb157ad1054:~/working/red$ ./red-061  --version
0.6.1
```

```
mura@eeb157ad1054:~/working/red$ LD_DEBUG=help ./red-061
Valid options for the LD_DEBUG environment variable are:

  libs        display library search paths
  reloc       display relocation processing
  files       display progress for input file
  symbols     display symbol table processing
  bindings    display information about symbol binding
  versions    display version dependencies
  scopes      display scope information
  all         all previous options combined
  statistics  display relocation statistics
  unused      determined unused DSOs
  help        display this help message and exit

To direct the debugging output into a file instead of standard output
a filename can be specified using the LD_DEBUG_OUTPUT environment variable.
mura@eeb157ad1054:~/working/red$ LD_DEBUG=libs ./red-061
     13780:     find library=libm.so.6 [0]; searching
     13780:      search cache=/etc/ld.so.cache
     13780:       trying file=/lib/i386-linux-gnu/libm.so.6
     13780:
     13780:     find library=libdl.so.2 [0]; searching
     13780:      search cache=/etc/ld.so.cache
     13780:       trying file=/lib/i386-linux-gnu/libdl.so.2
     13780:
     13780:     find library=libc.so.6 [0]; searching
     13780:      search cache=/etc/ld.so.cache
     13780:       trying file=/lib/i386-linux-gnu/libc.so.6
     13780:
     13780:
     13780:     calling init: /lib/i386-linux-gnu/libc.so.6
     13780:
     13780:
     13780:     calling init: /lib/i386-linux-gnu/libdl.so.2
     13780:
     13780:
     13780:     calling init: /lib/i386-linux-gnu/libm.so.6
     13780:
     13780:
     13780:     initialize program: ./red-061
     13780:
     13780:
     13780:     transferring control: ./red-061
     13780:
     13780:
     13780:     calling init: /lib32/libc.so.6
     13780:
     13780:
     13780:     calling init: /home/mura/.red/crush-2016-6-30-23134.so
     13780:
     13781:     find library=libc.so.6 [0]; searching
     13781:      search cache=/etc/ld.so.cache
     13781:       trying file=/lib/x86_64-linux-gnu/libc.so.6
     13781:
     13781:
     13781:     calling init: /lib/x86_64-linux-gnu/libc.so.6
     13781:
     13781:
     13781:     initialize program: sh
     13781:
     13781:
     13781:     transferring control: sh
     13781:
     13782:     find library=libc.so.6 [0]; searching
     13782:      search cache=/etc/ld.so.cache
     13782:       trying file=/lib/i386-linux-gnu/libc.so.6
     13782:
     13782:     find library=libm.so.6 [0]; searching
     13782:      search cache=/etc/ld.so.cache
     13782:       trying file=/lib/i386-linux-gnu/libm.so.6
     13782:
     13782:     find library=libcurl.so.4 [0]; searching
     13782:      search cache=/etc/ld.so.cache
     13782:      search path=/lib/i386-linux-gnu/tls/i686/sse2/cmov:/lib/i386-linux-gnu/tls/i686/sse2:/lib/i386-linux-gnu/tls/i686/cmov:/lib/i386-linux-gnu/tls/i686:/lib/i386-linux-gnu/tls/sse2/cmov:/lib/i386-linux-gnu/tls/sse2:/lib/i386-linux-gnu/tls/cmov:/lib/i386-linux-gnu/tls:/lib/i386-linux-gnu/i686/sse2/cmov:/lib/i386-linux-gnu/i686/sse2:/lib/i386-linux-gnu/i686/cmov:/lib/i386-linux-gnu/i686:/lib/i386-linux-gnu/sse2/cmov:/lib/i386-linux-gnu/sse2:/lib/i386-linux-gnu/cmov:/lib/i386-linux-gnu:/usr/lib/i386-linux-gnu/tls/i686/sse2/cmov:/usr/lib/i386-linux-gnu/tls/i686/sse2:/usr/lib/i386-linux-gnu/tls/i686/cmov:/usr/lib/i386-linux-gnu/tls/i686:/usr/lib/i386-linux-gnu/tls/sse2/cmov:/usr/lib/i386-linux-gnu/tls/sse2:/usr/lib/i386-linux-gnu/tls/cmov:/usr/lib/i386-linux-gnu/tls:/usr/lib/i386-linux-gnu/i686/sse2/cmov:/usr/lib/i386-linux-gnu/i686/sse2:/usr/lib/i386-linux-gnu/i686/cmov:/usr/lib/i386-linux-gnu/i686:/usr/lib/i386-linux-gnu/sse2/cmov:/usr/lib/i386-linux-gnu/sse2:/usr/lib/i386-linux-gnu/cmov:/usr/lib/i386-linux-gnu:/lib/tls/i686/sse2/cmov:/lib/tls/i686/sse2:/lib/tls/i686/cmov:/lib/tls/i686:/lib/tls/sse2/cmov:/lib/tls/sse2:/lib/tls/cmov:/lib/tls:/lib/i686/sse2/cmov:/lib/i686/sse2:/lib/i686/cmov:/lib/i686:/lib/sse2/cmov:/lib/sse2:/lib/cmov:/lib:/usr/lib/tls/i686/sse2/cmov:/usr/lib/tls/i686/sse2:/usr/lib/tls/i686/cmov:/usr/lib/tls/i686:/usr/lib/tls/sse2/cmov:/usr/lib/tls/sse2:/usr/lib/tls/cmov:/usr/lib/tls:/usr/lib/i686/sse2/cmov:/usr/lib/i686/sse2:/usr/lib/i686/cmov:/usr/lib/i686:/usr/lib/sse2/cmov:/usr/lib/sse2:/usr/lib/cmov:/usr/lib         (system search path)
     13782:       trying file=/lib/i386-linux-gnu/tls/i686/sse2/cmov/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/tls/i686/sse2/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/tls/i686/cmov/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/tls/i686/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/tls/sse2/cmov/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/tls/sse2/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/tls/cmov/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/tls/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/i686/sse2/cmov/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/i686/sse2/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/i686/cmov/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/i686/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/sse2/cmov/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/sse2/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/cmov/libcurl.so.4
     13782:       trying file=/lib/i386-linux-gnu/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/tls/i686/sse2/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/tls/i686/sse2/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/tls/i686/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/tls/i686/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/tls/sse2/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/tls/sse2/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/tls/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/tls/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/i686/sse2/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/i686/sse2/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/i686/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/i686/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/sse2/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/sse2/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i386-linux-gnu/libcurl.so.4                                                                                                                                         [0/1859]
     13782:       trying file=/lib/tls/i686/sse2/cmov/libcurl.so.4
     13782:       trying file=/lib/tls/i686/sse2/libcurl.so.4
     13782:       trying file=/lib/tls/i686/cmov/libcurl.so.4
     13782:       trying file=/lib/tls/i686/libcurl.so.4
     13782:       trying file=/lib/tls/sse2/cmov/libcurl.so.4
     13782:       trying file=/lib/tls/sse2/libcurl.so.4
     13782:       trying file=/lib/tls/cmov/libcurl.so.4
     13782:       trying file=/lib/tls/libcurl.so.4
     13782:       trying file=/lib/i686/sse2/cmov/libcurl.so.4
     13782:       trying file=/lib/i686/sse2/libcurl.so.4
     13782:       trying file=/lib/i686/cmov/libcurl.so.4
     13782:       trying file=/lib/i686/libcurl.so.4
     13782:       trying file=/lib/sse2/cmov/libcurl.so.4
     13782:       trying file=/lib/sse2/libcurl.so.4
     13782:       trying file=/lib/cmov/libcurl.so.4
     13782:       trying file=/lib/libcurl.so.4
     13782:       trying file=/usr/lib/tls/i686/sse2/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/tls/i686/sse2/libcurl.so.4
     13782:       trying file=/usr/lib/tls/i686/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/tls/i686/libcurl.so.4
     13782:       trying file=/usr/lib/tls/sse2/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/tls/sse2/libcurl.so.4
     13782:       trying file=/usr/lib/tls/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/tls/libcurl.so.4
     13782:       trying file=/usr/lib/i686/sse2/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i686/sse2/libcurl.so.4
     13782:       trying file=/usr/lib/i686/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/i686/libcurl.so.4
     13782:       trying file=/usr/lib/sse2/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/sse2/libcurl.so.4
     13782:       trying file=/usr/lib/cmov/libcurl.so.4
     13782:       trying file=/usr/lib/libcurl.so.4
     13782:
/home/mura/.red/console-2016-6-30-23134: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory
     13780:
     13780:     calling fini: ./red-061 [0]
     13780:
     13780:
     13780:     calling fini: /lib/i386-linux-gnu/libdl.so.2 [0]
     13780:
     13780:
     13780:     calling fini: /home/mura/.red/crush-2016-6-30-23134.so [0]
     13780:
     13780:
     13780:     calling fini: /lib/i386-linux-gnu/libm.so.6 [0]
     13780:
```

The following is the list of installed files of `libcurl4-openssl-dev`.
```
mura@eeb157ad1054:~/working/red$ dpkg -L libcurl4-openssl-dev
/.
/usr
/usr/include
/usr/include/curl
/usr/include/curl/curlver.h
/usr/include/curl/curl.h
/usr/include/curl/curlbuild.h
/usr/include/curl/mprintf.h
/usr/include/curl/curlrules.h
/usr/include/curl/easy.h
/usr/include/curl/typecheck-gcc.h
/usr/include/curl/stdcheaders.h
/usr/include/curl/multi.h
/usr/share
/usr/share/doc
/usr/share/doc/libcurl4-openssl-dev
/usr/share/doc/libcurl4-openssl-dev/copyright
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/curl-config.1.gz
/usr/share/aclocal
/usr/share/aclocal/libcurl.m4
/usr/bin
/usr/bin/curl-config
/usr/lib
/usr/lib/x86_64-linux-gnu
/usr/lib/x86_64-linux-gnu/pkgconfig
/usr/lib/x86_64-linux-gnu/pkgconfig/libcurl.pc
/usr/lib/x86_64-linux-gnu/libcurl.la
/usr/lib/x86_64-linux-gnu/libcurl.a
/usr/share/doc/libcurl4-openssl-dev/NEWS.Debian.gz
/usr/share/doc/libcurl4-openssl-dev/changelog.Debian.gz
/usr/lib/x86_64-linux-gnu/libcurl.so
```

```
mura@eeb157ad1054:~/working/red$ readelf -d ~/.red/console-2016-6-30-23134

Dynamic section at offset 0x7ae1c contains 12 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x00000001 (NEEDED)                     Shared library: [libm.so.6]
 0x00000001 (NEEDED)                     Shared library: [libcurl.so.4]
 0x00000004 (HASH)                       0x80480e8
 0x00000005 (STRTAB)                     0x8048218
 0x00000006 (SYMTAB)                     0x80484a4
 0x0000000a (STRSZ)                      649 (bytes)
 0x0000000b (SYMENT)                     16 (bytes)
 0x00000011 (REL)                        0x8048934
 0x00000012 (RELSZ)                      576 (bytes)
 0x00000013 (RELENT)                     8 (bytes)
 0x00000000 (NULL)                       0x0
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-07T09:21:11Z, qtxie, commented:
<https://github.com/red/red/issues/2360#issuecomment-265396702>

    @typeless Does `libcurl3` still exist on Ubuntu 16.04?
    Try this from the note in [downlad page](http://www.red-lang.org/p/download.html)
    ```
    If you are using a Debian 7+ or Ubuntu 13.10+ version, you should use the multiarch way:
    
        dpkg --add-architecture i386
        apt-get update
        apt-get install libc6:i386 libcurl3:i386
    ```

--------------------------------------------------------------------------------

On 2016-12-07T11:43:23Z, typeless, commented:
<https://github.com/red/red/issues/2360#issuecomment-265426683>

    >Does libcurl3 still exist on Ubuntu 16.04?
    
    @qtxie Yes.
    
    ```
    $ dpkg -L libcurl3:i386
    /.
    /usr
    /usr/lib
    /usr/lib/i386-linux-gnu
    /usr/lib/i386-linux-gnu/libcurl.so.4.4.0
    /usr/share
    /usr/share/doc
    /usr/share/doc/libcurl3
    /usr/share/doc/libcurl3/copyright
    /usr/share/doc/libcurl3/changelog.Debian.gz
    /usr/share/doc/libcurl3/NEWS.Debian.gz
    /usr/share/lintian
    /usr/share/lintian/overrides
    /usr/share/lintian/overrides/libcurl3
    /usr/lib/i386-linux-gnu/libcurl.so.3
    /usr/lib/i386-linux-gnu/libcurl.so.4
    ```

--------------------------------------------------------------------------------

On 2016-12-07T19:36:07Z, geekyi, commented:
<https://github.com/red/red/issues/2360#issuecomment-265549574>

    So this was caused by using a different package (and maybe wrong architecture?)
    @typeless any reason to use `libcurl4-openssl-dev`?

--------------------------------------------------------------------------------

On 2016-12-17T05:12:20Z, typeless, commented:
<https://github.com/red/red/issues/2360#issuecomment-267744033>

    @geekyi Sorry for replying so late as I probably missed the Github notification.
    
    There is no particular reason to choose the package, just it happened to be the first available curl package I found with `apt-cache search`


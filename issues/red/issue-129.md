
#129: Add libc initialisation code (was: Any cURL function crashes on Syllable)
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 60 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/129>

Calling any cURL function results in a segfault or a cascade of segfaults. It doesn't seem to have to do with loading the library, because linking with cURL and then not calling its functions is OK. There's not much to compare with yet. On Syllable, the only other dynamic library binding is the C library, but I have no problem with that so far.

Here's the first segfault from the kernel log. It always seems to go like this, at address 0. If there are further segfaults, they tend to be at slightly higher and often increasing addresses.

```
0:bug::bug : Invalid pagefault at 00000000 (NOTP:READ:USER)
0:bug::bug : EAX = 00000000 : EBX = a00fa000 : ECX = 00000025 : EDX = 00000200
0:bug::bug : ESI = ffffc800 : EDI = ffffb698 : EBP = ffffb58c
0:bug::bug : SS::ESP = 0023::ffffb580
0:bug::bug : CS::EIP = 0013::a0020bb7
0:bug::bug : DS = 0023 : ES = 0023 : FS = 0023 : GS = 00c0
0:bug::bug : EFLAGS = 00013246 (PF ZF IF RF )
0:bug::bug : CPU ID = 0 : kernel stack = 041b8014
0:bug::bug : 0 -> a0020bb7
0:bug::bug :    libc.so.2 + 00020bb7 -> __ctype_b_loc + 00000037
0:bug::bug : 1 -> a01a3b59
0:bug::bug :    libcurl.so.4 + 000a4b59 -> BIO_f_buffer + 000015a9
0:bug::bug : verify_area() got kernel address 00000000
0:bug::bug :
0:bug::bug : Areas :
0:bug::bug : Area 0000 (1783) -> 0x80000000-0x80001fff 0x03c62c98 01 ro_bug
0:bug::bug : Area 0001 (1784) -> 0x80002000-0x80003fff 0x03c62c98 01 rw_bug
0:bug::bug : Area 0002 (1798) -> 0x88000000-0x88020fff 0x00000000 01 heap
0:bug::bug : Area 0003 (1785) -> 0xa0000000-0xa00f6fff 0x00cd2618 01 ro_libc.so.2
0:bug::bug : Area 0004 (1786) -> 0xa00f7000-0xa00fefff 0x00cd2618 01 rw_libc.so.2
0:bug::bug : Area 0005 (1787) -> 0xa00ff000-0xa0243fff 0x03f8fbd8 01 ro_libcurl.so.4
0:bug::bug : Area 0006 (1788) -> 0xa0244000-0xa0260fff 0x03f8fbd8 01 rw_libcurl.so.4
0:bug::bug : Area 0007 (1789) -> 0xa0261000-0xa0262fff 0x03f8f958 01 ro_librt.so.1
0:bug::bug : Area 0008 (1790) -> 0xa0263000-0xa0264fff 0x03f8f958 01 rw_librt.so.1
0:bug::bug : Area 0009 (1791) -> 0xa0265000-0xa026bfff 0x00cd2498 01 ro_libgcc_s.so.3
0:bug::bug : Area 0010 (1792) -> 0xa026c000-0xa026cfff 0x00cd2498 01 rw_libgcc_s.so.3
0:bug::bug : Area 0011 (1793) -> 0xa026d000-0xa026dfff 0x00cd2818 01 ro_libdl.so.3
0:bug::bug : Area 0012 (1794) -> 0xa026e000-0xa026efff 0x00cd2818 01 rw_libdl.so.3
0:bug::bug : Area 0013 (1795) -> 0xa026f000-0xa0280fff 0x013a7158 01 ro_libz.so.1
0:bug::bug : Area 0014 (1796) -> 0xa0281000-0xa0281fff 0x013a7158 01 rw_libz.so.1
0:bug::bug : Area 0015 (1797) -> 0xffc00000-0xffffffff 0x00000000 01 main_stack
```



Comments:
--------------------------------------------------------------------------------

On 2011-07-06T00:03:46Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-1508438>

    Here's a GDb trace. I'm not sure it adds much to the kernel log crash trace.
    
    ```
    This GDB was configured as "i586-pc-syllable"...(no debugging symbols found)
    
    (gdb) run
    Starting program: /boot/home/root/Red/bug
    warning: no shared library support for this OS / ABI
    
    Program received signal SIGSEGV, Segmentation fault.
    0xa0020bb7 in ?? ()
    (gdb) backtrace
    #0  0xa0020bb7 in ?? ()
    #1  0x00000214 in ?? ()
    #2  0xa024be68 in ?? ()
    #3  0x00000073 in ?? ()
    #4  0x00000000 in ?? ()
    (gdb)
    ```

--------------------------------------------------------------------------------

On 2011-07-06T01:07:16Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-1508708>

    This seems to be function is which many of the crashes happen:
    
    http://refspecs.freestandards.org/LSB_3.0.0/LSB-Core-generic/LSB-Core-generic/baselib---ctype-b-loc.html
    
    Could it be that the C library is not properly initialised? A trace of a natively compiled Syllable program shows that the C library is called first and then chains to the main entry point. Does Red follow this path?

--------------------------------------------------------------------------------

On 2011-07-06T15:25:22Z, earl, commented:
<https://github.com/red/red/issues/129#issuecomment-1512524>

    > Could it be that the C library is not properly initialised? [..] the C library is called first and
    > then chains to the main entry point. Does Red follow this path?
    
    Yes, good guess. Red/System does not currently loop thru any platform-specific libc start mechanism, so that could be a possibility.

--------------------------------------------------------------------------------

On 2011-07-06T15:44:04Z, earl, commented:
<https://github.com/red/red/issues/129#issuecomment-1512702>

    To quickly test if libc startup really is causing the problem, you can chain thru `__libc_start_main` as follows:
    
    ```
    Red/System []
    
    #import [
        "libc.so.6" cdecl [
            libc-start: "__libc_start_main" [
                main [function! [return: [integer!]]]
                argc [integer!]
                argv [byte-ptr!]
                init-fn [byte-ptr!]
                fini-fn [byte-ptr!]
                rtld-fini-fn [byte-ptr!]
                stack-end [byte-ptr!]
            ]
        ]
    ]
    
    main: func [[callback]] [
        print "hello, world!"
        0
    ]
    
    libc-start :main 0 null null null null null
    ```
    
    Adapt your libc soname accordingly, and move all other toplevel reds code into `main`.

--------------------------------------------------------------------------------

On 2011-07-09T19:42:03Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-1539639>

    That was a good start, thanks for that. Here's a more correct version, with changes that make it work for Syllable. I think I've found a stack misalignment bug in Linux GLibC in the process. :-)
    
    ```
    Red/System []
    
    #import [LIBC-file cdecl [
        libc-start: "__libc_start_main" [
            main [function! [
                argc [integer!]
                argv [byte-ptr!]
                env [byte-ptr!]
                return: [integer!]
            ]]
    ;       For Linux:
    ;       argc [integer!]
            argv [byte-ptr!]
    ;       For Syllable:
            env [byte-ptr!]
            init [function! []]
            fini [function! []]
    ;       For Linux:
    ;       rtld-fini [function! []]
            stack-end [byte-ptr!]
        ]
    ;   _init: "__libc_csu_init" []
    ;   _fini: "__libc_csu_fini" []
    ]]
    
    #include %cURL.reds
    
    ;init: func [[callback]] [_init]
    ;fini: func [[callback]] [_fini]
    
    main: func [
        [callback]
        argc [integer!]
        argv [byte-ptr!]
        env [byte-ptr!]
        return: [integer!]
    ][
        prin "cURL version: "  print curl-version
        0
    ]
    
    argv: declare struct! [arg-0 [c-string!] arg-1 [c-string!]]
    argv/arg-0: null
    ;argv/arg-0: "bogus-program-name"
    ;argv/arg-1: null
    
    ; For Syllable:
    ;libc-start :main  as byte-ptr! argv  env :init :fini null
    libc-start :main  as byte-ptr! argv  null null null null
    ; For Linux:
    ;libc-start :main 1  as byte-ptr! argv  :init :fini null null
    ;libc-start :main 0 null null null null null
    
    print "Here be dragons"
    ```
    
    Syllable's interface for __libc_start_main is different from Linux. It doesn't pass argc and rtld-fini (the latter is also unused on Linux, anyway), but passes a pointer to env. It can't handle just a NULL for argv, probably because it computes argc from it. Here's our startup code:
    
    http://syllable.cvs.sourceforge.net/viewvc/syllable/syllable/system/apps/utils/Builder/packages/Syllable/glibc-2.7/patches/syllable/sysdeps/i386/elf/start.S?view=markup
    
    Most of the parameters are still incorrect. Proper startup code in Red is needed. A NULL for stack-end seems to work so far, but this can easily be set properly by machine code in Red.
    
    It's a misty matter what values should be used for init/fini. There are __libc_csu_init/__libc_csu_fini or alternatively _init/_fini symbols, but in many executables they're not defined. There are extra complications for PIC code, so we could leave this matter rest until we get into trouble over it.

--------------------------------------------------------------------------------

On 2011-07-21T10:20:52Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-1622648>

    I understand that the issue is solved, so I am closing this ticket.

--------------------------------------------------------------------------------

On 2011-07-21T14:23:23Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-1623860>

    How is it solved? The LibC initialisation code needs to be added. For all systems, but on Syllable it's somehow crititcal for cURL. We can add this workaround to all our programs, but that's very ugly, and system dependent.

--------------------------------------------------------------------------------

On 2011-07-21T14:29:39Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-1623905>

    I have based my judgement on your sentence:  <i>Here's a more correct version, with changes that make it work for Syllable.</i> which implies that the issue is solved for Syllable. If it is not the case, I will re-open it. If the issue changed to a wish, please open a new ticket describing the wish.

--------------------------------------------------------------------------------

On 2011-07-21T17:44:00Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-1625348>

    It made the workaround work for Syllable, but that's not a solution for the issue that Red is lacking C library initialisation. To implement it properly, it needs machine code support in addition to the presented workaround.
    
    This issue started with the observation that the cURL binding crashes on Syllable and led to the conclusion that C library initialisation is missing in Red. Although we now have a workaround for cURL, that's only the third Red binding, so it is to be suspected that this issue will cause more problems in the future. I leave it to you whether that requires a new ticket.

--------------------------------------------------------------------------------

On 2011-07-23T21:54:20Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-1638908>

    I am re-opening this ticket to try to clarify it, because I found it quite confusing.
    
    From [this](http://refspecs.freestandards.org/LSB_3.1.1/LSB-Core-generic/LSB-Core-generic/baselib---libc-start-main-.html) page, I can see what precisely does `__libc_start_main`. It does not seem like a good fit for Red/System, because:
    - The concept of having a "main()" function as program entry point is a C thing that does not have its place in Red/System (nor Red).
    - `__libc_start_main` is calling `exit()` at end which would prevent Red/System own normal exit handler to be called.
    - I fail to see why this call is required to be able to use any function from the C library.

--------------------------------------------------------------------------------

On 2011-07-24T19:06:33Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-1641818>

    Thanks for reopening. The subject is rather arcane, yes. I understand that it's ugly to add this to Red, because it feels like jumping through a hoop, but the point is that if one wants or at least needs to use the C library, the incantations the C library wants are required to make it work. The functions performed that are listed in the specification you linked are quite important. My guess is that "initialize the threading subsystem" is the one that currently crashes Syllable when it's not performed.
    
    This does not affect Red's logical model, only its implementation. That's also why I would like the above workaround to "disappear" into the runtime. Running Red's exit handler should not be a problem, because this is what the fini parameter is for. I haven't found another clear place yet where this parameter should come from, so it stands to reason that it can be used for your own exit handler.
    
    The argc and argv parameters, and env on Syllable, are already supported by Red now (which is why I split that off into another issue request). The remaining one that needs machine code support to set it properly is stack_end.

--------------------------------------------------------------------------------

On 2011-08-01T16:02:01Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-1701516>

    I plan to add new stack manipulation native functions to Red/System, one of them will allow to retrieve stack top address (I guess this is what is meant by `stack_end`).
    
    About `__libc_start_main`, it is certainly not required by Red/System, but by a third-party library, so it will not be part of Red/System runtime. Moreover, Red will have its own threading sub-system, so such call could lead to hard-to-find issues and conflicts.
    
    Also, from what I see, `__libc_start_main` function does not seem intended to be called from a non-C language (it is very low-level, undocumented, and meant to fire C's `main()` function).
    
    My suggestion would be to research what are the libc init OS calls required by cURL and extract only those ones to put in the cURL wrapper init part.

--------------------------------------------------------------------------------

On 2011-08-01T22:47:41Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-1704983>

    I really cannot agree with this. Red uses the C library, so it must interface properly with it. This is not optional. __libc_start_main is the documented way to do it for the GNU C library. You found the documentation for Linux yourself in the LSB standard. This has very little to do with cURL. cURL cannot do this initialisation. It is the other way around: the C library and the operating system do process initialisation between them that cURL happens to need, probably without knowing about it.

--------------------------------------------------------------------------------

On 2011-09-30T21:20:00Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-2254065>

    This bug also affects the SDL binding, and now also the SQLite binding.

--------------------------------------------------------------------------------

On 2012-01-10T03:52:26Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-3424845>

    This bug also affects the C math library binding. It stands to reason that it prevents any and all programs that use the C library, or another library that uses the C library, from working.
    
    Here's an updated version of the missing Red/System code:
    
    ```
    Red/System []
    
    #import [LIBC-file cdecl [
        libc-start: "__libc_start_main" [
            main [function! [
                argc [integer!]
                argv [str-array!]
                env [str-array!]
                return: [integer!]
            ]]
    ;       For Linux:
    ;           argc [integer!]
            argv [str-array!]
    ;       For Syllable:
                env [str-array!]
            init [function! []]
            finish [function! []]
    ;       For Linux:
    ;           loader-finish [function! []]
            stack-end [pointer! [integer!]]
        ]
    ;   _init: "__libc_csu_init" []
    ;   _finish: "__libc_csu_fini" []
    ]]
    
    ;init: func [[cdecl]] [_init]
    ;finish: func [[cdecl]] [_finish]
    
    main: func [
        [cdecl]
        argc [integer!]
        argv [str-array!]
        env [str-array!]
        return: [integer!]
    ][
        ; Main code goes here
    
        0
    ]
    
    top: system/stack/top
    
    ; For Syllable:
    libc-start :main system/args-list system/env-vars null null top
    ;libc-start :main system/args-list system/env-vars :init :finish top
    ; For Linux:
    ;libc-start :main system/args-count system/args-list null null null top
    ;libc-start :main system/args-count system/args-list :init :finish null top
    
    print "This should never happen^/"
    ```
    
    I'm not sure this will establish the stack top correctly.

--------------------------------------------------------------------------------

On 2012-02-21T18:39:15Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-4081100>

    For finding the proper stack top, one should walk through system/env-vars until `null` is reached, that position should be the real stack top.

--------------------------------------------------------------------------------

On 2012-02-21T19:26:14Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-4082942>

    For Linux, `__libc_start_main` is defined in [libc-start.c](http://sourceware.org/git/?p=glibc.git;a=blob;f=csu/libc-start.c;h=a14ed71616a3f63f092837e9c30780f8344b4fbe;hb=cvs/glibc-2_9-branch). If I extract only the important parts, they could be called/initialized directly from Red/System C binding without having to hardcode libC dependency right in the heart of Red/System. So, the important init part are:
    - initialize `__libc_multiple_libcs` (not sure this is really required)
    - initialize `__environ` (INIT_ARGV_and_ENVIRON [macro](http://repo.or.cz/w/glibc.git?a=search&h=HEAD&st=grep&s=INIT_ARGV_and_ENVIRON))
    - initialize pThread library by calling `__pthread_initialize_minimal()`
    - initialize `__stack_chk_guard` to return value of `_dl_setup_stack_chk_guard()` (not sure this is really required)
    
    That's all. :-)
    
    We need a way to import variables (like `__environ` from external libs though in order to achieve that).
    
    I would like to check for Syllable and Darwin if the requirements are similar.

--------------------------------------------------------------------------------

On 2012-02-21T20:40:20Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-4087556>

    This would be a very dangerous way of implementing it, because as far as I can see, it's specific to the GNU C library. There are at least five different C libraries that I know of used on Linux, and it's also likely that the init code differs between different versions of the same library. Specific Linux distros may also have patched it.
    
    The method you describe for finding the stack top should work on Linux, but not on Syllable, because the arguments and the environment are stored on the heap there. See the link I gave earlier:
    
    http://syllable.cvs.sourceforge.net/viewvc/syllable/syllable/system/apps/utils/Builder/packages/Syllable/glibc-2.7/patches/syllable/sysdeps/i386/elf/start.S?view=markup
    
    That code is in addition to __libc_start_main and is similar to what happens on Linux. Here's our libc-start.c:
    
    http://syllable.cvs.sourceforge.net/viewvc/syllable/syllable/system/apps/utils/Builder/packages/Syllable/glibc-2.7/patches/syllable/sysdeps/unix/sysv/syllable/libc-start.c?view=markup

--------------------------------------------------------------------------------

On 2012-02-21T22:50:49Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-4091162>

    Andreas proposed a draft but flexible solution on IRC, I need to dig it further to see if it could be implemented without causing too much trouble.
    
    Basically, we would add a new compilation directive (like #start) and pass it a platform-specific block of code containing a call to `__libc_start_main`. This block of code would only be compiled when the libc is used and no other change to runtime or user code would be required.

--------------------------------------------------------------------------------

On 2012-02-21T23:14:33Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-4091641>

    Yes, I also had something like that in mind. It would mirror the startup fragments needed in other compilers and C libraries. Instead of a directive (which is only used once) it could also be a file in a specific platform dependent place.

--------------------------------------------------------------------------------

On 2012-02-21T23:18:04Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-4091708>

    Are the following functions always defined and exported?
    
    ```
    ;   _init: "__libc_csu_init" []
    ;   _finish: "__libc_csu_fini" []
    ```
    
    If not, how we are supposed to deal with them?

--------------------------------------------------------------------------------

On 2012-02-22T00:37:32Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-4092992>

    No, they're not always there. I haven't found where they should come from.

--------------------------------------------------------------------------------

On 2012-02-27T00:38:49Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-4186313>

    I tested all the bindings that can work on Syllable and they work great now, except SDL sound playing now crashes, but that may be a different issue.

--------------------------------------------------------------------------------

On 2012-02-27T11:00:15Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-4191449>

    The SDL issue you have might be related to issue #204.
    
    So, can we close this ticket now?

--------------------------------------------------------------------------------

On 2012-02-27T11:28:09Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-4191793>

    I don't think the SDL issue is #204. It works on Linux and I'm fairly sure it once worked on Syllable. However, even if it turns out to be related to libc-init, we can make it a separate report.

--------------------------------------------------------------------------------

On 2012-02-27T14:49:46Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-4194737>

    The Syllable SDL audio crash bug is in libc-init. It still works on faster-floats (although it uses 100% CPU).

--------------------------------------------------------------------------------

On 2012-02-28T12:20:50Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-4214603>

    I don't have the SDL binding nor GDB installed on my Syllable image. If you can provide me step-by-step instructions to install them, I can have a quick look before the conf on Saturday, otherwise, we can look at it together next week in Amsterdam.

--------------------------------------------------------------------------------

On 2012-02-28T12:56:44Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-4215147>

    SDL is included in Syllable. GDB is in the Developer's Delight package, but I'm not sure if it's completely functional:
    
    http://web.syllable.org/Syllable/resources.html#gdb

--------------------------------------------------------------------------------

On 2012-02-28T13:14:52Z, dockimbel, commented:
<https://github.com/red/red/issues/129#issuecomment-4215422>

    Thanks, I will try to install GDB then.

--------------------------------------------------------------------------------

On 2012-03-06T20:41:58Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/129#issuecomment-4353856>

    We debugged this together and it turned out to be an issue in the Syllable SDL port that I forgot about, not in Red.


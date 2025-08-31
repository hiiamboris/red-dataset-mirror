
#3915: memcpy src & dst overlap, sigsegv on clean exit
================================================================================
Issue is closed, was reported by dumblob and has 14 comment(s).
<https://github.com/red/red/issues/3915>

**Describe the bug**
After seeing some issues with crashes in Red, I decided to simply run it through [valgrind](http://www.valgrind.org/ ) on 64bit Arch Linux with 32bit compatibility libraries and then just hit Ctrl+d to close input and to cleanly quit the Red console. The following is the result (which surprised me after the years of Red development, but don't take me wrong - I'm totally impressed by the code itself - I'm currently reading it to look how the memory management is being done and how the memory structures and efficiency are implemented and maybe even have some comments/questions/bug_reports later).

**To reproduce**
1. install all 32bit dependencies (curl, ...) using `pacman`
2. download latest Linux nightly build from https://www.red-lang.org/p/download.html
3. `chmod +x downloaded_binary`
4. `./downloaded_binary` (this will compile the Red console into `~/.red/`) and after it showed Red console prompt, just quit it
5. run the compiled red console in a terminal or terminal emulator through valgrind: `valgrind --leak-check=full ~/.red/console-2019-6-8-29083` (valgrind doesn't guarantee, that all leaks and errors were found, but does guarantee, that what was reported is correct)
6. observe how `memcpy` is **many times errorneously used** by Red console
7. press `Ctrl+d` (this instructs the terminal to send End-Of-File on the standard input of the currently running application effectively closing the pipe and thus making the application waiting for input cleanly close itself)
8. observe the **sigsegv** :open_mouth:

```valgrind
$ valgrind --leak-check=full ~/.red/console-2019-6-8-29083 
==9888== Memcheck, a memory error detector
==9888== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==9888== Using Valgrind-3.14.0 and LibVEX; rerun with -h for copyright info
==9888== Command: /home/myuser/.red/console-2019-6-8-29083
==9888== 
==9888== Source and destination overlap in memcpy(0x4b52bac, 0x4b52bac, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A6385: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80950BF: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x804ECA9: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b52bac, 0x4b52bac, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A6385: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8060EB5: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80BDCC9: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x805371D: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b52bfc, 0x4b52bfc, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A58D7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8863: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8E9B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x808277A: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x809511B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80950B9: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80B400D: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x807D589: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A83F9: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8A59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b52c2c, 0x4b52c2c, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A6385: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8095205: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A7EC3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A82E0: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8A59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A7941: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A83E5: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8A59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8845: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8E9B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b52b9c, 0x4b52b9c, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A6385: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80D99FC: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8055A2C: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b534ec, 0x4b534ec, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A6385: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x806B3A2: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x806DA0C: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80954E9: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A816F: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A88EF: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8E9B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8097EB7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80C0889: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80B6F59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b534ec, 0x4b534ec, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A6385: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A823B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A88EF: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8E9B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8097EB7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80C0889: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80B6F59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8059BB1: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b534ec, 0x4b534ec, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A58D7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8908: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8E9B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8097EB7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80C0889: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80B6F59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8059BB1: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b5351c, 0x4b5351c, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A58D7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8ECB: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8096CE7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A7EC3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A82E0: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8A59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8E9B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8097EB7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80C0889: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80B6F59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b52b9c, 0x4b52b9c, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A58D7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80BE373: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8059C6C: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== Source and destination overlap in memcpy(0x4b52bfc, 0x4b52bfc, 16)
==9888==    at 0x403A979: memcpy (vg_replace_strmem.c:1035)
==9888==    by 0x8060BB3: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A6385: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x809640C: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80BAA16: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8059EB5: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> 
==9888== Invalid read of size 4
==9888==    at 0x413F0BA: _IO_wsetb (in /usr/lib32/libc-2.29.so)
==9888==    by 0x4149F41: _IO_cleanup (in /usr/lib32/libc-2.29.so)
==9888==    by 0x4105471: __run_exit_handlers (in /usr/lib32/libc-2.29.so)
==9888==    by 0x41054B0: exit (in /usr/lib32/libc-2.29.so)
==9888==    by 0x80D98AA: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80AF786: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x807D589: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A83F9: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8A59: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80A8E9B: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x809B15A: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80D6B88: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==  Address 0x18 is not stack'd, malloc'd or (recently) free'd
==9888== 
==9888== Invalid free() / delete / delete[] / realloc()
==9888==    at 0x4036857: free (vg_replace_malloc.c:530)
==9888==    by 0x423A61C: __libc_freeres (in /usr/lib32/libc-2.29.so)
==9888==    by 0x402D1DE: _vgnU_freeres (vg_preloaded.c:77)
==9888==  Address 0x4c67260 is 0 bytes inside a block of size 1,024 free'd
==9888==    at 0x4036857: free (vg_replace_malloc.c:530)
==9888==    by 0x423A522: buffer_free (in /usr/lib32/libc-2.29.so)
==9888==    by 0x423A5C1: __libc_freeres (in /usr/lib32/libc-2.29.so)
==9888==    by 0x402D1DE: _vgnU_freeres (vg_preloaded.c:77)
==9888==  Block was alloc'd at
==9888==    at 0x403562B: malloc (vg_replace_malloc.c:299)
==9888==    by 0x413AC0A: _IO_file_doallocate (in /usr/lib32/libc-2.29.so)
==9888==    by 0x414912C: _IO_doallocbuf (in /usr/lib32/libc-2.29.so)
==9888==    by 0x420D8F8: _IO_file_overflow@GLIBC_2.0 (in /usr/lib32/libc-2.29.so)
==9888==    by 0x413E969: putchar (in /usr/lib32/libc-2.29.so)
==9888==    by 0x805D156: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x805D1C7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x8060997: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80607BC: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x809852E: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80983D7: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888==    by 0x80D8156: ??? (in /home/myuser/.red/console-2019-6-8-29083)
==9888== 
==9888== 
==9888== HEAP SUMMARY:
==9888==     in use at exit: 1,263,676 bytes in 14 blocks
==9888==   total heap usage: 53 allocs, 41 frees, 1,277,194 bytes allocated
==9888== 
==9888== LEAK SUMMARY:
==9888==    definitely lost: 0 bytes in 0 blocks
==9888==    indirectly lost: 0 bytes in 0 blocks
==9888==      possibly lost: 0 bytes in 0 blocks
==9888==    still reachable: 1,263,676 bytes in 14 blocks
==9888==         suppressed: 0 bytes in 0 blocks
==9888== Reachable blocks (those to which a pointer was found) are not shown.
==9888== To see them, rerun with: --leak-check=full --show-leak-kinds=all
==9888== 
==9888== For counts of detected and suppressed errors, rerun with: -v
==9888== ERROR SUMMARY: 251 errors from 13 contexts (suppressed: 0 from 0)
```
(I don't have any debug build of the Red console, so there are no debug symbols valgrind could use - does actually Red/System compiler support addition of "standardized" GCC/LLVM debug symbols to allow debugging using existing tools?)

**Expected behavior**
a) `memcpy` is always used correctly (i.e. without overlapping **src** and **dst** addresses)
b) there is no sigsegv after the sender closes stdin by sending EOF

**Screenshots**
-

**Platform version (please complete the following information)**
```
Red 0.6.4 for Linux built 8-Jun-2019/10:04:27+02:00 commit #1b68168
```

----

This seems to be a long standing issue with Red (at least on 64bit Arch Linux).

@rcqls the valgrind output is from an official nightly build from https://www.red-lang.org/p/download.html as seen above, but interestingly this is exactly the same output (but with different addresses, of course) as with [your binary](https://cqls.dyndoc.fr/users/RCqls/Red/console-nocam ) when running `view []` on 64bit Arch Linux (the only difference is the missing line with "...sigsegv...") with 32bit GTK libs installed - i.e. the sigsegv everybody with 64bit Arch Linux is experiencing (for this case I've also run and compared `strace`s, but they show nothing special).

So, there is a chance that fixing all these memory issues will also fix the sigsegv on 64bit Arch Linux (**the** sigsegv which was discovered several **months ago** when testing GTK3).

But again, I'm really impressed by all the work Red devs (and you @rcqls) did. It's nice to read your code and think about it. The Lisp world is similar, but has different attitudes to same things which further increases my interest in Red's (and Red/System's) internals. Keep going and doing the great work!


Comments:
--------------------------------------------------------------------------------

On 2019-06-15T23:35:30Z, dockimbel, commented:
<https://github.com/red/red/issues/3915#issuecomment-502407132>

    @qtxie Please have a look at the reported issues above. I really doubt the `memcpy` calls with src = dst pointers would do any harm, but better locate those calls (probably `copy-cell` calls) and check them. The other reported issues after console boot seem more interesting.

--------------------------------------------------------------------------------

On 2019-06-16T07:32:15Z, qtxie, commented:
<https://github.com/red/red/issues/3915#issuecomment-502428604>

    1. In some actions, we use `stack/set-last` where src may be equal to dst in some cases. e.g. [make action](https://github.com/red/red/blob/master/runtime/actions.reds#L117).
    I agree that when src = dst, should be no harm.
    
    2. We missing code to handle `Ctrl + d` on Unix platform.

--------------------------------------------------------------------------------

On 2019-06-16T10:16:02Z, dumblob, commented:
<https://github.com/red/red/issues/3915#issuecomment-502439080>

    >I agree that when src = dst, should be no harm.
    
    It's unfortunately quite vice versa - `src` **must not** overlap with `dst` according to [POSIX documentation](http://pubs.opengroup.org/onlinepubs/9699919799/functions/memcpy.html ) and of course C documentation (as mentioned in the POSIX spec: `The functionality described on this reference page is aligned with the ISO C standard. Any conflict between the requirements described here and the ISO C standard is unintentional. This volume of POSIX.1-2017 defers to the ISO C standard.`).
    
    >We missing code to handle `Ctrl + d` on Unix platform.
    
    I'm not sure whether I understand, but I can assure you Red will never see `Ctrl + d`, but only `EOF` as a newly read character from `stdin`. I didn't look it up in Red sources, but it would surprise me if Red internal routines didn't handle `EOF` (on Windows you can test it with `Ctrl + z` in terminal and it shall also send `EOF` on `stdin`) at all :open_mouth:.

--------------------------------------------------------------------------------

On 2019-06-16T14:34:26Z, dockimbel, commented:
<https://github.com/red/red/issues/3915#issuecomment-502457802>

    > It's unfortunately quite vice versa - src must not overlap with dst according to POSIX documentation and of course C documentation (as mentioned in the POSIX spec: The functionality described on this reference page is aligned with the ISO C standard. Any conflict between the requirements described here and the ISO C standard is unintentional. This volume of POSIX.1-2017 defers to the ISO C standard.).
    
    The buffers overlapping with `memcpy()` can corrupt the destination buffer. However for the edge case of src = dst, I am not aware of any `memcpy()` implementation that would produce a wrong result. Let us know if you find one.
    
    Anyway, the copy is useless in that edge case, so we will fix that.

--------------------------------------------------------------------------------

On 2019-06-16T14:52:48Z, dockimbel, commented:
<https://github.com/red/red/issues/3915#issuecomment-502459228>

    > So, there is a chance that fixing all these memory issues will also fix the sigsegv on 64bit Arch Linux (the sigsegv which was discovered several months ago when testing GTK3).
    
    Unfortunately no, the `memcpy()` reports here are false positives (in the sense that they have no side-effects), and the `Ctrl-D` test just shows that such key combination support is not implemented yet.
    
    > i.e. the sigsegv everybody with 64bit Arch Linux is experiencing (for this case I've also run and compared straces, but they show nothing special).
    
    It would have been good to actually document the steps to reproduce such crash, which seems specific to Arch Linux + GTK backend.

--------------------------------------------------------------------------------

On 2019-06-16T18:28:57Z, dumblob, commented:
<https://github.com/red/red/issues/3915#issuecomment-502474941>

    >Unfortunately no, the `memcpy()` reports here are false positives (in the sense that they have no side-effects), and the `Ctrl-D` test just shows that such key combination support is not implemented yet.
    
    If there are no side effects, then good (though the fact itself, that the most important parts of the oldest and by far most widespread programming environment standard in use is deliberately not being followed is rather not convincing about Red). But again, `Ctrl + d` shall be equivalent to `close( 0 )` and therefore Red will read `EOF` and no key combinations. In other words, `Ctrl + d` has nothing to do with key combinations, but rather with faulty `stdin` processing.
    
    >It would have been good to actually document the steps to reproduce such crash, which seems specific to Arch Linux + GTK backend.
    
    Well, this is really tricky - for the sole reason why it's tricky I'll reference my [rant about communication channels](https://github.com/red/red/pull/3775#issuecomment-501835746 ). I read the whole GTK gitter (starting with January) and searched in all those scattered git branches, wikis, web sites, git forks and their branches etc. to just find out, that the GTK enabled Red console exits with segmentation fault after entering the smallest example `view []`.
    
    This issue is reproducible on all the three different 64bit Arch Linux systems which have been tested by community members and is known since January 2019. @rcqls tried to find where it lies, but with no luck (he found out though, that it happens before the GTK main loop gets entered and that probably a person who knows Red internals very well will be needed to debug this issue).

--------------------------------------------------------------------------------

On 2019-07-09T10:02:56Z, qtxie, commented:
<https://github.com/red/red/issues/3915#issuecomment-509579098>

    @dumblob Feel free to reopen it if need. I close it now.


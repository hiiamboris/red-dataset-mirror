
#3636: attempt to SAVE a block with LOADed image inside of it results in access violation
================================================================================
Issue is closed, was reported by 9214 and has 44 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3636>

**Describe the bug**
Title.

**To Reproduce**
Create a Red script with content as specified below, and put any image file in the same directory:
```red
Red []

save %image.red reduce [load %<your-image-file>]
``` 

Then try to execute that script.

```
*** Runtime Error 1: access violation
*** at: 742BA8C9h
```

**Expected behavior**

An `image.red` file is created with `image!` value as its content.

**Platform version (please complete the following information):**
```
Red 0.6.4 for Windows built 28-Nov-2018/6:34:42+05:00 commit #d463f89
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-07T07:31:24Z, bitbegin, commented:
<https://github.com/red/red/issues/3636#issuecomment-445147451>

    how you execute the image.red?

--------------------------------------------------------------------------------

On 2018-12-07T13:43:20Z, endo64, commented:
<https://github.com/red/red/issues/3636#issuecomment-445236435>

    @bitbegin I think @9214 means executing the file above not the `image.red`
    
    @9214 It worked for me on W10 x64: `Red 0.6.4 for Windows built 5-Dec-2018/12:31:35+03:00 commit #90c8e83`

--------------------------------------------------------------------------------

On 2018-12-07T14:17:06Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-445245542>

    It's strange that others can't reproduce it. Still the case for me with the latest build.

--------------------------------------------------------------------------------

On 2018-12-07T14:38:22Z, bitbegin, commented:
<https://github.com/red/red/issues/3636#issuecomment-445251806>

    you can put call-stack here, using `-r -d` argument

--------------------------------------------------------------------------------

On 2018-12-07T15:28:40Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-445267383>

    @bitbegin 
    ```
    root size: 2965, root max: 4552, cycles: 0
    root size: 2965, root max: 4552, cycles: 1
    
    *** Runtime Error 1: access violation
    *** Cannot determine source file/line info.
    ***
    ```

--------------------------------------------------------------------------------

On 2018-12-07T17:18:06Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-445302246>

    Interesting, I just tried to reproduce it with my own Github profile pic taken from this chat, no crash.

--------------------------------------------------------------------------------

On 2018-12-07T21:06:58Z, endo64, commented:
<https://github.com/red/red/issues/3636#issuecomment-445365553>

    @9214 Can you share the image file you try? 

--------------------------------------------------------------------------------

On 2018-12-07T21:47:33Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-445375877>

    Sure, I got 3 of them.
    [buggy.zip](https://github.com/red/red/files/2658859/buggy.zip)
    

--------------------------------------------------------------------------------

On 2018-12-09T00:59:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/3636#issuecomment-445501841>

    Crashes on W7 x64 with all these 3 pics.

--------------------------------------------------------------------------------

On 2018-12-10T03:14:38Z, bitbegin, commented:
<https://github.com/red/red/issues/3636#issuecomment-445649233>

    seams GC bug:
    
    ```
    >> recycle/off
    >> to binary! trim mold/only reduce [load %3.jpg]
    ```
    

--------------------------------------------------------------------------------

On 2018-12-10T04:14:03Z, bitbegin, commented:
<https://github.com/red/red/issues/3636#issuecomment-445669743>

    ```
    to binary! append/dup a: "" "a" 1100000
    ```

--------------------------------------------------------------------------------

On 2018-12-10T19:00:47Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-445931404>

    > The only known leak is the bitmaps object allocated from the OS by `image!` values. 

--------------------------------------------------------------------------------

On 2018-12-10T22:20:37Z, endo64, commented:
<https://github.com/red/red/issues/3636#issuecomment-445996465>

    @9214 Crashes pictures in buggy.zip. Works if `recycle/off`.

--------------------------------------------------------------------------------

On 2018-12-11T01:19:37Z, bitbegin, commented:
<https://github.com/red/red/issues/3636#issuecomment-446036753>

    @9214 @endo64 can you check if https://github.com/red/red/pull/3644 work for you? it works for me both:
    `save %image.red reduce [load %1.png]` and `to binary! append/dup a: "" "a" 1100000` are all run ok

--------------------------------------------------------------------------------

On 2018-12-11T01:38:45Z, qtxie, commented:
<https://github.com/red/red/issues/3636#issuecomment-446040318>

    If turn off the GC can make it work, then there is a bug in the GC. Maybe the GC corrupt the memory used by the C's allocator. As a consequence `copy-memory` crashes.

--------------------------------------------------------------------------------

On 2018-12-11T03:28:57Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-446059650>

    @bitbegin still the same: both my snippet and your one-liner result in a crash (that is, with GC turned on).
    ```
    Red 0.6.4 for Windows built 11-Dec-2018/7:46:27+05:00 commit #02c277d
    ```

--------------------------------------------------------------------------------

On 2018-12-20T21:22:51Z, greggirwin, commented:
<https://github.com/red/red/issues/3636#issuecomment-449139652>

    @9214, does the new fix solve this for you?

--------------------------------------------------------------------------------

On 2018-12-21T08:45:07Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-449313764>

    @greggirwin can't check it right now, will report in the next week.

--------------------------------------------------------------------------------

On 2018-12-24T09:49:37Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-449711162>

    @qtxie I can't reproduce the crash anymore.

--------------------------------------------------------------------------------

On 2018-12-24T10:18:24Z, qtxie, commented:
<https://github.com/red/red/issues/3636#issuecomment-449714554>

    @9214 Thanks. I need to add some tests before closing it.

--------------------------------------------------------------------------------

On 2019-08-20T09:14:29Z, 9214, commented:
<https://github.com/red/red/issues/3636#issuecomment-522928340>

    @qtxie don't forget to add the tests 😉 

--------------------------------------------------------------------------------

On 2019-08-20T10:30:13Z, qtxie, commented:
<https://github.com/red/red/issues/3636#issuecomment-522954597>

    @9214 Yes. I should have added it before. Now I don't even know how does the commit fix the issue. 😓 I'll try to figure it out today and write the test. Otherwise I'll just add the code in the issue into the test suite.


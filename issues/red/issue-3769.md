
#3769: copying part of an image crashes on Macs
================================================================================
Issue is closed, was reported by rebred and has 6 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/3769>

**Describe the bug**
copying part of an image crashes on Macs

**To reproduce**
```
>> empty-img: make image! 300x300
== make image! [300x300 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
>> partial: copy/part empty-img 32x32
*** Script Error: partial: needs a value
*** Where: partial
*** Stack:
```
**Expected behavior**
copy part of an image

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 30-Jan-2019/7:03:13+01:00 commit #25ef631
```


Comments:
--------------------------------------------------------------------------------

On 2019-02-10T09:00:52Z, 9214, commented:
<https://github.com/red/red/issues/3769#issuecomment-462115507>

    ### /1
    I cannot reproduce error mesage from the original report, instead seeing an access violation, which somehow depends on image size. Minimum dimension that causes an immediate crash, in my case, was:
    ```red
    copy/part make image! 273x49 1
    ```
    
    However, other dimensions will triger it too... if you try `copy/part` twice:
    ```red
    loop 2 [copy/part make image! 3x1 1]
    ```
    Above seems to hold for all `pair!` values with `x` greater than `2` and `y` greater than `0`. Although, with small `x` values, sometimes it shows this instead:
    ```red
    *** Script Error: invalid argument: 3x1
    *** Where: make
    *** Stack:
    ```
    
    GC isn't involved. Stack trace isn't terribly useful:
    ```red
    root size: 2153, root max: 4127, cycles: 0
    root size: 2153, root max: 4127, cycles: 1
    root size: 2153, root max: 4127, cycles: 2
    
    *** Runtime Error 1: access violation
    *** Cannot determine source file/line info.
    ***
    ```
    
    ### /2
    There is more-or-less related problem:
    ```red
    >> copy make image! 0x0
    *** Runtime Error 13: integer divide by zero
    *** at: 004269E9h
    ```
    Crash happens inside OS-specific `clone` routine (GDI+ in this case) on [this line](https://github.com/red/red/blob/master/runtime/platform/image-gdiplus.reds#L601) because `IMAGE_WIDTH(src/size)` earlier returned zero.
    
    ```red
    root size: 2153, root max: 4127, cycles: 0
    root size: 2153, root max: 4127, cycles: 1
    root size: 2153, root max: 4127, cycles: 2
    
    *** Runtime Error 13: integer divide by zero
    *** in file: .../image-gdiplus.reds
    *** at line: 601
    ***
    ***   stack: red/OS-image/clone 026AD374h 026AD384h 0 026AD364h false
    ***   stack: red/image/copy 026AD374h 026AD384h 026AD364h false 026AD364h
    ***   stack: red/actions/copy 026AD374h 026AD384h 026AD364h false 026AD364h
    ***   stack: red/actions/copy* -1 -1 -1
    ```
    
    I'd recommend to add zero-checking and also counter `pair!` values with negative parts in `make`:
    ```red
    >> make image! -1x-1
    == make image! [0x0 #{}]
    ```

--------------------------------------------------------------------------------

On 2019-08-04T01:57:09Z, bitbegin, commented:
<https://github.com/red/red/issues/3769#issuecomment-517967403>

    @9214 
    ```
    >> make image! -1x-1
    == make image! [0x0 #{}]
    ```
    do you mean this should give an error?

--------------------------------------------------------------------------------

On 2019-08-04T11:43:16Z, 9214, commented:
<https://github.com/red/red/issues/3769#issuecomment-517996288>

    @bitbegin in the former case, yes, because you can't really create image with negative sizes. In the latter - I'm not sure.



#3548: SIZE-TEXT returns inaccurate values
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
<https://github.com/red/red/issues/3548>

### Expected behavior
Would expect it to return the "bounding box" for the text contained with in it - so, for example:

    layout [tb: box 20x200 "Hello^/hello^/hello^/hello"]
    tb/size: size-text tb

Would shrink (or grow) TB so that it is neatly the size of the text.

(That's an oversimplification as there are issues with margins and baselines etc -- but it's a useful minimum starting point for boxes that resize to fit their text content. And, without useful output from SIZE-TEXT it not obvious how to accurately resize boxes - or change font sizes - to fit text content).

### Actual behavior

SIZE-TEXT in Red always seems to treat the text as being on one line, so with the above example:

    SIZE-TEXT tb
    ==  119x17   ;; almost always x17, except where we erratically get 0x0 under unreproducible conditions

In R2 the same result is more what we'd expect given the default font size, and text wrapping.

    == 16x228

I would not expect exactly the same result from Red - its compositing is bound to be different. But I'd expect sometime close.

### Steps to reproduce the problem
    layout [tb: box 20x200 "Hello^/hello^/hello^/hello"]
    size-text tb

### Red and platform version

RED: [ branch: "master" tag: #v0.6.3 ahead: 1046 date: 26-Sep-2018/19:44:03 commit: #47c6fed063e376a06d6e5ba85889c48b3c5c3434 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]


Comments:
--------------------------------------------------------------------------------

On 2018-12-30T16:05:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/3548#issuecomment-450570159>

    I fixed this in https://github.com/red/red/pull/3683 and it's okay to close this one.
    From now on:
    
    Windows 7:
    ```
    >> tb/size: size-text tb
    == 31x53
    ```
    
    Windows 8:
    ```
    >> tb/size: size-text tb
    == 33x66
    ```
    
    MacOS:
    ```
    >> size-text tb
    == 33x68
    ```



#4133: random values in VECTOR! for 8-16 bit INTEGER! or CHAR!
================================================================================
Issue is closed, was reported by 9214 and has 16 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/4133>

**Describe the bug**
Typically, `vector!` value created with `[<datatype> <bit size> <number of elements>]` prototype initializes all elements to "zero" (`0`, `0.0`, `0%` or `#"^@"`, depending on the respective datatype).

However, this does not hold for `[integer! | char! 8 | 16 ...]` cases, in which vector elements contain random values.

**To reproduce**
Bad news is that this is a Heisenbug - I managed to catch it only once and cannot reproduce it anymore.
```red
>> repeat i 3 [probe make vector! reduce ['integer! 8 i]] ()
make vector! [integer! 8 [-8]]
make vector! [integer! 8 [-122 1]]
make vector! [integer! 8 [-68 -56 86]]

>> repeat i 3 [probe make vector! reduce ['integer! 16 i]] ()
make vector! [integer! 16 [504]]
make vector! [integer! 16 [0 0]]
make vector! [integer! 16 [0 0 9112]]

>> repeat i 3 [probe make vector! reduce ['char! 8 i]] ()
make vector! [char! 8 [#"P"]]
make vector! [char! 8 [#"ø" #"^A"]]
make vector! [char! 8 [#" " #"^@" #"^@"]]

>> repeat i 3 [probe make vector! reduce ['char! 16 i]] ()
make vector! [char! 16 [#"Ѹ"]]
make vector! [char! 16 [#"^@" #"^@"]]
make vector! [char! 16 [#"^@" #"^@" #"^m"]]
```

**Expected behavior**
I expect vectors created that way to contain `0` for `integer!` and `#"^@"` for `char!`, regardless of their bit size.

**Platform version**
```
Red 0.6.4 for Windows built 16-Nov-2019/9:02:29+01:00 commit #e40b68a
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-16T20:25:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4133#issuecomment-554671237>

    I even updated to the latest build, but can't reproduce it. I don't think vector code is platform specific at all, so it's strange...

--------------------------------------------------------------------------------

On 2019-11-18T19:01:08Z, endo64, commented:
<https://github.com/red/red/issues/4133#issuecomment-555160220>

    I got correct results on Win10 with latest build:
    
    ```
    >> repeat i 3 [probe make vector! reduce ['integer! 8 i]] ()
    make vector! [integer! 8 [0]]
    make vector! [integer! 8 [0 0]]
    make vector! [integer! 8 [0 0 0]]
    >> repeat i 3 [probe make vector! reduce ['integer! 16 i]] ()
    make vector! [integer! 16 [0]]
    make vector! [integer! 16 [0 0]]
    make vector! [integer! 16 [0 0 0]]
    >> repeat i 3 [probe make vector! reduce ['char! 16 i]] ()
    make vector! [char! 16 [#"^@"]]
    make vector! [char! 16 [#"^@" #"^@"]]
    make vector! [char! 16 [#"^@" #"^@" #"^@"]]
    
    >> about
    Red 0.6.4 for Windows built 16-Nov-2019/19:22:27+03:00 commit #88b3ff0
    ```

--------------------------------------------------------------------------------

On 2019-11-18T23:39:44Z, greggirwin, commented:
<https://github.com/red/red/issues/4133#issuecomment-555261986>

    Can't dupe here on Win10 either. Definitely uncertain. :^)

--------------------------------------------------------------------------------

On 2019-11-19T13:56:53Z, 9214, commented:
<https://github.com/red/red/issues/4133#issuecomment-555518597>

    ```red
    >> repeat i 10 [probe make vector! reduce ['integer! 8 i]]
    make vector! [integer! 8 [0]]
    make vector! [integer! 8 [0 0]]
    make vector! [integer! 8 [0 0 0]]
    make vector! [integer! 8 [0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0 0 0]]
    == make vector! [integer! 8 [0 0 0 0 0 0 0 0 0 0]]
    
    >> loop 1'000 [repeat i 10 [make vector! reduce ['integer! 8 i]]]
    == make vector! [integer! 8 [0 0 0 0 0 0 0 0 11 0]]
    
    >> repeat i 10 [probe make vector! reduce ['integer! 8 i]]
    make vector! [integer! 8 [15]]
    make vector! [integer! 8 [120 56]]
    make vector! [integer! 8 [88 0 -97]]
    make vector! [integer! 8 [0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 -124 56]]
    make vector! [integer! 8 [0 0 0 0 16 0 0]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0 11]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0 8 0]]
    == make vector! [integer! 8 [0 0 0 0 0 0 0 0 8 0]]
    ```
    ```red
    >> repeat i 1'000 [if 0 <> sum make vector! reduce ['integer! 8 i][break/return i]]
    == 914
    ```

--------------------------------------------------------------------------------

On 2019-11-19T15:13:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4133#issuecomment-555552553>

    @9214 I confirm now. Only when the last vector elements do not occupy 32 bits wholly (vectors of size 4*N + 1..3) these elements are filled with junk.

--------------------------------------------------------------------------------

On 2019-11-20T17:37:27Z, qtxie, commented:
<https://github.com/red/red/issues/4133#issuecomment-556151987>

    Seems a GC issue. 
    ```
    --== Red 0.6.4 ==--
    Type HELP for starting information.
    
    >> recycle
    root: 3018/4669, runs: 0, mem: 1774364 => 1645204, mark: 8.0ms, sweep: 5.0ms
    >> repeat i 10 [probe make vector! reduce ['integer! 8 i]]
    make vector! [integer! 8 [-32]]
    make vector! [integer! 8 [-32 -81]]
    make vector! [integer! 8 [-32 -81 -36]]
    make vector! [integer! 8 [0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 -32]]
    make vector! [integer! 8 [0 0 0 0 -32 -81]]
    make vector! [integer! 8 [0 0 0 0 -32 -81 -36]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0 -32]]
    make vector! [integer! 8 [0 0 0 0 0 0 0 0 -32 -81]]
    == make vector! [integer! 8 [0 0 0 0 0 0 0 0 -32 -81]]
    ```

--------------------------------------------------------------------------------

On 2019-11-20T18:46:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4133#issuecomment-556234093>

    @qtxie it's bugged even with `recycle/off`

--------------------------------------------------------------------------------

On 2019-11-20T20:44:00Z, 9214, commented:
<https://github.com/red/red/issues/4133#issuecomment-556370182>

    My uneducated guess is that this is misalignment on 32-bit boundary.


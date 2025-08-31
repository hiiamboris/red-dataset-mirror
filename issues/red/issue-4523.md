
#4523: MAKE does not copy inner hashes & strings, vectors, binary, images
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.design]
<https://github.com/red/red/issues/4523>

**Describe the bug**

Another tripwire. Use this script:
```
o: make object! [f: func [] compose/only [(make block! [])]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()

o: make object! [f: func [] compose/only [(make hash! [])]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()

o: make object! [f: func [] compose/only [(make paren! [])]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()
```
Output:
```
>> o: make object! [f: func [] compose/only [(make block! [])]] ()
>> p: make o [] ()
>> probe same? first body-of :o/f first body-of :p/f ()
false
>> 
>> o: make object! [f: func [] compose/only [(make hash! [])]] ()
>> p: make o [] ()
>> probe same? first body-of :o/f first body-of :p/f ()
true              ;) WHY???
>> 
>> o: make object! [f: func [] compose/only [(make paren! [])]] ()
>> p: make o [] ()
>> probe same? first body-of :o/f first body-of :p/f ()
false
```
Whereas `copy/deep` is okay:
```
>> c: copy/deep b: reduce [make hash! []] ()
>> same? c/1 b/1
== false
```

Strings are never copied for some reason, so can't be used as local cache for funcs within objects:
```
o: make object! [f: func [] [""]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()

o: make object! [f: func [] [%""]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()

o: make object! [f: func [] [@]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()
```
Output:
```
true
true
true
```

Paths are all copied. Other series are also not copied:
```
o: make object! [f: func [] [#{}]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()

o: make object! [f: func [] compose/only [(make vector! [])]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()

o: make object! [f: func [] compose/only [(make image! 0x0)]] ()
p: make o [] ()
probe same? first body-of :o/f first body-of :p/f ()
```


**Expected behavior**

Hashes & strings being copied by `make`. Also binary, vector, images.
I suppose the current behavior was just the minimal choice - it wouldn't work at all otherwise. Any arguments against copying?

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-01T17:31:40Z, dockimbel, commented:
<https://github.com/red/red/issues/4523#issuecomment-771024890>

    Object series default sharing has always been privileged in both Rebol and Red. It not only lowers the memory usage, but also allows the user to control when and which series should be copied. If the default was to deep copy everything, the user would have less control and the memory usage would increase significantly (having also a speed impact), especially in modules like View where objects are used a lot.

--------------------------------------------------------------------------------

On 2021-02-01T17:54:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4523#issuecomment-771038911>

    What if we make `make` work like `copy` (currently works like `copy/deep` - see #4810 ) and add a `make/deep` refinement to `copy/deep` all series in the object including those in function bodies?
    
    Continuing the inconsistencies list:
    `make` "copy/deep" behavior is even more aggressive than of `copy/deep` itself:
    ```
    >> o: object [b: to hash! reduce [next "1234"]]
    >> p: copy o
    >> q: copy/deep o
    >> r: make o []
    >> head p/b/1
    == "1234"
    >> head q/b/1
    == "1234"                ;) copy/deep does not copy hash in the object ?!?
    >> head r/b/1
    == "234"
    
    >> o: object [b: reduce [next make hash! [1 2 3 4]]]
    >> p: copy o
    >> q: copy/deep o
    >> r: make o []
    >> head p/b/1
    == make hash! [1 2 3 4]
    >> head q/b/1
    == make hash! [2 3 4]    ;) but copy/deep copies nested hashes !!
    >> head r/b/1
    == make hash! [2 3 4]
    ```


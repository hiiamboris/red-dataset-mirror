
#300: float! and float64! not completely compatible
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/300>

I am sorry to go on nagging, but look at this:

```
v: declare pointer![float64!] d: 1.0 v: :d

-= Red/System Compiler =-
Compiling tests/mytest.reds ...
*** Compilation Error: attempt to change type of variable: v
*** from: [pointer! [float64!]]
***   to: [pointer! [float!]]
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-10T01:49:27Z, iceflow19, commented:
<https://github.com/red/red/issues/300#issuecomment-10250664>

    If I remember correctly, float! -> float64! casting and/or float32! -> float64! casting is  not implemented.

--------------------------------------------------------------------------------

On 2012-11-10T08:21:35Z, meijeru, commented:
<https://github.com/red/red/issues/300#issuecomment-10253083>

    But float! and float64! are synonyms, so casting shouldn't be needed?

--------------------------------------------------------------------------------

On 2012-11-14T23:27:02Z, dockimbel, commented:
<https://github.com/red/red/issues/300#issuecomment-10390787>

    @iceflow19 float! -> float32! -> float!  castings are implemented since this summer at least. Let me know if you find bugs in using them.
    
    Float! and float64! are synonyms.



#173: as-logic pointer! broken the other way around
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/173>

#171 now doesn't detect non-null, instead of not detecting null:

```
x: as struct! [x [integer!]] 1
if as-logic x [
    print "not null^/"
]
y: as pointer! [byte!] 1
if as-logic y [
    print "not null^/"
]
```

(Silence.)



Comments:
--------------------------------------------------------------------------------

On 2011-09-08T20:15:40Z, dockimbel, commented:
<https://github.com/red/red/issues/173#issuecomment-2044134>

    It is a variable initialization issue. The struct variables were supposed to be initialized using a `declare` keyword. Initializing using a type casting was not correctly supported until the fix for #171. It seems that it needs more improvements.
    
    ```
    x: as struct! [x [integer!]] 1
    print [x lf]
    
    00000000
    
    x: declare struct! [x [integer!]]
    x: as struct! [x [integer!]] 1
    print [x lf]
    
    00000001
    ```

--------------------------------------------------------------------------------

On 2011-09-08T20:27:54Z, dockimbel, commented:
<https://github.com/red/red/issues/173#issuecomment-2044278>

    Fixed by commit [3e4591bd](https://github.com/dockimbel/Red/commit/3e4591bda4a3f69095dfa3224eaede0cde879c10).


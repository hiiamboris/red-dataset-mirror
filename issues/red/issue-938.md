
#938: path! doesn't select string! from block!.
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/938>

path! doesn't select string! from block!.

```
red>> b: [x y "x" "y"]
== [x y "x" "y"]
red>> b/('x)
== y
red>> b/("x")
*** Error: invalid value in path!
```



Comments:
--------------------------------------------------------------------------------

On 2014-09-21T05:36:10Z, dockimbel, commented:
<https://github.com/red/red/issues/938#issuecomment-56289854>

    Support for SELECTing strings is not yet implemented.

--------------------------------------------------------------------------------

On 2015-03-15T10:55:41Z, WiseGenius, commented:
<https://github.com/red/red/issues/938#issuecomment-80956862>

    As expected, Red 0.5.1 now gives:
    
    ```
    red>> b: [x y "x" "y"]
    == [x y "x" "y"]
    red>> b/('x)
    == y
    red>> b/x
    == y
    red>> b/("x")
    == "y"
    ```
    
    The compiler seems to be working too.
    Should this issue now be closed?

--------------------------------------------------------------------------------

On 2015-03-15T10:57:48Z, dockimbel, commented:
<https://github.com/red/red/issues/938#issuecomment-80957138>

    Yes, forgot to close it, thanks for the reminder.


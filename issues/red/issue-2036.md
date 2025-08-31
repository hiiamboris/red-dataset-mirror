
#2036: make an-image [] close the console
================================================================================
Issue is closed, was reported by DideC and has 4 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/2036>

In Rebol you can do:```

> > i: make image! 5x5
> > == make image! [5x5 #{
> > 000000000000000000000000000000000000000000000000000000000000
> > 00000000000000000000000000000000000000000000000...
> > j: make i []
> > == make image! [5x5 #{
> > 000000000000000000000000000000000000000000000000000000000000
> > 00000000000000000000000000000000000000000000000...
> > 
> > ```
> > But in Red, the second line close the console immediately!
> > ```



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T08:57:42Z, dockimbel, commented:
<https://github.com/red/red/issues/2036#issuecomment-226717204>

    Feature not yet implemented. Use `copy i` in the meantime.

--------------------------------------------------------------------------------

On 2016-06-17T09:31:31Z, DideC, commented:
<https://github.com/red/red/issues/2036#issuecomment-226724436>

    OK. Noted.


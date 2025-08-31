
#501: AT doesn't implement 0 hole
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/501>

red>> at tail "abc" -1
== "bc"
red>> at tail "abc" 0
== "c"

R3 & R2:

> > at tail "abc" -1
> > == "c"
> > at tail "abc" 0 
> > == ""



Comments:
--------------------------------------------------------------------------------

On 2013-07-31T20:06:13Z, dockimbel, commented:
<https://github.com/red/red/issues/501#issuecomment-21891458>

    The 0 hole is not properly implemented yet in all series functions. In the meantime, I'll fix this one for now. Index 0 should raise an error in Red.

--------------------------------------------------------------------------------

On 2013-08-01T00:41:36Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/501#issuecomment-21906972>

    Do file! and path! inherit these fixes?

--------------------------------------------------------------------------------

On 2013-08-01T09:46:10Z, dockimbel, commented:
<https://github.com/red/red/issues/501#issuecomment-21925673>

    Yes, they do.

--------------------------------------------------------------------------------

On 2013-08-01T15:14:38Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/501#issuecomment-21943361>

    Nice, thanks.

--------------------------------------------------------------------------------

On 2016-09-12T13:03:15Z, rebolek, commented:
<https://github.com/red/red/issues/501#issuecomment-246340180>

    @dockimbel You wrote "Index 0 should raise an error in Red". Is this true still? Currently it works as Rebol:
    
    ```
    red>> at tail "abc" 0
    == ""
    ```


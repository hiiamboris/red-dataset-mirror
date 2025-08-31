
#3234: Using ISSUE! color values in DRAW is possible in LAYOUT block only
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/3234>

### Expected behavior

These two lines should be equivalent

`view [base draw [pen #000000 line 0x0 100x100]]`

`view [base on-create [face/draw: [pen #000000 line 0x0 100x100]]]`

### Actual behavior

They aren't, second ones throws error: 

```
*** Script Error: invalid Draw dialect input at: [#000000 line 0x0 100x100]
*** Where: ???
```

### Steps to reproduce the problem

See above

### Red version and build date, operating system with version.

```
>> about
Red for Windows version 0.6.3 built 13-Feb-2018/12:19:36+01:00
```

on Wine



Comments:
--------------------------------------------------------------------------------

On 2018-03-14T12:37:35Z, dockimbel, commented:
<https://github.com/red/red/issues/3234#issuecomment-373005893>

    Using `issue!` values for color is a facility offered by VID using the `hex-to-rgb` function. Having it supported in Draw is too expensive, as the conversion would need to be done each time the Draw block is displayed on screen. You can pre-process your Draw block manually to achieve such conversion using this [provided function](https://github.com/red/red/blob/master/modules/view/VID.red#L174).


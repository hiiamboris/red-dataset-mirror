
#1718: Spline doesn't accept two points
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1718>

In the Spline section of the Draw document, it says:

> Note: 2 points are accepted, but they will produce only a straight line

And it did, at least one month ago. But now it doesn't, and that breaks my code.

> **\* Script error: invalid Draw dialect input

In my code, all the lines which is used to connect 2 visual objects are splines, instead of lines. Why? Because in my code I allow users to click on the (sp)lines to generate new points, so a spline with two points is just in its initial state.

Please fix this bug. Thanks.

``` Red
view [ base 100x100 draw [ spline 0x0 100x100 ] ]
```




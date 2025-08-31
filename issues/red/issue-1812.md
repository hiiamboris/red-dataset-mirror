
#1812: Calculated height of text face does not take font-size into account 
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/1812>

If a height facet is not supplied for a `text`, the calculation of the height does not take into account the font-size. As a result typed text is not properly visible on screen.

This code demonstrates the behaviour:

``` Red
view [ field font-size 20 600]
```




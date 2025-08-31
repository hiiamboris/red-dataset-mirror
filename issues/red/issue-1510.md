
#1510: R.G.B.A(Transprancy) or R.G.B.O(Opacity)? 
================================================================================
Issue is closed, was reported by JerryTsai and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1510>

1. In my Test on Atom Tablet with Windows 10, the 4th element of the color tuple is Opacity. The bigger the number is, the more opaque the color is. I just need to be sure the system that Red use is RGBA or RGBO.
2. No matter the 4th element of a color is 0 or 255, the color will become opaque. this is absolutely a bug.



Comments:
--------------------------------------------------------------------------------

On 2015-12-17T14:34:18Z, JerryTsai, commented:
<https://github.com/red/red/issues/1510#issuecomment-165467156>

    After you closed the issue. I did a test. When alpha is 255, the color should be fully transparent, but in my test, it's fully opaque. This issue should be re-open.

--------------------------------------------------------------------------------

On 2015-12-17T15:05:13Z, WiseGenius, commented:
<https://github.com/red/red/issues/1510#issuecomment-165477824>

    @JerryTsai Are you referring to the color of a base face? If so, see my latest comment on [#1452](https://github.com/red/red/issues/1452).

--------------------------------------------------------------------------------

On 2015-12-17T15:24:28Z, WiseGenius, commented:
<https://github.com/red/red/issues/1510#issuecomment-165482693>

    #1512 seems to have fixed #1452.



#3083: as-pair converts floats to integers
================================================================================
Issue is closed, was reported by BrianOtto and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3083>

I am working on a project where I parse SVG files and use the Draw dialect to render them to the screen. SVGs typically have floating point values for their coordinates and they are getting converted to integers when I use as-pair.

`probe as-pair 1.123 1.789`

### Expected Behavior
`1.123x1.789`

### Actual Behavior
`1x1`

### Red version and build date, operating system with version.
red 0.6.3 on Windows 7 Pro SP1 (build date = week or two ago)



Comments:
--------------------------------------------------------------------------------

On 2017-10-20T14:54:06Z, DideC, commented:
<https://github.com/red/red/issues/3083#issuecomment-338230016>

    floating pair is not implemented in Red. Actually it's still in a "wish" status.
    
    For your convertion, you must multiply all coordinates by 1000 and use a 'scale command to reduce the scale by 1000 at the beginning of your drawing.
    `as-scaled-pair: func [x y][as-pair 1000 * x 1000 * y]`

--------------------------------------------------------------------------------

On 2017-10-20T20:25:34Z, BrianOtto, commented:
<https://github.com/red/red/issues/3083#issuecomment-338313730>

    OK, I see, thank you for the workaround !

--------------------------------------------------------------------------------

On 2017-10-21T09:07:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3083#issuecomment-338377161>

    ```
    Expected Behavior
    1.123x1.789
    ```
    
    Pairs do not support decimal number for now, so it can't be the expected behavior.


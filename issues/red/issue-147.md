
#147: struct declaration wastes space
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.resolved]
<https://github.com/red/red/issues/147>

Consider the following example:

```
screen: declare sdl-surface!
;screen: as sdl-surface! none

either zero? sdl-begin sdl-init-all [
    screen: sdl-set-video-mode 640 480 32 sdl-software-surface
```

The screen struct is initialised in a deeper level, where type inference doesn't work, so I must declare it at the top level. But I can't cast NONE, so I must declare a complete struct, which isn't used. This isn't a problem in local function variables, but for main programs at the top level I can't declare just the type.



Comments:
--------------------------------------------------------------------------------

On 2011-08-10T17:41:51Z, dockimbel, commented:
<https://github.com/red/red/issues/147#issuecomment-1774842>

    As a workaround, you can still declare it by type casting a literal value, like 0.
    
    ```
    screen: as sdl-surface! 0
    ```

--------------------------------------------------------------------------------

On 2011-08-10T22:41:09Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/147#issuecomment-1777498>

    Ah, thanks.


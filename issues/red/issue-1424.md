
#1424: Possible Float Stack Check Bug
================================================================================
Issue is closed, was reported by JacobGood1 and has 2 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/1424>

I get a float stack check error when I do this...
c code

``` c++
extern "C" __declspec(dllexport) inline float __cdecl sf_sprite_get_x(sfSprite* sprite)
{
    return sfSprite_getPosition(sprite).x;
}
```

reds

``` reds
sf-sprite-get-x: "sf_sprite_get_x" [
    sprite  [sf-sprite!]
    return: [float32!]
]
```

red

``` red
get-x: routine [sprite* [integer!] return: [float!]] [
    as float! sf-sprite-get-x as byte-ptr! sprite*
]
```

get-x sprite*

**\* Runtime Error 11: float stack check
**\* at: 68C6C4CCh



Comments:
--------------------------------------------------------------------------------

On 2019-08-28T14:09:32Z, dockimbel, commented:
<https://github.com/red/red/issues/1424#issuecomment-525762647>

    Can't be reproduced anymore. Moreover, such kind of FPU errors on Intel platforms will be gone once we switch to SSE for floating-point support.



#4179: Cannot measure text for use in `draw` block without creating excess `face` object. 
================================================================================
Issue is open, was reported by loziniak and has 14 comment(s).
[GUI] [type.design]
<https://github.com/red/red/issues/4179>

([gitter chat](https://gitter.im/red/help?at=5dee661c1e0b827cc8ccaffc))

I want to measure a text, for usage inside a `draw` block, so I don't have a `face` object dedicated for this particular text. It should be possible to provide a `font` only for this use case. In my opinion having to create excess objects only to carry some other objects, is unacceptable in serious programming.


Comments:
--------------------------------------------------------------------------------

On 2019-12-09T16:08:45Z, loziniak, commented:
<https://github.com/red/red/issues/4179#issuecomment-563309849>

    Problematic code is a Windows implementation of `get-text-size` function, which relies on face object. MacOS and Linux versions could probably be modified more easily.

--------------------------------------------------------------------------------

On 2019-12-09T23:43:58Z, greggirwin, commented:
<https://github.com/red/red/issues/4179#issuecomment-563491854>

    "unacceptable in serious programming." is a bit strong IMO. Text measurement on Windows has historically been based on device contexts, so this is a cost of the platform. Use of modern APIs will require OS sniffing to avoid that. Another thing to keep in mind is that `size-text` also measures rich text. If you eliminate the face aspect for basic text, you have to change the function spec as well (even if just to allow `none`, which makes the call site look like `size-text none ...`, effectively making the face a leading optional parameter).
    
    As far as creating excess objects, you only need one. When Red supports concurrency, you'll need one per thread of execution or another way to serialize requests to a single, blocking, reference. For the time being, how unacceptable is it to reserve a single face to do this?

--------------------------------------------------------------------------------

On 2019-12-10T10:24:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4179#issuecomment-563967549>

    I should also remind everyone that *size of text in a face* doesn't equal *size of text as a string*:
    - there's the *size* of the face, and if text doesn't fit it can be split by word or char boundary, depending on face settings
    - there's *para!* object that defines wrapping and padding
    - there's *detabbing* mode - usually in the shape of tab stops (in pixels)
    
    Then there's OS *scaling*, which may be different for different displays (screens) if you have more than one (as they may have different DPI)
    
    `size-text` is there to tell you how your big paragraph will look in that particular face considering the settings I just mentioned. It must be the main driver behind face object requirement.
    
    But there is of course a need for lower level dumb text measurement that would assume infinite canvas and ignore tabs, and it came up a year ago I think. But it still has to account for scaling, which is why I propose using `system/view/screens/1` face. I don't think there's currently a way to determine the active screen, and the window may even appear on 2 screens at once, so it's more complicated that we use to think.
    
    `size-text` would be a measurement in a vacuum. It's okay if you want to ignore the DPI and maybe render a pdf or something. Where you really could care less about the display ;)

--------------------------------------------------------------------------------

On 2019-12-10T10:50:17Z, loziniak, commented:
<https://github.com/red/red/issues/4179#issuecomment-563977777>

    macOS and Linux `get-text-size` implementations don't use `face` parameter at all. So I assume, that they don't take into account any of these (wrapping, padding, detabbing, scaling)?

--------------------------------------------------------------------------------

On 2019-12-10T10:53:18Z, loziniak, commented:
<https://github.com/red/red/issues/4179#issuecomment-563978816>

    I'm totally for a low-level dumb font-only version. And for Windows `system/view/screens/1` could be used behind the stage, somewhere in `gui.reds` probably.

--------------------------------------------------------------------------------

On 2019-12-10T12:47:08Z, loziniak, commented:
<https://github.com/red/red/issues/4179#issuecomment-564017181>

    I've tried to create such dumb function in #4182 . Comments welcome, since probably it has lots of errors :-)

--------------------------------------------------------------------------------

On 2023-08-07T09:52:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4179#issuecomment-1667550347>

    Part of this more general thought dump https://github.com/red/REP/issues/124


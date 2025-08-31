
#5498: The IMAGE STYLE doesn't get its face color.
================================================================================
Issue is open, was reported by luce80 and has 18 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/5498>

**Describe the bug**
The `image` `style` doesn't get its face color.

**To reproduce**
If I do `view [image yellow]` I get a WHITE image,.

**Expected behavior**
```
system/view/VID/styles/image: [
	default-actor: on-down
	template: [type: 'base size: 100x100]
	init: [unless image [image: make image! reduce [size color]]]
]

view [image yellow]
```
**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 32 date: 16-Mar-2024/20:36:50 commit: #181d7faeab0381d7a86575847918a4ab05e68503 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2024-04-03T23:33:36Z, qtxie, commented:
<https://github.com/red/red/issues/5498#issuecomment-2035807503>

    The rendering order of the facets is as follows:
    
    `color` -> `image` -> `text`
    
    The white image covers the background color in this issue, that why you cannot see the color.

--------------------------------------------------------------------------------

On 2024-04-04T00:18:54Z, greggirwin, commented:
<https://github.com/red/red/issues/5498#issuecomment-2035842759>

    `view [img: image yellow with [image: #(none)] button [img/image: none]]`
    
    If you wanted no image to begin with, should `with` work here? Clearing the image does correctly reveal the color.

--------------------------------------------------------------------------------

On 2024-04-04T22:04:03Z, dockimbel, commented:
<https://github.com/red/red/issues/5498#issuecomment-2038326199>

    Yellow image here using the latest commit from master:
    
    <img width="425" alt="image" src="https://github.com/red/red/assets/411393/66a50c1d-8fcd-4faa-a7f2-f40e34119c60">

--------------------------------------------------------------------------------

On 2024-04-05T17:15:44Z, greggirwin, commented:
<https://github.com/red/red/issues/5498#issuecomment-2040287698>

    Hmmm. I just pulled and rebuilt, and I still get a white image. Or are you saying users need to patch the style to get this behavior, as it doesn't do that by default? 

--------------------------------------------------------------------------------

On 2024-04-05T17:18:49Z, dockimbel, commented:
<https://github.com/red/red/issues/5498#issuecomment-2040291667>

    Are you sure? Using the [latest View build](https://static.red-lang.org/dl/auto/win/red-view-05apr24-9516a4b66.exe), I get a yellow result.

--------------------------------------------------------------------------------

On 2024-04-05T17:36:44Z, greggirwin, commented:
<https://github.com/red/red/issues/5498#issuecomment-2040315127>

    Just DL'd the static build and still get the white result by default. If I patch the style, as you have above, it works. I just didn't know if the new behavior should be by default.
    ```
    >> about
    Red 0.6.5 for Windows built 5-Apr-2024/8:22:23-06:00  commit #9516a4b
    >> system/view/vid/styles/image
    == [
        default-actor: on-down 
        template: [type: 'base size: 100x100] 
        init: [unless image [image: make image! size]]
    ]
    ```
    is the standard image style in the static build as well.

--------------------------------------------------------------------------------

On 2024-04-05T17:40:01Z, dockimbel, commented:
<https://github.com/red/red/issues/5498#issuecomment-2040319440>

    It seems I am the one who got it wrong. I kept using the code provided under "Expected behavior" as code for reproducing the issue...

--------------------------------------------------------------------------------

On 2024-04-05T17:41:13Z, dockimbel, commented:
<https://github.com/red/red/issues/5498#issuecomment-2040320974>

    I think we can improve VID so that the image gets colored using the provided color.

--------------------------------------------------------------------------------

On 2024-04-06T14:42:41Z, luce80, commented:
<https://github.com/red/red/issues/5498#issuecomment-2041108007>

    This is better then my previous suggestion:
    ```
    	system/view/VID/styles/image: [
    		default-actor: on-down
    		template: [type: 'base size: 100x100]
    		init: [unless image [image: make image! reduce [size any [color white]]]]
    	]
    ```


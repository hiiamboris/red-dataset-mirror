
#2499: font-size/font-name: style font changes if a face uses a different facet
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/2499>

If you create a style with a `font-size` attribute, then later use `font-name` on a face using that style, the font-name is applied to all faces of that style.
```
view [
	style text: text font-size 12
	text "Lorem ipsum dolor" return
	text font-name "Fixedsys""This is code"
]
```



Comments:
--------------------------------------------------------------------------------

On 2017-03-26T02:07:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2499#issuecomment-289252800>

    Good catch!

--------------------------------------------------------------------------------

On 2018-09-10T22:20:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2499#issuecomment-420080690>

    This seems to be fixed, though not marked as such. Closing.


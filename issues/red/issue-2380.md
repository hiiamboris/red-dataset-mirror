
#2380: Font settings are incorrect after VID merges
================================================================================
Issue is closed, was reported by endo64 and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2380>

Size and Color facets get appended when VID merges the settings:

```
f1: make font! [name: "Arial" size: 24 color: red]
view [f2: text "Test" font f1 font-color blue font-size 22]
? f2/font
size  block!    [24 22]  ;<< should be 22
color  block!    [255.0.0 0.0.255]  ;<< should be 0.0.255

view [f3: text "Test" font f2/font font-color green font-size 20]
? f3/font
size             block!    [24 22 20]  ; << should be 20
color            block!    [255.0.0 0.0.255 0.255.0]  ; << should be 0.255.0
```



Comments:
--------------------------------------------------------------------------------

On 2016-12-26T08:58:32Z, meijeru, commented:
<https://github.com/red/red/issues/2380#issuecomment-269186805>

    As far as I can see, this is because `add-flag` is used to handle the setting, which always forces the facet to be a block. For `font/color` and `/size` another function should be used.

--------------------------------------------------------------------------------

On 2017-01-05T12:28:51Z, DideC, commented:
<https://github.com/red/red/issues/2380#issuecomment-270633391>

    Already posted as #2269

--------------------------------------------------------------------------------

On 2017-02-21T07:58:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2380#issuecomment-281270632>

    @DideC Well done!


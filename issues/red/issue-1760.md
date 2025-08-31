
#1760: Allow the use of `select:` in a data block for a list in VID.
================================================================================
Issue is closed, was reported by dockimbel and has 12 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1760>

Instead of:

```
view [tl: text-list data ["A" "B" "C"] do [tl/selected: 2]]
```

consider allowing this shorter form:

```
view [text-list data ["A" select: "B" "C"]]
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-01T09:07:36Z, iArnold, commented:
<https://github.com/red/red/issues/1760#issuecomment-204321716>

    This also applies to drop-list and drop-down?

--------------------------------------------------------------------------------

On 2016-04-01T10:04:17Z, dockimbel, commented:
<https://github.com/red/red/issues/1760#issuecomment-204336927>

    Yes, the title says "for a list", not "for a text-list".

--------------------------------------------------------------------------------

On 2016-05-09T15:47:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1760#issuecomment-217903678>

    Actually, putting the selection out of the data block might be preferable:
    
    ```
    view [text-list data ["A" "B" "C"] select 2]
    ```

--------------------------------------------------------------------------------

On 2016-05-09T20:12:52Z, iArnold, commented:
<https://github.com/red/red/issues/1760#issuecomment-217975455>

    Looks to make sense to me, this way the data block and the select index value can be constructed independent of each other. I figure it can be hard or at least inconvenient to insert "select:" into a constructed datablock or drop it later when the datablock must be changed dynamically.

--------------------------------------------------------------------------------

On 2016-05-10T05:27:56Z, dockimbel, commented:
<https://github.com/red/red/issues/1760#issuecomment-218062378>

    `select:` was never meant to be used in a constructed data block, only in VID literal data blocks.

--------------------------------------------------------------------------------

On 2016-05-10T11:31:30Z, dockimbel, commented:
<https://github.com/red/red/issues/1760#issuecomment-218131417>

    `select` option implemented. It takes an integer! as argument and sets the `face/selected` facet.


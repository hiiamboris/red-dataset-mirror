
#1026: red-series! definition in %structures.reds may need to be reviewed 
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/1026>

With the support for typesets, the red-series! definition in %structures.reds becomes more than a convenience: it now documents what the representations of all types included in series! have in common. Serveral of these types have a use for the fourth field (cache pointer for strings/files /urls, element type ID for the new vectors). Thus the field name `_pad` for this fourth field is now perhaps misleading. What about `extra` ? 



Comments:
--------------------------------------------------------------------------------

On 2015-02-01T08:44:34Z, dockimbel, commented:
<https://github.com/red/red/issues/1026#issuecomment-72356659>

    Preliminary remark: `red-block!` and derivatives have no extra field, it's just a padding. 
    
    As you point out rightly, red-series! represents what is common to all series! types, that common part is just the `head` and `node` fields. Some series! use an additional field, but that extra field is not part of what constitutes a series!, it's specific to the datatype.

--------------------------------------------------------------------------------

On 2015-02-02T07:52:44Z, meijeru, commented:
<https://github.com/red/red/issues/1026#issuecomment-72417551>

    OK, so `_pad` does not mean 'empty/unused' but 'irrelevant'.

--------------------------------------------------------------------------------

On 2015-02-02T08:06:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1026#issuecomment-72419078>

    Could be interpreted like that yes. 


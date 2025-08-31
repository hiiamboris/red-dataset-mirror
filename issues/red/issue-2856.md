
#2856: image/size cannot be set, but attempt does not error out
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2856>

The setting of the `/size` component of an `image!` value should be forbidden, and in fact the attempt to do so is inoperative (see `%image.reds` at lines 682-684), but there is no warning to the user.



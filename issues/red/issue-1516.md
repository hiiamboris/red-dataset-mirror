
#1516: image style should use actual size of image
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1516>

The `image` style in VID is a `base` face with default size 100x100. This is wrong, since the image size is known. The default size could be omitted, and the size of the face could be determined by the size of the image itself.  




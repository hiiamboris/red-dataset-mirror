
#4171: GTK: no error message when trying to `load` non-existent image
================================================================================
Issue is closed, was reported by loziniak and has 8 comment(s).
<https://github.com/red/red/issues/4171>

When compiling and running this code in Linux/GTK without `img.png` in my path:
```
Red [Needs: 'View]
probe draw-commands: reduce [
    'image load %img.png
    10x10 30x30
]
view compose/deep/only [
    base draw (draw-commands)
]
```
I get GTK errors, but no error from Red itself:
```
(wallet2_r:14959): GdkPixbuf-CRITICAL **: 19:05:55.219: gdk_pixbuf_scale_simple: assertion 'GDK_IS_PIXBUF (src)' failed

(wallet2_r:14959): GdkPixbuf-CRITICAL **: 19:05:55.219: gdk_pixbuf_get_n_channels: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(wallet2_r:14959): GdkPixbuf-CRITICAL **: 19:05:55.219: gdk_pixbuf_get_height: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(wallet2_r:14959): GdkPixbuf-CRITICAL **: 19:05:55.219: gdk_pixbuf_get_width: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(wallet2_r:14959): GLib-GObject-CRITICAL **: 19:05:55.219: g_object_unref: assertion 'G_IS_OBJECT (object)' failed

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.219: drawing failure for widget 'GtkLayout': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.219: drawing failure for widget 'GtkLayout': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.219: drawing failure for widget 'GtkLayout': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.220: drawing failure for widget 'GtkLayout': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.220: drawing failure for widget 'GtkBox': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.220: drawing failure for widget 'GtkWindow': invalid value (typically too big) for the size of the input (surface, pattern, etc.)
```

In Windows implementation of View, error is displayed in case of image not found:
```
*** Access Error: cannot open: %img.png
*** Where: decode
*** Stack: probe load
```

Which is much more descriptive for this case.


Comments:
--------------------------------------------------------------------------------

On 2019-12-03T16:57:32Z, 9214, commented:
<https://github.com/red/red/issues/4171#issuecomment-561259204>

    Minimal example: `view [image %image.png]`.

--------------------------------------------------------------------------------

On 2019-12-04T03:24:43Z, bitbegin, commented:
<https://github.com/red/red/issues/4171#issuecomment-561459488>

    lastest code should work

--------------------------------------------------------------------------------

On 2019-12-05T10:43:25Z, bitbegin, commented:
<https://github.com/red/red/issues/4171#issuecomment-562074509>

    @loziniak it works for me, can you confirm with the latest code?

--------------------------------------------------------------------------------

On 2019-12-11T16:21:57Z, loziniak, commented:
<https://github.com/red/red/issues/4171#issuecomment-564621176>

    Now it's fine, thanks!


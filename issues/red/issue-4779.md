
#4779: GTK crashes when molding image
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/4779>

Run the following code in the console:
```
>> i: draw 100x100 [fill-pen red circle 50x5 50]
>> i2: draw 100x100 [image i crop 0x-50 100x50]

(console-2020-12-19-66969:304): GdkPixbuf-CRITICAL **: 12:50:43.124: gdk_pixbuf_new_subpixbuf: assertion 'src_y >= 0 && src_y + height <= src_pixbuf->height' failed

(console-2020-12-19-66969:304): GdkPixbuf-CRITICAL **: 12:50:43.137: gdk_pixbuf_scale_simple: assertion 'GDK_IS_PIXBUF (src)' failed

(console-2020-12-19-66969:304): GdkPixbuf-CRITICAL **: 12:50:43.137: gdk_pixbuf_get_n_channels: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(console-2020-12-19-66969:304): GdkPixbuf-CRITICAL **: 12:50:43.138: gdk_pixbuf_get_height: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(console-2020-12-19-66969:304): GdkPixbuf-CRITICAL **: 12:50:43.138: gdk_pixbuf_get_width: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(console-2020-12-19-66969:304): GLib-GObject-CRITICAL **: 12:50:43.138: g_object_unref: assertion 'G_IS_OBJECT (object)' failed

(console-2020-12-19-66969:304): GLib-GObject-CRITICAL **: 12:50:43.138: g_object_unref: assertion 'G_IS_OBJECT (object)' failed
== make image! [100x100 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FF...
>> ? i2
Gdk-Message: 12:50:51.956: console-2020-12-19-66969: Fatal IO error 0 (Success) on X server 172.24.32.1:0.
```

**Expected behavior**
No crashes.

**Platform version**
Linux GTK. 
Red version: master branch: dd6a87e530cde0278dddfb3a19fc36a9e82651ee





#279: GTK window icon loading corrupted
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/279>

kaj@Kaj-Portable-PC ~/Desktop/Red/test $ Linux/RedSystem/dressed-up-hello-GTK-world 
GTK version: sufficient

(dressed-up-hello-GTK-world:8947): Gtk-CRITICAL **: IA__gtk_container_add: assertion `GTK_IS_WIDGET (widget)' failed

This used to be OK in older Red/System versions. It seems that

```
type = system/alias/gdk-image! [
```

is not recognised anymore in `gtk-window`.




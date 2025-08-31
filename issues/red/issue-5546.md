
#5546: red bad deal with Linux Fedora : libgtk update red with all commons libs 
================================================================================
Issue is closed, was reported by catafest and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/5546>

One good idea is to have red according to the common libs on the official website and this can be done easy for most common distro like Fedora , Debian , ...
I tried to test it in Fedora rawhide, I saw your red software needs this libgdk_pixbuf-2.0.so.0:
```
[mythcat@fedora ~]$ cd red-lang/
[mythcat@fedora red-lang]$ ls
hello-gui        libRedRT-extras.r     red-03oct24-920dd0452
hello-gui.red    libRedRT-include.red  red-toolchain-03oct24-920dd0452
libRedRT-defs.r  libRedRT.so           red-view-03oct24-920dd0452
[mythcat@fedora red-lang]$ ./hello-gui 
./hello-gui: error while loading shared libraries: libgdk_pixbuf-2.0.so.0: cannot open shared object file: No such file or directory
```
The Fedora 42 comes with it, but I know the **Linux distros have different development packages** libgtk
```
[root@fedora mythcat]# dnf5 search  libgtk
Updating and loading repositories:
Repositories loaded.
Matched fields: summary
 rust-gtk-sys+default-devel.noarch: FFI bindings to libgtk-3
 rust-gtk-sys+v3_24-devel.noarch: FFI bindings to libgtk-3
 rust-gtk-sys+v3_24_1-devel.noarch: FFI bindings to libgtk-3
 rust-gtk-sys+v3_24_11-devel.noarch: FFI bindings to libgtk-3
 rust-gtk-sys+v3_24_30-devel.noarch: FFI bindings to libgtk-3
 rust-gtk-sys+v3_24_8-devel.noarch: FFI bindings to libgtk-3
 rust-gtk-sys+v3_24_9-devel.noarch: FFI bindings to libgtk-3
 rust-gtk-sys-devel.noarch: FFI bindings to libgtk-3

```


Comments:
--------------------------------------------------------------------------------

On 2024-10-05T12:20:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/5546#issuecomment-2395039031>

    Have you followed the [instructions on the download page](https://www.red-lang.org/p/download.html) ?

--------------------------------------------------------------------------------

On 2024-10-22T12:25:03Z, dockimbel, commented:
<https://github.com/red/red/issues/5546#issuecomment-2429141501>

    I'll close this ticket as resolved, as instructions on the Download page are clearly covering that dependency and there's no more activity on this ticket.


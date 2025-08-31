
#167: Callbacks crash in GTK
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.built] [type.bug] [status.resolved]
<https://github.com/red/red/issues/167>

```
#include %GTK.reds

argc-reference: declare integer-reference!
argv-reference: declare handle-reference!
argc-reference/value: system/args-count
argv-reference/value: as-handle system/args-list

gtk-begin argc-reference argv-reference

button-pushed: function [
    [callback]
    widget              [gtk-widget!]
    data                [handle!]
][
    print "Button pushed^/"
]

window: gtk-new-window gtk-window-top-level
button: as gtk-widget! 0

either as-logic window [
    button: gtk-new-button-with-label "Push Me"

    either as-logic button [
        gtk-append-container  as gtk-container! window  button

        g-connect-signal  as-handle button  "clicked"  as-integer :button-pushed  none
    ][
        print "Couldn't create button."
    ]
    gtk-show-all window
    gtk-do-events
][
    print "Couldn't open new window."
]
```

When pushing the button:

Button pushed

**\* Runtime Error 1: access violation



Comments:
--------------------------------------------------------------------------------

On 2011-08-27T13:09:58Z, dockimbel, commented:
<https://github.com/red/red/issues/167#issuecomment-1919683>

    Thanks for the code sample.
    
    There are several undefined symbols in `GTK.reds`, like `unsigned32!` and `handle-reference!`.

--------------------------------------------------------------------------------

On 2011-08-27T13:26:09Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/167#issuecomment-1919716>

    They are from the C library binding, which is included by GTK.reds. You do need the latest version.

--------------------------------------------------------------------------------

On 2011-08-27T13:35:19Z, dockimbel, commented:
<https://github.com/red/red/issues/167#issuecomment-1919743>

    Works flawlessly under Ubuntu 10.04 LTS. I can push the button as many times as I want without any crash or error. Clicking on the closing icon `[x]` closes the window without quitting the application, so I need to CTRL-C it.
    
    I had to rename the imported lib name to `libgtk-x11-2.0.so.0` to make it work.
    
    Here is a `ldd` output on the generated executable if that can help you identify differences:
    
    ```
        linux-gate.so.1 =>  (0x00bd7000)
        libc.so.6 => /lib/tls/i686/cmov/libc.so.6 (0x003c3000)
        libgtk-x11-2.0.so.0 => /usr/lib/libgtk-x11-2.0.so.0 (0x0051d000)
        /lib/ld-linux.so.2 (0x009c8000)
        libgdk-x11-2.0.so.0 => /usr/lib/libgdk-x11-2.0.so.0 (0x00b3b000)
        libXext.so.6 => /usr/lib/libXext.so.6 (0x00994000)
        libXrender.so.1 => /usr/lib/libXrender.so.1 (0x00110000)
        libXinerama.so.1 => /usr/lib/libXinerama.so.1 (0x00f9d000)
        libXi.so.6 => /usr/lib/libXi.so.6 (0x00a9c000)
        libXrandr.so.2 => /usr/lib/libXrandr.so.2 (0x00330000)
        libXcursor.so.1 => /usr/lib/libXcursor.so.1 (0x00a38000)
        libgdk_pixbuf-2.0.so.0 => /usr/lib/libgdk_pixbuf-2.0.so.0 (0x00cee000)
        libpangocairo-1.0.so.0 => /usr/lib/libpangocairo-1.0.so.0 (0x001ca000)
        libX11.so.6 => /usr/lib/libX11.so.6 (0x001d6000)
        libXcomposite.so.1 => /usr/lib/libXcomposite.so.1 (0x0011a000)
        libXdamage.so.1 => /usr/lib/libXdamage.so.1 (0x009b3000)
        libXfixes.so.3 => /usr/lib/libXfixes.so.3 (0x0011e000)
        libatk-1.0.so.0 => /usr/lib/libatk-1.0.so.0 (0x00124000)
        libcairo.so.2 => /usr/lib/libcairo.so.2 (0x00eb3000)
        libgio-2.0.so.0 => /usr/lib/libgio-2.0.so.0 (0x008f2000)
        libpangoft2-1.0.so.0 => /usr/lib/libpangoft2-1.0.so.0 (0x00172000)
        libpango-1.0.so.0 => /usr/lib/libpango-1.0.so.0 (0x00338000)
        libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0x00aaa000)
        libz.so.1 => /lib/libz.so.1 (0x00be7000)
        libfontconfig.so.1 => /usr/lib/libfontconfig.so.1 (0x00140000)
        libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0x0037b000)
        libgmodule-2.0.so.0 => /usr/lib/libgmodule-2.0.so.0 (0x00199000)
        libgthread-2.0.so.0 => /usr/lib/libgthread-2.0.so.0 (0x0019e000)
        librt.so.1 => /lib/tls/i686/cmov/librt.so.1 (0x00e82000)
        libglib-2.0.so.0 => /lib/libglib-2.0.so.0 (0x00bfc000)
        libm.so.6 => /lib/tls/i686/cmov/libm.so.6 (0x00df3000)
        libpthread.so.0 => /lib/tls/i686/cmov/libpthread.so.0 (0x001a4000)
        libxcb.so.1 => /usr/lib/libxcb.so.1 (0x002f3000)
        libdl.so.2 => /lib/tls/i686/cmov/libdl.so.2 (0x001bd000)
        libpixman-1.so.0 => /usr/lib/libpixman-1.so.0 (0x00a42000)
        libdirectfb-1.2.so.0 => /usr/lib/libdirectfb-1.2.so.0 (0x00d08000)
        libfusion-1.2.so.0 => /usr/lib/libfusion-1.2.so.0 (0x0030d000)
        libdirect-1.2.so.0 => /usr/lib/libdirect-1.2.so.0 (0x00317000)
        libpng12.so.0 => /lib/libpng12.so.0 (0x009e5000)
        libxcb-render-util.so.0 => /usr/lib/libxcb-render-util.so.0 (0x001c1000)
        libxcb-render.so.0 => /usr/lib/libxcb-render.so.0 (0x00e24000)
        libpcre.so.3 => /lib/libpcre.so.3 (0x00d7f000)
        libresolv.so.2 => /lib/tls/i686/cmov/libresolv.so.2 (0x00a0a000)
        libselinux.so.1 => /lib/libselinux.so.1 (0x00b20000)
        libexpat.so.1 => /lib/libexpat.so.1 (0x00cc6000)
        libXau.so.6 => /usr/lib/libXau.so.6 (0x001c6000)
        libXdmcp.so.6 => /usr/lib/libXdmcp.so.6 (0x003ba000)
    ```

--------------------------------------------------------------------------------

On 2011-08-27T14:11:42Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/167#issuecomment-1919837>

    Thanks for testing. I'll also test on another Linux to see if I can confirm.
    
    The abbreviated version symlink is available on my system, but apparently I should use the full version for compatibility.
    
    The close button is indeed not hooked up to the proper close event, because I made the example as short as possible.

--------------------------------------------------------------------------------

On 2011-08-27T22:42:44Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/167#issuecomment-1921825>

    It indeed works on Linux Mint (Ubuntu based). It seems to be a problem with my Linux, which has an older GTK version. That's possible, but odd, because I use many GTK programs, and I don't know how to get callbacks to work otherwise.
    
    I've changed the library reference. The name I used is not available on systems that separate out development files and don't install them as standard.

--------------------------------------------------------------------------------

On 2011-09-21T10:05:55Z, dockimbel, commented:
<https://github.com/red/red/issues/167#issuecomment-2154369>

    Related to ticket #176 and solve by the same fix.


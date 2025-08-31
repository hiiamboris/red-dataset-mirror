
#5169: View crashes on Raspberry PI Buster
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5169>

**Description**
Running the view scripts in the tests sub-directory of the repo on Raspberry PI Buster results in an access violation.

Here is one example:
```
(red-view:6589): GLib-GObject-CRITICAL **: 07:32:30.972: g_value_set_boolean: assertion 'G_VALUE_HOLDS_BOOLEAN (value)' failed

*** Runtime Error 1: access violation
*** at: 00000000h
```

**To reproduce**
Enter the following code into the Red GUI console:
```
view [
	base 255.0.0.138 50x50 draw [fill-pen blue circle 25x25 15]
]
```

**Expected behavior**
Red does not crash.

**Screenrecording**

https://user-images.githubusercontent.com/697434/182050679-bf717925-a8d8-41dc-9c77-25853b22fed4.mp4

**Platform version**
Hardware: Raspberry PI 4B 1.1
OS: Raspberry Pi OS Buster 32-bit (Debian 11)
Red 0.6.4 for Linux built 29-Jul-2022/15:33:53



Comments:
--------------------------------------------------------------------------------

On 2022-09-01T04:21:31Z, qtxie, commented:
<https://github.com/red/red/issues/5169#issuecomment-1233722097>

    Tested on Armbian_22.08.0_Aml_s905l3a_bullseye_5.15.62, it works fine, no crashes.

--------------------------------------------------------------------------------

On 2024-06-25T19:58:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5169#issuecomment-2189861544>

    The cause of the crash was an overflow on a local variable offset in the ARM backend code emitter.


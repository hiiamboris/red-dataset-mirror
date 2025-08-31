
#5353: Arbitrary results from `caret-to-offset` of zero
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5353>

**Describe the bug**

Windows:
```
>> r: rtd-layout ["xy"] reduce [caret-to-offset r 1 caret-to-offset/lower r 1]
== [0x0 6x16]
>> r: rtd-layout ["xy"] reduce [caret-to-offset r 2 caret-to-offset/lower r 2]
== [6x0 11x16]
>> r: rtd-layout ["xy"] reduce [caret-to-offset r 3 caret-to-offset/lower r 3]
== [11x0 11x16]
>> r: rtd-layout ["xy"] reduce [caret-to-offset r 0 caret-to-offset/lower r 0]
== [11x0 11x16]
```
I find the last result meaningless. One can get it explicitly from using `1 + length? face/text`.

However the real issue is on GTK:
```
>> r: rtd-layout ["xy"] reduce [caret-to-offset r 1 caret-to-offset/lower r 1]
== [0x0 9x19]
>> r: rtd-layout ["xy"] reduce [caret-to-offset r 2 caret-to-offset/lower r 2]
== [9x0 18x19]
>> r: rtd-layout ["xy"] reduce [caret-to-offset r 3 caret-to-offset/lower r 3]
== [18x0 18x19]
>> r: rtd-layout ["xy"] reduce [caret-to-offset r 0 caret-to-offset/lower r 0]

(red:630): Pango-CRITICAL **: 14:06:11.287: pango_layout_index_to_pos: assertion 'index >= 0' failed

(red:630): Pango-CRITICAL **: 14:06:11.287: pango_layout_index_to_pos: assertion 'index >= 0' failed
== [-187604x161574 291262x159587]
```
Returns just junk. Then crashes:
```
>> r: rtd-layout [""] r/size: absolute caret-to-offset/lower r 0

(red:648): Pango-CRITICAL **: 14:17:37.909: pango_layout_index_to_pos: assertion 'index >= 0' failed
== 188556x25600
>> view compose [rich-text "" (r/size)]

(red:648): Gdk-WARNING **: 14:18:02.083: Native Windows wider than 65535 pixels are not supported

(red:648): Gdk-CRITICAL **: 14:18:02.093: ../../../../../gdk/wayland/gdkdisplay-wayland.c:1319: Truncating shared memory file failed: Invalid argument

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

Where zero is useful is in determining extent of a single line (this ties to https://github.com/red/red/issues/4841):
```
size: caret-to-offset/lower face length? face/text
```
When text is empty, length yields zero, and it would be nice if this didn't require a workaround, and just returned `0xH`, where H is line height with chosen font.

**To reproduce**

`r: rtd-layout ["xy"] reduce [caret-to-offset r 0 caret-to-offset/lower r 0]`
`r: rtd-layout [""] reduce [caret-to-offset r 0 caret-to-offset/lower r 0]`
`r: rtd-layout [""] r/size: absolute caret-to-offset/lower r 0  view compose [rich-text "" (r/size)]`

**Expected behavior**

I propose `0xH` result.

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------

-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-01-08T16:00:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5353#issuecomment-1881357517>

    Closely related small GTK issue: on empty text `caret-to-offset` and `size-text` measure different height:
    ```
    >> r: rtd-layout [""]
    >> size-text r
    == (0, 19)
    >> caret-to-offset/lower r 1
    == (0, 18.625)
    ```


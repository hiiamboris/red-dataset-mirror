
#5618: [View] Apparent difference in field cursor positioning when handling different events
================================================================================
Issue is open, was reported by PeterWAWood and has 4 comment(s).
[GUI.GTK]
<https://github.com/red/red/issues/5618>

**Describe the bug**
I came across what appears to be different behaviour depending on whether an action was initiated by the `on-change` or `on-keyup` event.

When the user input a character that was not accepted by Red as being valid in a number, I automatically removed the offending character with:
```
head remove back tail face/text
```
In an `on-change` handler the cursor is positioned at the end of the input. In an `on-keyup` handler the cursor is positioned at the beginning of the input.

**To reproduce**
The attached script, onchange-v-onkeyup.red, can be used to observe the behaviour.

**Expected behavior**
It would be good for the cursor positioning to be consistent.

**Platform version**
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 67 date: 30-May-2025/6:49:11 commit: #979d8e1bf808fd0c43ebe58806404f1be010f9c1 ]
PLATFORM: [ name: "Raspbian GNU/Linux 12 (bookworm)" OS: 'Linux arch: 'aarch64 version: 6.12.25 build: {#1 SMP PREEMPT Debian 1:6.12.25-1+rpt1 (2025-04-30)} ]
--------------------------------------------

Note: The OS is a 32-bit version.

[onchange-v-onkeyup.red.txt](https://github.com/user-attachments/files/20742959/onchange-v-onkeyup.red.txt)


Comments:
--------------------------------------------------------------------------------

On 2025-06-16T18:54:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5618#issuecomment-2977725719>

    It's not just GTK, same behavior on Windows.

--------------------------------------------------------------------------------

On 2025-06-18T01:40:06Z, qtxie, commented:
<https://github.com/red/red/issues/5618#issuecomment-2982327108>

    The cursor is positioned at the beginning of the input for both events on Windows on my system.


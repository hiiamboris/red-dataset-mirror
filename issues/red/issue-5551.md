
#5551: origin is incorrect since #5541 change
================================================================================
Issue is closed, was reported by mikeyaunish and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5551>

**Describe the bug**
The origin is not correct after issue #5541 

**To reproduce**
Steps to reproduce the behavior:
```
view layout [
	origin 0x0
	button "hi" 
]
```

**Expected behavior**
The layout should look like this:

![before](https://github.com/user-attachments/assets/01b9c4b3-0ff9-4e9f-a1a7-d2adeeb19ab9)

But instead looks like this:
![after](https://github.com/user-attachments/assets/b52f28ea-d57c-47e5-abef-84bc1a95c74c)

**Platform version**
RED & PLATFORM VERSION
RED: [ branch: "master" tag: #v0.6.5 ahead: 197 date: 14-Oct-2024/6:33:36 commit: #c53dd3cc1f12c802e79b0380636d33009b395b34 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]





Comments:
--------------------------------------------------------------------------------

On 2024-10-18T16:02:20Z, mikeyaunish, commented:
<https://github.com/red/red/issues/5551#issuecomment-2422794645>

     Same problem with macOS Red 0.6.5 for macOS built 14-Oct-2024/8:33:36+02:00 commit #c53dd3c

--------------------------------------------------------------------------------

On 2024-10-20T11:38:44Z, dockimbel, commented:
<https://github.com/red/red/issues/5551#issuecomment-2424868310>

    Thanks for the reminder, saw that before, but forgot to fix that regression.


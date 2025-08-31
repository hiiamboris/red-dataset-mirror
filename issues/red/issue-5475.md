
#5475: There is a conflict between ALL-OVER and DOWN and AWAY flags.
================================================================================
Issue is closed, was reported by luce80 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5475>

**Describe the bug**
Setting `all-over` flag seems to lock `down` state or there is a too late or no reaction for an `away` over a scroller with "custom" `on-over`:

**To reproduce**
```
print "" ; open console
view [
	below
	base gray 200x100 with [flags: [scrollable]]
	ON-DOWN [set-flag face 'all-over]
	ON-UP [set-flag/clear face 'all-over]
	on-over [?? event/away? ?? event/flags  print ""]
	button "test" ; <- not really needed
]
```
see the picture , the down flag is not automatically cleared..

**Expected behavior**
`down` flag shoud be cleared when exiting a face but overing its scroller..

**Screenshots**
![Red away down on scroller](https://github.com/red/red/assets/17967405/37fc5978-76b7-442e-9ff3-0d18a051133b)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5092 date: 24-Jan-2024/4:14:00 commit: #10dc97b01cda5bb347f2ca5741da7a82f02b37a4 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```




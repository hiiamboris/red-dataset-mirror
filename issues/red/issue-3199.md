
#3199: The on-unfocus event is not properly triggered on macOs
================================================================================
Issue is open, was reported by StephaneVeneri and has 6 comment(s).
[GUI]
<https://github.com/red/red/issues/3199>

### Expected behavior
When you press the Tab key on each component: 
```
>> do %issue01.red
tf1 lost focus
tf2 lost focus
cb1 lost focus
cb2 lost focus
```
Works fine on Windows 10.

### Actual behavior
Result when performing the same operation on macOS:
```
>> do %issue01.red
tf1 lost focus
tf2 lost focus
tf2 lost focus
tf1 lost focus
```
The messages "tf1 lost focus" and "tf2 lost focus" are displayed when tf1 loses the focus. The message "tf1 lost focus" is displayed when tf1 recovers the focus. on-unfocus not detect on drop-list.  

### Steps to reproduce the problem
Launch this script and press the tab key until the focus returns to the first field.

```
Red [
	File: %issue01.red
]
transfert-focus: func [
	"Tranfert focus on back or next component"
	evt			[event!]
	prev-face	[object!]
	next-face	[object!]
][
	; Action when key tab is pressed
	if evt/key = tab [
		; Transfert the focus
		either evt/shift? [set-focus prev-face][set-focus next-face]
	]
]

view [
    tf1: field focus
        on-key      [transfert-focus event cb2 tf2]
        on-unfocus  [print "tf1 lost focus"]
    tf2: field
        on-key      [transfert-focus event tf1 cb1]
        on-unfocus  [print "tf2 lost focus"]
    cb1: drop-list data ["One" "Two"] select 1
        on-key      [transfert-focus event tf2 cb2]
        on-unfocus  [print "cb1 lost focus"]
    cb2: drop-list data ["One" "Two"] select 1
        on-key      [transfert-focus event cb1 tf1]
        on-unfocus  [print "cb2 lost focus"]
]
```

### Red version and build date, operating system with version.
Red version: 0.6.3
Build: red-14jan18-dc263ca
OS: macOS 10.12.6


Comments:
--------------------------------------------------------------------------------

On 2018-01-14T19:31:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3199#issuecomment-357535464>

    Works fine on Win7 as well. Good catch.

--------------------------------------------------------------------------------

On 2018-01-14T19:32:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3199#issuecomment-357535547>

    Do you happen to know if the lost-focus behavior is normally available for those controls on OSX?

--------------------------------------------------------------------------------

On 2018-01-14T23:38:55Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/3199#issuecomment-357552739>

    You may be right, I tested on native cocoa applications and the tab appears to be reserved for input fields so no tab for checkbox, radio button, combobox no editable... I've never paid attention to that behavior before.
    However, there is still the gap between the detection of the lost focus and the tabulation (even if it is forced by the transfert-focus function).



#2580: Popup menus do not work on window
================================================================================
Issue is closed, was reported by Scaremonger and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2580>

There seems to be a problem with popup menus from a window. The documentation specifies that the keyword popup is added at the beginning of the menu definition, but although this compiles it does not work.

Example Code:
````
Red[ needs 'view]
win: layout [ button "OK" [print ["OK Pressed" ]] ]
menu: [ popup "Help!" ["This" [Print "This"] "That" [Print "That"]]]
win/menu: menu
view win
````

Red: 0.6.2
Test Platform: Windows 10



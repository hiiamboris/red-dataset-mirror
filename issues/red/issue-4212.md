
#4212: GTK: text face not rendering properly
================================================================================
Issue is closed, was reported by loziniak and has 0 comment(s).
[status.built] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/4212>

With this code:
```
view [origin 100x100 text red "test" on-create [face/size: 200x50]]
```
Under Linux/GTK the text face is moved instead resized, unlike in Windows 7. Also, by default, under Linux/GTK, face size is trimmed to a text it contains. So, specifying `left` or `right` alignment has no effect:
```
view [origin 100x100 text red "test" right]
```



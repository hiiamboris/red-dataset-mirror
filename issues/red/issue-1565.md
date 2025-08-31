
#1565: field text becomes title of future untitled windows
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1565>

```
view [
    field "I won't cause any trouble."
    text "Hello, World!"
    field "This wasn't meant to be a title, but it will be!"
    text "Χαῖρε, κόσμε!"
]

view [text "The text of the last field of the previous window will become the title of this window..."]

view [field "...and other untitled windows..."]

view [field "...until another field is encountered..."]

view [title "Enough!" text "...or the title is set..."]

view [text "...and on and on it goes!"]
```

The above behaves as expected from the old console (compiled with `needs: 'View` in the header), but from the gui-console, it behaves as decribed in the code.




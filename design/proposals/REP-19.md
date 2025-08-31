
#19: WISH: add an option to restrict FIELD size
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
[Wish]
<https://github.com/red/REP/issues/19>

Original issue: https://github.com/red/red/issues/3035

Currently user can input an arbitrary number of characters in View's field and there's no workable and elegant way to restrict it's length and prevent out-of-borders overflow.

One workaround that @dockimbel suggested is:
```red
system/view/capturing?: yes
view [f: field "" on-detect [if 4 <= length? f/text [return 'stop]]]
```
Though after that input is blocked and you can't even use backspace.

I guess that should be applicable to every field-like face.

Working example (restrict field's size up to 4 characters and allow backspace for deletion):
```red
system/view/capturing?: yes
view [
    f: field "" on-detect [
        all [
            4 <= length? f/text
            #"^(back)" <> event/key
            return 'stop
        ]
    ]
]
```



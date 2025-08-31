
#3035: WISH: add an option to restrict field's text size
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[type.wish]
<https://github.com/red/red/issues/3035>

Title. Currently user can input an arbitrary number of characters in a field and there's no workable and elegant way to restrict it's length.

One that @dockimbel suggested is
```Red
system/view/capturing?: yes
view [f: field "" on-detect [if 4 <= length? f/text [return 'stop]]]
```
Though after that input is blocked and you can't even use backspace.

I guess that should be applicable to every field-like face.


Comments:
--------------------------------------------------------------------------------

On 2017-09-15T16:35:18Z, 9214, commented:
<https://github.com/red/red/issues/3035#issuecomment-329833831>

    working example (restrict field's size up to 4 characters and allow backspace for deletion):
    ```Red
    system/view/capturing?: yes
    view [
        f: field "" on-detect [
            all [
                4 <= length? f/text
                attempt [8 <> to integer! event/key]
                return 'stop
            ]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-09-15T17:14:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3035#issuecomment-329843286>

    You also have to consider that there may be some chars selected, which will be replaced.

--------------------------------------------------------------------------------

On 2018-04-25T06:33:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3035#issuecomment-384175561>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.


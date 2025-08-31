
#1586: Can’t catch Ctrl+Shift+<key>
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1586>

Ctrl+[key] and Shift+[key] work, but Ctrl+Shift+[key] does not. You can try it with the following code, it shows `none` instead of [key]:

```
Red [Needs: 'View]

w: layout [text "press Ctrl+Shift+<key>"]

w/actors: object [
    on-key: func [
        face [object!] 
        event [event!]
    ] [
        print ["on key:" mold event/key]
        'stop
    ]
]

view w
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-22T08:26:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1586#issuecomment-187066315>

    It works since the merge of `key-down` branch.


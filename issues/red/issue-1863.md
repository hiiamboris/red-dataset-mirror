
#1863: Error when assigning value to an element of a block using index
================================================================================
Issue is closed, was reported by Zamlox and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/1863>

Below code is part of a bigger project, I tried to isolate the culprit code as much as possible.
When executing it I receive following error:

```
*** Script error: cannot access 2 in path none
*** Where: or
```

It shouldn't error. If 'pos/1: value' is replaced with 'break' (inside 'utils/replace' function - first branch of 'either deep') it works.
The way to fix it is to rename 'state' data member of 'widget!' to something else (like 'state-1'). I don't understand why since there is no execution of 'view' on that object to interfere with the type value given to 'state' member.

Code:

```
Red []


utils: object [
    forskip: func [
        series  [series!]
        count   [integer!]
        code    [block!]
    ][
        bind code :forskip
        while [not tail? series][
            do code
            series: skip series count
        ]
        series: head series
    ]
    find-deep: func [
        series [series!]
        value
        /local item pos
    ][
        pos: none
        forskip series 1 [
            item: first series
            either series? item [
                pos: find-deep item value
                if pos [ break ]
            ][ if item = value [ pos: series break ] ]
        ]
        pos
    ]
    find: func [
        series [series!]
        value
        /deep
    ][
        either deep [ find-deep series value ][ system/words/find series value ]
    ]

    replace: func [
        series  [ series! ]
        pattern
        value
        /all
        /deep
        /local many? len pos search into
    ][
        probe series
        if system/words/all [deep series? value pos: find/deep value pattern][
            print "cause-error"
            cause-error 'script  'cannot-use [ first pos value ]
        ]
        many?: (series? :pattern) and ((any-string? series) or (binary? series) or ((any-list? series) and any-list? :pattern)) 
        len: either many? [length? pattern][1] 
        either all [
            pos: series 
            either deep [       
                either many?        ; using code duplication for better performance
                    [ while [pos: find/deep series pattern ] [ remove/part pos len pos: insert pos value ] ] 
                    [ while [pos: find/deep series :pattern] [ pos/1: value ]  ] 
            ][
                either many?        ; using code duplication for better performance
                    [ while [pos: find pos pattern ] [ remove/part pos len pos: insert pos value ] ] 
                    [ while [pos: find pos :pattern ] [ pos/1: value ] ]
            ]
        ][
            either deep [search: :find-deep][search: :find]
            if pos: search series :pattern [remove/part pos len insert pos value]
        ] 
        series
    ]
]


widget!: make face! [
    behavior:   []
    state:      object []


    parse-behavior: function [ 
        face [object!]
    ][
        user-word: [
            set item word! (
            )
        ]
        rule: [ any [
            'do set user-code block! (
                utils/replace/all/deep user-code 'this-event 'event
            ) | 
            user-word |
            into [ rule ]
        ]]
        parse behavior rule
    ]
]


gizmo: make widget! [
    behavior:   [ do [ aaa this-event ] ]
]

gizmo/parse-behavior gizmo
probe gizmo/behavior
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-05T16:26:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1863#issuecomment-217201374>

    Your code is creating the error by overloading the `state` entry of the face! object, making the face! events handler to fail and error out at [this line](https://github.com/red/red/blob/master/modules/view/view.red#L98).
    
    _I don't understand why since there is no execution of 'view' on that object to interfere with the type value given to 'state' member._
    
    The object events are fired independently of the View engine, they are an intrinsic feature of objects. Object events should be documented soon along with the ownership system.


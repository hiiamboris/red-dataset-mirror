
#4396: [CRASH] [View] when converting a face with altered `template` to an image
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/4396>

**Describe the bug**

`to image!` can usually be safely used on a `window` and `base` faces.
But if you add some stuff to those faces' templates, Red crashes saying:
```
*** Internal Error: block or paren series is too deep to display
*** Where: print
*** Stack: 
```

**To reproduce**

1. modified `window`:
```
append system/view/VID/styles/window/template [custom-option: 'custom-value]
i: to image! view/no-wait []
```

2. modified `base`:
```
Red [needs: view]
append system/view/VID/styles/base/template [custom-option: 'custom-value]
view/no-wait [b: base "text"]
i: to image! b
```

**Expected behavior**

Acquire snapshot of the face.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-13T08:38:03Z, qtxie, commented:
<https://github.com/red/red/issues/4396#issuecomment-612808978>

    [This line](https://github.com/red/red/blob/master/runtime/datatypes/image.reds#L466) causes the error. 
    One solution is checking if the object has all the fields the face! object has. Though it's not guarantee it's a face!, better than no checking.
    
    Something like:
    ```
    face?: function [
        "Returns TRUE if the value is a face! object"
        value      "Value to test"
        /mutant    "Accept expanded face"
        /alive     "Return TRUE only if the face has a low-level handle"
        return:	[logic!]
    ][
        face?: no
        if object? :value [
            face?: either mutant [
                find/match words-of value words-of face!
            ][
                (class-of value) = class-of face!
            ]
            if all [face? alive][
                state: get in value 'state
                face?: all [block? state handle? first state]
            ]
        ]
        to logic! face?
    ]
    ```
    Then we use `face?/mutant/alive` to do the checking in `to-image`.

--------------------------------------------------------------------------------

On 2020-04-13T11:22:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4396#issuecomment-612860504>

    You'll have to exclude `on-change*` and `on-deep-change*` from `words-of` lists (I'm using the same logic to check if I *loaded* a molded `face!` and these two have caused problems).
    
    `state` checking is a great idea too, as otherwise it crashes (there must be another issue about it)

--------------------------------------------------------------------------------

On 2020-04-14T01:12:37Z, qtxie, commented:
<https://github.com/red/red/issues/4396#issuecomment-613172538>

    > You'll have to exclude `on-change*` and `on-deep-change*` from `words-of` lists (I'm using the same logic to check if I _loaded_ a molded `face!` and these two have caused problems).
    
    @hiiamboris What's the reason you don't use `mold/all` to preserve those two functions?

--------------------------------------------------------------------------------

On 2020-04-14T08:59:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4396#issuecomment-613316403>

    At first I didn't because `mold/all` serialized me handle as `#[handle! hex]` and then I couldn't load it. But then I realized I *need* the handle, so I patched my build and started using `mold/all`. So you're right, I can probably remove that `on-*` part now.

--------------------------------------------------------------------------------

On 2021-03-26T12:18:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4396#issuecomment-808172227>

    REP proposes a proper solution.

--------------------------------------------------------------------------------

On 2022-10-06T08:43:13Z, qtxie, commented:
<https://github.com/red/red/issues/4396#issuecomment-1269600441>

    Fixed by commit https://github.com/red/red/commit/7e39cd7b25970fa6405d7a26eb54dd6c17efc252.


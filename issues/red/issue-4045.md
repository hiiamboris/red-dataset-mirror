
#4045: selected item in text-list hard to read (macOS)
================================================================================
Issue is open, was reported by ralfwenske and has 10 comment(s).
[type.review] [GUI] [GUI.macOS]
<https://github.com/red/red/issues/4045>

**Describe the bug**
When a font-name is specified for `text-list` the selected item's text color is not inverted and thus hardly readable given the dark blue background

**To reproduce**
```
Red []
win: layout [  title "A modal view" size  400x200
    h5 "Hardly readable selection when specific font" return
    tl1: text-list 180x100 font-name "Courier" data ["one" "two" "three"] 
    tl2: text-list 180x100 data ["one" "two" "three"] 
    return
    button "Close" [unview/only win]
]    
view win
```

**Expected behavior**
a good contrast between the font color and the background color of the selected item - as is the case when no `font-name` is given

**Platform version**
```
Red 0.6.4 for macOS built 21-Sep-2019/2:03:51+10:00 commit #04daa5e
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-01T08:16:04Z, ralfwenske, commented:
<https://github.com/red/red/issues/4045#issuecomment-536923533>

    Just tested this on a different machine (Macbook Sierra 10.12.6) and could not verify above issue - both text-lists are readable.
    Above issue occurs on Macmini (Mojave 10.14.6). I suspect it could be something specific to this machine so: **I might close this issue** as I also experience (only when running Red) some other strange things on that machine .
    
    The 'strange thing' is when running my program even though it runs fine - the console shows ( only on Macmini):
    ```
    /BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.200.3/Common/ChunkCompression.cpp:49: Error: unsupported compressor 8
    /BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.200.3/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Exceptions.plist'
    ```

--------------------------------------------------------------------------------

On 2019-10-01T08:53:21Z, avitkauskas, commented:
<https://github.com/red/red/issues/4045#issuecomment-536938098>

    No, I can confirm this issue on Macbook Pro with Mac OS Mojave Version 10.14.6

--------------------------------------------------------------------------------

On 2020-01-18T20:33:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4045#issuecomment-575935995>

    Can anyone post a screenshot from Mac?

--------------------------------------------------------------------------------

On 2020-01-19T09:00:24Z, ralfwenske, commented:
<https://github.com/red/red/issues/4045#issuecomment-575982082>

    Red 0.6.4 for macOS built 14-Jan-2020/0:41:02+10:00 commit #938744f
    (on MacMini)
    
    ![image](https://user-images.githubusercontent.com/6076206/72677996-9d5d0280-3aed-11ea-9975-defd329df229.png)

--------------------------------------------------------------------------------

On 2020-01-19T09:12:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4045#issuecomment-575983163>

    Thank you ;)
    I was thinking if this issue is something I will be able to make automated tests for, once it's fixed. I don't suppose Mac allows to change it's color scheme, but strictly speaking, using blue and black combo is no bug and somebody might even intentionally do just that.
    Although I realize it shouldn't be the default as on some displays and in a bright light, these two may become unreadable; and that font-name alone is not supposed to change the colors. This latter property might be testable I guess.



#2355: text in area couldn't be wrapped
================================================================================
Issue is closed, was reported by ludx and has 36 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2355>

e.g. I use
```
view layout [
    a: area 200x200 "Here's some text, lots and lots of text. Here's some text, lots and lots of text."
        para[
    wrap?: on
        ]
    return
    button "wrap？" [print a/para/wrap?]
]
```
or
```
view layout [area 200x200 "Here's some text, lots and lots of text. Here's some text, lots and lots of text." wrap]
```
but did not work in Windows 10.

![default](https://cloud.githubusercontent.com/assets/1643434/20864184/d987b9ea-ba20-11e6-8983-33c53d9ff646.png)



Comments:
--------------------------------------------------------------------------------

On 2017-02-18T10:06:48Z, qtxie, commented:
<https://github.com/red/red/issues/2355#issuecomment-280835606>

    Now setting the para/wrap? in area works properly.
    ```
    view layout [
        a: area 200x200 "Here's some text, lots and lots of text. Here's some text, lots and lots of text."
            para[
        wrap?: yes
            ]
        return
        button "wrap？" [a/para/wrap?: not a/para/wrap?]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-07-10T16:49:39Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-314166033>

    @qtxie in current version, your example turns off wrapping, but it is not possible to turn it on again.

--------------------------------------------------------------------------------

On 2017-07-10T16:51:50Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-314166660>

    Also when there is wrapping turned on, vertical bar is not visible with long wrapped text as used `DrawText` function is not counting with wrapping.

--------------------------------------------------------------------------------

On 2017-07-11T01:39:26Z, qtxie, commented:
<https://github.com/red/red/issues/2355#issuecomment-314297929>

    @Oldes Yes, you're right. Did you fix it?

--------------------------------------------------------------------------------

On 2017-07-11T07:19:03Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-314357117>

    @qtxie just the second one... I don't know how to fix the switching.. the only thing I know is, that `update-para` is called just for the init and the first change.

--------------------------------------------------------------------------------

On 2017-07-11T08:03:54Z, qtxie, commented:
<https://github.com/red/red/issues/2355#issuecomment-314366604>

    @Oldes IIRC, the only way is to destroy the old area, then create a new one with the new setting.

--------------------------------------------------------------------------------

On 2017-07-11T08:20:27Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-314370279>

    @qtxie that does not sound as a good way... any reason for that?

--------------------------------------------------------------------------------

On 2017-07-11T09:11:12Z, qtxie, commented:
<https://github.com/red/red/issues/2355#issuecomment-314383042>

    @Oldes It's the limitation of the control. :sweat: 

--------------------------------------------------------------------------------

On 2017-07-11T10:46:14Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-314406538>

    Still don't understand why it works on the first call and not later. It will be source of many confusions.

--------------------------------------------------------------------------------

On 2017-07-11T11:11:16Z, qtxie, commented:
<https://github.com/red/red/issues/2355#issuecomment-314411602>

    It's a regression. I checkout this commit e279b28, it works fine.
    
    

--------------------------------------------------------------------------------

On 2017-07-11T11:52:09Z, qtxie, commented:
<https://github.com/red/red/issues/2355#issuecomment-314419936>

    @Oldes I fixed the first problem. Could you please make a PR for the second one?

--------------------------------------------------------------------------------

On 2017-07-11T12:26:31Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-314427349>

    @qtxie It is already available: https://github.com/red/red/pull/2874 with other improvements. So it is up to you to review it and possibly approve it. Main reason for it was, that area with many lines was terribly slow.

--------------------------------------------------------------------------------

On 2017-07-11T12:32:49Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-314428869>

    Hm... just testing it with your modification and it now does not work as before.:/

--------------------------------------------------------------------------------

On 2017-07-12T13:13:58Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-314765066>

    @qtxie so it was issue on my side - I had wrong initial state for wrapping. It is fixed now in the pull request. While testing it, I found two things:
    
    1. while writing into the area, the scroll bars does not appear with the first char out of area rectangle... but needs a few more chars.. it looks like we should subtract scroll bar width/height from the rectangle.. what do you thing?
    
    2. when used `right` text alignment, the horizontal bar is not updated and text is always wrapped. Is it normal?

--------------------------------------------------------------------------------

On 2017-07-15T10:30:41Z, qtxie, commented:
<https://github.com/red/red/issues/2355#issuecomment-315525397>

    @Oldes 
    1. Yes. It's better to substract scroll bar width/height.
    2. I think the horizontal bar should be updated. Not sure if it's the text control's issue or ours.

--------------------------------------------------------------------------------

On 2017-07-15T10:32:04Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-315525445>

    Any idea how to do it? :)

--------------------------------------------------------------------------------

On 2017-07-15T10:35:46Z, qtxie, commented:
<https://github.com/red/red/issues/2355#issuecomment-315525580>

    Have no idea about the second issue. For the first one, we can just substract 17 (scrollbar width) as we cannot (easily) change the scrollbar in area, so I think it's safe to hard coded it.

--------------------------------------------------------------------------------

On 2017-07-15T12:08:22Z, Oldes, commented:
<https://github.com/red/red/issues/2355#issuecomment-315530013>

    Isn't the scroll bar size dependent on dpi resolution?


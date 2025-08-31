
#4467: [View] FIELD is limited with WRAP on
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4467>

(Tested on W7 only)

**Describe the bug**

`view [field wrap ""]`
Try entering more chars that it's visible width allows:
![](https://i.gyazo.com/f3b36032299ceb5ae418b9a95b2f7785.gif)
It doesn't accept chars!

**Expected behavior**

Area-like behavior ideally? But at least no char limit - like normal field.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 21-May-2020/6:17:34+03:00 commit #398d733
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-24T20:56:36Z, greggirwin, commented:
<https://github.com/red/red/issues/4467#issuecomment-633298358>

    Same behavior on Win10.

--------------------------------------------------------------------------------

On 2020-05-24T20:58:51Z, greggirwin, commented:
<https://github.com/red/red/issues/4467#issuecomment-633298750>

    That may be an OS behavior. It makes sense if you can't wrap the text, which you can't with fields (or enter multiple lines). So either `wrap` is disallowed/ignored/error for fields, or we just doc it.

--------------------------------------------------------------------------------

On 2020-05-27T02:47:35Z, qtxie, commented:
<https://github.com/red/red/issues/4467#issuecomment-634394835>

    @greggirwin I agree. Ignore `wrap` for fields. We can doc it.
    * Field, Ignore wrap keyword
    * Text, Ignore wrap keyword. Wrap automatically if needed. If you put a long text in the `Text` face, means you want the user to see it, no reason to truncate the text.
    * Area, has wrap keyword.

--------------------------------------------------------------------------------

On 2020-05-27T02:53:30Z, qtxie, commented:
<https://github.com/red/red/issues/4467#issuecomment-634396461>

    > But at least no char limit.
    
    I like this limit as a user. If it accepts a string longer than the width, it will hide some part of it and I will miss it as it's no scrollbar. So I don't know some texts are hidden.

--------------------------------------------------------------------------------

On 2020-05-27T10:07:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4467#issuecomment-634561643>

    > Text, Ignore wrap keyword. Wrap automatically if needed. If you put a long text in the Text face, means you want the user to see it, no reason to truncate the text.
    
    No, don't do that ;) There are always cases when you *want* to truncate the text (not the one you define inside VID, but one you assign programmatically)
    
    > I like this limit as a user. If it accepts a string longer than the width, it will hide some part of it and I will miss it as it's no scrollbar. So I don't know some texts are hidden.
    
    This makes sense. But do you agree that it is unrelated to wrapping mode?

--------------------------------------------------------------------------------

On 2020-05-27T13:11:31Z, qtxie, commented:
<https://github.com/red/red/issues/4467#issuecomment-634649783>

    I'm OK to truncate the text by default. I don't know any reasonable UI has truncated label. That's why I think it's better to make it wrap in VID as most of the case you want your users to see all the text. Of course if you explicitly set the height of the text face to be just one line, you'll see only part of the text no matter it's wrapped or truncated (In this case VID won't change the height). 
    
    > But do you agree that it is unrelated to wrapping mode?
    
    Yes. I thought you were talking two issues: wrapping and char limit. It's unrelated to wrapping.

--------------------------------------------------------------------------------

On 2020-05-27T13:38:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4467#issuecomment-634667283>

    A few examples where you need to limit the label, unwrapped:
    
    `view [text 30 data 1.0 / 3]` (no need to show extra digits)
    ![](https://i.gyazo.com/a8c1521785e91ed9788290e32cad1c8b.png)
    
    some table:
    ![](https://i.gyazo.com/051ddb4d12d6952c77ac87259b32eb36.png)
    
    I suppose since I define the size of the `text` face, it will be truncated anyway.
    But what if my data is like `short longxlongxlongxlongxlongxlongxlongxlong`?
    I would rather see this:
    ![](https://i.gyazo.com/6b03158527f232b7ba35cb72ebf0cd74.png)
    than this:
    ![](https://i.gyazo.com/8bffb7aaa1156219569ef90afe22b628.png)
    Because 2nd is misleading. I have no way of knowing if there's another line, and will think that data is just `short`.

--------------------------------------------------------------------------------

On 2020-05-27T13:49:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4467#issuecomment-634674325>

    > > But do you agree that it is unrelated to wrapping mode?
    > 
    > Yes. I thought you were talking two issues: wrapping and char limit. It's unrelated to wrapping.
    
    I read MS docs, which say that `area` (multi line edit) eats Enter, while `field` (single line edit) activates (or supposed to) default button. So if we make all `field`s multi-line, we lose this distinction, which would be unfortunate.
    
    Also, I'm not sure what OS style View uses to limit `field` with wrap on, but I suggest we make put that into flags for clarity. E.g. `field with [flags: 'limited]` or something like that. And document that in this case it's coder's responsibility to make sure that `field` is big enough to fit the data user is supposed to enter there. And make `field` ignore the `wrap` flag altogether.

--------------------------------------------------------------------------------

On 2020-06-23T07:10:21Z, qtxie, commented:
<https://github.com/red/red/issues/4467#issuecomment-647954339>

    Now `field` ignores `wrap` flag. 


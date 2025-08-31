
#4356: Newlines ignored in BUTTON text
================================================================================
Issue is closed, was reported by dsunanda and has 20 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4356>

**Describe the bug**
Text in VID BUTTON cannot be multi-line - newline characters are ignored

**To reproduce**
    view [button 100x100 "hello^/goodbye"]

**Expected behavior**
Text to be on two lines in the example above

**Platform version (please complete the following information)**
Red 0.6.4 for Windows built 21-Feb-2020/3:08:03 commit #3c68ef1


Comments:
--------------------------------------------------------------------------------

On 2020-03-28T18:39:05Z, Crystal-RainSlide, commented:
<https://github.com/red/red/issues/4356#issuecomment-605501712>

    Reproduced on the old last release, 22-Nov-2018/8:40:38+08:00.
    
    The new line is ignored, but not emitted:
    
    ``` Red
    ; view [mybutton: button 100x100 "hello^/goodbye" [probe mybutton/text]]
    view [
    	mybutton: button 100x100 "hello^/goodbye" [
    		probe mybutton/text
    	]
    ]
    ```
    
    If  new line is not allowed, then the `#"^/"` may be removed.

--------------------------------------------------------------------------------

On 2020-03-28T18:54:46Z, meijeru, commented:
<https://github.com/red/red/issues/4356#issuecomment-605503735>

    @Crystal-RainSlide I am curious to know what you think your contribution to this issue is, if you "reproduce" it on a "last" release which is 1 1/2 years old.

--------------------------------------------------------------------------------

On 2020-03-28T19:03:41Z, Crystal-RainSlide, commented:
<https://github.com/red/red/issues/4356#issuecomment-605504803>

    Sometimes an issue didn't exist in previous versions.

--------------------------------------------------------------------------------

On 2020-03-28T19:23:04Z, 9214, commented:
<https://github.com/red/red/issues/4356#issuecomment-605507098>

    @Crystal-RainSlide but we are not dealing with a regression here.

--------------------------------------------------------------------------------

On 2020-03-29T11:40:42Z, meijeru, commented:
<https://github.com/red/red/issues/4356#issuecomment-605623029>

    @Crystal-RainSlide Contributions to an existing issue are most welcome if:
    (a) they report the _presence_ of the same issue in a version for another target architecture and/or operating system
    (b) they report the _absence_ of the issue in a previous version ("regression")

--------------------------------------------------------------------------------

On 2020-04-03T16:46:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4356#issuecomment-608545914>

    Another part of this issue is that button's size does actually include new-lines. Not only that but it also reserves extra **width** for each newline!! Nuts!
    `view [button 100 wrap "1^/2^/3^/4^/5^/6^/7^/8^/9^/0"]`
    ![](https://i.gyazo.com/37a36a1c497eca80159ac497626f5e2d.png)
    It thinks the text doesn't fit into 100px, but also should span 10 lines.

--------------------------------------------------------------------------------

On 2020-04-04T14:08:07Z, endo64, commented:
<https://github.com/red/red/issues/4356#issuecomment-609033948>

    @hiiamboris Your text doesn't also fit into the button? It is on Win10:
    ![image](https://user-images.githubusercontent.com/840604/78452875-c45fb500-7696-11ea-8fc3-8401980c54d5.png)

--------------------------------------------------------------------------------

On 2020-04-04T15:45:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4356#issuecomment-609047641>

    Yes. Thanks. So there's a platform discrepancy as well.

--------------------------------------------------------------------------------

On 2020-07-03T14:32:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4356#issuecomment-653575755>

    After the fix: `view [button wrap "1^/2^/3^/4^/5^/6^/7^/8^/9^/0^/"]`
    ![](https://i.gyazo.com/a11513ad0ad5919dddde0ec87af45bc9.png)
    Not that I'm going to make buttons with 10 lines of text, but for some reason text still doesn't fit the button.

--------------------------------------------------------------------------------

On 2020-07-06T08:09:40Z, endo64, commented:
<https://github.com/red/red/issues/4356#issuecomment-654084430>

    It works correctly on Win10:
    ![image](https://user-images.githubusercontent.com/840604/86570797-2cb18180-bf79-11ea-8075-49ad77e4d47f.png)


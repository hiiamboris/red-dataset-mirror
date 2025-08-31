
#3760: Height of text face isn't correctly calculated
================================================================================
Issue is open, was reported by endo64 and has 6 comment(s).
[status.built] [GUI]
<https://github.com/red/red/issues/3760>

**Describe the bug**

`text` face doesn't automatically expand vertically if there is newline and `font-color` is given.

**To reproduce**

```
>> view [text "one^/two^/three^/four" 200 red]
>> view [text "one^/two^/three^/four" 200 red white]
```

First one works, height of the textbox extends to cover all lines.
It looks in second one height of the text doesn't calculated at all and it looks 1 line.

Might be related to #3336 , #2503 , #2757 as changing any font attribute leads to same issue:

```
>> view [text wrap "one two three four" 50]
>> view [text "one^/two^/three" font-color red]
```

**Expected behavior**

Second one should work as the first one.

**Screenshots**

![image](https://user-images.githubusercontent.com/840604/51806847-08377d00-2290-11e9-961d-63c5e1f31f2e.png)

![image](https://user-images.githubusercontent.com/840604/51806857-14bbd580-2290-11e9-82f0-8f6632287eab.png)


**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2019/6:49:24+03:00 commit #702ec38
```

Also confirmed on [Win 7](https://gitter.im/red/bugs?at=5c4d7313f46373406a09c8f7)


Comments:
--------------------------------------------------------------------------------

On 2019-01-28T20:39:51Z, greggirwin, commented:
<https://github.com/red/red/issues/3760#issuecomment-458292575>

    Confirmed on Win10.

--------------------------------------------------------------------------------

On 2020-02-29T16:24:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/3760#issuecomment-592962317>

    ![](https://i.gyazo.com/7bf095bc8df3cf277c8036e0cb2f265c.png)
    For some reason the results produced with and without font color are still different (by 5px in height).
    Left to right: font-size 9, default font, font-size 8. So the default font size is like 8.5pt?
    
    If above is not enough reason to reopen this issue then this is:
    ![](https://i.gyazo.com/624b57e57fcb0d051d698d5ebe6d6540.png)
    ```
    view/no-wait [text "one^/two^/three^/four" 200 red white font-size 6]
    view/no-wait [text "one^/two^/three^/four" 200 red white font-size 11]
    view/no-wait [text "one^/two^/three^/four" 200 red white font-size 14]
    ```
    Why does it eat some part of the bottom line?
    
    `Red 0.6.4 for Windows built 29-Feb-2020/19:05:02+03:00 (scaling 125%)`

--------------------------------------------------------------------------------

On 2020-03-01T13:54:46Z, endo64, commented:
<https://github.com/red/red/issues/3760#issuecomment-593100009>

    Note that @hiiamboris tested on W7 I guess. It looks correct on Win10:
    
    ![image](https://user-images.githubusercontent.com/840604/75626992-529ad400-5bdd-11ea-90a9-229ee16699d6.png)


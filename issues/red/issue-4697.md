
#4697: Auto horizontal scroll not working with drop-down face
================================================================================
Issue is closed, was reported by JakubKoralewski and has 2 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4697>

Sorry if I get the terminology wrong, I'm still learning the lexicon.

**Describe the bug**
The `drop-down` view face does not automatically scroll horizontally when the text inside exceeds the length of the `drop-down` face. There are two distinct problems but they ultimately have the same cause:
1. When setting the `data` of the `drop-down` face programatically the text inside gets cut off and you can't scroll to see the full text.
2. When the text inside is long during compilation (without any runtime modification), the `drop-down` element gets scaled without any limits. (Now it looks like it gets cut off too)

**To reproduce**
```view [drop-down "long long long long long loooooong text"]```
![obraz](https://user-images.githubusercontent.com/43069023/97618373-39be1900-1a1f-11eb-88cf-ac6686f22e29.png)

**Expected behavior**
The text should scroll horizontally when it gets cut off.
![obraz](https://user-images.githubusercontent.com/43069023/97618259-18f5c380-1a1f-11eb-9c9c-a1436bbc6094.png)

**Screenshots**
Case 1:
![obraz](https://user-images.githubusercontent.com/43069023/97618204-0c716b00-1a1f-11eb-9b4f-0a35c3375a4c.png)


**Platform version**
```
Red 0.6.4 for Windows built 22-Nov-2018/1:40:38+01:00 commit #755eb94
```

Looks like windows specific code is [here](https://github.com/red/red/blob/de9d15b820710cd395df04d01b060aa79dcbf29b/modules/view/backends/windows/gui.reds#L1433-L1436). I thought the necessary flag is `ES_AUTOHSCROLL`, but @hiiamboris corrected me that it's more likely `CBS_AUTOHSCROLL`.



Comments:
--------------------------------------------------------------------------------

On 2020-10-29T19:06:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/4697#issuecomment-718960851>

    Related older problem https://github.com/red/red/issues/4467


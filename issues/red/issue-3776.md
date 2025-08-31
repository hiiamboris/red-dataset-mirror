
#3776: Buttons image property doesn't update on screen
================================================================================
Issue is closed, was reported by a-nick-fischer and has 0 comment(s).
[status.built] [type.wish] [GUI]
<https://github.com/red/red/issues/3776>

**Describe the bug**
Altering the `face/image` property of a button doesn't update the displayed UI, altrough the face object itself does get updated. First discovered on StackOverflow: https://stackoverflow.com/questions/50883367/red-language-changing-button-image-doesnt-work

**To reproduce**
Steps to reproduce the behavior:
1. Create two images (A black and a white one, in my case, named accordingly)
2. Open up a Red REPL and type the following:
```rebol
view [button %black.png [face/image: load/as %white.png 'png]]
```
3. Click the button, the image doesn't get updated.

Alternatively:
1. Create one image
2. Open up a Red REPL and type:
```rebol
view [button %black.png [probe face face/image: none]]
```
3. The first time you click the button, the `face/image` contains an image (as expected), the second time you click on it it contains `none` (as expected), but the image is still displayed.

**Expected behavior**
See above.

**Screenshots**
N / A

**Platform version (please complete the following information)**
Latest `0.6.4` stable, and latest nightly as of 6. Feb 2019:
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 168 date: 4-Feb-2019/18:45:38 commit: #a4d8240d8b14cfdd7b4c1d9051210253ef974cd9 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```




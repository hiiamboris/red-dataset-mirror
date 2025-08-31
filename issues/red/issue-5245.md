
#5245: [GTK] size-text doesn't work with multiline input
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5245>

**Describe the bug**

Reports the width of the first line only

**To reproduce**
```
r: rtd-layout [""]
r/text: "Lorem ipsum^/dolor sit amet, consectetur adipiscing^/elit"
r/size: 500x500
probe sz: size-text r
probe caret-to-offset/lower r 1 + length? r/text
view compose/deep [base white (sz) draw [text 0x0 (r)]]
```
![](https://i.gyazo.com/392ddf0035fa9e253fe926e9b1d0e5c0.png)

**Expected behavior**

As on Windows:
![](https://i.gyazo.com/700f05ecd88664182f53fb4e081c5348.png)

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Platform version**

```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4573 date: 23-Nov-2022/3:49:21 commit: #ee723a91c5007c4338b8252956063dcd668cf012 ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.10.60 build: "#1 SMP Wed Aug 25 23:20:18 UTC 2021" ]
--------------------------------------------
```



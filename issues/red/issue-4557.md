
#4557: [View] `text` wrap mode is ignored, controlled by alignment
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/4557>

See also https://github.com/red/red/issues/1576 for `area`

**Describe the bug**

`view [text 100 "agpaaiud wb dpadih aphd owugawhpa"]`
![](https://i.gyazo.com/b4a867522a292cad51cc5da95c55aba6.png)
Expected: not wrapped.

---
`view [text 100 "agpaaiud wb dpadih aphd owugawhpa" wrap]`
![](https://i.gyazo.com/b4a867522a292cad51cc5da95c55aba6.png)
OK

---
`view [text 100 "agpaaiud wb dpadih aphd owugawhpa" left]`
![](https://i.gyazo.com/32ce9ce304a9a37f6a8c9fb8ad3c08a7.png)
`right`, `top`, `bottom` - doesn't matter - same result as `left`.
OK

---
`view [text 100 "agpaaiud wb dpadih aphd owugawhpa" right wrap]`
![](https://i.gyazo.com/44ee821147431479e4267b0e55457249.png)
OK

---
`view [text 100 "agpaaiud wb dpadih aphd owugawhpa" para []]`
![](https://i.gyazo.com/32ce9ce304a9a37f6a8c9fb8ad3c08a7.png)
OK

---
Now the `para` craziness.
Prepare the window:
```
view/no-wait [t: text 100 "agpaaiud wb dpadih aphd owugawhpa"] ()
t/para: p: make para! [align: none] ()
```
![](https://i.gyazo.com/03447dfb8da28aea3a25c605a0f2f01d.png)
Expected: not wrapped

Quite logical: set `align` to itself! `p/align: p/align`
![](https://i.gyazo.com/72acfbd6e6f6cdd8c9f452d08552e0d8.png)
Expected: no visible change!

Now wrap starts working. Properly. `p/wrap?: yes`
![](https://i.gyazo.com/cf3115d61e882f6393c0ac8e906f598a.png)
OK

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```




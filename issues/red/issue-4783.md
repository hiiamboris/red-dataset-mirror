
#4783: `size-text` cannot fill rich-text face fully
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[GUI]
<https://github.com/red/red/issues/4783>

**Describe the bug**

When rich-text face's size equals it's text size, I expect size-text to return the same value always. However here's a snippet proving the opposite:
```
txt: "Lorem ipsum dolor sit amet, conse"
lt: rtd-layout [""]
lt/font: make font! [name: "Segoe UI" size: 10]
lt/size/x: 300
loop 20 [
	lt/text: txt
	lt/size: probe size-text lt
]
```
Output:
```
197x17
160x34
125x34
108x34
82x51
74x51
68x69
47x86
36x103
34x121
33x138
31x155
30x172
29x172
26x172
25x190
24x190
23x190
20x190
19x190
```

**Expected behavior**
```
197x17
197x17
197x17
197x17
<...>
```

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
both master and D2D branches
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-26T19:03:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4783#issuecomment-751386362>

    Another problem with it, it also **draws** the text wrongly:
    ```
    txt: "Lorem ipsum dolor sit amet, conse"
    lt: rtd-layout [""]
    lt/font: make font! [name: "Segoe UI" size: 10]
    lt/size/x: 300
    lt/text: txt
    lt/size: probe size-text lt   ;) 197x17
    ;) this should draw the text on a single line, right?
    view compose/deep [rich-text 300x100 draw [text 0x0 (lt)]]
    ```
    ![](https://i.gyazo.com/68446b1f22e9bbaf6139e51ce020c8dc.png)

--------------------------------------------------------------------------------

On 2020-12-26T19:04:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/4783#issuecomment-751386414>

    Could be some DPI rounding glitch. I'm using 150% scaling.

--------------------------------------------------------------------------------

On 2020-12-26T19:52:16Z, greggirwin, commented:
<https://github.com/red/red/issues/4783#issuecomment-751390206>

    Same results here, at 100% scaling.

--------------------------------------------------------------------------------

On 2020-12-27T08:43:29Z, qtxie, commented:
<https://github.com/red/red/issues/4783#issuecomment-751441159>

    The API gives us `float` size, while Red use `integer` size.
    The accurate size returns by the API: `197.6724, 17.29102`.

--------------------------------------------------------------------------------

On 2020-12-27T10:55:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4783#issuecomment-751452948>

    So, rounding up should be the easiest solution I guess.

--------------------------------------------------------------------------------

On 2020-12-27T10:57:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4783#issuecomment-751453108>

    I don't think adding 0.5 is gonna work. To integer drops the float part, so `100.2 + 0.5 = 100.7 -> 100`.

--------------------------------------------------------------------------------

On 2021-09-27T01:39:23Z, qtxie, commented:
<https://github.com/red/red/issues/4783#issuecomment-927438566>

    > 
    > 
    > I don't think adding 0.5 is gonna work. To integer drops the float part, so `100.2 + 0.5 = 100.7 -> 100`.
    
    I also add 0.5 to the size of the rich-text to make it work. Rounding up is not satisfying if the fractional part is very small. e.g. we don't want to round 17.01 to 18.
    


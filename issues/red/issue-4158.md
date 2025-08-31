
#4158: [View] Rich-text tabs can be invisible
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/4158>

**Describe the bug**

Tabs should have a minimum visible width, at least that of a single space character. Especially in GUI console.

![](https://i.gyazo.com/6fde90bd21f530ce944d21c73d7192eb.png)

**To reproduce**
`view [rich-text draw [text 0x0 "XXXTXX^-XXTXXX^-X^/There are 2 tabs^/on the line above^/See them?"]]`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Nov-2019/22:56:56+03:00 commit #6b28faf
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-27T06:01:25Z, greggirwin, commented:
<https://github.com/red/red/issues/4158#issuecomment-558943146>

    Interesting. I see them on Win10 here. Oh, the subtleties. Nice catch.

--------------------------------------------------------------------------------

On 2019-11-27T08:40:24Z, qtxie, commented:
<https://github.com/red/red/issues/4158#issuecomment-558987106>

    `Tab` is not easy to handle on Windows. The current APIs (DirectWrite) used in Red are still too high-level, we cannot control how tabs be drawn. Either we can convert tab to spaces on the fly like in gui-console (easiest solution), or use lower-level APIs to fully control it (takes lots of time, build the drawing pipeline like in the web browser engine).

--------------------------------------------------------------------------------

On 2022-10-06T09:04:43Z, qtxie, commented:
<https://github.com/red/red/issues/4158#issuecomment-1269634591>

    DirectWrite does handle tabs, but I don't figure out the rules it uses. https://learn.microsoft.com/en-us/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setincrementaltabstop
    
    We see the tabs if we remove some characters or add more tabs.
    ```
    view [rich-text draw [text 0x0 "XXXTXX^-^-XXTXXX^-X^/There are 2 tabs^/on the line above^/See them?"]]
    view [rich-text draw [text 0x0 "XXXT^-XXTXXX^-X^/There are 2 tabs^/on the line above^/See them?"]]
    ```

--------------------------------------------------------------------------------

On 2022-10-06T09:19:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4158#issuecomment-1269660211>

    If you're converting strings for D2D, you could just replace tab with space+tab (or nbsp+tab).


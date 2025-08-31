
#4841: Space char cannot be measured on Rich-text
================================================================================
Issue is open, was reported by hiiamboris and has 18 comment(s).
[GUI] [type.design]
<https://github.com/red/red/issues/4841>

**Describe the bug**
```
>> r1: rtd-layout ["abcd"] ()
>> r2: rtd-layout ["abcd   "] ()
>> size-text r1
== 26x16
>> size-text r2
== 26x16
```

**To reproduce**
```
r1: rtd-layout ["abcd"] ()
r2: rtd-layout ["abcd   "] ()
size-text r1
size-text r2
```

**Expected behavior**

Spaces add to the size.

**Platform version**
```
Red 0.6.4 for Windows built 16-Feb-2021/11:41:34+03:00 commit #0187423
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-28T06:54:32Z, qtxie, commented:
<https://github.com/red/red/issues/4841#issuecomment-787406065>

    The trailing whitespaces at the end of each line are ignored by default. I don't have a strong use-case to support current behavior. So I'm OK to change it.

--------------------------------------------------------------------------------

On 2021-02-28T12:32:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4841#issuecomment-787445061>

    Still possible to get the size:
    ```
    >> caret-to-offset/lower r2 1 + length? r2/text
    == 36x16
    ```
    So my case is not super strong either. I just think that it's less surprising when it reports spaces in the size, and requires less workarounds.

--------------------------------------------------------------------------------

On 2021-02-28T12:39:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4841#issuecomment-787445988>

    Is this by design?
    ```
    >> caret-to-offset r2 0
    == 36x0          ;) I expected 0x0
    >> caret-to-offset/lower r2 0
    == 36x16         ;) I expected 0x16
    >> caret-to-offset r2 1
    == 0x0           ;) I expected 6x0
    >> caret-to-offset/lower r2 1
    == 6x16
    >> caret-to-offset r2 2
    == 6x0           ;) I expected 13x0
    >> caret-to-offset/lower r2 2
    == 13x16
    >> caret-to-offset r2 7
    == 32x0          ;) I expected 36x0
    >> caret-to-offset/lower r2 7
    == 36x16
    >> caret-to-offset r2 8
    == 36x0
    >> caret-to-offset/lower r2 8
    == 36x16
    ```
    This is how I imagined it:
    ```
    0   1   2   3   4   5   6   7  <- position index
                                   <- upper margin
    | a | b | c | d |   |   |   |
                                   <- lower margin
    ```
    But maybe it's a bad idea for multiline text...
    Anyway, `0` meaning is cryptic and should be documented.

--------------------------------------------------------------------------------

On 2021-03-04T07:30:31Z, qtxie, commented:
<https://github.com/red/red/issues/4841#issuecomment-790388469>

    The position index is 1-based. `0` has no meaning. Maybe we should return `none`.
    ```
    1   2   3   4   5   6   7   8  <- position index
                                   <- upper margin
    | a | b | c | d |   |   |   |
                                   <- lower margin
     ```

--------------------------------------------------------------------------------

On 2022-11-17T16:34:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4841#issuecomment-1318900894>

    This space char becomes annoying when rendering mixed content (text & widgets) in a single paragraph, because the solution proposed [above](https://github.com/red/red/issues/4841#issuecomment-787445061) works only if text is a single line. Means that in general size estimation code I have to detect if there is more than one line, then use `size-text`, otherwise use `caret-to-offset`. But to detect that I need to call both functions and compare their /y value before I choose (if heights are equal - it's a single line).

--------------------------------------------------------------------------------

On 2023-07-19T16:11:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4841#issuecomment-1642375849>

    There's an interesting situation in rich-text related to this issue.
    
    I'm using `size-text` to measure the size of simple `text` and `paragraph` widgets in Spaces. Should I count trailing spaces?
    
    One example area where it is used is `rich-paragraph`:
    <img width=400 src=https://i.gyazo.com/f32e5c23e1d15dbea109368511b80f94.png />
    Each word in some alignment modes (like `fill` alignment used in the screenshot) is a separate `text` widget, and each `whitespace` is too. So I need to account for trailing whitespaces as well as width of text containing only whitespaces, to know their minimum size over which I can expand it to fill the line. Whitespace measurement is also needed for caret positioning inside whitespace areas.
    
    Another example area is `list-view` of `paragraph`s:
    <img width=300 src=https://i.gyazo.com/05751e851e72bddd519f0e5b99589749.png />
    In it, list width is capped by setting `/size` property of rich-text face. Should any of the paragraphs become wider than allowed width that will also widen the list, and a bottom scrollbar will appear (very bad UX).
    
    `size-text` cannot be used because it won't accomodate the first example (by not measuring whitespace).
    Maximum of `size-text` and `caret-to-offset/lower` of last caret location does include the trailing whitespace, but won't work for the second example, because internal rich-text facilities wrap text not in accordance with this method of size estimation.
    
    E.g. if I set rich-text face's `/size` to `184x0` to cap its width at `184` and `/text` to `"lorem ipsum dolor "` (ending with whitespace), it will not be wrapped (`dolor` word is still on the first and only line). So while `size-text` returns 184 width, `caret-to-offset` will return 187, including the trailing whitespace and telling me that text didn't fit into my width and list has to be widened.
    
    I've found some kludges for now, including defining:
    ```
    size-text2: function [layout [object!]] [
    	size1: size-text layout
    	size2: caret-to-offset/lower layout length? layout/text		;-- include trailing whitespaces
    	if layout/size [size2/x: min size2/x layout/size/x]			;-- but not beyond the allowed width
    	max size1 size2
    ]
    ```
    Note though that while it works for me, it's incorrect in general: minimum width of the text is defined by the width of its narrowest letter, so even if I set `/size` to 1x0 and `/text` to `"abcw"`, `size-text` will still return the width of `"w"`. So a more robust version should also account for this somehow.
    
    I think this is situation is informative in the design aspect of `size-text` and rich-text wrapping mode, so I'm sharing it here.

--------------------------------------------------------------------------------

On 2023-07-19T16:52:16Z, greggirwin, commented:
<https://github.com/red/red/issues/4841#issuecomment-1642430352>

    Great summary. Thanks @hiiamboris.

--------------------------------------------------------------------------------

On 2023-07-19T17:06:09Z, greggirwin, commented:
<https://github.com/red/red/issues/4841#issuecomment-1642450453>

    A quick search turned up web and .net functions, but neither provide details about how they measure things. Since we're dependent on OS measuring funcs. I can also see arguments for why those measurements would ignore whitespace is some scenarios. Since the user can `trim` if they want, that's a weak argument. To get detailed control is a lot more work in modifying content for rendering. In this context, I care more about the visual result than "technical correctness" of how things are measured. That is, I support your approach. The next thing, then, is to find a small set of edge cases and see a) do they produce a good result, and b) if the extra logic (I wouldn't call it a kludge in this case) can be improved.

--------------------------------------------------------------------------------

On 2023-07-19T19:04:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4841#issuecomment-1642606329>

    For edge cases, take the one above: `"lorem ipsum dolor "`. If `dolor` happens to fill the face's width, next printable char (say `x`) added will wrap `dolorx` to the next line. The difference is whether added space char also will.
    
    In other words, if we were to consider trailing whitespace significant we would have to treat it as part of the last word (because otherwise we wouldn't solve the size-text<->caret-to-offset discrepancy). But it may be surprising in some contexts if you type `"lorem ipsum dolor"`, press space and `dolor` gets wrapped:
    ```
    "lorem ipsum"
    "dolor "
    ```
    then you start typing another word and `dolor` gets unwrapped back:
    ```
    "lorem ipsum dolor "
    "word"
    ```
    That would mean that whitespace between words and after the text is treated differently. So current behavior is understandable from a high level widget perspective.
    
    Another alternative would be to wrap just whitespace, but since it gets eaten by line wrapping, second line would be empty but it would be there:
    ```
    "lorem ipsum dolor "
    ""
    ```
    Which can be surprising in some contexts as well: we would see an empty line (0px wide), which is a good thing in an editor but not so in a read only paragraph of text.
    
    My needs in Spaces are more low level: decomposing rich text into words and lines to mix the widgets in, and also at the higher level just represent a read-only text paragraph or single line of editable text.
    
    As far as I can see there's no one size fits all solution here, so best thing if possible would be to have it configurable out of the box.



#4556: zero index in TEXT-LIST
================================================================================
Issue is open, was reported by 9214 and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/4556>

**Describe the bug**
All list-based View widgets have 1-based indexing, but at least [`text-list` documentation](https://github.com/red/docs/blob/master/en/view.adoc#text-list) avoids mentioning that — perhaps for a good reason, since that is not true.

**To reproduce**
```red
view [text-list data ["foo"] [probe zero? face/selected]]
```

Left-click on empty space below `foo` so that `text-list` gets focus but entry isn't actually selected; observe the output.

**Expected behavior**
I think `on-change` actor shouldn't be triggered at all.

**Platform version**
W10, 3a79cbf



Comments:
--------------------------------------------------------------------------------

On 2020-06-28T19:44:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4556#issuecomment-650812552>

    Leaking internal information (which may vary by OS). Docs say index should be `none` if there's no selection.
    ```
    view [TL: text-list data ["foo"] [print ['chg face/selected]] on-select [print ['sel face/selected]]]
    ```
    Click in empty area, then on `foo`
    ```
    sel -1
    chg 0
    sel 0
    chg 1
    ```
    In an uninitialized selection state, you get the first pair of events, but only once. Then you can't unselect (de-initialize) again. I'm OK with that, but also with having it not trigger for that case. For the indexes themselves, they should be one based, and return `none` if there's no selection. This does mean you can't implicitly rely on `pick [a b c] 0` behavior to get `none` as a result, and I'm OK with that.


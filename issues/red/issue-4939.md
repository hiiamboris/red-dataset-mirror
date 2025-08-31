
#4939: CLIP with SHAPE commands doesn't work
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4939>

According to [docs](https://github.com/red/docs/blob/master/en/draw.adoc#228-clip) `clip` supports two forms: 1) by rectangular area and 2) by shape dialect commands.

Following snippet should clip rectangular area formed by shape dialect commands, but it doesn't:
```
view [box 200x200 beige draw [
   clip [move 10x10 line 100x10 100x50 10x50 close] 
        [fill-pen gold box 10x10 198x198]]]
```
Nor could I make it clip by any other shape dialect region.

```
>> about
Red 0.6.4 for Windows built 29-Jul-2021/13:31:32+03:00  commit #2dc7612
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-31T02:48:24Z, qtxie, commented:
<https://github.com/red/red/issues/4939#issuecomment-890280566>

    BTW, the clip shape will always be closed. The following code also works.
    ```
    view [box 200x200 beige draw [
       clip [move 10x10 line 100x10 100x50 10x50] 
            [fill-pen gold box 10x10 198x198]]]
    ```



#3803: `drop-down` displays last user selection instead of `selected` on `view`
================================================================================
Issue is open, was reported by WiseGenius and has 8 comment(s).
[GUI]
<https://github.com/red/red/issues/3803>

**Description:**
When `view` is used on a `layout` with a `drop-down`, the last item the user selected is displayed, instead of `face/selected`.

**To reproduce:**
1. Open the console and run this code:
```
l: layout [
	dl: drop-list data ["correct item" "incorrect item"]
	dd: drop-down data ["correct item" "incorrect item"]
	return
	button "correct button" [dl/selected: 1 dd/selected: 1]
	button "?? button" [?? dl/selected ?? dd/selected]
]
view l
```
2. Click on “correct button”.
3. Observe both drop faces display “correct item”.
4. Close the window.
5. Run this code:
```
view l
```
6. Observe both drop faces display “correct item”.
7. Select “incorrect item” from the `drop-list`.
8. Select “incorrect item” from the `drop-down`.
9. Click on “correct button”.
10. Observe both drop faces display “correct item”.
11. Close the window.
12. Run this code:
```
view l
```
13. Observe the `drop-list` displays “correct item”.
14. Observe the `drop-down` displays “incorrect item”.
15. Click on “?? button”.
16. Observe the following result:
```
dl/selected: 1
dd/selected: 1
```

**Expected behavior:**
In step 14, above, the `drop-down` should display “correct item”.
The observations described in all the other steps are correct.

**Screenshots:**


**Platform version:**
Red 0.6.4 for Windows built 5-Mar-2019/7:09:36+10:00 commit #53b5b37
On Windows XP.


Comments:
--------------------------------------------------------------------------------

On 2019-03-05T13:53:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/3803#issuecomment-469687214>

    Confirmed on W7, same build
    ![](https://i.gyazo.com/6005b8294f2c910704a363c30e80a4f2.png)

--------------------------------------------------------------------------------

On 2019-03-05T19:44:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3803#issuecomment-469830492>

    Excellent ticket write-up with a helpful example @WiseGenius. I'm not sure it's a bug though. Type any text into the dropdown and it will be remembered, without changing the `selected` facet.

--------------------------------------------------------------------------------

On 2019-03-05T19:48:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3803#issuecomment-469832139>

    At the very least, we should define the behavior and how facets are prioritized and related. e.g., does, or should, typing into a dropdown set `selected` to `none`?

--------------------------------------------------------------------------------

On 2019-03-05T20:04:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3803#issuecomment-469837439>

    What should probably happen is for the text facet to be updated when you set selected, which seems not to be the case. I haven't worked on this code, but a quick glance tells me that's the case.


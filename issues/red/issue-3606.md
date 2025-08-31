
#3606: Strings converted to words in VID styles
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/3606>

**Describe the bug**

Assigning a string to a VID text style (H1, H2, TEXT, etc) causes words to be added to SYSTEM/WORDS

Bloating SYSTEM/WORDS can have consequences in text-heavy apps - the line below simulates displaying "War and Peace" word at a time in a VID TEXT field - I started it running nearly 10 minutes ago - it is still running, and memory footprint still climbing:

repeat n 500000 [load rejoin ["word-" n]]

**To Reproduce**

    layout [t: h1]  
    t/text: "aaa bbb ccc. ddd, eee"
    back back back back tail words-of system/words
    == [aaa bbb ccc. ddd]   ;; note - not eee, even though that is as good a word as aaa
    t/data
    == [aaa bbb ccc. ddd]

**Expected behavior**

Neither DATA field of a VID text style nor SYSTEM/WORDS should be affected by assigning a string.

Things work as expected with other VID styles - such as BOX:

    layout [b: box]  
    b/text: "fff ggg hhh. iii, jjj"   ;; no extraneous words created.

**Platform version(please complete the following information):**

Red 0.6.4 for Windows built 22-Nov-2018/0:40:38 commit #755eb94



Comments:
--------------------------------------------------------------------------------

On 2020-01-30T16:59:42Z, dockimbel, commented:
<https://github.com/red/red/issues/3606#issuecomment-580351889>

    FYI, `/data` field is set automatically to a loaded value from `/text` for `text` and `field` faces. The fix now restricts the conversion to only `scalar!` types using the new `scan` type guessing feature .


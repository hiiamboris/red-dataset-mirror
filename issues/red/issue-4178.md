
#4178: MAKE hash! is painfully slow on repeating items
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/red/issues/4178>

**Describe the bug**

```
>> append/dup b: [] 0 100'000
>> make hash! b
```
Takes a few minutes...

**Expected behavior**

I realize hash! loses any advantage on this particular sample ;) Yet, it should offer some degree of universality. In R2 the same operation is instantaneous. As it should be in Red.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Nov-2019/10:17:45+03:00 commit #b2aafe6
```



Comments:
--------------------------------------------------------------------------------

On 2019-12-07T12:07:09Z, qtxie, commented:
<https://github.com/red/red/issues/4178#issuecomment-562845687>

    It's a known issue. https://github.com/red/red/pull/4026

--------------------------------------------------------------------------------

On 2019-12-07T12:12:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/4178#issuecomment-562846132>

    I see. Closing ;)


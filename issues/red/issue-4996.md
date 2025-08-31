
#4996: [Parse] Unexpected case sensitivity with WORD! values
================================================================================
Issue is open, was reported by justinthesmith and has 14 comment(s).
[type.bug]
<https://github.com/red/red/issues/4996>

**Describe the bug**
In block parsing mode, parse is sensitive to the case of WORD! values even when not using the /case refinement.

**Expected behavior**
```
>> parse [a]['A]
== true
>> parse/case [a]['A]
== false
```
**Actual behavior**
```
>> parse [a]['A]
== false
>> parse/case [a]['A]
== false
```
**Possibly related**
[#3029](https://github.com/red/red/issues/3029)
[#3354](https://github.com/red/red/issues/3554)

**Platform version**
```
Red 0.6.4 for Windows built 13-Nov-2021/2:17:19-08:00  commit #5f09829
```



Comments:
--------------------------------------------------------------------------------

On 2021-11-15T16:18:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4996#issuecomment-969074220>

    As a temporary workaround use: `parse [a] [set w word! if (w = 'a)]`
    Or if word is 1 letter only you can list both spellings ;)

--------------------------------------------------------------------------------

On 2021-11-15T17:45:14Z, justinthesmith, commented:
<https://github.com/red/red/issues/4996#issuecomment-969155873>

    Thanks for the tip, @hiiamboris. Unfortunately this will not scale well to dialect creation. This feels like a high-priority bug to me because of the impact to that use case.
    
    Would additional examples be helpful?

--------------------------------------------------------------------------------

On 2021-11-15T20:09:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4996#issuecomment-969277635>

    Duplicate of https://github.com/red/red/issues/3029#issuecomment-436438710 regression report

--------------------------------------------------------------------------------

On 2022-01-23T20:34:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4996#issuecomment-1019561821>

    I just hit this for `am/pm` vs `AM/PM` in a dialect with time values. 
    
    @dockimbel is this a difficult fix?

--------------------------------------------------------------------------------

On 2022-01-23T21:01:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4996#issuecomment-1019566474>

    IIRC it was introduced in an attempt to fix something else, so must be problematic.

--------------------------------------------------------------------------------

On 2024-03-01T21:03:32Z, greggirwin, commented:
<https://github.com/red/red/issues/4996#issuecomment-1973915220>

    Just hit this again.

--------------------------------------------------------------------------------

On 2024-03-02T03:45:52Z, qtxie, commented:
<https://github.com/red/red/issues/4996#issuecomment-1974255945>

    > IIRC it was introduced in an attempt to fix something else, so must be problematic.
    
    This one: #3029 


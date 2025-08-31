
#3629: stats function returns negative memory usage
================================================================================
Issue is closed, was reported by PeterWAWood and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3629>

**Describe the bug**
When large amounts of memory has been "reserved" with the make function, the stats function returns negative values.
```text
>> s: make string! 1'000'000'000
== ""
>> stats
== 1001475992
>> s: make string! 1'000'000'000
== ""
>> stats
== 2001476868
>> s: make string! 1'000'000'000
== ""
>> stats
== -1293489468
```
**To Reproduce**
See above
**Expected behavior**
stats returns only positive values for memory usage

**Platform version(please complete the following information):**
```
Red 0.6.4 for macOS built 3-Dec-2018/21:24:35+08:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-03T16:49:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/3629#issuecomment-443780897>

    How can it possibly return a positive result while we don't have an unsigned integer type neither in Red nor in R/S to hold this result?

--------------------------------------------------------------------------------

On 2018-12-03T18:13:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3629#issuecomment-443810852>

    On Win10 I get insufficient memory errors before it will return an invalid result. this may just be a bug in `memory-info` in %debug-tools.reds.

--------------------------------------------------------------------------------

On 2018-12-04T05:04:00Z, qtxie, commented:
<https://github.com/red/red/issues/3629#issuecomment-443972701>

    I think @hiiamboris is right. B2E6EAC4h = -1293489468 (int32) = 3001477828 (unsigned int32). When printing the number, we should interpret it as an unsigned integer.

--------------------------------------------------------------------------------

On 2018-12-10T15:19:38Z, dockimbel, commented:
<https://github.com/red/red/issues/3629#issuecomment-445852610>

    @hiiamboris `pointer! [byte!]` type in R/S effectively acts as a unsigned 32-bit integer, though not all math operations are permitted on it.

--------------------------------------------------------------------------------

On 2018-12-11T11:56:57Z, bitbegin, commented:
<https://github.com/red/red/issues/3629#issuecomment-446177168>

    this situation has to wait uint! type be implemented

--------------------------------------------------------------------------------

On 2021-01-24T17:06:23Z, greggirwin, commented:
<https://github.com/red/red/issues/3629#issuecomment-766395422>

    I just hit this using my `profile` function when testing the JSON codec over many runs. 

--------------------------------------------------------------------------------

On 2022-09-20T18:49:40Z, dockimbel, commented:
<https://github.com/red/red/issues/3629#issuecomment-1252773461>

    Output is now switching to float if overflowing.


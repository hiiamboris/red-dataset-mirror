
#4055: Read-clipboard doubles newline chars
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
<https://github.com/red/red/issues/4055>

I have already fixed this issue. Just reporting it for historical reference.

**Describe the bug**

Text in the clipboard:
```
1
2
3
```
Let's try to read it:
```
>> print probe read-clipboard
{1^M^/2^M^/3^M^/}
1

2

3

```
As you can see every new-line appears twice.

This also has a very harmful effect:
```
>> length? read-clipboard
== 7
>> write-clipboard read-clipboard
== true
>> length? read-clipboard
== 9
```
It grows! ☻ 

Then `loop 10000 [write-clipboard read-clipboard]` will just crash it since memory footprint grows exponentially.

**Expected behavior**
```
>> print probe read-clipboard
{1^/2^/3^/}
1
2
3
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Sep-2019/22:36:30+03:00 commit #f753e25
```



Comments:
--------------------------------------------------------------------------------

On 2019-09-30T00:27:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4055#issuecomment-536357217>

    :+1: So I can close this?

--------------------------------------------------------------------------------

On 2019-09-30T07:29:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4055#issuecomment-536438959>

    No, @greggirwin, not until I make a PR and it's accepted :)

--------------------------------------------------------------------------------

On 2019-09-30T20:04:16Z, greggirwin, commented:
<https://github.com/red/red/issues/4055#issuecomment-536728490>

    Ah, I thought you meant you had fixed it in the past, and just created the ticket to doc the fact. Thanks.


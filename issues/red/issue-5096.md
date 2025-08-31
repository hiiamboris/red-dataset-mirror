
#5096: Inconsistent treatment of /reverse/skip by FIND on hash!
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5096>

**Describe the bug**

hash! datatype has it's own idea of /reverse/skip, which is illustrated by the following script:
```
Red []

b: [1 2 3 4 5 6]
h: make hash! b
v: make vector! b
s: rejoin b
x: to binary! b

foreach srs reduce [b h v s x] [
	foreach ofs [3 4 5] [
		foreach rec [1 2 3] [
			code: compose/only [find/reverse/skip skip (srs) (ofs) 4 (rec)]
			print [mold code "=>" do code]
		]
	]
]
```
Output:
```
[find/reverse/skip skip [1 2 3 4 5 6] 3 4 1] => none
[find/reverse/skip skip [1 2 3 4 5 6] 3 4 2] => none
[find/reverse/skip skip [1 2 3 4 5 6] 3 4 3] => none
[find/reverse/skip skip [1 2 3 4 5 6] 4 4 1] => 4 5 6
[find/reverse/skip skip [1 2 3 4 5 6] 4 4 2] => 4 5 6
[find/reverse/skip skip [1 2 3 4 5 6] 4 4 3] => 4 5 6
[find/reverse/skip skip [1 2 3 4 5 6] 5 4 1] => 4 5 6
[find/reverse/skip skip [1 2 3 4 5 6] 5 4 2] => none
[find/reverse/skip skip [1 2 3 4 5 6] 5 4 3] => none
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 3 4 1] => none
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 3 4 2] => none
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 3 4 3] => none
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 4 4 1] => 4 5 6
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 4 4 2] => none
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 4 4 3] => none
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 5 4 1] => 4 5 6
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 5 4 2] => 4 5 6
[find/reverse/skip skip make hash! [1 2 3 4 5 6] 5 4 3] => none
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 3 4 1] => none
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 3 4 2] => none
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 3 4 3] => none
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 4 4 1] => 4 5 6
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 4 4 2] => 4 5 6
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 4 4 3] => 4 5 6
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 5 4 1] => 4 5 6
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 5 4 2] => none
[find/reverse/skip skip make vector! [1 2 3 4 5 6] 5 4 3] => none
[find/reverse/skip skip "123456" 3 4 1] => none
[find/reverse/skip skip "123456" 3 4 2] => none
[find/reverse/skip skip "123456" 3 4 3] => none
[find/reverse/skip skip "123456" 4 4 1] => 456
[find/reverse/skip skip "123456" 4 4 2] => 456
[find/reverse/skip skip "123456" 4 4 3] => 456
[find/reverse/skip skip "123456" 5 4 1] => 456
[find/reverse/skip skip "123456" 5 4 2] => none
[find/reverse/skip skip "123456" 5 4 3] => none
[find/reverse/skip skip #{010203040506} 3 4 1] => none
[find/reverse/skip skip #{010203040506} 3 4 2] => none
[find/reverse/skip skip #{010203040506} 3 4 3] => none
[find/reverse/skip skip #{010203040506} 4 4 1] => #{040506}
[find/reverse/skip skip #{010203040506} 4 4 2] => #{040506}
[find/reverse/skip skip #{010203040506} 4 4 3] => #{040506}
[find/reverse/skip skip #{010203040506} 5 4 1] => #{040506}
[find/reverse/skip skip #{010203040506} 5 4 2] => none
[find/reverse/skip skip #{010203040506} 5 4 3] => none
```
Basically, find "reverses" the meaning of skip for most datatypes, starting search at record's tail. But hash doesn't do that.

**Expected behavior**

Consistent results. 

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-04-09T17:22:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5096#issuecomment-1094089300>

    On differences between `/reverse/skip` and `/last/skip`:
    ```
    >> find/reverse/skip probe at make hash! [a b c] 1 'a 3
    make hash! [a b c]
    == none
    >> find/reverse/skip probe at make hash! [a b c] 2 'a 3
    make hash! [b c]
    == none
    >> find/reverse/skip probe at make hash! [a b c] 3 'a 3
    make hash! [c]
    == none
    >> find/reverse/skip probe at make hash! [a b c] 4 'a 3
    make hash! []
    == make hash! [a b c]
    ```
    `/reverse/skip` requires one to start search *right after the last record*
    While `/last/skip` somehow doesn't work at that location:
    ```
    >> find/last/skip probe at make hash! [a b c] 1 'a 3
    make hash! [a b c]
    == make hash! [a b c]
    >> find/last/skip probe at make hash! [a b c] 2 'a 3
    make hash! [b c]
    == none
    >> find/last/skip probe at make hash! [a b c] 3 'a 3
    make hash! [c]
    == none
    >> find/last/skip probe at make hash! [a b c] 4 'a 3
    make hash! []
    == none
    ```
    
    When working with records of data, key is usually at the 1st index, so it is more convenient to write
    `find/reverse/skip tail series item 3` (hash) than 
    `find/reverse/skip at tail series -2 item 3` (other series)
    However! This is not always the case. And hash behavior makes it **impossible** to look for keys that are not at the 1st index:
    ```
    >> find/reverse/skip at make hash! [a b c] 4 'c 3
    == none
    >> find/reverse/skip at make hash! [a b c] 3 'c 3
    == none
    >> find/reverse/skip at make hash! [a b c] 2 'c 3
    == none
    >> find/reverse/skip at make hash! [a b c] 1 'c 3
    == none
    ```
    That's why hash must follow other series behavior, even if it's a bit messy to use.

--------------------------------------------------------------------------------

On 2022-04-11T02:11:56Z, qtxie, commented:
<https://github.com/red/red/issues/5096#issuecomment-1094471989>

    Ok. So let's make the rule clear.
    
    ### /reverse
    start position of the searching: current position (series/head)
    range of the searching: [1, series/head)
    
    Some examples:
    ```
    >> find/reverse at [a b c] 1 'a
    == none
    >> find/reverse at [a b c] 3 'c
    == none
    >>find/reverse at [a b c] 4 'c
    == [c]
    ```
    
    ### /last
    start position of the searching: series/tail
    range of the searching: [series/head, series/tail)
    
    Some examples:
    ```
    >> find/last probe at [a b c d] 3 'b
    [c d]
    == none
    
    >> find/last probe at [a b c d] 2 'b
    [b c d]
    == [b c d]
    ```
    
    @hiiamboris Is the rules above OK for you?

--------------------------------------------------------------------------------

On 2022-04-11T08:42:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5096#issuecomment-1094718876>

    this ticket is about /skip.

--------------------------------------------------------------------------------

On 2022-04-11T10:38:21Z, qtxie, commented:
<https://github.com/red/red/issues/5096#issuecomment-1094890433>

    Then why use /reverse?

--------------------------------------------------------------------------------

On 2022-04-11T10:57:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5096#issuecomment-1094906048>

    I use a stack of records during profiling. Key is not unique, so multiple records can exist at the same time.
    For example: drawing of X involves drawing of Y which involves drawing of another X. Profiling stack will evolve roughly like this: 
    `x x-start1`
    `x x-start1 y y-start1`
    `x x-start1 y y-start1 x x-start2`
    `x x-start1 y y-start1` - at this point I need to find `x` from the end and remove it
    `x x-start1`
    

--------------------------------------------------------------------------------

On 2022-11-01T07:36:08Z, qtxie, commented:
<https://github.com/red/red/issues/5096#issuecomment-1298137463>

    The bug in hash! in this issue has been fixed. The `/skip` issue is design related. See #5119.


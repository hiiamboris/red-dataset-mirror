
#5033: Negative week day in BC dates
================================================================================
Issue is closed, was reported by hiiamboris and has 28 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5033>

**Describe the bug**
```
>> repeat i 14 [d: load rejoin [i "/1/-0001"] print [d d/weekday]]
1/Jan/-1 -1
2/Jan/-1 0
3/Jan/-1 1
4/Jan/-1 -5
5/Jan/-1 -4
6/Jan/-1 -3
7/Jan/-1 -2
8/Jan/-1 -1
9/Jan/-1 0
10/Jan/-1 1
11/Jan/-1 -5
12/Jan/-1 -4
13/Jan/-1 -3
14/Jan/-1 -2
```
(this includes year `0000`)

**Expected behavior**

1 to 7

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-24T12:29:02Z, dockimbel, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020049439>

    Seems to work down to 27-Feb-0000, then it becomes off by one:
    
    ```
    >> repeat i 28 [d: load rejoin [i "/2/0000"] print [d d/weekday]]
    1-Feb-0000 -4
    2-Feb-0000 -3
    3-Feb-0000 -2
    4-Feb-0000 -1
    5-Feb-0000 0
    6-Feb-0000 1
    7-Feb-0000 -5
    8-Feb-0000 -4
    9-Feb-0000 -3
    10-Feb-0000 -2
    11-Feb-0000 -1
    12-Feb-0000 0
    13-Feb-0000 1
    14-Feb-0000 -5
    15-Feb-0000 -4
    16-Feb-0000 -3
    17-Feb-0000 -2
    18-Feb-0000 -1
    19-Feb-0000 0
    20-Feb-0000 1
    21-Feb-0000 -5
    22-Feb-0000 -4
    23-Feb-0000 -3
    24-Feb-0000 -2
    25-Feb-0000 -1
    26-Feb-0000 0
    27-Feb-0000 1
    28-Feb-0000 2
    >> repeat i 28 [d: load rejoin [i "/3/0000"] print [d d/weekday]]
    1-Mar-0000 3
    2-Mar-0000 4
    3-Mar-0000 5
    4-Mar-0000 6
    5-Mar-0000 7
    6-Mar-0000 1
    7-Mar-0000 2
    8-Mar-0000 3
    9-Mar-0000 4
    10-Mar-0000 5
    11-Mar-0000 6
    12-Mar-0000 7
    13-Mar-0000 1
    14-Mar-0000 2
    15-Mar-0000 3
    16-Mar-0000 4
    17-Mar-0000 5
    18-Mar-0000 6
    19-Mar-0000 7
    20-Mar-0000 1
    21-Mar-0000 2
    22-Mar-0000 3
    23-Mar-0000 4
    24-Mar-0000 5
    25-Mar-0000 6
    26-Mar-0000 7
    27-Mar-0000 1
    28-Mar-0000 2
    ```

--------------------------------------------------------------------------------

On 2022-01-24T14:53:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020183315>

    Definitely an issue related to year 0 calculations:
    
    ```
    >> 29/02/0000
    == 29-Feb-0000
    >> 01/03/0000 - 1
    == 28-Feb-0000
    ```
    and
    ```
    >> d: 01/03/0000 d/weekday
    == 3
    >> d: 29/02/0000 d/weekday
    == 3
    >> d: 28/02/0000 d/weekday
    == 2
    ```

--------------------------------------------------------------------------------

On 2022-01-24T15:14:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020205834>

    Should be `>>>` in place of `>>`?

--------------------------------------------------------------------------------

On 2022-01-24T15:19:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020210953>

    Also `date-to-days` formula doesn't look like it's going to work for zero and negative years (but I haven't checked).

--------------------------------------------------------------------------------

On 2022-01-24T15:31:13Z, dockimbel, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020224524>

    > Should be `>>>` in place of `>>`?
    
    Why? I've pasted a Red console session.

--------------------------------------------------------------------------------

On 2022-01-24T15:36:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020229834>

    No I mean in macros inside date datatype. I think `DATE_GET_YEAR` and `DATE_SET_YEAR` won't round trip in their current form.
    Sorry for confusing suggestions :)

--------------------------------------------------------------------------------

On 2022-01-24T15:40:32Z, dockimbel, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020233767>

    `date-to-days` seems to work fine wrapping around zero:
    
    ```
    d2d: -7
    22-Feb-0000 -4
    d2d: -6
    23-Feb-0000 -3
    d2d: -5
    24-Feb-0000 -2
    d2d: -4
    25-Feb-0000 -1
    d2d: -3
    26-Feb-0000 0
    d2d: -2
    27-Feb-0000 1
    d2d: -1
    28-Feb-0000 2
    d2d: 0
    1-Mar-0000 3
    d2d: 1
    2-Mar-0000 4
    d2d: 2
    3-Mar-0000 5
    d2d: 3
    4-Mar-0000 6
    d2d: 4
    5-Mar-0000 7
    d2d: 5
    6-Mar-0000 1
    d2d: 6
    7-Mar-0000 2
    ```
    Note: the number at the right of the date is the weekday.

--------------------------------------------------------------------------------

On 2022-01-24T16:18:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020275604>

    `% 7` must be the problem then https://github.com/red/red/blob/0ea7647870703c0d68131d8bf1232672430dca1c/runtime/datatypes/date.reds#L73
    if `d` is negative `%` will behave symmetrically, not the way week days work
    
    And it's in a lot of places. Division should be checked as well.

--------------------------------------------------------------------------------

On 2022-01-24T16:23:51Z, dockimbel, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020281770>

    > % 7 must be the problem then
    
    Correct, I've changed it to `// 7` everywhere, which more consistently deals with negative left operands.

--------------------------------------------------------------------------------

On 2022-01-24T16:29:01Z, dockimbel, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020287430>

    BTW, "BC dates" can be confusing in the Red dates context as we stick to ISO-8601 where year 0 => 1BC, year -1 => 2BC and so on.

--------------------------------------------------------------------------------

On 2022-01-24T16:36:00Z, dockimbel, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020294583>

    @hiiamboris If you want to add regression tests, you are welcome, otherwise I'll add the tests when I'll find time today or tomorrow.

--------------------------------------------------------------------------------

On 2022-01-24T16:36:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020295136>

    sure

--------------------------------------------------------------------------------

On 2022-01-24T16:54:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020312583>

    Found also a crash (fixed by the above commit):
    ```
    >> d: 1/1/0000
    == 1-Jan-0000
    >> d/isoweek
    
    *** Runtime Error 101: no value matched in SWITCH
    *** in file: /d/devel/red/red-src/red/runtime/datatypes/date.reds
    *** at line: 100
    ***
    ***   stack: red/date/push-field 00000065h 4620342
    ***   stack: red/date/push-field 04BC1B48h 14
    ***   stack: red/date/eval-path 04BC1B48h 05791A90h 00000000h 05791AB8h false false true
    ***   stack: red/actions/eval-path 04BC1B48h 05791A90h 00000000h 05791AB8h false false true
    ***   stack: red/interpreter/eval-path 05791A90h 05791AC8h 05791AC8h 0330E334h false false false false
    ***   stack: red/interpreter/eval-expression 05791AC8h 05791AC8h 0330E334h false false false
    ***   stack: red/interpreter/eval 0330E334h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||613~try-do 033F02E8h
    ***   stack: ctx||613~do-command 033F02E8h
    ***   stack: ctx||613~eval-command 033F02E8h
    ***   stack: ctx||613~run 033F02E8h
    ***   stack: ctx||613~launch 033F02E8h
    ***   stack: ctx||632~launch 033EFCFCh
    ```

--------------------------------------------------------------------------------

On 2022-01-24T20:52:50Z, greggirwin, commented:
<https://github.com/red/red/issues/5033#issuecomment-1020536328>

    I wonder how many `modulo` related tickets can be closed now, or if they are related: https://github.com/red/red/issues?q=is%3Aissue+is%3Aopen+modulo  #2433 is the big one.
    


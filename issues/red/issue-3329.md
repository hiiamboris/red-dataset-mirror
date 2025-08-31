
#3329: about/debug crashes on latest console
================================================================================
Issue is closed, was reported by meijeru and has 60 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3329>

### Expected behavior
`about/debug` should give expected output
### Actual behavior
Crash
### Steps to reproduce the problem
type ` about/debug` into console
### Red and platform version
```
Red 0.6.3 for Windows built 11-Apr-2018/14:56:31+02:00 commit #9b085fa
W10
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-11T16:49:09Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-380520690>

    Comfirmed, and `about` is very complex now, with some code that could use a cleanup. e.g. the block being `compose`d has no parens, so `compose` is not needed. If we can get it working, so I can see the expected output, I'll get with @x8x and review.

--------------------------------------------------------------------------------

On 2018-04-13T00:50:24Z, x8x, commented:
<https://github.com/red/red/issues/3329#issuecomment-380987295>

    https://github.com/red/red/pull/3335 fix the crash by re-adding a previous fix that was removed, see the PR for more info.

--------------------------------------------------------------------------------

On 2018-09-27T21:59:14Z, 9214, commented:
<https://github.com/red/red/issues/3329#issuecomment-425256564>

    Still experiencing it on W10 with latest build.

--------------------------------------------------------------------------------

On 2018-09-27T22:16:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-425260409>

    This one still really bothers me. If we can't get it solved, I'll move to revert to the old `about` code, which was stable.

--------------------------------------------------------------------------------

On 2018-11-12T20:43:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-438022192>

    I hereby move that we revert to the old `about` code for the 0.6.4 release. What say ye?

--------------------------------------------------------------------------------

On 2018-11-12T22:07:42Z, endo64, commented:
<https://github.com/red/red/issues/3329#issuecomment-438045210>

    The problem is not `about` but this issue: https://github.com/red/red/issues/3411
    
    There is this line in `about`: `to-UTC-date git/date` which leads to crash. We should either remove that part or fix the issue. Latter is preferred.

--------------------------------------------------------------------------------

On 2018-11-12T22:16:55Z, 9214, commented:
<https://github.com/red/red/issues/3329#issuecomment-438047692>

    Good catch @endo64.

--------------------------------------------------------------------------------

On 2018-11-13T00:34:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-438083136>

    This seems like it should be easy, and I'm fine removing the date part, but it's been there for months and I don't know if the extra info has proven useful yet.

--------------------------------------------------------------------------------

On 2018-11-13T08:58:20Z, endo64, commented:
<https://github.com/red/red/issues/3329#issuecomment-438187302>

    Or we can just remove the `to-UTC-date` and it will show the date with timezone which is fine: `30-Oct-2018/9:30:29+03:00` instead of `30-Oct-2018/6:30:29`
    
    This would be the easiest fix.

--------------------------------------------------------------------------------

On 2018-11-13T13:50:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-438272404>

    I'm good with that as well, though then we need to know where the zone comes from (server wise). Ultimately, we should figure out why that crashes it, but make it a separate ticket.

--------------------------------------------------------------------------------

On 2018-11-13T13:51:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-438272517>

    This is @x8x's code, so I hope he'll weigh in.

--------------------------------------------------------------------------------

On 2018-11-13T15:24:15Z, xqlab, commented:
<https://github.com/red/red/issues/3329#issuecomment-438305336>

    This should fix it
    
    ```
    to-utc-date: func ["Returns the date with UTC zone" 
        date [date!] 
        return: [date!]
    ][
        date/timezone: 0:0 
        date
    ]
    ```
    
    or just omit the return:

--------------------------------------------------------------------------------

On 2018-11-13T16:05:40Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-438321743>

    Thanks @xqlab! Is that a reproducible problem we can put in another ticket?

--------------------------------------------------------------------------------

On 2018-11-14T09:18:01Z, xqlab, commented:
<https://github.com/red/red/issues/3329#issuecomment-438592420>

    probably

--------------------------------------------------------------------------------

On 2018-11-15T12:55:42Z, endo64, commented:
<https://github.com/red/red/issues/3329#issuecomment-439030817>

    I don't think we need a separate ticket for it, #3411 is already for that issue.

--------------------------------------------------------------------------------

On 2018-11-15T13:41:33Z, xqlab, commented:
<https://github.com/red/red/issues/3329#issuecomment-439043574>

    true

--------------------------------------------------------------------------------

On 2018-11-15T16:29:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-439101847>

    The info here about `return` or setting a time and not an integer should help @qtxie track it down much faster.

--------------------------------------------------------------------------------

On 2018-11-15T16:43:05Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-439106772>

    @xqlab did you test your `0:0` fix, it doesn't fix the issue for me.

--------------------------------------------------------------------------------

On 2018-11-15T16:44:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-439107426>

    Removing the `return` spec doesn't fix it either.

--------------------------------------------------------------------------------

On 2018-11-16T06:24:29Z, xqlab, commented:
<https://github.com/red/red/issues/3329#issuecomment-439294925>

    ```
    >> to-UTC-date: func ["Returns the date with UTC zone" 
    [        date [date!] 
    [        return: [date!]
    [    ][
    [        date/timezone: 0:0
    [        date
    [    ]
    == func ["Returns the date with UTC zone" 
        date [date!] return: [date!]
    ][date/...
    >> to-utc-date now
    == 16-Nov-2018/6:22:35
    >> about/debug
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.3 ahead: 1102 date: 5-Nov-2018/2:19:57 commit: #f08458f4a19d572c556f308e4e272397e42014e4 ]
    PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
    --------------------------------------------
    >> 
    ```

--------------------------------------------------------------------------------

On 2018-11-16T06:27:10Z, xqlab, commented:
<https://github.com/red/red/issues/3329#issuecomment-439295331>

    ```
    --== Red 0.6.3 ==-- 
    Type HELP for starting information. 
    
    >> to-UTC-date: func ["Returns the date with UTC zone" 
    [        date [date!] 
    [     
    [    ][
    [        date/timezone: 0
    [        date
    [    ]
    == func ["Returns the date with UTC zone" 
        date [date!]
    ][date/timezone: 0 
       ...
    >> to-UTC-date now
    == 16-Nov-2018/6:26:22
    >> about/debug
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.3 ahead: 1102 date: 5-Nov-2018/2:19:57 commit: #f08458f4a19d572c556f308e4e272397e42014e4 ]
    PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
    --------------------------------------------
    >>
    ```

--------------------------------------------------------------------------------

On 2018-11-16T16:30:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-439448864>

    @xqlab is that in the GUI console, or the CLI console? Only the GUI console has the issue.

--------------------------------------------------------------------------------

On 2018-11-16T16:32:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-439449323>

    You also need to compile the console, not just paste the code in.

--------------------------------------------------------------------------------

On 2018-11-16T16:33:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-439449796>

    Which brings up a point about the debug info, which doesn't tell you which console you're in.

--------------------------------------------------------------------------------

On 2018-11-17T19:07:51Z, endo64, commented:
<https://github.com/red/red/issues/3329#issuecomment-439640162>

    Interesting thing is if you copy of `to-UTC-date` to a new function:
    ```
    f: func ["Returns the date with UTC zone" 
        date [date!] 
        return: [date!]
    ][
        date/timezone: 0 
        date
    ]
    ```
    
    and also overwrite `to-UTC-date` function:
    
    ```
    to-UTC-date: func ["Returns the date with UTC zone" 
        date [date!] 
        return: [date!]
    ][
        date/timezone: 0 
        date]
    ```
    
    `f` doesn't crash but `to-UTC-date` still crashes.
    
    ```
    >> f now
    == 17-Nov-2018/19:04:33
    >> to-UTC-date now
    == crash!
    ```

--------------------------------------------------------------------------------

On 2018-11-17T19:13:47Z, endo64, commented:
<https://github.com/red/red/issues/3329#issuecomment-439640496>

    Interesting.. On my second try after overwriting `to-UTC-date` it didn't crash.

--------------------------------------------------------------------------------

On 2018-11-18T08:30:33Z, xqlab, commented:
<https://github.com/red/red/issues/3329#issuecomment-439676125>

    > 
    > 
    > @xqlab is that in the GUI console, or the CLI console? Only the GUI console has the issue.
    
    Of course, this is the gui-console, as the cli console does not crash.   I tested it with an older version of the gui-console. Omitting the return is working. Redefining the to-utc-date even with the original version works if there is at least one return after the redefinition and calling to-utc-date. So not sure if the error is really connected to to-utc-date.

--------------------------------------------------------------------------------

On 2018-11-19T01:23:46Z, qtxie, commented:
<https://github.com/red/red/issues/3329#issuecomment-439745301>

    Should be fixed by commit https://github.com/red/red/commit/2293d3e3b99aa4e04723df895232e3fcb2fd6ccd

--------------------------------------------------------------------------------

On 2018-11-19T20:49:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3329#issuecomment-440036997>

    And the angels sang. Thank you @qtxie !

--------------------------------------------------------------------------------

On 2018-11-21T23:50:08Z, endo64, commented:
<https://github.com/red/red/issues/3329#issuecomment-440852581>

    Tested on Windows 10, GUI console didn't crash:
    ```
    >> about/debug
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.3 ahead: 1122 date: 21-Nov-2018/23:28:42 commit: #ad4ed9e003c011b624c3abb64f11f742c27634b8 ]
    PLATFORM: [ name: "Windows 8" OS: 'Windows arch: 'x86-64 version: 6.2.0 build: 9200 ]
    --------------------------------------------
    ```


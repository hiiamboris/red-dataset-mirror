
#4060: MOLD turns native files unloadable
================================================================================
Issue is open, was reported by hiiamboris and has 48 comment(s).
[type.design]
<https://github.com/red/red/issues/4060>

**Describe the bug**

MOLD turns native files unloadable by losing quotes, where those are strictly required.

**To reproduce**
```
>> load probe mold/all %"c:\file"
"%c:\file"
*** Syntax Error: invalid value at ":\file"
*** Where: do
*** Stack: load
```
%"c:\file" was a valid file! value, until it was mold-ed.

**Expected behavior**

Both `mold` and `mold/all` should return `{%"c:\file"}`
Consider also turning `%%` (file!) into `%"%"` (if we plan to have the https://github.com/red/red/issues/2433 solved some day)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-04T07:08:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4060#issuecomment-538273201>

    Gregg has a few thoughts on this: [October 4, 2019 1:12 AM](https://gitter.im/red/bugs?at=5d967263464b432fc1b5197f)

--------------------------------------------------------------------------------

On 2019-10-05T19:08:06Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-538679808>

    I'll comment here, though it's a bit of a tangent. 
    
    Quoted form is nicer than percent encoding, even if not entirely human friendly. 
    
    My tangent is that we face a similar problem with `issue!` values. Are they considered strings or words. In R2 they were strings, and I argued that was the better choice. But there are big benefits to making them words, especially if used as hashtags to annotate data. Red solves some issues, er, yeah, but not all. e.g. 
    ```
    >> load mold to issue! "a b c 1 2 3"
    == [#a b c 1 2 3]
    ```
    Issues already get special treatment, like refinements, because they can start with numbers. But spaces are a problem. 
    
    I don't want to go down a sigil-ized path (so many datatype puns), but if we add a `ref!` type, which I think has a lot of potential value, it needs to be a string type IMO. Should they also support a quoted form, e.g `@"a b c"`., or disallow spaces entirely?

--------------------------------------------------------------------------------

On 2019-10-05T19:10:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-538680034>

    Again, round-tripping any possible value requires construction syntax. And that's OK. But if we can push the boundaries of lexical forms based on real utility, without too much internal complexity or cognitive overhead for users, that's a good thing.

--------------------------------------------------------------------------------

On 2020-10-09T07:35:28Z, bitbegin, commented:
<https://github.com/red/red/issues/4060#issuecomment-706023063>

    https://github.com/red/red/pull/4644

--------------------------------------------------------------------------------

On 2020-10-09T07:37:28Z, bitbegin, commented:
<https://github.com/red/red/issues/4060#issuecomment-706023838>

    `to issue! "a b c 1 2 3"` should raise an error!?

--------------------------------------------------------------------------------

On 2020-10-20T02:09:44Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-712542562>

    @bitbegin that's separate from this ticket. It seems this ticket can be closed. @hiiamboris ?

--------------------------------------------------------------------------------

On 2020-10-20T18:13:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4060#issuecomment-713044894>

    @greggirwin in `Red 0.6.4 for Windows built 28-Aug-2020/14:24:38+03:00 commit #586f267` the issue is not fixed.

--------------------------------------------------------------------------------

On 2021-08-13T11:19:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/4060#issuecomment-898386249>

    The original issue seems ok now, but here we are:
    ```
    >> write to file! {1: '\"2"} "abc"
    >> read to file! {1: '\"2"}
    == "abc"
    >> load mold probe to file! {1: '\"2"}
    %"1: '\"2""
    == [%"1: '\" 2 ""]
    >> about
    Red 0.6.4 for Linux built 11-May-2021/6:20:25+03:00  commit #81d0416
    ```

--------------------------------------------------------------------------------

On 2021-08-16T22:23:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-899857265>

    1) Does `mold/all` solve all potential round-trip issues?
    2) If so, is it enough to warn people about these limitations in the meantime, via docs? "Yeah, don't do that" can go a long way.
    3) If docs aren't enough, what about something like [this](https://gist.github.com/greggirwin/17509acc596a0a77b630fa660ac7537a)? Which we can add to [this wiki page](https://github.com/red/red/wiki/%5BDOC%5D-File-Dir-Path-related-functions)
    4) Or is there some much deeper problem that requires more design thought?

--------------------------------------------------------------------------------

On 2021-08-16T22:36:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-899862646>

    And when we nail this down, we can tackle `split-path` to see if Rebol compatibility makes sense or if, as Ladislav noted many years ago, it makes more sense for `file = rejoin split-path file` to hold true.

--------------------------------------------------------------------------------

On 2021-08-17T09:35:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4060#issuecomment-900145395>

    > Does mold/all solve all potential round-trip issues?
    
    Have you tried it?

--------------------------------------------------------------------------------

On 2021-08-17T15:21:05Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-900392248>

    I have not. Still lots of catching up to do. 

--------------------------------------------------------------------------------

On 2021-08-17T16:37:08Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-900452711>

    Well, it's still TBD, so the question should be _will_ it.

--------------------------------------------------------------------------------

On 2021-08-17T16:37:23Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-900452880>

    Sorry for my firs, hasty reply this morning.

--------------------------------------------------------------------------------

On 2021-08-17T17:52:16Z, dockimbel, commented:
<https://github.com/red/red/issues/4060#issuecomment-900510141>

    I'm not sure what we should do there. Even hex encoding does not seem to solve it in R3:
    ```
    >> load mold probe to file! {1: '\"2"}
    %1:%20'\%222%22
    ** Syntax error: invalid "file" -- "%1:%20'\%222%22"
    ** Where: to case load
    ** Near: (line 1) %1:%20'\%222%22
    ```
    So maybe we should just warn users on using exotic filenames which conflict with the Red syntax rules.

--------------------------------------------------------------------------------

On 2021-08-17T17:59:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4060#issuecomment-900514705>

    Warning is only good when we input them literally. What if we read them from the file system and save/load in our data? 
    Solution is rather simple: `to file! {1: '\"2"}` -> `%"1: '\^"2^""`

--------------------------------------------------------------------------------

On 2021-08-18T11:21:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4060#issuecomment-901032870>

    Proposed test that should succeed for this issue to be closed:
    ```
    repeat i 300 [append f: %"" to-char i]
    --assert f == load mold f
    ```

--------------------------------------------------------------------------------

On 2021-08-18T13:49:02Z, qtxie, commented:
<https://github.com/red/red/issues/4060#issuecomment-901131043>

     > I'm not sure what we should do there. Even hex encoding does not seem to solve it in R3:
    > 
    > ```
    > >> load mold probe to file! {1: '\"2"}
    > %1:%20'\%222%22
    > ** Syntax error: invalid "file" -- "%1:%20'\%222%22"
    > ** Where: to case load
    > ** Near: (line 1) %1:%20'\%222%22
    > ```
    > 
    > So maybe we should just warn users on using exotic filenames with conflict with the Red syntax rules.
    
    The hex encoding works on Red. Maybe we should mold file! in hex encoding. Even better, we mold it in hex encoding only if it contains `"`.
    ```
    >> load mold probe to file! {1: '\"2"}
    %1%3A%20%27%5C%222%22
    == %1%3A%20%27%5C%222%22
    >> load mold probe to file! {1 2 3.txt}
    %"1 2 3.txt"
    == %"1 2 3.txt"
    ```

--------------------------------------------------------------------------------

On 2021-08-18T16:11:10Z, dockimbel, commented:
<https://github.com/red/red/issues/4060#issuecomment-901243046>

    > Solution is rather simple: to file! {1: '\"2"} -> %"1: '\^"2^""
    
    Maybe good enough, indeed. Curiously, R3 does not support such escaping.

--------------------------------------------------------------------------------

On 2021-08-18T16:56:51Z, greggirwin, commented:
<https://github.com/red/red/issues/4060#issuecomment-901274423>

    I like the escape format better than hex encoding, especially if it only happens when `"` is present.

--------------------------------------------------------------------------------

On 2021-08-18T23:18:18Z, qtxie, commented:
<https://github.com/red/red/issues/4060#issuecomment-901491459>

    > Solution is rather simple: to file! {1: '\"2"} -> %"1: '\^"2^""
    
    It's good only if we encode all the special characters by this escaping format. Otherwise it introduces a special case.
    
    > Curiously, R3 does not support such escaping.
    
    I think because both file! and url! are [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier). Rebol follows the URI spec.
    
    There are two literal formats already for file!.
    Format 1. %"string". `string` is treated as raw string. It is quite fast to load it as no decoding needed.
    Format 2. %string. `string` may be hex encoded.
    
    I'm prefer to use only one escaping format in file!. hex encoding or Red's own escaping encoding. Using `"` in filename is really an edge case, you cannot even use `"` on Windows. I don't think we should break Format 1 for it when using Format 2 can solve it.

--------------------------------------------------------------------------------

On 2021-08-19T07:39:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4060#issuecomment-901683960>

    And I think URI format is a completely unreadable *crime* against developers ;)
    Red already accepts escaping by the way:
    ```
    >> %"^(21)^(22)^(23)^(24)"
    == %"!"#$"
    ```
    All we need is to decide what to escape on mold.
    
    BTW Linux seems to allow any char in file names except `/` (directory separator) and `^@` (null char forbidden, for strlen to work I guess). So the same chars will be accepted on any Linux-based file server. If we talk to this server using Windows client, Windows client must be able to handle these as well.

--------------------------------------------------------------------------------

On 2021-08-19T22:24:43Z, qtxie, commented:
<https://github.com/red/red/issues/4060#issuecomment-902292155>

    > Red already accepts escaping by the way:
    
    ```
    >> %"^(21)^(22)^(23)^(24)"
    == %"!"#$"
    ````
    
    But it's not accepts `%"^""`. So either it's a mistake that file! accepts escaping or there is a bug in the lexer.
    ```
    >> "^""
    == {"}
    >> %"^""
    *** Syntax Error: (line 1) invalid string at "
    *** Where: set
    *** Stack: load
    ```
    
    If it's a bug, then I'm Ok with this solution: `to file! {1: '"2"} -> %"1: '^"2^""`.
    
    IMHO accepts escaping in file! adds more mental overhead. One more rule to be membered. `%"^(33)"` is a valid filename, if I want to type it in the red console I have to type `%"^^(33)"`.

--------------------------------------------------------------------------------

On 2022-04-14T15:14:07Z, Oldes, commented:
<https://github.com/red/red/issues/4060#issuecomment-1099289310>

    I believe that these listed chars should be escaped:
    ```red
    >> repeat i 255 [c: to-char i f2: try [load x: mold f1: append copy %a c] if f1 <> f2 [print [i tab mold c tab mold x]]]
    10 	#"^/" 	{%"a^/"}
    34 	#"^"" 	{%"a""}
    40 	#"(" 	"%a("
    41 	#")" 	"%a)"
    58 	#":" 	"%a:"
    64 	#"@" 	"%a@"
    94 	#"^^" 	{%"a^^"}
    ```


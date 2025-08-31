
#3581: extra processing of script args
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
<https://github.com/red/red/issues/3581>

**Describe the bug**
`'` (apostrophes) inside command line arguments (when paired) become curly braces `{}` (as shown below);
and in script path double apostrophe sometimes become single (see :point_up: [#bugs October 31, 2018 4:39 PM](https://gitter.im/red/bugs?at=5bd9b0aa26be6b597948075f) ).
Probably not limited to apostrophes??

**To Reproduce**
Script `ticket26.red`:
```
Red []
? system/script/args
? system/options/args
? system/options/path
```
Make a directory `'test'''dir'`, put the script inside, run it from this dir as `red "ticket26.red" "'test'''arg'"` 
Results in:
```
SYSTEM/SCRIPT/ARGS is a string! value: "{test}{}arg'"
SYSTEM/OPTIONS/ARGS is a block! value.  length: 3  ["test" "" "arg'"]
SYSTEM/OPTIONS/PATH is a file! value: %/D/devel/red/redjunk/'test'''dir'/
```

**Expected behavior**
```
SYSTEM/SCRIPT/ARGS is a string! value: "'test'''arg'"
SYSTEM/OPTIONS/ARGS is a block! value.  length: 1  ["'test'''arg'"]
SYSTEM/OPTIONS/PATH is a file! value: %/D/devel/red/redjunk/'test'''dir'/
```

**Platform version(please complete the following information):**
```
Red 0.6.3 for Windows built 30-Oct-2018/9:30:29+03:00 commit #a5dc0e1
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-31T14:06:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/3581#issuecomment-434700127>

    of some relation to this problem: https://github.com/red/red/issues/2772

--------------------------------------------------------------------------------

On 2018-11-20T21:33:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/3581#issuecomment-440437103>

    I've looked into this issue myself. Commit https://github.com/red/red/commit/2f82e3ae82c7bbd27ddca20f9b2bc319374b873d by @dockimbel introduced passing command line arguments to the Red script. However the solution was obviously temporary as it is both simple and incomplete.
    
    This issue arose from `split-tokens` (https://github.com/red/red/blob/master/red.r#L265), used by the Red executable to parse arguments, making too many assumptions about arguments format, then passing the malformed arguments list to `form-args` (https://github.com/red/red/blob/master/red.r#L322) to glue it back together and feed to the proper Console executable.
    
    However just by looking at the code of both functions one may imagine a whole lot of new ways of breaking it.
    
    Here's a quick list of problems:
    
    1. The algorithm is totally incompatible with both Windows' CmdLineToArgV and C's standard routines. So in effect the argument parsing results between R/S .exe, Red .exe, `red script.red` and even `console script.red` **are all different**. Nor does this follow the standards of the platform it's being executed on, so the result is always unexpected save for very simple and conservative scenarios.
    2. Argument format of today is it's own DSL, that will be really hard to interface with, as each argument will have to be reformatted in some cryptic way before it will be passed to the interpreter, if the running script is to make any sense of these arguments.
    3. It's undocumented.
    4. It appears in both Rebol (aforementioned `red.r`) and Red (https://github.com/red/red/blob/master/environment/functions.red#L685) parts of the code, so any changes will have to be kept in sync.
    5. As stated above, command line goes thru the `parse-args` and then thru `form-args` stages, an approach that can not guarantee the preservation of the original command line formatting.
    6. The `form-args` algorithm implies (or maybe tries to mimick) unix arguments formatting and simply can not work on Windows, as Windows doesn't give any special meaning to the apostrophe.
    7. The `split-tokens` algorithm on top of that and a few more assumptions, does some really cryptic thing: it replaces some quotes with curly braces.
    
    It's even possible to pass a *single* string to Red using *multiple* command line arguments:
    ```
    > test-args.exe { 1 2 }             ;-- compiled Red script
    system/script/args = "{ 1 2 }"
    system/options/args = [" 1 2 "]
    ```
    
    Now I intend to make this all consistent. I'd like to let OS routines do the job of argument splitting and joining as this is the most reliable way, also forward-compatible. Discard the current code and write one from scratch. But I can't help but notice that this all was made on purpose. 
    
    So my question to @dockimbel is: was there a meaning to this whole DSL that I should preserve or was it simply a temporary clutch? In other words, what course of action is advised if I intend to make an accepted PR?

--------------------------------------------------------------------------------

On 2018-12-18T12:16:16Z, dockimbel, commented:
<https://github.com/red/red/issues/3581#issuecomment-448201002>

    A clean-up on arguments parsing is more than welcome. As long as platform rules are respected, it should be fine I guess. So, go for it!

--------------------------------------------------------------------------------

On 2018-12-18T12:30:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/3581#issuecomment-448204606>

    Thanks for your review @dockimbel ☺

--------------------------------------------------------------------------------

On 2018-12-18T19:45:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3581#issuecomment-448345773>

    @hiiamboris I have an old CLI dialect experiment, which ignored the OS issues--simply `load`ing the string and treating it as Redbol data, for purposes of experimentation on the dialect. So I'm interested in this as well. I can put my old stuff in a gist at some point. It was built in R2, and likely needs some fixing for Red.


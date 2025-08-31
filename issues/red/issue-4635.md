
#4635: single quotes in system/script/args
================================================================================
Issue is open, was reported by loziniak and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/4635>

There are excessive single quotes around command line arguments, when executing scripts.

**To reproduce**
```
% ./red-20aug20-151e6088e erterte
*** Access Error: cannot open: erterte
*** Where: read
*** Stack: 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> probe system/script/args
"'erterte'"
== "'erterte'"
```

**Expected behavior**
No single quotes:
```
>> probe system/script/args
"erterte"
== "erterte"
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Linux built 20-Aug-2020/10:36:25+02:00 commit #151e608
```



Comments:
--------------------------------------------------------------------------------

On 2020-08-20T14:45:25Z, loziniak, commented:
<https://github.com/red/red/issues/4635#issuecomment-677710120>

    Link to `red/bugs` gitter discussion:https://gitter.im/red/bugs?at=5f3d2c2e5d0f8f24407efb31
    
    Probably related to: #3581, #3870

--------------------------------------------------------------------------------

On 2020-08-20T17:22:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/4635#issuecomment-677795711>

    IIRC this happens because `red` launcher rebuilds the argument list when it invokes the console. Run the console or compiled binary directly and you shouldn't have this. Technically it's just a simplification, which produces a correct result (system/options/args will treat `erterte` and `'erterte'` in the same manner). It is possible to process original args, save each argument's starting and ending position, remove `--catch` and other flags that are meant for `red` launcher only, and then rebuild the command line as it was originally written, but nobody has done this for there was no pressing need.

--------------------------------------------------------------------------------

On 2020-08-21T13:36:11Z, loziniak, commented:
<https://github.com/red/red/issues/4635#issuecomment-678294227>

    Unfortunately, It's the same when compiled.
    ```
    Red [file: %args_quotes.red]
    probe system/script/args
    ```
    `./red-20aug20-151e6088e -r args_quotes.red`
    ```
    % ./args_quotes dsdf
    "'dsdf'"
    ```

--------------------------------------------------------------------------------

On 2020-08-21T18:10:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4635#issuecomment-678421287>

    Then it must be happening because on Linux you don't have the original command line, only `**argv`. So `system/script/args` is fictional in any case there.


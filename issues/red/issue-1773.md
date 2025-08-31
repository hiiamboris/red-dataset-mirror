
#1773: Script filenames starting with `--` wrongly processed on command-line
================================================================================
Issue is closed, was reported by ghost and has 18 comment(s).
[type.review]
<https://github.com/red/red/issues/1773>

Creating a file named `--asd.red` with the following content

```
Red []
print 1
```

And then from the Command Prompt -
`red --cli --asd.red` gives output `1`.
But `red --asd.red` produces no output at all in the GUI Console. 

See http://i.imgur.com/TGcg0G8.gifv



Comments:
--------------------------------------------------------------------------------

On 2019-05-12T15:42:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/1773#issuecomment-491606298>

    Looks like this is intentional: https://github.com/red/red/blob/8d712e4ba1b16e1b7a339006d1154aebc9cb7ce4/environment/console/engine.red#L55
    Each `--thing` is treated as an option. Should we add a `--` switch that will toggle it off?

--------------------------------------------------------------------------------

On 2019-05-13T16:53:36Z, greggirwin, commented:
<https://github.com/red/red/issues/1773#issuecomment-491902171>

    I don't have notes in my old CLI stuff (which is also on my short list of things I think Red would benefit from) about that ever being an issue. @hiiamboris is there any precedent for a toggle switch like that? It seems better to tell people "Don't do that.", because it will make for ugly command lines, which could also be used to hide calls to malicious scripts.

--------------------------------------------------------------------------------

On 2019-05-13T16:55:34Z, greggirwin, commented:
<https://github.com/red/red/issues/1773#issuecomment-491902848>

    It's something to keep in mind for a CLI dialect, but this isn't something we'd need to change due a large set of legacy scripts that need it.

--------------------------------------------------------------------------------

On 2019-05-13T17:06:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/1773#issuecomment-491906608>

    @greggirwin 
    > is there any precedent for a toggle switch like that?
    
    https://unix.stackexchange.com/a/11382
    
    I'd add that virtually every compression utility has `--`.

--------------------------------------------------------------------------------

On 2019-05-13T19:34:01Z, greggirwin, commented:
<https://github.com/red/red/issues/1773#issuecomment-491956097>

    Now I see what you mean by "toggle", and yes, using `--` to mark the end of options seems like a good idea.

--------------------------------------------------------------------------------

On 2019-05-13T19:35:51Z, greggirwin, commented:
<https://github.com/red/red/issues/1773#issuecomment-491956615>

    If it were bash specific, I'd hesitate, but it's a Posix guideline as well.

--------------------------------------------------------------------------------

On 2019-05-14T19:31:38Z, qtxie, commented:
<https://github.com/red/red/issues/1773#issuecomment-492377723>

    I think we should check if it's an valid option, if not we take it as a normal argument.

--------------------------------------------------------------------------------

On 2019-05-14T20:24:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/1773#issuecomment-492395735>

    @qtxie Wouldn't it be better if we rather complain that the option is invalid? Having `--filenames` is pretty uncommon and if the option is not a valid one then most likely it's a user's typo, or usage of a deprecated option.

--------------------------------------------------------------------------------

On 2019-05-14T22:42:05Z, greggirwin, commented:
<https://github.com/red/red/issues/1773#issuecomment-492437617>

    Is there a standard/expected behavior we can follow? My gut says that allowing them to pass through, and be interpreted as operands, is a bad idea. But Postel's Law favors robustness over debuggability. For Red proper this may not be a showstopper, but for our CLI dialect/lib we want to consider it. 


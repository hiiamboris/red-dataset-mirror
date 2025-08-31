
#3602: Proposal: Should we add a `.gitattributes` file to easy pain with line endings on Windows?
================================================================================
Issue is closed, was reported by x8x and has 20 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/3602>

It sure happened before that some Windows users made a PR just to find out all line endings were wrong before submitting.

It seams that on Windows, different sauces of git tools configure line endings conversion settings differently, adding a `.gitattributes` file would enforce per repo settings and bypass users/tools custom settings avoiding issues altogether.

Looking at big repos, there doesn't seam to be consensus around this, some projects have it some do not, some use catch all rules, some do specify per file's extension settings.

Do we trust git heuristic to determine binary vs text files and just use:
`* text=auto` (facebook's [react](https://github.com/facebook/react/blob/master/.gitattributes) uses this since 18 Jan 2014, should suggests it worked out well since then or they would have updated it) or should we make it more specific but will have to remember to check if/when we add more files in which case we could also use a shorter version by defining a default for `text` files first and later specifying binaries (this would also set a default for files without extensions).
```
* text=auto
*.png  binary
*.gif  binary
*.jpg  binary
*.jpeg binary
*.ico  binary
```

References:
- https://www.git-scm.com/docs/gitattributes
- https://adaptivepatchwork.com/2012/03/01/mind-the-end-of-your-line/ (from @endo)
- https://help.github.com/articles/dealing-with-line-endings/ (from @endo)



Comments:
--------------------------------------------------------------------------------

On 2018-11-21T23:13:08Z, x8x, commented:
<https://github.com/red/red/issues/3602#issuecomment-440844484>

    @endo64 The Atom team have this for shell scripts:
    ```
    # Windows bash scripts are also Unix LF endings
    *.sh		eol=lf
    ```
    see [here](https://github.com/atom/atom/blob/master/.gitattributes).
    
    Is that true? shell scripts on Windows use LF ?

--------------------------------------------------------------------------------

On 2018-11-21T23:36:27Z, endo64, commented:
<https://github.com/red/red/issues/3602#issuecomment-440850526>

    @x8x Windows shell scripts (`.bat` files) use `CRLF`, but when you install Cygwin or similar you can have `.sh` files executed with `bash` on Windows. Those `.sh` files should have `LF` even though they are on Windows OS.
    
    And we have some `.sh` files in the repo inside `tests` folder, so yes it is a good idea to have `*.sh eol=lf`.

--------------------------------------------------------------------------------

On 2018-11-21T23:46:17Z, endo64, commented:
<https://github.com/red/red/issues/3602#issuecomment-440852066>

    About having `.gitattribute` file I'm for it. But not sure about just using `* text = auto`, we can add it in the first line to make it default, but better to put some binary file extensions explicitly looks safer to me.
    
    Here is some info about how Git detects binary: https://stackoverflow.com/a/7112964
    
    > Git usually guesses correctly whether a blob contains text or binary data by examining the beginning of the contents - It checks for any occurrence of a zero byte (NUL “character”) in the first 8000 bytes.

--------------------------------------------------------------------------------

On 2020-03-22T11:24:57Z, 9214, commented:
<https://github.com/red/red/issues/3602#issuecomment-602184279>

    Would anyone like to follow-up on this? I think there's enough research here to make an informed PR.

--------------------------------------------------------------------------------

On 2020-04-20T10:02:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3602#issuecomment-616444618>

    IIRC, we have rejected the inclusion of a `.gitattribute` file in the repo in the past, because it was leading to issues for some users on their specific system. 
    
    In other words, if that `.gitattribute` file can be made to not break anyone's git settings, then go for it. But I understand that some projects avoid including it as it can't be made universal, though I haven't researched much on that.

--------------------------------------------------------------------------------

On 2020-04-21T10:30:16Z, endo64, commented:
<https://github.com/red/red/issues/3602#issuecomment-617095053>

    I'll investigate further to see if it has any harm, most documents I read on the Internet suggest using `.gitattributes` file but I'll search for issues & problems specifically.

--------------------------------------------------------------------------------

On 2020-04-25T23:08:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3602#issuecomment-619452532>

    What I understand is that some users already use a custom `.gitattributes` file on their local Red repo, so imposing one would conflict.

--------------------------------------------------------------------------------

On 2020-04-25T23:27:32Z, endo64, commented:
<https://github.com/red/red/issues/3602#issuecomment-619454283>

    There are two issues about using `.gitattributes` file:
    First, as you said a user may have it locally, but in that case he/she should merge with the one coming from the repo if one provided.
    Second, his/her git client may not use/respect the `.gitattributes` file. Nothing to do about it.
    
    It usually advised to use `.gitattributes`.
    
    We can put it to the repo or we can provide a sample file `.gitattributes-sample` and advice users to have it locally in the contribution guide.

--------------------------------------------------------------------------------

On 2020-09-22T17:21:55Z, dockimbel, commented:
<https://github.com/red/red/issues/3602#issuecomment-696862733>

    > First, as you said a user may have it locally, but in that case he/she should merge with the one coming from the repo if one provided.
    
    That would be a major PITA for those users, as that would create a merge commit each time in their commit history and making it painful to post a PR then against red's repo.
    
    > We can put it to the repo or we can provide a sample file .gitattributes-sample and advice users to have it locally in the contribution guide.
    
    That seems like a wiser option to me.

--------------------------------------------------------------------------------

On 2020-09-27T18:29:15Z, endo64, commented:
<https://github.com/red/red/issues/3602#issuecomment-699670555>

    @dockimbel I've updated the related PR.


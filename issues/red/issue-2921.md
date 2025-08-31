
#2921: Missing .gitignore?
================================================================================
Issue is closed, was reported by southwolf and has 16 comment(s).
<https://github.com/red/red/issues/2921>

After running `rebol ./run-all.r`, I got these files

```
crush.dylib
quick-test/quick-test.log
quick-test/runnable/
system/tests/source/units/auto-tests/
tests/source/units/auto-tests/
```

It will be more clear if we have a `.gitignore` file to ignore such files, am I right?


Comments:
--------------------------------------------------------------------------------

On 2017-07-24T02:58:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2921#issuecomment-317307559>

    Usually, it is used only locally in your working folder, but it depends on the kind of git client you use. I personally don't use a `.gitignore` file at all (TortoiseGit client here) and I don't think most people in the Red team use one. Adding one to the red/red repo would create problems, as most people will customize it, and submit a custom version of that file along with their PR (we had such cases in the past), so I definitely think it's more convenient to keep it locally only.
    
    Eventually, you could submit your `.gitignore` file for Red to https://github.com/github/gitignore so that we can put a link to it in our README for contributors to use it as a template if they need one.

--------------------------------------------------------------------------------

On 2017-07-24T03:57:10Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2921#issuecomment-317313561>

    I do have a `.gitignore` file, among many other things it does include:
    ```
    quick-test/quick-test.log
    quick-test/runnable/
    system/tests/source/units/auto-tests/
    tests/source/units/auto-tests/
    crush.dll
    ```
    
    Specifically, it also includes `.gitignore` itself to avoid the problem of it being over-written by a `.gitignore` file in the repository or clobbering somebody else's.
    
    Having a sample `.gitignore` file seems a good idea.
    
    

--------------------------------------------------------------------------------

On 2018-03-17T09:55:29Z, dockimbel, commented:
<https://github.com/red/red/issues/2921#issuecomment-373908185>

    @PeterWAWood Could you (or @9214, @greggirwin) please post a gitignore file to https://github.com/github/gitignore for Red, and reference it in the README?

--------------------------------------------------------------------------------

On 2018-03-17T18:37:39Z, 9214, commented:
<https://github.com/red/red/issues/2921#issuecomment-373942739>

    @dockimbel the one in @southwolf's PR? How README file should be updated, specifically?

--------------------------------------------------------------------------------

On 2018-03-17T23:15:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2921#issuecomment-373959938>

    @dockimbel I will pd this later today or tomorrow. 
    
    I will need to change some of my work processes to account for a .gitignore file in the repo. The first entry in my .gitignore file is .gitignore :-)
    
    @9214 The .gitignore file in this PR is not sufficient as it is for macOS only.

--------------------------------------------------------------------------------

On 2018-03-18T04:40:39Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2921#issuecomment-373972584>

    @dockimbel I misread your request and prepared a .gitignore file for the red repo :-(
    
    git does provide a way to have a repo wide .gitignore and to ignore other files locally (by using .git/info/exclude).
    
    I got as far as committing the change and have now reverted it.
    
    I will submit a PR to the GitHub/gitignore repo instead :-)

--------------------------------------------------------------------------------

On 2018-03-18T11:02:35Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2921#issuecomment-373989222>

    I've submitted a PR to the GitHub/gitignore repo and made a note in the red repo README. 

--------------------------------------------------------------------------------

On 2018-03-19T03:43:58Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2921#issuecomment-374092939>

    I have add a .gitignore-sample file to the red repository.


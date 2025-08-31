
#2607: `map!` should be excluded from `insert` allowed datatypes
================================================================================
Issue is closed, was reported by toomasv and has 12 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2607>

```
>> probe :insert
make action! [[
    {Inserts value(s) at series index; returns series past the insertion} 
    series [series! bitset! map!] 
...
```

But map! is not allowed as series:

```
>> insert #() [a b] 
*** Script Error: insert does not allow map! for its series argument
*** Where: insert
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-21T15:49:00Z, dockimbel, commented:
<https://github.com/red/red/issues/2607#issuecomment-296228270>

    Thanks! The `map!` word just need to be removed from the list of accepted types for `insert` (and `append` too). Would you like to submit a Pull Request with those changes?

--------------------------------------------------------------------------------

On 2017-04-21T15:50:43Z, toomasv, commented:
<https://github.com/red/red/issues/2607#issuecomment-296228740>

    I have never submitted a Pull Request. What should I do?

--------------------------------------------------------------------------------

On 2017-04-21T16:03:50Z, ghost, commented:
<https://github.com/red/red/issues/2607#issuecomment-296232218>

    @toomasv Fork this repo. Do the changes in your fork. There will be a button "New Pull Request", click on that and tada...

--------------------------------------------------------------------------------

On 2017-04-21T16:04:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2607#issuecomment-296232437>

    Two ways to do it:
    * If you don't have a git client installed and if it's a minor change in a single file, you can just "fork" the red/red repository using the [Fork] button on github, then navigate in your copy of the red repo to the right file, click on it, then on file's header, there is a pen icon ("Edit this file"), click on it. Then just make the changes and save it. After that you need to make the Pull Request, which is explained [here](https://help.github.com/articles/creating-a-pull-request/).
    * Using a git client, fork the red/red repo, clone your red repo locally, make the changes to your fork, push it online, then create a Pull Request as explained [here](https://help.github.com/articles/creating-a-pull-request/).

--------------------------------------------------------------------------------

On 2017-04-21T16:12:43Z, toomasv, commented:
<https://github.com/red/red/issues/2607#issuecomment-296234490>

    I submitted the Pull Request. Please comment if it was done correctly.

--------------------------------------------------------------------------------

On 2017-04-21T16:42:29Z, dockimbel, commented:
<https://github.com/red/red/issues/2607#issuecomment-296242129>

    Thanks!



#44: Questionable `save` behavior
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
<https://github.com/red/REP/issues/44>

## I. `load` and `save/all` are unbalanced:
```
>> save/all %tmpfil [1]  load %tmpfil
== 1     ; load w/o /all = wrong on blocks
>> save/all %tmpfil 1  load/all %tmpfil
== [1]    ; load with /all = wrong on values
```
In other words, saved data cannot reliably loaded back.
Note that it's first and foremost a problem with `save`: it does not preserve the given value:
```
>> save/all %tmpfil [1]  read %tmpfil
== "1^/"
```
It's also inconsistent with `mold`:
```
>> mold/all [1]
== "[1]"
>> mold [1]
== "[1]"
```
Save works as (and by means of) `mold/only`. I propose that `save` should instead have an optional `/only` refinement to provide a basis for some truth invariants:
1) between `save` and `mold`: 
∀x `(save %1 :x  read %1) = (write %1 mold :x  read %1)`
∀x `(save/all %1 :x  read %1) = (write %1 mold/all :x  read %1)`
∀x `(save/only %1 :x  read %1) = (write %1 mold/only :x  read %1)`
∀x `(save/all/only %1 :x  read %1) = (write %1 mold/all/only :x  read %1)`
∀x `(save none :x) = (to-binary mold :x)`
∀x `(save/all none :x) = (to-binary mold/all :x)`
∀x `(save/only none :x) = (to-binary mold/only :x)`
∀x `(save/all/only none :x) = (to-binary mold/all/only :x)`
(an extra newline char of difference is allowed, but otherwise I would expect the result to be the same on both ends)
2) between `save` and `load`:
∀x `(save/all %1 :x  load %1) = :x`
∀x `(load save/all none :x) = :x`

## II. Saving to a string
I couldn't deduce why `save` supports a string as a target when there's `mold`. To save directly into a binary, one can provide a binary. If target is a string, it will produce a binary and then convert it into a string:
```
>> save "" 'junk
== "#{6A756E6B}"
```
To get the original it will require two loads:
```
>> load load save/all "" 'junk
== junk
```
What is the use case for this? Or just a bug in `save`?


Comments:
--------------------------------------------------------------------------------

On 2019-02-27T19:38:10Z, greggirwin, commented:
<https://github.com/red/REP/issues/44#issuecomment-468000822>

    Things changed between R2 and R3, and I know this topic has come up in the past, so R3 may have tried to address it. We should also note that `save/all` is TBD in Red. That's because `mold/all` is still TBD, because construction/serialized syntax hasn't been finalized yet.
    
    R2
    ```
    >> save %r2-save.dat [1]
    >> read %r2-save.dat
    == "[1]"
    
    >> save/all %r2-save-all.dat [1]
    >> read %r2-save-all.dat
    == "[1]"
    ```
    R3
    ```
    >> save %r3-save.dat [1]
    >> read/string %r3-save.dat
    == "1^/"
    
    >> save/all %r3-save-all.dat [1]
    >> read/string %r3-save-all.dat
    == "1^/"
    ```
    In R3 you get a block back only if you use `load/all`.
    
    We need Nenad to tell us why `save none` is supported, as I don't see the use case for it. Saving to a string also makes little sense the way it works currently. I think it's a bug that it makes the value a binary first.
    

--------------------------------------------------------------------------------

On 2019-02-27T21:08:07Z, greggirwin, commented:
<https://github.com/red/REP/issues/44#issuecomment-468031042>

    `Save` and `load` are where I think we need the balance. When you `load` a file, you don't know if it's been saved with `/all`. When saving, you have control. You can choose not to save a block, which is likely the original intent of `load` returning a single value, not a block, in that case. *This* is where I see a different issue. In almost all cases `/only` means "treat something as a single value, but `mold` is backwards in its use of `/only`. `Mold` does match its doc string and purpose, by defaulting to inclusion of brackets on blocks, as that is their source format. While it would be a big change, I don't know how much code would be affected in reality. In the Red codebase, it would affect tests, 2 places in the `help` code and, of course `save`.

--------------------------------------------------------------------------------

On 2019-02-27T21:10:16Z, greggirwin, commented:
<https://github.com/red/REP/issues/44#issuecomment-468031801>

    That's just where `mold/only` is used though. `Mold` itself would likely be a massive, breaking change, if it didn't include brackets by default.

--------------------------------------------------------------------------------

On 2019-02-27T21:41:46Z, hiiamboris, commented:
<https://github.com/red/REP/issues/44#issuecomment-468042114>

    > In R3 you get a block back only if you use load/all
    
    Yes. The problem is - with load/all you get the block regardless of whether it was there (in the file) or not:
    ```
    >> save %1 1  load/all %1
    == [1]
    ```
    This is for both Rebol and Red. So `load/all` simply does not load what was saved. Thus, only useful when one knows exactly what one is loading.
    
    > When you load a file, you don't know if it's been saved with /all
    
    If you don't know that then the loaded data will probably be wrong anyway:
    ```
    >> save %1 none  type? load %1
    == word!
    ```
    So I guess it's okay to assume that the coder was proficient enough with Red to use `save/all` :)
    
    I don't see here any opportunity to balance `load` and `save` (without `/all`), without breaking Rebol compability on a deep level.
    
    @greggirwin I seem to have lost you ☺, what change to mold are you talking about there?

--------------------------------------------------------------------------------

On 2019-02-27T21:55:13Z, greggirwin, commented:
<https://github.com/red/REP/issues/44#issuecomment-468046363>

    Just brainstorming and flowing thoughts. Ideally, things would be balanced, but I don't see any easy way to do that either. 
    
    We still have another TBD piece in Red, with `/header`. This is article worthy, as we need to provide guidance, and maybe some helpers for people

--------------------------------------------------------------------------------

On 2019-10-29T12:48:41Z, hiiamboris, commented:
<https://github.com/red/REP/issues/44#issuecomment-547402908>

    I'd like to add here a statistic on some refinements and their meanings.
    
    ## /only
    
    1. Treat a block argument as a single value - find, select, insert, append, repend, change
    2. Retain blocks as they are, do not inline them - compose
    3. (this is backwards, but is still in the line) Unpack block into values - mold
    1. (not block-related but "only" has a meaning) Affect a specific window - unview
    1. (new meaning: limits the action) Return block rather than a face object - layout, rtd-layout
    1. (same meaning, but no idea what "only" stands for here) Do not prepend the current directory - clean-path
    4. (this is totally off) Do not modify, pick a value - random
    
    ## /all
    
    1. Traverse the whole series rather than stopping on the first success - trim, replace, new-line
    2. All fields in the record (defined by /skip) should be used - sort
    3. Close all windows - unview
    3. (totally different meaning, not hinted by the name "all") Use serialized format - mold, save
    4. (what a mess - this should be called "/only") Wrap single values in a block - load

--------------------------------------------------------------------------------

On 2020-06-15T18:55:56Z, meijeru, commented:
<https://github.com/red/REP/issues/44#issuecomment-644317164>

    `/all` with `case`: check all alternatives, do not stop after the first true one


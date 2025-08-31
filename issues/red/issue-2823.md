
#2823: [VID] `TITLE, `SIZE, `BACKDROP should not be able to used as variables in VID.
================================================================================
Issue is open, was reported by JenniferLee520 and has 10 comment(s).
[type.documentation] [GUI]
<https://github.com/red/red/issues/2823>

In the following case, TITLE should not be used as a word bound to a string. I was expecting an runtime error. 
```Red
title: "name"
view [ field hint title ]
```


Comments:
--------------------------------------------------------------------------------

On 2020-03-21T19:46:29Z, 9214, commented:
<https://github.com/red/red/issues/2823#issuecomment-602094220>

    https://github.com/red/red/issues/2825

--------------------------------------------------------------------------------

On 2020-07-14T16:18:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/2823#issuecomment-658275229>

    Why an error?

--------------------------------------------------------------------------------

On 2020-07-14T16:23:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/2823#issuecomment-658277855>

    I propose we close this one, as a Red expression is expected after named options.

--------------------------------------------------------------------------------

On 2020-07-14T17:34:59Z, 9214, commented:
<https://github.com/red/red/issues/2823#issuecomment-658313920>

    > Red expression is expected after named options.
    
    Minor clarification: this is true only for `at`, `extra`, `data` and `draw` keywords. All the others expect a single value.
    
    I agree on closing this ticket, with the caveat that `fetch-expr` and `fetch-argument` in VID implementation need to be properly documented for all keywords, perhaps on a wiki page.

--------------------------------------------------------------------------------

On 2020-07-14T18:05:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/2823#issuecomment-658328956>

    OK. I marked this for documenting then so we don't forget.


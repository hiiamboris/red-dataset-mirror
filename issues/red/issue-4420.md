
#4420: TO ANY-PATH! on objects is allowed, with nonsense result
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
<https://github.com/red/red/issues/4420>

**Describe the bug**
`to <any-path!> <object>` is not forbidden, but in fact unusable and of doubtful value anyhow

**To reproduce**
```
>> to-path object [a: 1]
== make object! [a: 1]    ; of type path! see proof below
>> type? to-path object [a: 1]
== path!
>> to-lit-path object [a: 1]
== 'make object! [a: 1]    ; of type lit-path!, notice the decoration
>> to-set-path object [a: 1]
== make object! [a: 1]:     ; same comment
>> to-get-path object [a: 1]
== :make object! [a: 1]    ; same comment
```
**Expected behavior**
An error should be raised in all four cases

**Platform version (please complete the following information)**
```
All, presumably
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-29T10:01:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4420#issuecomment-621104410>

    Why an error? It's a valid path for selection:
    ```
    >> o: object [a: 1]
    == make object! [
        a: 1
    ]
    >> b: reduce [o 420]
    == [make object! [
        a: 1
    ] 420]
    >> do head insert to path! o 'b       ;) b/o constructed programmatically
    == 420
    ```

--------------------------------------------------------------------------------

On 2020-04-29T13:45:59Z, meijeru, commented:
<https://github.com/red/red/issues/4420#issuecomment-621218487>

    Looks very contrived. But I hope you agree that the `set-`, `lit-` and `get-` versions are nonsensical, because they are illegal source code. 

--------------------------------------------------------------------------------

On 2020-04-29T13:51:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4420#issuecomment-621222782>

    See this post on design behind paths https://www.reddit.com/r/redlang/comments/86kdwr/on_words_vs_paths_confusion/dwepub6/

--------------------------------------------------------------------------------

On 2020-04-29T14:10:32Z, meijeru, commented:
<https://github.com/red/red/issues/4420#issuecomment-621236043>

    I await the team's reaction on the literals question.

--------------------------------------------------------------------------------

On 2020-04-29T21:30:48Z, greggirwin, commented:
<https://github.com/red/red/issues/4420#issuecomment-621475578>

    @meijeru, @hiiamboris showed how they can be used, but the most important thing IMO is to separate the limits of lexical forms (which future construction syntax can address, and we should remember this case when designing that), with in-memory values and how they can be used.
    
    ```
    >> o: object [a: 1]
    == make object! [
        a: 1
    ]
    >> b: reduce [to path! o  to get-path! o  to lit-path! o  to set-path! o]
    == [make object! [
        a: 1
    ] :make object! [
        a: 1
    ] 'make object! [
        a: 1
    ] make object! [
        a: 1
    ]:]
    >> parse b [some any-path!]
    == true
    >> parse b [path! get-path! lit-path! set-path!]
    == true
    >> parse b [some path!]
    == false
    ```
    Is there potential value in something like this? Sure. Is it also potentially *very* confusing if you're just playing in a console? And how!
    ```
    >> bo: reduce [o to path! o]
    == [make object! [
        a: 1
    ] make object! [
        a: 1
    ]]
    >> type? first bo
    == object!
    >> bo/1
    == make object! [
        a: 1
    ]
    >> bo/1/a
    == 1
    >> bo/2/a
    == none
    >> bo/2
    == make object! [
        a: 1
    ]
    ```
    There are pros and cons here, and Red often defaults to "Use at your own risk" when it comes to language flexibility. People can always build stricter versions on top of a flexible substrate, but not the other way around. 
    
    So, while it's hard to "picture" these paths, just as with imaginary numbers, more than 3 dimensions, or Klein bottle interiors, my vote is to allow these constructs.

--------------------------------------------------------------------------------

On 2020-05-02T13:26:41Z, meijeru, commented:
<https://github.com/red/red/issues/4420#issuecomment-622953581>

    I have adapted my spec document to make this clear.



#95: WISH: extract/width
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
<https://github.com/red/REP/issues/95>

Or whatever name is better. See #94 for background, but this will be useful in any case.

Currently `extract` is limited to *extraction of 1 item over period P*, whereas it would be more powerful if we could *extract N items over period P*:
```
>> extract/width/skip [1 2 3 4 5 6 7 8] 2 4
== [1 2 5 6]
```

Currently supported `/index` refinement OTOH is not really needed as it can be done with `skip` (but perhaps a nice convenience).


Comments:
--------------------------------------------------------------------------------

On 2021-01-25T18:53:58Z, greggirwin, commented:
<https://github.com/red/REP/issues/95#issuecomment-767036098>

    For a name `/part` makes sense. No `/width`  as that's a required parameter already. Would then also need to decide if `/part` and `/index` work together. Since `extract` is already a mezz, mocking this up should be easy.

--------------------------------------------------------------------------------

On 2021-01-25T19:07:26Z, hiiamboris, commented:
<https://github.com/red/REP/issues/95#issuecomment-767044441>

    ```
    USAGE:
         EXTRACT series width
    
    DESCRIPTION: 
         Extracts a value from a series at regular intervals. 
         EXTRACT is a function! value.
    
    ARGUMENTS:
         series       [series!] 
         width        [integer!] "Size of each entry (the skip)."
    
    REFINEMENTS:
         /index       => Extract from an offset position.
            pos          [integer!] "The position."
         /into        => Provide an output series instead of creating a new one.
            output       [series!] "Output series."
    
    ```
    `width` here is internal name and can be changed at will.
    While `/part` has a totally different meaning: to limit the extraction region (for consistency with other series functions).
    Or `/size` if you don't like `/width` ;)
    
    Ideally:
    ```
    >> extract/width/part [1 2 3 4 5 6 7 8 9 10] 4 2 5
    == [1 2 5]
    ```
    
    For a mockup see #94 
    
    Yes, /width begins from /index.

--------------------------------------------------------------------------------

On 2021-06-01T11:16:50Z, GalenIvanov, commented:
<https://github.com/red/REP/issues/95#issuecomment-852042617>

    I had a similar [wish](https://gitter.im/red/red?at=5eeb09fc3a0d3931fa9c1938)
    
    The motivation is to have an easy way of splitting series into regular chunks (overlapping if needed).

--------------------------------------------------------------------------------

On 2021-06-01T11:25:44Z, hiiamboris, commented:
<https://github.com/red/REP/issues/95#issuecomment-852047445>

    @galenivanov at a glance, extraction of  overlapping chunks seems to be a rare use case. What do you think?

--------------------------------------------------------------------------------

On 2021-06-01T19:24:40Z, GalenIvanov, commented:
<https://github.com/red/REP/issues/95#issuecomment-852386764>

    @hiiamboris I agree that overlaping chunks are not used very often. A possible case is a filter-like code, that needs to know the neighbours of a value (usually done for large sets of data - needs a low-level implementation). My idea is that overlapping comes at no cost, when the `part` argument is bigger than the `skip` argument.

--------------------------------------------------------------------------------

On 2023-06-23T15:21:16Z, hiiamboris, commented:
<https://github.com/red/REP/issues/95#issuecomment-1604437135>

    https://github.com/red/red/discussions/5340


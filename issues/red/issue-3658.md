
#3658: argument type for source function is too wide
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
<https://github.com/red/red/issues/3658>

**Describe the bug**
The argument type for the `source` function is `[any-word! any-path]` but in the body of source the argument is supplied to `get/any` which only allows `[word! path!]`. Thus `source` can restrict its argument also to these two types.

**To Reproduce**
>> source 'add
*** Script Error: get does not allow lit-word! for its word argument
*** Where: get

**Expected behavior**
```
source: func ["Print the source of a function" 
    'word [word! path!] "The name of the function" 
    /local val
...
```
**Platform version(please complete the following information):**
```
Presumably all
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-12T20:42:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3658#issuecomment-446736418>

    I thought at first that this was related to lit-arg evaluation changes from R2 to Red, but it seems not. @9214, thoughts?

--------------------------------------------------------------------------------

On 2018-12-12T20:54:33Z, meijeru, commented:
<https://github.com/red/red/issues/3658#issuecomment-446740065>

    I cannot even see a use case for other than word/path.

--------------------------------------------------------------------------------

On 2018-12-13T06:33:12Z, 9214, commented:
<https://github.com/red/red/issues/3658#issuecomment-446857972>

    @greggirwin `set` accepts `any-word!` and `path!`, while `get` accepts only `word!` and `path!`. There might be a historical argument for that, but I think relaxing rules and allowing `any-word!` and `any-path!` for both natives might be a good idea (which I had in my head a while back).
    
    In fact, R3 follows a relaxed set of rules that I propose.
    
    Another thing is that `'quoted` arguments can be escaped with  `paren!`, `get-path!` or `get-word!` value. `:hard-quoted` arguments have no escape mechanism. That is, supplying  `get-path!` and `get-word!` argument with `'word [any-word! any-path!]` spec makes little sense, as they'll be escaped.
    
    So, two ways:
    1. Follow @meijeru's proposal and restrict typeset to `[word! path!]`;
    1. Relax `get` and `set`, change `source` spec to `:word [any-word! any-path!]`.
    
    I'd go with the former, but considered changes in the latter outside the scope of this issue.
    
    `source` is used solely for learning and debugging purposes, not for run-time inspection. It's a "type-only" function in the same category as `cd` or `help`, used mostly in a REPL session — and one types `source foo`, not `source :foo` or whatnot. I'm with @meijeru on that and don't see any other use-case aside from `word!` and `path!`.
    
    But, as I said, `source` is used for learning a debugging, that is, newcomers and beginners are the target audience. In that light, I propose to choose the golden path and settle down on:
    ```
    :word [word! path!]
    ```
    
    To avoid potential confusion related to the [rules](https://github.com/red/red/wiki/[DOC]-Guru-Meditations#literal-arguments-and-get-arguments) of `'quoted` arguments — `source` just gets a value that we give it literally, and, in case of typeset mismatch, provides a meaningful error message.

--------------------------------------------------------------------------------

On 2019-01-03T18:57:55Z, meijeru, commented:
<https://github.com/red/red/issues/3658#issuecomment-451242122>

    I suppose this can be closed now.

--------------------------------------------------------------------------------

On 2019-01-05T04:31:27Z, greggirwin, commented:
<https://github.com/red/red/issues/3658#issuecomment-451626938>

    Closing this. @9214, notes on path handling, from your analysis above, would make a great to-do list item for you. 


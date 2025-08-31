
#650: Refinement may start with digit, its use is problematic
================================================================================
Issue is closed, was reported by meijeru and has 26 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.design]
<https://github.com/red/red/issues/650>

Simplest example:

f:  func [/1][]
f/1

This gives a compiler internal error in comp-call



Comments:
--------------------------------------------------------------------------------

On 2016-09-12T05:42:51Z, rebolek, commented:
<https://github.com/red/red/issues/650#issuecomment-246254629>

    Still problem in 0.6.1:
    
    ## Interpreter
    
    ```
    red>> f: func [/1][]
    == func [/1][]
    red>> f/1
    *** Script Error: f has no refinement called 1
    *** Where: f
    red>> ? f
    
    USAGE:
        f  /1
    ARGUMENTS:
    
    REFINEMENTS:
         /1
    ```
    
    ## Compiler
    
    Compiles without errors, when run, throws this message:
    
    ```
    *** Script Error: path none is not valid for unset! type
    *** Where: probe
    *** Stack: set func probe
    ```

--------------------------------------------------------------------------------

On 2018-12-23T21:00:33Z, endo64, commented:
<https://github.com/red/red/issues/650#issuecomment-449662967>

    `Script Error: f has no refinement called 1` on interpreter, but I see no error on compiled executable. 

--------------------------------------------------------------------------------

On 2018-12-24T00:55:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/650#issuecomment-449673189>

    `1.red`:
    ```
    Red []
    f: func [/1]
    probe f/1   
    ```
    
    ```
    > red "1.red"
    *** Script Error: f has no value
    *** Where: probe
    *** Stack: probe
    ```
    
    ```
    > red -c "1.red" & 1.exe
    ...
    *** Runtime Error 1: access violation
    *** at: 1003C218h
    ```
    W7

--------------------------------------------------------------------------------

On 2018-12-24T08:58:18Z, endo64, commented:
<https://github.com/red/red/issues/650#issuecomment-449705384>

    @hiiamboris Where is your function's body?
    Could you test with this one on W7?
    
    ```
    Red []
    f: func [/1][print "ok"]
    f/1
    ```

--------------------------------------------------------------------------------

On 2018-12-24T11:03:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/650#issuecomment-449719702>

    @endo64 right, didn't see that at night ☺ This ticket only requires compiler to report a malformed refinement just as interpreter does.

--------------------------------------------------------------------------------

On 2020-03-21T17:12:09Z, 9214, commented:
<https://github.com/red/red/issues/650#issuecomment-602074113>

    Were there any design ideas on how numeric refinements can be leveraged from a language design perspective?

--------------------------------------------------------------------------------

On 2020-03-21T20:06:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/650#issuecomment-602096811>

    There's a use case in CLI library - to support `-9`-like arguments without workarounds. Not very important. It's actually possible to get the value of that refinement with `get /1`, but no way to provide it to the function.
    
    Regardless of possible design space this may open, I'd more like refinements and any-words to be safely convertible to one another.

--------------------------------------------------------------------------------

On 2020-03-23T00:37:26Z, greggirwin, commented:
<https://github.com/red/red/issues/650#issuecomment-602306922>

    It falls into the That's Funny area, where we use numbers in paths, but say that refinements are words, and words can't start with numbers. So, to look at them superficially, it seems like it should almost all just work, like you could use `key: /2` and use that in a path as a `get-word!` segment. Humans wanting things to be easy is why we have dynamic languages and type coercion/polymorphism. But when things break down, it can become a train wreck rather than a single car accident.
    
    As with the `issue!` word-v-string design, my gut says that even though we can dream up use cases, this is one that we should disallow. I'm willing to be convinced by a strong argument though.

--------------------------------------------------------------------------------

On 2020-03-23T00:48:36Z, 9214, commented:
<https://github.com/red/red/issues/650#issuecomment-602309137>

    To be clear, I asked for cases where such refinements are used (or can be used) in function calls; [De Bruijn indices](https://en.wikipedia.org/wiki/De_Bruijn_index), argument offsets into the stack frame and inverses/obverses come to mind.
    
    ```red
    increment/-2 3 → 1 ; inverse 2 times 
    increment/0  0 → 0 ; identity
    increment/3  4 → 7 ; apply 3 times
    ```
    
    I personally used numeric refinements at least once as keys in a sort-of-a-dialect. And it's like with most of the datatypes, you have to fit them in your program's design and pick whose with the best intentionality. That also means that some of the Red datatypes are underleveraged, IMO `refinement!`s are one of them (can be found only in function's specs).

--------------------------------------------------------------------------------

On 2020-03-23T11:03:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/650#issuecomment-602524906>

    To use something like this you would have to define **all** the possible numbers as refinements to your function + be able to evaluate get-words into refinements before a function call. Right?

--------------------------------------------------------------------------------

On 2020-10-13T15:35:24Z, dockimbel, commented:
<https://github.com/red/red/issues/650#issuecomment-707825619>

    Now in such cases, both the compiler and interpreter will output an error (as in R3):
    ```
    *** Script Error: incompatible refinement: 1
    *** Where: f
    *** Stack: f
    ```

--------------------------------------------------------------------------------

On 2020-11-19T16:32:38Z, Oldes, commented:
<https://github.com/red/red/issues/650#issuecomment-730491369>

    It's still there:
    ```
    >> /1
    == /1
    >> about
    Red 0.6.4 for Windows built 18-Nov-2020/3:13:59+01:00 commit #8ee5a9f
    ```

--------------------------------------------------------------------------------

On 2020-11-19T17:36:44Z, 9214, commented:
<https://github.com/red/red/issues/650#issuecomment-730529192>

    @Oldes the ticket is concerned with numeric refinements in function's spec only.


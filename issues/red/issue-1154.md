
#1154: Interpreter: Error when calling a function with refinements not in the order they are defined
================================================================================
Issue is closed, was reported by x8x and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1154>

Evaluated function doesn't respect order of refinements:

Given the function:

``` rebol
f: function [
    /s string [string!]
    /i integer [integer!]
][]
```

This works:

``` rebol
red>> f/s/i "a" 1
```

while this returns an error:

``` rebol
red>> f/i/s 1 "a"
*** Script error: f does not allow integer for its string argument
*** Where: f
```



Comments:
--------------------------------------------------------------------------------

On 2015-05-11T01:14:32Z, x8x, commented:
<https://github.com/red/red/issues/1154#issuecomment-100727795>

    Works fine if compiled.

--------------------------------------------------------------------------------

On 2015-05-12T23:29:02Z, hostilefork, commented:
<https://github.com/red/red/issues/1154#issuecomment-101459454>

    Since I have looked at Rebol's implementation for this, and puzzled a bit over how it works and how I might think it _should_ work, I will quickly summarize my notes:
    
    Currently--when arguments are pushed to the stack--the first slot after the boilerplate is the return value.  _(Rebol originally had set this value to UNSET! when the stack was being built.  In debug builds, I set it to a known "garbage value"...to catch when the code being called did not intentionally write a return value.  This garbage value must be tolerated by the garbage collector in debug builds, as it is a stack value.  Release builds just set it to UNSET!)_
    
    The subsequent slots are for each argument, refinement, and local.  _(Rebol originally chose to use the value slot for refinements to hold a TRUE or NONE cell, whereas I want to make it the word name of the refinement itself or NONE, to permit easier chaining.  e.g. `foo: func [val /only] [append/:only val [10 20]]`.  It also used refinements to specify locals, making it possible to slip locals in as ordinary parameters; whereas I use `local:` and put them *before_ the arguments and refinements on the stack so they are invisible to reflection and cannot be passed via a call or apply...and typespecs are disallowed.)*
    
    When an invocation is done the arguments are evaluated as the parameters are enumerated.  A pointer is kept to the head of the path.  If a refinement is found as enumeration proceeds, it is checked to see if it is at the head of the path.  If it is the head of the path then the path position is bumped and evaluation continues normally.  Otherwise, it bumps the param it is looking at until it finds the refinement in the param list.  If it does not, it causes an error.  If it does find it, it bumps the path position.
    
    At this state, refinements that may be used in a different order could have been skipped.  So after the parameter list has been processed in this fashion, the path is checked to see if it has reached the end.  If it is not at the end, the parameter list is restarted and it jumps to the code that does skips to the head of the argument list and searches for a refinement above.
    
    One upshot is that refinements can be specified multiple times.  Because they're writing into the same stack positions, it is only the last that has an effect...yet argument fulfillment is run as many times as the refinement is used:
    
    ```
    >> foo: func [/bar x] [print x]
    
    >> foo/bar/bar/bar 10
    ** Script error: foo is missing its x argument
    
    >> foo/bar/bar/bar 10 20 30
    30
    ```
    
    Another issue of this is that providing refinements in order they were declared will be faster.  In the worst-case of using N refinements in the reverse order from they were declared, there will be N passes over the entire argument list.  Some improvements could be made; on the first pass of visiting the first refinement, that could update the parameter pointer so future iterations for missed refinements will only look at refinements.
    
    There's also a bug in holding the path by pointer and bumping it across an argument evaluation, which is done by DO and could change the path and cause an invalid memory access (similar to the PARSE issue raised recently).  Observe:
    
    ```
    code: [foo/a/b/c bar baz mumble]
    path: first code
    foo: func [/a x /b y /c z] [print [a b c]]
    bar: func [] [clear path 10]
    baz: func [] [probe path]
    mumble: 30
    do code
    ```
    
    To keep from potentially crashing by using expired memory, the path would need to be kept as a series node and index, and re-considered at each step after the argument DO happens.
    
    ---
    
    Note: To address other issues I am suggesting a new FUNCTION! class _(all FUNCTION! types are being unified under FUNCTION!, just with different EXT bits in the header)_.  This class is called REFINED! and captures the idea of a function which has a capture of the refinements it uses in order.  So:
    
    ```
    >> appendup: :append/dup/only
    >> appendup [a b c] [d e] 2
    [a b c d e d e]
    ```
    
    This coheres path evaluation as well, as it runs in steps... APPEND is a function, and when path dispatch on a function run against a word, will return a REFINED!.  A REFINED!, when path dispatch is run on it against a word, will return another REFINED! with the added refinement.
    
    I mention it for its ramifications on this; it would solve the bug because the refined would have its own immutable series, and it would likely be the right time to cause an error on duplicate refinements.  It is unlikely that a corrected version with this feature could be as fast as today's implementation, but Red has the advantage of a compiled version that can do things like check for duplicates at compile time...and if you wanted amazing performance the interpreter wasn't giving it anyway.  Might as well behave reasonably.
    
    > "The best performance improvement is the transition from the nonworking state to the working state"
    > -- **John Ousterhout**

--------------------------------------------------------------------------------

On 2015-05-14T21:40:11Z, x8x, commented:
<https://github.com/red/red/issues/1154#issuecomment-102177941>

    +1 for refined!


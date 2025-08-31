
#3666: The accepted constructs #[<word>] are different for compiler and interpreter
================================================================================
Issue is open, was reported by meijeru and has 10 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/3666>

**Describe the bug**
Temporarily, a subset of pre-defined words may be expressed as `#[<word>]`. The lists of such words in the compiler (%lexer.r#L571) and interpreter (%environment/lexer.red#L866) are different.

**Expected behavior**
Both lists should be equal.

**Platform version (please complete the following information)**
```
All
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-16T19:05:11Z, meijeru, commented:
<https://github.com/red/red/issues/3666#issuecomment-447667538>

    I raised #652 to say that the accepted words were not a complete set of pre-defined words. To that, I got the following comment, in 2014:
    _Support for construction syntax #[...] has not been completed yet. It might be done once the new runtime lexer will be in place or later. Please do not fill tickets about it._
    This issue is not about completeness, but about consistency, and I feel justified to submit it because the runtime lexer is in place since quite a long time.

--------------------------------------------------------------------------------

On 2018-12-16T19:54:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3666#issuecomment-447670754>

    - binary! commented out in %lexer.red
    - [get-path! op! routine!] missing in %lexer.r
    - Many other types not in either lexer

--------------------------------------------------------------------------------

On 2018-12-18T14:00:13Z, dockimbel, commented:
<https://github.com/red/red/issues/3666#issuecomment-448229950>

    The `#[<word>]` syntax is only valid for a few datatypes. The others have a more complex construction syntax in form of `#[<word> ...]` and we have first to come up with the syntactic rules for `...`. So the current code in both lexers is just a work-in-progress, it does not implement the right syntax, because we haven't designed it yet.
    
    Using the R3 construction syntax could be a starting point, then we need to revisit each rule. One major design question to solve is: should the construction syntax allow literal forms that are forbidden by regular lexer rules? (e.g. invalid literal words)

--------------------------------------------------------------------------------

On 2019-01-06T12:22:34Z, meijeru, commented:
<https://github.com/red/red/issues/3666#issuecomment-451737497>

    @dockimbel On your last question: construction syntax can be considered in some way as syntactic sugar for `make`. So this question is part of the larger discussion: should `make` be allowed to construct values that could not be lexed or loaded?

--------------------------------------------------------------------------------

On 2019-01-06T18:08:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3666#issuecomment-451761840>

    It's a good question @meijeru, which leads to another one: is the lexical form the spec for a type? Once I understood Rebol more than at a basic level, I considered the lexical form syntactic sugar for `make`, which allows the most common cases to be easily expressed. This is yet another flexibility/danger feature. R2 had some edge cases that were problematic (issues with spaces, which R3 forbade entirely).
    
    Obviously some constraints are based on the internal representation, not the form at all.
    
    This is a *great* design question that few languages have to address, and would be great to get Doc's thoughts on.


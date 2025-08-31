
#2336: Can't set word to literal integer using the single quote character
================================================================================
Issue is closed, was reported by asampal and has 18 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2336>

```red
red>> foo: '3
*** Syntax Error: invalid value at "'3"
*** Where: do
red>> foo: quote 3
== 3
red>>
```


Comments:
--------------------------------------------------------------------------------

On 2016-11-18T07:55:05Z, asampal, commented:
<https://github.com/red/red/issues/2336#issuecomment-261470201>

    If there is not such thing as literal integers in Red, should `foo: quote 4` not also error? Again, why not allow quoting of integers (as seems possible using `quote`) using the single quote character? 

--------------------------------------------------------------------------------

On 2016-11-18T08:55:26Z, DideC, commented:
<https://github.com/red/red/issues/2336#issuecomment-261480286>

    Per the [Rebol documentation](http://www.rebol.com/r3/docs/datatypes/word.html#section-4), Word! can not begin by a digit.
    So `'3` or `2paper` could not be valid word!
    
    The question of `quote` behaviour is less obvious. Need Doc's answer there.

--------------------------------------------------------------------------------

On 2016-11-18T09:39:47Z, asampal, commented:
<https://github.com/red/red/issues/2336#issuecomment-261488975>

    As I was suggesting in #2337, it might not be a bad idea to allow integers to be quoted, although they are already literals. The result would be a no-op, just as when using `quote`. The rule for words not beginning with digits could still hold even with this small change.
    
    Whatever @dockimbel decides, the above case should be consistent across `quote` or '.

--------------------------------------------------------------------------------

On 2016-11-18T09:50:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2336#issuecomment-261491160>

    @asampal
    
    > why not allow quoting of integers
    
    Why should we allow it?
    What does "quoting an integer" mean?
    What is the difference between a quoted integer and an unquoted one?
    What should `load "'1"` return? If it returns `1`, then why do we need it for? If it's not `1`, then we need a new datatype to represent it (_homoiconicity_ requires it). How would you justify such datatype existence? What semantic rules would apply to it?
    
    For `quote`, have a look at its source code:
    
    ```
    red>> source quote
    quote: func [
        :value
    ][
        :value
    ]
    ```
    
    Why do you want `quote` to error out on integers? That would go against the basic semantics of the language.
    
    Quoting integers makes as much sense as quoting lit-words (`''foo`). Quoting is an escape mechanism for evaluation. It makes sense for word! values to be quoted, to force them to evaluate as literal words, it makes no sense to quote a value that is already a literal.

--------------------------------------------------------------------------------

On 2016-11-18T10:13:20Z, asampal, commented:
<https://github.com/red/red/issues/2336#issuecomment-261496008>

    In the referenced other issue, I mentioned why you might want to allow such character sequences, which is for the case when a sequence of characters is assembled blindly by one piece of code for use somewhere else without attempting to do any kind of validation at the source. In order to be safe under certain auto-evaluation cases, prefixing a sequence of characters with ' should be possible and cause no harm other than making the result not evaluate (unless it's a number, in which case it just evaluates to itself) at certain caller sites. 
    
    Of course a `load "'1"` should return `1` and should not require a new datatype.

--------------------------------------------------------------------------------

On 2016-11-18T10:38:44Z, meijeru, commented:
<https://github.com/red/red/issues/2336#issuecomment-261501268>

    If I may add to doc's explanation, the quote sign `'` is syntactic sugar for `quote` _only_ in the case of a `word!` or `path!` literal. So your blindly assembling piece of code would be safer to prefix all values with `quote`, since that is syntacttically valid for all values and has the desired semantics.

--------------------------------------------------------------------------------

On 2016-11-18T11:12:24Z, dockimbel, commented:
<https://github.com/red/red/issues/2336#issuecomment-261507737>

    @asampal How do "_In the referenced other issue, I mentioned why you might want to allow such character sequences, which is for the case when a sequence of characters is assembled blindly by one piece of code for use somewhere else without attempting to do any kind of validation at the source._" and the example code you refer to, relate to each other? The example code you provided:
    
    ```
    red>> a: to-hash ['4 5 '6 7]
    *** Syntax Error: missing #"]" at "sh ['4 5 '6 7]"
    *** Where: do
    ```
    
    Your justification for adding such syntax is still totally unclear to me.

--------------------------------------------------------------------------------

On 2016-11-18T18:31:54Z, asampal, commented:
<https://github.com/red/red/issues/2336#issuecomment-261605730>

    Sorry, didn't mean to imply that the example provided was representative of the case I tried to describe.

--------------------------------------------------------------------------------

On 2017-02-18T11:16:14Z, dockimbel, commented:
<https://github.com/red/red/issues/2336#issuecomment-280839056>

    Closing this ticket now. Please fill a [REP](https://github.com/red/red/wiki/Red-Enhancement-Proposal-Process) if you think such feature brings any value, just back it with sound arguments showing the benefits without breaking the syntactic and semantic rules of the language.


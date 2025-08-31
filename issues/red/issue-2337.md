
#2337: Can't create `hash!` with literal integer key, using single quote character
================================================================================
Issue is closed, was reported by asampal and has 12 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2337>

```red
red>> a: to-hash ['4 5 '6 7]
*** Syntax Error: missing #"]" at "sh ['4 5 '6 7]"
*** Where: do
red>> a: to-hash ['foo 5 'foo 2]
== make hash! ['foo 5 'foo 2]
red>> a: make hash! ['4 5 '6 7]
*** Syntax Error: missing #"]" at "h! ['4 5 '6 7]"
*** Where: do
```


Comments:
--------------------------------------------------------------------------------

On 2016-11-18T07:42:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2337#issuecomment-261468409>

    There is no such thing as `literal integer` in Red, nor Rebol2 or Rebol3.
    
    ```
    red>> '4
    *** Syntax Error: invalid value at "'4"
    *** Where: do
    ```
    
    The `'` character is accepted as visual separator for long integers, for convenience, but removed by the lexer on loading:
    
    ```
    red>> 1000'000
    == 1000000
    ```
    
    Anyway, it cannot appear as the leading character of an integer.

--------------------------------------------------------------------------------

On 2016-11-18T07:50:56Z, asampal, commented:
<https://github.com/red/red/issues/2337#issuecomment-261469579>

    Just curious why a literal integer shouldn't exist (despite seeming useless in a case such as above). If the keys in the block above were being composed from parts, wouldn't it make sense to allow `'4` just as `'foo` is allowed? It could just resolve to itself.

--------------------------------------------------------------------------------

On 2016-11-18T09:00:42Z, DideC, commented:
<https://github.com/red/red/issues/2337#issuecomment-261481226>

    The problem of "literal integer" would be to distinguish them from integer! after loading time. They will lost the ticks so `'1` would be just `1`.
    There are to be some limitations in a language. This one is in most computer languages I know of.
    
    The problem of the key is not, as `integer!` could be key after all.

--------------------------------------------------------------------------------

On 2016-11-18T09:25:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2337#issuecomment-261485942>

    @asampal Integers are already "literals", like strings, chars, blocks, etc... `word!` values are not literal, because they don't evaluate to themselves, but to the value they reference in the context they are bound to. Hence the need for a "lit-word!", to provide a literal word type, to be used as a symbol.
    
    Moreover, in your above example, using lit-words is not needed, as they are not evaluated, just words is enough:
    
    ```
    red>> a: to-hash [foo 5 foo 2]
    == make hash! [foo 5 foo 2]
    ```

--------------------------------------------------------------------------------

On 2016-11-18T09:35:06Z, asampal, commented:
<https://github.com/red/red/issues/2337#issuecomment-261488008>

    I'm aware that they are already literals (and that the ' is not needed for non-literals), but consider that Red is assembling the keys blindly from some kind of source, in some multi-step fashion. This would be some kind of code/data creation context. There should be no harm in the quote character being prefixed to any characters that could form the key. Why not allow it for integers just as you do for non-integers? Does it create problems in some way?

--------------------------------------------------------------------------------

On 2017-02-18T11:10:02Z, dockimbel, commented:
<https://github.com/red/red/issues/2337#issuecomment-280838783>

    See #2336 for more in-depth discussion. Closing this ticket now. Please fill a [REP](https://github.com/red/red/wiki/Red-Enhancement-Proposal-Process) if you think such feature brings any value, just back it with sound arguments showing the benefits without breaking the syntactic and semantic rules of the language.


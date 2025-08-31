
#4727: Inconsistency in issue! + ref! lexing
================================================================================
Issue is open, was reported by Oldes and has 16 comment(s).
[type.design]
<https://github.com/red/red/issues/4727>

Current state:
```
>> [#a@b]
== [#a @b] ;<-- should be error instead 
```
I believe it is inconsistent with:
```
>> #a/b
*** Syntax Error: (line 1) invalid issue at #a/b
*** Where: case
*** Stack: load 
>> #@
*** Syntax Error: (line 1) invalid issue at #@
*** Where: case
*** Stack: load 
```
In documentation is:
> A pound sign # followed by a sequence of characters. Issue! values are terminated by whitespace, semicolon, or a delimiter marking the start of a new value (e.g. [ starting a block).

If `@` is a delimiter how @greggirwin thinks so in [Gitter chat](https://gitter.im/red/bugs?at=5fb417d32a60f731f75f367e), than there is inconsistency with:
```
>> 1:0@a
*** Syntax Error: (line 1) invalid time at 1:0@a
*** Where: case
*** Stack: load 
```
Real delimiter does:
```
>> [#a[]]
== [#a []]
>> [1:0[]]
== [1:00:00 []]
```

So if `[#a@b]` is not an error, than `1:0@a` should be ok too.
Which side of this coin to choose?



Comments:
--------------------------------------------------------------------------------

On 2020-11-17T20:44:20Z, Oldes, commented:
<https://github.com/red/red/issues/4727#issuecomment-729203111>

    Also.. in Rebol:
    ```
    >> type? #a@b
    == email!
    ```

--------------------------------------------------------------------------------

On 2020-11-18T22:09:51Z, dockimbel, commented:
<https://github.com/red/red/issues/4727#issuecomment-729988116>

    @greggirwin Please weight in on this ticket.

--------------------------------------------------------------------------------

On 2020-11-18T23:36:41Z, Oldes, commented:
<https://github.com/red/red/issues/4727#issuecomment-730024833>

    There is also:
    ```
    >> [/aa@bb]
    == [/aa @bb]
    ```
    which is consistent with:
    ```
    >> [/aa/bb]
    == [/aa /bb]
    ```
    :-/

--------------------------------------------------------------------------------

On 2020-11-18T23:40:13Z, Oldes, commented:
<https://github.com/red/red/issues/4727#issuecomment-730026116>

    And if:
    ```
    >> [1:0/a 1:0[]]
    == [1:00:00 /a 1:00:00 []]
    ```
    Maybe this should be allowed: `[1:0@foo]` as is allowed `[#a@b]` already.

--------------------------------------------------------------------------------

On 2020-11-18T23:42:29Z, Oldes, commented:
<https://github.com/red/red/issues/4727#issuecomment-730026969>

    But there is definitely something wrong :-)

--------------------------------------------------------------------------------

On 2020-11-18T23:45:14Z, Oldes, commented:
<https://github.com/red/red/issues/4727#issuecomment-730027879>

    ```
    >> #@
    *** Syntax Error: (line 1) invalid issue at #@
    *** Where: case
    *** Stack: load 
    ```
    makes sense, because if `{#@}` is loaded as `[# @]`, `#` is invalid issue as error says (we cannot have empty word) 

--------------------------------------------------------------------------------

On 2020-11-18T23:47:03Z, Oldes, commented:
<https://github.com/red/red/issues/4727#issuecomment-730028605>

    But than `[#a/b]` should not be error, but it should be `[#a /b]` like it was in Rebol2.

--------------------------------------------------------------------------------

On 2020-11-19T00:38:32Z, greggirwin, commented:
<https://github.com/red/red/issues/4727#issuecomment-730047209>

    Thought Dump:
    
    - We can plug strange holes as we find them, but need to view this sysematically to set rules and boundaries from a design and documentation standpoint.
    - Red has a small set of important fixed delimiters. e.g. `[] ();`.
    - Generally, values are terminated by whitespace, semicolon, or a delimiter marking the start of a new value.
    - What starts a new value depends on what is allowed in the value before it. e.g. `a/b` is a path! but `/a/b` is two refinements.
    - Scanning/lexing and Loading are two different steps. What we're talking about here is lexing.
    - For each datatype/form we need to define the rules. And now we can diagram them easily. :^)
    - All this to note that consistency is in the eye of the beholder. If we say `@` or `/` are hard and fast delimiters, that messes with `email!` and `date!` values. The closest we can get is consistency within a typeset, e.g. word values. Then we have to ask if `any-word!` and `all-word!` benefit from being internally consistent.
    - The Rebol email case for `#a@b` also shows that precedence comes into play.
    - Each form ultimately has its own rules, which may not fit a globally consistent view, and there's no way around that while still being the language we are. What we CAN do is try to minimize pain and surprises.
    - So what we need to do is step back and define each form...oh, wait! @meijeru has given us a springboard for this: https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#52-lexical-structure-of-values . When the parser was all `parse`, though there were exceptions, it was close to an easy doc port. Fast lexer puts more space between them, but also gives us a two-pronged approach. Spec what we want, and then see if it really lexes. :^) We can reconcile the specific doc pages for a type with that too. Those are informative, but we can also make them normative and even include a diagram for each type. `Word!` is pretty specific there, and `date!`.
    - https://github.com/red/docs/blob/master/en/datatypes/refinement.adoc has a special note about `@`, which needs to be removed, as `[/a@b]` now lexes as `[/a @b]`. `Issue!` is vague in the docs and Rudolf's spec just has one more syntax note, so that's our big hole right now. 
    - WHEW! It's not as bad as it seems. We can lay out some basic rules, like the delimiters that ALWAYS mark the start/end of a non-string value. That helps people. 
    - `Path!` is another one that needs to be more specific. Docs only note int/word/paren, but others are allowed, and some things get sticky. e.g. issue is OK only at the end.
    ```
    >> type? 'a/1x2/b@c/#123
    == path!
    >> type? 'a/1x2/b@c/#123/test
    *** Syntax Error: (line 1) invalid issue at #123/test
    *** Where: case
    *** Stack: load 
    ```


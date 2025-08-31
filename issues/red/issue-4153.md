
#4153: [Parse] odd behavior of INSERT
================================================================================
Issue is closed, was reported by 9214 and has 20 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4153>

Related: https://github.com/red/red/issues/2213

**Describe the bug**

Parse `insert [only] <word>` fetches word's value, but
* treats `<word>` as a non-terminal;
* makes insertion only if value is a well-formed Parse grammar rule (i.e. right-hand side);
* always fails.

**To reproduce**
Integers in Parse are used in the form `<integer rule>`. Sole `integer!` value is not a valid rule:
```red
>> x: 1 parse y: [][insert x] y
*** Script Error: PARSE - invalid rule or usage of rule: 1
*** Where: parse
*** Stack:  
```

`yes` is bound to `true` and can be used for matching:
```red
>> x: yes parse y: [][insert x] y
== [true]
```
`nope`, on the other hand, has no value and is not a valid rule:
```red
>> x: [nope] parse y: [][insert x] y
*** Script Error: PARSE - invalid rule or usage of rule: nope
*** Where: parse
*** Stack:
```
`some` has no value, but it's a Parse keyword; followed by an empty block, it forms a valid rule:
```red
>> x: [some []] parse y: [][insert x] y
== [some []]
```

**Expected behavior**

As a rule of thumb, `insert [only] <something>` should be strictly equivalent to `change [only] none <something>`.
```red

>> parse y: [][insert yes] y
== [true]
>> parse y: [][insert [nope]] y
== [nope]
>> parse y: [][insert [some []]] y
== [some []]

>> x: yes parse y: [][change none x] y
== [true]
>> x: [nope] parse y: [][change none x] y
== [nope]
>> x: [some []] parse y: [][change none x] y
== [some []]
```

Also note:
```red
>> parse [][insert abracadabra]
*** Script Error: PARSE - invalid rule or usage of rule: abracadabra
*** Where: parse
*** Stack:  

>> parse [][change none abracadabra]
*** Script Error: abracadabra has no value
*** Where: parse
*** Stack:  

>> x: yes parse [][insert x | (probe 'failed)]
failed
== false
>> x: yes parse [][insert x | true (probe 'failed?)]
failed?
== true
```

**Platform version**

```
Red 0.6.4 for Windows built 17-Nov-2019/5:36:01+01:00 commit #640c00e
```



Comments:
--------------------------------------------------------------------------------

On 2020-02-18T22:30:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4153#issuecomment-587936851>

    See also :point_up: [February 18, 2020 11:14 AM](https://gitter.im/red/parse?at=5e4b9cee46e99d431f822f3b)

--------------------------------------------------------------------------------

On 2020-08-03T17:15:14Z, 9214, commented:
<https://github.com/red/red/issues/4153#issuecomment-668139657>

    Interesting that `R_INSERT` is never used and there's no `R_INSERT_ONLY`.
    
    It appears that the issue is caused by `insert` trying to implement "positional mode" the way `change` and `remove` do: i.e. you give it a word set to some position in parsed series and it will insert at that position. That's problematic because there's no way to differentiate between "word as position" and "word as a thing to insert".
    
    This means that if you want to insert something referred to by a word, then the first word in `insert` rule needs to refer to series position... and even then it's buggy (same as in https://github.com/red/red/issues/4200).
    ```red
    >> x: 'y
    == y
    >> c: 'x
    == x
    >> parse block: [a b d][2 word! mark: insert mark c 'd]
    == true
    >> block
    == [a b y d] ; expected [a b x d]
    ```

--------------------------------------------------------------------------------

On 2020-09-29T07:15:43Z, rebolek, commented:
<https://github.com/red/red/issues/4153#issuecomment-700500169>

    `parse`'s behavior is still odd IMO when trying to insert function name. I'm trying to insert function name with today's Red:
    
    ```
    >> about
    Red 0.6.4 for macOS built 29-Sep-2020/7:03:49
    
    >> parse x: [][insert 'reduce] probe x
    ['reduce]
    == ['reduce]
    >> parse x: [][insert reduce] probe x
    [make native! [[{Returns a copy of a block, evaluating all expressions}
        value [any-type!]
        /into {Put results in out block, instead of creating a new block}
        out [any-block!] "Target block for results, when /into is used"
    ]]]
    == [make native! [[{Returns a copy of a block, evaluating all expressions}
        value [any-type!]
        /into {Put results in out block, instead of creating a new block}
        out [any-block!] "Target block for results, when /into is used"
    ]]]
    >> parse x: [][insert quote reduce] probe x
    [func ["Return but don't evaluate the next value"
        :value
    ][
        :value
    ]]
    == [func ["Return but don't evaluate the next value"
        :value
    ][
        :value
    ]]
    >> parse x: [][insert ('reduce)] probe x
    [reduce]
    == [reduce]
    ```
    
    It's possible but `lit-word!` in `paren!` isn't very intuitive. It's odd that `lit-word!` doesn't evaluate but `word!` does.

--------------------------------------------------------------------------------

On 2020-09-29T07:28:36Z, 9214, commented:
<https://github.com/red/red/issues/4153#issuecomment-700506389>

    @rebolek by this token `change` is "bugged" too:
    ```text
    >> parse foo: [][change none quote] foo
    == [func ["Return but don't evaluate the next value" 
        :value
    ][
        :value
    ]]
    ```
    
    `change` and `insert` treat all values literally, except for `word!` - their value is fetched and used instead, and except for `paren!` - they are evaluated as a Red expression and the result of the evaluation is used instead.
    
    > It's odd that lit-word! doesn't evaluate but word! does.
    
    In https://github.com/red/red/issues/2213 you asked precisely for that behavior :man_shrugging: see @dockimbel's recent [comment](https://github.com/red/red/pull/4349#issuecomment-698171313) on that feature:
    
    > I think returned word should be evaluated as it is now. If the user wants to insert a word, he needs to return a lit-word then.

--------------------------------------------------------------------------------

On 2020-09-29T09:19:39Z, rebolek, commented:
<https://github.com/red/red/issues/4153#issuecomment-700578908>

    @9214 Right, I asked for it :) and I have no problem with it, I have a problem with `lit-word!` not evaluating and/or missing `quote` support. `change` has the same behavior, right.

--------------------------------------------------------------------------------

On 2020-09-29T09:33:20Z, 9214, commented:
<https://github.com/red/red/issues/4153#issuecomment-700586394>

    @rebolek
    
    > I have a problem with lit-word! not evaluating
    
    If `lit-word!` coerces to `word!`, how then one can insert `lit-word!`? With `insert (quote 'lit-word)`?
    
    > and/or missing quote support
    
    `insert` works with a single _value_, not a _rule_ (which can be composed of multiple values), just like `change`. There's no such thing as "`quote` support" in such cases. `insert quote reduce` is `insert <value>` followed by `reduce` treated as a rule, which will match a respective `native!` value. Same with `change <rule> <value>`.
    
    ```red
    >> probe parse block: reduce [:reduce][insert quote reduce] block
    true
    == [func ["Return but don't evaluate the next value" 
        :value
    ][
        :value
    ] make native! [[{Returns a copy of a block, evaluating all expressions} 
        ...
    ``` 

--------------------------------------------------------------------------------

On 2020-09-29T11:07:55Z, rebolek, commented:
<https://github.com/red/red/issues/4153#issuecomment-700632187>

    @9214 I understand your reasoning but `quote` could be an option in such case, just like `only` for example.

--------------------------------------------------------------------------------

On 2020-09-29T11:13:33Z, 9214, commented:
<https://github.com/red/red/issues/4153#issuecomment-700634726>

    @rebolek this is an interesting design proposal. If you feel confident in it, then it's worth filing a REP, but IMO there are not that much "decaying" types (only `lit-word!` and `lit-path!`) to warrant a new option keyword.

--------------------------------------------------------------------------------

On 2020-09-29T12:47:02Z, rebolek, commented:
<https://github.com/red/red/issues/4153#issuecomment-700679015>

    @9214 REP makes a sense, I'll do it, thanks for the suggestion.
    
    > IMO there are not that much "decaying" types (only lit-word! and lit-path!) 
    
    Also `paren!` where the amount of gymnastic needed to achieve insertion (or change) is even better:
    
    ```
    >> b: [(x)]
    == [(x)]
    >> parse t: [][insert (b)]
    == true
    >> t
    == [(x)]
    ```
    
    It may be only three types (if I haven't forgotten anything) but when creating a self-modifying dialect (which I am a fan of 😄 ), they are actually the most important ones.

--------------------------------------------------------------------------------

On 2020-11-03T03:12:54Z, greggirwin, commented:
<https://github.com/red/red/issues/4153#issuecomment-720881017>

    I guess the question is whether, for those who like to try hitting their fingers with a hammer, we should make it easier for them. 
    
    It reminds me of Ladislav's `build` function, which I've tinkered up under a new name, which faces a similar problem when `compos`ing parens into blocks.


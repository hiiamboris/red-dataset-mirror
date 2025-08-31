
#1470: There is a lexer inconsistency with Rebol for issue! type
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[status.built] [status.tested] [type.task.wish]
<https://github.com/red/red/issues/1470>

```
red>> load {#4=#5*COS}
== [#4= #5*COS]
```

versus:

```
>> load {#4=#5*COS}
== #4=#5*COS
```



Comments:
--------------------------------------------------------------------------------

On 2015-12-03T17:01:28Z, Oldes, commented:
<https://github.com/red/red/issues/1470#issuecomment-161716413>

    @dockimbel But as I see now.. in Rebol3 it's not possible to have issue like `#foo#` (as it was in Rebol2), so it's up to you if you want to close it or accept the lexer change.

--------------------------------------------------------------------------------

On 2015-12-06T04:57:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1470#issuecomment-162270986>

    There are two kind of issue! types: _issue-as-string_ and _issue-as-word_. The lexical space is not exactly the same for boths, as we want to keep issue-as-word close to words lexical rules (to facilitate conversions). Rebol2 implements the former, Red and Rebol3 implement the latter.
    
    Though, I think both ways to implement issues are useful, for different use-cases,  so the unsolved question so far is, how to define them so there is no ambiguity. Kaj proposed a solution in #380, which is the best option we have so far, though it still requires some studying and prototyping. BTW, I think we could name the types as: _issue!_ (for issue-as-string) and _keyword!_ (for issue-as-word).
    
    So I think your extended rules for issue are premature, they belong rather to the issue-as-string type that we don't have yet.

--------------------------------------------------------------------------------

On 2020-03-21T17:52:06Z, 9214, commented:
<https://github.com/red/red/issues/1470#issuecomment-602079062>

    @dockimbel @greggirwin if we agree that `issue!` (word-like) and `ref!` (string-like) fit the bill, then this ticket should be closed.
    
    For the reference, new lexer:
    ```red
    >> load {#4=#5*COS}
    == #4=#5*COS
    >> transcode/prescan {#4=#5*COS}
    == issue!
    
    >> load {#foo#}
    == #foo#
    >> transcode/prescan {#foo#}
    == issue!
    ```

--------------------------------------------------------------------------------

On 2020-03-22T02:08:43Z, greggirwin, commented:
<https://github.com/red/red/issues/1470#issuecomment-602136437>

    I remember the `#<alpha>*` idea, and also my concerns about it. At one time I think it seemed OK, but while I may have been the heaviest user of issues-as-strings in R2 (I used them as IDs in many production systems) there's a catch to being bimodal here. *Everything* has to work seamlessly when it comes to automatic conversions, and handling. If you use a convention which just happens to create half your `issue!` values with a leading digit, nothing in your code should break or dramatically change in behavior. This goes both ways, as now you have the limitations of each type lowering their power. symbol space may be limited, and series are heavier. 
    
    Other options break existing code now. e.g. `##keyword` syntax. There is also the complexity cost in the grammar and implementation. Raw strings don't help as ad-hoc issues either, if they can't be round-tripped.
    
    Numeric support relates to #650 WRT word conversion consistency. 

--------------------------------------------------------------------------------

On 2020-07-30T12:08:31Z, 9214, commented:
<https://github.com/red/red/issues/1470#issuecomment-666325850>

    ↑ ping.


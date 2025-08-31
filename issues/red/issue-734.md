
#734: lit-word variables decay to word when evaluated
================================================================================
Issue is closed, was reported by hostilefork and has 8 comment(s).
[status.built] [status.tested] [type.bug] [type.review] [type.compiler]
<https://github.com/red/red/issues/734>

```
>> x: quote 'foo 
>> probe append [] x
[foo]
```

A hassle when trying to build code blocks with lit-words in them programmatically.  Seems it would make more sense to return `['foo]`.  Note that lit-path variables do not decay to path in this way.

Rebol has this behavior for currently unknown reasons.  The [issue has been proposed for modification](http://curecode.org/rebol3/ticket.rsp?id=1434) there, and a pull request implementing it is pending.



Comments:
--------------------------------------------------------------------------------

On 2014-03-30T22:49:10Z, dockimbel, commented:
<https://github.com/red/red/issues/734#issuecomment-39042833>

    As it seems there is no valid reason for keeping it compatible with Rebol2, the rule of automatic decay of lit-words on indirect access will be removed.

--------------------------------------------------------------------------------

On 2014-03-30T23:43:08Z, earl, commented:
<https://github.com/red/red/issues/734#issuecomment-39044381>

    Reopening this ticket, because there still are some problems with the implementation. See the inline comments on the commit.

--------------------------------------------------------------------------------

On 2014-03-31T13:09:19Z, dockimbel, commented:
<https://github.com/red/red/issues/734#issuecomment-39085924>

    Hmm, it looked too easy, I knew there was a catch somewhere. :)

--------------------------------------------------------------------------------

On 2020-07-10T15:36:11Z, 9214, commented:
<https://github.com/red/red/issues/734#issuecomment-656739370>

    Should be reopened because compiler still decays `lit-word!`s to `word!`s.
    ```red
    probe quote 'foo
    ```
    On a1d1495 results in:
    ```red
    foo
    ```


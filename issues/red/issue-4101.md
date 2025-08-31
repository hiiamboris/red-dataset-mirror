
#4101: Incorrect handling of PATH! and LIT-PATH! in PARSE
================================================================================
Issue is closed, was reported by giesse and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4101>

Red:

```
>> parse [a/b] ['a/b]
== false
>> parse [a/b] [a/b]
== true
```

R2:

```
>> parse [a/b] ['a/b]
== true
>> parse [a/b] [a/b]
** Script Error: a has no value
** Near: parse [a/b] [a/b]
```

Red's behavior is inconsistent with handling of `word!` and `lit-word!`. Even assuming we don't want to resolve paths in `parse` at this time, it should throw a not implemented error and not match the path, and the `lit-path!` should match the path, for forward compatibility.

(Related: #3528)


Comments:
--------------------------------------------------------------------------------

On 2019-11-23T14:24:39Z, toomasv, commented:
<https://github.com/red/red/issues/4101#issuecomment-557802005>

    Overview of parsing `any-string!`, `any-word!` and `any-path!` values: [November 23, 2019 1:21 PM](https://gitter.im/red/help?at=5dd916204517d002b2dad8bd)
    
    [Funcs used](https://gist.github.com/toomasv/dbee79a944fd12eee53a8353a1ce5472)

--------------------------------------------------------------------------------

On 2019-12-15T16:19:40Z, dockimbel, commented:
<https://github.com/red/red/issues/4101#issuecomment-565823800>

    After the fix:
    ```
    >> parse [a/b] ['a/b]
    == true
    >> parse [a/b] [a/b]
    *** Script Error: PARSE - invalid rule or usage of rule: a/b
    *** Where: parse
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2019-12-19T15:28:34Z, 9214, commented:
<https://github.com/red/red/issues/4101#issuecomment-567536676>

    @dockimbel it also needs to be addressed for `change`, `remove` and `insert` keywords:
    ```red
    >> parse foo: [a b c][change only 3 word! d/e] foo
    == [d/e]
    >> parse foo: [a/b c d][remove a/b] foo
    == [c d]
    >> parse foo: [c d][insert a/b 2 word!] foo
    == [a b c d]
    ````
    This is incosistent with how they handle `word!`s, which are fetched for their values instead of being treated literally.

--------------------------------------------------------------------------------

On 2020-05-26T16:02:12Z, 9214, commented:
<https://github.com/red/red/issues/4101#issuecomment-634118756>

    @dockimbel can we reopen this one so it don't get lost?


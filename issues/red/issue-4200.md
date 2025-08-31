
#4200: [Parse] CHANGE <position> <expression> does not work properly with WORD! values
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4200>

Related: https://github.com/red/red/issues/4153

**Describe the bug**

In Parse, `change` rule can modify input with arbitrary value, either literal one or that coming from evaluated expression. If literal is a `word!`, its value will be fetched and used for modification. Thus, the only way to insert actual `word!` value is by using `paren!` expression, e.g.:

```red
>> bar: 'baz
== baz
>> parse foo: [][change none bar] foo
== [baz]
>> parse foo: [][change none 'bar] foo
== ['bar]
>> parse foo: [][change none (quote bar)] foo
== [bar]
```

However, this does not work if an input position is used instead of a rule - word is fetched as if it was used literally.

**To reproduce**

```red
>> bar: 'baz
== baz
>> parse foo: [][mark: change mark (quote bar)] foo
== [baz]
```

**Expected behavior**

```red
>> bar: 'baz
== baz
>> parse foo: [][mark: change mark (quote bar)] foo
== [bar]
```

**Platform version**

The latest build, all platforms.



Comments:
--------------------------------------------------------------------------------

On 2020-03-18T13:16:04Z, 9214, commented:
<https://github.com/red/red/issues/4200#issuecomment-600616243>

    There is another case which is not handled properly with `change <position> <paren | word>`:
    ```red
    >> foo: "xxx"
    == "xxx"
    >> bar: 'foo
    == foo
    >> parse s: [a b c][skip mark: change mark bar] s
    == [a "xxx" b c]
    ```
    
    Basically, if `paren!` or `word!` returns a `word!`, this word will be fetched again.

--------------------------------------------------------------------------------

On 2020-09-24T07:55:17Z, dockimbel, commented:
<https://github.com/red/red/issues/4200#issuecomment-698181248>

    It's a feature, see https://github.com/red/red/issues/2213
    
    Treating returned words as passive or active is a design choice that is open to discussion. We could evaluate returned `word!` values and just decay `lit-word!` ones for example, to mimick the main language semantics.


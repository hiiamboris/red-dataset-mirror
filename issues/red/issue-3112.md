
#3112: get/any causes an error when accessing non-existant path
================================================================================
Issue is closed, was reported by a-nick-fischer and has 16 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3112>

### Expected behavior
```
>> foo: context [bar: 5]
== make object! [
    bar: 5
]
>> type? get/any 'foo/something
== unset!
```
### Actual behavior
```
>> foo: context [bar: 5]
== make object! [
    bar: 5
]
>> type? get/any 'foo/something
*** Script Error: cannot access something in path foo/something
*** Where: get
*** Stack:

>>
```
### Steps to reproduce the problem
See expected and actual behavior
### Red version and build date, operating system with version.
Windows 10 x64
```
>> system/build
== make object! [
    date: 12-Aug-2017/21:38:44+02:00
    ...
```



Comments:
--------------------------------------------------------------------------------

On 2017-11-17T21:39:08Z, meijeru, commented:
<https://github.com/red/red/issues/3112#issuecomment-345372693>

    With due respect, I think the error message is both clear and to the point. Why should non-existant path expressions be unset ? The help string specifies that unset is yielded by *words* which have no value, i.e. are not bound. In this case the "head word" `foo` does have a value.

--------------------------------------------------------------------------------

On 2017-11-17T22:34:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3112#issuecomment-345384245>

    The results are interesting, and something to be doc'd, if the current behavior is by design.
    
    ```
    >> foo: context [bar: 5]
    == make object! [
        bar: 5
    ]
    >> type? get/any 'foo/something
    *** Script Error: cannot access something in path foo/something
    *** Where: get
    *** Stack:  
    
    >> type? get/any 'baz/something
    *** Script Error: baz has no value
    *** Where: get
    *** Stack:  
    
    >> type? get/any 'bap
    == unset!
    ```

--------------------------------------------------------------------------------

On 2017-11-18T13:56:56Z, meijeru, commented:
<https://github.com/red/red/issues/3112#issuecomment-345443904>

    This follows strictly the logic that I stated above: a single word may be unset, a head word that is unset gives an error (because the remaining part of the expression cannot be analyzed) and a non-existant field name gives another error.

--------------------------------------------------------------------------------

On 2017-11-18T17:56:44Z, greggirwin, commented:
<https://github.com/red/red/issues/3112#issuecomment-345459052>

    My thought was that if a word returns unset, then a path with that word at the head should also return unset. We can't really use this standard error (`not-in-context: ["context for" :arg1 "is not available"]`) for the first case, because it could just be a block, which works like this:
    ```
    >> foo: [bar: 5]
    == [bar: 5]
    >> type? get/any 'foo/something
    == none!
    ```
    Which will never return unset, AFAICT. 
    
    Another alternative might be to adjust the doc string for `/any` to point out that paths ignore that refinement.

--------------------------------------------------------------------------------

On 2017-11-19T22:05:18Z, meijeru, commented:
<https://github.com/red/red/issues/3112#issuecomment-345553736>

    A path with an unset word at the head could possibly return unset, but what the submitter of this issue wants, is that a non-existing field name yields unset - that is different.

--------------------------------------------------------------------------------

On 2017-11-25T09:59:15Z, 9214, commented:
<https://github.com/red/red/issues/3112#issuecomment-346930772>

    A food for thought:
    ```Red
    >> foo: context [bar: 5]
    == make object! [
        bar: 5
    ]
    >> in foo 'bar
    == bar
    >> in foo 'something
    == none
    ```
    And I'm with @meijeru on that - one element of the series (`path!`) is `unset!` and because of that path cannot be interpreted any further, that's what error message says. `unset!` is related to words, not series.
    ```Red
    >> type? get/any last 'foo/something
    == unset!
    ```

--------------------------------------------------------------------------------

On 2017-11-26T09:46:11Z, meijeru, commented:
<https://github.com/red/red/issues/3112#issuecomment-346995909>

    In your last example, though, the type of `'something` is `unset!`, independent of the fact that it is the second element in a path; the interpretation of `'something` is not determined, in this case, by whatever `foo` is.

--------------------------------------------------------------------------------

On 2018-03-16T09:57:18Z, dockimbel, commented:
<https://github.com/red/red/issues/3112#issuecomment-373661962>

    Current behavior is intended and correct. Rebol3 follows the same rules.



#3845: Two consecutive strings in path do not work as expected
================================================================================
Issue is closed, was reported by toomasv and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3845>

**Describe the bug**

When accessing nested blocks with path notation, if path includes strings in two consecutive levels, `none` is returned.

**To reproduce**

```
a: ["b" ["c" ["d" 1]]]
a/("b")/("c")
;== none
```

**Expected behavior**

Correctly formed path should return expected piece.
I.e. the above should return `["d" 1]`.

**Additional info**

When strings are not on consecutive levels, path notation works correctly:

```
a: ["b" [c ["d" 1]]]
a/("b")/c/("d")
;== 1
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Apr-2019/1:46:56+03:00 commit #4922546
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-14T10:06:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/3845#issuecomment-482940314>

    This bug seems specific to strings though. Word indexing is ok:
    ```
    >> a: [b [c [d [e f]]]]
    >> a/('b)/('c)/('d)/('e)
    == f
    ```

--------------------------------------------------------------------------------

On 2019-04-14T10:23:53Z, rebolek, commented:
<https://github.com/red/red/issues/3845#issuecomment-482942581>

    It's interesting that this bug really requieres two strings, not two parens:
    
    * this is fine:
    
    ```
    >> a: [b [c [d]]]
    == [b [c [d]]]
    >> a/(to word! "b")/(to word! "c")
    == [d]
    ```
    
    * but not this:
    
    ```
    >> x: ["y" ["z" ["ž"]]]
    == ["y" ["z" ["ž"]]]
    >> x/("y")/("z")
    == none
    ```

--------------------------------------------------------------------------------

On 2019-04-14T12:27:40Z, nedzadarek, commented:
<https://github.com/red/red/issues/3845#issuecomment-482963912>

    First, the error occurs when you have a thing in a `paren!` on the next element from the `get-word!`/`path!`).
    It almost works with the "get-syntax" (foo/:baz):
    ```
    s1: "b" s2: "c"
    a/:s1/:s2 ; == ["d" 1]
    a/("b")/:s2 ; == ["d" 1]
    ```
    but once `paren!` is in the next position from the `get-word!`/`paren!` it returns none:
    ```
    >> a/:s1/("c")
    == none
    ```
    
    Secondly, it's not only strings that causes problems:
    ```
    append a/("b") [2x21 'ok]
    a/("b") ; == ["c" ["d" 1] 2x21 'ok]
    a/("b")/(2x21)
    ; *** Script Error: cannot access 2x21 in path a/("b")/(2x21)
    ; *** Where: catch
    ; *** Stack:  
    arr: [2x21 'ok]
    arr/(2x21) ; == 'ok
    ```

--------------------------------------------------------------------------------

On 2019-04-14T13:04:08Z, 9214, commented:
<https://github.com/red/red/issues/3845#issuecomment-482971417>

    ... this has nothing to do with strings at all, and generalizes to any `series!` value (actually, to any value that supports `eval-path` action).
    ```red
    >> block: [[a b] [[c d] e]]
    == [[a b] [[c d] e]]
    >> block/([a b])
    == [[c d] e]
    >> block/([a b])/([c d])
    == none
    
    >> block: [#{AB} [#{CD} #{EF}]]
    == [#{AB} [#{CD} #{EF}]]
    >> block/(#{AB})
    == [#{CD} #{EF}]
    >> block/(#{AB})/(#{CD})
    == none
    
    >> block: [<a b> [<c d> <e f>]]
    == [<a b> [<c d> <e f>]]
    >> block/(<a b>)
    == [<c d> <e f>]
    >> block/(<a b>)/(<c d>)
    == none
    ```
    
    This looks as if `eval-path` gets confused and starts searching different parent, eventually returning `none`. With this hypothesis in mind, I cooked a test script:
    
    ```red
    Red []
    
    #system [
        interpreter/verbose: 1337
        block/verbose: 1337
        string/verbose: 1337
    ]
    
    block: ["a" ["b" c]]
    
    do [
        probe block/("a")
        probe block/("a")/("b")
    ]
    ```
    
    Test run results in:
    ```
    root size: 2161, root max: 4134, cycles: 0
    root size: 2162, root max: 4134, cycles: 1
    root size: 2162, root max: 4134, cycles: 2
    block/push
    block/push
    
    eval: root loop...
    eval: fetching value of type 15
    eval: 'probe
    eval: pushing function frame
    block/push-only*
    eval: evaluating argument
    eval: fetching value of type 25
    eval: path
    eval: path parent: 5
    eval: root loop...
    eval: fetching value of type 7
    eval: path item: 7
    block/find
    string/compare
    
    block/mold
    string/mold
    string/form
    ["b" c]
    eval: function return type: 5
    
    eval: root loop...
    eval: fetching value of type 15
    eval: 'probe
    eval: pushing function frame
    eval: evaluating argument
    eval: fetching value of type 25
    eval: path
    eval: path parent: 5
    eval: root loop...
    eval: fetching value of type 7
    eval: path item: 7
    block/find
    string/compare
    
    eval: path parent: 5
    eval: root loop...
    eval: fetching value of type 7
    eval: path item: 7
    string/find                                        <-- WTF
    none
    eval: function return type: 3
    
    ```
    
    To elaborate: in case when parent is `["b" c]` `string/find` is called instead of `block/find` to fetch a desired element, which is never found. The only `string!` value here is `"b"`, and it looks like its `eval-path` action is called.

--------------------------------------------------------------------------------

On 2019-04-14T14:13:24Z, nedzadarek, commented:
<https://github.com/red/red/issues/3845#issuecomment-482984846>

    https://gist.github.com/nedzadarek/e39b578b49d9c73d8e395c3eed1bc736

--------------------------------------------------------------------------------

On 2019-04-14T14:55:50Z, 9214, commented:
<https://github.com/red/red/issues/3845#issuecomment-482992665>

    > https://gist.github.com/nedzadarek/e39b578b49d9c73d8e395c3eed1bc736
    
    Which restates what I've just said in the previous message - in `x: [<a> [<b> <c>]] x/(<a>)/(<b>)` case, if `<b>` is a value of datatype `<datatype>` that has `eval-path` action - it will be called, which eventually results in `<datatype>/find` call, which in turn always returns `none` for reasons yet to be known (that is, it's not clear what it searches for, and how).
    
    In your code, only `binary!` (which you mistakenly called `bitset!`) and `map!` have this action, that's why only these 2 cases returned `none` and the rest erred out with `path ... is not valid for <datatype> type`.

--------------------------------------------------------------------------------

On 2019-04-14T16:16:40Z, nedzadarek, commented:
<https://github.com/red/red/issues/3845#issuecomment-483008768>

    @9214 
    > Which restates what I've just said in the previous message
    
    no because you said:
    >... this has nothing to do with strings at all, and generalizes to any series! value.
    
    I specifically haven't tested `series!` values because I assumed you tested it already. 
    

--------------------------------------------------------------------------------

On 2019-04-14T16:19:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3845#issuecomment-483009274>

    Thanks for digging in everyone. One of the things I love about Red is that problems often pique our interest, and figuring out the details is fun in itself. Those details really help when it comes time to fix issues.


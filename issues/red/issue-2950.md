
#2950: Different behaviors between Red and REBOL3 in evaluating a word which is referring to a lit-word.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/2950>

In Rebol, I get a word:
```Red
>> a: first ['aaa]
== 'aaa
>> a
== aaa
```
In Red, I get a lit-word:
```Red
>> a: first ['aaa] 
== 'aaa
>> a
== 'aaa
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-02T06:20:20Z, geekyi, commented:
<https://github.com/red/red/issues/2950#issuecomment-319578962>

    You could argue Red does it better. What if you wanted to preserve the `lit-word!`?
    Also the it makes me uneasy that arguably the same code can give different results:
    ```red
    type? a: first ['aaa]
    type? a
    ```
    In Rebol 2:
    ```rebol
    >> type? a: first ['aaa]
    == lit-word!
    >> type? a
    == word!
    ```

--------------------------------------------------------------------------------

On 2017-08-02T07:47:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2950#issuecomment-319595461>

    Rebol has an inconsistent behavior, while Red produces consistent results both for lit-words and lit-paths:
    ```
    >> a: first ['aaa]
    == 'aaa
    >> a
    == 'aaa
    >> a: first ['a/b]
    == 'a/b
    >> a
    == 'a/b
    ```
    
    As there is no cases I can think of where the Rebol behavior is objectively better, Red sticks with a consistent and more intuitive behavior.


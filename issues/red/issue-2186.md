
#2186: Parse: incorrect invalid rule or usage with word
================================================================================
Issue is closed, was reported by greggirwin and has 12 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2186>

```
red>> input: [a b c a b c a b c]
== [a b c a b c a b c]
red>> value: 'a
== a
red>> parse input [any [thru value] to end]
*** Script Error: PARSE - invalid rule or usage of rule: a
*** Where: parse
red>> parse input [any [thru 'a] to end]
== true
```

With parse-trace I can see it getting a not-match after it gets a match on the first 'a in input. Using the literal 'a that doesn't happen. The word value isn't special either. Happens with any word. Works in R2.



Comments:
--------------------------------------------------------------------------------

On 2016-08-30T00:52:40Z, geekyi, commented:
<https://github.com/red/red/issues/2186#issuecomment-243301884>

    The error is, I suspect, `parse` trying to match `value` as a sub rule, after failing to match `thru value`
    
    ```
    red>> value: 'a
    == a
    red>> parse [a] [value]
    *** Script Error: PARSE - invalid rule or usage of rule: a
    *** Where: parse
    ```

--------------------------------------------------------------------------------

On 2016-08-30T01:05:29Z, geekyi, commented:
<https://github.com/red/red/issues/2186#issuecomment-243303659>

    Ok, thought I had a much reduced test case, but my example doesn't work in rebol 2. In red, it only triggers on failure

--------------------------------------------------------------------------------

On 2016-08-30T01:09:55Z, geekyi, commented:
<https://github.com/red/red/issues/2186#issuecomment-243304330>

    Ok, got it down to this, red seems to do an extra step to evaluate as a sub rule in case of failure.
    R2:
    
    ```
    >> parse [b] [thru value]
    == false
    ```
    
    Red:
    
    ```
    red>> parse [b] [thru value]
    *** Script Error: PARSE - invalid rule or usage of rule: a
    *** Where: parse
    ```

--------------------------------------------------------------------------------

On 2016-08-30T01:30:23Z, greggirwin, commented:
<https://github.com/red/red/issues/2186#issuecomment-243307150>

    Thanks geekyl!

--------------------------------------------------------------------------------

On 2016-08-31T14:38:14Z, dockimbel, commented:
<https://github.com/red/red/issues/2186#issuecomment-243785023>

    Words are evaluated as sub-rules in Red's Parse dialect, only lit-words are matched (against words and lit-words). So the following code works fine in Red:
    
    ```
    red>> input: [a b c a b c a b c]
    == [a b c a b c a b c]
    red>> value: first ['a]       ;-- we don't have to-lit-word yet...
    == 'a
    red>> parse input [any [thru value] to end]
    == true
    ```

--------------------------------------------------------------------------------

On 2016-08-31T15:23:40Z, greggirwin, commented:
<https://github.com/red/red/issues/2186#issuecomment-243800190>

    Thanks Doc. It works with `count [a b c a b c a b c] ['a]` as well. Where it came up was in a simple `count` func:
    
    ```
    count: function [
        input [series!]
        value
    ][
        n: 0
        parse input [any [thru value (n: n + 1)] to end]
        n
    ]
    ```
    
    Where I didn't want to leak the parse abstraction out. Counting sub blocks also has issues though, so just iterating and comparing may be better in this case.


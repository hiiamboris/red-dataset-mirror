
#2125: switch chokes on datatypes
================================================================================
Issue is closed, was reported by WiseGenius and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2125>

When checking a value equal to `block!`, `switch` errors with a strange message:

```
red>> switch/default block! [
[        #[block!] [print "yes"]
[    ][print "no"]
*** Script Error: author has no value
*** Where: switch
```

When checking a value equal to any other datatype except `datatype!`, `switch` fails to match it:

```
red>> switch/default word! [
[        #[word!] [print "yes"]
[    ][print "no"]
no
```

But hang on. What's this?

```
red>> switch/default integer! [
[        #[integer!] [print "yes"]
[        1 [print "one"]
[        2 [print "two"]
[    ][print "no"]
one
```

I could maybe understand the other way around, but:

```
red>> switch/default 1 [
[        #[integer!] [print "yes"]
[    ][print "no"]
no
```

And then there's this:

```
red>> switch/default string! [
[        #[string!] [print "yes"]
[        1 [print "one"]
[        2 [print "two"]
[        "Surely not!" [print "Oh dear!"]
[    ][print "no"]
Oh dear!
```

And even this:

```
red>> switch/default block! [
[        [a] [print "No way!"]
[    ][print "no"]
No way!
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-21T11:42:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2125#issuecomment-234230053>

    SWITCH is using FIND internally, so the issue is FIND not matching the datatype! properly. Here is an example of the issue:
    
    ```
    red>> find reduce [integer! 1] integer!
    == [1]
    ```

--------------------------------------------------------------------------------

On 2016-07-21T15:21:57Z, WiseGenius, commented:
<https://github.com/red/red/issues/2125#issuecomment-234287871>

    Should this result be expected?
    
    ```
    red>> switch/default integer! [
    [        1 [print "one"]
    [        2 [print "two"]
    [        #[integer!] [print "yes"]
    [    ][print "no"]
    one
    ```
    
    Again, I could maybe understand the other way around, but still:
    
    ```
    red>> switch/default 1 [
    [        #[integer!] [print "yes"]
    [    ][print "no"]
    no
    ```
    
    And then there's this:
    
    ```
    red>> switch/default string! [
    [        1 [print "one"]
    [        2 [print "two"]
    [        "Surely not!" [print "Oh dear!"]
    [        #[string!] [print "yes"]
    [    ][print "no"]
    Oh dear!
    ```
    
    And still this:
    
    ```
    red>> switch/default block! [
    [        [a] [print "No way!"]
    [    ][print "no"]
    No way!
    ```
    
    And should this be happening?
    
    ```
    red>> switch/default [print "a"] [
    [        [a] [print "a"]
    [        [b] [print "b"]
    [    ][print "no"]
    *** Script Error: b has no value
    *** Where: switch
    ```
    
    And therefore this strange value again?
    
    ```
    red>> switch/default [print "b"] [
    [        [a] [print "a"]
    [        [b] [print "b"]
    [    ][print "no"]
    *** Script Error: author has no value
    *** Where: switch
    ```
    
    Rebol 2 and 3 return "no" in both of the last 2 cases. Is it too early to test for this sort of thing?

--------------------------------------------------------------------------------

On 2016-07-23T06:18:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2125#issuecomment-234702213>

    Should work like Rebol now. Support for block-as-keys has been removed, as it causes too many ambiguities, and prevents multiple keys support.

--------------------------------------------------------------------------------

On 2016-07-26T00:16:09Z, WiseGenius, commented:
<https://github.com/red/red/issues/2125#issuecomment-235125503>

    One of the later fixes has caused a regression:
    
    ```
    red>> switch/default 'a-word ['a-word [print "OK"]][print "broken"]
    broken
    ```

--------------------------------------------------------------------------------

On 2016-07-26T01:45:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2125#issuecomment-235139037>

    That case is correct, `switch` argument is strictly matched, so `'a-word` evaluates to `a-word` (type word!) and does not match `'a-word` (type lit-word!) in the body block. Same as in Rebol2 and Rebol3.
    
    If you want to match a lit-word!, you need to pass one as argument:
    
    ```
    red>> switch/default first ['a-word]['a-word [print "OK"]][print "broken"]
    OK
    ```

--------------------------------------------------------------------------------

On 2016-07-26T02:26:10Z, WiseGenius, commented:
<https://github.com/red/red/issues/2125#issuecomment-235144838>

    Oops! Or this way if I wanted to match a word:
    
    ```
    >> switch/default first [a-word] [a-word [print "OK"]][print "broken"]
    OK
    >> switch/default 'a-word [a-word [print "OK"]][print "broken"]
    OK
    ```
    
    Thanks.

--------------------------------------------------------------------------------

On 2016-07-26T02:57:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2125#issuecomment-235149116>

    Right. ;-) Thanks for all the test cases, we'll convert them to unit tests.



#3569: lexical clash between signed numbers and words
================================================================================
Issue is open, was reported by 9214 and has 10 comment(s).
[type.design]
<https://github.com/red/red/issues/3569>

**Describe the bug**
Signed values of `float!` and `integer!` types clash with words that start with a `-` character.

**To Reproduce**
```red
>> reduce [-1 '-1 -2.3 '-2.3 4:5:-6]
== [-1 -1 -2.3 -2.3 4:05:00 unset]
```
As you can see, they are now lexically indistinguishable, and lexer processes `:-6` portion as a `get-word!`, instead of raising an error about poorly formed `time!` value with negative seconds.

**Platform version (please complete the following information):**
```
Red 0.6.3 for Windows built 11-Oct-2018/20:31:29+05:00 commit #1d43d77
```


Comments:
--------------------------------------------------------------------------------

On 2019-04-16T21:02:04Z, 9214, commented:
<https://github.com/red/red/issues/3569#issuecomment-483841971>

    Also:
    ```red
    >> reduce [.0 '.0 '.0.]
    == [0.0 .0 .0.]
    >> .0.
    *** Syntax Error: invalid float! at ".0."
    *** Where: do
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2019-04-16T22:40:23Z, greggirwin, commented:
<https://github.com/red/red/issues/3569#issuecomment-483870244>

    I get this error under 0.6.4:
    ```
    >> .0.
    *** Syntax Error: invalid type at ".0."
    *** Where: do
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2019-06-04T12:58:12Z, 9214, commented:
<https://github.com/red/red/issues/3569#issuecomment-498660442>

    Somewhat related:
    ```red
    >> reduce ['<> make tag! 0]
    == [<> <>]
    ```

--------------------------------------------------------------------------------

On 2019-06-05T17:47:40Z, greggirwin, commented:
<https://github.com/red/red/issues/3569#issuecomment-499186500>

    It will always be possible to create values that are visually indistinguishable, without using `mold/all`. R2 errors on `'-1` or `'+1` lexing, but not `'--1` or `'++1`. It also discards/ignores negative seconds when lexing time, as in your example.
    
    Note that you could still create this problem, even in R2:
    ```
    >> to word! "-1"
    == -1
    ```
    with no way to round trip it back to a word, without prior knowledge. That is, `mold/all+load` will convert it to an integer. 
    
    Tricky, tricky, tricky.

--------------------------------------------------------------------------------

On 2020-07-13T19:02:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/3569#issuecomment-657735756>

    At least one issue is fixed now:
    ```
    >> 4:5:-6
    *** Syntax Error: (line 1) invalid time at 4:5:-6
    *** Where: transcode
    *** Stack: load 
    ```


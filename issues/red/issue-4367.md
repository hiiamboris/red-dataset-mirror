
#4367: Inconsistency in setting components of binary value
================================================================================
Issue is open, was reported by meijeru and has 28 comment(s).
[type.bug]
<https://github.com/red/red/issues/4367>

```
>> b: #{ }
== #{ }
>> head insert b 300
*** Script Error: value out of range: 300
*** Where: insert
>> b: #{00}
== #{00}
>> b/1: 300
== 300
>> b
== #{2C}
>> b: #{ }
== #{ }
>> head insert b -300
== #{D4}
>> b: #{00}
== #{00}
>> b/1: -300
== -300
>> b
== #{D4}
```

In other words: setting by indexing truncates the integer value, setting by insertion does the same for negative values, but positive values are bound-checked.


Comments:
--------------------------------------------------------------------------------

On 2020-03-25T10:57:26Z, meijeru, commented:
<https://github.com/red/red/issues/4367#issuecomment-603775437>

    The behaviour exhibited by `insert` is also shown by `change`, `replace`, `alter`, `insert`, `append` and `repend`. Thus it seems connected to a single check in the implementation.

--------------------------------------------------------------------------------

On 2020-03-25T11:25:44Z, Oldes, commented:
<https://github.com/red/red/issues/4367#issuecomment-603787399>

    @meijeru cannot reproduce on fast-lexer branch from yesterday on Windows:
    ```
    >> b: #{} try [insert b 300] b
    == #{}
    ```

--------------------------------------------------------------------------------

On 2020-03-25T12:10:02Z, meijeru, commented:
<https://github.com/red/red/issues/4367#issuecomment-603804537>

    But see https://github.com/red/red/blob/master/runtime/datatypes/binary.reds#L1180, this is not changed by fast-lexer -- it clearly tests ONLY on <= 255, not on >= 0

--------------------------------------------------------------------------------

On 2020-03-25T12:26:14Z, Oldes, commented:
<https://github.com/red/red/issues/4367#issuecomment-603811026>

    @meijeru there must be something changed in fast-lexer. Here is your longer test in my console:
    ```red
    >> b: #{}
    == #{}
    >> head insert b 300
    *** Script Error: value out of range: 300
    *** Where: insert
    *** Stack:  
    
    >> b
    == #{}
    ```
    
    Actually I'm not able to reproduce it in older versions too:
    ```
    >> about
    Red 0.6.4 for Windows built 3-Oct-2019/12:12:42+01:00
    
    >> b: #{} try [insert b 300] b
    == #{}
    ```

--------------------------------------------------------------------------------

On 2020-03-25T12:30:22Z, Oldes, commented:
<https://github.com/red/red/issues/4367#issuecomment-603812633>

    But it's true, that the check is not used with path access:
    ```red
    >> b: #{00} b/1: 300 
    == 300 <--- should be error!
    >> b
    == #{2C} ;<--- wrong!
    ```

--------------------------------------------------------------------------------

On 2020-03-25T13:24:38Z, 9214, commented:
<https://github.com/red/red/issues/4367#issuecomment-603837140>

    What about this?
    ```red
    >> b: #{abcd} b/1: #"e" b
    == #{65CD}
    >> poke b 2 #"d" b
    == #{6564}
    ```
    
    I also cannot make sense of the inconsistency pointed out; what's the desired behavior? Error or truncation?

--------------------------------------------------------------------------------

On 2020-03-25T14:30:50Z, meijeru, commented:
<https://github.com/red/red/issues/4367#issuecomment-603871888>

    In both lines, the `char!` value is converted into an `integer!` and that integer is within the bounds `0..255` so there is NO error and NO truncation needed. It is all correct in this case. Thanks for pointing out that `char!` values are also allowed.

--------------------------------------------------------------------------------

On 2020-03-25T14:34:34Z, 9214, commented:
<https://github.com/red/red/issues/4367#issuecomment-603874112>

     Okay, I'll phrase it differently:
    ```red
    >> b: #{abcd} b/2: #"🐇" b
    == #{AB07}
    >> to-hex to integer! #"🐇"
    == #0001F407
    ```

--------------------------------------------------------------------------------

On 2020-03-25T14:35:57Z, meijeru, commented:
<https://github.com/red/red/issues/4367#issuecomment-603874913>

    Same comment: binary representation of the Unicode Code Point (integer number) is truncated. Consistent at least.

--------------------------------------------------------------------------------

On 2020-03-25T15:01:47Z, meijeru, commented:
<https://github.com/red/red/issues/4367#issuecomment-603890651>

    BUT: it is even more complicated: on `insert` , a `char!` value is converted to binary using UTF-8, so NO truncation occurs, and not on.ly single characters are allowed but also strings -- also with UTF-8 conversion. Presumably the same thing for `change` etc. I have a hard time documenting all of this behaviour in the specs doc.

--------------------------------------------------------------------------------

On 2020-03-25T17:48:18Z, meijeru, commented:
<https://github.com/red/red/issues/4367#issuecomment-603988141>

    I now discover that integer values are (arbitrarily) truncated on insertion, while float values contribute the full 64 bits, and tuples are also allowed:
    ```
    >> head insert #{} 1.0
    == #{3FF0000000000000}
    >> head insert #{} 1.2.3.4.5.6.7.8.9.10.11.12
    == #{0102030405060708090A0B0C}
    ```
    What more surprises await us?

--------------------------------------------------------------------------------

On 2020-03-26T10:11:18Z, meijeru, commented:
<https://github.com/red/red/issues/4367#issuecomment-604341747>

    I believe I have now covered everything in the spec document (sections 5.6 and 9.3)

--------------------------------------------------------------------------------

On 2020-05-15T06:51:48Z, qtxie, commented:
<https://github.com/red/red/issues/4367#issuecomment-629063400>

    I propose the following changes:
    1. when setting by indexing (set-path or poke), do bound-checking.
    ```
    b: #{00}
    b/1: 300      ;-- throw error
    poke b 1 -1   ;-- throw error
    ```
    2. when inserting values, insert the whole value, no bound-checking.
    ```
    >> head insert #{} 1
    == #{00000001}            ;@@ will be #{0000000000000001} if it's 64bit integer!
    >> head insert #{} #"🐇"
    == #{F09F9087}
    >> head insert #{} 1.0
    == #{3FF0000000000000}
    >> head insert #{} 1.2.3.4.5.6.7.8.9.10.11.12
    == #{0102030405060708090A0B0C}
    ```
    For inserting integer!, I'm not sure if it's worth to make the binary fit the value.
    ```
    >> head insert #{} 1
    == #{01}
    >> head insert #{} 256
    == #{0100}
    >> head insert #{} 700000
    == #{0AAE60}
    ```
    In this way, the result is the same if we use 64bit integer! later.

--------------------------------------------------------------------------------

On 2020-05-15T08:11:47Z, meijeru, commented:
<https://github.com/red/red/issues/4367#issuecomment-629097138>

    @qxtie For myself, I can agree with this proposal.


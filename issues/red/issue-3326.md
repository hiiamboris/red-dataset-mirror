
#3326: Number conversion
================================================================================
Issue is closed, was reported by GerardSontag and has 14 comment(s).
<https://github.com/red/red/issues/3326>

### Expected behavior
>> to-integer 2#{00000001}
== 1
>> to-integer 16#{00000001}
== 1
so 
to-integer 16#{0001} would return  1
### Actual behavior
unfortunatly
>> to-integer 64#{0001}
== 13847861
and
>> to-integer 64#{00000001}
== -749914925
return wrong values
### Steps to reproduce the problem
N/A
### Red and platform version
0.6.3 W10/64b



Comments:
--------------------------------------------------------------------------------

On 2018-04-11T12:42:32Z, meijeru, commented:
<https://github.com/red/red/issues/3326#issuecomment-380437881>

    There is a misunderstanding here: What is enclosed by `64#{` and `}` is encoded by [Base64](https://en.wikipedia.org/wiki/Base64) encoding, and not by normal hexadecimal encoding. Try `64#{0001}` in the console, and you will see that it is not equal to `16#{0001}`. Each of the three variants, `2#{ }`, `16#{ }` or `#{ }`, and `64#{ }` has its own encoding rules.

--------------------------------------------------------------------------------

On 2018-04-11T12:57:05Z, DideC, commented:
<https://github.com/red/red/issues/3326#issuecomment-380442053>

    @GerardSontag `64#{0001}` is not equal to `16#{0001}` !!
    I invite you to read what is base 64 encoding, for exemple on [wikipedia](https://en.wikipedia.org/wiki/Base64).
    And test in the console:
    ```
    >> 64#{0001}
    == #{D34D35}
    >> 16#{d34d35}
    == #{D34D35}
    ```

--------------------------------------------------------------------------------

On 2018-04-11T12:58:42Z, meijeru, commented:
<https://github.com/red/red/issues/3326#issuecomment-380442508>

    Thanks @DideC for reinforcing my comments. I would recommend this issue for closing.

--------------------------------------------------------------------------------

On 2018-04-11T15:58:27Z, 9214, commented:
<https://github.com/red/red/issues/3326#issuecomment-380504745>

    @GerardSontag before reporting an "issue", it might be a good idea to check out in [/bugs](https://gitter.im/red/bugs) room and clarify if the observed behavior is indeed buggy and unexpected.

--------------------------------------------------------------------------------

On 2018-04-11T16:40:55Z, greggirwin, commented:
<https://github.com/red/red/issues/3326#issuecomment-380518205>

    @GerardSontag, you can also use to play with alternate representations, to compare.
    ```
    >> to char! 1
    == #"^A"
    >> enbase/base "^A" 64
    == "AQ=="
    >> enbase/base "^A" 16
    == "01"
    >> debase/base "00000001" 64
    == #{D34D34D34D35}
    ```

--------------------------------------------------------------------------------

On 2018-04-11T17:10:37Z, GerardSontag, commented:
<https://github.com/red/red/issues/3326#issuecomment-380527445>

    Thank you all,  my apologies
    "There is a misunderstanding here" 

--------------------------------------------------------------------------------

On 2018-04-12T01:41:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3326#issuecomment-380647584>

    Not to worry Gerard. We've all been there.


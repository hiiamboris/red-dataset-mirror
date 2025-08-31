
#4577: Remainder silently allows (char % negative int) and (tuple % negative int)
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.resolved]
<https://github.com/red/red/issues/4577>

**Describe the bug**

```
>> #"^A" % 10
== #"^A"
>> #"^A" % -10
== #"^A"
```
Latter should be `-#"^A"` which is impossible, so should raise an error.

```
>> 1.2.3.4 % -10
== 1.2.3.4
```
Same here.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Jun-2020/21:32:08+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-16T20:10:10Z, 9214, commented:
<https://github.com/red/red/issues/4577#issuecomment-659644543>

    https://github.com/red/red/issues/3650

--------------------------------------------------------------------------------

On 2020-07-22T15:59:00Z, 9214, commented:
<https://github.com/red/red/issues/4577#issuecomment-662537581>

    This and https://github.com/red/red/issues/4215 actually remind me... @theSherwood since you have expressed an interest in writing tests, would you like to work on `tuple!` datatype test suite?

--------------------------------------------------------------------------------

On 2020-08-03T14:57:12Z, 9214, commented:
<https://github.com/red/red/issues/4577#issuecomment-668069232>

    > Latter should be -#"^A" which is impossible, so should raise an error.
    
    Consider:
    ```red
    >> to integer! #"A"
    == 65
    >> 65 % -10
    == 5
    >> #"A" % -10
    == #"^E"
    >> to integer! #"A" % -10
    == 5
    ```
    
    > Same here.
    
    Consider:
    ```red
    >> 7.8.0 % -4
    == 3.0.0
    >> 7x8 % -4
    == 3x0
    ```
    
    AFAIK remainder can be negative only if the dividend is negative. And since neither `char!` nor `tuple!` can be negative, the existing behavior is IMO expected.

--------------------------------------------------------------------------------

On 2020-08-04T07:32:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/4577#issuecomment-668432650>

    I must have been very tired when I wrote this :D
    Thanks.

--------------------------------------------------------------------------------

On 2020-08-04T10:26:25Z, 9214, commented:
<https://github.com/red/red/issues/4577#issuecomment-668515735>

    @hiiamboris happens with all of us #4558 😳 



#3729: Component of pixel cannot be set individually using path expression
================================================================================
Issue is open, was reported by meijeru and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/3729>

**Describe the bug**
An individual pixel (component of an image!) is a 4-tuple RGBA. Any tuple component can be retrieved, but setting it does not work.

**To reproduce**
```
>> i: make image! 1x1
> i/1
== 255.255.255.0
>> i/1/1
== 255
>> i/1/1: 0
== 0
>> i/1
==  255.255.255.0
```
**Expected behavior**
After the last setting, `i/1` should be `0.255.255.0`.

**Platform version (please complete the following information)**
```
Presumably all
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-14T16:02:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/3729#issuecomment-454057721>

    Yeah I'd like to see that working too. But FYI, it doesn't work in R2 at all, and R3 always changes the 4th component (alpha), regardless of the requested index.

--------------------------------------------------------------------------------

On 2019-01-14T16:21:13Z, meijeru, commented:
<https://github.com/red/red/issues/3729#issuecomment-454065054>

    I can see no reason why it should not work in Red. I know that `poke` does not work on tuples (or any other direct value that has components, i.e. time date and pair) but path expressions do.

--------------------------------------------------------------------------------

On 2020-03-04T12:23:41Z, Oldes, commented:
<https://github.com/red/red/issues/3729#issuecomment-594489887>

    Is there any good usage example for it?

--------------------------------------------------------------------------------

On 2020-03-04T20:21:38Z, greggirwin, commented:
<https://github.com/red/red/issues/3729#issuecomment-594813992>

    The interesting thing is that there is a `poke` function in %tuple.reds, and `eval-path` calls that, so I don't know why it's not set in the action handlers when the datatype is registered.


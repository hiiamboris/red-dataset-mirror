
#2619: Incorrect behaviour of to function with issue! datatype
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2619>

There are a few related issues with the to function and the issue! datatype.

1. An error is raised when the converting a string that begins with a digit.
```text
>> to issue! "1bigissue"
*** Syntax Error: invalid integer! at "1bigissue"
*** Where: do
>> to issue! "1"
*** Syntax Error: invalid character in: "1"
*** Where: to
>> to issue! "10"
*** Syntax Error: invalid character in: "10"
*** Where: to
```
2. The word syntax rules are not applied when converting an issue! to a word!
```text
>> w: to word! to issue! first "1"
== 1
>> in system/words :w
== 1
```

3. To converts the character #"1' to an issue! #1 but not the integer 1
```
>> to issue! #"1"
== #1
>> to issue! 1
*** Script Error: cannot MAKE/TO issue! from: 1
*** Where: to
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T15:04:17Z, dockimbel, commented:
<https://github.com/red/red/issues/2619#issuecomment-318676685>

    For part 3, Red does like Rebol3, it forbids that direct conversion, asking the user to rely on the more specifi `to-hex`. See also #2329.



#2206: Invalid parsing of email!
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2206>

```
@ => @
@@@@ => @
@10 => @10
10x10@
-10.0@
%@ => %25@
%1@ => %251@
type? %300@ => email!
%300@ => 00@
%400@ => @0@
...
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-27T10:53:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2206#issuecomment-282688486>

    `%xx` is used in all datatypes inheriting from string (but not `string!`) to represent the encoding of an ASCII character in hexadecimal format. If `%` is not followed by two hex characters, a syntax error should be raised. If the format is correct and if they represent a *displayable* character, then they are decoded in the resulting type. (Same as in Rebol)
    
    A fix has been provided for the cases where the `%xx` format is not correct in the input.
    
    For the isolated `@` and `@@@@` (which loads as `@ @ @ @`), they are left as-is until we implement the rules for the upcoming `ref!` datatype.
    
    For `10x10@` and `-10.0@`, those are accepted as `email!` inputs despite the missing domain part, as they can be useful forms for dialecting needs and they are accepted by Rebol too.


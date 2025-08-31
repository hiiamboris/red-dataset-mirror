
#4669: inconsistent treatment of hexadecimal INTEGER! values by runtime lexer
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4669>

**Describe the bug**
Per https://github.com/red/red/issues/3662#issuecomment-672896401: hexadecimal format of `integer!` values supports from 2 to 8 digits in Red/System and Red compiler lexers. By contrast, Red runtime lexer supports format with 1 to arbitrary number of digits, and takes only the last 8 digits if their number is greater than 8.

**To reproduce**
```red
>> 9h ; 1 digit
== 9
>> DEADBEEFh ; 8 digits
== -559038737
>> FACEFEEDDEADBEEFh ; 16 digits
== -559038737
```

**Expected behavior**
Since 1-digit hexadecimal integers greater than `9` cannot be unambigiously represented (they are lexed as `word!`s), I expect Red to raise an error on them. And since Red supports 32-bit arithmetic at the moment, I expect max number of hexadecimal digits to be 8.

**Platform version**
32f10e8




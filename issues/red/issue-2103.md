
#2103: Test lexer-time-1 in lexer.tests fails
================================================================================
Issue is open, was reported by PeterWAWood and has 4 comment(s).
[type.review] [type.compiler]
<https://github.com/red/red/issues/2103>

Test lexer-time-1 in lexer.tests fails:

```
--test-- "lexer-time-1" --assert [2147483645:59:59] = system/lexer/transcode {2147483645:59:59} none
```



Comments:
--------------------------------------------------------------------------------

On 2018-06-07T02:06:22Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2103#issuecomment-395269570>

    I have updated the lexer test to:
    `[2147483645:59:59] = load/all {2147483645:59:59}`
    It will evaluate to true in the interpreter and false in the compiler. 

--------------------------------------------------------------------------------

On 2020-03-21T19:08:08Z, 9214, commented:
<https://github.com/red/red/issues/2103#issuecomment-602088880>

    #2102


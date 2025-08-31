
#2818: Parse is influenced by print and probe
================================================================================
Issue is closed, was reported by toomasv and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2818>

Adding `print` or `probe` to `parse` spec influences parsing `process`
`
>> parse "abc" [to [s: "bc"] 2 skip]
== true
>> parse "abc" [to [s: (print s) "bc"] 2 skip]
abc
bc
c
== false
>> parse "abc" [to [s: (probe s) "bc"] 2 skip]
"abc"
"bc"
"c"
""
== false

`


Comments:
--------------------------------------------------------------------------------

On 2017-06-18T10:40:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2818#issuecomment-309269491>

    Can be reproduced without any code in the paren:
    ```
    >> parse "abc" [to [s: () "bc"] 2 skip]
    == false
    ```

--------------------------------------------------------------------------------

On 2017-06-18T11:34:24Z, dockimbel, commented:
<https://github.com/red/red/issues/2818#issuecomment-309272126>

    The issue is caused in TO/THRU iterating on a block of rules, the internal matching state is not properly reset in such case.


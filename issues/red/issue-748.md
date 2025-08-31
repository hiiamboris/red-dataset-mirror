
#748: Parse: printed values <> probed values after parsing
================================================================================
Issue is closed, was reported by ghost and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/748>

An example : 
`red>> txt: "Hello world"
== "Hello world"
red>> parse txt [ while any [ remove "l" | skip ] ]
== true
red>> txt
== "Heo word"
red>> print txt
Heo wordddd
red>>  length? txt
== 8
red>>`

This bug can't be detected by parse quick-tests, because it compares probed values.



Comments:
--------------------------------------------------------------------------------

On 2014-03-31T10:31:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/748#issuecomment-39074133>

    I've added a test to compiler/print-test.r to cover the print issue (it currently fails) and one to units/parse-test.red to cover the parse rule.

--------------------------------------------------------------------------------

On 2014-03-31T10:46:22Z, rmn64k, commented:
<https://github.com/red/red/issues/748#issuecomment-39075189>

    It's not parse per se that is the problem. The remove action for string doesn't move the terminating NUL character. You can see the same problem here:
    
    ```
    red>> txt: "foo"
    == "foo"
    red>> remove txt
    == "oo"
    red>> print txt
    ooo
    red>> length? txt
    == 2
    ```

--------------------------------------------------------------------------------

On 2014-03-31T12:59:40Z, dockimbel, commented:
<https://github.com/red/red/issues/748#issuecomment-39085003>

    Good catch!

--------------------------------------------------------------------------------

On 2014-03-31T13:02:25Z, dockimbel, commented:
<https://github.com/red/red/issues/748#issuecomment-39085271>

    Fixed by commit [5cba1bd7](https://github.com/red/red/commit/5cba1bd7f1508116edc6a49c6ec2b2bba3dd1905).


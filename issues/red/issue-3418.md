
#3418: -2147483647:2147483647 evaluates to double negated time! value
================================================================================
Issue is open, was reported by PeterWAWood and has 6 comment(s).
[type.design]
<https://github.com/red/red/issues/3418>

### Expected behavior
```text
>> -2147483647:2147483647
*** Syntax Error: invalid date! at "-2147483647:2147483647"
*** Where: do
*** Stack: load
```
This is the behaviour when the same time is used in a date!:
```text
>> 1/1/2018/-2147483647:2147483647
*** Syntax Error: invalid date! at "-2147483647:2147483647"
*** Where: do
*** Stack: load
```
### Actual behavior
```text
>> -2147483647:2147483647
== --2147483648:07:00
```
### Steps to reproduce the problem
### Red and platform version
macOS 10.12.16
commit 51a41b602120d32d8bf699684de0366fc6d9e269 (HEAD -> master)



Comments:
--------------------------------------------------------------------------------

On 2020-03-22T11:08:00Z, 9214, commented:
<https://github.com/red/red/issues/3418#issuecomment-602182066>

    On `fast-lexer`:
    ```red
    >> -2147483647:2147483647
    == 2111692252:53:00
    ```

--------------------------------------------------------------------------------

On 2020-07-13T19:33:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/3418#issuecomment-657750148>

    On newer fast-lexer:
    ```
    >> -2147483647:2147483647
    == --2147483648:07:00
    >> about
    Red 0.6.4 for Windows built 28-Jun-2020/23:30:17+03:00 commit #b452716
    ```

--------------------------------------------------------------------------------

On 2020-08-03T14:03:00Z, 9214, commented:
<https://github.com/red/red/issues/3418#issuecomment-668040372>

    Also:
    ```red
    >> 0:0 % 0
    == --2147483648:-2147483648:00
    ```
    Is this, like, triple negated? 2deep4me.


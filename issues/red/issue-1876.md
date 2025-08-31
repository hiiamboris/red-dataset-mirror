
#1876: Removing a matched rule at the beginning of input will yield false result
================================================================================
Issue is closed, was reported by Zamlox and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1876>

```
red>> digit: charset "0123456789"
== make bitset! #{000000000000FFC0}
red>> parse "&1a" [any [remove ["&" some digit] | skip ]]
== false
```

Following code returns true:

```
red>> parse "c&1a" [any [remove ["&" some digit] | skip ]]
== true
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-04T15:25:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1876#issuecomment-216901056>

    This behavior is not a bug, `any` and `some` have built-in checkings for possible infinite loops. One requirement is that the input position advances after one iteration, otherwise it is considered a probably infinite loop and the rule exits (failing to match all the input, hence the returned `false`).
    
    The usual workaroung is to use the `while` command, which works exactly like `any`, but has no safety-checks, so it's up to the user to know when it is appropriate to use it. In the above case, it would make it pass:
    
    ```
    red>> digit: charset "0123456789"
    == make bitset! #{000000000000FFC0}
    red>> parse "&1a" [while [remove ["&" some digit] | skip ]]
    == true
    ```
    
    However, even if the position has not changed, the input is _consumed_ from right side by a successful `remove` matching, so it would be good if such right-consumption would be accepted as valid iteration.

--------------------------------------------------------------------------------

On 2016-05-04T15:36:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1876#issuecomment-216904846>

    New behavior for `any` and `some` implemented.


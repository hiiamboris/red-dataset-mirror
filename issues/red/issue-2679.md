
#2679: `prin` does not work correctly with `ask` command
================================================================================
Issue is open, was reported by Oldes and has 8 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/2679>

Using code like:
```
prin "name: " ask ""
```
will put cursor on invalid position in gui-console and does not show `prin` content in the terminal console.



Comments:
--------------------------------------------------------------------------------

On 2017-05-31T16:02:06Z, Oldes, commented:
<https://github.com/red/red/issues/2679#issuecomment-305234406>

    Problem is in these lines: https://github.com/red/red/blob/master/environment/console/input.red#L333-L338
    
    Simply `ask` clears screen bellow and always resets cursor'a col position (because of its use as a main prompt in console). So now it is not possible to have input in the middle of the screen using ANSI sequences like is possible in REBOL:
    ```
    prin "^[[2J" ;clears screen and resets cursor to 0x0
    prin "^[[5;10H"  ;moves cursor position on row 5 and col 10
    ask "Name: " ;do some input there
    ```

--------------------------------------------------------------------------------

On 2018-03-17T09:43:47Z, dockimbel, commented:
<https://github.com/red/red/issues/2679#issuecomment-373907597>

    Same issue in 0.6.4 branch.

--------------------------------------------------------------------------------

On 2018-06-21T09:42:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/2679#issuecomment-399041886>

    `prin "something" input` doesn't work too
    :point_up: ["help" room  June 21, 2018 10:37 AM](https://gitter.im/red/red/welcome?at=5b2b55adce3b0f268d346455)

--------------------------------------------------------------------------------

On 2022-09-30T08:12:41Z, qtxie, commented:
<https://github.com/red/red/issues/2679#issuecomment-1263256809>

    Fixed in gui-console. CLI console still has the issue.


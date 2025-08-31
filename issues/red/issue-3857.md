
#3857: [crash] PRINT with block argument crashes in GUI console
================================================================================
Issue is closed, was reported by Oldes and has 8 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3857>

**Describe the bug**
Including red-system code in Red, which contains `print-line` with a `block!` argument crashes GUI console,but is working fine under CLI console. 

**To reproduce**
Include this in `gui-console.red` file:
```
test: context [
	foo: routine[][
		print-line "hello" ;<--- this one is always fine
		print-line ["--> " 1] ;<--- this crashes in GUI console but not with CLI
	]
]
```
and call `test/foo` from console.

**Expected behavior**
Line with text is printed. Now it crash under GUI.



Comments:
--------------------------------------------------------------------------------

On 2019-04-21T13:06:30Z, qtxie, commented:
<https://github.com/red/red/issues/3857#issuecomment-485250192>

    I cannot reproduce it. No crash on Win10.
    ```
    >> about
    Red 0.6.4 for Windows built 21-Apr-2019/15:04:09+02:00
    
    >> test/foo
    hello
    --> 1
    ```

--------------------------------------------------------------------------------

On 2019-04-21T13:15:46Z, Oldes, commented:
<https://github.com/red/red/issues/3857#issuecomment-485250933>

    @qtxie are you using release mode? The one when there is no CLI window open.

--------------------------------------------------------------------------------

On 2019-04-21T18:10:57Z, qtxie, commented:
<https://github.com/red/red/issues/3857#issuecomment-485271397>

    @qtxie OK. With `-t Windows` flag I can reproduce the issue now.

--------------------------------------------------------------------------------

On 2019-04-21T19:12:21Z, qtxie, commented:
<https://github.com/red/red/issues/3857#issuecomment-485275346>

    Fixed in commit 9c7cd2b


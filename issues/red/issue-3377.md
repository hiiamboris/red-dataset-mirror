
#3377: Console generates random dates differently from compiler and interpreter
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3377>

This short script, extracted from date-test.red, demonstrates that both the gui console and cli console on macOS generate different random dates to the interpreter and compiler.
```text
Red[]
ex: [
	3-Mar-0000/13:44:24+09:45
	14-Jan-2046/9:34:48-12:15
	19-Nov-4262/9:41:12-01:30
	12-Feb-1864/3:26:00-14:30
	29-Jul-4351/8:14:00+09:30
	18-Dec-1884/22:30:48-07:00
	21-May-5509/0:14:24-03:00
	23-Apr-4622/4:22:48+05:30
	22-Feb-1583/16:36:48-14:45
	26-Feb-6712/17:07:12-10:00
]
res: make block! 10
random/seed 2
loop 10 [append res random 1/1/9999/23:59:59]
repeat i 10 [
	if res/:i <> ex/:i [
		print ["Value " i "does not match expected"]
		print ["expected: " ex/:i]
		print ["actual:   " res/:i]
	]
]
```
### Expected behavior
The script should produce no output.
### Actual behavior
The script produces no output when compiled or interpreted ("do [" inserted after "Red[]" and "]" appended at the and then compiled.)
When run in a console, the script reports differences in the 2nd, 3rd, 4th and 9th values.
### Steps to reproduce the problem
Run the script in the cli or gui console
### Red and platform version
```
commit 89b8181cc97f2b3b9c4389af27a6e97584407c7d (HEAD -> master, upstream/master)
macOS 10.12.16
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-09T08:58:28Z, dockimbel, commented:
<https://github.com/red/red/issues/3377#issuecomment-387671941>

    Looks like a random number generator seed setting issue?

--------------------------------------------------------------------------------

On 2018-05-09T11:28:31Z, iArnold, commented:
<https://github.com/red/red/issues/3377#issuecomment-387708777>

    Even stranger. I tried this in both consoles and got the very same output.
    Then I did a random/seed 2 and generated ten times the random date by hand and saw the same outcomes as the predicted outcome.
    Then I ran the script again and did a "probe ex". Guess what the contents of ex was?
    >> probe ex
    [
        3-Mar-0000/13:44:24+09:45 
        14-Jan-2046/9:34:48-11:45 
        19-Nov-4262/9:41:12+00:30 
        12-Feb-1864/3:26:00-13:30 
        29-Jul-4351/8:14:00+09:30 
        18-Dec-1884/22:30:48-07:00 
        21-May-5509/0:14:24-03:00 
        23-Apr-4622/4:22:48+05:30 
        22-Feb-1583/16:36:48-13:15 
        26-Feb-6712/17:07:12-10:00
    ]
    
    Clearly not the same ex as it was before!
    ex is "corrupted" right from the beginning, right after it is created.

--------------------------------------------------------------------------------

On 2018-05-09T14:15:13Z, qtxie, commented:
<https://github.com/red/red/issues/3377#issuecomment-387753337>

    @iArnold Thanks. It's a load issue.
    ```
    >> 14-Jan-2046/9:34:48-12:15
    == 14-Jan-2046/9:34:48-11:45
    ```



#3579: Action to issue! and function to-issue convert string to issue value error
================================================================================
Issue is closed, was reported by yanjl and has 8 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/3579>

**Describe the bug**
Action to issue! and function to-issue convert string to issue value error.

**Expected behavior**
to issue! "123.42-xxx"
expected:  #123.42-xxx

**Screenshots**
*** Syntax Error: invalid float! at "123.42-xxx"
*** Where: do
*** Stack:

**Platform version(please complete the following information):**
```
Red for Windows version 0.6.3 built 28-Sep-2018/10:28:45+08:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-29T07:14:15Z, yanjl, commented:
<https://github.com/red/red/issues/3579#issuecomment-433809310>

    to issue! "555-555-555" also error, display "Syntax Error: invalid integer!", maybe parser be terminated by delimiter marking '-'.

--------------------------------------------------------------------------------

On 2018-10-29T15:40:21Z, meijeru, commented:
<https://github.com/red/red/issues/3579#issuecomment-433959774>

    On my W10 from 23-Oct this works fine:
    ```
    >> to-issue "123.44-xxx"
    == #123.44-xxx
    ```

--------------------------------------------------------------------------------

On 2018-10-29T15:54:24Z, 9214, commented:
<https://github.com/red/red/issues/3579#issuecomment-433965441>

    Cannot confirm this issue either. @yanjl can you reproduce it with the latest automated build?

--------------------------------------------------------------------------------

On 2018-10-30T00:31:18Z, yanjl, commented:
<https://github.com/red/red/issues/3579#issuecomment-434129587>

    @9214  thank you for your advice.
    The problems have been solved with the latest automated builds.
    >> to issue! "123.44-xxx"
    == #123.44-xxx
    >> about
    Red 0.6.3 for Windows built 29-Oct-2018/17:20:34+08:00 commit #ba38da0


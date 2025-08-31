
#5148: [Draw] No error when specifying invalid gradient color 
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/5148>

**Describe the bug**
```
>> ? (draw 100x100 [fill-pen linear redd geen 0x0 100x100 box 0x0 100x100])
```
![](https://i.gyazo.com/5f056e18628d8a6040f6a95c7668cafc.png)

**Expected behavior**

Error message

**Platform version**
```
Red 0.6.4 for Windows built 25-May-2022/13:39:01+03:00  commit #f656458
```



Comments:
--------------------------------------------------------------------------------

On 2022-10-08T18:28:30Z, luce80, commented:
<https://github.com/red/red/issues/5148#issuecomment-1272374150>

    other examples:
    ```
    >> view [base draw [fill-pen linear ab circle 30x30 20x20]] ; no error but there should be as @hiiamboris example
    >> view [base draw [fill-pen linear ab circle 30x30 20]] ; error but wrong message ?
    *** Script Error: invalid Draw dialect input at: [20]
    *** Where: ???
    *** Near : none
    >> view [base draw [fill-pen linear red circle 30x30 20]] ; error but wrong message ?
    *** Script Error: invalid Draw dialect input at: [20]
    *** Where: ???
    *** Near : none
    >> view [base draw [fill-pen linear red o circle 30x30 20]] ; no error but there should be
    >> view [base draw [fill-pen linear red orange circle 30x30 20]] ; OK
    ```



#4658: access violation on append to text-list
================================================================================
Issue is closed, was reported by bubnenkoff and has 6 comment(s).
<https://github.com/red/red/issues/4658>

App crush after multiple pressing button that do append data to `text-list`

To reproduce need run next code:
```
f: func[] [
    loop 500 [append t/data "aaa"]
]

view [
    t: text-list 200x400 data []
    button [f]
]
```
and press button more than 15 times (@endo64 report about 22 pressing)

More detail here https://gitter.im/red/bugs?at=5f6a52fe5b75b305ddbb61e9

```
Red 0.6.4 for Windows built 17-Sep-2020/2:38:28+03:00 commit #ec1a426
```



Comments:
--------------------------------------------------------------------------------

On 2020-10-06T14:39:43Z, 9214, commented:
<https://github.com/red/red/issues/4658#issuecomment-704315330>

    Cannot reproduce on W10. Likely was already addressed as a part of https://github.com/red/red/issues/4576.

--------------------------------------------------------------------------------

On 2020-10-06T18:28:18Z, endo64, commented:
<https://github.com/red/red/issues/4658#issuecomment-704466375>

    Confirmed, crash doesn't happend with the latest build (tested with 100 clicks)
    ```
    Red 0.6.4 for Windows built 6-Oct-2020/19:05:05+03:00 commit #a45b0b9
    ```

--------------------------------------------------------------------------------

On 2020-10-07T11:53:16Z, bubnenkoff, commented:
<https://github.com/red/red/issues/4658#issuecomment-704883533>

    Tested. It's seems that it was fixed.


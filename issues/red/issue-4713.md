
#4713: R/S floating point output inconsistencies
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [Red/System]
<https://github.com/red/red/issues/4713>

**Describe the bug**

The following script:
`Red/System [] print-wide [1.0 / 0.0  -1.0 / 0.0  0.0 / 0.0  "^/"]`

On Windows produces the following:
`1.#INF -1.#INF -1.#IND.0`
In 2019 builds it was producing:
`1.#INF.0 -1.#INF.0 -1.#IND.0`

On Linux it produces:
`inf.0 -inf.0 -nan.0`
On RPi:
`inf -inf 1.#NaN`

**Expected behavior**

Same output on all platforms.
`1.#INF -1.#INF 1.#NAN` ?

**Platform version**
```
Red 0.6.4 for Windows built 16-Oct-2020/12:58:41+03:00 commit #e5876af
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-28T21:37:53Z, dockimbel, commented:
<https://github.com/red/red/issues/4713#issuecomment-888638697>

    @qtxie Please confirm that the fix is correct.


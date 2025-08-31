
#63: WISH: support issue as map key
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
<https://github.com/red/REP/issues/63>

See :point_up: [/help January 23, 2020 9:36 PM](https://gitter.im/red/help?at=5e29e7c0da04a624f46e1a30)

TL;DR: make these work:
```
#( #issue 100 )
put #() #issue 100
select #() #issue
extend #() [#issue 100]
```
No default coercion from issue! to any-word! and back should be done (`m/(#issue) <> m/issue`).

I wouldn't mind if `refinement!` type was supported as well.




Comments:
--------------------------------------------------------------------------------

On 2020-07-30T16:46:26Z, 9214, commented:
<https://github.com/red/REP/issues/63#issuecomment-666517900>

    Granted by https://github.com/red/red/pull/4580. **Edit**: partially.

--------------------------------------------------------------------------------

On 2020-07-30T17:42:48Z, hiiamboris, commented:
<https://github.com/red/REP/issues/63#issuecomment-666556068>

    ```
    >> m: #() ()
    >> put m #abc 234
    *** Script Error: put does not allow issue for its key argument
    *** Where: put
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2020-07-30T17:46:55Z, 9214, commented:
<https://github.com/red/REP/issues/63#issuecomment-666558884>

    Bloody hell.

--------------------------------------------------------------------------------

On 2022-04-19T16:28:05Z, hiiamboris, commented:
<https://github.com/red/REP/issues/63#issuecomment-1102852085>

    Works in `Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01`


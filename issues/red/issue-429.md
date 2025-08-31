
#429: MOLD TAB incorrect
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/429>

```
print mold tab
```
# "/"



Comments:
--------------------------------------------------------------------------------

On 2013-03-13T21:42:07Z, dockimbel, commented:
<https://github.com/red/red/issues/429#issuecomment-14870419>

    Good catch!

--------------------------------------------------------------------------------

On 2013-03-13T22:30:22Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/429#issuecomment-14872858>

    MOLD TAB is fixed now, but now I get
    
    ```
    mold "[]"
    ```
    
    "^[^]"

--------------------------------------------------------------------------------

On 2013-03-13T22:34:11Z, dockimbel, commented:
<https://github.com/red/red/issues/429#issuecomment-14873034>

    The same routine is used for escaping both char! and string! values...looking into a better fix.

--------------------------------------------------------------------------------

On 2013-03-13T23:03:21Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/429#issuecomment-14874276>

    Do brackets need to be escaped? REBOL doesn't.

--------------------------------------------------------------------------------

On 2013-03-14T01:31:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/429#issuecomment-14881810>

    Now I'm getting:
    
    ```
    mold {
    }
    ```
    
    "^J"

--------------------------------------------------------------------------------

On 2013-03-14T01:37:47Z, dockimbel, commented:
<https://github.com/red/red/issues/429#issuecomment-14881972>

    Off-by-one error...1-base indexing is making things more complicated than needed at Red/System level...

--------------------------------------------------------------------------------

On 2013-03-14T01:48:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/429#issuecomment-14882246>

    Such a table is no different between Red/System and Red. You're always going to have off-by-one errors in either base.

--------------------------------------------------------------------------------

On 2013-03-14T01:58:26Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/429#issuecomment-14882525>

    It's more correct now than before this bug. It used to print the newline instead of form it.


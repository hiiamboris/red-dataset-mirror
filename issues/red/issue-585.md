
#585: ^} in string is wrongly LOADed
================================================================================
Issue is closed, was reported by dockimbel and has 6 comment(s).
<https://github.com/red/red/issues/585>

```
red>> "^}"
== "="
red>> {^}}
== "="
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-01T13:23:55Z, qtxie, commented:
<https://github.com/red/red/issues/585#issuecomment-29573612>

    it‘s so much like this issue #544 

--------------------------------------------------------------------------------

On 2013-12-01T13:38:19Z, dockimbel, commented:
<https://github.com/red/red/issues/585#issuecomment-29573844>

    Yes, same kind of error, same fix. ;-)

--------------------------------------------------------------------------------

On 2013-12-01T13:42:08Z, dockimbel, commented:
<https://github.com/red/red/issues/585#issuecomment-29573904>

    Some strings are still not optimaly MOLDed, but it can wait for the new runtime lexer.
    
    ```
    red>> {^}}
    == {^}}                 ; should mold to the simpler "}" form.
    ```


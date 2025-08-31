
#514: MOLD "^^" overzealous
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/514>

Possibly caused by #513:

red>> mold "^^"
== {"^^^^^^^^"}



Comments:
--------------------------------------------------------------------------------

On 2013-08-08T23:33:27Z, dockimbel, commented:
<https://github.com/red/red/issues/514#issuecomment-22366151>

    Seems to be a console issue only, as the compiler seems to return the correct result.

--------------------------------------------------------------------------------

On 2013-08-08T23:44:02Z, dockimbel, commented:
<https://github.com/red/red/issues/514#issuecomment-22366574>

    The issue is with the runtime lexer that cannot handle correctly caret as espace character:
    
    ```
    red>> length? "^^"
    == 2
    ```


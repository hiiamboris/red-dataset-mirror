
#207: Add multi-line comment syntax option with [ and ] delimiters as well as current { and } delimiters
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/207>

When I have clashing `#define`s but one of them is in a `comment []` block, the preprocessor still bombs out on it.

```
 #define x 0
 comment [
   #define x 0
 ]
```



Comments:
--------------------------------------------------------------------------------

On 2012-02-25T14:38:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/207#issuecomment-4173209>

    The correct syntax for multiline comment is 
    
    ```
    comment {
    
    }
    ```

--------------------------------------------------------------------------------

On 2012-02-25T16:57:55Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/207#issuecomment-4174115>

    A block works, so I would still like it to work correctly.

--------------------------------------------------------------------------------

On 2012-02-25T17:11:30Z, PeterWAWood, commented:
<https://github.com/red/red/issues/207#issuecomment-4174249>

    The spec clearly states that the syntax for a multiline comment is `comment {}`. So I changed the title of the issue to reflect that this will be a change to the specified behaviour.

--------------------------------------------------------------------------------

On 2012-03-06T23:47:25Z, dockimbel, commented:
<https://github.com/red/red/issues/207#issuecomment-4359075>

    Now the compiler will return an error if a string is not passed after `comment`. Current Red/System loader cannot support blocks as comments.


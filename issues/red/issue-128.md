
#128: #if and #either don't work
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.built]
<https://github.com/red/red/issues/128>

```
#if OS <> Syllable [
    ...
]
```

Result:

```
Compiling /users/administrator/Red/Red-cURL/examples/test.reds ...
*** Compiler Internal Error: Script Error : Syllable has no value 
*** Where: check-condition 
*** Near:  [OS <> Syllable]
```

I particularly object to "Syllable has no value" ;-)



Comments:
--------------------------------------------------------------------------------

On 2011-07-04T03:15:19Z, earl, commented:
<https://github.com/red/red/issues/128#issuecomment-1495465>

    `#if OS <> 'Syllable [ ... ]` works as desired.
    
    It is for Nenad to decide whether this is a typo in the docs (which show an `#if OS = Windows` example) or a bug in the implementation.

--------------------------------------------------------------------------------

On 2011-07-04T08:47:10Z, dockimbel, commented:
<https://github.com/red/red/issues/128#issuecomment-1496457>

    It is a typo in the documentation. Accepting non-literal words as arguments would require to define per-option interpretation rules, which is, at this point, out of the scope.

--------------------------------------------------------------------------------

On 2011-07-04T12:35:08Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/128#issuecomment-1497620>

    Why does #switch not require this, then?

--------------------------------------------------------------------------------

On 2011-07-04T14:16:12Z, earl, commented:
<https://github.com/red/red/issues/128#issuecomment-1498154>

    Because it's interpreted the same as in REBOL (as it is, after all, interpreted _by_ REBOL). In REBOL:
    
    ```
    >> a: 'foo
    
    >> if a = 'foo [true]
    == true
    
    >> switch a [foo [true]]
    == true
    ```


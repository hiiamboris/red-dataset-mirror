
#5420: [VID] Too aggressive binding in styles causes local values corruption
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5420>

**Describe the bug**

Coming from https://github.com/red/REP/issues/82 by [request](https://matrix.to/#/%21wUTlqkqOhNGtfQzIsO%3Amatrix.org/%241699275758116beFyk%3Agitter.im?via=tchncs.de&via=gitter.im&via=matrix.org)

Template `init` is bound to `layout` func, which is a source of unpredictable glitches, like this:
```
*** Script Error: path face/options/at-offset is not valid for integer! type
*** Where: eval-path
*** Near : align-faces begin direction align max-sz 
*** Stack: dorc view layout align-faces  
```

**To reproduce**

Run this in console:
```
list: []
i: 0
extend system/view/VID/styles [
	cell: [
		template: [type: 'panel color: gold]
		init: [append list i: i + 1]
	]
]
view [cell]
```

**Expected behavior**

`list` should not be bound by `layout`, as well as any other word except `face`.

**Platform version**
`Red 0.6.4 for Windows built 30-Oct-2023/11:45:38+03:00  commit #377b5ed`


Comments:
--------------------------------------------------------------------------------

On 2023-11-06T18:06:30Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5420#issuecomment-1795760457>

    I have 2 little requests if `BIND/only` is added:
    
    Could the first argument accept PATHS too?
    
    This to avoid this form:
    
    ```
    BIND as block! 'a/b/c/d context
    ```
    And have
    ```
    BIND 'a/b/c/d context
    ```
    
    Also a `/part` refinement would be apreciated to bind just one or more elements withoud modifying the target content. (Think when you must change the binding of a word and you must change the whole word with a new one with another binding)
    

--------------------------------------------------------------------------------

On 2023-11-07T12:21:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5420#issuecomment-1798396309>

    It was just a typo...



#4461: [CRASH] When system object is assigned to any facet of a face
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4461>

Keyword: GUI, View, VID, layout

**Describe the bug**

Try: `layout [base data system]`
Or: `layout [base data (system/words)]`

Both result in:
```
*** Runtime Error 19: stack error or overflow                      
*** in file: /D/devel/red/red-src/red-master/runtime/hashtable.reds
*** at line: 700                                                   
***                                                                
***   stack: red/_hashtable/get-value 00A93138h 11061468           
***   stack: red/ownership/unbind 02E01C28h                        
***   stack: red/ownership/unbind 02E01C28h                        
***   stack: red/ownership/unbind 02CDB7D0h                        
***   stack: red/ownership/unbind 02CDB5E0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
***   stack: red/ownership/unbind 02CDB5F0h                        
***   stack: red/ownership/unbind 02C41160h                        
```

**Expected behavior**

`data` facet assigned to the given object

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-May-2020/11:46:36+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-20T18:25:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4461#issuecomment-661257189>

    Not layout is the culprit, but ownership. Assign **almost any facet** so `system` and it crashes when tries to make this face the owner of `system`:
    ```
    f: make-face 'text
    f/pane: system
    ```
    (same crash log)
    `extra` is unaffected as it gets special treatment - totally ignored by on-change
    Some facets crash when you *unassign* them (`actors`, `edge`):
    ```
    f/actors: system
    f/actors: none
    ```
    (same crash log)
    
    Custom facets (not present in the `face!` object) are affected as well

--------------------------------------------------------------------------------

On 2020-07-20T18:36:38Z, 9214, commented:
<https://github.com/red/red/issues/4461#issuecomment-661262932>

    > extra is unaffected as it gets special treatment - totally ignored by on-change
    
    Worth documenting, I puzzled over `extra`'s inertness not so recently too.

--------------------------------------------------------------------------------

On 2020-07-20T18:42:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4461#issuecomment-661265991>

    Maybe in official docs on View?

--------------------------------------------------------------------------------

On 2022-09-19T12:13:20Z, dockimbel, commented:
<https://github.com/red/red/issues/4461#issuecomment-1250938162>

    FIxed, duplicate of #4546.


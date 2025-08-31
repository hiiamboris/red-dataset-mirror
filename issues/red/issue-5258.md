
#5258: [Help] `value needs a value` on unset paths
================================================================================
Issue is open, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5258>

**Describe the bug**

`get/any` was fixed https://github.com/red/red/issues/4988 but help is still limping:
```
>> o: object [x: 1 unset 'x]
== make object! [
    x: unset
]
>> ? o/x
*** Script Error: value needs a value
*** Where: set
*** Near : ? o/x
*** Stack: ? help-string  
```

**Expected behavior**

Should tell that path is unset.

**Platform version**
```
Red 0.6.4 for Windows built 9-Dec-2022/10:12:47+03:00  commit #ce6e33c
```


Comments:
--------------------------------------------------------------------------------

On 2022-12-17T13:37:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/5258#issuecomment-1356267546>

    R2 has the same issue:
    ```
    >> ? o/x
    ** Script Error: value needs a value
    ** Where: ?
    ** Near: value: either path? :word [first reduce reduce [word]]
    ```
    R3 not better:
    ```
    >> ? o/x
    O/X is an error of value:
      code            integer!   300
      type            word!      Script
      id              word!      no-value
      arg1            path!      length: 2 o/x
      arg2            none!      none
      arg3            none!      none
      near            block!     length: 2 [get :word]
      where           block!     length: 5 [get try case catch ?]
    ```

--------------------------------------------------------------------------------

On 2022-12-21T03:21:11Z, greggirwin, commented:
<https://github.com/red/red/issues/5258#issuecomment-1360804136>

    Q1) Should `unset?` handle paths that lead to an unset value and return true?  I think so.
    
    Q2) What should help show? With an unset word it shows "No matching values were found in the global context.", but that's not helpful for a path. I think it was Giuseppe that hit this in user code, wanting to show as much of the path as possible, so you know at what point something was none/unset. I want to say I played with that, but can't remember where I put my tinkerings just now.

--------------------------------------------------------------------------------

On 2022-12-21T11:58:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5258#issuecomment-1361224962>

    I have proposed a while ago to extend `do/next` on paths in order to support partial path evaluation, allowing to handle such cases simply and cleanly. A mezz helper can be added then to make it more convenient to use.

--------------------------------------------------------------------------------

On 2022-12-21T19:28:35Z, greggirwin, commented:
<https://github.com/red/red/issues/5258#issuecomment-1361992654>

    I remember something about that @dockimbel.
    
    @hiiamboris how is this biting you in real life. That is, where is your unset value coming from?

--------------------------------------------------------------------------------

On 2022-12-21T19:48:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/5258#issuecomment-1362016032>

    I forgot already ;)
    But likely from playing in console.
    Also I think it should distinguish these two cases and produce relevant messages:
    ```
        x: none
    ]
    >> o: object [x: 1 unset 'x]
    
    >> ? o/x
    *** Script Error: value needs a value
    *** Where: set
    *** Near : ? o/x
    *** Stack: ? help-string  
    
    >> ? o/y
    *** Script Error: value needs a value
    *** Where: set
    *** Near : ? o/y
    *** Stack: ? help-string  
    ```
    Path is unset vs path does not exist.

--------------------------------------------------------------------------------

On 2022-12-21T19:51:53Z, greggirwin, commented:
<https://github.com/red/red/issues/5258#issuecomment-1362018620>

    > Path is unset vs path does not exist.
    
    Agreed.
    
    Just thinking about how important this is, and how it happens, as we should keep pushing unset into the shadows as much as possible. Do we facilitate handling it, or deal with the pain specifically, as `help` would have to do.

--------------------------------------------------------------------------------

On 2022-12-21T20:26:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/5258#issuecomment-1362056582>

    Very low importance IMO. But also a simple fix.

--------------------------------------------------------------------------------

On 2023-08-18T18:43:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5258#issuecomment-1684302187>

    ```
    >> about
    Red 0.6.4 for Windows built 18-Aug-2023/17:57:04+03:00  commit #4fc17a4
    >> o: object [x: 1 unset 'x]
    == make object! [
        x: unset
    ]
    >> ? o/x
    *** Script Error: value needs a value
    *** Where: set
    *** Near : ? o/x
    *** Stack: ? help-string  
    ```

--------------------------------------------------------------------------------

On 2023-08-18T19:14:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5258#issuecomment-1684335532>

    Ah, I've tested with `?? o/x`... not my day today...


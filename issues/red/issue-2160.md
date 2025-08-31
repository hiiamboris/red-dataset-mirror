
#2160: Regression with latest function parameters ordering
================================================================================
Issue is closed, was reported by x8x and has 16 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2160>

This is broken with latests builds:

```
  call/output/wait {uname} o: {}
*** Script Error: call does not allow set-word! for its <anon> argument
*** Where: call
```

works with inverted refinements order:

```
  call/wait/output {uname} o: {}
;   0
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-07T09:44:52Z, meijeru, commented:
<https://github.com/red/red/issues/2160#issuecomment-238073234>

    I was prompted by this issue to look up the call files. In `system/library/call` there is a file `call.red` but the `README` says there should be a `console-call.red` also. Where is that actually?

--------------------------------------------------------------------------------

On 2016-08-07T11:17:46Z, ghost, commented:
<https://github.com/red/red/issues/2160#issuecomment-238076778>

    @meijeru I think this is the file  https://github.com/red/red/blob/master/tests/console-call.red

--------------------------------------------------------------------------------

On 2016-08-07T14:13:06Z, x8x, commented:
<https://github.com/red/red/issues/2160#issuecomment-238084722>

    @meijeru The regression is unrelated to `call` it's failing for other compiled script as well, here another example:
    
    ```
      ? load-JSON
    
    USAGE:
        load-JSON value /objects /keys /values /into out
    
    DESCRIPTION:
         Return value(s) converted from JSON format.. 
         load-JSON is of type: function!
    
    ARGUMENTS:
         value  [string! file!] => JSON value.
    
    REFINEMENTS:
         /objects => Convert objects to Red objects..
         /keys => Convert object keys to Red value..
         /values => Convert string values to Red value..
         /into => Insert contents of a JSON array or object into existing block..
             out  [block!] => Result buffer (changed, returned).
    
      load-JSON/keys/into "" b: []
    ;   none
      load-JSON/into/keys "" b: []
    *** Script Error: load-JSON does not allow set-word! for its <anon> argument
    *** Where: load-JSON
    ```

--------------------------------------------------------------------------------

On 2016-08-07T14:35:14Z, x8x, commented:
<https://github.com/red/red/issues/2160#issuecomment-238085924>

    Here with some functions provided by default:
    
    ```
    red>> extract/into/index [1 2 3 4 5 6] 2 b: [] 2
    *** Script Error: extract does not allow set-word! for its <anon> argument
    *** Where: extract
    red>> extract/index/into [1 2 3 4 5 6] 2 2 b: []
    == [2 4 6]
    ```
    
    ```
    red>> load/part/into {1 2 3} 2 b: []
    == 1
    red>> load/into/part {1 2 3} b: [] 2
    *** Script Error: load does not allow set-word! for its <anon> argument
    *** Where: load
    red>> b: []
    == []
    red>> load/into/part {1 2 3} b 2
    *** Script Error: load does not allow word! for its <anon> argument
    *** Where: load
    ```

--------------------------------------------------------------------------------

On 2016-08-07T15:51:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2160#issuecomment-238090038>

    @x8x Can you confirm that this patch fixes all your use-cases?
    
    Hmm, seems `extract/into/index [1 2 3 4 5 6] 2 b: [] 2` is still failing, the rest seems to be working fine.

--------------------------------------------------------------------------------

On 2016-08-07T16:04:15Z, x8x, commented:
<https://github.com/red/red/issues/2160#issuecomment-238090715>

    A quick check confirms `extract` still problematic, all other cases I have seams to do fine, but in many cases I reordered the parameters.
    Will wait for the `extract` case fix and do more testing after that.
    Thank you Nenad! :-)

--------------------------------------------------------------------------------

On 2016-08-07T20:46:10Z, x8x, commented:
<https://github.com/red/red/issues/2160#issuecomment-238107383>

    Shortest example:
    
    ```
    red>> a: func [/b c [integer!] /d e][]
    == func [/b c [integer!] /d e][]
    red>> a/d/b e: {} 1    ;should work
    *** Script Error: a does not allow string! for its <anon> argument
    *** Where: a
    red>> a/d/b {} e: 1    ;should work
    *** Script Error: a does not allow set-word! for its <anon> argument
    *** Where: a
    red>> a/d/b 1 e: {}    ;should rise error: "a does not allow string! for its c argument"
    *** Script Error: a does not allow set-word! for its <anon> argument
    *** Where: a
    red>> a/d/b e: 1 {}    ;should rise error: "a does not allow string! for its c argument"
    == ""
    ```

--------------------------------------------------------------------------------

On 2016-08-08T12:04:32Z, x8x, commented:
<https://github.com/red/red/issues/2160#issuecomment-238216275>

    Seams to work now, thought, the error cases still show `<anon>`:
    
    ```
      a/d/b 1 e: {}
    *** Script Error: a does not allow string! for its <anon> argument
    *** Where: a
      a/d/b e: 1 {}
    *** Script Error: a does not allow string! for its <anon> argument
    *** Where: a
    ```


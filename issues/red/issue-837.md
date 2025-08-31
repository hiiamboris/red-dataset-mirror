
#837: Access violation with unsupported path access on string value 
================================================================================
Issue is closed, was reported by Oldes and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/837>

```
red>> s: "123"
== "123"
red>> s/"1"

*** Runtime Error 1: access violation
*** in file:
```



Comments:
--------------------------------------------------------------------------------

On 2014-06-17T08:05:33Z, dockimbel, commented:
<https://github.com/red/red/issues/837#issuecomment-46278359>

    There is no support for strings in path currently, but it should exit more cleanly anyway.

--------------------------------------------------------------------------------

On 2019-02-14T16:53:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/837#issuecomment-463703360>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    s: "123"
    load {s/"1"}
    ```
    
    `red -r -d 1.red`:
    ```
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/datatypes/object.reds
    *** at line: 97
    ***
    ***   stack: red/object/rs-select 0275D274h 0326CDB4h
    ***   stack: red/error/reduce 0275D294h 0275D274h
    ***   stack: red/error/form 0275D274h 0275D284h 0275D264h -18
    ***   stack: red/actions/form 0275D274h 0275D284h 0275D264h 0
    ***   stack: red/actions/form* -1
    ***   stack: red/natives/prin* false
    ***   stack: red/natives/print* false
    ***   stack: red/stack/throw-error 0275DBB4h
    ***   stack: red/natives/do* true -1 -1 -1
    ***   stack: ctx264~transcode 002FE3CCh
    ***   stack: load
    ```

--------------------------------------------------------------------------------

On 2019-02-18T22:49:00Z, greggirwin, commented:
<https://github.com/red/red/issues/837#issuecomment-464910976>

    Hmmm, so many of these that reference the console, but not the compiler. I wonder now if it's better to reopen the old tickets, as you suggest @hiiamboris. 

--------------------------------------------------------------------------------

On 2019-02-18T22:49:25Z, greggirwin, commented:
<https://github.com/red/red/issues/837#issuecomment-464911075>

    Console does't currently suffer this problem as originally reported.


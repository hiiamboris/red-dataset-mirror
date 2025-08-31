
#1609: parse-trace does not work
================================================================================
Issue is closed, was reported by xqlab and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1609>

`red>> help parse-trace

```
USAGE:
    parse-trace input  rules  /case  /part  limit

DESCRIPTION:
     Wrapper for parse/trace using the default event processor. 
     parse-trace is of type: function!

ARGUMENTS:
     input  [series!]
     rules  [block!]

REFINEMENTS:
     /case
     /part
         limit  [integer!]

red>> parse-trace "12345678" ["1" to end]
*** Script error: parse does not allow block for its callback argument
*** Where: parse
red>> 
```

`



Comments:
--------------------------------------------------------------------------------

On 2016-02-08T14:48:08Z, WiseGenius, commented:
<https://github.com/red/red/issues/1609#issuecomment-181404439>

    This is a regression caused, I think, by one of the February 7 commits.
    
    If a function is remade from the `source` of `parse-trace`, it seems to work:
    
    ```
    red>> parse "1" ["1"]
    == true
    red>> parse-trace "1" ["1"]
    *** Script error: parse does not allow block for its callback argument
    *** Where: parse
    red>> source parse-trace
    parse-trace: func [{Wrapper for parse/trace using the default event processor} input [series!] rules [block!] /case /part limit [integer!] return: [logic! block!]][either case [parse/case/trace input rules :on-parse-event] [either part [parse/part/trace input rules limit :on-parse-event] [parse/trace input rules :on-parse-event]]]
    red>> parse-trace-2: func [{Wrapper for parse/trace using the default event processor} input [series!] rules [block!] /case /part limit [integer!] return: [logic! block!]][either case [parse/case/trace input rules :on-parse-event] [either part [parse/part/trace input rules limit :on-parse-event] [parse/trace input rules :on-parse-event]]]
    == func [{Wrapper for parse/trace using the default event processo...
    red>> parse-trace-2 "1" ["1"]
     match: ["1"] 
    input: "1" 
     ==> matched
    return: true
    == true
    red>> 
    ```

--------------------------------------------------------------------------------

On 2016-02-08T15:55:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1609#issuecomment-181437740>

    Regression caused by the extended run-time typechecker.



#845: allow to compile to multiple executables from one source file
================================================================================
Issue is closed, was reported by IngoHohmann and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/845>

The idea comes from seaside ( http://www.seaside.st ) there you could write the smalltalk equivalent of: 

```
save %test.r input "tell me something: "
```

where code would be compiled like this:
- save %test.r would run on the server
- input "tell me something: " would be sent as html/javascript to the browser
- communication between the two would be setup automatically.

This would be great for node-like servers, app-servers, easy client/server implementations could be made possible



Comments:
--------------------------------------------------------------------------------

On 2014-06-05T15:22:15Z, IngoHohmann, commented:
<https://github.com/red/red/issues/845#issuecomment-45233231>

    Just an idea to keep in mind.

--------------------------------------------------------------------------------

On 2014-06-18T04:22:18Z, dockimbel, commented:
<https://github.com/red/red/issues/845#issuecomment-46394670>

    I have a similar plan for a future Red web framework, with a GWT-like approach. 
    
    The bugtracker is not the best place for such kind of general wish, please follow the same instructions as for #844. Thanks.



#2572: refinement and issue can be map key, but retrieval does not work
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2572>

```
>> m: #(/a 1)
== #(
    /a 1
)
>> m/(/a)
== none
>> m: #(#a 1)
== #(
    #a 1
)
>> m/(#a)
== none
```



Comments:
--------------------------------------------------------------------------------

On 2017-04-13T23:02:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2572#issuecomment-294043385>

    Just for comparison, Lua allows any datatype apart from Nil to act as a key in a table (equivalent of map):
    ```lua
    > b = function () return 1 end
    > map[b] = 2
    > =map[b]
    2
    > obj = {a = 1, b = 2, c = 3}
    > map[obj] = 4
    > =map[obj]
    4
    ```

--------------------------------------------------------------------------------

On 2017-04-13T23:05:05Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2572#issuecomment-294043816>

    It seems that JavaScript is also happy to have objects and functions as array keys (equivalent to map):
    ```JavaScript
    js> o = {}
    ({})
    js> f = function() {return 1};
    (function () {return 1;})
    js> o[f] = 2;
    2
    js> o[f]
    2
    js> c = function() {return 1};
    (function () {return 1;})
    js> o[c]
    2
    js> oo = {a: 1, b: 2, c: 3};
    ({a:1, b:2, c:3})
    js> o[oo] = 4;
    4
    js> o[oo]
    4
    js> o
    ({'function () {\n    return 1;\n}':2, '[object Object]':4})
    ```

--------------------------------------------------------------------------------

On 2019-08-20T14:05:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2572#issuecomment-523030563>

    In current version, refinements are no more allowed to be keys:
    ```
    >> m: #(/a 1)
    *** Script Error: refinement! type is not allowed here
    *** Where: do
    *** Stack: load 
    ```


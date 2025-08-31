
#4641: help on function with refinements after /local not show these refinements
================================================================================
Issue is closed, was reported by bitbegin and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4641>



**To reproduce**

refinements after /local
```
>> a: func [/local /test][]
== func [/local /test][]
>> ? a
USAGE:
     A

DESCRIPTION:
     A is a function! value.

>>
```
However, refinements before /local
```
>> a: func [/test /local][]
== func [/test /local][]
>> ? a
USAGE:
     A

DESCRIPTION:
     A is a function! value.

REFINEMENTS:
     /test        =>

>>
```

**Expected behavior**

```
>> a: func [/local /test][]
== func [/local /test][]
>> ? a
USAGE:
     A

DESCRIPTION:
     A is a function! value.

REFINEMENTS:
     /test        =>

>>
```



**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Aug-2020/4:10:12
```



Comments:
--------------------------------------------------------------------------------

On 2020-10-01T14:02:09Z, dockimbel, commented:
<https://github.com/red/red/issues/4641#issuecomment-702157411>

    Putting refinements after `/local` is invalid. An error should be raised for that during function spec validation.

--------------------------------------------------------------------------------

On 2020-10-09T09:33:18Z, bitbegin, commented:
<https://github.com/red/red/issues/4641#issuecomment-706077265>

    ```
    	--test-- "scope 10"
    		s10-f: function [/local b /extern a][]
    		--assert [/local b] = spec-of :s10-f
    ```
    
    seems `/extern` should be an exception

--------------------------------------------------------------------------------

On 2021-09-11T14:21:48Z, dockimbel, commented:
<https://github.com/red/red/issues/4641#issuecomment-917415754>

    `/extern` is a reserved refinement that gets removed from the spec block when the function is constructed:
    ```
    >> s10-f: function [/local b /extern a][]
    == func [/local b][]
    ```


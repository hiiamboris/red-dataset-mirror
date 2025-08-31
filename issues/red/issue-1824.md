
#1824: Ownership is not working if the object owns a block which owns a nested block.  
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1824>

In the latest blog, 

> Ownership is set automatically on object creation if on-deep-change\* is defined, all referenced series (including nested ones), will then become owned by the object.

and try the code:

``` Red
RED[]

book: object [
    list: []
    on-deep-change*: function [owner word target action new index part ][
        print [ "on-deep-change*" word target action new index part]
    ]
]

print "=> append book/list 1"
append book/list 1
print "=> append/only book/list [1]"
append/only book/list [1]
print "=> append book/list/2 1"
append book/list/2 1
```

and I got this

``` Red
red>> do %owner.red
=> append book/list 1
on-deep-change* list 1 insert 1 0 1
=> append/only book/list [1]
on-deep-change* list 1 1 insert 1 1 1
=> append book/list/2 1
== [1 1]
```

changing the nested block will not detected by the ownership system. 



Comments:
--------------------------------------------------------------------------------

On 2016-04-18T15:23:10Z, dockimbel, commented:
<https://github.com/red/red/issues/1824#issuecomment-211429123>

    Nested series are marked as owned on owner object creation. For series lately added, they need to be marked as owned manually using `modify` action, here is a usage example:
    
    ```
    book: object [
        list: []
        on-deep-change*: function [owner word target action new index part ][
            print [ "on-deep-change*" word target action new index part]
        ]
    ]
    
    append book/list 1
    append/only book/list [1]
    modify book/list/2 'owned reduce [book 'list]
    append book/list/2 1
    ```


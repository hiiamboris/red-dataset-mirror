
#115: Wish: local stack-allocated structs
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.deferred] [type.wish] [Red/System]
<https://github.com/red/red/issues/115>

I don't seem to be able to lable this a wish, but here goes:

Fetching small items such as structs from the allocator is inefficient, but they can't currently be declared local, because that only allocates the pointer reference. I currently have to choose between making a function user friendly and thread safe by having it do its own memory management, or making it efficient which often requires the memory management, including thread safety, to be done by the caller of the function.



Comments:
--------------------------------------------------------------------------------

On 2011-06-27T11:37:11Z, dockimbel, commented:
<https://github.com/red/red/issues/115#issuecomment-1446698>

    You can declare a literal struct locally, it will be statically allocated in the data segment, but locally scoped (unless you pass a reference to it as return value).
    
    ```
    foo: func [/local s][
        s: struct [a [integer!] b [integer!]]        ;-- allocate a struct! value in the data segment
        ...
    ]
    ```
    
    Would such solution cover your need?

--------------------------------------------------------------------------------

On 2011-06-27T12:26:39Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/115#issuecomment-1446956>

    No, I'm using that now for examples, and it's efficient, but not thread safe.

--------------------------------------------------------------------------------

On 2012-10-25T10:47:57Z, dockimbel, commented:
<https://github.com/red/red/issues/115#issuecomment-9773213>

    Moving this wish to [Red/System v2 wish list](https://github.com/dockimbel/Red/wiki/Red-System-v2-Wish-List).


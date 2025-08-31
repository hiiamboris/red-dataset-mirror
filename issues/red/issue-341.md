
#341: Change index variable to get-word
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[type.wish] [status.reviewed] [Red/System]
<https://github.com/red/red/issues/341>

In my CPU emulator in Red/System, I have the following initialisation of memory management:

```
map!: alias struct! [item [binary!]]

...

read-list: read-map
write-list: write-map
block: RAM

until [
    read-list/item: block
    write-list/item: block

    read-list: read-list + 1
    write-list: write-list + 1
    block: block + 0800h
    RAM + 00010000h = block
]
```

I would like to write instead:

```
block: RAM
i: 1

until [
    read-map/i/item: block
    write-map/i/item: block

    block: block + 0800h
    i: i + 1
    i > 20h
]
```

But the compiler can't distinguish the index variable from a field name:

```
*** Compilation Error: invalid struct member i in: write-map/i/item 
*** in file: %/users/administrator/Red/6502/machine.reds 
*** at line: 78 
*** near: [
    write-map/i/item: block 
    block: block + 2048 
    i: i
]
```

(Although there seems to be an odd discrepancy in the error message between the first and second case.)

Indexing would be more powerful, and more consistent with Red, if an index variable would be denoted with a get-word:

```
read-map/:i/item: block
```



Comments:
--------------------------------------------------------------------------------

On 2012-12-17T21:49:37Z, meijeru, commented:
<https://github.com/red/red/issues/341#issuecomment-11463277>

    It seems to me that what you are really asking for is arrays. The specification, section 19.8 says that these are considered for future extension. For the moment indexing with an integer variable is only for c-strings.

--------------------------------------------------------------------------------

On 2012-12-17T23:48:24Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/341#issuecomment-11467712>

    More or less. Indexing already works on pointers to singular items instead of structs, not just strings. And with this feature implemented, true arrays can still be postponed.
    
    Also, it's a heads-up that the implementation of array indexing for structs will conflict with not using get-words in paths.

--------------------------------------------------------------------------------

On 2012-12-18T08:04:49Z, meijeru, commented:
<https://github.com/red/red/issues/341#issuecomment-11477151>

    To understand more formally: any "pointer" variable (i.e. of c-string, pointer or struct type) should admit indexing with an integer literal OR a get-word yielding an integer, with the semantics that the pointer value should be increased by the product of the integer value and the size (in bytes) of the type pointed to, just as is the case now when adding an integer to a (real) pointer. This does indeed make arrays totally superfluous (except for the allocation that needs to be done) but it also will need a change in the syntax for c-string indexing, with the possible consequences that has for existing code.

--------------------------------------------------------------------------------

On 2012-12-18T14:30:20Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/341#issuecomment-11487933>

    Again, this already works for all pointers except structs:
    
    http://static.red-lang.org/red-system-specs-light.html#section-4.8.5
    
    A barrier to implementing it for structs is the above syntax conflict, which can be solved by doing it like REBOL/Red. The old syntax could be supported but deprecated while people update their code.

--------------------------------------------------------------------------------

On 2012-12-18T17:49:14Z, meijeru, commented:
<https://github.com/red/red/issues/341#issuecomment-11497346>

    I support this wish, which makes Red/System more complete.

--------------------------------------------------------------------------------

On 2013-05-05T12:21:54Z, PeterWAWood, commented:
<https://github.com/red/red/issues/341#issuecomment-17450948>

    Wish moved to v2 wish list on wiki.


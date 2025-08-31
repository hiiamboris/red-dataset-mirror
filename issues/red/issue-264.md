
#264: Indexing needs to be fixed for zero and negative indexes
================================================================================
Issue is closed, was reported by dockimbel and has 14 comment(s).
[status.waiting] [type.wish] [Red/System]
<https://github.com/red/red/issues/264>

Pointers (or structs) indexing with 0 or negative values are badly handled, for example:

```
s: "HELLO"
s: s + 2

print s/1    ;-- L
print s/0    ;-- E
print s/-1   ;-- H
```

So `s/-1` returns the character which is 2 bytes behind `s`, which is not what we want to achieve with one-based indexing (zero would be an invalid value in such context).

Instead we should have `/0` raise an error, so that the example above would give:

```
print s/1    ;-- L
print s/0    ;-- error!
print s/-1   ;-- E
print s/-2   ;-- H 
```



Comments:
--------------------------------------------------------------------------------

On 2012-10-25T17:47:42Z, dockimbel, commented:
<https://github.com/red/red/issues/264#issuecomment-9787084>

    The question of having Red/System use a 0-based or a 1-based indexing is still undecided. For a low-level language, it makes sense to use a 0-based system. Comments and feeback are welcome.

--------------------------------------------------------------------------------

On 2012-10-25T19:45:17Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/264#issuecomment-9791370>

    I'd much prefer keeping it consistent with Red and keeping the human friendly one-based indexing, especially since some Red/System will be inlined in many Red programs.

--------------------------------------------------------------------------------

On 2012-10-26T00:08:34Z, earl, commented:
<https://github.com/red/red/issues/264#issuecomment-9798997>

    I'd also prefer to keep Red/System and Red consistent, but to drop indices-as-ordinals ("1-based") in favour indices-as-offsets ("0-based") in both, in order to achieve this.
    
    If you want to keep indices-as-ordinals and also change the current behaviour (where index 1 == first skip 0, index 0 == first skip -1, index -1 == first skip -2)  I currently can only see two options: either disallow negative indices, or allow negative indices but break basic arithmetic when used on indices. Both of those options seem quite unfavourable to me. If there's another alternative, I'd be very happy to hear about it, though. Order of preference for those options: (a) keep the current behaviour, (b) disallow negative indices, (c) break index arithmetic by making index 0 an error.
    
    I'm well aware that my indices-as-offsets suggestion fundamentally breaks "backwards compatibility" with REBOL.

--------------------------------------------------------------------------------

On 2012-11-09T15:59:04Z, typeless, commented:
<https://github.com/red/red/issues/264#issuecomment-10234117>

    As Red/System is intended to be a C level language, "0-based" makes more sense to faithfully reflect the value stored in the index register. The commonality between C array and pointer is another consideration. Some algorithms that utilize pointer/array index arithmetic, e.g., circular buffer head positioning: 'head = (head+1) & BUF_SIZE;'  may look nicer in a 0-based world.  In addition, 0-based indices form a cyclic-group, which may imply something useful.
    About the compatibility with REBOL, here are two suggestions: 
    Ether
    1. Come up with a new syntax to express indices-as-offset, and preserving the original indices-as-ordinals syntax. 
    Or
    2. Break the compatibility, but provide a compiler option for switching an extension named ''--use-1-based-index' or '--frebol-compat'.
    And I also agree on keeping Red/System and Red consistent.

--------------------------------------------------------------------------------

On 2012-11-14T12:56:59Z, rebolek, commented:
<https://github.com/red/red/issues/264#issuecomment-10365061>

    Compiler option for 1-based index seems like a terrible idea to me.
    
    On Fri, Nov 9, 2012 at 4:59 PM, typeless notifications@github.com wrote:
    
    > As Red/System is intended to be a C level language, "0-based" makes more
    > sense to faithfully reflect the value stored in the index register. The
    > commonality between C array and pointer is another consideration. Some
    > algorithms that utilize pointer/array index arithmetic, e.g., circular
    > buffer head positioning: 'head = (head+1) & BUF_SIZE;' may look nicer in a
    > 0-based world. In addition, 0-based indices form a cyclic-group, which may
    > imply something useful.
    > About the compatibility with REBOL, here are two suggestions:
    > 1. Come up with a new syntax to express indices-as-offset, and preserving
    > the original indices-as-ordinals syntax.
    > 2. Break the compatibility, but provide a compiler option for switching an
    > extension named ''--use-1-based-index' or '--frebol-compat'.
    > 
    > —
    > Reply to this email directly or view it on GitHubhttps://github.com/dockimbel/Red/issues/264#issuecomment-10234117.

--------------------------------------------------------------------------------

On 2012-11-24T17:21:08Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/264#issuecomment-10679822>

    Red/System already supports 0-based indexing, in pointer arithmetic. For example, here's a fragment from a CPU emulator I'm writing:
    
    ```
    record: instruction-table + program-counter/value
    instruction: as function! [] record/pointer
    
    instruction
    ```
    
    It doesn't get much more low level than that, and depending on the situation you can choose between 0-based indexing in pointer arithmetic and 1-based indexing in path accessors.

--------------------------------------------------------------------------------

On 2013-05-05T12:24:41Z, PeterWAWood, commented:
<https://github.com/red/red/issues/264#issuecomment-17450967>

    Wish moved to v2 wish list on wiki.


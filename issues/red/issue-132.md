
#132: Prohibition on multiple type-casting seems unnecessary
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.deferred] [type.wish] [Red/System]
<https://github.com/red/red/issues/132>

I have wondered about this rule (spec 4.7): _Multiple nested type castings are not allowed and will raise a compilation error._
Is there a semantic reason, or just an operational one (related to the way of implementing)? The by-product is that `null` cannot be type-cast. It is true that it does not _need_ to be, since it is already type-compatible, but now we have to write, e.g.

```
p: declare pointer![integer!]
p: null
```

instead of

```
p: as pointer![integer!] null
```



Comments:
--------------------------------------------------------------------------------

On 2011-07-06T20:04:51Z, dockimbel, commented:
<https://github.com/red/red/issues/132#issuecomment-1514780>

    It is an implementation constraint. Supporting multiple-casting require deep changes in the way expressions are compiled, so, currently, the gain vs cost ratio is too low, so it is postponed until the rewrite in Red. Basically, the `comp-expression` function would need a full rewrite (which is something that could happen if a critical bug or a useful feature would require it too).
    
    In the meantime, I mark this ticket as a "wish". Feel free to close this ticket if you think that is not worth it.

--------------------------------------------------------------------------------

On 2011-07-06T20:48:53Z, meijeru, commented:
<https://github.com/red/red/issues/132#issuecomment-1515226>

    I do think it is worth it for the principle: maximum combinability and no "artificial" constraints. But I agree it is not necessary to implement it now. Incidentally, in the syntax/semantics checker that I am writing myself, it is totally easy to implement it (in fact, more difficult to enforce the constraint).

--------------------------------------------------------------------------------

On 2012-10-25T10:48:33Z, dockimbel, commented:
<https://github.com/red/red/issues/132#issuecomment-9773230>

    Moving this wish to [Red/System v2 wish list](https://github.com/dockimbel/Red/wiki/Red-System-v2-Wish-List).


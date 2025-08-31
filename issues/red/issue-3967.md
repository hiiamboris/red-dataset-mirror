
#3967: BIND/COPY does not properly deep copy input
================================================================================
Issue is closed, was reported by giesse and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3967>

```
>> f: 1
== 1
>> block: [(reduce [f])]
== [(reduce [f])]
>> do block
== [1]
>> b1: bind/copy block object [f: 2]
== [(reduce [f])]
>> b2: bind/copy block object [f: 3]
== [(reduce [f])]
>> do block
== [3]
>> do b1
== [3]
>> do b2
== [3]
```

Expected output:

```
>> block: [(reduce [f])]
== [(reduce [f])]
>> b1: bind copy/deep block object [f: 2]
== [(reduce [f])]
>> b2: bind copy/deep block object [f: 3]
== [(reduce [f])]
>> do block
== [1]
>> do b1
== [2]
>> do b2
== [3]
```


Comments:
--------------------------------------------------------------------------------

On 2019-08-05T20:35:32Z, 9214, commented:
<https://github.com/red/red/issues/3967#issuecomment-518389263>

    To be precise, `bind/copy` ignores `paren!` and `any-path!` by using [`block/clone`](https://github.com/red/red/blob/master/runtime/natives.reds#L1125) call with [`any?`](https://github.com/red/red/blob/master/runtime/datatypes/block.reds#L212) argument set to `false`.
    
    I do recall stumbling on this edge case [a year ago or so](https://github.com/9214/daruma/commit/707cc3d4675c05ecbdecfcb0e5160580d0eca1d1) (and it worked just fine before that!), and wasn't sure if it's a bug or an intentional feature.
    
    Actually, making `bind/copy` an alias for `bind copy/deep` kinda makes `/copy` refinement reduntant. I'd rather prefered to keep it as it is now (provided there's a clean rationale behind that) and documented the differences.

--------------------------------------------------------------------------------

On 2019-08-05T22:01:16Z, dockimbel, commented:
<https://github.com/red/red/issues/3967#issuecomment-518417646>

    @9214 Good point, though, remembering that `bind/copy` is only deep copying blocks seems like too much of an exception, so would cause issues for most users. Having it copy `any-block!` by default is a safer, more intuitive option. Moreover, we should implement `copy/types` at some point, so you'll be able to mimic the old behavior easily and with more control over which types to deep copy.


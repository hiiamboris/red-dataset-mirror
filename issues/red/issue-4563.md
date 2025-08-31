
#4563: OP! constructed from OP! prototype is malformed
================================================================================
Issue is closed, was reported by 9214 and has 12 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4563>

**Describe the bug**
`op!`'s `make` action accepts other `any-function!` values as its prototype. In some cases, `op!` created from another `op!` is malformed.

**To reproduce**
```red
shr: make op! :>>
2 shr 1
```

```red
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

Let's engage in a [whodunit](https://en.wikipedia.org/wiki/Whodunit) narrative and see why this happens. As I said earlier, `op!` value can be constructed from any other `any-function!` value. However, `op!` parents differ in their structure:

* `native!` and `action!` do not contain body blocks but rely on native pointers.
https://github.com/red/red/blob/b45271621e78d6f24e4c0e4d6f1f0acc6cf61640/runtime/datatypes/structures.reds#L239
* `function!` and `routine!`, on the other hand, contain body block, and `routine!` can come from FFI.
https://github.com/red/red/blob/b45271621e78d6f24e4c0e4d6f1f0acc6cf61640/runtime/datatypes/structures.reds#L253

To differentiate two classes of parents in this taxonomy, `op!` header contains two bit flags:

https://github.com/red/red/blob/b45271621e78d6f24e4c0e4d6f1f0acc6cf61640/runtime/allocator.reds#L31

https://github.com/red/red/blob/b45271621e78d6f24e4c0e4d6f1f0acc6cf61640/runtime/allocator.reds#L27

Here are examples of `op!` values from each category:

| `16` | `23` | `op!` | Parent |
|:-:|:-:|:-:|:--|
| 0 | 0 | `+` | `add`, `action!`
| 0 | 1 | `>>` | `shift-right`, `routine!`
| 1 | 0 | `>` | `greater?`, `native!`
| 1 | 1 | x | x |

Now, this differentiation is needed because parents are differently structured; one class of parents contains a direct pointer, and another contains an indirect pointer. The crash happens when we create `op!` in one category (which is assumed to be the default by `make`) from `op!` in another category.

https://github.com/red/red/blob/b45271621e78d6f24e4c0e4d6f1f0acc6cf61640/runtime/datatypes/op.reds#L107

https://github.com/red/red/blob/b45271621e78d6f24e4c0e4d6f1f0acc6cf61640/runtime/datatypes/op.reds#L110

To reiterate on the original example: `>>` is an `op!` made from routine, and its body is a node pointer. `make op! :>>` ignores this fact and treats node pointer as pointer to native code, creating a ticking time bomb `shr`.

**Expected behavior**
I expect `op!` derived from another `op!` to be fully operational; to do so it suffices to add an extra check of bit flags inside `make`.

**Platform version**
 b452716



Comments:
--------------------------------------------------------------------------------

On 2020-06-30T19:16:07Z, meijeru, commented:
<https://github.com/red/red/issues/4563#issuecomment-651991162>

    Should one allow making `op!` values from other `op!` values at all? The official documentation says:
    
    `op!` values are infix functions of two arguments that are constructed from existing `native!`, `action!`, `function!`, or `routine!` values.

--------------------------------------------------------------------------------

On 2020-06-30T20:03:24Z, 9214, commented:
<https://github.com/red/red/issues/4563#issuecomment-652013694>

    The rest of `any-function!`s cannot be created from their respective `any-function!` counterparts. OTOH, you can create a datatype from a prototype of the same datatype with all (?) the other values.

--------------------------------------------------------------------------------

On 2020-07-01T06:09:52Z, meijeru, commented:
<https://github.com/red/red/issues/4563#issuecomment-652212727>

    Ì see what you mean, but since `make op! <op>` can only lead to a clone, I don't see why `shr: :>>` would not be sufficient for your purpose.

--------------------------------------------------------------------------------

On 2020-07-01T11:27:53Z, 9214, commented:
<https://github.com/red/red/issues/4563#issuecomment-652362784>

    @meijeru there is no purpose in that other than reproducing the crash.

--------------------------------------------------------------------------------

On 2020-07-01T14:33:01Z, meijeru, commented:
<https://github.com/red/red/issues/4563#issuecomment-652454975>

    What do you propose as remedy: change the treatment of `make op! <op>` or forbid it altogether? I am for the latter solution, particularly in view of the available alternative (see above)..

--------------------------------------------------------------------------------

On 2020-07-01T14:45:47Z, 9214, commented:
<https://github.com/red/red/issues/4563#issuecomment-652462593>

    There are two options:
    1. Force `any-function!` to be consistent with the rest of datatypes in that they can be "cloned" with `make`;
    1. Force `op!` to be consistent with `any-function!` in that none of them can be cloned.
    
    **(1)** is infeasible because of `routine!`, which doesn't have `make` action and, furthermore, must follow the specific structure of `<name>: routine <spec> <body>` for the compiler to process it. Also, not all the datatypes outside of `any-function!` can actually be cloned or created with `make` (see `handle!` with `event!` as an example).
    
    So **(2)** it is.


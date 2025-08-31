
#5412: Quicksand areas of VID design
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI] [type.design]
<https://github.com/red/red/issues/5412>

This ticket is to collect examples where seemingly straightforward VID code can be unexpectedly broken by global state. These points should be considered for eventual improvements in VID design.

**Describe the bug**

1. Ambiguity between style names and words used as facet values

   | `x: none view [style x: text "x" x x x]` | `x: 10 view [style x: text "x" x x x]` | `x: 50 view [style x: text "x" x x x]` |
   |-|-|-|
   | ![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/5Lcteov.png) | ![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/tApeUr.png) | ![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/xKtvLg.png) |
   | 3 faces | 2 faces | 2 faces |

   Imagine that `view` block is in a function that doesn't even know that `x` is defined elsewhere. Note how the value of `x` breaks the intent of what layout should be.

2. Free ranging evaluation consumes what would otherwise be style names

   | `view [text data 90 text data 100]` | `text: make op! func [a b] [rejoin [a b]] data: "🧨💥" view [text data 90 text data 100]` |
   |-|-|
   | ![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/U9zTE9B.png) | ![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/2MPmyc5.png) |
   | 2 faces | 1 face |

   This again shows how global state can affect the layout unexpectedly.

**Expected behavior**

We should design it to be free of such gotchas.

**Platform version**
```
Red 0.6.4 for Windows built 18-Oct-2023/1:48:48+03:00  commit #c9f4194
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-05T15:30:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5412#issuecomment-1793769156>

    Another example of how user-defined infix `op!` can be harmful...


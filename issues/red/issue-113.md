
#113: Since aliases and variables are separate, size? faces an ambiguity
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/113>

Consider the following program:

```
str!: alias struct! [i [integer!] j [integer!]]
str!: 1 ; quite legal but confusing
prin-int size? str! ; which one is it?
```

Experimentally, the `str!` which is an alias gets priority, so the answer is 8, not 4. Worth worrying about, or just worth documenting? 



Comments:
--------------------------------------------------------------------------------

On 2011-06-26T18:44:24Z, dockimbel, commented:
<https://github.com/red/red/issues/113#issuecomment-1442100>

    Yes, it is a bit worrying even if, in practice, such collisions are limited by the ending `!` character convention for aliases...I don't have an immediate solution for that, will need to think about it. Maybe the two namespaces should not be separated, at least, from the user perspective. I am open to propositions.

--------------------------------------------------------------------------------

On 2011-07-03T16:58:53Z, dockimbel, commented:
<https://github.com/red/red/issues/113#issuecomment-1493676>

    A compilation error is now raised on attempt to use already defined alias names as  (global or local) variable names.


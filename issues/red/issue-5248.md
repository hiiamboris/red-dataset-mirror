
#5248: [View] Show of a block! is too quiet
================================================================================
Issue is closed, was reported by luce80 and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5248>

**Describe the bug**
Show of a `block!` silently ignores elements that are not a `face!`

**To reproduce**
```
>> show [1 <a>]
== true
```
`show` of a (reduced) `block!` simply ignores elements that are not a `face!`

**Expected behavior**
I think `show` should give an `error!` when elements of `block!` are not a `face!` or at least not an `object!`


Red 0.6.4 for Windows built 27-Oct-2022/3:05:04+01:00  commit #5f113b7





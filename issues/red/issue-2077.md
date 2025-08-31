
#2077: Access violation occurs when modifying a block in a reactor!
================================================================================
Issue is closed, was reported by dander and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2077>

demonstrated by the following code:

```
Red [
    Title: "reactive test"
]

probe system/build

sum: function [list [block!]][
    total: 0
    foreach i list [total: i + total]
]

r: make reactor! [
    l: [3 4 5 6]
    total: is [sum l]
]
probe r

r/l: append copy r/l 5  ; works
probe r

append r/l 5    ; access violation
```

output:

```
λ red-28jun16-0d1be60.exe --cli sum.red
"28-Jun-2016/0:33:06-7:00"
make object! [
    l: [3 4 5 6]
    total: 18
]
make object! [
    l: [3 4 5 6 5]
    total: 23
]

*** Runtime Error 1: access violation
*** at: 0042D467h
```

If I change the `reactor!` object to use `deep-reactor!` instead, then it works, and the `total` value is updated when the block changes.



Comments:
--------------------------------------------------------------------------------

On 2016-06-28T15:09:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2077#issuecomment-229079312>

    Thank you for this report!

--------------------------------------------------------------------------------

On 2016-06-28T15:34:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2077#issuecomment-229087539>

    (Unrelated to the crash) About your `sum` function, the return value of iterators right now, is not entirely consistent depending on the iterator and if the code is interpreted or compiled (there's at least one ticket opened for that). So until this is fixed, it is safer to explicitely return the value (in your case, just `total` as last expression of `sum`).

--------------------------------------------------------------------------------

On 2016-06-28T20:48:48Z, dander, commented:
<https://github.com/red/red/issues/2077#issuecomment-229178559>

    Thanks for the info on that! Yesterday I was just experimenting with different ways I could do it. I started with `return total`, then realized just `total` would work, and if that, why not remove it entirely :smile:

--------------------------------------------------------------------------------

On 2016-06-28T23:50:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2077#issuecomment-229218102>

    You're correct to remove `return` when it's not needed, unless you need to work around temporary issues. Helps finding bugs too. :^)


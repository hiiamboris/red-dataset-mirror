
#1645: resize issue B
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1645>

```
l: layout [a: area "Hello, World!" b: button "resize" [a/size: 100x100]]
react [l/size: a/size + 100]
;view/flags l [resize]  ;same behaviour this way
view l                  ;or this way
```

The above code prints:

```
*** Error: arguments stack overflow!

*** Script error: set does not allow none for its word argument
*** Where: set
```

But it still displays the window. Then, if `resize` is clicked, it further outputs an extra:

```
*** Error: arguments stack overflow!

*** Script error: set does not allow none for its word argument
*** Where: set

*** Error: arguments stack overflow!


*** Error: arguments stack overflow!

200x200

*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!


*** Error: arguments stack overflow!
```

On Windows XP, it immediately crashes after printing the above.
On Windows 7, after printing the above, it waits until the mouse cursor is both outside the `resize` button and inside the window, or until the `resize` button is clicked a second time, and then it crashes with:

```
*** Runtime Error 1: access violation
*** at: 0042B8BFh
```




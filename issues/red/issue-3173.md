
#3173: View on-over doesn't trigger when using origin 0x0 and --cli
================================================================================
Issue is closed, was reported by BrianOtto and has 4 comment(s).
[status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3173>

I am using a base face and trying to capture mouse over events, but they do not trigger when using origin 0x0 and running the code with `--cli`. Here is an example ...

```
view [
    origin 0x0
    base 200x200
    blue
    on-over [probe 123]
]
```

Save this to **example.red** and run `red --cli example.red` in the Windows command prompt.

### Expected behavior
123 should appear in the command prompt

### Actual behavior
Nothing appears in the command prompt

### Additional Info
However, if I run this code with the Red GUI, i.e. `red example.red` then it does work. Also, if I change the code example to have some origin padding then it will work with `--cli` too.

```
view [
    origin 10x10
    base 200x200
    blue
    on-over [probe 123]
]
```

Run `red --cli example.red` and mouse over the extra padding before hitting the blue area. It will trigger the mouse over event now.

### Red version and build date, operating system with version.
red 0.6.3 on Windows 7 Pro SP1 (build date = red-23dec17-8af8bb8)



Comments:
--------------------------------------------------------------------------------

On 2017-12-28T18:29:47Z, BrianOtto, commented:
<https://github.com/red/red/issues/3173#issuecomment-354333053>

    Dang, I wake up and the bug is already worked on. Thanks for jumping on that!
    
    However, it is only partially fixed. I am still seeing an issue in the latest **red-28dec17-691be9c** build.
    
    The command prompt will display 123 the first time I mouse over, but then it never appears again when doing subsequent mouse overs.

--------------------------------------------------------------------------------

On 2017-12-29T02:47:55Z, qtxie, commented:
<https://github.com/red/red/issues/3173#issuecomment-354390276>

    @BrianOtto Thanks. I'll try to fix it today.


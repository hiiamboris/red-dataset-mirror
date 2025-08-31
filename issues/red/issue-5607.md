
#5607: Compiled `forall` enters the empty series
================================================================================
Issue is closed, was reported by loziniak and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/5607>

When I run compiled version of the code, `forall` enters loop, when block is empty:

```
$ ./red-toolchain-24mar25-da466eedf -c forall.red
$ ./forall 
Gtk-Message: 10:30:48.076: Failed to load module "canberra-gtk-module"
Gtk-Message: 10:30:48.076: Failed to load module "canberra-gtk-module"
[]
[]
done.

$ ./red-24mar25-da466eedf forall.red 
[]
done.
```

The code is:

```
Red [file: "forall.red"]

probe a: copy []

forall a [
	probe a
]

print "done."
```

This is run on `Manjaro Linux x86_64`



Comments:
--------------------------------------------------------------------------------

On 2025-04-02T15:16:25Z, dockimbel, commented:
<https://github.com/red/red/issues/5607#issuecomment-2772922009>

    Will fix that quickly.



#3471: Allocating too much memory leads to crash on Linux
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3471>

### Expected behavior

When allocating too much memory, Red should throw an error:
```
*** Internal Error: not enough memory
```

### Actual behavior

However on Linux, Red crashes with `Runtime Error 16: invalid virtual address` or `Runtime Error 1: access violation`.

### Steps to reproduce the problem

```
>> b: [none] forall b [append b none]

*** Runtime Error 16: invalid virtual address
*** at: F7E73BDFh
```

```
>> b: make binary! 2'000'000'000
== #{}
>> b: make binary! 2'000'000'000

*** Runtime Error 1: access violation
*** at: 0805B9D6h
```

### Red and platform version
```
Red on Linux built from 8b2db6bb9417d65f5fea3a70c5acdd1fcea3f8dd
```



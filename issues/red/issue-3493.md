
#3493: FUNCTION with empty LOCAL throws an error
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3493>

### Expected behavior

It's possible to define local words for a `function`. It should also be possible to define just `/local` refinement without local words. Even if it's useless, it's valid behavior and shouldn't cause any error.

### Actual behavior

If we do not define any local words and specify only `/local` refinement, an error is thrown.

### Steps to reproduce the problem

This works:

```
>> f: function [/local a] [a: 1 a]
== func [/local a][a: 1 a]
```

This does not:

```
>> f: function [/local] [a: 1 a]
*** Script Error: duplicate variable specified: /local
*** Where: function
*** Stack: f
```

### Red and platform version
```
Custom build from latest sources.
```



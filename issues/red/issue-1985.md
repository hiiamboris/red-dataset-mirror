
#1985: Wish: pass all arguments to console, now only first argument is passed
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1985>

I've added a `probe system/options/args` at the very beginning of `console/engine.red`,
only the first argument (intended for a script path to launch) get passed.
This is what I get when calling red with some arguments:

``` rebol
% red a b c
{"a"}
```

it would be very useful to be able to call interpreted scripts with arguments!
either:

``` rebol
% red script.red a b c
probe system/options/args
["a" "b" "c"]
```

or:

``` rebol
% red script.red a b c
probe system/options/args
["script.red" "a" "b" "c"]
```




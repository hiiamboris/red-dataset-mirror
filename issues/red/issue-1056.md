
#1056: EMPTY? should accept #[NONE] as its parameter
================================================================================
Issue is closed, was reported by JerryTsai and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1056>

in R3

``` CONSOLE
rebol>> empty? none
== true
```

in Red

``` CONSOLE
red>> empty? none
*** Script error: empty? does not allow none for its series argument
*** Where: empty?
```





#2132: Runtime crash on using op! created with action! that has refinements.
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2132>

Action! with refinements **doesn't work**.

``` red
<<: make op! :append ; doesn't raise any error.
[h] << [ha] ; crashes Red
```

Action! without refinements **works as expected**.

``` red
<>: make op! :swap
[1] <> [3] ; => [3]
```

Function! with refinements **works as expected**.

``` red
testing: func [a b /test] [either test [print "works"] [a + b]]
<<: make op! :testing
10 << 20 ; => 30.
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-31T09:51:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2132#issuecomment-236421063>

    A proper error will now be displayed if the source function does not strickly have 2 arguments only, and no refinements.


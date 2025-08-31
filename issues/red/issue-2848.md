
#2848: WISH: allow does/has in named macro
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2848>

As title suggests, `func [] [<body>]` is equivalent to `does [<body>]`, and `func [/local <words>] [<body>]` is the same as `has [<words>] [<body>]`. 

Currently only `function` and `func` are allowed in named macro definitions. Though it's just a syntactic sugar, I wish I could also use `has` and `does` in them.


Comments:
--------------------------------------------------------------------------------

On 2017-07-03T20:40:51Z, meijeru, commented:
<https://github.com/red/red/issues/2848#issuecomment-312729957>

    Very similar to #2424 

--------------------------------------------------------------------------------

On 2020-03-21T19:48:09Z, 9214, commented:
<https://github.com/red/red/issues/2848#issuecomment-602094445>

    Closing as a duplicate of #2424, where an alternative solution is already proposed.



#1061: WISH: supporting # construction syntax
================================================================================
Issue is closed, was reported by JerryTsai and has 4 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/1061>

In R3, we can do this:

``` CONSOLE
R3>> #[none] 
== none

R3>> #[true]
== true

R3>> #[block! [1 2 3 ]]
== [1 2 3]

R3>> #[object! [a: 1 b: 2]]   
== make object! [
    a: 1
    b: 2
]

R3>> #[unset!]

R3>> mold/all none
== "#[none]"

R3>> mold/all object [ a: 1 b: 2 ]
== {#[object! [
    a: 1
    b: 2
]]}

R3>> mold/all func [a b ] [ a + b ] 
== "#[function! [[a b][a + b]]]"
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-28T02:38:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1061#issuecomment-96889413>

    We will provide support for construction syntax soon.

--------------------------------------------------------------------------------

On 2016-05-10T16:30:16Z, dockimbel, commented:
<https://github.com/red/red/issues/1061#issuecomment-218214101>

    I am closing this ticket as it refers to a feature that is on our roadmap.


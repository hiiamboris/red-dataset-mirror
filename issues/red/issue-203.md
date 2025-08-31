
#203: Address Of Integer! operator
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/203>

An operator that provided the address of an integer would help in interfacing with functions (both internal and external) that require a pointer to an integer as an argument. The "get-word" syntax would be ideal

``` rebol

p: declare pointer [integer!]
i: 0

p: :i

```

Some REBOL coders may find this syntax confusing at first as :i would return the integer value in REBOL

An alternative could be to use a C-like syntax 

``` rebol

p: &i

```



Comments:
--------------------------------------------------------------------------------

On 2012-07-15T21:40:30Z, rebolek, commented:
<https://github.com/red/red/issues/203#issuecomment-6995282>

    I like the get-word syntax for getting pointer.

--------------------------------------------------------------------------------

On 2012-07-24T09:48:40Z, dockimbel, commented:
<https://github.com/red/red/issues/203#issuecomment-7202806>

    The get-word syntax is already in-use for getting a function! pointer, so for the sake of consistency, we'll continue using it for getting pointers on variables.

--------------------------------------------------------------------------------

On 2012-07-24T13:00:51Z, dockimbel, commented:
<https://github.com/red/red/issues/203#issuecomment-7206198>

    Wish granted in commit [4cd63a3661](https://github.com/dockimbel/Red/commit/4cd63a366145dc97b8990d5a8b7a52acb2305c91)

--------------------------------------------------------------------------------

On 2012-07-24T13:40:31Z, PeterWAWood, commented:
<https://github.com/red/red/issues/203#issuecomment-7207161>

    Thanks !!!!!


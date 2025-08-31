
#1911: possible map! bug
================================================================================
Issue is closed, was reported by mark-summerfield and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1911>

I started a Red GUI console and typed as follows and this resulted in a crash. Presumably I did something wrong, but I would have expected an error message rather than a crash.

--== Red 0.6.0 ==-- 
Type HELP for starting information. 

red>> m: make map! []
== #()
red>> k: "a"
== "a"
red>> put m k 1
== 1
red>> m
== #(
    "a" 1
)
red>> k: "b"
== "b"
red>> set m k 2
== 2
red>> m
CRASH!



Comments:
--------------------------------------------------------------------------------

On 2016-05-17T10:24:16Z, qtxie, commented:
<https://github.com/red/red/issues/1911#issuecomment-219678204>

    Yes. It should throw an error. And the right way to set a map is this: `set 'm/k 2`.

--------------------------------------------------------------------------------

On 2016-05-17T18:35:44Z, x8x, commented:
<https://github.com/red/red/issues/1911#issuecomment-219812138>

    In his example above, it should be `set 'm/:k 2` instead of `set 'm/k 2`
    Just curious, why the shorter way `m/:k 2` does't work ?

--------------------------------------------------------------------------------

On 2016-06-17T10:29:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1911#issuecomment-226736196>

    @x8x What does `m/:k 2` mean?

--------------------------------------------------------------------------------

On 2016-06-21T02:48:34Z, x8x, commented:
<https://github.com/red/red/issues/1911#issuecomment-227326772>

    @dockimbel Sorry, my mistake, I meant `m/:k: 2` which is indeed working no problem..



#1844: REPL: (ESC) key on ask, set and return wrong value
================================================================================
Issue is open, was reported by x8x and has 10 comment(s).
[type.review]
<https://github.com/red/red/issues/1844>

Hitting the `ESC` key after a `ask` in red will set the value to `^[`,
while rebol behave as espected, returning without setting a value.
red:

``` rebol
  a: ask ""


;   "^["
  a
;   "^["
```

rebol:

``` rebol
  a: ask ""
(escape)
  a
** Script Error: a has no value
** Near: a
```

Also, notice that in red, `ask` with an empty string as argument will add an extra `LF`:

``` rebol
  ask {:}
:123
;   "123"
  ask {}

123
;   "123"
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-19T16:36:27Z, meijeru, commented:
<https://github.com/red/red/issues/1844#issuecomment-227006834>

    Sorry for the duplication. I will close my #2008. It shows though that issues which linger have a non-negligible risk to be duplicated.

--------------------------------------------------------------------------------

On 2018-02-07T20:15:09Z, sciolizer, commented:
<https://github.com/red/red/issues/1844#issuecomment-363896246>

    Is there a work-around? Perhaps a function similar to `ask` but more "raw"?

--------------------------------------------------------------------------------

On 2020-03-22T12:41:07Z, 9214, commented:
<https://github.com/red/red/issues/1844#issuecomment-602194046>

    > Also, notice that in red, ask with an empty string as argument will add an extra LF
    
    Cannot reproduce that part, but returned `"^["` is present.

--------------------------------------------------------------------------------

On 2020-03-22T23:49:54Z, greggirwin, commented:
<https://github.com/red/red/issues/1844#issuecomment-602299991>

    The LF issue was fixed for another ticket recently.

--------------------------------------------------------------------------------

On 2022-09-30T07:47:12Z, qtxie, commented:
<https://github.com/red/red/issues/1844#issuecomment-1263227858>

    > Hitting the ESC key after a ask in red will set the value to ^[
    
    The console engine relies on it. https://github.com/red/red/blob/master/environment/console/engine.red#L262


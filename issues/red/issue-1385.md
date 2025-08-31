
#1385: REPL: tab autocomplete partially broken
================================================================================
Issue is closed, was reported by x8x and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1385>

First tab in a line does't autocomplete, tabbing, going back and tabbing again does work

```
(p)(r)(i)(tab) -> {pri } -> (back) -> {pri} -> (tab) ->
{print prin print-error print-to-stderr 
pri}
```

``` rebol
  system/platform
;   MacOSX
```

Not sure in which commit it regressed, but since a couple months already.



Comments:
--------------------------------------------------------------------------------

On 2015-10-13T10:32:11Z, qtxie, commented:
<https://github.com/red/red/issues/1385#issuecomment-147677214>

    It's caused by using `#call` inside `routine`.

--------------------------------------------------------------------------------

On 2015-11-06T10:32:24Z, dockimbel, commented:
<https://github.com/red/red/issues/1385#issuecomment-154374434>

    @Qtxie Is this working now or does it still require fixing?

--------------------------------------------------------------------------------

On 2015-11-06T11:37:09Z, qtxie, commented:
<https://github.com/red/red/issues/1385#issuecomment-154389966>

    @dockimbel It works now.


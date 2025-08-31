
#1576: `align` overrides `wrap?`
================================================================================
Issue is open, was reported by WiseGenius and has 12 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/1576>

If an `area`'s `align` is `none` or `'left`, its text is not wrapped, regardless or it's `wrap?` value.
If an `area`'s `align` is `'center` or `'right`, its text is wrapped, regardless or it's `wrap?` value.

So the following code:

```
l: layout [
    text    t: text "wrap?: false" 160x30   tw: text "wrap?: true"
    return
    text "align: none"  a: area aw: area
    return
    text "align: left"  al: area    alw: area
    return
    text "align: center"    ac: area    acw: area
    return
    text "align: right" ar: area    arw: area
]

p: make para! []
pl: make para! [align: 'left]
pc: make para! [align: 'center]
pr: make para! [align: 'right]

pw: make para! [wrap?: true]
plw: make para! [align: 'left wrap?: true]
pcw: make para! [align: 'center wrap?: true]
prw: make para! [align: 'right wrap?: true]

a/para: p
al/para: pl
ac/para: pc
ar/para: pr

aw/para: pw
alw/para: plw
acw/para: pcw
arw/para: prw

view l
```

Produces:
![align overrides wrap](https://cloud.githubusercontent.com/assets/7657453/12753084/3545ca02-ca11-11e5-8a59-c90c12e6c26e.png)

Same behaviour in both Windows XP and Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2016-02-21T13:24:12Z, WiseGenius, commented:
<https://github.com/red/red/issues/1576#issuecomment-186822685>

    An `align:` of `'center` or `'right` only causes the text to be wrapped if that is its initial value. Changing it from an initial `none` or `'left` doesn't give it wrap, and `wrap?` still has no effect.
    This can be seen by observing the difference between areas `a1` and `a2` in [tests/align-test.red](https://github.com/WiseGenius/red/blob/801ec032793c5673e9cc6cc0fa5858d0609eba68/tests/align-test.red) when setting them both to `center` or `right` with the radio buttons.

--------------------------------------------------------------------------------

On 2016-03-14T10:43:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1576#issuecomment-196249603>

    _If an area's align is none or 'left, its text is not wrapped, regardless or it's wrap? value._
    
    This is fixable.
    
    _If an area's align is 'center or 'right, its text is wrapped, regardless or it's wrap? value._
    
    From [MSDN](https://msdn.microsoft.com/en-us/library/ms997530.aspx):
    
    ```
    Centered and right-aligned multiple-line edit controls cannot be horizontally scrolled.
    ```
    
    This cannot be fixed using the current `area` implementation, as the underlying Windows class doesn't support the feature. We'll need to use a different class if possible, or implement a custom one to workaround such limitation (though, this is low-priority, as the need for that is probably rare).

--------------------------------------------------------------------------------

On 2016-03-14T11:22:12Z, WiseGenius, commented:
<https://github.com/red/red/issues/1576#issuecomment-196265828>

    I agree with the second part having low priority.
    
    The first part is still not quite there, though:
    With the latest fix, `wrap?: true` only causes the text of an `area` to be wrapped if that is its initial value. Changing it from an initial `false` doesn't give it wrap.
    This is why clicking the `c1` and `c2` `check`s still have no effect on `area`s `a1` and `a2` in [tests/align-test.red](https://github.com/WiseGenius/red/blob/801ec032793c5673e9cc6cc0fa5858d0609eba68/tests/align-test.red).
    The other way around is also true: If an area has `wrap?: true` initially, then the `area` continues to be wrapped when changing it to `wrap?: false`.

--------------------------------------------------------------------------------

On 2016-03-14T11:59:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1576#issuecomment-196278335>

    Right, it requires more work as the Edit control is really limited, it cannot support toggling wrapping on/off at runtime, so requires to be fully re-created to take the new wrapping state into account.

--------------------------------------------------------------------------------

On 2020-03-21T18:08:25Z, 9214, commented:
<https://github.com/red/red/issues/1576#issuecomment-602081222>

    > If an area's align is none or 'left, its text is not wrapped, regardless or it's wrap? value.
    
    This one can be crossed out, at least on W10:
    
    <img src="https://user-images.githubusercontent.com/15716466/77233300-df1a3000-6ba6-11ea-99dd-0c49495d35c7.png" width="350">
    
    `wrap?` is honored in all cases.

--------------------------------------------------------------------------------

On 2020-03-22T10:01:41Z, 9214, commented:
<https://github.com/red/red/issues/1576#issuecomment-602173802>

    @greggirwin I think there was a misunderstanding: only 1/2 of the issue is resolved, the other half is still present (text always wraps with center and right alignment).


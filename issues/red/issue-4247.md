
#4247: [View] RADIO is toggled by default on GTK
================================================================================
Issue is open, was reported by 9214 and has 6 comment(s).
[type.review] [GUI.GTK]
<https://github.com/red/red/issues/4247>

**Describe the bug**

On Windows and macOS `radio` widget is untoggled by default, but not on GTK.

**To reproduce**

```red
view [radio off]
```

Note that explicitly setting `data` facet to `false` does not help.

**Expected behavior**

I expect `radio` to be in untoggled state, like on other backends.

**Platform version**

```
Red 0.6.4 for Linux built 14-Jan-2020/9:30:51+01:00 commit #62d0d07
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-11T03:18:49Z, bitbegin, commented:
<https://github.com/red/red/issues/4247#issuecomment-725108066>

    seems gtk's limits

--------------------------------------------------------------------------------

On 2020-11-11T03:56:35Z, 9214, commented:
<https://github.com/red/red/issues/4247#issuecomment-725161106>

    @bitbegin IIRC on all backends this functionality is implemented as a high-level View event handler, except for GTK.
    https://github.com/red/red/blob/738c45d5ca412950325d2e00e0c08392777ad603/modules/view/view.red#L1165-L1180

--------------------------------------------------------------------------------

On 2021-07-01T22:46:26Z, gltewalt, commented:
<https://github.com/red/red/issues/4247#issuecomment-872594458>

    With gtk, radio buttons are part of a group, and one of the radio buttons has to be "on". 
    If you have a single radio it is always going to be on and can't be changed.
    
    To create a group of radio buttons where all of the default states are off, you would need to have a first 'hidden' radio button that is "on".


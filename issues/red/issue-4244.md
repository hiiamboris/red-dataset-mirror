
#4244: [View] incorrect treatment of logical values in RADIO and CHECK
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
<https://github.com/red/red/issues/4244>

**Describe the bug**

When it comes to logical values, Red's motto is "everything is true except `false` and `none`". This does not hold in case of `radio` and `check` buttons:

* on creation, both treat only `true` as truthy and everything else as falsey;
* after creation, `check` treats `none` as truthy.

**To reproduce**

On creation:

```red
view [radio data 'a check data 'b]
```

After creation:

```red
view [c: check button [c/data: none]]
```

Clicking on a button sets a checkbox to a toggled state.

This issue affects all View backends.

**Expected behavior**

I expect these widgets to follow the standard Red semantics. `data` facet should contain only `logic!` (which switches widget into toggled/untoggled state), and any other value's datatype should be overridden to it.

**Platform version**

The latest release, all platforms.


Comments:
--------------------------------------------------------------------------------

On 2020-01-17T18:39:10Z, 9214, commented:
<https://github.com/red/red/issues/4244#issuecomment-575745396>

    #4245 
    
    Checkbox is supposed to be a tri-state button and treat `none` as a 3rd-state, but:
    
    * it's not correctly implemented on Windows ATM (on a quick glance, `BS_AUTO3STATE` flag is missing);
    * there's no support for that on other backends, but functionality itself is available:
        * [`allowsMixedState`](https://developer.apple.com/documentation/appkit/nsbutton/1528907-state?language=objc)
        * [`gtk_toggle_button_set_inconsistent`](https://developer.gnome.org/gtk3/stable/GtkToggleButton.html#gtk-toggle-button-set-inconsistent)


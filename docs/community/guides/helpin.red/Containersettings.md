Original URL: <http://helpin.red/Containersettings.html>

# Container settings

* * *

* * *

These define the characteristics of the window that will contain your GUI elements.

VID DLS size

Sets the size of the window in pixels.

![](http://helpin.red/lib/size.png)

If you don't set a size, Red does it automatically.

As an interesting note, unless the window is big enough to show part of the title, you can't move (drag) it.

VID DLS title

Sets the title at top of the window.

![](http://helpin.red/lib/title.png)

VID DLS backdrop

Sets the background color of the window

![](http://helpin.red/lib/backdrop.png)

### actors

- See the specific [chapter](http://helpin.red/EventsandActors.html).

### Setting an icon

This only works if you compile the code! Does NOT work on interpreted code.

Not a container setting, but I think it fits here. If you want to set an icon to your window that is not the Red default, add icon: &lt;path-to-icon&gt; after the needs: 'view in the Red initial block:

![](http://helpin.red/lib/settinganicon.png)

### Refinements

Containers (windows) allow the refinements options, flags, no-wait and tight. The refinements options and flags are defined in blocks after the view main block.

#### /options

In the options refinement you can determine your window's offset and size (size seems to be definable in both ways, as a container setting or an option).

- Offset determines where your window will show, measured from the top left of your screen.

![](http://helpin.red/lib/offset.png)

#### /flags

- modal - modal window. Demands attention, disables all other windows until you close it.

Note: if you create a window that is modal and no-title/no-border, it is pretty hard to get rid of it, I had to use Task Manager.

- resize - the window can be resized.

<!--THE END-->

![](http://helpin.red/lib/flagsmodalresize.png)

- no-title - results in a rectangular frame with no title or buttons.

<!--THE END-->

![](http://helpin.red/lib/flagsnotitle.png)

- no-border - results in a rectangular frame with no title or buttons and no border.

<!--THE END-->

![](http://helpin.red/lib/flagsnoborder.png)

- no-min - only the close button is shown on window's top.

<!--THE END-->

![](http://helpin.red/lib/flagsnomin.png)

- no-max - the maximize button is shown as inactive.

<!--THE END-->

![](http://helpin.red/lib/flagsnomax.png)

- no-buttons - no window's buttons (maximize, minimize, close) are shown.

<!--THE END-->

![](http://helpin.red/lib/flagsnobuttons.png)

- popup - Windows only - makes the window a popup. It has a special styling (close button only) and allows other windows to stay active. Closes if you change focus to other windows.

#### /no-wait

From the [documentation](https://doc.red-lang.org/en/view.html#_extra_functions): "View: Render on screen a window from a face tree or a block of VID code. Enters an event loop unless /no-wait refinement is used.

That is, if you don't use no-wait, View will create a face and stay there waiting for events. If you use no-wait, Red will execute the View block (show the GUI) and keep going forward in the script.

Red \[needs: view]

view/no-wait \[button "Quit" \[quit]]

print {This text would not have been printed

if you have removed the "no-wait" refinement.

That is because the interpreter would stay in

the View block waiting for events}

/tight

Zero offset and origin.

Default (without /tight):

Red \[needs: view]

view\[base]

![](http://helpin.red/lib/NewItem199.png)

With /tight:

Red \[needs: view]

view/tight\[base]

![](http://helpin.red/lib/NewItem201.png)

[&lt; Previous topic](http://helpin.red/GUI.html)                                                                                          [Next topic &gt;](http://helpin.red/Layoutcommands.html)

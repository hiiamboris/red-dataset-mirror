Original URL: <http://helpin.red/Rededitor.html>

# Rededitor

* * *

## For Windows, but works surprisingly well in Linux using Wine.

* * *

Everything you need to get started with Red, including Red itself!

Just press the play button to run your script! *

![](http://helpin.red/lib/NewItem279.png)

\*the very first run may take a while as the Red executable compiles the GUI console.

## After much trial and error with Notepad++ configuration, I came up with a setup that is clean, lean, and allows you to save &amp; run a Red script by simply pressing a "play" button.

## It has all the nice features of Notepad++, plus syntax highlight for Red and the necessary plugins. Everything is packed in a zip file along with a copy of the Red executable. This zip extracts to a folder that is portable and self-sufficient, meaning you can clone it just by coping and pasting.

## I called this package, very creatively, Rededitor. You can get it in the [Downloads page](http://helpin.red/Downloads.html).

![](http://helpin.red/lib/NewItem286.png) - Save and run - interpreted mode.

![](http://helpin.red/lib/NewItem280.png) - New

![](http://helpin.red/lib/NewItem281.png) - Open

![](http://helpin.red/lib/NewItem282.png) - Save

![](http://helpin.red/lib/NewItem283.png)- Save as...

![](http://helpin.red/lib/NewItem285.png) - Development quick compile with DLL - Saves, compiles and run your script. Compiles with -c option (look at [this chapter](http://helpin.red/Helloworld-runandcompile.html#Compiling)), meaning that compilations are fast (except for the very first one as Red takes about a minute to create the DLL and some support files).

![](http://helpin.red/lib/NewItem284.png) - Release compile to standalone exe - Saves, compiles and run your script. Compiles with -r option (again, look at [this chapter](http://helpin.red/Helloworld-runandcompile.html#Compiling)), meaning that creates a standalone executable file. Always takes about a minute to compile.

I suggest you tick on Settings/Preferences.../Hide menu bar to  make it look even cleaner, like the screenshot above. You can toggle the menu bar back by pressing the alt key or F10.  I don't make the hidden menu default because it might be confusing

After downloading of the zip, extract the Rededitor folder. Inside you will have this:

![](http://helpin.red/lib/NewItem231.png)

Notes:

![](http://helpin.red/lib/NewItem287.png)

- There you will find a "Custom compile". You may change the parameters of this compilation on "Plugins / NppExec / Execute...", choosing the "Custom compile" script and editing it.

<!--THE END-->

![](http://helpin.red/lib/NewItem274.png)

![](http://helpin.red/lib/NewItem273.png)

- There is also the Red System libRedRT compile macro. This one uses the -u option. I created it to do some tests with [Red Computer Vision library](https://github.com/ldci/redCV) by François Jouen.
- When you compile scripts, Rededitor shows a "console" panel. Unfortunately, that is not Red's console. It displays Red's output, like prints and probes, but it cannot be used for input. This console is disabled in the Save and run feature, since the GUI console is shown.

<!--THE END-->

![](http://helpin.red/lib/NewItem278.png)

- I'm afraid the examples packed with Rededitor leave a lot to be desired. I can't bring myself to create simple scripts for all topics, and many of them are text-based to be used with console, so don't lend themselves for compilation. Hope to improve that in the future.
- Rededitor License:

Rededitor is just a pre-configured Notepad++ with 3 plugins: "Customize Toolbar", "NppExec" and "NppExport. Please, refer to Notepad++'s "license.txt" in Rededitor's folder.

As far as I'm concerned you can do whatever you want with Rededitor as long as you respect Notepad++ license.

The only actual change made to the program itself (Notepad++) was changing its icon.

[&lt; Previous topic](http://helpin.red/Gettingstarted.html)                                                                                          [Next topic &gt;](http://helpin.red/Setup-VisualStudio.html)

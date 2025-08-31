Original URL: <http://helpin.red/Gettingstarted.html>

# Getting started

* * *

* * *

The first thing is, of course, to download the Red executable. You may get the latest version from [here](https://www.red-lang.org/p/download.html).

When you execute it (double click), it simply opens the console (a.k.a. REPL) on your desktop.

Instructions on how to run scripts are described at the ["Hello world" - run and compile](http://helpin.red/Helloworld-runandcompile.html) chapter, but first, I think you should choose a text editor.

Choose an editor

You may just write your scripts on any text editor that outputs pure text files, like Notepad, then download the Red executable from  [Red's website](https://www.red-lang.org/p/download.html)  and run them using the command line, but that is not very friendly. There are quite a few options that will make it much easier. Please take a look at [Rededitor](http://helpin.red/Rededitor.html).

Red's website suggests:

- [Visual Studio Code](https://code.visualstudio.com/) with [Red extension](https://marketplace.visualstudio.com/items?itemName=red-auto.red) .
- Browser-based [Cloud9](https://aws.amazon.com/cloud9/?origin=c9io) editor ([setup instructions for Red](https://github.com/red/red/wiki/Install-Red-in-Cloud9-IDE)).

I add [Notepad++](https://notepad-plus-plus.org/download/v7.5.6.html) to these suggestions, because it's a lightweight, very popular editor. Red prides itself for being a single-file with no install and no setup. Well, if you like that about Red, you will appreciate using Notepad++, specially if configured as [Rededitor](http://helpin.red/Rededitor.html).

Throughout this work I use Notepad++ (Rededitor).

I also made a [chapter about setting up Visual Studio Code](http://helpin.red/Setup-VisualStudio.html). It's a more complete editor for programming, with many features that Notepad++ doesn't have.

![](http://helpin.red/lib/NewItem103.png)

Some information you may find useful:

The first time it runs, Red creates files at C:\\ProgramData\\Red\\ . If you install a new release or built of Red, I advise you to wipe out the files in that directory, otherwise, unless you specify the path to the new release, Windows will keep using the old release as default.

A Red script is a pure text file. It may have any extension, but its a good idea to give them a .red extension, as later, when you use text editors, you will want them to recognize the language you are using. You will probably also want Windows to associate files with .red extension to the Red executable. The easiest way to do that is to right click on a text file with .red extension and choose "Open with/Choose another app":

![](http://helpin.red/lib/associate2.png)

Then navigate to "Look for another app on this PC", check the "Always use this app to open .red files" box, click on "Look for another app on this PC" and select your Red executable. Every file with extension .red will be associated with the Red executable now.

![](http://helpin.red/lib/associate1.png)

[&lt; Previous topic](http://helpin.red/HRconventionsandnotations.html)                                                                                          [Next topic &gt;](http://helpin.red/Rededitor.html)

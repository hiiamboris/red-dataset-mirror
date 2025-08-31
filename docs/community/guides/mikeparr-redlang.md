Original URL: <https://www.mikeparr.info/redlang.html>

# Red Language, and Ride - mike

* * *

### Red, and the Ride Editor

### Introduction

Red is a very interesting programming language that I am experimenting with. It is (intentionally) very similar to REBOL.

[http://www.red-lang.org/](http://www.red-lang.org/)  
[REBOL Tutorial](http://www.re-bol.com/rebol.html#section-1)

To use Red, you only need a basic text editor, but it is better if you use an editor which has been configured to use Red. There are several possibilities, such as

- you can configure the free popular Notepad++ editor, as explained [here.](https://github.com/Ungaretti/Makeshift-IDE-for-Red-language)
- a Visual Studio extension, with Intellisense, here. This might be your best choice.
- My Ride editor, described on this page - this is a single install,
- and just for fun, there is a tiny editor written in Red, [here](http://www.mikeparr.info/tired.html). This is not for serious use!.

## Ride For Red On Windows

Ride is a simple text editor, configured for Red. The download also includes the Red system, so no other downloads are needed. It is not a real IDE, but it does include a Red pretty-printer.

[Here is the download](http://www.mikeparr.info/red-ride.zip) - less than 2MB - which includes the Ride editor and the Red language system.

Here is a screenshot

![](https://www.mikeparr.info/pics/ride-screenshot.png)

To install, download and unzip it. You get this folder and files:

```
    red-ride                   (the folder)
        ride.exe               (the editor)
        ride.ini               (used by Ride)
        red-latest.exe         (Red system)
        readmeHELPFILE.txt     (The Ride help)
        libredrt.dll           (needed for certain Red programs)
        (and a few more files... )
```

Put the red-ride folder anywhere you like - I use it at the top level: C:\\red-ride. You should use this folder to store all your Red programs. This is a Ride restriction, not Red's fault.

Run Ride, and do a once-only configuration. This involves clicking **Tools | Configure Red System**. Follow the instructions, selecting the red-latest.exe file in red-ride. Close Ride.

The next time you run Ride, try it by opening **hello.red** in the red-ride folder, and click **Interpret**. Sometimes, Red will need to unpack itself - you might see a message. This takes around 2 minutes. All subsequent executions will be instant.

(If you have Red installed already, simply copy the files from the red-ride folder into your Red code folder, ensure the folder contains a version of the Red system, and run Ride, choosing the **tools|configure** menu to point to your version of Red).

Red is updated often. If you download a new one, place it in the red-ride folder, and configure Ride to point to it.

When you interpret a program, Ride runs it from a Red console. When the program terminates, you can interact with the console.

When you compile the program, error messages are displayed in the bottom part of Ride. When you execute, your program runs in a black Dos window.

Red uses "\[ . . . ]" to express blocks, control structures etc. Of course, it will check for matching square-brackets, but it can help to pretty-print your code to narrow down the position of the error. Interestingly, the pretty-printer is written in Red (50 lines) and Ride runs a compiled version of it.

Enjoy!

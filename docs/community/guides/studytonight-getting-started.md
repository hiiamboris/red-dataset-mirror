# Getting Started with GUI Programming using Red Language

Dulari

* * *

Red is a new age programming language, inspired by REBOL(*Relative expression based object language*). It was developed by **Nenad Rakocevic** in 2011 and the stable release was out in 2017. Red was made to incredulous the limits of the programming language Rebol. Red is both an imperative and functional programming language. Its syntax and general usage overlaps that of the interpreted Rebol language which was introduced in 1997. The main intention behind creating Red was to create a full stack programming language.

![Getting started with Red language](https://s3.ap-south-1.amazonaws.com/s3.studytonight.com/curious/uploads/pictures/1560756145-1.jpg)

Red can be utilized for extremely high-level programming like DSLs and GUIs as well as low-level programming like operating systems and device drivers. The main key to the tactic is that the language has mainly two parts, they are:

1. **Red/System**: is similar to C language, but packaged into a Rebol lexical structure - for example, one would write, `if x > y [print "Hello"]` instead of `if(x > y){ printf("Hello\n"); }`.
2. **Red**: is a homoiconic language which means that the language text has the same structure as its **abstract syntax tree** (**AST**), with semantics similar to Rebol's. Red's runtime library is written in Red/System.

* * *

## Purpose behind creation of Red:

The single-minded goal behind developing Red programming language was to build the world's first **full-stack language** which you can use from system programming tasks, up to high-level scripting through DSL. We hear it all the time that people work as a "Full-Stack Developer" but have we ever wondered, "*what is a full-stack Language?*"

Red has taken the idea of "one tool to rule them all" too seriously. Red is a **single executable** that takes your source files as input on any platform, and produces a packaged binary for any platform, as an output. The tool doesn't depend on anything besides what came packaged with your OS which means **no additional dependencies**. And it is **smaller than a megabyte** in size.

But these technical specifications alone doesn't define Red's notion of a "Full-Stack Language", it's more than that. It is about the language's ability to bend and redefine the system to meet any need, while still working with literate code, and getting top-flight performance. So what Red serves in your hands is more like a "language construction set" than simply "a language".

It can be used for anything like writing a device driver, a platform-native GUI application, or a shared library, Red programming language lets you utilize a common syntax to code at the right level of abstraction for the task.

And above all writing code in Red programming language is super easy as the syntax is super user friendly and easy to understand even for a beginner.

* * *

## Installing Red Programming Language

Let's install the Red programming language.

### 1. Installing Red on Windows

It is very easy to install the Red programming language on Windows as it does not have any dependency errors which is the opposite in case of installing on Linux where there are many dependencies. To install the Red on windows simply follow the following steps:

**Step 1:** Download stable version of red for Windows from [https://www.red-lang.org/p/download.html](https://www.red-lang.org/p/download.html)

**Step 2:** Double click on Downloaded file. It will start installation and you will receive a notification saying *Compiling for GUI*. It will take some time so wait for it to prepare to install.

**Step 3:** Once the installation is complete, you will see following screen on your computer

![installing red language on windows](https://s3.ap-south-1.amazonaws.com/s3.studytonight.com/curious/uploads/pictures/1559742355-61866.jpg)

**Step 4:** To run Hello word program simply write `print "Hello World!"`

**Step 5:** And we are done.

* * *

### 2. Installing Red on Ubuntu

It is easy to install Red in Ubuntu but it will be very difficult to run GUI based program in Linux using Red. To install Red in Ubuntu simply follow the following steps:

**Step 1:** Download stable version of red for Linux from [https://www.red-lang.org/p/download.html](https://www.red-lang.org/p/download.html)

**Step 2:** Type following commands to get library files:

```
sudo apt-get install ia32-libs libc6-i386 libcurl3

sudo dpkg --add-architecture i386

sudo apt-get update

sudo apt-get install libc6:i386 libcurl3:i386
```

**Step 3:** Change the directory to where you have downloaded the **red-063** file and type following command:

```
./red-063
```

**Step 4:** You will then have the red console.

**Step 5:** To run the Hello World program simply write `print "Hello World!"`

In Ubuntu(Linux) if you will try to run any **View based GUI program** then it will give you error that ***\*\*\*View has no value***. This error occurs because we do not have **rebol/view** installed on our system. You can download it from here: [http://www.rebol.com/download-view.html](http://www.rebol.com/download-view.html)

* * *

## GUI Based Programming using Red

It is very easy and handy to build GUI based applications using Red. Once you have installed and run a simple GUI based application in Windows you will really appreciate it.

You can visit [http://www.red-by-example.org/](http://www.red-by-example.org/) website for more examples.

Below we have some basic examples to introduce you to the Red programming language.

### Example 1:

**Step 1:** Open the Red console in Windows.

**Step 2:** Write the following code and press enter:

```
view [name: field button "Hi" [print ["Hi" name/text]]]
```

**Step 3:** You will be amazed to see that GUI Programming with Red is such an easy task!

![GUI programming example with Red](https://s3.ap-south-1.amazonaws.com/s3.studytonight.com/curious/uploads/pictures/1559742403-61866.jpg)

### Example 2:

Try running the following code, to have a simple button to quit in the GUI.

```
Red [ Title: "My program"  needs: 'view]
view [ text "Its a great big world!"  button "Quit" [quit]   ]
```

![GUI development using Red](https://s3.ap-south-1.amazonaws.com/s3.studytonight.com/curious/uploads/pictures/1560754418-1.png)

### Example 3:

Now let's move on to a little complex example, where we will create a random picture viewer with a button to change the picture. Here is the code,

```
Red [ title: "Simple Image Viewer" needs: 'View ]

rand_img: https://source.unsplash.com/random/310x200

message: "Press Random for a random image!"

view/options [title "Simple Image Viewer"
    below center
    pictures: image 310x200 message
    across
    random_btn: button "Random" [
        new_image: load rand_img
        pictures/image: new_image
        pictures/text: ""
    ]
    text "A Simple Image Viewer in Red"
][]
```

**Output:**

![Simple Umage viewer using Red](https://s3.ap-south-1.amazonaws.com/s3.studytonight.com/curious/uploads/pictures/1559742474-61866.jpg)

* * *

## Benefits of using Red Programming Language

There are several benefits of using Red programming language:

- User-friendly syntax.
- **Homoiconic**: A language is **homoiconic** if a program written in it can be manipulated as data using the language, and thus the program's internal representation can be inferred just by reading the program itself. Red has its **own meta-language and own data-format** that is the reason it is homoiconic.
- **Functional**, imperative, **reactive** and **symbolic** programming.
- Prototype-based object support.
- Supports gradual and multi**-**typing
- Supports Macros system
- It has a rich set of built-in data types (50+)
- Can be both **statically** and **JIT**-**compiled** to native code
- **Cross-compilation** done right.
- Produces executables of **less than 1 MB**, with **no dependencies**
- Provides a strong support for **Concurrency** and P**arallelism** (actors, parallel collections etc.)
- Has low-level **system programming** abilities through the built-in Red/System DSL.
- Comes with a powerful **PEG parser** with DSL included.
- Native GUI system which is cross-platform, with a UI DSL and drawing DSL.
- Bridging to the JVM available.
- High-level **scripting** and **REPL** console included.
- Visual Studio Code plugin, with many helpful features.
- Highly embeddable.
- **Low** memory footprint and supports **garbage collection**.

## References

1. [https://www.red-lang.org/](https://www.red-lang.org/)
2. [http://www.red-by-example.org/](http://www.red-by-example.org/)
3. [http://redprogramming.com/](http://redprogramming.com/)

## You may also like:

- [**Introduction to Python Tkinter Module**](https://www.studytonight.com/tkinter/introduction-to-python-tkinter-module)

<!--THE END-->

- [**Java Abstract Window Toolkit(AWT)**](https://www.studytonight.com/java/java-awt.php)

<!--THE END-->

- [**Simple Calculator Application with Python Tkinter**](https://www.studytonight.com/post/simple-calculator-application-with-python-tkinter)

<!--THE END-->

- [**Top Reasons to Switch to the NetBeans IDE**](https://www.studytonight.com/post/top-reasons-to-switch-to-the-netbeans-ide)

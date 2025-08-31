Original URL: <http://helpin.red/Helloworld-runandcompile.html>

# "Hello world" - run and compile

* * *

* * *

### Console "Hello world":

Write the code below on Rededitor, save it as "MyFirst.red" in the "myprograms"  folder and execute it.

You should have:

![](http://helpin.red/lib/helloworld12.png)

The window on the right is the console, sometimes called REPL. Click there, type print "I can use the console too!" and press enter:

![](http://helpin.red/lib/helloworld2.png)

Now type 3 + 7 and press enter:

![](http://helpin.red/lib/helloworld3.png)

Notice that you must have a space between words. Spaces are the delimiters and without them you get errors:

Hello world!  
&gt;&gt; print "I can use the console too!"  
I can use the console too!

&gt;&gt; 3 + 7  
\== 10

&gt;&gt; 3+7                ;no spaces!!!!!  
\*\** Syntax Error: invalid integer! at "3+7"  
\*\** Where: do  
\*\** Stack: load

Notice that after 3+7 I wrote ;no spaces!!!!! . Red ignores words that come after a semi-colon, that's one way to make [comments](http://helpin.red/Notesonsyntax.html#Commenting) to your code.

##### Back to the program (aka. script):

Interpreted programming languages execute one line of code at a time. Programs for interpreted languages are called "scripts". Red is not really interpreted, as it does some compiling before running (sort of), but its programs are generally called scripts anyway.

On the first line we have Red \[ ]. As we mentioned before, every Red script must start with Red, Not RED nor red, but Red. Following Red we have brackets. In Red, anything inside brackets is called a "block". This first block is intended to contain information about your program. This information is mostly optional with a few exceptions, the most relevant being the declaration of libraries (more on that in a while).

A nice first block would be:

Red [

       title: "Hello World"

       author: "My name"

       version: 1.1

       purpose {

               To print a greeting to the planet.

               Notice that multi-line text goes

               inside curly brackets.

               }

       ]

print "Hello World!"

Anything before the Red\[ ] is ignored by the interpreter:

Lots of things may be written here.

The interpreter only considers what is

written after the...

Red \[        ]        

print "It works anyway!"

### "Hello world" with graphic user interface - GUI:

One of the most striking features of Red is it's easy-to-use graphic interface. It makes a very clever use of the Operating System's own graphic APIs. A simple "Hello world" with GUI would be:

![](http://helpin.red/lib/helloworld5.png)

Notice I wrote needs: 'view in the header block (apostrophe is optional). That tells Red to load the "view" graphic library. This is not necessary if you are using the GUI console, as the "view" library is already loaded, but I think it's a good idea to include it anyway.

### []()Compiling your "Hello world" to an executable file:

To compile your script, you must execute Red followed by one or more options and the name of the script. The most common options are -c and -r.

-c creates an executable, but also creates a DLL and some other support files. That executable is not standalone, it must have the DLL in the same folder to run. The main advantage of using -c is that, once the DLL and support files are created (may take a minute or two), the subsequent compilations are quite fast. That means you may change the script and quickly recompile it.

-r , on the other hand, creates a standalone executable, but it does the full compilation every time, so it takes longer to recompile if you change your script.

On Rededitor, you already have macros that save, compile and run your script. You may use the ![](http://helpin.red/lib/NewItem285.png) - Development quick compile with DLL (uses -c option) or the ![](http://helpin.red/lib/NewItem284.png) - Release compile to standalone exe (uses -r option).

CLI compiling:

You can create an executable from your GUI "Hello World".

If you saved the GUI program above as "MyFirst.red" in the "myprograms" folder of Rededitor, you should have something like this in your computer:

![](http://helpin.red/lib/NewItem235.png)

For the sake of clarity, make a copy of your Red executable and paste it in the same folder as your program, otherwise the results of the compilation will be in the Rededitor folder, lost among all those files.

![](http://helpin.red/lib/NewItem234.png)

Open the Command Prompt window. If you don't know how, write "cmd" in Window's search field and click on the Command Prompt icon:

![](http://helpin.red/lib/compile1.png)

In the Command prompt, type the path to your Red executable (the executable you just copied in the "myprograms" folder), followed by -r -t windows and the name of your program:

C:\\Users\\André\\Documents\\Rededitor\\myprograms&gt; red.exe -r -t windows Myfirst.red

Note: If you compile to windows, i believe you must always load the GUI library (use needs: view). If you just want a program that runs on CLI alone, you may use MSDOS (default) as target.

Red will give you a series of messages in the Command Prompt and, after about a minute you will have the standalone executable in your "programs" folder:

![](http://helpin.red/lib/NewItem233.png)

Double click on it and you will have your GUI "Hello World" message on your screen.

The -t windows is not really needed, as the default (MSDOS) will give you very similar results. Try both.

You could compile the MyFirst.red program using only the -c (compile) option:

C:\\Users\\André\\Documents\\Rededitor\\myprograms&gt; red.exe -c Myfirst.red

You will then have the following files in your "myprograms" folder:

![](http://helpin.red/lib/NewItem232.png)

The only two files you need to run your program are the libRedRT.dll and your program's executable, in this case MyFirst.exe.

However, when your run your executable, you will notice that Red keeps a very annoying Command Prompt window open as the program runs. If you want to avoid this use the target option -t. The option -t compiles it to a specific platform.

C:\\Users\\André\\Documents\\Rededitor\\myprograms&gt; red.exe -c -t windows Myfirst.red

This will result in those same extra files, including the DLL, but it won't open the Command Prompt while your program runs.

### Extra notes on compiling:

### [Red Wiki about issues](https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions)

 I found that the compiled version of a program may not behave as the interpreted one. I had problems with "print" statements I left for debugging, so I guess calling console commands in executable mode is not ok. I also had problems with global variables (words) inside functions, the compiler does not seem to recognize them as global variables. I solved this last problem in two different ways:

1. I "declared" my variables, that is: I assigned values to the variables (words) in the beginning of my program. The values are not important, as they change later.

<!--THE END-->

1. I used the "-e" compiler option (see in "Compiler options" below).

You should be able to compile to the platforms listed below but, as of this writing, Red is still evolving, and you may find some issues (e.g. compiling to android does not seem to work yet).

#### From Red's [github page](https://github.com/red/red):

###### Cross-compilation targets:

MSDOS        : Windows, x86, console (+ GUI) applications  
Windows      : Windows, x86, GUI applications  
WindowsXP    : Windows, x86, GUI applications, no touch API  
Linux        : GNU/Linux, x86  
Linux-ARM    : GNU/Linux, ARMv5, armel (soft-float)  
RPi          : GNU/Linux, ARMv5, armhf (hard-float)  
Darwin       : macOS Intel, console-only applications  
macOS        : macOS Intel, applications bundles  
Syllable     : Syllable OS, x86  
FreeBSD      : FreeBSD, x86  
Android      : Android, ARMv5  
Android-x86  : Android, x86

###### Compiler options:

-c, --compile                  : Generate an executable in the working  
                                folder, using libRedRT. (developement mode)  
\-d, --debug, --debug-stabs     : Compile source file in debug mode. STABS  
                                is supported for Linux targets.  
\-dlib, --dynamic-lib           : Generate a shared library from the source  
                                file.  
\-e, --encap                    : Compile in encap mode, so code is interpreted  
                                at runtime. Avoids compiler issues. Required  
                                for some dynamic code.  
\-h, --help                     : Output this help text.  
\-o &lt;file&gt;, --output &lt;file&gt;     : Specify a non-default \[path/]\[name] for  
                                the generated binary file.  
\-r, --release                  : Compile in release mode, linking everything  
                                together (default: development mode).  
\-s, --show-expanded            : Output result of Red source code expansion by  
                                the preprocessor.  
\-t &lt;ID&gt;, --target &lt;ID&gt;         : Cross-compile to a different platform  
                                target than the current one (see targets  
                                table below).  
\-u, --update-libRedRT          : Rebuild libRedRT and compile the input script  
                                 (only for Red scripts with R/S code).  
\-v &lt;level&gt;, --verbose &lt;level&gt;  : Set compilation verbosity level, 1-3 for  
                                Red, 4-11 for Red/System.  
\-V, --version                  : Output Red's executable version in x.y.z  
                                format.  
\--config \[...]                 : Provides compilation settings as a block  
                                of \`name: value\` pairs.  
\--cli                          : Run the command-line REPL instead of the  
                                graphical console.  
\--no-runtime                   : Do not include runtime during Red/System  
                                source compilation.  
\--red-only                     : Stop just after Red-level compilation.  
                                Use higher verbose level to see compiler  
                                output. (internal debugging purpose)

There is also -e option. See"Extra notes on compiling" above.

### []()Running Red on system's console:

To run Red on system's console, open cmd prompt, change directory to the folder where you have your Red executable and type its name followed by --cli . Note it's two dashes. I have red-063.exe, so:

C:\\Users\\André\\Documents\\RedIDE&gt;red-063.exe --cli  

--== Red 0.6.3 ==--                                

Type HELP for starting information.                

&gt;&gt;

Passing arguments to a Red script:

Everything on the command line that follows the script file name is passed to the script as its argument. Those arguments are stored on system/options/args as a block.

This script was saved as "arguments.red":

Red \[]

probe system/options/args

Executed from CLI:

C:\\Users\\André\\Documents\\RedIDE\\programs&gt;red-063.exe arguments.red foo boo loo

Output of script on Red's console is:

\["foo" "boo" "loo"]

&gt;&gt;

[&lt; Previous topic](http://helpin.red/Setup-VisualStudio.html)                                                                                          [Next topic &gt;](http://helpin.red/Built-inhelp.html)

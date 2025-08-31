Original URL: <http://helpin.red/Stoppingcode.html>

# Stopping code

* * *

* * *

### function!  quit         [Red-by-example](http://www.red-by-example.org/#quit)        [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-forever-unview-quit-if-and-print-)

### Stops evaluation and exits the program.

### If you type this on the GUI console (REPL), it closes. If you type this on the Command Line Interface, you just exit the Red interpreter.

/return      =&gt; Stops evaluation and exits the program with a given status. .

quit/return 3   ;hands the value 3 to the Operating System

On windows if you compile a red app that uses e.g., quit/return 55 and after running the .exe enter in cmd 'echo %errorlevel%', it will print 55 (or whatever you set).

### function!  halt         [Red-by-example](http://www.red-by-example.org/#halt)        [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-read-foreach-find-rejoin-halt-)

I think this one just stops (halts) the execution of the script. The documentation says it returns the value 1.

### routine!   quit-return [Red-by-example](http://www.red-by-example.org/#quit-return)

Stops evaluation and exits the program with a given status. Seems to me as exactly the same as quit/return, but it's a routine! datatype, not a function! Go figure.

VID DLS  on-close [Red-by-example](http://www.red-by-example.org/#on-close)        [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-on-close-unview-quit-)

VID event. Runs a piece of code when you close a GUI window. Mentioned also in GUI [Advanced topics](http://helpin.red/Advancedtopics.html).

Run the following program and when you close the window (close the program), it will print "bye!" at the console:

Red \[needs: view]

view [

       on-close \[print "bye!"]        

       button \[print "click"]

]

Control-C

Pressing control-C stops the execution and exits the interpreter in the Command Line Interface, but not on the GUI console.

[&lt; Previous topic](http://helpin.red/Runningcode.html)                                                                                          [Next topic &gt;](http://helpin.red/Datatypes.html)

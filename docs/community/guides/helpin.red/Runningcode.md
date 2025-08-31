Original URL: <http://helpin.red/Runningcode.html>

# Running code

* * *

* * *

Of course you may save your script as a file and run it from command prompt, as an argument of the Red executable, like this:

C:\\Users\\you\\whatever&gt; red-063.exe myprogram.red  

This will launch the Red interpreter, open the console (REPL) and run your script.

But once the Red environment is running, you can execute code using the built-in function  do .

### native! do [Red-by-example](http://www.red-by-example.org/#do)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-do-uppercase-and-lowercase-)

Evaluates the code in its arguments. In other words: executes the code. This argument can be a block, a [file](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html), a function or any other value.

&gt;&gt; do \[loop 3 \[print "hello"]]  
hello  
hello  
hello

Check the [Files](http://helpin.red/Files.html) chapter before you proceed here.

For example, if you saved a Red script as myprogram.txt you may execute it from the console by typing this:

&gt;&gt; do %myprogram.txt

Note that in this example the Red interpreter and the text file must be in the same folder, otherwise you must set your paths right.

Also, if you type:

&gt;&gt; a: load %myprogram.txt

And then:

&gt;&gt; do a

...your program will run normally.

do, [load](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) and [save](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) are better understood if you think of Red's console as the screen of some old computer from the 80's running some variation of basic language. You can load your program, save it, or do (execute) it.

You can also load and execute functions saved as text :

&gt;&gt; do load %myfunction.txt

 Notice that you can do all this from inside a Red program! So it's a powerful command.

[&lt; Previous topic](http://helpin.red/Consoleinputandoutput.html)                                                                                          [Next topic &gt;](http://helpin.red/Stoppingcode.html)

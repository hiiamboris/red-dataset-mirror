Original URL: <http://helpin.red/Writingtofiles.html>

# Writing to files

* * *

### []()Writing to files

* * *

##### Writing to a text file:

action! write  [Red-by-example](http://www.red-by-example.org/#write)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-save-load-write-read-delete-)

##### Writes to a file, creating it if it doesn't exist.

&gt;&gt; write %myFirstFile.txt "Once upon a time..."

##### Appending a text file:

##### /append

If you just write again to the file created above, it will be overwritten. If you want to add more text to it (append it):

&gt;&gt; write/append %myFirstFile.txt "there was a house."

Your file now has "Once upon a time...there was a house" in it.

##### Writing a series to a file making each element a line:

##### /lines

&gt;&gt; write/lines %mySecondFile.txt \["First line;" "Second line;" "Third line."]

##### Appending full lines:

&gt;&gt; write/append/lines %mySecondFile.txt \["Fourth line;" "Fifth line;" "Sixth line."]

Your file now looks like this:

First line;  
Second line;  
Third line.  
Fourth line;  
Fifth line;  
Sixth line.

Notice that you could have written write/lines/append. The order of the refinements makes no difference.

##### Replacing characters in a file:

To replace characters in a text file, starting at n+1 position, use write/seek %&lt;file&gt; &lt;n&gt; :

&gt;&gt; write/seek %myFirstFile.txt "NEW TEXT" 5

Now the first file has: "Once NEW TEXTime...there was a house."

Write refinements:

/binary      =&gt; Preserves contents exactly.

/lines       =&gt; Write each value in a block as a separate line.

/info        =&gt;

/append      =&gt; Write data at end of file.

/part        =&gt; Partial write a given number of units.

/seek        =&gt; Write at a specific position.

/allow       =&gt; Specifies protection attributes.

/as          =&gt; Write with the specified encoding, default is 'UTF-8.

function! save  [Red-by-example](http://www.red-by-example.org/#save)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-save-load-write-read-delete-)

Saves a value, block, or other data to a file, URL, binary, or string.

##### Difference between write and save:

&gt;&gt; write %myFourthFile.txt \[11 22 "three" "four" "five"]

Your file now has: \[11 22 "three" "four" "five"]

&gt;&gt; save %myFourthFile.txt \[11 22 "three" "four" "five"]

Your file now has 11 22 "three" "four" "five"

An important use of save is to simplify the saving of Red scripts that can be interpreted using the action do :

&gt;&gt; save %myProgram.r \[Red\[] print "hello"]  
&gt;&gt; do %myProgram.r  
hello

do, [load](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) and [save](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) are better understood if you think of Red's console as the screen of some old computer from the 80's running some variation of basic language. You can load your program, save it, or do (execute) it.

[&lt; Previous topic](http://helpin.red/Files.html)                                                                                          [Next topic &gt;](http://helpin.red/Readingfiles.html)

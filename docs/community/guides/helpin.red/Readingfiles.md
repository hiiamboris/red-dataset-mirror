Original URL: <http://helpin.red/Readingfiles.html>

# Reading files

* * *

### Reading files

* * *

##### Reading files as text:

action! read  [Red-by-example](http://www.red-by-example.org/#read)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-save-load-write-read-delete-)

&gt;&gt; a: read %mySecondFile.txt  
\== {First line;^/Second line;^/Third line.^/Fourth line;^/Fifth li

Now the word (variable) "a" has the entire content of the file:

&gt;&gt; print a  
First line;  
Second line;  
Third line.  
Fourth line;  
Fifth line;  
Sixth line.

##### Reading files as series where every line is an element:

Notice that, so far, the word "a" above is just text with newlines. If you want to read the file as a series! having each line as an element, you should use read/lines:

&gt;&gt; a: read/lines %mySecondFile.txt  
\== ["First line;" "Second line;" "Third line." "Fourth line;"...

&gt;&gt; print pick a 2  
Second line;

##### Read refinements:

##### /part        =&gt; Partial read a given number of units (source relative).

##### /seek        =&gt; Read from a specific position (source relative).

##### /binary      =&gt; Preserves contents exactly.

##### /lines       =&gt; Convert to block of strings.

##### /info        =&gt;

##### /as          =&gt; Read with the specified encoding, default is 'UTF-8.

function! load  [Red-by-example](http://www.red-by-example.org/#load)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-save-load-write-read-delete-)

Reading files as a series where every word (separated by space) is an element:

In this case, you should use load instead of read:

&gt;&gt; a: load %mySecondFile.txt  
\== [First line Second line Third line.  
               Fourth line Fifth...

&gt;&gt; print pick a 2  
line

##### Reading and writing binary files:

To read or write a binary file such as an image or a sound, you should use the /binary refinement. The following code loads a bitmap image to variable a and saves that image with another name:

&gt;&gt; a: read/binary %heart.bmp  
\== #{  
424D660700000000000036000000280000001E00000014000000010...  
&gt;&gt; write/binary %newheart.bmp a

##### Load refinements:

##### /header      =&gt; TBD.

##### /all         =&gt; Load all values, returns a block. TBD: Don't evaluate Red header.

##### /trap        =&gt; Load all values, returns \[\[values] position error].

##### /next        =&gt; Load the next value only, updates source series word.

##### /part        =&gt;

##### /into        =&gt; Put results in out block, instead of creating a new block.

##### /as          =&gt; Specify the type of data; use NONE to load as code.

[&lt; Previous topic](http://helpin.red/Writingtofiles.html)                                                                                          [Next topic &gt;](http://helpin.red/Functions.html)

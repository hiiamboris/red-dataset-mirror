Original URL: <http://helpin.red/Usingwords.html>

# Using words

* * *

* * *

Since a Red program is a series of words, its a good idea to take a closer look at them.

word

A word by itself (not data) does not mean much to Red. Every word must have a value associated to it while evaluated. This value may come from the evaluation of an expression or from the "dictionary". In this later case, it may be data or an action.

&gt;&gt; myBirthday  
\*\** Script Error: myBirthday has no value

word:

The colon after a word associates it with something in the dictionary. It is the classic "assignment" of other programming languages. By the way, this word-colon group (e.g. "myword:") is a set-word! datatype.

![](http://helpin.red/lib/NewItem174.png)

&gt;&gt; myBirthday: 30/07/1963  
\== 30-Jul-1963  
&gt;&gt; print myBirthday  
30-Jul-1963

Words may be associated with code (action) too:

&gt;&gt; a: \[print "hello"]  
\== \[print "hello"]  
&gt;&gt; do a  
hello

:word

The colon before a word makes it return whatever is associated with it in the dictionary without any evaluation. Values and actions are returned "as is". By the way, this is a get-word! datatype.

![](http://helpin.red/lib/NewItem173.png)

&gt;&gt; myBirthday: 30/07/1963  
\== 30-Jul-1963  
&gt;&gt; partyDay: :myBirthday  
\== 30-Jul-1963  
&gt;&gt; print partyDay  
30-Jul-1963

If a word is associated with an action, a colon before it makes it return the whole code of this action. This creates an interesting situation if you use it with Red's built-in functions:

&gt;&gt; imprimire: :print  
\== make native! [[  
   "Outputs a value followed by a newline"  
   ...  
&gt;&gt; imprimire "hello"  
hello

What happened above is that "imprimire" now has the same functionality as print . Something like this:

![](http://helpin.red/lib/NewItem175.png)

Important notes:

- the :word syntax is also used a way to access data in a series, as described in the [Blocks &amp; Series chapter;](http://helpin.red/BlocksSeries.html#Using_variables_indexes)
- if you redefine built-in functions in Red, you may cause a crash, not because of the change itself, but because all the internal functions that rely on the original meaning of that word may not work properly.

'word

Returns the word itself, that is: just a group of letters (but not a string! Just a symbol). This is a lit-word! datatype.

&gt;&gt; print something  
\*\** Script Error: something has no value  
\*\** Where: print  
\*\** Stack:  

&gt;&gt; print 'something  
something

&gt;&gt; type? :print  
\== native!  
&gt;&gt; type? 'print  
\== word!

/word

The slash before a word turns it into a refinement. Obviously, this is a refinement! datatype.

### native! set

### Assigns a value to a word. It seems to me as being the same as the colon after the word...

&gt;&gt; set 'test 33  
\== 33

### ...except that you may set many words at once:

&gt;&gt; set \[a b c] 10  
\== 10  
&gt;&gt; b  
\== 10

### native! unset

A previously defined word can be unset at any time using unset:

&gt;&gt; set 'test "hello"  
\== "hello"  
&gt;&gt; print test  
hello  
&gt;&gt; unset 'test  
&gt;&gt; print test  
\*\** Script Error: test has no value

[&lt; Previous topic](http://helpin.red/Notesonsyntax.html)                                                                                          [Next topic &gt;](http://helpin.red/Evaluation.html)

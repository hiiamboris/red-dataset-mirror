Original URL: <http://helpin.red/HRconventionsandnotations.html>

# HR conventions and notations

* * *

## Helpin'Red conventions and notations

* * *

1- Syntax highlight and scripts

I find that syntax highlight is very helpful for beginners as there are so many predefined words in Red and its code is so concise. Whenever possible I use syntax highlighted code taken from Notepad++\[1].

Red \[]

a: "Hello"

b: 123

c: \[33 "fox"]

print c

\[1] - To copy and paste highlighted code from Notepad++ I use a plugin called NppExport.

The console output is represented by a gray background. When examples are given as console-typed commands, I highlight the user-typed input using bold typeset. This can avoid confusion, as sometimes you may want to copy and paste text from the examples, and it may not work as expected.

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

I also add a line between commands to make it more readable, and sometimes comments and colored highlights. These are added by me during edition, so be careful when copying and pasting.

&gt;&gt; a: make hash! \[a 33 b 44 c 52]  
\== make hash! \[a 33 b 44 c 52]  
                               ;this empty line doesn't exist in the console  
&gt;&gt; select a \[c]  
\== 52  
                               ;this empty line doesn't exist in the console  
&gt;&gt; select a 'c  
\== 52                        ;comments and highlights are added by me later, during edition

[&lt; Previous topic](http://helpin.red/Introduction.html)                                                                                          [Next topic &gt;](http://helpin.red/Gettingstarted.html)

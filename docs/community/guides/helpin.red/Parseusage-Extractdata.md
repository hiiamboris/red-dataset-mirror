Original URL: <http://helpin.red/Parseusage-Extractdata.html>

# Parse usage - Extract data

* * *

* * *

Counting words on text :

Red \[]

a: "Not great Britain nor small Britain, just Britain"

count: 0

parse a \[any \[thru "Britain" (count: count + 1)]]

print count

3

Explaining the code:

As long as thru "Britain" finds a "Britain", any will repeat the rule

![](http://helpin.red/lib/NewItem176.png)

![](http://helpin.red/lib/NewItem177.png)

Notice that if you used to instead of thru, the input would be moved to BEFORE the match, creating an endless loop, since "Britain" would be a match over and over again.

Extracting the middle part of a text :

To extract the remaining part of a text from a given point, you may use word: , as explained in the [Storing Input](http://helpin.red/Storinginput.html#Collecting) chapter. To extract text between two parse matchings, you may use copy :

Red \[]

txt: "They are one person, they are two together"

parse txt \[thru "person, " copy b to " two"]

print b

they are

[]()Extract data from the Internet:

This is a very basic example. I have created an html page at helpin.red: [http://helpin.red/samples/samplehtml1.html](http://helpin.red/samples/samplehtml1.html). The html is very simple and you can see it by typing print read http://helpin.red/samples/samplehtml1.html at the console.

Since I know the html, I can extract some information with the code below:

Red \[]

txt: read http://helpin.red/samples/samplehtml1.html

parse txt [

       thru "today"

       2 thru "&gt;"

       copy weather1 to "&lt;"

       thru "tomorrow"

       2 thru "&gt;"

       copy weather2 to "&lt;"

       thru "week"

       2 thru "&gt;"

       copy weather3 to "&lt;"

]

print {Acording to helpin.red website weather will be: }

print \[] ; just adding an empty line

print \["Today:     "  weather1]

print \["Tomorrow:  "  weather2]

print \["Next week: "  #"^(tab)"  weather3] ; just showing the use of tab

Acording to helpin.red website weather will be:

Today:      sunny

Tomorrow:   horrible

Next week:          really really horrible

I will show how the parsing works for extracting the weather of "today" to the "weather1" variable:

thru "today" ; skips all text until after a "today" string.

border="1" cellpadding="2" cellspacing="2"&gt;

 &lt;tbody&gt;

   &lt;tr&gt;

     &lt;td style="color: black;"&gt;weather today:&lt;/td&gt;

     &lt;td style="color: black;"&gt;sunny&lt;/td&gt;

   &lt;/tr&gt;

   &lt;tr&gt;

2 thru "&gt;" ;this skips text until (after) the character "&gt;". Does it 2 times!

border="1" cellpadding="2" cellspacing="2"&gt;

 &lt;tbody&gt;

   &lt;tr&gt;

     &lt;td style="color: black;"&gt;weather today:&lt;/td&gt;        ; 1

     &lt;td style="color: black;"&gt;sunny&lt;/td&gt;                 ; 2

   &lt;/tr&gt;

   &lt;tr&gt;

copy weather1 to "&lt;" ; this copies to "weather1" all that it finds until (before) a "&lt;".

border="1" cellpadding="2" cellspacing="2"&gt;

 &lt;tbody&gt;

   &lt;tr&gt;

     &lt;td style="color: black;"&gt;weather today:&lt;/td&gt;

     &lt;td style="color: black;"&gt;sunny&lt;/td&gt;                  ; ==&gt; weather1

   &lt;/tr&gt;

   &lt;tr&gt;

[&lt; Previous topic](http://helpin.red/Parseusage-Validateinputs.html)                                                                                          [Next topic &gt;](http://helpin.red/Parseusage-Manipulatingtext.html)

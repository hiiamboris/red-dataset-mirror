Original URL: <http://helpin.red/CGI-Helloworld.html>

# CGI -"Hello world"

* * *

* * *

See also: [Quick and Easy CGI - A Beginner's Tutorial and Guide](http://www.rebol.com/docs/cgi1.html)

Download "rebol core" interpreter from [Rebol's download page](http://www.rebol.com/downloads.html). Save that executable to the www folder of your Cheyenne.

Now create the following script in a plain text editor and save it as myfirst.cgi in the same www folder.

#!www/rebol.exe -c

REBOL \[]

print "Hello world!"

print "&lt;br/&gt;"

print \["Date/time is:" now]

Your www folder now should look like this:

![](http://helpin.red/lib/NewItem252.png)

Now if your server is running (port 80) and you type localhost/myfirst.cgi in your browser's address bar, you get:

![](http://helpin.red/lib/NewItem251.png)

Explaining the script:

#!www/rebol.exe -c                ; This line is very important

; it tells your server the

; path to the interpreter.

; The -c option tells Rebol to

; run on CGI mode.

REBOL \[]                

print "Hello world!"                ; Sends "Hello world!" to the browser.

print "&lt;br/&gt;"                        ; Sends an HTML code for carriage return.

print \["Date/time is:" now]        ; Sends time and date

[&lt; Previous topic](http://helpin.red/RSP-RequestandResponse.html)                                                                                          [Next topic &gt;](http://helpin.red/CGI-Processingwebforms.html)

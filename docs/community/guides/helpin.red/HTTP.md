Original URL: <http://helpin.red/HTTP.html>

# HTTP

* * *

## I/O - HTTP

* * *

I have created a few files on helpin.red server to make tests with HTTP I/O:

[http://helpin.red/samples/samplescript1.txt](http://helpin.red/samples/samplescript1.txt)  - a simple loop without Red's header ( repeat i 3 \[prin "hello " print i] ).

[http://helpin.red/samples/samplescript2.txt](http://helpin.red/samples/samplescript2.txt) - a simple loop with Red's header. ( Red\[] repeat i 3 \[prin "hello " print i] )

[http://helpin.red/samples/samplehtml1.html](http://helpin.red/samples/samplehtml1.html) - a sample html page

&gt;&gt; print read http://helpin.red/samples/samplescript1.txt

repeat i 3 \[prin "hello " print i]

&gt;&gt; print read http://helpin.red/samples/samplescript2.txt

Red\[] repeat i 3 \[prin "hello " print i]

From a red script or using the console, you may execute code from a remote server:

&gt;&gt;  do read http://helpin.red/samples/samplescript1.txt   ;without header

hello 1

hello 2

hello 3

If the code in the remote server has the Red header, you may execute it directly, without the read statement:

&gt;&gt; do http://helpin.red/samples/samplescript2.txt    ;with Red \[] header

hello 1

hello 2

hello 3

You may load data or code, including functions and objects:

&gt;&gt; a: load http://helpin.red/samples/samplescript1.txt

== \[repeat i 3 \[prin "hello " print i]]

&gt;&gt; do a

hello 1

hello 2

hello 3

HTML files may also be accessed for processing. Take a look at the [example using the parse dialect](http://helpin.red/Parseusage-Extractdata.html#Extract).

&gt;&gt; print read http://helpin.red/samples/samplehtml1.html

&lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"&gt;

&lt;html&gt;

&lt;head&gt;

 &lt;meta content="text/html; charset=ISO-8859-1"

http-equiv="content-type"&gt;

 &lt;title&gt;testHtmlPage&lt;/title&gt;

&lt;/head&gt;

&lt;body&gt;

...

&lt;/html&gt;

[Rebolek's red-tools](https://github.com/rebolek/red-tools) has some HTTP tools that you may find interesting.

To be continued...

[&lt; Previous topic](http://helpin.red/IO.html)                                                                                          [Next topic &gt;](http://helpin.red/GUI.html)

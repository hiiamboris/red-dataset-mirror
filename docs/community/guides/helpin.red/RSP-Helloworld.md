Original URL: <http://helpin.red/RSP-Helloworld.html>

# RSP -"Hello world"

* * *

* * *

[Also check](https://www.cheyenne-server.org/wiki/Rsp/Basis.html) [Cheyenne's page about RSP](https://www.cheyenne-server.org/wiki/Rsp/Basis.html)

In RSP scripts, Cheyenne interprets anything in between "&lt;%"  and "%&gt;"  as Rebol code!

Open your index.html (the one you created in the "Installing and configuring..." chapter) with a plain text editor, add the following highlighted lines and save it in the www folder as myindex.rsp.

&lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"&gt;

&lt;% print "Hello world" %&gt;

&lt;html&gt;

&lt;head&gt;

 &lt;meta content="text/html; charset=ISO-8859-1"

http-equiv="content-type"&gt;

 &lt;title&gt;&lt;/title&gt;

&lt;/head&gt;

&lt;body&gt;

&lt;h2 style="text-align: center;"&gt;Congratulations! Your

Cheyenne server is working!&lt;/h2&gt;

&lt;div style="text-align: center;"&gt;Have a nice day!&lt;/div&gt;

&lt;% print 55 + 88 %&gt;

&lt;/br&gt;

&lt;/body&gt;

&lt;/html&gt;

&lt;% print rejoin \["Time now is " now/time] %&gt;

With Cheyenne running (listening to default port 80), type localhost/myindex.rsp on your browser's address bar. You should get this:

![](http://helpin.red/lib/NewItem246.png)

[&lt; Previous topic](http://helpin.red/InstallingandconfiguringCheyenn1.html)                                                                                          [Next topic &gt;](http://helpin.red/RSP-RequestandResponse.html)

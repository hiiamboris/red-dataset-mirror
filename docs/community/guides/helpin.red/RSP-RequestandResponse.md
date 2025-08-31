Original URL: <http://helpin.red/RSP-RequestandResponse.html>

# RSP -Request and Response

* * *

* * *

[You should refer to this page while reading this.](https://www.cheyenne-server.org/docs/rsp-api.html)

Requests:

Create the following script on a plain text editor and save it in the www folder as reqres.rsp.

&lt;%

print {&lt;font face="courier"&gt;}

print "content ...... = " probe request/content      print "&lt;br&gt;"

print "method ....... = " probe request/method       print "&lt;br&gt;"

print "posted ....... = " probe request/posted       print "&lt;br&gt;"

print "client-ip .... = " probe request/client-ip    print "&lt;br&gt;"

print "server-port .. = " probe request/server-port  print "&lt;br&gt;"

print "translated ... = " probe request/translated   print "&lt;br&gt;"

print "query-string . = " probe request/query-string print "&lt;br&gt;"

%&gt;

&lt;br&gt;&lt;br&gt;

&lt;HTML&gt;

&lt;TITLE&gt;Simple Web Form&lt;/TITLE&gt;

&lt;BODY&gt;

&lt;FORM ACTION="reqres.rsp"&gt;

&lt;INPUT TYPE="TEXT" NAME="Field" SIZE="25"&gt;&lt;BR&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Submit" VALUE="Submit"&gt;

&lt;/FORM&gt;

&lt;/BODY&gt;

&lt;/HTML&gt;

With Cheyenne running (listening to default port 80), type localhost/reqres.rsp on your browser's address bar. You should get this:

![](http://helpin.red/lib/NewItem250.png)

Now type something in the field, and press the submit button. Your browser should look like this:

![](http://helpin.red/lib/NewItem249.png)

What's happenning:

It's clear that Cheyenne picks the client's (browser) request, decode it, and stores all important values in internal variables of the object request.

When you click Submit button, ACTION="reqres.rsp" sends you to the same (refreshed) page! But, to do that, the browser sends a request that is split and stored in the request object's variables, which are shown in the refreshed page.

Responses:

In the same way that requests have the request object, responses have the response object. However, most of this object's fields are functions (actions). The most relevant exception is response/buffer, that is where Cheyenne's RSP stores all that is to be sent to the client. It's a block, and so you can manipulate it as any series.

If you change the reqres.rsp code to:

&lt;%

append response/buffer "&lt;HTML&gt;"

append response/buffer "&lt;h3&gt;This text is in the response buffer&lt;/h3&gt;"

append response/buffer "&lt;h4&gt;This text is in the response buffer too&lt;/h4&gt;"

append response/buffer "&lt;p&gt;So is this&lt;/p&gt;"

%&gt;

You get:

![](http://helpin.red/lib/NewItem248.png)

[]()Cool example:

Create and save the following RSP script as coolexample.rsp  in Cheyenne's www folder. Open localhost/coolexample.rsp on your browser and click a button. If your browser support HTML's SVG (most do), a corresponding image should show under it's button.

&lt;%

print {&lt;font face="courier"&gt;}

print "content ...... = " probe request/content      print "&lt;br&gt;"

%&gt;

&lt;HTML&gt;

&lt;br&gt;&lt;br&gt;

&lt;TITLE&gt;Cool Example&lt;/TITLE&gt;

&lt;BODY&gt;

&lt;b&gt;Cool Example&lt;/b&gt;&lt;p&gt;

&lt;FORM ACTION="coolexample.rsp"&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Triangle" VALUE="Triangle"&gt;&lt;br&gt;&lt;br&gt;

&lt;%

if not empty? request/content [

   if (first request/content) = 'Triangle  [

       print {&lt;svg width="100" height="100"&gt;

       &lt;polygon points="0,100 50,0 100,100"

       style="fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;" /&gt;

       &lt;/svg&gt; &lt;br&gt;}  

   ]

]

%&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Square" VALUE="Square"&gt;&lt;br&gt;&lt;br&gt;

&lt;%

if not empty? request/content [

   if (first request/content) = 'Square  [

       print {&lt;svg width="100" height="100"&gt;

       &lt;rect width="100" height="100" style="fill:rgb(0,0,255);stroke-width:10;stroke:rgb(0,0,0)" /&gt;

       &lt;/svg&gt; &lt;br&gt;}  

   ]

]

%&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Circle" VALUE="Circle"&gt;&lt;br&gt;&lt;br&gt;

&lt;%

if not empty? request/content [

   if (first request/content) = 'Circle  [

       print {&lt;svg width="100" height="100"&gt;

       &lt;circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" /&gt;

       &lt;/svg&gt; &lt;br&gt;}  

   ]

]

%&gt;

&lt;/FORM&gt;

&lt;/BODY&gt;

&lt;/HTML&gt;

![](http://helpin.red/lib/NewItem255.png)

[&lt; Previous topic](http://helpin.red/RSP-Helloworld.html)                                                                                          [Next topic &gt;](http://helpin.red/CGI-Helloworld.html)

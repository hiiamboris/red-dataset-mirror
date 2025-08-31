Original URL: <http://helpin.red/CGIusingRed.html>

# CGI using Red

* * *

* * *

Hello World!

See also: [Using Red as CGI](https://github.com/red/red/wiki/%5BDOC%5D-Using-Red-as-CGI)

Make a copy of the Red interpreter and save that executable to the www folder of your Cheyenne, just like you did to Rebol.

Rename Red's executable to something like redcgi.exe. I found that to be important because I have Red already "installed" in my computer (where my server is running - localhost), and the operating system tries to just run the script, not "CGI it".

Open the httpd.cfg file in a plain text editor, and add .red to the "bind-extern CGI to" block, as shown:

globals [

       ;--- define alternative and/or multiple listen ports (by default, cheyenne will run on 80)

       ;listen \[80 10443]

       bind SSI to \[.shtml .shtm]

       bind php-fcgi to \[.php .php3 .php4]

       bind-extern CGI to \[.cgi .red]

       bind-extern RSP to \[.j .rsp .r]

Now create the following script in a plain text editor and save it as myfirst.red in the same www folder. --cli is important, otherwise Red may try to compile and open the GUI console.

#!www/redcgi.exe --cli

Red \[]

print "Hello world!"

print "&lt;br/&gt;"

print \["Date/time is:" now]

Now if your server is running (port 80) and you type localhost/myfirst.red in your browser's address bar, you get:

![](http://helpin.red/lib/NewItem259.png)

Processing web forms.

As mentioned, Red does not have yet full support for CGI. However, I believe it's possible to retrieve and decode HTTP messages in Linux, using Boleslav Březovský's [http-tools.red](https://github.com/rebolek/red-tools/blob/master/http-tools.red) . I don't know how to do that in Windows.

[&lt; Previous topic](http://helpin.red/CGI-Processingwebforms.html)                                                                                          [Next topic &gt;](http://helpin.red/AppendixIII-MQTTusingRed.html)

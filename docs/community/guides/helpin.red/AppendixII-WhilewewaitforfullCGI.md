Original URL: <http://helpin.red/AppendixII-WhilewewaitforfullCGI.html>

# Appendix II -While we wait for full CGI..

* * *

## Appendix II -CGI and RSP using Cheyenne server

* * *

Red does not have CGI full support as of november 2018. The first chapters here cover the very basic steps using Rebol. I believe that Red behavior will be very similar, if not the same. That does not mean you cannot use Red for CGI. You can find a good reference of how to use it [here](https://github.com/red/red/wiki/%5BDOC%5D-Using-Red-as-CGI).

There is plenty of information about CGI in the Internet. However, I had difficulty with the very first steps, specially how to use the minimal [Cheyenne server](https://www.cheyenne-server.org/) on my own computer, as guinea pig for my tests. So I wrote this as a "get-started-guide", not a full comprehensive tutorial about CGI and RSP.

What is CGI

Common Gateway Interface (CGI), is a protocol that allows servers to execute programs that generate web pages dynamically, that is: programs that generate HTML code on-the-fly, "tailored" to the user's input.

CGI has been replaced by a vast variety of web programming technologies. Most developers today use scripting languages like PHP to do what CGI does.

Then why should you bother? Well, maybe you don't want to be a web developer, just connect your Red/Rebol scripts to web browsers, create some webapps, whatever. Web browsers are a great way to display information and interface with the user. And yes, you can get access to the Internet too.

What is RSP

I may be wrong on this, but I believe RSP is a Cheyenne-only thing. Its a kind of simplified way to do CGI, using Rebol embedded in the HTML code. What goes on is that Cheyenne packs a Rebol interpreter embedded in its code, so, unlike regular CGI, where you have to have to call some script interpreter (an executable) to run your script and create the HTML, RSP are files that are interpreted by a sort of native Rebol in Cheyenne. Besides, Cheyenne offers some nice RSP APIs to work with your scripts.

Why Cheyenne?

Because its incredibly small, just about 500 KB! It has one single configuration file and is fully portable. Besides, it's written in Rebol by Nenad Rakocevic and, as mentioned, natively interprets it. You can easily pack the whole thing plus your scripts in a project and still be below 1MB.

Basic HTTP information link:

[A primer on HTTP](https://medium.com/douglas-matoso-english/http-primer-for-frontend-developers-f091a2070637) - Very good, and has links to more detailed information.

[&lt; Previous topic](http://helpin.red/AppendixI-Whilewewaitforserialpo.html)                                                                                          [Next topic &gt;](http://helpin.red/InstallingandconfiguringCheyenn1.html)

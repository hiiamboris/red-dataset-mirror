Original URL: <http://helpin.red/Introduction.html>

# Introduction

* * *

* * *

About Red

- Both Red and Red/System are published under the [BSD](https://opensource.org/licenses/bsd-3-clause) license. The runtime is published under the [BSL](https://www.boost.org/users/license.html) license.
- Red is a programming language that fits in a single executable file with about 1MB. No install, no setup.
- Red is free and open-source.
- Red is interpreted, but can compile you code and generate single standalone executables.
- Red does some compiling before interpreting, and so turns out to be quite fast.
- Red is simple. Its code is clean and has no bloat at all.
- Red is under development (alpha) as of october 2018, but aims at:
  
  - being multi-plataform;
  - having cross-platform native GUI system, with a UI dialect and a drawing (graphics) dialect;
  - being a full-stack programming language, that is, from very low to very high level.
- Red is the open-source evolution of [Rebol](http://rebol.com/). If you want to try some of the features that are not yet available in Red, you should download Rebol and try it. However, Red is the future.
- Red is being developed by a group of people led by Nenad Rakocevic.
- Recently, Red raised substantial funds from an [ICO](https://ico.red-lang.org/) and  a Red Foundation was set up in Paris, France, so it's here to stay.

A taste of Red:

Red \[needs: view]

view [

   f1: field "First name"

   f2: field "Last name"

   button "Greet Me!" [

       t1/text: rejoin \["Have a very nice day " f1/text " " f2/text "!"]

   ]

   return

   t1: text "" 200

]

![](http://helpin.red/lib/NewItem53.png)

If I got you interested, you should really take a look at [Short Red Examples](http://redprogramming.com/Short%20Red%20Code%20Examples.html), by Nick Antonaccio.

About this work:

This is an evolution of the [Red Language Notebook](https://www.gitbook.com/book/ungaretti/red-language-notebook/details).  
I chose to use [HelpNDoc](https://www.helpndoc.com/) software to develop a more friendly and useful interface.

Notes:

- I use Windows, so this work is based on this Operating System.
- I'm not an experienced or even a good Red programmer, in fact, I'm not a programmer at all.
- English is not my native language.
- This isn't a complete reference for the Red language (yet?).
- I did not use the best coding style in many examples. Please, take a look at [Red's coding style guide](https://doc.red-lang.org/v/v0.6.0/Coding-Style-Guide.html).
- I try to make my work original, but some text was copied and pasted from Red's official documentation and I based some examples on what I found at:

<!--THE END-->

- - [red-by-example.org](http://www.red-by-example.org/index.html)[](https://ungaretti.gitbooks.io/red-language-notebook/content/www.red-by-example.org)[by Arie van Wingerden and Mike Parr](https://ungaretti.gitbooks.io/red-language-notebook/content/www.red-by-example.org)
  - [mycode4fun.com.uk](http://www.mycode4fun.co.uk/red-beginners-reference-guide) by Alan Brack
  - [redprogramming.com](http://redprogramming.com/Home.html) by Nick Antonaccio

Also, a lot of help came from the Red community at [gitter.im/red/home.](https://gitter.im/red/home) Thank You all!!!

- If you can't find something on the existing Red Documents, there is always [www.rebol.com](http://www.rebol.com/docs.html)[.](http://www.rebol.com/docs.html)

[&lt; Previous topic](http://helpin.red/Downloads.html)                                                                                          [Next topic &gt;](http://helpin.red/HRconventionsandnotations.html)

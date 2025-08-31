Original URL: <https://redprogramming.com/Home.html>

# What is the Red Programming Language?

* * *

[![HEADER IMAGE](https://redprogramming.com/header.png)](https://redprogramming.com/index.html)

Home

What is the Red Programming Language?

## Contents:

[1. A Modern Incarnation of Rebol](#section-1)  
[2. New Platforms and New Capabilities](#section-2)  
[3. How to Get Started Learning](#section-3)

## 1. A Modern Incarnation of Rebol

> Red is based conceptually and syntactically on [Rebol](http://rebol.com/) ("Relative Expression Based Object Language").� Rebol is a commercial, closed source programming language created in the late 1990's which aimed to be the most productive, readable, and concise development tool available. Its main goal was to reduce code complexity and to remove bloated infrastructure found in typical software development stacks.
> 
> Rebol languages are much simpler to use and dramatically more compact than even tools like Python, Ruby, Lua, Clojure, Javascript, Visual Basic, etc. Take a look at the short code examples below to get a taste (more than 70 apps are contained in about 1000 lines of code at this link):
> 
> [http://re-bol.com/short\_rebol\_examples.r](http://re-bol.com/short_rebol_examples.r) � ([video](https://youtu.be/lR5Fzv6DP0I) and [screen shots](http://re-bol.com/short_rebol_examples/) of these examples)
> 
> Various full distributions of the Rebol interpreter run on [Windows, Mac, Linux, BSD](http://www.rebol.com/download-view.html), [Android, Raspberry Pi](http://r3al.org/download-rebol3.html), and more than 40 [legacy platforms](http://www.rebol.com/release-archive.html). [Typical distributions](http://www.rebol.com/download-view.html) which include graphics, GUI, network, sound, database, math, compression, email, CGI, security, and other features weigh in at *less than 1 megabyte*. Core language distributions are much smaller. Rebol version 2 ('R2') has been used in a wide variety of commercial production environments for more than 16 years.
> 
> In 2012 Rebol's creator, Carl Sassenrath, released the Apache licensed (open source) 'R3' version of Rebol. This release contained primarily just the Core language, and was missing most of the useful features which made R2 so broadly productive. Some developers in the community did add critical GUI and graphics capabilities, as well as important features such as network protocols. This enhanced version of R3 was ported to [Android, Raspberry Pi](http://r3al.org/download-rebol3.html), as well as Windows, Linux, and other OSs. [Other developers](http://blog.hostilefork.com/rebol-state-union-june-2015/) have taken the Core Rebol language in [new directions](https://github.com/metaeducation/ren-c), but for the most part, R3 has never become as popular with the Rebol community as R2. Several other implementations of the Rebol language, most notably [Boron](http://urlan.sourceforge.net/boron/), [World](http://www.world-lang.org/), and [Topaz](http://www.colellachiara.com/soft/topaz/try-topaz.html), are available but also aren't as widely used.

## 2. New Platforms and New Capabilities

> Luckily, prior to the release of R3, Nenad Rakocevic (known as "DocKimbel" in the community) had already begun work on a completely open source, full featured incarnation of R2, called [Red](http://www.red-lang.org/), which would help Rebol users move into the future. Red is meant to be 90+% code compatible with R2, and it adds important new features.
> 
> First, Red is meant to target not only the desktop platforms covered by R2 (Windows, Linux, Mac, BSD etc.), but also mobile OSs (Android, iOS, and others), and the web (in browsers, Node.js, etc.). This will allow Red code to run on virtually every common modern platform.
> 
> Whereas Rebol was strictly an interpreted language, Red is a native code compiler. This allows code to run faster and more securely on each platform, and it enables the creation of compact applications which can be distributed in app stores, without any interpreter, virtual machine, or runtime overhead. Because Red is designed from the ground up to be a cross-compiler, you can create applications for any supported platform, using a Red compiler on any other supported OS (for example, produce Android and Mac apps on a Windows machine, and visa-versa). Red distributions do also contain a convenient REPL console command interpreter.
> 
> Another important new feature of Red is Red/system. Much like C, Red/system can produce extremely fast performing code when it's needed, offering more manual control of "close to the metal" operations such as memory management and finer grained handling of CPU, cache, and other precise hardware activities. Unlike other low level tools, Red/System is a dialect of Red itself (a "DSL" or Domain Specific mini Language within the main language). Precise low level Red/system code can be placed directly inline with more productive high level Red code. The similarities between Red and Red/system make it more consistent to work with when combining and integrating low level and high level pieces of code. Red/system naturally eases the mental transition between widely varied coding tasks, it is quicker to learn, less trouble to work with, and more productive than other traditional options. No other language offers such a broad spectrum of capability in such a uniformly usable little package.
> 
> To keep up with modern hardware, Red is being designed to make use of multiple processor cores, and it offers concurrency (parallel processing) features which were not previously available in Rebol.
> 
> Red has been described as the first "full stack" programming tool because of its ability to cover everything from low level compiled system and driver development, all the way up to high level scripting, and everything in between, including native app creation for desktop and mobile platforms, as well as front end browser based development, and web server development too, all using the same strikingly succinct language syntax and data structures, as well as a workflow which is uniquely productive, and tooling which is less bloated than virtually any other software development system in common use.
> 
> Red also fits the "full stack" description in another important way: it is created entirely from a Rebol based tool chain, so there is no C code at its heart. It also does not require the use of libraries created via other languages/infrastructure, or any other external heavy tooling, anywhere in its build chain. Red builds upon its own dramatically concise and lightweight tool set, without any of the third party requirements and bloat found in other typical software development stacks. Of course, Red can easily make use of third party tools such as shared libraries, but all of the necessary features are built from its own full stack of pure Red/Rebol code.
> 
> The goal of Red is to allow developers to create any type of software, on virtually any platform, all with just a single tiny development tool, using the least complicated language available anywhere, and a productive workflow which can't be beat.
> 
> See [**this article**](http://redprogramming.com/Why%20Rebol%20and%20Red.html) for more information about why Rebol based languages are so remarkably compact, productive, and easy to use. Rebol's commercial effort was a marketing failure, but the technology itself is an enduring technical success. If you haven't experienced it yet, you will be surprised at just how deeply powerful this uncannily tiny and simple tool is. There really is nothing else like it ... until now.

## 3. How to Get Started Learning

> Updated Red specific tutorials are posted on this site, as progressive versions of Red get completed. At this point, Red version 0.6.0 is currently being released, with support for GUI, IO, network connectivity, and other important features. The tutorials and examples here currently demonstrate how each of those 0.6.0 features can be used in applications.
> 
> See the [Getting Started Tutorial](http://redprogramming.com/Getting%20Started.html) and the [Short Red Code Examples](http://redprogramming.com/Short%20Red%20Code%20Examples.html) pages to learn the basics of working with Red.
> 
> Prior to the 1.0 and 2.0 releases, one way to learn more about Red coding is to start with Rebol. Learning to use R2 will give you a clear picture of what Red code looks like, and what the final Red workflow will feel like. R2 is still perfectly useful for production development work on all common desktop and server operating systems (and complete R3 versions exist for Android, Raspberry Pi, and other OSs). Most of what drove developers to use Rebol is true of Red - Red is just a more modern open source version, with great new features, capabilities, and potential.
> 
> Below are links to code examples, tutorials, and other texts to get you started with Rebol. An overwhelming majority of R2 code is expected to work essentially the same in production versions of Red:
> 
> - Rebol Quick Start: [http://re-bol.com/rebol\_quick\_start.html](http://re-bol.com/rebol_quick_start.html)
> - Quick Start, Part 2: [http://re-bol.com/rebol\_quick\_start\_part2.html](http://re-bol.com/rebol_quick_start_part2.html)
> - More Examples: [http://re-bol.com/examples.txt](http://re-bol.com/examples.txt)
> - (Be sure to see the Short Code Examples first:) [http://re-bol.com/short\_rebol\_examples.r](http://re-bol.com/short_rebol_examples.r) and the [video run-thru of these examples](https://youtu.be/lR5Fzv6DP0I)
> - Detailed Book (800 pages): [http://business-programming.com/](http://business-programming.com/)
> - 68 YouTube Video Tutorials about Rebol (10 hours of video): [http://musiclessonz.com/rebol\_video\_links.html](http://musiclessonz.com/rebol_video_links.html)
> - A Quick Overview of Rebol: [http://easiestprogramminglanguage.com/](http://easiestprogramminglanguage.com/)
> 
> The Red community has gathered at [https://gitter.im/red/red](https://gitter.im/red/red). If you want to be involved in the development of Red, that is the place to go.
> 
> Feel free to ask questions at [http://rebolforum.com](http://rebolforum.com/), especially if you're learning Rebol first. The community is friendly and helpful.

Copyright � 2000-2015 Nick Antonaccio. All rights reserved.

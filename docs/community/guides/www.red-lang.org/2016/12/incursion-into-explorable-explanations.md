![Red](https://static.red-lang.org/red-logo.svg)

# [Red Programming Language](https://www.red-lang.org/)

## Pages

- [Home](http://www.red-lang.org/)
- [About](http://www.red-lang.org/p/about.html)
- [Getting Started](http://www.red-lang.org/p/getting-started.html)
- [Download](http://www.red-lang.org/p/download.html)
- [Documentation](http://www.red-lang.org/p/documentation.html)
- [Contributions](http://www.red-lang.org/p/contributions.html)
- [Roadmap](http://www.red-lang.org/p/roadmap_2.html)
- [Privacy Policy](https://www.red-lang.org/p/privacy-policy.html)

## December 17, 2016

[]()

### Incursion into "explorable explanations" lands

A few days ago, [Nicky Case](https://twitter.com/ncasenmare) released an amazing piece of work in form of an [interactive guide to alternative voting systems](http://ncase.me/ballot/). This work follows the track of Brett Victor's famous research on [explorable explanations](http://worrydream.com/ExplorableExplanations/) and immediately caught our eyes because it is a very good match for the capabilities of our [reactive](http://www.red-lang.org/2016/06/061-reactive-programming.html) native [GUI system](http://www.red-lang.org/2016/03/060-red-gui-system.html). We decided to replicate some of Nicky's interactive explanations in Red and see how it goes. The results are pretty amazing, as it was not only relatively easy to design and code (about 8 hours in total and ~280 LOC) but also great fun! Here is the result:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirW5h1gOh7tKdw6NcU2NYLqtpf8S1JnbGN3xUghwWeZbQB0ppDuSmYTRhcpOPNDcs0is7Kg_aEd0UuFU__j6GUlbU7tjP6jLcV-vK5dSvNgJHVxo3bZsHb5CA0lj-l6ag1OvfoMH2kkIWy/s1600/ballots.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirW5h1gOh7tKdw6NcU2NYLqtpf8S1JnbGN3xUghwWeZbQB0ppDuSmYTRhcpOPNDcs0is7Kg_aEd0UuFU__j6GUlbU7tjP6jLcV-vK5dSvNgJHVxo3bZsHb5CA0lj-l6ag1OvfoMH2kkIWy/s1600/ballots.gif)

You can, of course, try it yourself by using the latest build from the master (or macGUI) branch or, preferably, one of the prebuilt consoles:

- Ballots demo source on [github](https://github.com/red/code/tree/0.6.2/Showcase/ballots) or [zipped archive](http://static.red-lang.org/tmp/ballots.zip) (171KB).
- Windows [prebuilt console](http://static.red-lang.org/tmp/red-console.exe) (273KB).
- macOS [prebuilt console](http://static.red-lang.org/tmp/red-console-osx) (256KB).
- Original web version from Nicky on [github](https://github.com/ncase/ballot/tree/gh-pages/play).

Put the console executable in the source code folder, run it and from the prompt, just type:

```
    red>> do %ballots.red
```

For Linux folks, sorry guys, the GUI support is not yet ready for prime time, though in the meantime, you could use Wine, Red GUI usually runs just fine on it.

Notes for macOS users:

- You need to \`chmod +x\` the binary before running it from the terminal.
- When dragging a face quickly, it can lag behind. The macOS GUI backend is still in a development branch, and still need some work to optimize animation latencies.

Implementation notes

The Red version implements only the "model1" and "ballot1" to "ballot4" interactive explanations. The rest could also be easily done in the same way, though we used up all our spare time for that as we are now focussing on the Red 0.6.2 release.

The colored shapes are images in the web version, but instead we chose to draw them using our 2D [vector DSL](https://doc.red-lang.org/en/draw.html) in the Red version. Overall, the Red version is really small, about 25-45 LOC per screen, 85 LOC for the helper code and 2D shapes. All things considered, it is significantly smaller than the web version:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjlURXALQwHMTn4ZJCwQAeE9vgWxy9pPmlqEeBD9mjJMdw-43g6lI2EU_aweg0eklR0hGIau5ogUyqlHOw73odHg5C2Tonf_Mvp2qgN9ch-q-q4xFDgYXoSrqJz2WsxHLr9tIYDQh_HX5v3/s1600/web-red.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjlURXALQwHMTn4ZJCwQAeE9vgWxy9pPmlqEeBD9mjJMdw-43g6lI2EU_aweg0eklR0hGIau5ogUyqlHOw73odHg5C2Tonf_Mvp2qgN9ch-q-q4xFDgYXoSrqJz2WsxHLr9tIYDQh_HX5v3/s1600/web-red.png)

This is an interesting result, as the web version uses only plain JS, no third-party framework (with the exception of the almost weightless [minipubsub](https://github.com/daniellmb/MinPubSub)). The counted JS code could maybe be shortened (excluding minification) though it already looks pretty simple to me, containing very few comments, doing mostly calculations and canvas drawing. I doubt it could be reduced significantly (any thoughts from expert JS readers about that?).

Final thoughts

This fun experiment shows that Red has the potential to be a great match for explorable explanations and other similar reactive interface needs. We hope that this demo will inspire the Red community to dig more in that direction and see what gems are lying there. For example, learning Red using such interactive visual approach would be great, don't you think so? ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [12:07 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2142781399364458519&from=pencil "Edit Post")

Labels: [console](https://www.red-lang.org/search/label/console), [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.), [GUI](https://www.red-lang.org/search/label/GUI), [MacOSX](https://www.red-lang.org/search/label/MacOSX), [reactive](https://www.red-lang.org/search/label/reactive)

[]()

#### 17 comments:

01. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Edoc](https://www.blogger.com/profile/17149439864339580053)[December 17, 2016 at 11:58 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1482015488187#c364042264793650544)
    
    Cool! Thanks for the interesting post.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/364042264793650544)
    
    [Replies]()
    
    1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
       
       [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[February 16, 2017 at 6:53 AM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1487224408432#c5914388343562575106)
       
       You're welcome. :-)
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5914388343562575106)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
02. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [mydoghasworms](https://www.blogger.com/profile/02355652082090843731)[December 19, 2016 at 12:06 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1482145568469#c6432567704024187107)
    
    This is pretty extraordinary. What's even better is when you look at how tiny the Red runtime is compared to the Javascript engine (and the fact that you have to run the Javascript version in the browser). Excellent work!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6432567704024187107)
    
    [Replies]()
    
    1. [Reply]()
03. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[January 2, 2017 at 9:21 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1483388517959#c3676206900946981686)
    
    Red is everything I've ever wanted in a PL. Keep up the good work and somebody needs to start putting together a good beginner focused book or tutorial.
    
    I'm impressed something so cool can be so tiny.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3676206900946981686)
    
    [Replies]()
    
    1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
       
       [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[February 16, 2017 at 6:53 AM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1487224391379#c9060272523054700092)
       
       Thanks for the kind support! Sane design principles (like using what the OS provides instead of binding to gigantic libraries) are the reasons why it is that tiny. ;-)
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/9060272523054700092)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
04. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[February 14, 2017 at 11:03 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1487109807524#c7667773771790892240)
    
    Hey. I'm brand new to programming. I have a question. Is it possible to create a 2D game using only Red(GUI system)? I don't want to use opengl or directx, because it is to difficult for me. I DON'T mean very simple games like chess for example. I want to create RTS game with isometric view like stracraft. Is Red(out of the box) good for such a things? Thanks.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7667773771790892240)
    
    [Replies]()
    
    1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
       
       [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[February 16, 2017 at 6:49 AM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1487224178340#c1507886472223009582)
       
       Welcome to Red and programming! AFAICT, modern games which are using isometric views, are actually using 3D engines for rendering (on top of OpenGL/DirectX). Though, you can still experiment and build a prototype for such game using Red and its Draw DSL (vector 2D). You can get support from the Red community (some are pro game programmers) on https://gitter.im/red/red/welcome
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1507886472223009582)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
05. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[February 15, 2017 at 6:49 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1487180973973#c7301380117497690427)
    
    This looks great and I am really pleased we now have the Mac GUI, will be trying this out tonight. One minor comment is that the link to Vector DSL is broken (seems to put you in the Gitbook but there is no related content. I am on a windoze machine at the moment using MS IE 11 if that makes a difference (will try on my Mac with Chrome or safari later) - regards David Murphy
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7301380117497690427)
    
    [Replies]()
    
    1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
       
       [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[February 16, 2017 at 6:44 AM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1487223841287#c6895641372756671495)
       
       Hi David, thanks for the kind support and the broken link report. As we have moved our documentation to Asciidoc on gitbook.io, the links have changed a bit, breaking most of the doc links in the recent articles. This has been fixed now.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/6895641372756671495)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
06. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Maarten](https://www.blogger.com/profile/01885205039172516910)[February 24, 2017 at 6:04 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1487955847658#c3397336141110940525)
    
    I/O.....
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3397336141110940525)
    
    [Replies]()
    
    1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
       
       [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[March 7, 2017 at 11:22 AM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1488882121262#c6756604630856101328)
       
       Marteen, there is no roadmap which would satisfy every possible user. We choose the project priorities according to intrinsic technical needs (for implementing planned features for next milestone), the user growth it could generate and how much it can help the project survive in the long term (e.g. GUI before IO). Overall, it's a complex process in a changing context, it does not boil done to one single feature which would be a game-changer for the whole project (unfortunately).
       
       That said, the work on 0.7.0 (full I/O) should start as soon as 0.6.3 is release, which is planned for a couple of months from now.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/6756604630856101328)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
07. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [jose](https://www.blogger.com/profile/13145470808329834009)[March 24, 2017 at 7:14 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1490379264338#c5953971109962577680)
    
    I believe that implementing call as Rebol has, could be a big help to use RED while mature, in this way we can call another tools to do stuff that RED can not do it now. Thanks! (i speak spanish and use windows )
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5953971109962577680)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [jose](https://www.blogger.com/profile/13145470808329834009)[March 24, 2017 at 7:30 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1490380202491#c5103533512753627403)
    
    How we can conect the View or interface as a front end from Red to another languajes in a easy way? , Could be with call ? http ? ftp?, a file ?, I do not mean embed code , only comunication between red and another compilated program, i know little about that topic, I saw VBA example, I can not run it because I have Libre Office and all fail with errors, and with C all error too, undefined functions told me. Thanks
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5103533512753627403)
    
    [Replies]()
    
    1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
       
       [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 8, 2017 at 4:52 AM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1491619958265#c5347722818375459220)
       
       AFAIK, LibreOffice does not have VBA support, but it has its own version of Basic. So I guess someone knowledgeable in that macro language could give it a try to integrate libRed.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5347722818375459220)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
09. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [jose](https://www.blogger.com/profile/13145470808329834009)[March 24, 2017 at 8:09 PM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1490382550896#c7589742916590495222)
    
    Sorry in red-latest call is implemented!! Thanks
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7589742916590495222)
    
    [Replies]()
    
    1. [Reply]()
10. ![](//resources.blogblog.com/img/blank.gif)
    
    [austenStrine](http://github.com/austenstrine)[March 30, 2017 at 8:17 AM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1490854672909#c1283170783206497732)
    
    I second the motion from the above anonymous that a tutorial should be developed for beginners. I'm new to code as well (started about 8 months ago, I know some C++ and JavaScript, working on Java right now) and am very interested in investing time and energy into teaching myself Red. The simplicity and speed is extremely appealing to me as a beginner especially, and it seems like the flexibility suits a lot of my eventual goals. Keep up the good work! If you need help with develop​ing a tutorial, I'll be a guinea pig!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1283170783206497732)
    
    [Replies]()
    
    1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
       
       [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 8, 2017 at 4:55 AM](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html?showComment=1491620109516#c7909780975352782144)
       
       You can have a look at the Documentation page on this site, under the "Community-provided learning material" section, you should find there some suitable material for beginners. As the Red community grows, new docs are tutorials will be added, so stay tuned. ;-)
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/7909780975352782144)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=2142781399364458519&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2017/03/062-libred-and-macros.html "Newer Post") [Older Post](https://www.red-lang.org/2016/12/entering-world-of-macros.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/2142781399364458519/comments/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [►](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2025/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2024](https://www.red-lang.org/2024/) (4)
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2024/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2024/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2024/02/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2023/06/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2022](https://www.red-lang.org/2022/) (2)
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2022/07/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2021/08/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2020/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2020/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2019](https://www.red-lang.org/2019/) (10)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2019/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2019/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2019/10/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2019/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2019/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2019/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2019/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2019/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2018/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2018/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2018/10/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2018/09/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2018/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2018/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2018/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2018/01/) (5)

<!--THE END-->

- [►](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)

<!--THE END-->

- [▼](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
    
    - [Incursion into "explorable explanations" lands](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html)
    - [Entering the World of Macros](https://www.red-lang.org/2016/12/entering-world-of-macros.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2015/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2014/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2013/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2013/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2013/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2013/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2012/02/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2011/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2011/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2011/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2011/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2011/05/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)

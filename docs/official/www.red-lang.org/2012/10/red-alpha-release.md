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

## October 28, 2012

[]()

### Red alpha release

We have all waited long for this to happen, but it is finally there: first Red alpha release!

This is the biggest milestone since the initial release of Red System, as it marks the entrance of the higher layer of the Red software stack. There's still another layer pending, the JIT compiler, but that's for 2013, when Red will be self-hosted.

### What Red can do so far?

So what happened since the first Red compiler release a little more than [a month ago](http://www.red-lang.org/2012/09/red-is-born.html)? We have added quite a lot of features actually:

- **15 datatypes**: block!, string!, char!, integer!, logic!, none!, word!, lit-word!, get-word!, set-word!, refinement!, action!, native!, op!, unset!.

<!--THE END-->

- **19 actions**: make, form, mold, add, divide, multiply, subtract, append, at, back, clear, head, index?, length?, next, pick, poke, skip, tail.

<!--THE END-->

- **21 natives**: if, unless, either, any, all, while, until, loop, repeat, foreach, forall, print, prin, equal?, not-equal?, strict-equal?, lesser?, greater?, lesser-or-equal?, greater-or-equal?, not.

<!--THE END-->

- **10 infix operators**: +, - , \*, /, =, ==, &lt;, &gt;, &lt;=, &gt;=.

String! datatype fully supports Unicode from end to end and in a cross-platform way, according to [our plan](http://www.red-lang.org/2012/09/plan-for-unicode-support.html) (see the [hello.red](https://github.com/red/Red/blob/master/red/tests/hello.red) demo script).

We also have some unit tests (223 [tests](https://github.com/red/Red/tree/master/red/tests/source) right now), but that number should rapidly increase once we will be able to fully port QuickTest framework to Red (in a couple of weeks, once Red will gain functions).

All those features were mostly coded in the last month, some parts are still lacking (e.g. refinements support for actions/natives) but that gives you an idea of the pace at which Red will be further developed.

However, we haven't started yet writting the documentation for Red language, we should decide soon on the kind of documentation we want (hint: you can make propositions about that on the Red [mailing-list](http://groups.google.com/group/red-lang?hl=en) or FB [page](https://www.facebook.com/groups/redlanguage/)). Red API documentation will most probably be generated automatically from source code by extracting doc-strings.

### What's not yet there?

A lot of things, but they will be added progressively until the end of the year, where we should have a pretty complete Red (bootstrap) implementation. So, the main pieces to implement are:

- Red runtime lexer (LOAD native)
- Functions and objects support
- I/O support (including networking)
- More complete memory allocator and a garbage collector.
- Concurrency support
- Additional datatypes

### Can I try it already?

Red codebase is available at [github](https://github.com/red/Red), just clone it locally or download a [packaged](https://github.com/red/Red/tags) version. Some simple instructions to setup and run it can be found [here](https://github.com/red/Red/blob/master/README.md). As we are still at the bootstrap stage, the installation process and usage is more complex than it should be, once self-hosted. Anyway, we should be able to deliver some test binaries soon and simplify the usage for those who want to play with the alpha releases.

### How does Red work?

Currently Red scripts are statically compiled using the %red.r front-end wrapper. The Red lexer loads the UTF-8 encoded Red scripts in memory in form of blocks of values. Those blocks are then compiled to a Red/System script, that gets itself compiled to native code and outputs an executable binary. The Red/System compiler has been enhanced to be able to compile source code directly from memory.

Some compilation options are already available, the famous -t option from Red System is also present, allowing Red to cross-compile any script as easily as with Red/System.

This is just the beginning, so for now, whole Red runtime library is compiled with user scripts each time. We will add modular compilation support at some point to get the full compilation speed back.

You can test the few example Red scripts from the [repository](https://github.com/red/Red/tree/master/red/tests). Here is what the [demo.red](https://github.com/red/Red/blob/master/red/tests/demo.red) script outputs on some of the platforms Red can already run on:

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_uQOa1pBqV6MnFzQDtWE5IvvvO3WEohxdCr3amhIdbKT25J_cfm3I1He205SOxB_vNH9TUUPE7wONEovXJqtN2rxsq3c8J6KD4PNfWpmjMCCSt3=s0-d "Red on MacOS X")](http://static.red-lang.org/mac-rel030.png)[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_s0x8WFs-AVCmlEqgD5AzK0DX0MfMpBoBmcjkCIIO1dEftq3Q7bj8e0lYUQWfKDGyCJ0VuEeMOpDp3TF7TjzGGPP2XPzbKjKK5QUEmXsEGDM7M=s0-d "Red on RaspberryPi")](http://static.red-lang.org/rpi-rel030.png) [![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_t1cmgynlv--bsccTMMUHBB9VnhD0tekl7dMK1nofYaeRWWamBwjUG-QBD0Tfrv7FJD7fo8UvGD8XY_8E-UCubhimyohB-g5gTv-mP0E10NCtrX=s0-d "Red on Linux")](http://static.red-lang.org/lin-rel030.png)[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_t6D29lJraexk4zhyEy-vomT084_U4FxkFvPPY9xZ-XGUZ_sAaFuwuORTHcshtD8nSXCDkGr6kiWuxeJlrFL-bVVUPiukoddNJ3EJaEJyz5zlA=s0-d "Red on Windows")](http://static.red-lang.org/win-rel030.png)

*The missing characters in some of the screenshots are Chinese ones as I only have font support for them on Ubuntu.*

Red was originally conceived to be statically typed. However, during the early stages of Red implementation, it appeared that an hybrid typing system will be more adequate for a language that will support high-level scripting, without the burden of a sophisticated, but slow, type inference engine. The overhead of such inference engine can be very high (cf Scala [slow](https://scala-ide-portfolio.assembla.com/spaces/scala-ide/tickets/1001054#/activity/ticket:) compilation speed ). The hybrid type system works very simply, typing is optional, but if local variables and function returned values are typed by user, the compiler will be able to generate faster code (more than an order of magnitude faster for, e.g., pure math expressions) and catch more programming errors at compile time.

Red compiler does not do any optimization so far, it basically outputs the equivalent of an unrolled interpreter loop. Some optimizations will be added along the development of the bootstrap version of Red,  but the full extent of possible optimizations will be left for the self-hosted Red.  Firstly because the current compiler code is disposable, so we don't want to invest too much time in it, secondly because the final JIT compiler will allow even deeper optimizations thanks to reflection and profiling information collected at runtime.

### Red/System changes

Red/System has been improved significantly during the Red early development:

- function pointer support has been extended and improved, dereferencing is now possible.
- 20 [issues](https://github.com/red/Red/issues?milestone=7&state=closed) have been fixed.
- some long-standing bugs with GTK+ and other bindings on ARM platforms have been fixed.

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_sbN_6SW8gDBHzoFjESg5AC0MBf6xgMzI-Ac3T7X1cRjAa3YXDpBT8PapkPZDbJMJ-E2rzbsZc4gnxv42KhE0YBKckLDoKygmv0RzJgYrSp9CtvMB7wKQ=s0-d "GTK+ Red binding on RaspberryPi")](http://static.red-lang.org/rpi-gtk-widgets.png)

### So, what's coming next?

Red will now mature very quickly, as functions and objects will make their entrance in the next days/weeks. A new Red alpha release is planned very soon, probably for mid-november with a lot of new features.

The work on shared library generation for MacOS and Linux platforms is on-going. Once available, we'll be able to literally "plug" Red in a lot of third-party apps, including other programming languages. Also, this will enable (or make easier) the bridging with some external systems like Java, .Net and objective-c, in order to fully support the main mobile platforms.

As you can see, next months will see some important parts of Red come to life, be sure not to miss them, follow us on our [mailing-list](http://groups.google.com/group/red-lang?hl=en), on [Twitter](http://twitter.com/red_lang), [IRC](http://webchat.freenode.net/?channels=red-lang&uio=d4) and [Facebook](https://www.facebook.com/groups/redlanguage/).

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:53 PM](https://www.red-lang.org/2012/10/red-alpha-release.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2945858017054355896&from=pencil "Edit Post")

Labels: [alpha](https://www.red-lang.org/search/label/alpha), [announce](https://www.red-lang.org/search/label/announce), [GTK+](https://www.red-lang.org/search/label/GTK%2B), [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi), [Red](https://www.red-lang.org/search/label/Red), [release](https://www.red-lang.org/search/label/release)

[]()

#### 16 comments:

01. ![](//resources.blogblog.com/img/blank.gif)
    
    crex[October 28, 2012 at 4:52 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351439561860#c8490372271153904263)
    
    Great Work! Thanks!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8490372271153904263)
    
    [Replies]()
    
    1. [Reply]()
02. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [-pekr-](https://www.blogger.com/profile/07020449092496153923)[October 28, 2012 at 5:52 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351443139227#c2235639348648641631)
    
    Great, another milestone done. Now towards the next level :-)
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2235639348648641631)
    
    [Replies]()
    
    1. [Reply]()
03. ![](//resources.blogblog.com/img/blank.gif)
    
    [Hein Hoenjet](http://www.hoenjet.com)[October 29, 2012 at 8:05 AM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351494355957#c3496683282580233019)
    
    Amazing!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3496683282580233019)
    
    [Replies]()
    
    1. [Reply]()
04. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [taumox](https://www.blogger.com/profile/14842564518815781904)[October 31, 2012 at 2:48 AM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351648131648#c1304200895215103488)
    
    im none-programmer but would like to give Red a try, are their plans to add its own easy to code GUI programming like Rebol has?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1304200895215103488)
    
    [Replies]()
    
    1. [Reply]()
05. ![](//2.bp.blogspot.com/_Cx6wcNjdZaE/TLv-QWarUVI/AAAAAAAAAAk/fsbX8zukVHg/S45-s35/Librarian_%28Discworld%29.jpg)
    
    [Λύκινος](https://www.blogger.com/profile/10680255298496274615)[October 31, 2012 at 10:56 AM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351677407458#c7247317448488231981)
    
    Great!  
    I think Red is by far the most exciting new computer language project.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7247317448488231981)
    
    [Replies]()
    
    1. [Reply]()
06. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Kaj de Vos](https://www.blogger.com/profile/02786569312219497586)[October 31, 2012 at 4:38 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351697927979#c4650041169600209192)
    
    Clark, Red/System already has a binding with the cross-platform GTK+ GUI library, which looks more or less like REBOL and is much easier to use than other language bindings with GTK. Look on the Contributions page here. We're working on making it available from Red.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4650041169600209192)
    
    [Replies]()
    
    1. [Reply]()
07. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [taumox](https://www.blogger.com/profile/14842564518815781904)[October 31, 2012 at 4:55 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351698953100#c6730293417944900392)
    
    @Kaj de Vos
    
    that is nice to hear, im gonna check it out when its already available, and yes Red looks very exciting its gonna make programming much easier
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6730293417944900392)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[October 31, 2012 at 11:31 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351722681087#c1932638145714017705)
    
    Thanks to you all for your kind support!
    
    Clark, Red will have several GUI frameworks for you to use, including a HTML5-based one.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1932638145714017705)
    
    [Replies]()
    
    1. [Reply]()
09. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [taumox](https://www.blogger.com/profile/14842564518815781904)[November 1, 2012 at 1:05 AM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1351728349831#c457293660497239619)
    
    @Nenad Rakocevic
    
    thanks a lot!!! \*waits patiently for Red to mature*
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/457293660497239619)
    
    [Replies]()
    
    1. [Reply]()
10. ![](//resources.blogblog.com/img/blank.gif)
    
    [Amanda](http://pythoncentral.org/)[November 4, 2012 at 7:06 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1352052367119#c5612873453668949260)
    
    One of the most promising (futuristic)language projects. I happened to see the presentation the day before yesterday. It's cool..I must say.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5612873453668949260)
    
    [Replies]()
    
    1. [Reply]()
11. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[November 5, 2012 at 2:25 AM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1352078729161#c2513354906929694948)
    
    Thanks Amanda. The whole project is very ambitious, but with enough will, energy and (good) coffee, nothing is impossible! ;-)
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2513354906929694948)
    
    [Replies]()
    
    1. [Reply]()
12. ![](//resources.blogblog.com/img/blank.gif)
    
    [Arnold](http://arnoldvanhofwegen.com)[November 5, 2012 at 3:00 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1352124024460#c8643013466279885087)
    
    What is a long wait to the REBOL community?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8643013466279885087)
    
    [Replies]()
    
    1. [Reply]()
13. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Random Geek](https://www.blogger.com/profile/04418631013390679883)[November 6, 2012 at 12:13 AM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1352157227975#c109846624104935763)
    
    Don't wait for it to mature, @Clark! Play with it now, or at least as soon as you can. I know I will at least be installing it and trying some simple things tonight ^\_^
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/109846624104935763)
    
    [Replies]()
    
    1. [Reply]()
14. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjhJGGnAjmO3A1LRadbRV-ohfvLoF73K-cnxHj0x8TbeXh_q0Z6iBPEyahsEBNgm50E5mapDg_5_RXB3n8CXKXahyG5wOpj2tRrNDz7WfOtIwAs19V8cSfdQ5gNeBoMjZg/s45-c/1000px-Black_Sun.png)
    
    [ZM76](https://www.blogger.com/profile/01030618457177552953)[November 29, 2012 at 4:24 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1354202695293#c2153805748433579103)
    
    Just discovered this project this morning while I was contemplating writing a JIT for REBOL. I have to say that I haven't been this excited about something for a long time. Red will allow me to develop and deliver all my code from one platform and replace the three other languages that I have to use for various tasks. A big thanks to Nenad and everyone else working on Red!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2153805748433579103)
    
    [Replies]()
    
    1. [Reply]()
15. ![](//2.bp.blogspot.com/_Cx6wcNjdZaE/TLv-QWarUVI/AAAAAAAAAAk/fsbX8zukVHg/S45-s35/Librarian_%28Discworld%29.jpg)
    
    [Λύκινος](https://www.blogger.com/profile/10680255298496274615)[December 1, 2012 at 2:50 PM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1354369815586#c2519141063469766418)
    
    I forgot to mention that I made a blog entry about red:  
    http://www.linuxinside.gr/content/%CE%BC%CE%B9%CE%B1-%CE%BD%CE%AD%CE%B1-%CE%B3%CE%BB%CF%8E%CF%83%CF%83%CE%B1-%CE%B3%CE%B5%CE%BD%CE%BD%CE%B9%CE%AD%CF%84%CE%B1%CE%B9
    
    note that it is just a blog. I have no other connection to linuxinside team.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2519141063469766418)
    
    [Replies]()
    
    1. [Reply]()
16. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[December 7, 2012 at 12:26 AM](https://www.red-lang.org/2012/10/red-alpha-release.html?showComment=1354836413838#c1241033553850013707)
    
    @Λύκινος: thanks for helping spreading Red!
    
    @ZM76: thanks for your enthusiasm and kind words!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1241033553850013707)
    
    [Replies]()
    
    1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=2945858017054355896&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2012/12/red-v031-functions-support-added.html "Newer Post") [Older Post](https://www.red-lang.org/2012/09/plan-for-unicode-support.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/2945858017054355896/comments/default)

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

- [►](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
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

- [▼](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
    
    - [Red alpha release](https://www.red-lang.org/2012/10/red-alpha-release.html)
  
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

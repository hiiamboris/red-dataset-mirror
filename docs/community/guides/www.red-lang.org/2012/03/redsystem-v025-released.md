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

## March 12, 2012

[]()

### Red/System v0.2.5 released

This is a mainly a bug fixing release with several [issues and bugs](https://github.com/red/Red/issues?sort=created&direction=desc&state=closed&page=1&milestone=5) in float numbers handling solved.

In addition to that:

- Libc is now much better integrated with Red/System, the \_\_libc\_start\_main C internal initialization function is now correctly handled by Red/System on all supported platforms. This ensures that all libraries relying heavily on C will now work as well as if called from a C program. Thanks to Andreas for the nights spent on digging and debugging that.

<!--THE END-->

- The IA-32 floats backend has been improved to keep last float value in FPU rather than passing it to CPU. This change not only simplifies the backend code emitter but also reduces significantly the generated code size for floats. As a side effect, float-intensive programs are now twice as fast as with v0.2.4. The same change could be applied to ARM backend, but with less gains as ARM can easily transfer data between CPU and FPU, as opposed to IA-32 architecture, which requires an intermediary step through memory when using x87 FPU.

By the way, that's our first birthday (technically ten days ago) since Red project was announced for the first time at the ReBorCon 2011 conference in Amsterdam. The initial schedule has been changed several times since then, to better adapt to the very rapid changes that are occurring in the computing world (massive move to mobile devices to name the main one).

After 900+ commits and thanks to all the contributors, we now have solid foundations to build upon, much better than what I expected to have, one year ago. The focus from now is getting the Red language layer up and running as soon as possible. A large window of opportunities is opening in 2012, so let's not miss it!

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [10:58 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6608285167538780954&from=pencil "Edit Post")

Labels: [bugfixes](https://www.red-lang.org/search/label/bugfixes), [floats](https://www.red-lang.org/search/label/floats), [FPU](https://www.red-lang.org/search/label/FPU), [libc](https://www.red-lang.org/search/label/libc), [x87](https://www.red-lang.org/search/label/x87)

[]()

#### 14 comments:

01. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[March 13, 2012 at 5:37 AM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331613454300#c2870950995244467535)
    
    Truly awesome work!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2870950995244467535)
    
    [Replies]()
    
    1. [Reply]()
02. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[March 13, 2012 at 7:07 AM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331618868463#c2952401631599714519)
    
    Keep up the good work Nenad!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2952401631599714519)
    
    [Replies]()
    
    1. [Reply]()
03. ![](//resources.blogblog.com/img/blank.gif)
    
    [Olivier](http://www.auverlot.fr)[March 13, 2012 at 7:26 AM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331619966805#c6694503936961683011)
    
    C'est cool !
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6694503936961683011)
    
    [Replies]()
    
    1. [Reply]()
04. ![](//resources.blogblog.com/img/blank.gif)
    
    [Laurent](http://publiberty.com)[March 13, 2012 at 9:52 AM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331628755530#c2324757463920028503)
    
    Great, awesome work done in one year.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2324757463920028503)
    
    [Replies]()
    
    1. [Reply]()
05. ![](//resources.blogblog.com/img/blank.gif)
    
    Thomas[March 13, 2012 at 8:50 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331668228723#c858110327494549837)
    
    What a job ! I sincerely hope that Red will meet 2012-opportunities that you speak about, and that Red community will reach a significant size among other language communities...
    
    By the way, what "features" will be available in first alpha version of Red ? blocks handling, files handling, protocols,... ? Just to have an overview of next big step...  
    And, when is this version planned roughly ?
    
    Thanks.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/858110327494549837)
    
    [Replies]()
    
    1. [Reply]()
06. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/11657272516600553659)[March 14, 2012 at 10:47 AM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331718459526#c3144147181360082083)
    
    May the next 900 commits be equally productive. :-)
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3144147181360082083)
    
    [Replies]()
    
    1. [Reply]()
07. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[March 14, 2012 at 1:51 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331729467772#c5688803202782127731)
    
    Thank you all for your kind support!
    
    @Thomas: for the very first Red alpha, only memory management, basic datatypes and a few natives/actions. Ports and I/O will probably be added in following alpha versions, as PARSE. If we don't hit any walls, we should have it a few weeks, probably a month.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5688803202782127731)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//resources.blogblog.com/img/blank.gif)
    
    Thomas[March 15, 2012 at 5:25 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331828747183#c653745021097814204)
    
    Great news ! In a month ! How quick it is, even if it has only core features...thrilling !  
    It could be nice to have detailed Red roadmap in progress...blocks handling, objects support ?, ports, I/O and network protocols, proxy support ?, Unicode ?, PARSE, errors handling, profiling ?, and so on...
    
    1st alpha Red version will be built using compiler written in Red/system ? (without Rebol 2 bootstrap ?)
    
    Thanks.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/653745021097814204)
    
    [Replies]()
    
    1. [Reply]()
09. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[March 15, 2012 at 6:05 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331831140320#c3025569286579566829)
    
    Red first compiler will be built with REBOL2 as part of the bootstrapping process. Then the next step will be to build Red/System compiler using Red.
    
    About the detailed roadmap, I will see if I can do something similar to the existing global roadmap but for Red features only, once the first alpha will be released.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3025569286579566829)
    
    [Replies]()
    
    1. [Reply]()
10. ![](//resources.blogblog.com/img/blank.gif)
    
    Thomas[March 16, 2012 at 3:58 AM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331866726008#c8211809465005069770)
    
    Thanks Nenad for these informations.  
    OK. I understand more about Red/system compiler written in Red. You need PARSE for example.  
    Was just an idea for the roadmap, you must be more than busy ! But, it can be nice to have a more feature-oriented roadmap for people to follow language progress (as well as already existing roadmap).  
    Thanks for the hope you are raising inside Rebol community, and beyond...
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8211809465005069770)
    
    [Replies]()
    
    1. [Reply]()
11. ![](//resources.blogblog.com/img/blank.gif)
    
    Ingo[March 16, 2012 at 5:53 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1331916810560#c8741985866301545968)
    
    Great work, keep it up!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8741985866301545968)
    
    [Replies]()
    
    1. [Reply]()
12. ![](//resources.blogblog.com/img/blank.gif)
    
    Thomas[March 20, 2012 at 7:20 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1332267618219#c2705262655207854591)
    
    Nenad,
    
    Do you plan to implement a module system in Red, like Rebol 3 one (http://www.rebol.com/r3/docs/concepts/modules.html ) ?  
    I found it well thought and designed. It reminds me a little of OSGI bundles (http://en.wikipedia.org/wiki/OSGi ) more and more used in java application servers and in Eclipse RCP applications. It allows for example hot code deployment on server side.
    
    Thanks.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2705262655207854591)
    
    [Replies]()
    
    1. [Reply]()
13. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[March 26, 2012 at 12:38 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1332758337148#c2554210992304991745)
    
    Yes, we plan to implement a module system, it has not been designed yet but it will probably be similar to the Rebol3 one.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2554210992304991745)
    
    [Replies]()
    
    1. [Reply]()
14. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [ًمرحبا](https://www.blogger.com/profile/15050740952545701569)[March 28, 2014 at 6:03 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html?showComment=1396026191410#c6325773330878069882)
    
    hope to develop this language for robot for future of technology and machine
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6325773330878069882)
    
    [Replies]()
    
    1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=6608285167538780954&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html "Newer Post") [Older Post](https://www.red-lang.org/2012/02/floating-point-support-released.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/6608285167538780954/comments/default)

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
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
    
    - [Setting up an ARM virtual machine](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html)
    - [Red/System v0.2.5 released](https://www.red-lang.org/2012/03/redsystem-v025-released.html)
  
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

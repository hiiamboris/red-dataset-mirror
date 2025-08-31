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

## December 19, 2015

[]()

### Answers to community questions

Features, future directions

**Will Red get lisp like macros?**

The short answer is: yes, but.... We first need to define how we want the API for macros to look like and how to prevent users from shooting themselves in the foot too easily using them. Also, macros are challenging for a visual debugger, we also need first to have a clear vision of how an IDE would handle that (I have not yet looked into how top Lisp IDE managed that, though I hope they have solved it elegantly).

About the ETA, we had a strong need for macros in our Android bridge, though that need might be gone now that Red's startup time has been vastly improved earlier this year. Answer to that should come in a few weeks, once we merge the existing Android backend with our new GUI engine.

**When will Red get optional types?**

It already has, along with multi-typing: you can specify one or more allowed types for function arguments, return value and local words. Only arguments type-checking is implemented for now, the rest will come on the path to 1.0. The most interesting part of optional typing is how much the compiler will be able to leverage it to generate much faster code when everything is mono-typed. Though, we will find that out after 1.0, once we will work on the self-hosted compiler and toolchain. As the current toolchain has a limited lifetime, we try to avoid any non-mandatory feature before 1.0.

**Will Red have built-in support for some type of concurrency and/or parallel processing? What kind of model is it going to follow?**

Certainly. Increase in computation power is now horizontal, with multiple cores, multiple processors and distributed architectures, so, strong concurrency support is a key part of a modern general-purpose language.

For now, the model we aim at is the [Actor model](https://en.wikipedia.org/wiki/Actor_model). It is a good fit for Red and would provide a clean way to handle concurrent and parallel tasks across multiple cores and processors. Though, a few years has passed since that plan was made, so we will need to revisit it when the work on 0.9.0 will start, and define what is the best option for Red then. One thing is sure, we do not want multithreading nor callback hell in Red. ;-)

**Do you plan to implement any kind of app/web server in Red, similar to Cheyenne available for Rebol?**

As [Cheyenne](http://cheyenne-server.org/)'s author, I have strong plans for a new web application server with much better scalability than what you could achieve using Rebol. Red 1.0 should come with pretty strong server-side programming abilities out of the box, then on top of that, we'll provide a modern framework for webapp creations (think [GWT](http://www.gwtproject.org/) or [Opalang](http://opalang.org/)-like approach).

In addition to that, we'll have a Cheyenne [RSP](http://cheyenne-server.org/docs/rsp-api.html) compatibility layer for running old Cheyenne scripts aiming at at drop-in replacement for existing webapps.

**Will Red support multiselect/switch soon?**

As soon as possible, maybe for the upcoming 0.6.0 release.

**Will we get promises/futures in Red?**

Possibly. We will experiment with that in one of the 0.7.x releases. We will have to see how such abstraction could integrate in our future concurrency model.

**Will Red get direct access to Android's (and IOS later) camera, location, gyroscope, etc features?**

Absolutely, our GUI engine already features a camera widget (in our Windows backend). The work on Android backend in 0.6.x version will bring wrappers to all the common hardware features.

**Red is going to get modules support in future, what about Red/System?**

As Red/System is an embedded dialect of Red, Red's upcoming modules system will allow inclusion of Red/System parts, so a separate modules system for it is not necessary for now.

**Will function! be first-class datatype in Red/System v2?**

Strictly speaking no, as you won't be allowed to create new functions from Red/System at run-time (but you will be able to create new Red/System functions from Red dynamically). The other first-class features will be possible (to a greater extent than today): passing function! pointer as arguments, returning a function! value from a function or assigning a function! pointer to a variable.

**Will Red have the equivalent of Go lang's net package?**

Red will feature a complete networking layer in 0.7.0, including async IO support, through a nice high-level API (similar to Rebol's one). So DNS, TCP, UDP and many more common protocols will be built-in, fortunately, relying on a very lightweight API, unlike Go's net package. ;-)

**What about a package manager (in future)?**

We have a modules system planned for 0.8.0. Design details are not yet defined, though we'll strive to integrate the best ideas from other existing package managers around.

**Is there going to be inbuilt unit testing, something like http://golang.org/pkg/testing/?**

We'll have a built-in unit testing support, probably starting with a lightweight one integrated into our upcoming modules system.

**Is there a chance Red gets self-hosted sooner than initially planned, removing the R2 dependency?**

Self-hosting Red means rewriting the toolchain (compilers, linker and packagers) in Red (currently written in Rebol2). Technically, 0.6.0 should have all the needed features for starting such rewrite, unfortunately, we currently don't have the resources to start such big task while continuing the work towards 1.0. The self-hosting work would not be a port of the current toolchain, it would use a very different architecture (because of JIT-compilation requirement and extra features of Red compared to Rebol). We aim at a programmable modular toolchain model, not very far from LLVM (just simpler and magnitudes smaller).

To be accurate, fully removing Rebol2 dependency is a two steps process:

1. Removing the need for Rebol/SDK to build the Red binary, making it easy for anyone to rebuild Red binary from sources.
2. Rewriting the toolchain in Red.

Developers, community, documentation

**How do you regard the development of Red 2.0 to proceed in terms of speed/progress? Will it be faster or equal to current road to Red 1.0?**

Red 2.0 is mostly about rewriting the toolchain in Red, which represents only 25% of the current Red codebase (the other 75% part is the runtime library). Moreover, the modular architecture and public API  of the new toolchain will make it much easier to write and integrate contributions from third-parties, so we'll gear all our efforts towards involving as many skilled contributors as possible. If you want Red 2.0 to come quicker, helping Red's user base grow up by contributing, writing apps, docs and tutorials is the best thing you can do right now. ;-)

**What do you think is the "killer app" Red should provide, in order to attract more of developers/newcomers?**

Definitely an innovative IDE. ;-) Beyond that, I believe that a successful Android app written in Red could do a lot to spread Red usage widely. If you have a great idea for such app, you'll soon be able to code it in Red 0.6.1, with full Android support.

**What about documentation comments (something like rustdoc https://doc.rust-lang.org/book/documentation.html)?**

In Red, like in Rebol, [docstrings](https://en.wikipedia.org/wiki/Docstring) are allowed in functions (and in modules once we have them), so they can be processed more easily than comments (which exist only when the source is in text form). That's one of the tangible advantages of having an homoiconic language. That is also how the **help** command works in the console, it extracts information at runtime from functions and the environment.

That said, if you want heavier documentation embedded inside your code, you can easily define your own format for that and writing a preprocessor for it should be almost trivial using our [Parse](http://www.red-lang.org/2013/11/041-introducing-parse.html) dialect (either in text form or after loading, in block form). You can go as far as implementing a [Literate Programming](https://en.wikipedia.org/wiki/Literate_programming) layer if that suits your taste, like [this one](http://www.colellachiara.com/soft/MD3/emitters/wetan.html) made for Rebol.

That's all for this time, if you want to discuss some parts deeper, you are welcome to join our [chat-room on Gitter](https://gitter.im/red/red), which is way more convenient than Blogger's comment system.

See you soon for the 0.6.0 release, don't miss it! ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:18 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=5714086215828312502&from=pencil "Edit Post")

Labels: [community](https://www.red-lang.org/search/label/community), [questions](https://www.red-lang.org/search/label/questions)

[]()

#### 13 comments:

1. ![](//3.bp.blogspot.com/-gqT_LPMCkNY/Wnz1zHWUUJI/AAAAAAAAAUE/TrYhda_bi9wpMLrWaqDK93461xJq2s26gCK4BGAYYCw/s35/BlueZX.png)
   
   [Joshua Olson](https://www.blogger.com/profile/11861529836159362837)[December 19, 2015 at 3:19 PM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1450534798643#c6789902067876641451)
   
   If Red wants an innovative IDE, the one to beat is the Leo editor. It's like Light Table and org-mode had a homoiconic baby. GitHub recently added it to its text editor showcase and it's possibly the state-of-the-art in fluidly connecting literate documentation to code that practically writes itself with mind maps. Red may be ahead of its time in wanting its own complete stack, but its philosophy of computational self-sufficiency from idea to machine code would go so well together with a non-Pythonic Leo.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6789902067876641451)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[March 22, 2016 at 10:28 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1458638910406#c5843319761993549185)
      
      Thanks for the info. The innovations we are aiming at, are in a different direction, though, experiments like Leo are good food for thoughts.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5843319761993549185)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[December 20, 2015 at 9:18 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1450599489830#c1796305153718142824)
   
   Congratulations on the upcoming 0.6 release! Looking at the Trello lists, it looks like garbage collection won't be added until 0.8. Until then, how are Red programmers handling memory management?
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1796305153718142824)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[December 21, 2015 at 5:37 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1450672659553#c1948192294482392002)
      
      Thank you! For now, until we get the full GC implemented, if you stick to a few simple rules, the memory usage remains low enough. For example, by avoiding doing frequent temporary allocation, especially in loops, or re-using allocated series as much as possible, using the \`/into\` refinement where available. So far, we don't really have big Red applications, nor server-side ones, so memory usage remains in acceptable ranges despite the lack of GC.
      
      By the way, there's also a \`simple-gc\` branch on github which implements a temporary GC while waiting for a more sophisticate one. In that branch, the GC is implemented, but needs significant debugging before being usable. So, we should have a backup solution before 0.8 arrives.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1948192294482392002)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
3. ![](//3.bp.blogspot.com/-gqT_LPMCkNY/Wnz1zHWUUJI/AAAAAAAAAUE/TrYhda_bi9wpMLrWaqDK93461xJq2s26gCK4BGAYYCw/s35/BlueZX.png)
   
   [Joshua Olson](https://www.blogger.com/profile/11861529836159362837)[December 27, 2015 at 4:47 PM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1451231255393#c9076322267496050633)
   
   This comment has been removed by a blog administrator.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/9076322267496050633)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[January 11, 2016 at 8:46 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1452498373201#c1740838421699102143)
   
   is there any plan for game develop? i think red is very nice for game develop
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1740838421699102143)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [san2](https://www.blogger.com/profile/10154949734349870488)[March 21, 2016 at 6:59 PM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1458583185590#c1649839858975620432)
      
      I may have read online that Red 1.0 may be able to handle game development.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1649839858975620432)
      
      [Replies]()
      
      1. [Reply]()
      
      ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[March 22, 2016 at 10:26 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1458638818095#c5079180388700369877)
      
      Red can be used for game coding, though, currently it is not optmized for that domain. We will provide in the future (post 1.0) a proper support for writing fast 2D/3D games.
      
      That said, you can already write simple games using the GUI engine from master branch (Windows only for now).
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5079180388700369877)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
5. ![](//resources.blogblog.com/img/blank.gif)
   
   Sam[February 6, 2016 at 6:58 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1454738328881#c3593020093237092145)
   
   You really should take a look at this. The best way to learn about mistakes is to learn from others. It's about a system language called BitC. It's sounds very much like RED in it's ideas, sorta. The reason it's important to look at it it seems he was not able to pull it off and whatever problems he had might be avoided by you. He's done a lot of work at Universities and Microsoft on micro-kernals and other stuff and seems to know what he's talking about.
   
   Here's a link to wiki on bitC
   
   https://en.wikipedia.org/wiki/BitC
   
   A link from that page to an explanation of what went wrong. He raises some issues that you may have already figured out.
   
   http://www.coyotos.org/pipermail/bitc-dev/2012-March/003300.html
   
   A link to BitC project that has some design goal info.
   
   https://www.bitc-lang.org/
   
   And for shits and giggles Protothreads
   
   http://dunkels.com/adam/pt/index.html
   
   My apologies if this is irrelevant.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3593020093237092145)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[March 22, 2016 at 10:32 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1458639157768#c3151198029736032968)
      
      Thanks for the links Sam. I know about BitC and protothreads. BitC is a system programming language, while Red is a fullstack language (from system to high-level programming and dialecting).
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/3151198029736032968)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
6. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[March 17, 2016 at 2:55 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1458179738478#c7438758321104139549)
   
   Can you kindly put some tutorials on Youtube (latest stable) as many people are really interested in this programming language and there isn't too much material available. I think that will gain Red some well deserved interest. Good Luck!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7438758321104139549)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[March 22, 2016 at 10:34 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1458639264586#c9136360402958108847)
      
      Thanks for the good suggestion. We are planning a series of learning videos, though, our resources are currently entirely focused on bringing Red to a decently usable level. Community support and help for creating learning materials like videos and documentation is mostly welcome.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/9136360402958108847)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
7. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[December 25, 2016 at 11:47 AM](https://www.red-lang.org/2015/12/answers-to-community-questions.html?showComment=1482662833638#c8248297442672308639)
   
   People at Red, Can I ask about new updates, looking at number of forks at github and how much material is available on line it looks like a toy project with no real life usage? Do you people have some material book like other languages have? Besides how it creates small forms is really amazing
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8248297442672308639)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=5714086215828312502&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2016/03/060-red-gui-system.html "Newer Post") [Older Post](https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/5714086215828312502/comments/default)

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

- [▼](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
    
    - [Answers to community questions](https://www.red-lang.org/2015/12/answers-to-community-questions.html)
  
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

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

## April 17, 2011

[]()

### Update on Red/System progress

Here is a quick update on Red/System progress.

**Specifications Draft**

Draft has gone through several revisions. Several decisions mainly regarding pointers handling have been taken with simplification and disambiguation as main goals:

- Struct! values are now passed by reference (a syntax for passing by value will be added in future), simple arithmetic (+, -) can be used on struct references.

<!--THE END-->

- String! was renamed to c-string! to avoid possible future collision with a Unicode-aware string! type. However, this case is not totally solved, there are still some possible issues, like the [literal syntax](http://groups.google.com/group/red-lang/browse_thread/thread/e1f1b06d4ae58004?hl=en). As c-string! values are passed by reference, simple arithmetic was added too.

<!--THE END-->

- Pointer! datatype was restricted to point to integer! values only. It is more consistent with new c-string! and struct! which are both (implicit) pointers already, and that removes the need for verbose pointer syntax.

<!--THE END-->

- Array! datatype: no decision taken for now, we will see if (both explicit and implicit) pointer arithmetic support will be sufficient during Red's runtime implementation.

<!--THE END-->

- Logic! datatype was added as a first class type. This makes boolean literal values (true, false) and conditional expressions assignable to variables and can be passed as argument or returned by user functions. Logical NOT operator was also added as well.

<!--THE END-->

- Byte! datatype (unsigned byte value) was added to ease string byte accesses.

<!--THE END-->

- Limited type inference was added for function's local variable and return value types.

A couple of things to keep in mind about Red/System design:

- during the implementation of these specifications, some better design options might appear in light of the implementation decisions.

<!--THE END-->

- at some point, when the bootstrapping phase will be over, Red/System will be rewritten entirely in Red, giving an opportunity to fix and improve the design (also helped by several months of feedback from Red/System usage).

**Implementation Progress**

Several items from the [todo-list](https://github.com/red/Red/wiki) have been implemented in the last week, the most notable ones being:

- [Logic!](http://static.red-lang.org/red-system-specs.html#section-4.3) datatype support
- [NOT](http://static.red-lang.org/red-system-specs.html#section-13.2) function addition
- [EXIT and RETURN](http://static.red-lang.org/red-system-specs.html#section-6.6) support (for early exit from functions)

Among other changes:

- ELF emitter has been extended a bit to support sections table (thanks to Andreas).

<!--THE END-->

- An experimental Mach-O (OS X) support is under work by Rebolek.

<!--THE END-->

- Several unit test files have been added to the repository recently, using a temporary minimalistic approach, that will be soon superseded by a real dedicated framework.

<!--THE END-->

- We are close to have a nice, small and lean unit test framework (Quick Test), created by Peter W A Wood for Red/System, covering all our needs (internal and external testing).

An interesting side note on how implementation can influence back the design:

During the implementation of Quick Test framework, Peter, while writing an integer to string conversion function, came up with a code pattern that is common in REBOL, but wasn't planned for Red/System: declaring private functions inside a function to hide them from global context. The pattern looked like this:

```
    prin-int: func [...][
        ...
        prin-digit: func [...][...]
        ...
        prin-digit ...
        ...
    ]
```

I was surprised when I tested the code he sent me, as I never did anything in the implementation to support such case explicitly. It was working because of a side-effect caused by the way functions are compiled in Red/System: the functions bodies are all gathered and compiled at the end of the global context code, regardless of where they are defined. The side-effect making the inner "prin-digit" function private is caused by a global function variable being declared inside a local scope, but without being part of the function [specification block](http://static.red-lang.org/red-system-specs.html#section-6). So, once the outer function compiled, the "prin-digit" symbol is lost, making the function unreachable from global context and forever hidden.

I was thinking about adding a way for users to create private contexts much later in the future (relying on Red/System source header), but we have the opportunity to have an equivalent feature, right now and without adding anything to the code! So, I am giving it some time to see if the side-effect can be safely made permanent to keep that feature, and in the meantime, added it to the [Possible Evolutions](http://static.red-lang.org/red-system-specs.html#section-14) part of the specifications.

In the next days, I will work on:

- finishing implementing the features from the todo-list
- merging the unit tests framework once ready
- adding new unit tests

In my next blog article, I will give an overview of Red/System compiler internals as requested by some followers.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [12:01 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4909079168928103211&from=pencil "Edit Post")

Labels: [context](https://www.red-lang.org/search/label/context), [specs](https://www.red-lang.org/search/label/specs), [tests](https://www.red-lang.org/search/label/tests), [update](https://www.red-lang.org/search/label/update)

[]()

#### 9 comments:

1. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[April 17, 2011 at 10:51 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1303073461713#c4059250742815072756)
   
   Great Work Doc!. Keep the updates coming. Nice to get to see how RED/System is evolving.
   
   Paul
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4059250742815072756)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
   
   [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 17, 2011 at 11:21 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1303075286015#c6291593238927125763)
   
   Thank you for your kind support Paul.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6291593238927125763)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[April 26, 2011 at 5:33 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1303832028117#c7820296749917925949)
   
   Test anonymous comment for wet\_wet\_wet (see thread on RebelBB forum).
   
   RedChronicle
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7820296749917925949)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[April 26, 2011 at 5:35 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1303832107589#c1142345590070556143)
   
   Try to preview comment.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1142345590070556143)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//resources.blogblog.com/img/blank.gif)
   
   paullys[April 29, 2011 at 11:37 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1304113029728#c4157073574190758234)
   
   what about osx version?
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4157073574190758234)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
   
   [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 30, 2011 at 6:53 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1304182410602#c5459399383543498381)
   
   The OSX port is under work by Rebolek, last time I have heard of him, he had some issues with the Mach-O file format. I didn't had the time to give a deep look at it yet. I hope to be able to do that in the next days.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5459399383543498381)
   
   [Replies]()
   
   1. [Reply]()
7. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[May 7, 2011 at 9:18 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1304795888818#c8173545503890466380)
   
   \[retrying one more time to post]  
   Doc,  
   thanks for all the effort you are putting in, I sincerely hope that it pays off big time in the near future.
   
   could you publish your roadmap and also the related milestones, so that we can follow you better.
   
   cheers  
   wet\_wet\_wet
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8173545503890466380)
   
   [Replies]()
   
   1. [Reply]()
8. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
   
   [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[May 8, 2011 at 12:16 AM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1304806583426#c3615887926850013981)
   
   Hi wet\_wet\_wet,
   
   You can find a brief roadmap and milestones only slide 17 from the presentation here: http://www.red-lang.org/2011/02/journey-begins.html
   
   I will try to copy it somewhere else to make it easier to find.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3615887926850013981)
   
   [Replies]()
   
   1. [Reply]()
9. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[May 8, 2011 at 7:37 AM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html?showComment=1304833029407#c1449973186550074955)
   
   Test anonymous comment for RebKodeur (see thread on RebelBB forum).
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1449973186550074955)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=4909079168928103211&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2011/05/redsystem-compiler-overview.html "Newer Post") [Older Post](https://www.red-lang.org/2011/03/i-have-published-yesterday-first-draft.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/4909079168928103211/comments/default)

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

- [▼](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
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
  
  - [▼](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
    
    - [Update on Red/System progress](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)

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

## September 27, 2013

[]()

### 0.4.0: Red goes binary!

What's that?!

As we are getting closer to the end of the alpha period, we are now moving to a more convenient way to use and distribute the Red toolchain. So far, you needed to download a Rebol interpreter and the sources from Github separately, and run it using, a bit verbose, command-lines. This is fine for developping Red  with contributors that are interested in the inner workings of the toolchain, but for the end users, the goal has always been to provide a simpler and much more convenient way, like Rebol teached us in the past.

So, from now, you can get Red as a single binary (&lt; 1 MB) from the new [Download](http://www.red-lang.org/p/download.html) page. Yes, all of Red toolchain and runtime is packed in that small binary, even the REPL is built-in!

The Red repo [landing page](https://github.com/red/red) has been reworked to show Red usage in binary form, all previous command-line options are present, a new one (**-c**) has been introduced. Here is a short overview of the main options:

Launch the REPL:

```
    $ red 
```

Run a Red script directly (interpreted):

```
    $ red <script>
```

Compile a script as executable with default name in working path:

```
    $ red -c <script>
```

Compile a script as shared library with default name in working path:

```
    $ red -dlib <script>
```

Compile a script as executable with alternative name:

```
    $ red -o <new> <script>
```

Compile a script as executable with default name in other folder:

```
    $ red -o <path/> <script>
```

Compile a script as executable with new name in other folder:

```
    $ red  -o <path/new> <script>
```

Cross-compile to another platform:

```
    $ red -t Windows <script>
```

Display a description of all possible options:

```
    $ red -h
```

Notice that **-c** option is implied when **-o** or **-t** are used. It is designed to keep command-lines as simple and short as possible.

Moreover, for standalone Red/System programs, the Red binary will be able to compile them directly, no special option needed, they will be recognized automatically.

Thanks very much to Tamás Herman for helping with setting up the build farm and providing the Mac OSX machine, and thanks to the [HackJam](http://hkhackerspace.pbworks.com/w/page/28645825/HackJam) hackerspace group from Hong-Kong for the hosting!

Other changes

- In addition to that new binary form, [17 issues](https://github.com/red/red/issues?milestone=11&page=1&state=closed) have been fixed since the 0.3.3 release about a month ago (not counting regression tickets).
- The work on objects support is half-done, objects are working fine with advanced semantics on the interpreter (see [object branch](https://github.com/red/red/tree/objects)), now the focus will be to support them at the Red compiler level.

What's next?

As we are moving closer to the beta state, version numbers will increase faster, e.g., once objects will be done, the release will be the 0.5.0, while 0.6.0 will bring full I/O support. Between these major versions, smaller versions should be still possible, this means that the release cycle should accelerate with at least one release each month from now on. So, what you should expect in the next ones?

**0.4.x**

- Simple I/O support: (just read, write and exists? on files)
- PARSE support
- Pre-compiled runtime (much faster compilation times)

**0.5.0**

- Full object support

**0.5.x**

- VID-like cross-platform dialect binding to native widgets.
- Mezzanine functions additions
- Redbin (accurate Red values serialization in binary format)
- Full errors management
- Red-level exceptions handling

Enjoy!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [12:51 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4625042639635131404&from=pencil "Edit Post")

Labels: [binary form](https://www.red-lang.org/search/label/binary%20form), [compilation](https://www.red-lang.org/search/label/compilation), [encap](https://www.red-lang.org/search/label/encap), [release](https://www.red-lang.org/search/label/release), [REPL](https://www.red-lang.org/search/label/REPL)

[]()

#### 14 comments:

01. ![](//resources.blogblog.com/img/blank.gif)
    
    [iArnold](http://arnoldvanhofwegen.com)[September 27, 2013 at 1:03 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380279812843#c7451888798900962039)
    
    Congratulations with this next big step!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7451888798900962039)
    
    [Replies]()
    
    1. [Reply]()
02. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVkVFuDf1xwxDEym6ZtQVv7pbeN6IQ5mq_vtLfYyVij0aldy3RR0vvuXPNFkx5ZxnODYUmaTfag-6aXKhJhJ5_MFY8qJ1_XEaJNLj0QG98b_cHiybXc2L7CcA3kcQeFH8/s45-c/PIC_0005.jpg)
    
    [Semseddin Moldibi](https://www.blogger.com/profile/09088672468817290872)[September 27, 2013 at 2:35 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380285301733#c101498914136226714)
    
    Nice!!  
    It will be a huge progress after 0.4!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/101498914136226714)
    
    [Replies]()
    
    1. [Reply]()
03. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj863obj15EnfdfqLSTDlYU0Hw0Hfq5XCRXYEbUCkMVJf_-yQcHnDGyLEsb-f7m0OZ7WLilizv5fqIytc-OMZY3W1IuydBqGI2uO3r6KQSn-8rYsiwAdQsb3ESiBAEXbEg/s45-c/*)
    
    [蔡學鏞 / Jerry Tsai](https://www.blogger.com/profile/12396118024567925590)[September 27, 2013 at 3:12 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380287561415#c1712362665308705719)
    
    gc and concurrency in 0.7 ???
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1712362665308705719)
    
    [Replies]()
    
    1. [Reply]()
04. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[September 27, 2013 at 6:17 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380298679412#c8361559768677407910)
    
    Some pieces of both GC and concurrency support should be available before 0.7.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8361559768677407910)
    
    [Replies]()
    
    1. [Reply]()
05. ![](//resources.blogblog.com/img/blank.gif)
    
    [Bo](http://respectech.com)[September 27, 2013 at 7:10 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380301803599#c2802299291013406974)
    
    Although I've only personally worked with Red/System so far, I'm excited about the advancements!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2802299291013406974)
    
    [Replies]()
    
    1. [Reply]()
06. ![](//resources.blogblog.com/img/blank.gif)
    
    Gregg Irwin[September 27, 2013 at 7:40 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380303650255#c7710180355917578081)
    
    Fantastic news. Congratulations Nenad.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7710180355917578081)
    
    [Replies]()
    
    1. [Reply]()
07. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/01852907854536537519)[September 27, 2013 at 10:42 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380314545150#c1785080885516817716)
    
    Keep up the good work!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1785080885516817716)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[September 27, 2013 at 11:25 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380317159323#c1991124047476189316)
    
    Gregg: thank you very much!
    
    Hi Jaime, long time no see! I'm glad that you are following the Red project. :-)
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1991124047476189316)
    
    [Replies]()
    
    1. [Reply]()
09. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj863obj15EnfdfqLSTDlYU0Hw0Hfq5XCRXYEbUCkMVJf_-yQcHnDGyLEsb-f7m0OZ7WLilizv5fqIytc-OMZY3W1IuydBqGI2uO3r6KQSn-8rYsiwAdQsb3ESiBAEXbEg/s45-c/*)
    
    [蔡學鏞 / Jerry Tsai](https://www.blogger.com/profile/12396118024567925590)[September 28, 2013 at 6:56 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380387392175#c2527318205001777711)
    
    Will you build Red-VID using Meta-DSL Framework? You mentioned Meta-DSL Framework in Recode Conference 2013.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2527318205001777711)
    
    [Replies]()
    
    1. [Reply]()
10. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[September 28, 2013 at 8:26 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1380392808711#c1077657203454883164)
    
    I would like to, but building the meta-DSL framework would delay the rest too much. I'll try to add a basic version of such framework for the 1.0 version, if time permits.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1077657203454883164)
    
    [Replies]()
    
    1. [Reply]()
11. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Jeannot Chapdelaine](https://www.blogger.com/profile/12761310805429900677)[November 22, 2013 at 11:39 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1385159969259#c4680960398162641828)
    
    In the next release of RED binary, have you planned to add some command like : help, etc... ?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4680960398162641828)
    
    [Replies]()
    
    1. [Reply]()
12. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/10035289906140092966)[November 23, 2013 at 10:08 AM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1385197705868#c8347435195768228690)
    
    Will there be a run-time penalty for the meta-DSL capabilities? I have talked about REBOL in the past and learned that parse is not something that expands at read time(like LISP macros). You mentioned it will be higher level than parse so I was just wondering what ti would be like.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8347435195768228690)
    
    [Replies]()
    
    1. [Reply]()
13. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[November 25, 2013 at 11:58 PM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1385420316769#c1824219343665865345)
    
    @Jeannot: we have a prototype HELP command, but it's not ready for primetime yet and next release should happen tomorrow, so probably in one of the later releases. I'm getting in touch with the contributor working on those parts to see if it could be ready for tomorrow.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1824219343665865345)
    
    [Replies]()
    
    1. [Reply]()
14. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[November 26, 2013 at 12:09 AM](https://www.red-lang.org/2013/09/040-red-goes-binary.html?showComment=1385420965028#c8624482527405452543)
    
    @Jacob: DSLs in Red and Rebol do not have to run on PARSE. When you implement a DSL, you can choose to implement it as an interpreter (in which case you have PARSE running underneath), or as a compiler (PARSE just runs as a front-end then and generates Rebol or Red code that runs directly). The choice is in the hands of the programmer, but in both cases, currently, you have a significant work to do and not everyone is comfortable writing an interpreter or a compiler, even for a trivial DSL.
    
    The meta-DSL capabilities I have mentioned in my Red slides is a layer above PARSE dialect that aims at simplifying that part for programmers. It's not designed in details yet, but you can picture some higher-level commands for linking easily the grammar rules for parsing the DSL with the execution blocks (interpreted or compiled).
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8624482527405452543)
    
    [Replies]()
    
    1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=4625042639635131404&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2013/11/041-introducing-parse.html "Newer Post") [Older Post](https://www.red-lang.org/2013/08/033-released-shared-libraries-and.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/4625042639635131404/comments/default)

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

- [▼](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [September](https://www.red-lang.org/2013/09/) (1)
    
    - [0.4.0: Red goes binary!](https://www.red-lang.org/2013/09/040-red-goes-binary.html)
  
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

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

## August 3, 2014

[]()

### 0.4.3: Floating point support

After a long time having only partial floating point support in Red/System, it comes now to Red with a broader support, thanks to the terrific work from Qtxie and Oldes, who managed to push Red further while I was busy moving from Europe to China (though, this might be the topic for another blog entry, as requested by many of you).

The new **float!** datatype implements [IEEE-754 64-bit floating point](http://en.wikipedia.org/wiki/Double-precision_floating-point_format) format. It is available with most of the usual math functions support:

- infix operators: +, -, \*, /, \*\*.
- prefix base functions: **add, substract, multiply, divide, power.**
- trigonometric functions:  **cosine, sine, tangent, arcsine, arccosine, arctangent.**
- other math functions: **log-2, log-10, log-e, exp, square-root, round**

Note that these trigonometric functions are taking arguments in **degrees**, a **/radians** refinement is provided for input values in **radians**. However, this can result in extra verbosity for some long math expressions where using only radians, like:

> `((sine/radians b) * (cosine/radians c)) + ((cosine/radians b) * (sine/radians c))`

Some radians-oriented shortcuts to these functions are also provided for convenience: **cos, sin, tan, arcsin, arccos, arctan**. So the above expression becomes:

> `((sin b) * (cos c)) + ((cos b) * (sin c))`

Here are some code examples from Red console:

> ```
> red>> 1.23456
== 1.23456
red>> 1e10
== 10000000000.0
red>> 1.23 * 2
== 2.46
red>> 1.23 * 2.0
== 2.46
red>> to integer! 1.23 * 2.0
== 2
red>> cos pi
== -1.0
red>> sin pi
== 0.0
red>> cos pi / 2
== 0.0
red>> cos pi / 3
== 0.5
red>> cosine/radians pi / 3
== 0.5
red>> cosine 60
== 0.5
red>> .1 + .2 + .3
== 0.6
red>> .1 + .2 + .3 = .6
== true
red>> .1 + .2 + .3 - .6
== 1.110223024625157e-16
red>> float? load "0.1"
== true
red>> to float! 1
== 1.0
red>> 1 = to integer! to float! 1
== true
> ```

As you can see, Red tries to give you meaningful outputs even when the result is not exact, but this approach has its limits too. Qtxie has ported partially [dtoa()](http://www.netlib.org/fp/dtoa.c) functions to Red/System, however, the overhead of the additional code (20-40KB once compiled) is quite costly given how tiny is currently our runtime library (~350KB). So, for now, that implementation has been provided as an optional [library](https://github.com/red/red/tree/master/system/library/dtoa) for Red/System, and will be modularized for Red, once modules will be supported.

IEEE-754 special values

You might know that standard floating point format supports a few extra special values that are meant to make some calculation possible in edge cases. Those are also supported natively by Red, with the following literal formats:

> ```
> Not a Number (NaN)        :  1.#NaN
Positive Infinity (+INF)  : +1.#INF (or just 1.#INF)
Negative Infinity (-INF)  : -1.#INF
Positive Zero             : +0.0 (or just 0.0)
Negative Zero             : -0.0
> ```

These values are mostly intended for scientific calculations, you do not have to worry about them. They can be produced as results of some math operations on floats, but by default, an error will be thrown instead.

In case, you need to operate with maximum precision, and have all the special float values as results instead of errors, a couple of flags are available for that through the **system** special access. The syntax is:

> ```
> system/float-options [spec]

[spec]: block of flags (word! | set-word!) with values (logic! | word!)
> ```

Valid flags are:

- **pretty?**: enables pretty printing of float numbers when very close to an integer value (default: true)
- **full?**: enables math operations on float special values (default: false)

 Examples:

> ```
> red>> 4.000000000000001e32
== 4.0e32
red>> system/float-options [pretty?: no]
red>> 4.000000000000001e32
== 4.000000000000001e32
> ```

Armhf support

So far, Red supported only the [armel ABI](https://wiki.debian.org/ArmEabiPort) for ARM backends. Since this release, we fully support now [armhf ABI](https://wiki.debian.org/ArmHardFloatPort) too, through a specific compilation option that can be found in the new **RPi** [compilation target](https://github.com/red/red/blob/master/system/config.r#L116) (intended mainly for default OS on RaspberryPi). The main difference between these ABI is the way float values are passed as arguments to functions, armel requires passing them on stack, while armhf requires passing them through FPU registers.

Other changes

- **url!** datatype preliminary support: all actions are working, but no path access support yet.
- New actions: **reverse, random, swap, take, to**(\*), **trim**
- New natives: **same?, NaN?**
- New mezzanines: **float?, routine?**
- Red/System FPU direct access through [system/fpu/* options](http://static.red-lang.org/red-system-specs.html#section-12.9).
- Help command now displays full help on routines too.
- Many [bug fixes](https://github.com/red/red/issues?q=is%3Aissue%20is%3Aclosed%20milestone%3A0.4.3) and a few wishes granted.

(\*) **to** is currently limited to integer/float/string conversions only.

What's next?

After the digression in the floating point lands, we go back to our main roadmap, so in the next releases, expect (in no particular order):

- GUI support for Android / Windows platforms
- Improved toolchain for Android APK generation
- Object compilation support
- New console engine
- Error! datatype and exceptions handling
- Typeset! and other new datatypes
- Redbin format specification and implementation for the compiler
- Improved compiler performance

Thanks for your patience and support during these last months, we are now back to our cruise development speed, so expect faster changes until the end of the year.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:38 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7376446968834338620&from=pencil "Edit Post")

Labels: [ARM](https://www.red-lang.org/search/label/ARM), [armhf](https://www.red-lang.org/search/label/armhf), [floating point](https://www.red-lang.org/search/label/floating%20point), [FPU](https://www.red-lang.org/search/label/FPU), [math](https://www.red-lang.org/search/label/math), [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi)

[]()

#### 10 comments:

1. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[August 4, 2014 at 5:42 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1407166978501#c6095169747496875354)
   
   Félicitations ! Je vais tester ça de suite :)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6095169747496875354)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Unknown](https://www.blogger.com/profile/08890443823811866751)[August 5, 2014 at 12:53 AM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1407192839188#c689370501509326240)
   
   Great!!  
   GUI support!!! Does that mean a Rebol/View -like version is on its way? (newbee...)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/689370501509326240)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [-pekr-](https://www.blogger.com/profile/07020449092496153923)[August 5, 2014 at 8:21 AM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1407219690932#c2307745474206653246)
   
   Andrew: I think that what is actually planned is VID like dialect, but no View AGG library based engine. Red is going to use native platform widgets. It is better for conventional apps, whereas in areas like free drawing etc., where AGG excells, we might be a bit lacking ...
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2307745474206653246)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
   
   [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[August 5, 2014 at 3:20 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1407244821622#c4875938407766995214)
   
   Red is going to have by default a GUI that allows you to build apps with native widgets and do vector drawing using the hardware-accelerated API provided by the OS, instead of a dead and software-only library like AGG (not mentioning the GPL incompatible license of that library).
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4875938407766995214)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [Unknown](https://www.blogger.com/profile/08890443823811866751)[August 5, 2014 at 4:45 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1407249930759#c4659898531000955407)
      
      Alright, that's good news!!! Still learning in Rebol/View for now, but closely following Red to assure myself for the future :-)  
      Thanks!
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/4659898531000955407)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
5. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVkVFuDf1xwxDEym6ZtQVv7pbeN6IQ5mq_vtLfYyVij0aldy3RR0vvuXPNFkx5ZxnODYUmaTfag-6aXKhJhJ5_MFY8qJ1_XEaJNLj0QG98b_cHiybXc2L7CcA3kcQeFH8/s45-c/PIC_0005.jpg)
   
   [Semseddin Moldibi](https://www.blogger.com/profile/09088672468817290872)[August 7, 2014 at 6:25 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1407428756352#c7104056527112775117)
   
   Very nice work Doc!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7104056527112775117)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAwscySCJ8TzMkUKef4sa05w_LzGJ311_CLrGA_WW5X2rV6VRtV-B_j5zFC6BmAfB0u9aHlo7lZ_ZXDgS3FujIBFqN2EcH9Lm6x1nopl_4CVOeejXTPmVi9-DGx_mstq8/s45-c/*)
   
   [Brian Dickens](https://www.blogger.com/profile/01873914328480997979)[August 17, 2014 at 6:27 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1408292821582#c7674362338332204995)
   
   I like the shortcuts for the radian forms (radians are better anyway).
   
   But to be forward looking, perhaps you should include TAU and define PI as being TAU/2!
   
   http://blog.hostilefork.com/clocks-that-run-backwards/
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7674362338332204995)
   
   [Replies]()
   
   1. [Reply]()
7. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[August 22, 2014 at 4:53 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1408719209988#c4323483765549547830)
   
   Very cool. I wonder why arctangent instead of atan, and degrees of radians. I would think the first is much shorter and just as clear/unique while the second is closer to the language of math.
   
   Best Wishes
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4323483765549547830)
   
   [Replies]()
   
   1. ![](//resources.blogblog.com/img/blank.gif)
      
      Anonymous[August 22, 2014 at 5:05 PM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1408719908572#c1351814315538030737)
      
      Sorry, imprecise reading of the post! The first point still stands: 'a' might be preferable to 'arc' for the radian versions.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1351814315538030737)
      
      [Replies]()
      
      1. [Reply]()
      
      ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[August 23, 2014 at 7:03 AM](https://www.red-lang.org/2014/08/043-floating-point-support.html?showComment=1408770224405#c5800711732882458570)
      
      "arctangent instead of atan" That's a typo, should be "arctan", it is fixed now.
      
      Indeed, "a" prefix instead of "arc" would be more consistent (as we already provide a shortcut form) for the radians versions.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5800711732882458570)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=7376446968834338620&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2014/12/050-objects-support.html "Newer Post") [Older Post](https://www.red-lang.org/2014/04/042-unicode-console-and-freebsd-support.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/7376446968834338620/comments/default)

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

- [▼](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
    
    - [0.4.3: Floating point support](https://www.red-lang.org/2014/08/043-floating-point-support.html)
  
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

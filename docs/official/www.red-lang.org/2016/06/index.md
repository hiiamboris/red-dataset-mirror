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

## June 29, 2016

[]()

### [0.6.1: Reactive Programming](https://www.red-lang.org/2016/06/061-reactive-programming.html)

Despite being a minor release, 0.6.1 still weighs a heavy [588 commits](https://github.com/red/red/releases/tag/v0.6.0) with a big number of fixes and many additions, among which the new reactive framework is the most notable.

Last release [introduced](http://www.red-lang.org/2016/03/060-red-gui-system.html), for the first time in the Rebol world, a reactive programming framework, as a part of the GUI engine. While working on improving it, we realized that it could actually be easily generalized beyond GUIs, with just minor changes to its design and implementation.

What is reactive programming?

Let me make a short disclaimer first, this is not [yet-another-FRP](https://en.wikipedia.org/wiki/Functional_reactive_programming) framework relying on event streams. The reactive model we use is known as [object-oriented reactive programming](https://en.wikipedia.org/wiki/Reactive_programming#Object-oriented) (using a "push" model), which is both simple to understand and close to spreadsheet's model (i.e. Excel formulas). That model has often been praised for its simplicity and efficiency. You can now use it directly in Red.

So, in practice, what is it?  *It is a way to link one or more object fields to other fields or global words, by specifying relationships in a block of code (can be a single expression or a complex multi-step computation)*. Each time a source field value changes, the target value is immediatly updated, you don't have to call a function for that, it's pretty much define-and-forget. ;-) Here's a simple example in Red:

```
    red>> a: make reactor! [x: 1 y: 2 total: is [x + y]]
    == make object! [
        x: 1
        y: 2
        total: 3
    ]
    red>> a/x: 5
    == 5
    red>> a/total
    == 7
    red>> a/y: 10
    == 10
    red>> a/total
    == 15
```

In that example, the is infix function is used to create a reactive relation between the total field and the x and y ones using a simple formula. Once set, total is refreshed automatically and asynchronously each time the other fields are changed, regardless how, where or when they are changed! It's the same concept as spreadsheet cells and formulas, just applied to object fields.

This reactive programming style belongs to the [dataflow programming](https://en.wikipedia.org/wiki/Dataflow_programming) paradigm. It doesn't enable you to write code, that you wouldn't otherwise be able to write in an imperative style. Though, it helps reduce the size and complexity of your code, by abstracting away the "how" and helping you focusing more on the "what" (not dissimilar to [FP](https://en.wikipedia.org/wiki/Functional_programming)). The gains of such approach become significant when you chain together many relations, creating graphs of, more or less complex dependencies. [GUI programming](https://doc.red-lang.org/en/gui.html) is where it shines the most, as nodes are visible objects, and reactions produce visible effects.

Here is a comparative example with a reactive GUI vs the non-reactive version:

Let's make a simple native GUI app using [VID](https://doc.red-lang.org/en/vid.html), Red's graphic DSL (we call it *a dialect*). It will just provide 3 sliders, which control the R, G, B components of the box's background color.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjqpo23JOGHvMVbHZSGjb-pAh2C5o5VZR1KyzkHsj78RVsqtXT63ijHjYah0j4a48VpyU4oljUT3Fn9-DMKE8TMMvBInImqO18Fe_3xbXqe1flcOXjCUfAt6Gfl7vR1E3YMTleTieyoOHsw/s1600/react3.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjqpo23JOGHvMVbHZSGjb-pAh2C5o5VZR1KyzkHsj78RVsqtXT63ijHjYah0j4a48VpyU4oljUT3Fn9-DMKE8TMMvBInImqO18Fe_3xbXqe1flcOXjCUfAt6Gfl7vR1E3YMTleTieyoOHsw/s1600/react3.gif)

The reactive version:

```
    to-int: function [value [percent!]][to integer! 255 * value]
    
    view [
        below
        r: slider
        g: slider
        b: slider
        base react [
            face/color: as-color to-int r/data to-int g/data to-int b/data
        ]
    ]
```

The non-reactive version:

```
    to-int: function [value [percent!]][to integer! 255 * value]
    
    view [
        below
        slider on-change [box/color/1: to-int face/data]
        slider on-change [box/color/2: to-int face/data]
        slider on-change [box/color/3: to-int face/data]
        box: base black
    ]
```

What can we say about the non-reactive version?

1. Size is pretty much the same, though the non-reactive version has **more expressions** and code looks **denser**.
2. The updating code is **spread over** 3 event handlers.
3. The face word in each handler refers to the widget, so we can remove the slider names (**very minor gain** though).
4. The box face **needs a name** (\`box\`), so it can be referred to, from the event handlers.
5. The box face default color is grey, so it **needs a \`black\` keyword** to force it to the right default color (as the sliders are all at position 0 on start). The reactive version sets the right color on start, no need to care about it.

Even in this simple example, we can see that the **complexity**, and the **cognitive load** are **higher in the non-reactive version**. The more relationships can be modeled using reactions in a GUI app, the higher the gains from using the reactive approach.

Red reactive framework

Red's reactive framework is just ~250 LOC long, and written [purely in Red](https://github.com/red/red/blob/master/environment/reactivity.red) (no Red/System). It relies on object events (equivalent to *observables* in OO languages) and the ownership system (which will be properly documented once completed in one or two releases time). Rebol does not offer any past experience in such domain to guide us, so it should still be considered experimental, and we need to put it to the test in the wild, to study the pros/cons in real-world applications. We are quite excited to see what Red users will create with it.

Full documentation for the reactive framework is [available here](https://doc.red-lang.org/en/reactivity.html). It also explains the important difference between *static* and *dynamic* relations.

In a nutshell, the reactive API provides 4 functions (quite big API by our standards):

- **react** to create or remove reactions.
- **is** infix function for creating reactions which result will be assigned.
- **react?** to check if an object's field is a reactive source.
- **clear-reactions** to remove all existing reactions.

Moreover, **react** is directly supported as a [keyword](https://doc.red-lang.org/en/vid.html) from VID dialect. That's all you need! ;-)

Here is a simple demo linking together a couple dozen balls, following each other. Source code is [available here](https://gist.github.com/dockimbel/2d95c8c85e5bfed71bd1c15294ee77c5).

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhQ2d8RmBIPq0yNIYMiUQgSgIgWCKo87td9AwUOg6M5nt5AvuwZi3JVJFzCy_rV306ox5Qe7o3n0dDWXe0fTZnORHotl6C0phr1xwU1ubCjPi0oASPngEiANjUcuTu6YlqbfG0RwMl-7Cxm/s320/react4.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhQ2d8RmBIPq0yNIYMiUQgSgIgWCKo87td9AwUOg6M5nt5AvuwZi3JVJFzCy_rV306ox5Qe7o3n0dDWXe0fTZnORHotl6C0phr1xwU1ubCjPi0oASPngEiANjUcuTu6YlqbfG0RwMl-7Cxm/s1600/react4.gif)

Let's now have a look at other features brought by this release.

Time! datatype

A time! datatype is now included in Red, supporting already a broad range of features, like:

- Path accessors: **/hour, /minute, /second.**
- Math operators, including mixing with other scalar types.
- All comparison operators.
- Actions: **negate, remainder, random, pick.**

```
    red>> t: now/time
    == 12:41:52
    red>> t + 0:20:00
    == 13:01:52
    red>> t/second
    == 52.0
    red>> t/hour: t/hour - 5
    == 7
    red>> t
    == 7:41:52
```

GUI changes

Two main additions to our View engine have enabled the writing, or porting, of some nice graphic [demos](https://github.com/red/code) (thanks to Gregg Irwin for the awesome demos!). Here are a few examples:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjwtbk99UbK9TaL8FeUXz2KTdTluWD31a78gIqLFagBs5wY7Y7WVbAgrjiORJm1bx_0yYaG_FFo_M7eqVfIpfYLznDo6IzVRC-Rrf6QxCrOfYjDuRvMwd7zeb7gq-DItM8c1l-R-rGbczUN/s320/demo6.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjwtbk99UbK9TaL8FeUXz2KTdTluWD31a78gIqLFagBs5wY7Y7WVbAgrjiORJm1bx_0yYaG_FFo_M7eqVfIpfYLznDo6IzVRC-Rrf6QxCrOfYjDuRvMwd7zeb7gq-DItM8c1l-R-rGbczUN/s1600/demo6.gif)

Bubble demo

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgi1odE8LdOvozamfZJiBv1_IZTnwZNbdWwDkXb5MEVhNdmIRHE7cSvGGCvRXuqPsorXxXpmeaXfWrlCH9y9cU2NmAXWy0K4Okh81Awns5bj6e7yO3cdq4VNBBj3tBQCCo4NhkzMBkjQw2M/s400/demo8.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgi1odE8LdOvozamfZJiBv1_IZTnwZNbdWwDkXb5MEVhNdmIRHE7cSvGGCvRXuqPsorXxXpmeaXfWrlCH9y9cU2NmAXWy0K4Okh81Awns5bj6e7yO3cdq4VNBBj3tBQCCo4NhkzMBkjQw2M/s1600/demo8.gif)

Gradient Lab

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEga8XRRt6snAE7fDeZyrNsxfvKJ88pWzNh650FDIB6KikCgePnpdv7TJpT5zPXGkzg-GEb3UiynBlH3TDKXJdYYRE0rFb_0QL0CCP9-54GV1l2SNehs3SZORtSrrx3L7duaukL4MFs4zHqN/s320/demo5.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEga8XRRt6snAE7fDeZyrNsxfvKJ88pWzNh650FDIB6KikCgePnpdv7TJpT5zPXGkzg-GEb3UiynBlH3TDKXJdYYRE0rFb_0QL0CCP9-54GV1l2SNehs3SZORtSrrx3L7duaukL4MFs4zHqN/s1600/demo5.gif)

Particles demo

**View engine changes**

- New **time** event in View, triggered by timers.
- New **rate** facet in face! objects for setting timers.
- **move** action allows to move faces between panes in a non-destructive way.
- Adds support for **event/window** property.
- **data** syncing with **text** for field and text faces.
- Add **default** option for fields (e.g. options: \[default 0]).
- **at, skip, pick, poke, copy** on image! now accept pair! index argument.
- Added **/argb** refinement for image! datatype.
- Added **request-font** dialog.
- Improved **size-text** native.
- GUI console faces are now excluded from the View debug logs.

**Draw dialect changes**

- [**fill-pen**](https://doc.red-lang.org/en/draw.html#_fill_pen) has been extended to support color gradients.
- **pen** accepts \`off\` as argument now, to make the subsequent pen-related operations invisible.
- Allows **box** to accept edges in reverse order.
- Radius of **circle** now accepts a float! value.
- Added key-color support for to **image** command.

**VID dialect changes**

- Added **rate** keyword for setting timers.
- **do** command now support \`self\` to refer to container face (window or panel).
- Added **focus** option to faces for presetting focus.
- Added **select** option support to preselect an item in a list (using an integer index).
- Added **default** option support for field and text faces' default **data** facet value.
- Added support for get-words to pass an handler function as an actor.
- Adding **glass** and **transparent** color definitions.

The [red/code](https://github.com/red/code) repository has also been filled with more demos using the new features, like color gradients and timers.

Other changes

New actions: **change, move**

New natives: **remove-each, new-line, new-line?, set-env, get-env, list-env, context?, enbase, now/time, browse**

New functions: **repend, overlap?, offset?, any-list?, number?, react, is, react?, clear-reactions, dump-reactions, make-dir, request-font, time?**

**Parse improvements**

- Added **change** command.
- **remove** also accepts, now, a position argument.
- Support for parsing binary! series.
- Several [bugs](https://github.com/red/red/issues?utf8=%E2%9C%93&q=is%3Aissue%20milestone%3A0.6.1%20is%3Aclosed%20%20parse) fixed.

Syntax for **change** command:

- CHANGE rule value
- CHANGE ONLY rule value
- CHANGE rule (expression)
- CHANGE ONLY rule (expression)
- CHANGE pos value
- CHANGE ONLY pos value
- CHANGE pos (expression)
- CHANGE ONLY pos (expression)

Example using rule syntax:

```
    a: "12abc34"
    alpha: charset [#"a" - #"z"]
    parse a [some [to alpha change [some alpha] dot]]
    a = "12.34"
```

Example using pos syntax:

```
    a: "12abc34"
    alpha: charset [#"a" - #"z"]
    parse a [some [to alpha b: some alpha change b dot]]
    a = "12.34"
```

**Console improvements**

- Filenames completion using TAB key.
- Font and color settings from new menu bar.
- Ctrl-K will erase to end of line (CLI console).
- Ctrl-D will remove character or exit like Ctrl-C if empty line (CLI console).
- Optimized speed of pasted code in console.

**Other improvements**

- Allows bitsets to be used as search pattern for **find** on any-string! series.
- **/next** refinement support for **do** and **load**.
- **/seek** and **/part** refinements added to **read**.
- Added **any-list!** typeset.
- Added **/with** refinement to pad function.
- Improved **split** function (though not final version).
- Added LF &lt;=&gt; CRLF conversions support to UTF-16 codec.
- **input** can now read from stdin when run from  a child process.
- Added **/same** refinement into **find** and **select** actions.
- Added binary! support for data and HMAC key to **checksum**.
- Reduced emitted code for setting struct members to float literals on IA-32.
- Allows **owned** property to be used by **modify** on objects.
- Compiler now accepts creating global op! values from object's functions.

A big number of tickets have also been processed, [110 bug fixes](https://github.com/red/red/issues?q=is%3Aclosed%20milestone%3A0.6.1) have been provided since 0.6.0 release. We have about 10% of open tickets which is more than usual, though not surprising after the last huge release, but only [22](https://github.com/red/red/issues?q=is%3Aopen%20is%3Aissue%20label%3Atype.bug) are actual bugs. Thanks for all the contributors who reported the issues and helped fix them, Red owes you a lot!

What's next?

On the road to Android support, we need to be able to properly wrap a Red app in a shared library, which is the main focus for the [next release](https://trello.com/c/wJRJhxBz/150-0-6-2-libred). Moreover, being able to build the Red runtime library only once, will greatly reduce compilation time (the runtime library is currently rebuilt on each compilation). As the work on this new feature is already quite advanced, we expect next release to occur during July, even if we always favor quality over arbitrary deadlines. ;-)

In the meantime, enjoy the new release!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:33 PM](https://www.red-lang.org/2016/06/061-reactive-programming.html "permanent link") [13 comments:](https://www.red-lang.org/2016/06/061-reactive-programming.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1765795339927473072&from=pencil "Edit Post")

Labels: [console](https://www.red-lang.org/search/label/console), [demos](https://www.red-lang.org/search/label/demos), [GUI](https://www.red-lang.org/search/label/GUI), [parse](https://www.red-lang.org/search/label/parse), [reactive](https://www.red-lang.org/search/label/reactive), [time](https://www.red-lang.org/search/label/time)

[Newer Posts](https://www.red-lang.org/search?updated-max=2018-01-01T08%3A52%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2016-06-29T23%3A33%3A00%2B02%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

Subscribe to: [Posts (Atom)](https://www.red-lang.org/feeds/posts/default)

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
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
    
    - [0.6.1: Reactive Programming](https://www.red-lang.org/2016/06/061-reactive-programming.html)
  
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

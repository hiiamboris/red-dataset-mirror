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

## December 7, 2018

[]()

### [0.6.4 Simple GC and Pure Red GUI Console](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html)

It's been a long time coming.

While work on Red has progressed every day, work on the blockchain aspects of the project, and their associated logistics, came at a time when that workload temporarily prevented us from making new, formal/stable releases. There was a key feature that needed to be in place, and it wasn't a small one. Thanks for bearing with us!

Fixes and features kept rolling out on a regular basis, so most active community members were not affected by the lack of a fresh new "official" release. It did, however, become an issue for people new to Red, because as the stable download for 0.6.3 became more and more out of date, users would report bugs that had already been fixed! So now 0.6.4 should see us on the same page.

We'd like to promise we'll never go that long again between official releases, and that is our goal, but we hope you'll roll with the punches, as we do the same. The best way to keep up to date is to use the automated builds, so you're always current. Some people will want to stay with the stable version for various reasons, and that's fine too.

This new Red release contains 1'116 commits, closes [167 issues](https://github.com/red/red/issues?utf8=%E2%9C%93&q=is%3Aclosed%20milestone%3A0.6.4) tagged for this milestone, and adds a lot of  small features. Looking at the list of bugs fixed, and features added, is a great reminder of all Red has to offer.

## 1. Simple GC

The main feature for 0.6.4 is what we call the Simple GC (Garbage Collector). A more advanced GC is planned for the future, but this release will make it easier to create long running processes, without having to be aware of all your allocations, or manually reusing series to conserve memory. Things just got a whole lot easier!

There are 2 functions related to this, that you can use:

1\. You can use stats to see the amount of memory in use, and its /info refinement provides more details to aid deeper debugging if needed.

2\. The second function is called recycle, which triggers a manual garbage collection pass, rather than waiting for internal heuristics and timing events to do so. Recycle has 2 refinements: /off and /on. They allow you to disable the garbage collector, and re-enable it. This gives you control in scenarios where you want to manage things more directly yourself.

It's also important to note that the GC operates at the level of Red values, and *does not* affect Red/System code. Red/System is a C level language, where you are responsible for allocating and freeing memory, and where you may need precise manual control over those actions. (It's possible to add an optional GC for Red/System in the future, but it's not currently on our roadmap.)

## 2. Simple Isn't Always Easy

Our main goal is to fight software complexity, but nothing can eliminate it completely.

Our small size belies the number of details that have to be considered, interactions between the large number of datatypes, and how to make each most useful with the standard library of functions. And then there's the reactive GUI system, with its draw dialect, both very flexible and powerful, which leads to more combinations that need to be handled, and edge cases to uncover. We accept the effort needed, because we are our own toolchain. A great deal of work went into the new GUI console, with a lot more planned.

Apple's talk of eliminating all 32-bit support could impact us. We are currently 32-bit only, and need to decide the best path for adding 64-bit support, should we elect to do so. libRed is also kept up-to-date in this release as well, for integration from other tools and languages. Additional improvements were made in the ELF format emitter.

We still face being flagged by a few big AV products, and these false positives hurt our image. It's frustrating to be marked clean one day, then have their heuristics change and flag you the next. *Keep reporting the problem to them*, and check VirusTotal to see how they compare. It's just one more challenge, because we're small, and use our own toolchain, so they don't know what to do with us.

Not all changes are big, and a lot of work also goes into documentation and tests on a regular basis. The code is only part of the project. A lot of our time this past year has been spent on logistics related to business, and making the Red project sustainable long term.

### 2.1: Operating System Support

Providing the maximum number of features across platforms is not easy, and we will need to freeze support for older OSs, like Windows XP, so we can focus efforts on the systems used by more people today.

Keeping up with mainline changes on all the operating systems we support is a challenge itself. We've kept ARM soft float working, and FreeBSD support has remained largely intact. We got a report about it breaking recently, and a fix went out the next day. FreeBSD isn't critical for us, but that fast response shows how a smaller and simpler code base can help.

### 2.2: A REPL In Time

Having an instant-on REPL is enormously helpful to newcomers and experts alike, and we'll build on this new foundation to add more features.

One change we expect to make for 0.6.5 is to change the download binary, so REPL use is even easier. Right now, when you download Red, you get the toolchain. The first time you run it, it builds the REPL console on your system locally. That takes some time, and isn't a great first user experience. So as we move forward, we're considering making the REPL the download, and then when you go to compile, if Red sees you haven't installed the toolchain, it will download it at that time. We'll keep you updated as we try our alternatives.

## 3. Rich Text

There's a new style in fashion this season: rich-text. 

Full documentation is forthcoming, but you can see the source code for the RTD (Rich Text Dialect) in [%red/modules/view/RTD.red](https://github.com/red/red/blob/master/modules/view/RTD.red) (only ~150 lines), and reference information in the [wiki.](https://github.com/red/red/wiki/%5BDOC%5D-Rich-Text-support)

Eight attributes are currently supported. More can be added, but these gives you a great deal of control, and are by far the most commonly used: bold, italic, underline, strikethrough, text color, background color, font-name, and font-size. Border is planned but not yet implemented, as are some advanced options for the above attributes (e.g. wavy underline as is often used for spell checking markup). Attributes can be nested, of course.

@toomasv put together a small editor, which is about 400 lines of code, but since the rich-text style doesn't have built in keyboard handling yet, he had to roll his own, which is the majority of the code. 

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiJhe6Wv3xPOWCrF4a7XpCEfKP-HScEVPB8ZiuCgudBnAiijVtKgdjD49pmG5D5iJOJVKA_Cj-mZSyWO86vQGrh7KYU_jF2zMGLOuT2Wha6ed05g5dtoQBihHCf438WuRi4FaDf9BN50Ck/s400/RTD-demo-1.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiJhe6Wv3xPOWCrF4a7XpCEfKP-HScEVPB8ZiuCgudBnAiijVtKgdjD49pmG5D5iJOJVKA_Cj-mZSyWO86vQGrh7KYU_jF2zMGLOuT2Wha6ed05g5dtoQBihHCf438WuRi4FaDf9BN50Ck/s1600/RTD-demo-1.png)

Using the rich-text style directly in code is easy too. The data facet just needs to contain RTD commands and, internally rtd-layout is called to render those commands into the text and data facets of the face. You can also create a rich-text face, and later call rtd-layout/with to update commands and render them.

While Red prefers plain words for markup elements, RTD also supports HTML style tags, for convenience. (Note, RTD is *not* designed to be HTML compatible, and it's not a goal on our roadmap.) 

You can see different approaches to formatting, below: the first three examples all produce the same output, and show how attributes can be applied to blocks of commands, which is more idiomatic in Red. That is, when you have a formatting command followed by a block, everything in that block has the formatting command applied. It makes viewing the formatting structure much easier, and also eliminates attribute ordering issues. 

The last example below shows how a group of attributes can be expressed as a single path! value, applying all of them to the block that follows.

```
    view [
        rich-text data [
            <i> <b> "Hello" </b> <font> 24 red " Red " </font> blue "World!" </i>
        ]
        rich-text data [i b "Hello" /b font 24 red " Red " /font blue "World!" /i]
        rich-text data [i [b ["Hello"] red font 24 [" Red "] blue "World!"]]
        rich-text data [i/b/u/red ["Hello" font 32 " Red " /font blue "World!"]]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhSMJKcoVGm6uQ201TfZGJ0txqGWjk8b5C9-vIyAruL0zjpzpy2i8L6tPnPkXuHSZqP8xSVR9il160nER7-zWrg-LNY9Mfax3rQX8JdeiStwcsPA44hEbo7oBJRG8LyypGmAJqQVDuM2pc/s400/RTD-demo-2.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhSMJKcoVGm6uQ201TfZGJ0txqGWjk8b5C9-vIyAruL0zjpzpy2i8L6tPnPkXuHSZqP8xSVR9il160nER7-zWrg-LNY9Mfax3rQX8JdeiStwcsPA44hEbo7oBJRG8LyypGmAJqQVDuM2pc/s1600/RTD-demo-2.png)

This is only the most basic use. See @toomasv's [example gist](https://gist.github.com/toomasv/8fcd1bbd7de9451e7789dbdf5ae35881) for more uses, and consult the wiki doc to see how to query information like line height and caret position. Beyond that rich-text is already hardware optimized and supports multiple rendering areas in a single face, which makes it suitable for quite complex layouts of richly formatted text. You can also combine draw commands in a rich-text face, for even more power.

## 4. GUI Console: More Than Meets the Eye

While the GC took the spotlight in this release, the console also saw huge changes and improvements. The biggest change isn't visible to the naked eye: the new GUI console is now implemented in pure Red, using the rich-text face style. This sets the foundation for building more complete Red editors, tools, and IDEs. Basic features in place right now:

- History and Undo/Redo
- Copy/Paste support
- Hot-keys and shortcuts
- Syntax Coloring
- Auto-completion

### 4.1: Console Hot Keys

- Ctrl + Backspace  delete previous word
- Ctrl + Del        delete next word
- Ctrl + Up/Down    scroll up/down
- Ctrl + C          copy
- Ctrl + V          paste
- Shift + Insert    paste
- Ctrl + X          cut
- Ctrl + Z          undo
- Ctrl + Y          redo
- Ctrl + L          clear screen
- Ctrl + K          delete the whole line

### 4.2: Syntax Coloring

You can turn syntax highlighting on with the following command:

    gui-console-ctx/terminal/color?: yes

It is not dynamic, so you may find the colors don't work well with the colors you've selected in the Settings dialog for the console. There is no support for customizing themes yet. If you want to experiment with changing colors, you have to manually set values in gui-console-ctx/terminal/theme.

### 4.3: Auto-Completion

This feature can support completion for 3 types of values: words, files, and paths. 

For words, if you type a word and hit the Tab key, one of two things can happen. Either there's a single match for what you've typed so far, which will then be auto-completed for you, or all matches will be shown.

Try typing **p &lt;tab&gt;**. You'll get a list of all words in the system that start with the letter P.

Now, type **pa &lt;tab&gt;**. The help function works in a similar way, but with different output.

Filename completion works the same way. If you type a file value, starting with %, the letters you type are then prefix matched against the current directory in the file system. It works very much like a system shell's autocomplete feature, but built directly into the Red console. Snazzy!

Path completion is a little different:  
If you type a path, e.g., system/, and then hit the Tab key, the console will display the list of words available for that path value.  
If the value is an object, the words of that object will be displayed.  
If it's a function, the possible refinements will be listed.

For objects, it makes it easy to drill down into nested structures. For functions, it offers basic help, but doesn't do anything advanced yet. For example, if you use more than one refinement, auto-completion will still list every refinement available, rather than removing those you've already used from the list.

## 5. Other Highlights &amp; Changes in 0.6.4

Here are just a few more details:

### 5.1: View and VID

- DPI support added, which is great, but also raises new OS system scaling questions, currently being reviewed
- rich-text style added
- Password mode added to field style (not supported in VID yet); include 'password in face flags
- Make-face helper function added
- RTD (Rich Text Dialect) support (MacOS &amp; Windows)
- Ctrl+A hot-key works in area now
- Text selection support improved for area and field

### 5.2: Core Language

- Added /deep and /case refinements to replace
- Simple I/O now supports all HTTP verbs
- Added decompress native, with support for gzip, zlib and deflate formats
- Adler32 support added to checksum
- Maps now support binary! values as keys
- Latin-1 strings can now be decoded
- Trim now supports binary! values. By default, only null values are removed. If you use the /all refinement, whitespace chars are trimmed as if it were a string
- Basic query action added for files, which returns their timestamp
- Added offset-to-char function. Given a face and a coordinate, it returns the corresponding character position
- Added os-info func. It returns detailed operating system version information, which can be helpful when debugging and submitting tickets (used by about/debug)
- *Very* simple alert function added; more are available as community experiments
- Enbase/Debase now support base 58
- Sum and average functions added

## 6. Looking Ahead

- Full I/O is our next major milestone, and some other key features, like async I/O and a networking port model, will come with that.
- Android: We've changed up the roadmap a bit, so Android will come after Full I/O, because it will benefit from having it, and save rework if done the other way around. This is a very important -- dare we say, critical? -- milestone, and one we will put all our efforts behind in the coming months.
- Blockchain Aspects: The RED Wallet is expected to get some new features, and possibly a new look. We need a dedicated product manager for it, and another team member who can focus on it. The C3 project is going full steam, and we'll be organizing resources to keep that moving as we redirect key players to Red's core early next year.
- We have an experimental money! datatype, based on Douglas Crockford's [Dec64](http://www.dec64.com/) design. It will have a limited value range initially, due to our 32-bit foundation, but it's a first test, and can be used to see how it works in action. We believe we're the first language to implement it.
- JSON and CSV codecs. These are works in progress, and their design had led to discussion of how best to do certain things outside them -- for example, how to represent JSON null values in Red maps, which isn't yet possible.

We're enormously proud of how Red's growth and community support have accelerated. For a project like ours -- ambitious, idealistic, open-source -- to have garnered interest in the way we have, has been greatly rewarding. We look forward to a 2019 rich with REDucing software complexity, yet celebrating the increasing power and impact of the language and the movement.

Posted by [lucindamichele](https://www.blogger.com/profile/07911363385237731838 "author profile") at [7:12 PM](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html "permanent link") [6 comments:](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6949068411288461788&from=pencil "Edit Post")

[Newer Posts](https://www.red-lang.org/search?updated-max=2019-10-30T20%3A18%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2018-12-07T19%3A12%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2018/12/) (1)
    
    - [0.6.4 Simple GC and Pure Red GUI Console](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html)
  
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

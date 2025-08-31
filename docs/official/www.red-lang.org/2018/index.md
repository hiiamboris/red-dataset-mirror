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

## November 22, 2018

[]()

### [RedCon 1 and Ethereum DevCon 4 World Report](https://www.red-lang.org/2018/11/redcon-1-and-ethereum-devcon-4-world.html)

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjL2kAdLwJGsqMMI5Je0n5ESZNWz5nF7uocv-YuCssv8LWQRDkdHpXPCQAwcau2hKd_DXnsD4E7FvbBbvE4a6yYurRlIcpp6FwqpOVSjlSLmKW3voNvzHqb96kSPKEqSFgGK7t7r7IfOTc/s640/devcon-entrance.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjL2kAdLwJGsqMMI5Je0n5ESZNWz5nF7uocv-YuCssv8LWQRDkdHpXPCQAwcau2hKd_DXnsD4E7FvbBbvE4a6yYurRlIcpp6FwqpOVSjlSLmKW3voNvzHqb96kSPKEqSFgGK7t7r7IfOTc/s1600/devcon-entrance.jpg)

Happy November, Red community! We’ve been very busy. Beginning in September, Nenad and Qingtian joined Gregg in Idaho for 6 weeks, in preparation for Ethereum DevCon 4, and to set some things in motion for a  possible U.S. Red presence. Challenges continued to appear at every turn, which kept us on our toes. By the end of October, we were ready to hit Prague for the DevCon, and to have our first Mini RedCon with some of the team. Here’s what happened.

### Ethereum DevCon 4

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirjULozO4AZIKUTc7V3Rn7566VG6tacpOJoDaxpTD0g_7fcOYpX91-FZk_rxrWTg4Zb7w5Zk-ukTV6XUIdeBx4oY40XPYljY1tRK6ryvsla4rTNAaRWt2SCh9i1XvBh1ZdXA4_D-q69lE/s640/NRGI-devcon.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirjULozO4AZIKUTc7V3Rn7566VG6tacpOJoDaxpTD0g_7fcOYpX91-FZk_rxrWTg4Zb7w5Zk-ukTV6XUIdeBx4oY40XPYljY1tRK6ryvsla4rTNAaRWt2SCh9i1XvBh1ZdXA4_D-q69lE/s1600/NRGI-devcon.jpg)

It was a lot of work, leading up to Ethereum DevCon4, and we tried every avenue to sponsor and support the Ethereum community, including submission of possible presentations in every category. Unfortunately, we were not selected to present, as there were only about 50 presentation slots, and over 1000 submissions. Still, we did the best we could, and attended as many sessions as possible that we thought were valuable.

Some of those sessions were very good, some less so. The quality varied widely, as did the type of attendee. It was surprising to find that only a tiny percentage were actual developers, which is our target audience, considering this was advertised as a "Dev" Con, and 70% of the tickets were reserved for "BUIDLers". [1](https://www.red-lang.org/2018/11/redcon-1-and-ethereum-devcon-4-world.html#footnote-1)

We noticed a systemic issue at DevCon: There was a lot of hype surrounding many projects, but when it came to actual follow-through, it was hard to find programmers at the DevCon. The hardcore deep-devs on the EVM and language development side were the biggest "clusters" we found. Those writing smart contracts and building actual working project infrastructure were few and far between.[2](https://www.red-lang.org/2018/11/redcon-1-and-ethereum-devcon-4-world.html#footnote-2) Some commentary on that in our footnotes.

Nevertheless, we did find some key builders (real ones!) and creators who had valuable insights:

- One of the people who takes this seriously, and seems to be carefully walking the line of professionalism and community culture, is Sid Coelho-Prabhu of CoinBase. His talk was professional, on-point, clearly stated some of the same problems we see, but also played well to the crypto- and Ethereum-culture crowd. He has a positive approach and is realistic, which was great to see. (**Best in Show)**
- The DevEx Breakout EVM Panel consisted of a good cross section of EVM developers, some core, some higher-up, formalists, and others. It gave us a lot of insight into the history of the EVM, challenges it faces, and their thoughts on future ideas.
- Another highlight was our meeting with the Solidity and Vyper teams. While we have different goals, let it be known that we have the highest respect for their skills, and the kind of people they are. As outsiders, potentially competitors, they welcomed us, shared insights, and both challenged and supported ideas we shared about our goals and design elements of Red/C3. Our deepest thanks to Alex, Christian, Jacque, and Bryant for seeing us as walking the same road, sharing the goal of making it possible for people to use and experiment with Ethereum on the Distributed Executable Code (Smart Contract) side, which is separate from the EVM team(s).

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhU2ekvPiw2J2QSmVny8ENv_HjEMf1A22SfwvfTcbES9okyHHHQQiQnY6gMHKAHUt9t41M2HX384sP0Ro-hRVqQ1Vqk5Txrg59Cjruwth2iNz4awzyZQYHs1-I-nzgV9i0UiKIh1jJ5fqs/s640/lang+team+meetup.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhU2ekvPiw2J2QSmVny8ENv_HjEMf1A22SfwvfTcbES9okyHHHQQiQnY6gMHKAHUt9t41M2HX384sP0Ro-hRVqQ1Vqk5Txrg59Cjruwth2iNz4awzyZQYHs1-I-nzgV9i0UiKIh1jJ5fqs/s1600/lang+team+meetup.jpg)

Secret Language Design Meeting

On a related note to DevCon, Prague is a beautiful city, and the Ethereum Foundation chose well in selecting it as the host. The Congress Center staff were efficient and professional, and the overall logistics were very well managed. A thank you to the organizers for all their hard work.

### RedCon 1

The day after DevCon ended, we held our first RedCon in Prague, bringing together some of our core team, contractors, and new people who were interested in Red and Red/C3. 

We planned an informal event, and that's how it went. We rolled with questions, shifted the agenda as needed, and ate most of the snacks. @rebolek deserves a big round of applause (and leftover beer) for arranging the facility and much more. As is often the case, small groups clustered during breaks to talk about specific topics and get to know each other. 

We were able to answer questions some of the newcomers had, both verbally and in code. It's great to have someone ask "How hard would it be..." and be able to sit down and live code a demo. This is the power of Red.

As far as planned presentations, Nenad gave an overview of Red, and showed some C3 examples, which led to Q&amp;A on more general blockchain aspects as well. It was a nice mix of people on the Red and blockchain sides, helping each other learn a bit about the other side. @rebolek demoed his \`values\` structured editing prototype, which was very cool. If you thought you needed fancy GUI editors to offer help and extra information to users, you haven't seen what can be done with unicode chars and a little (or a lot of) creativity. Gregg gave a very quick rundown of possible approaches we can take to offer a cron type system for C3. If you aren't into the blockchain side of things, you may not know that there is no internal cron, no way to run something on a schedule. All triggers must come from outside the blockchain, as there isn't even the concept of a clock or current time in the EVM. Those things are handled via "oracles", which is just a fancy term for a reference to some higher authority you trust, outside the blockchain.

The slide deck for Red/C3 presentation can be found [here](https://static.red-lang.org/C3/Red-C3.pdf).

Thanks to @endo64 for bringing a camera. As you know, getting a good video setup is a job unto itself, and we couldn't arrange for a separate person to do that this time, but with simple raw footage and some magic applied by @x8x, you can see much of what happened below. Some of the video is hard to read, but many of the graphics are available elsewhere, and we'll make slides available soon.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEicHOnYFLFUfqhn_ybu8fXC89iaK5MFy_nZXIImyva_2pBRQ25nPLHhcR0mGeo3d8jvrVR0DJM-40L6WwSLPOelLu0J_G0Wbi3plkwFEqgwDc2BR49Ny57QIIh3S3sx6EVsXnp9_6uZSmQ/s640/red-con-people.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEicHOnYFLFUfqhn_ybu8fXC89iaK5MFy_nZXIImyva_2pBRQ25nPLHhcR0mGeo3d8jvrVR0DJM-40L6WwSLPOelLu0J_G0Wbi3plkwFEqgwDc2BR49Ny57QIIh3S3sx6EVsXnp9_6uZSmQ/s1600/red-con-people.jpg)

A few RedCon attendees

### Red Foundation Meeting

Another highlight from the trip was a meeting with François Jouen and Azouz Guizani from the Red Foundation. It was a 5 1/2 hour meeting, though we were in Paris, so much of it occurred over a meal in a small cafe. That may sound appealing, but when you forget your notebook, the napkins fill up quickly.

François has been a strong advocate of REBOL and Red for many years. His teaching position and deep desire to help his PhD students led to development of a curriculum where Red is a requirement, not an option. Students have 8 3-hour sessions where they learn the fundamentals of the language, and how to apply it to their domain. These are not Computer Science PhD candidates, but art historians, literature majors, and cognitive scientists. They aren't taught Red in order to make them programmers, but to enable them to use the computer as another tool in their arsenal. 

The passion for his work, and the joy he clearly gets from using Red, are inspiring and infectious. François' combination of skills and talents aren't something we can clone, but seeing it first-hand led to discussion of what it might take to reproduce his approach in other places. You need a champion, and a mix of technical, leadership, and teaching skills; plus deep domain knowledge. François has ported almost half of the OpenCV computer vision library (~400 functions) to Red, as RedCV.

His demos cover a lot of ground, run fast, and demonstrate the value software can bring, if we make it more accessible to people. Some of his students have tried to program before, because they know that's the future in almost any science, but it's too painful and too far from what normal people can do. But when his short course shows them how to create a GUI with VID, they feel empowered. They can build simple tools and see results. With RedCV, an art historian can load an image of a painting, then create their own pipeline of filters and convolutions, to bring out hidden details that are invisible to the naked eye.

Flush with the excitement of seeing Red in use, in the real world, we walked to a small cafe nearby and spent the next 4 hours discussing goals for the Foundation, explaining more about the blockchain aspect and RED tokenomic possibilities to François and Azouz. We also talked about their specific uses cases and needs that might be solved with Red. There are so many things to do, and we sometimes feel overwhelmed, but when you sit down with other people who believe in what you're doing, and support you, it makes all the difference in the world. The next night Azouz joined us again, along with some old colleagues of Nenad's, and we talked more about the technical side.

### Conclusion

The days were long, and the nights short. The exhilaration of collaboration gave way to exhaustion as we headed back to our hotels, finding it hard to stop talking and planning. It all came and went quickly, but we learned a lot.

While we hoped for a different experience at DevCon, we have to engage the community if we want to bring value to it. The high points of our meetings with other passionate teams and individuals made it worthwhile. Seeing old friends, and meeting new ones, a room full of Team Red, was great. The little time we had to see sights was invariably filled with tech chat. That all ended too soon and we jetted to our next locations. More plans are in the works, and we'll pick up speed again once the lag wears off.

Until then, Happy Reducing!

* * *

[1](https://www.blogger.com/null) A comment on the "BUIDLer" term. The Ethereum community wants to grow, to gain adoption, to see their tool used in the real world. We have many thoughts on that, but if that's what they really want, the first thing many projects need is to take themselves seriously. That may sound harsh, and there are serious people doing real work, to be sure. But when billions of dollars are in the mix, and at risk (look how much has been lost this year alone, through hacks and mistakes), it is irresponsible not to take that seriously, and to use inside jokes and memes publicly and prominently. Adding a hashtag and memetic baggage to a powerfully simple concept such as “build” doesn’t mean doing anything actionable or making something real, other than smoke and mirrors. It also puts projects like ours in a difficult position. We are serious, and want to be viewed that way, but our choice to not bury our work in jargon sets us apart. They value inclusivity, so we hope they'll consider our approach and views as another type of diversity: one that evaluates the project on merit, not its use of trendy jargon or rave afterparties.

[2](https://www.blogger.com/null) We see a widening gap in the field between those building the technology, and those on the speculation side, who don't know or care much about the technology. While this problem has become endemic to the blockchain, crypto, and distributed-ledger-technology world, it becomes ever more evident at each subsequent major industry event. The majority of attendees of late aren't business people, in the sense that we think of business, but they can throw buzzwords around like you wouldn't believe. We met CTOs who didn't seem to know much tech, and got vague descriptions of what people did. "We onboard people to the blockchain," or "our project decentralizes processes and devaluates \[sic] intermediaries." When your own most basic introductory explanation of your business function itself needs a translation to plainspeak, you don’t actually have a job description; without clearly defined roles and results, your whole project is nebulous. If the Ethereum Foundation, project founders, and the community really want to see Ethereum succeed, they themselves need to “devalue intermediaries” spouting what sound like a hollow string of buzzwords with no connection to the real world.

Posted by Gregg Irwin at [8:23 PM](https://www.red-lang.org/2018/11/redcon-1-and-ethereum-devcon-4-world.html "permanent link") [2 comments:](https://www.red-lang.org/2018/11/redcon-1-and-ethereum-devcon-4-world.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3373200562549575590&from=pencil "Edit Post")

## October 23, 2018

[]()

### [Mini RedCon'18](https://www.red-lang.org/2018/10/mini-redcon18.html)

Hello REDucers! Our mission to fight software complexity is going to be showcased alongside Ethereum's Devcon IV in Prague. If you're in the neighborhood, stop by Redcon!

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi79IeJuOMwoA7EABxm8XMBO3hKhVJBEsT4bgeTY3mV2pAt_q_ZXAPttwXwHmUnQbAdZ78shMpbh73mBTXEjZv_ycncwbqLmlRNDXSJAuUdCfRvngw5ZDG889CpkMziA4U__XoskcfWxnE/s320/redconflyer1.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi79IeJuOMwoA7EABxm8XMBO3hKhVJBEsT4bgeTY3mV2pAt_q_ZXAPttwXwHmUnQbAdZ78shMpbh73mBTXEjZv_ycncwbqLmlRNDXSJAuUdCfRvngw5ZDG889CpkMziA4U__XoskcfWxnE/s1600/redconflyer1.png)

### What's Redcon about?

Redcon is for anyone interested in open-source, full-stack, domain-specific languages built using Red Language or any of its dialects. We'll be having a casual meetup-style event, with food and adult beverages.

### Who will be there?

Red's designer, Nenad Rakocevic, will discuss the language and its capabilities. A Q&amp;A session, presentations and demos are also on the agenda. Also present will be Gregg Irwin, leading governance and language design for the Red Foundation. Other core contributors to Red (The Team Red Irregulars) are coming too.

### What will we discuss?

- [![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhoStD9ih13Q4hsAmwtwvABZL8QoTuGe7deTTu-DCgVNz7eMvmad4cum7CmQGN1zhdyJvfjkA6K4EhNevChdNJbeEeuBqS6pL4hT_ASVpMm_heUXNPsIZ4ckVqoJZPxH6_NjxW7met9F58/s320/redconflyer2.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhoStD9ih13Q4hsAmwtwvABZL8QoTuGe7deTTu-DCgVNz7eMvmad4cum7CmQGN1zhdyJvfjkA6K4EhNevChdNJbeEeuBqS6pL4hT_ASVpMm_heUXNPsIZ4ckVqoJZPxH6_NjxW7met9F58/s1600/redconflyer2.png)
- Red/C3, Red's domain-specific language for making Ethereum's smart contracts safer and simpler
- The latest version of Red Wallet
- How Red's DSLs build fantastic Dapps
- World domination (or, "How to take over the world!" for fans of Pinky and The Brain)

### What do we get?

- Treats and goodies
- Food &amp; drinks
- Raffle prizes from Leatherman, PacSafe, Travelon, and Victorinox
- Input on Red tooling and features
- Join and enjoy the awesome Red community

### Where and when?

- November 3, 2018, from 11am - 5pm (with informal pub time after)
- Hotel Olšanka, Praha 3, Táboritská 23/1000, PSC (ZIP) 13000.
- [https://www.hotelolsanka.cz/](https://www.hotelolsanka.cz/)
- 2ND FLOOR CONFERENCE ROOM

Posted by Gregg Irwin at [9:17 PM](https://www.red-lang.org/2018/10/mini-redcon18.html "permanent link") [No comments:](https://www.red-lang.org/2018/10/mini-redcon18.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6596781488660443785&from=pencil "Edit Post")

## October 20, 2018

[]()

### [RED Wallet - Alpha 2](https://www.red-lang.org/2018/10/red-wallet-alpha-2.html)

Thank you for your patience. With all the other work going on, we've been juggling priorities. But now, at long last, it's time for an updated Red Wallet. There are still a lot of pieces in progress for future releases, but this version adds some key upgrades. If you missed the [original wallet announcement](https://www.red-lang.org/2018/06/red-wallet-tiny-simple-fast-and-secure.html), here's a short feature list from that:

- Secure ETH and [RED](https://ico.red-lang.org/RED-whitepaper.pdf) token transactions.
- Support for the world's leading hardware key: the [Ledger Nano S](https://www.ledgerwallet.com/r/08c4).
- [HD derivation path](http://ledger.readthedocs.io/en/latest/background/hd_keys.html) support: access up to 50 public addresses with the same key.
- Fast address loading.
- Fast balance retrieval (thanks to nodes provided by the Red Foundation).
- Fully [open source on Github](https://github.com/red/wallet).
- Runs on Windows 7/8/10 and macOS 10.1x.
- Under 300 KB (on both Windows and Mac), no installation, no setup, no external dependencies!
- Tiny wallet source code: ~[500 LOC](https://github.com/red/wallet/blob/master/wallet.red) of Red (plus ~110 KB of Red libs).
- Custom USB drivers for hardware keys, written in the Red/System DSL.
- Easy [binary checking service](https://red.github.io/bincheck/) to verify that your wallet app is a legit one!
- Source code under audit by third-party security experts.

We've added a few more LOC. The main wallet code is now 600 LOC, and the new batch feature (explained below) is 300 LOC.

## New Features and Improvements

### Trezor Hardware Key Support

First, and perhaps most important, is support for Trezor hardware keys. After the Ledger Nano S, the Trezor is the most popular key out there, and they have a nice new version as well, to stay competitive. If you have a Trezor, now you can use the Red Wallet with it. As with the Ledger Nano S, the USB driver for the Trezor is written in Red/System, and built right into the wallet. An added bonus is that the Trezor is smart enough to show the correct destination address when sending RED tokens.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhD3eFXwgguRayt7TxhGwfcHt3Go8N-wwTF9mARzcSVV1ddwdVmk-0zfgwbZSD_wR88qKVrxv9xHtP8OMoE89GLhe1_W3XuMuIF3S2ZFCjCx6vqgtjkhjMhy-KfVACkifwbV38mGwQHvsQ/s320/trezor.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhD3eFXwgguRayt7TxhGwfcHt3Go8N-wwTF9mARzcSVV1ddwdVmk-0zfgwbZSD_wR88qKVrxv9xHtP8OMoE89GLhe1_W3XuMuIF3S2ZFCjCx6vqgtjkhjMhy-KfVACkifwbV38mGwQHvsQ/s1600/trezor.jpg)

Note that you need the latest firmware on your Trezor for RED token amounts to show correctly. If your firmware is outdated, you may see "Unknown Token Value" on the Trezor display when sending tokens.

### Batch Payments

Another nice feature, though without an obvious UI affordance yet, is batch payments. If you send the same amounts to the same addresses, on a regular basis, you'll love this. You can set up a list of addresses, amounts for each, and then click Send just once. You then need to confirm each transaction on the hardware key (that's why we prefer them), but you don't have to go back and forth between the key and the Wallet UI. Click, click, click, and away they go. If a transaction is successful, you'll see a small **√** appear next to it. If it fails for any reason, a × will appear. To see the detailed results, click the Results button. Successful transactions will open in a browser tab for the network they were sent on, while failed transactions will show the reason in a small window on the desktop.

To access the batch payments screen, select an address in the list, then right-click on it. Select Batch Payment from the context menu, and a batch transaction dialog will open. Add new items, or remove those you don't need. To save a batch for future use, click the Export button. To reload one, click Import. Yes, you can have multiple batches for different purposes. We have more UI changes in the works, to improve usability, and more features to come. For example, you can only send ETH in batch payments today, but we plan to support RED tokens there as well. We're also experimenting with how best to verify stored addresses. Batches are simple text files today, which you can even create by hand if you want, but may be secured in the future. Remember, *always verify addresses!*

### Faster, Stronger, Better

We've also added some new back end pieces, so balance loading is *much* faster now. We believe we're the fastest wallet out there in this regard. There are also some improvements in how the Wallet handles various hardware key states, which is a fun challenging thing to test and debug, and a few small internal improvements and added tests. With this release, we'll also update our [binary checking service](https://red.github.io/bincheck/), so you can make sure you've got an official, secure build from us. If you want  to check if your RED Wallet binary has been tampered with in any way, you can simply drag'n drop the wallet executable on our binary checking service. If it's valid, the screen will turn green and show you the version (0.2.0 for this release) and target OS. If it turns red with a warning message, please notify us on [Gitter](https://gitter.im/red/blockchain) or [Twitter](https://twitter.com/red_lang) at once. So far, we haven't had any attacks for fake wallet instances reported. And you can always access the [source code](https://github.com/red/wallet), to see how it works, and have your own audits done, in addition to the audits we have done.

Download the RED Wallet application

[Windows 7/8/10 \[303 KB\]](https://static.red-lang.org/wallet/dl/win/RED-Wallet.exe) [macOS 10.1x \[295 KB\]](https://static.red-lang.org/wallet/dl/mac/RED-Wallet.zip)

Just click on the executable to run it (extract the .app file first on macOS), no installation or setup process required. Plug in your Ledger Nano S key and enjoy a smooth and simple experience!

*Only download the RED Wallet app from this page, do not trust any other website for that.*

There's a lot more in the works, but we're in the throes of preparation for Ethereum DevCon IV, with more exciting news to come on that side.

If you missed the announcement for the initial Wallet release, you can find it [here](https://www.red-lang.org/2018/06/red-wallet-tiny-simple-fast-and-secure.html).

Stay tuned, and Happy Reducing!

Posted by Gregg Irwin at [7:38 PM](https://www.red-lang.org/2018/10/red-wallet-alpha-2.html "permanent link") [No comments:](https://www.red-lang.org/2018/10/red-wallet-alpha-2.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7383049766572742643&from=pencil "Edit Post")

## October 2, 2018

[]()

### [Last Week In Red: 30-Sep-2018](https://www.red-lang.org/2018/10/last-week-in-red-30-sep-2018_2.html)

Happy Tuesday everyone!

@lucindamichele here. I’d like to thank everyone who responded on-list and off to our questions about yourselves. It is a big help for us, because our goal is to make Red as responsive to your needs as possible. While our due date has passed, you can still send your responses to myself or Gregg privately, and I can append them to our sheets. Our set of questions is appended at the end of this  
update.

Usernames in this update are all Github usernames.

Last week in Red saw contributions from across the spectrum from our heavy hitters. In the midst of gearing up for Ethereum’s Devcon 4 in Prague at the end of October, a diverse number of elements are getting worked on. @qxtie has added Trezor hardware support to the Red Wallet, in addition to the LedgerX hardware, a goodly chunk of work (see: [here](https://github.com/red/wallet/commit/f5ee1d0ce6639166bf389d83a584b424cbcee5f8)) as well as the ability to set up a batch of payments. There is also new support provided for homebrew APIs for fetching balances, for those who DIY. This is still work in progress, but we’ll write it up in detail when it’s ready. There has also been a lot of work done to add bitcoin support to the wallet, but bitcoin is messy, and we're still looking at whether it's worth including.

In Red specifically, a number of modifications have been made to work around MacOS issues, and extra attention paid to the GC/recycle facility, with fixes and tests from @dockimbel, @PeterWAWood, and @qxtie.

As for new issues, some GUI aberrations have been observed, related to the appearance of checkboxes and buttons. While not blue-screen-of-death critical, they have been flagged as bugs and will be addressed.Cross platform GUIs are hard, which is why so few do them.

In the community, some great discussion has been transpiring around the issue of Red’s mission: is it, or should it be, for “everyone” as our public-facing documentation states? And many folks have stated that while they generally don’t pay for software themselves, they WOULD be willing to shell out for a comprehensive book volume (chat is [here](https://gitter.im/red/red?at=5ba6f6595df5194734fcace4)) on the subject of Red.

Join the discussion at https://gitter.im/red/red. Also, more cool demos from @toomasv, who built a protototype interactive GUI editor, and demoed it building a little live-code app.

If you will be at Ethereum DevCon 4, or in the general area of Prague during the first week of November, hit up @GreggIrwin or @dockimbel; they will be hosting a small, informal RedCon after the main Ethereum event. We’d love for you to be there.

Those community questions, again:

1\) Do you consider yourself a programmer?  
2\) Do you consider yourself a software engineer?  
3\) Do you solve business problems with software?  
4\) What kind of problems do you solve?  
5\) What other languages have you used?  
6\) What is your favorite language, and why?  
7\) Is "progammer" or "developer" in your job title?  
8\) Do you think Red should be for "everyone" (e.g., like Visual Basic)?  
9\) Do you want to use Red for real work, or just fun?  
10\) What software do you pay for?

Keep the Red light burning,

@lucindamichele

Posted by Gregg Irwin at [7:58 PM](https://www.red-lang.org/2018/10/last-week-in-red-30-sep-2018_2.html "permanent link") [2 comments:](https://www.red-lang.org/2018/10/last-week-in-red-30-sep-2018_2.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6600669857613911675&from=pencil "Edit Post")

## September 25, 2018

[]()

### [Hello (again) world! Our Weekly Recap](https://www.red-lang.org/2018/09/hello-again-world-our-weekly-recap.html)

(Cool announcement buried below, like a prize in cereal.)

1\. A goodly part of our Fellowship of Red Magicians ("rogues" would be more alliterative, but I don't think they qualify) are cloistered in the wilds of Idaho, casting spells and muttering arcana over Red with more far-flung fellows. Right now, @dockimbel, @qxtie, @PeterWAWood and @greggirwin are  
working magic on Garbage Collection, which has now been merged into the master branch. Debugging was a big challenge, and writing tests equally so. There are many subtle details that may not be intuitive, like the fact that series values don't shrink when items are removed. As you use the GC version, don't be too hasty to file bug reports. Confirm via community chat that you understand the expected behavior.

2\. In red/docs, we're fleshing out our translations and adding more documentation of datatypes. In [red.specs](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#12-exceptions), @meijeru has expanded his discussion of the existing repertoire of errors to include ways the user can define errors for themselves. Meanwhile, @tovim's latest Czech translations have been added ([here](https://github.com/red/docs/commit/89a5e65134ec706064f0b68b27e1886318fe6888), and [here](https://github.com/red/docs/commit/e2acfa8b7e9682232770438758d065bbbcfe69af)). And new descriptions of datatypes from @gltewalt have been placed [here](https://doc.red-lang.org/en/datatypes.html).

3\. Your prize for reading down: We'll be at the Ethereum Devcon! See you in Prague, October 30 - November 2! Tickets were hard to come by, each wave selling out in less than a minute. We're excited to talk to core devs and tell them about Red/C3.

4\. Regarding Issues, if you notice reproducible issues, please document them as thoroughly as possible on github. New issue #3541 was handled promptly by @dockimbel. #3536 observed that when 'make hash!' was applied to a value of which there were a very large number of looped interations, Red revs up the CPU usage and grinds away for quite a while before producing a result, so we've reviewed it and added it as a bug. Of interest also is #3530, in which @dsunanda observed some laggy movement when setting a panel as loose.

5\. Answer our questions for the community, before it's too late! Go [here](https://gitter.im/red/red?at=5b9af21854587954f99bd32d). I'll be collating your responses this week. Thanks to everyone who's already added their voice, including @rebolek, @BeardPower, @dander, @codenoid, @ungaretti, a few guys named Alexander, and many more.

If I have missed something you'd like to know more about or if you have questions/concerns, please reach out to me: lucinda\_red on twitter, or lucindamichele on most every other platform. Have a great week!

Posted by Gregg Irwin at [6:05 PM](https://www.red-lang.org/2018/09/hello-again-world-our-weekly-recap.html "permanent link") [2 comments:](https://www.red-lang.org/2018/09/hello-again-world-our-weekly-recap.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4182601701477777686&from=pencil "Edit Post")

## September 17, 2018

[]()

### [So much to say, so little time](https://www.red-lang.org/2018/09/there-is-so-much-going-on-and-so-little.html)

We know everyone is anxious for the 0.6.4 release with garbage collection and it is close. A couple of changes are being wrapped up on the RED wallet and then the final nails will be hammered in on 0.6.4. Thanks to @bitbegin and @qtxie for all their work in those areas.

It's amazing to have @dockimbel walk you through a log analysis and how some debugging was done for GC, inner details of func spec caching, and preview some features in the new GUI console. Even better, he walked me through them in person. That's right, he and @qtxie are here in the U.S. for a deep dive of business and technical work. The days are long, and the coffee is flowing, but we are Red-powered.

Thanks to @lucindamichele for getting the news flowing regularly, and now on to her weekly report.

### Last Week In Red

Tell us about yourself and what you'd like to see Red become! Over at https://gitter.im/red/red we have a few questions for you. They're also at the bottom of this message.

More of your input and questions go into documentation: this exchange on Gitter https://gitter.im/red/help?at=5b9813e5728ddf02829371bc prompted a further fleshing out of ways block elements can be accessed: (1) using slash and a numeric index; (2) treating the block as a key/value store (these in addition to originally defined comparative functions like \`=, ==, &lt;&gt;, &gt;, &lt;, &gt;=, &amp;lt;=, =?\`).

We also saw a number of fixes to the RED Wallet, making it even more stable and flexible in response to data entries. Transactions that are waiting in the pending pool can be edited with greater clarity and simplicity; the wallet now lets you review the amount and address of your transactions.

In Red's Garbage Collection, following the previous week's fixes, some new tests of object recycling were added.

The community project red.specs-public -- a guide to the syntax and semantics governing the language -- added the option to search the repository by datatype.

In his nimble diagramming tool, user @toomasv continues to expand its interactive capabilities, adding a layer for re-sizing of diagram data and further defining shapes.

And here are your questions, go answer them on Gitter, here:  
[https://gitter.im/red/red?at=5b9af21854587954f99bd32d](https://gitter.im/red/red?at=5b9af21854587954f99bd32d)

1\) Do you consider yourself a programmer?  
2\) Do you consider yourself a software engineer?  
3\) Do you solve business problems with software?  
4\) What kind of problems do you solve?  
5\) What other languages have you used?  
6\) What is your favorite language, and why?  
7\) Is "progammer" or "developer" in your job title?  
8\) Do you think Red should be for "everyone" (e.g., like Visual Basic)?  
9\) Do you want to use Red for real work, or just fun?  
10\) What software do you pay for?

We've seen a lot of great responses so far, which tell us about how are people using Red, who they are, which will help us prioritize features. Keep 'em coming, and Happy Reducing!

Posted by Gregg Irwin at [7:56 AM](https://www.red-lang.org/2018/09/there-is-so-much-going-on-and-so-little.html "permanent link") [4 comments:](https://www.red-lang.org/2018/09/there-is-so-much-going-on-and-so-little.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=8610906295232641172&from=pencil "Edit Post")

## September 10, 2018

[]()

### [A quick note, and recent updates](https://www.red-lang.org/2018/09/a-quick-note-and-recent-updates.html)

## More to Come

It's been quiet here for a while, but busy as can be on the development and planning sides. We have new web sites ready to be filled with content, and all this blog content will transfer. On the PR side, Lucinda Knapp is helping us get organized, and get more regular announcements out. They'll be brief, recapping recent work and notes of interest from https://progress.red-lang.org/ as well as Gitter and other community channels.

We have a *lot* to talk about, and hope to do that soon. If we could just focus on development, things would be much easier. Our focus, as planned, is on the blockchain aspect and C3, but we still need to fill the gaps in the core to support that. *And* we have to build a business so it's sustainable. The token sale was a huge success but, in spite of that, we are subject/victim to crypto volatility. Do the math. Plans made in January had to be adjusted. Heck, plans made a week ago had to be adjusted. The token sale also came at a huge cost in other obligations. Things we might call distractions. It wasn't just "Here's a bunch of ETH, now go and do what you really want for a year." If only that were true.

There's a solid core team, support from about a dozen people in a semi-official capacity, and we have a great community. As an open source project, we live or die by that community. Otherwise we could just build what we want, and provide dev and consulting services around that. But we want to change the world. We want to help fix what is broken in software development, all while paying our own bills and eating regularly. To do that, we need you. Every little bit helps. While we need a couple more deep, experienced system-level coders (point them to us if you know any), almost anyone can contribute in some way. Reach out. Tell us what your skills are, what you're interested in, how you're using Red, or specific roadblocks you hit with it. "I need Full I/O" is not specific. 😶 Specific is important, because if you are *trying* to use it for something, that means you have needs and skills in that area. And you're probably not alone.

Our huge thanks to the community leaders, those working on tests and documentation, and experimental projects and research. There is a lot going on, and we're working hard to make things happen that are really worth announcing. 

Happy Reducing!

### Last Week in Red

New and notable in Red development: Numerous fixes in garbage collection, addressing crashes both with the recycling of red-symbol, and on macOS after allocating virtual memory. Quick-test.r saw a change, adding a precall. On the Docs side, the percent! datatype was committed by @gltewalt,  
applying percent! to typesets number! and scalar!, and it has been added to SUMMARY.adoc.

And among Red community projects, Gritter, a Red Gitter client, has seen feature updates including the mapping of antecendent post-time periods."Starting to be useful," writes @rebolek. In an update to the README.md of OTP/ssword, @planetsizecpu notes that the otp generator is dependent upon  
user selected parameters for its strength, meaning it's on the user to determine how strong that password is.

Posted by Gregg Irwin at [11:57 PM](https://www.red-lang.org/2018/09/a-quick-note-and-recent-updates.html "permanent link") [4 comments:](https://www.red-lang.org/2018/09/a-quick-note-and-recent-updates.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2759766755350667157&from=pencil "Edit Post")

## June 11, 2018

[]()

### [RED Wallet: the tiny, simple, fast and secure wallet!](https://www.red-lang.org/2018/06/red-wallet-tiny-simple-fast-and-secure.html)

We are proud to announce the release of the first alpha of the RED Wallet, our secure wallet app for the Ethereum network! The [source code](https://github.com/red/wallet) was released more than two months ago, and since then, the wallet has been used daily by the Red Team and contributors. We are now providing prebuilt binaries for easier access by the general public. The RED Wallet is one of the most secure crypto-wallets in the world, as it requires a hardware key to run. The main features of the first alpha release are:

- Secure ETH and [RED](https://ico.red-lang.org/RED-whitepaper.pdf) token transactions.
- Support for the world's leading hardware key: the [Ledger Nano S](https://www.ledgerwallet.com/r/08c4).
- [HD derivation path](http://ledger.readthedocs.io/en/latest/background/hd_keys.html) support: access up to 50 public addresses with the same key.
- Fast address loading.
- Fast balance retrieval (thanks to nodes provided by the Red Foundation).
- Fully [open source on Github](https://github.com/red/wallet).
- Runs on Windows 7/8/10 and macOS 10.1x.
- Only 269 KB (on Windows), no installation, no setup, no external dependency!
- Tiny wallet source code: ~[500 LOC](https://github.com/red/wallet/blob/master/wallet.red) of Red (plus ~110 KB of Red libs).
- Custom USB drivers for hardware keys, written in the Red/System DSL.
- Easy [binary checking service](https://red.github.io/bincheck/) to verify that your wallet app is a legit one!
- Source code under audit by third-party security experts.

The RED Wallet can only be used with a hardware key (currently only the Ledger Nano S, other models will be supported in the future). This provides the highest level of security you can currently have, as the private key is stored in a [secure element](https://ledger.readthedocs.io/en/0/bolos/hardware_architecture.html) inside the key, and never leaves it. Signing transactions is done by sending the data to the secure element, visually confirming the target address and amount to transfer. Then the secure element proceeds with the transaction signing inside the hardware key. Once your transaction is signed, it cannot be altered in any way. This means that the hardware key is the *weak link* of our wallet (after the user, of course 😉), rather than the wallet code itself. Even if the wallet app is compromised, the hardware key and visual checking, provide the ultimate protection. If the user verifies information correctly on signing, a compromised wallet app *cannot* route your tokens to a corrupted or incorrect target address.

Here is a video showing how the RED Wallet works: (shortly after posting the video, we realized a late edit duplicated a section of audio. We'll fix that as soon as we can.)

Download the RED Wallet application

[Windows 7/8/10 \[269 KB\]](https://static.red-lang.org/wallet/dl/win/RED-Wallet.exe) [macOS 10.1x \[273 KB\]](https://static.red-lang.org/wallet/dl/mac/RED-Wallet.zip)

Just click on the executable to run it (extract the .app file first on macOS), no installation or setup process required. Plug in your Ledger Nano S key and enjoy a smooth and simple experience!

We are looking to provide more options to retrieve the app such as Homebrew support on MacOS or chocolatey support on Windows.

For Linux, we have working USB drivers, but Red's GUI support (using a GTK backend) is not yet capable-enough to run the app. We are looking into a fallback command-line UI in future releases, which will allow easy transaction scripting from the shell or other apps.

If you want to check if your RED Wallet binary has been tampered with in any way, you can simply drag'n drop the wallet executable on our [binary checking service](https://red.github.io/bincheck/). If it's legit, the screen will turn green. If it turns red with a warning message, please notify us on [Gitter](https://gitter.im/red/blockchain) or [Twitter](https://twitter.com/red_lang) at once.

Only download the RED Wallet app from this page, do not trust any other website for that.

Get a Ledger Nano S key

You can order a Ledger Nano S key from the [Ledger site](https://www.ledgerwallet.com/r/08c4) (or just click the image below):

[![Ledger Nano S - The secure hardware wallet](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEicu63OR2xqnmfdWo6ftAkRGJLrACnqYQbGFP77lrzoeSJimVISZmhEVhImjkfHu4JUqIYt_bameD30PMoka0y9BIzIZg8_BWFKypDwJ-uD2K38qKiL7p3HjYPBg4lF9S-fZcV_aTjR_Np0/s1600/ledger-nano-s.png)](https://www.ledgerwallet.com/r/08c4)

We also plan, in the future, to offer a customized RED version of the Ledger Nano S key. Stay tuned!

*NOTE*: The RED token contract is not yet referenced by the Ethereum app in the Ledger Nano S key, so be careful with your transactions, as on-key visual checking won't work until Ledger adds RED token support (integration in the Ledger Ethereum app is pending). The address you see, until they update the Ethereum app with RED's information, won't match what you entered in the wallet UI (it will just show the RED token contract address every time). We'll announce as soon as they update the Ledger app.

A bit of history...

The RED Wallet app was part of our plan since last year, as one of the initial steps for introducing RED token use into the Red community. It will facilitate balance checking and transfers between community members, very few of whom have experience with crypto-currencies. It is meant to be very easy and safe to use. (as we have created in this first alpha). We may even integrate it into the Red console, via a console plugin extension.

Since having the first usable version of the wallet a couple of months ago, for internal use, we realized that such an app has great potential. Not just for showing off what can be achieved with Red, but to highlight in the market of wallet apps that we can have lighter, easier to use, and more secure alternatives.

Since then, we have brainstormed about many possible features that other wallets are not proposing, to improve usability, even a possible command-line version for CLI-only users.

Feature list for RED Wallet alpha 2

- TREZOR hardware key support.
- Batch processing of a list of transactions (can be imported from a CSV file).
- Wider ERC-20 token support (using the [MEW list](https://github.com/MyEtherWallet/ethereum-lists)).
- Faster balance lookups (by parallelizing queries).
- Simplified transaction fee selection.
- Signed binaries for Windows (macOS binaries are signed already).

Feature list for RED Wallet alpha 3

- New [tab-oriented UI design](https://static.red-lang.org/wallet/mockups-v0.3.0.pdf).
- Support for cancelling a transaction (Ethereum network).
- Support for Infura or local nodes, in addition to the Red Foundation nodes.
- BTC support.
- ETC support.

Feature list for RED Wallet 1.0

This is our non-exhaustive wish-list for 1.0, we still need to consider the feasability and resources required to support all of those features, so some of them might get postponed to a post-1.0 version.

- [ENS](https://ens.domains/) support.
- Custom HD derivation paths.
- Linux support.
- Android support.
- Block explorer integration:
  
  - Follow transaction outcomes from the wallet itself.
  - List past transactions for any address.
- Secure identification of a target address:
  
  - Contact management (encrypted on IPFS or Swarm)
  - Display identicons.
  - Custom handshake using micro-transactions
- Command-line version with scripting abilities.
- QR code generation for sharing your public addresses.
- Multi-sig support (probably post 1.0).
- An alternative flat UI skin.
- A good name. 😄

We're noting these features here, rather than keeping them confidential, because we believe users will benefit if other wallets implement them as well. Helping people navigate the new world of crypto safely and securely is our goal.

If you have ideas about how to make the RED Wallet even better, you are welcome to [join us on Gitter](https://gitter.im/red/blockchain), to discuss it with the Red user community. If you want to report issues with the current wallet version, please [fill a ticket on Github](https://github.com/red/wallet/issues), or drop us a message on [Gitter](https://gitter.im/red/blockchain).

The RED Wallet application was made with ❤ by the Red Team. Enjoy! 😊

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:44 PM](https://www.red-lang.org/2018/06/red-wallet-tiny-simple-fast-and-secure.html "permanent link") [2 comments:](https://www.red-lang.org/2018/06/red-wallet-tiny-simple-fast-and-secure.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2508172772987589342&from=pencil "Edit Post")

## May 3, 2018

[]()

### [RED token listing](https://www.red-lang.org/2018/05/red-token-listing.html)

As you know already, the RED token (Red Community Token) has been listed on some exchanges (KKcoin, Xstar, [ddex.io](http://ddex.io/)), so far using a RED/ETH pair, but those exchanges are small and do not provide a lot of liquidity.

We now have the opportunity to get the RED token listed on a bigger reputable exchange, [Bibox](https://www.bibox.com/), which ranks 17th on [CoinMarketCap](https://coinmarketcap.com/exchanges/volume/24-hour/). In this case, listing approval is a crowd voting process, that will be used for the first time by Bibox. The voting process is [described here](https://bibox.zendesk.com/hc/en-us/articles/360003661833). A few notable points:

- Voters get their voting tokens back if the project they vote for does not get listed, so there is no risk for participating.

<!--THE END-->

- The Red team will reward voters with tokens (ratios to be announced on Telegram groups, see below).

<!--THE END-->

- There are 7 voting rounds over 7 days. The two projects with the highest number of votes in total at the end of last round, win and get listed.

<!--THE END-->

- The first voting round starts on May 2nd, the last voting round is on May 9th.

The Red team strongly believes that decentralized exchanges, like those based on the [0x protocol](https://www.0xproject.com/), are the future and will eventually replace most centralized exchanges. A 0x-powered decentralized exchange, [DDEX](https://ddex.io/), has already listed RED for some time. The Red team still recommends DDEX highly, as it is the simplest, and one of the most trustable exchanges we've come across so far (to use it you need either a hardware key like the [Ledger Nano S](https://www.ledgerwallet.com/products/ledger-nano-s), or at least [Metamask](https://metamask.io/) installed). While not perfect, it improves security, and every little bit helps as the blockchain and crypto worlds work toward more security best practices.

We are pragmatic visionaries and, as the crypto-fans are currently, vastly focused on centralized exchanges, we believe that being listed on at least one big exchange would be, right now, useful for the whole Red community.

Every day we work hard to ensure that we are meeting the goals laid out in the whitepaper, both technically and from the crypto and business perspectives. Balancing the allocation of resources, human and otherwise, takes effort. We're making great technical progress, as many of you following us closely, know. The Foundation has also done a lot of work behind the scenes, in preparation for putting RED tokens into circulation in the community.

This new exchange listing will bring balance on the RED token side. That's important, because we also need to support those who supported us during the token sale. Getting a token accepted on a big exchange is a  complex and hard process, which often simply fails. We have put a lot of effort, time and energy into getting RED short-listed for the voting process on Bibox, and then mobilizing resources for maximizing our chances of success. If you think that RED tokens should be listed on a big exchange, you are welcome to join the Bibox users to vote for RED, and get some tokens rewarded for your help (for refunding your voting expenses). The rewarding information might be changing from day to day during the voting process, so you can get the latest info from our telegram groups in [English](https://t.me/redofficial) and [Chinese](https://t.me/redofficialcn).

Thanks to all of you who are helping the RED ecosystem grow up!

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjTQvlSq3u2uNLShiCcv5W_gsPblmIrVQK3ij7ck-_Tk3_HF9nbv9TSO21VOVLzmiW_X_KxjOWYaBMuLTbtV65beeiGofN3k8KLuX1hLkIBFCj5jkts1m1Yy2F33WPx0QY8ohjJ4PWZ2tHR/s320/WeChat+Image_20180503113148.png)](https://www.bibox.com/votelist)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [5:53 AM](https://www.red-lang.org/2018/05/red-token-listing.html "permanent link") [2 comments:](https://www.red-lang.org/2018/05/red-token-listing.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=8512242292316987709&from=pencil "Edit Post")

## April 4, 2018

[]()

### [Sneak peek at Red on Android](https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html)

Here is a short overview of the implemented features so far for Red/View backend on Android:

The source code for that Android test app is [available here](https://gist.github.com/dockimbel/bf833e5a737f0efe4bfe07a26a528ec4).

Implemented features so far:

- New java bridge for Android
- Full set of Red/View widgets supported (some still require extra work)
- Draw &amp; Shape dialects fully supported
- Compatibility with Android GUI themes
- Device-independent coordinate system
- Updated APK building toolchain for targeting API 23+ Android systems
- Improved ARM backend, support for ARMv7+
- Android OS support ranges from 5.0 to 8.1 (tested on a Pixel 2)

The new java bridge replaces the old prototype built a few years ago, the low-level JNI bridge has been kept as is. This new bridge is optimized for performance, and allows efficient bindings from Red/System to the Android API in Java.

Those features were implemented in about a month and half in August/September 2017. We have delayed the continuation of that work, as we need to focus our resources on higher priority tasks for now, like Red/C3 and full I/O support. Once 0.7.0 will be out, we should have some resources available to resume this work. As a reminder, the current work on Android is done in a private repository, in order to keep control over the communication about Red on Android, as we want to maximize the announcement effect on that very important milestone. This private repo will be opened to a group of selected developers in our community once we resume the work on it, in order to help with testing and fine-tuning.

About the Tiger demo, it's a [Draw version](https://gist.github.com/dockimbel/85bb0794fde6673498816b81fa587b0e) of the famous [SVG tiger](https://commons.wikimedia.org/wiki/File:Ghostscript_Tiger.svg). It has many complex shapes, so it is particularily intensive to render in realtime, as in the above animation. From what we have noticed so far, it is CPU-bound on most (if not all) Android devices, so the rendering speed varies according to your device raw performance. We did some simple benchmarks with raw Java 2D vector graphics using the same Android API as Draw, Java code performed only 12% faster than our Draw code. This is an excellent result at this point, and hints that we can achieve great performance for 2D rendering in future versions. Here is the same demo running on a Xiaomi Mi Mix, which has a bigger display and is quite faster than the Nexus 5 used in the first video:

Here is a non-exaustive list of features to add or issues to address in order to complete Android backend:

- Font and Para objects support
- Menus support
- List widgets elements have fixed sizes so far
- Text-list has fixed height
- Area widget needs to be completed
- User-defined list widget
- Camera aspect ratio correction required
- Camera control
- Transition effects between panels
- Fast 2D sprites and scrolling support (for 2D games)
- Red GUI console support
- Common hardware sensors support
- Bluetooth support
- QR code reading and generation library
- Contacts database access
- Intents access
- Developer keys management
- Permission system support
- Extra application types support:
  
  - desktop widget
  - headless service
  - wearable
  - TV

We are really excited by how quickly and smoothly was this first part of the work achieved, so this bows well for the remaining parts. As you know, we have a very heavy schedule this year, so we really need the full support of the Red community, and beyond, in order to accomplish it all and finally make the tool *we all* dream about, come true!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [8:57 AM](https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html "permanent link") [14 comments:](https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3211817429978778532&from=pencil "Edit Post")

## March 27, 2018

[]()

### [Roadmap Updates](https://www.red-lang.org/2018/03/roadmap-updates.html)

After our successful token sale, we are making some changes to our old Red development roadmap.

0.6.4 release

We are merging the 0.6.4 branch into master today. There are still some features to add and polish, so we plan to release it in about a week.

We are still considering a 0.6.5 milestone for swapping the REPL and the toolchain thus making the Red console the new Red executable. If we cannot fit the required changes for that into 0.6.4, we will insert a small extra milestone for that before releasing 0.7.0.

Full I/O milestone

This gets higher priority now, as we don't need to rush Android support anymore, given the new funds we have now. We can now proceed in a more logical order which will result in the Android release having much more complete support.

0.7.0 will focus on bringing the port! datatype and with it, async networking I/O and some basic protocols. Work will start on it right after 0.6.4 release. This also means that a 0.7.x *could be* turned into a 0.9 release, providing a first Red beta version and a shortened path to 1.0. That depends on decisions about incorporating the module system and/or concurrency support in 1.0, or in a later version. We hope to decide on that with the help of the Red user community, using the voting power granted by the [RED token](https://ico.red-lang.org/RED-whitepaper.pdf). ;-)

Android milestone

It is still a very important milestone for Red, even if the work on it has currently slowed due to the big blockchain-related wave of tasks. It is now scheduled to be a 0.7.x release. We should accelerate work on it once new developers have joined the team. A new blog article (later this week) will provide a sneak peek at Red's current Android capabilities and what is left to do in order to complete it.

Red/C3

We are still working on combining the Red core roadmap and the Red/C3 roadmap and allocating resources adequately on the different branches of the whole project. So far, the Red/C3 roadmap (as described in the [whitepaper](https://ico.red-lang.org/RED-whitepaper.pdf)) remains unchanged.

The first milestone in the Red/C3 roadmap is:

> Q1 2018:
> 
> - Ethereum node wrapper for Red Dapps (alpha)
> 
> <!--THE END-->
> 
> - RED wallet Dapp (alpha)

We are glad to announce that we are finalizing those tasks, and will be releasing the wallet app (as alpha) next week! The wallet currently supports only the Nano Ledger S hardware key (no software keys support for now). More info about the wallet app in a blog post next week, including a list of all the features planned for the 1.0 wallet release.

For the Ethereum node wrapper, we have implemented a JSON-RPC library in Red, used by the wallet app. That library will be released alongside the wallet code. It only covers some basic features from the Ethereum node API for now. We plan to vastly extend the API coverage in subsequent versions. Once the 0.7.0 release is out, we could wrap that library code in an eth:// port and provide a nice, human-friendly interface for it. We believe that enabling an easy way to interact with the Ethereum blockchain (and some others later this year), will raise the interest of existing Red coders for the Ethereum ecosystem, and set a new standard for high-level scripting tasks for blockchains.

Last but not least, we are setting up an online Ethereum node, that will be controlled by the Red Foundation, as a backend for the wallet app (currently relying on [Infura](https://infura.io/)'s nodes) and all future Red Dapps.

We are now preparing to start work on the Red/C3 compiler first alpha, which is planned for release in June. After that, during the summer, we will review the next steps in the roadmap and eventually adjust them according to the feedback from users, how fast we can move Red/C3 to a 1.0, and the state of needs in the crypto world by then.

Red/Pro

Huh...what? :-) Yes, you read it correctly, we, at Fullstack, are cooking a great new product for Red users which should be our first commercial product. At the moment, I am directing Fullstack's key resources to work solely on the open source Red and Red/C3. Work on Red/Pro is postponed to the second part of this year. There will be more info about what Red/Pro is in a future blog post. ;-)

Until then, you can help us test the new console and features of 0.6.4 before the new release, you are welcome to report issues in our [red/red](https://gitter.im/red/red) or [red/bugs](https://gitter.im/red/bugs) rooms on Gitter.

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:08 PM](https://www.red-lang.org/2018/03/roadmap-updates.html "permanent link") [3 comments:](https://www.red-lang.org/2018/03/roadmap-updates.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3726697507526231779&from=pencil "Edit Post")

## March 12, 2018

[]()

### [Red Foundation news](https://www.red-lang.org/2018/03/red-foundation-news.html)

We set up the Red Foundation structure at the beginning of January in Paris, France. The Red Foundation is kindly hosted by the [EPHE](https://www.ephe.fr/en), at the Human and Artificial Cognition research unit led by [François Jouen](https://www.ephe.fr/ecole/nos-enseignants-chercheurs/francois-jouen) ([author](https://www.researchgate.net/profile/Francois_Jouen) of the famous [RedCV](https://github.com/ldci/redCV) framework, among other image-processing related [projects](https://github.com/ldci) for Red).

![](https://files.gitter.im/x8x/3pBz/red-logo_bg333_82x126.png)

For a brief overview, the Red Foundation structure is composed of several teams:

- an administrative team: 
  
  - Nenad Rakocevic, President
  - Francois Jouen, Vice-President
  - Azouz Guizani, Treasurer

<!--THE END-->

- an operational team, led by [Gregg Irwin](https://github.com/greggirwin), and composed of regular members. [Peter W A Wood](https://github.com/peterwawood) is the first member, and will be followed by more in the future.

<!--THE END-->

- honorary members, who act as advisors.

The role of the Foundation, as explained in the [announcement article](http://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html) and in the [RED whitepaper](https://ico.red-lang.org/RED-whitepaper.pdf), is to manage the whole Red open source project, and set up a new economic model for open source projects using the RED token. In order to achieve that, all copyright holders in the Red codebase on Github will be asked to transfer their rights to the Foundation. As Nenad is the copyright owner of the biggest part of the source code, he will be the first one to do so (resulting in changing the copyright in the source files headers and license files).

The tasks the operational team is also working on currently, are:

- a website for the Foundation, featuring:
  
  - a blog platform where regular reports will be made.
  - full information about the RED token (usages, reward rules and amounts).
  - contributing task bounties for the Red community (paid in RED tokens).

<!--THE END-->

- defining the rules for retro-distribution of RED tokens for past contributions (since the opening of the Red github repo in 2011). We will proceed with the distribution as soon as the rules and correct amount of reward tokens are decided. This needs the list of contributions and contributors to be gathered.

<!--THE END-->

- defining the decision processes in the operational team.

<!--THE END-->

- defining the rules for membership of the Foundation.

<!--THE END-->

- managing the re-design of the red-lang.org site and moving it to a new platform.

All those tasks and their results will be published on the Foundation website, for the sake of information and transparency.

In order to absorb all these new tasks and the extended roadmaps for the new branches of development in the Red programming stack, we are recruiting new collaborators (non-exhaustive list):

- a Content and Marketing Manage
- a Community manager (to help Gregg)
- a [devops](https://en.wikipedia.org/wiki/DevOps) lead (for deployment and infrastructures management)
- a low-level system programmer (to reinforce the core Red dev team)
- an Android system programmer
- a Win32 system programmer (for maintaining the Windows backend)
- a Cocoa system programmer (for maintaining the macOS backend)
- a GTK system programmer (for maintaining the Linux backend)
- a QA engineer
- a Security Expert (for addressing the AV vendors issues and other security aspects in the project)
- a Tokenomics Expert (if such rare bird even exists ;-))

Some of those jobs are already being filled as you read those lines, whilst it might take longer to find right match for others. Most of those jobs will be handled by our supporting company, Fullstack Technology, on behalf of the Foundation. We will post the job descriptions asap.

In addition to that, the Red Foundation is searching for partners helping it fulfill his vision of simplified programming solutions for humans, especially in the blockchain industry. Discussions are undergoing already with some potential partners, like the [NEO council](https://neo.org/), or [Enuma](https://www.enuma.io/index.html), a leading blockchain services company in Hong Kong.

The Foundation will set up a monthly report on all its activities, published on his website (under construction).

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:37 PM](https://www.red-lang.org/2018/03/red-foundation-news.html "permanent link") [No comments:](https://www.red-lang.org/2018/03/red-foundation-news.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4020849740898301206&from=pencil "Edit Post")

## March 11, 2018

[]()

### [Red, Rebol &amp; Carl](https://www.red-lang.org/2018/03/red-rebol-carl.html)

Another goal of our trip in California was to visit [Carl Sassenrath](https://en.wikipedia.org/wiki/Carl_Sassenrath), creator of [Rebol](http://rebol.com/), and spiritual grandfather of Red, as Red is the offspring of the Rebol language.

We had a great time with Carl and his wife Cindy, discussing Red and Rebol syntax &amp; semantics, the blockchain industry, smart contracts and the opportunities it presents for our technologies, while enjoying a good Italian restaurant and excellent red wine (selected by Carl, of course!). Carl was particularly interested in understanding more deeply how smart contracts work and how they are currently implemented using the Solidity language. We walked him through the complete source code of the [RED token contract](https://github.com/red/RED-token), commenting on pretty much every line of code in it and discussing the needs and possible improvements a [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) like Red/C3 could bring over the existing tools. It seems obvious that we could make a huge difference in that domain, given our human-centric approach to software building.

Another aspect that got Carl's attention, was the tokenomics we are setting up for our community of users, using the RED token. Carl read the whole [whitepaper](https://ico.red-lang.org/RED-whitepaper.pdf) (he found it well-written), and was excited by how we could make the community grow, delegate more control over the projects to the community using the voting power, and increase the contributions by leveraging the token, as a reward model for useful contributions.

We were invited to stay at Carl's place, as the discussions lasted late into the night (many thanks to Carl &amp; Cindy for their kind hospitality). At our morning breakfast, we were delighted to hear that Carl accepted our invitation to join the Red Foundation as an *honorary* member, which means that Carl will be watching our work both on Red and on the Red/C3 DSL, bringing his unique experience and advice on building languages and dialects. As we are still setting up the Red Foundation operations and teams, we will give more information about our collaboration with Carl in later reports from the Foundation. In addition to that, we asked Carl to kindly free the Rebol/SDK (which is something Carl was already considering, as it is not sold anymore), so that Red users could encap their own toolchain binaries if they want to, without having to purchase it. Carl announced on [rebol.com](http://rebol.com/) that it will soon be unlocked, and provided for free to all!

For the old timers from Red and Rebol community, yes, it means we are on a course to finally join forces and build the dream team we've all wished for over these many years! ;-)

Next article will cover the current state of the Red Foundation and the related on-going tasks.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:39 PM](https://www.red-lang.org/2018/03/red-rebol-carl.html "permanent link") [7 comments:](https://www.red-lang.org/2018/03/red-rebol-carl.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7129498553042636874&from=pencil "Edit Post")

[Newer Posts](https://www.red-lang.org/search?updated-max=2019-10-30T20%3A18%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2018-03-11T18%3A39%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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
    
    - [RedCon 1 and Ethereum DevCon 4 World Report](https://www.red-lang.org/2018/11/redcon-1-and-ethereum-devcon-4-world.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2018/10/) (3)
    
    - [Mini RedCon'18](https://www.red-lang.org/2018/10/mini-redcon18.html)
    - [RED Wallet - Alpha 2](https://www.red-lang.org/2018/10/red-wallet-alpha-2.html)
    - [Last Week In Red: 30-Sep-2018](https://www.red-lang.org/2018/10/last-week-in-red-30-sep-2018_2.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2018/09/) (3)
    
    - [Hello (again) world! Our Weekly Recap](https://www.red-lang.org/2018/09/hello-again-world-our-weekly-recap.html)
    - [So much to say, so little time](https://www.red-lang.org/2018/09/there-is-so-much-going-on-and-so-little.html)
    - [A quick note, and recent updates](https://www.red-lang.org/2018/09/a-quick-note-and-recent-updates.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2018/06/) (1)
    
    - [RED Wallet: the tiny, simple, fast and secure wallet!](https://www.red-lang.org/2018/06/red-wallet-tiny-simple-fast-and-secure.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2018/05/) (1)
    
    - [RED token listing](https://www.red-lang.org/2018/05/red-token-listing.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2018/04/) (1)
    
    - [Sneak peek at Red on Android](https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
    
    - [Roadmap Updates](https://www.red-lang.org/2018/03/roadmap-updates.html)
    - [Red Foundation news](https://www.red-lang.org/2018/03/red-foundation-news.html)
    - [Red, Rebol &amp; Carl](https://www.red-lang.org/2018/03/red-rebol-carl.html)
  
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

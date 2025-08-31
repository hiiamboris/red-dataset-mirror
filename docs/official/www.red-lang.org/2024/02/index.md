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

## February 19, 2024

[]()

### [0.6.5: Changelog](https://www.red-lang.org/2024/02/065-changelog.html)

Bumping up the version number was motivated by the breaking syntax change [done recently](https://www.red-lang.org/2024/02/important-change-switching-map-and.html). We do not offer specific builds for a given version number anymore since we provide automatic builds (with builds history) on each new master commit. Though, the changelog for new version number changes will still be provided...and this one is pretty big as it covers about 5000 commits! Hope this will help users who might have missed some changes to catch up.

613 PRs were [merged](https://github.com/red/red/pulls?page=1&q=is%3Apr%20is%3Aclosed%20created%3A2018-11-22..2024-12-31), 2415 fix commits were pushed, among which 902 are [closing issues](https://github.com/red/red/issues?q=is%3Aissue%20created%3A2018-11-22..2024-12-31%20is%3Aclosed) tracked on Github. The most notable new features and changes are listed below with eventual links to docs or previous blog posts describing or mentioning them:

### Main new features

- New datatypes: [money!](https://github.com/red/docs/blob/master/en/datatypes/money.adoc), ref!, [point2D!](https://www.red-lang.org/2023/08/subpixel-gui.html), [point3D!](https://www.red-lang.org/2023/08/subpixel-gui.html).
- New codecs: Redbin, JSON, CSV
- New high-performance run-time lexer with instrumentation support.([blog](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html))([doc](https://github.com/red/docs/blob/master/en/lexer.adoc))
- Interpreter instrumentation support (debugger, tracer, profiler).([doc](https://github.com/red/docs/blob/master/en/interp-events.adoc))
- New powerful APPLY native, with deep interpreter support.([blog](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html))
- Dynamic refinements support.([blog](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html))
- Adds compress and uncompress natives with gzib, zlib and deflate algorithms support.
- Adds gpio:// port with GPIO dialect for RaspberryPi.([blog](https://www.red-lang.org/2019/07/gpio-port-for-raspberry-pi.html))
- Adds TAB navigation support to View. ([blog](https://www.red-lang.org/2023/11/tab-navigation.html))
- Adds raw strings syntax support.([doc](https://github.com/red/docs/blob/master/en/datatypes/string.adoc#literal-syntax))
- Swaps map! and construction syntax. ([blog](https://www.red-lang.org/2024/02/important-change-switching-map-and.html))
- Hashtables are now used for fast lookups in contexts.
- Custom [dtoa](https://www.exploringbinary.com/quick-and-dirty-floating-point-to-decimal-conversion/) library [implementation](https://github.com/red/red/blob/master/runtime/dtoa.reds) to load and form float values.
- Standard library and garbage collector stability vastly improved.

Finished or almost finished features in branches::

- Full IO ports with async support, including new IPv6! datatype.([branch](https://github.com/red/red/tree/IO))
- TextUI backend to View.([PR](https://github.com/red/red/pull/5378))
- XML codec.([PR](https://github.com/red/red/pull/5026))

### Other general new features or changes

- New natives: TRANSCODE, SCAN, AS-MONEY, ENHEX.
- New functions: SINGLE?, LAST?, DT, TRANSCODE-TRACE, TRACE, CLOCK, NO-REACT, DO-NO-SYNC
- New routines: SET-TRACE, TRACING?
- Extends EMPTY? to support map! values.
- Allows NONE as value in map!.
- Adds REMOVE/KEY support for removing map! entries.
- Adds FOREACH support for map!.
- Add new-lines automatically when converting maps to blocks.
- Supports issue!, money! and refinement! as key in map
- Allows any-string! series to be matched against binary input in PARSE.
- Adds Accept-Charset and User-agent to HTTP header.
- Update libcrypto version requirement on Linux platforms.
- Adds support for native port actors.
- Extends ROUND/TO to support time!.
- Adds a cross-platform threading library to Red runtime library.
- Adds a FIFO MPMC queue to Red runtime library.
- Adds history support to Red console.
- Extends GET native to accept any-word! as argument.
- FIND is now returning FALSE instead of NONE when used on bitsets.
- Deprecates FIND on objects (redundant with IN).
- Adds ABOUT function to console.
- Preprocessor: fetch-next now supports set-words/paths, get/lit-args, object/series paths.
- COMPLEMENT is now allowed on tuples.
- Adds RANDOM/SECURE.
- SORT support of /skip &amp; /all &amp; /compare integer extended to strings, vectors and binaries.
- Extends FIND/LAST to support hash!.
- Allows FINDing by datatype and typeset on hash! series.
- Removes percent-encoding from files, use double-quotes when needed instead.
- Adds SYSTEM/CATALOG/ACCESSORS.
- Allows pair! for COPY/PART argument on series.
- Allows LOOP and REPEAT to take a float argument as counter.
- Extends REDUCE/INTO to support hash! destination.
- Extends BODY-OF to support action! and native! values.
- REPLACE reimplemented.
- Adds support for REVERSE/SKIP.
- Extends VALUE? native supports any-word! argument.
- Enable image! in red/core on Linux.
- Adds GC support to libRed.
- Extends DISTANCE? to support pair! arguments.
- Adds /KEEP refinement to TRY.
- Implements RENAME action for FILE! datatype.
- Adds routine arguments type-checking support to compiler.
- Accelerates the output speed of LIST-DIR.
- Allows error! values to be modified by users.
- Adds \[trace] and \[no-trace] function attributs.
- Faster/simpler EMPTY? function implementation.
- Forces the inclusion of Git information in the runtime.
- Optimization for appending values into hashs.
- Extends CHANGE to support image! argument.
- PICK on pair!, date! and time! values now support named accessors as index argument.
- Adds PICK action to event! datatype.
- Makes RECYCLE returns the allocated memory total by default.
- Cleaner implementation of deep reactive paths support.
- Internalizes SYSTEM/STATE/NEAR value.
- Compound scalar datatypes (pair!, date!, time! and tuple!) will now emit ON-CHANGE events when one of their component is changed using an access path (both in compiled and interpreted code).
- Adds reactivity support to bitset! values.
- Adds support for REFLECT action on bitset! values.
- Reports a proper path in compiled path errors.
- Adds memory usage before/after a GC cycle in debug output.
- Measures GC time in debug mode.
- \[ARM] Adds "division by zero" and "division overflow" checks in debug mode.

### Parse

- KEEP PICK on paren expressions now merges list of values to collected block.
- Optimizes Parse's KEEP memory usage on strings/binaries.
- Removes the end checking in iteration rules.
- Speed optimizations for \`TO &lt;token&gt;\` rules.
- Adds a fast path for \`TO/THRU end\` rules.
- New set of optimizations for looping on a char! value in PARSE.

### VID

- Smarter merging of actors in a style with custom actors in the instance.
- Added password flag for hidden input
- Adds scrollable flag.
- defines VID origin and spacing values per backend.
- adds next and prev as default options to VID-made faces.

### View

- Adds a calendar widget.
- Adds support for tri-state checkboxes.
- Significant GTK backend improvements and upgrades to match other backends.
- Better handling of DPI changes.
- Handles pause and scroll-lock keys.
- Now EVENT/PICKED is a float wheel delta-value in on-wheel event.
- Improves user experience when closing window that contains a large number of faces.
- Scale the font size with Ctrl + mouse wheel in GUI console.
- Adds stop-events function to easily exit a View events loop.
- Adds resize-ns and resize-ew mouse cursors.
- Adds bounds option to /options facet for restricted dragging area.
- Adds new /sync refinement to VIEW function.
- Adds /color facet info to DUMP-FACE output.
- Improves memory usage when changing /draw facet content.
- Adds support for semi-transparent no-border top-level windows (Windows).
- Minimal dark mode support on GUI console.

### Draw

- Switch command parameters to point2D! and float! for subpixel precision.([blog](https://www.red-lang.org/2023/08/subpixel-gui.html))
- New Direct2D backend for Windows.
- Add line-pattern command for drawing dashed lines.
- Extends scale command to support percent! values.
- Supports image mapping to arbitrary quadrilateral.
- Removes matrix-order command in DRAW.

### Red/System

- Adds subroutines to R/S functions.([blog](https://www.red-lang.org/2020/08/redsystem-new-features.html))
- Implements system/io/* instrinsics for CPU I/O read/write instructions.
- Adds system/stack/push-all and system/stack/pop-all intrinsics.([blog](https://www.red-lang.org/2020/08/redsystem-new-features.html))
- Support for atomic operations using system/atomic/* intrinsics.([blog](https://www.red-lang.org/2020/08/redsystem-new-features.html))
- Adds #inline directive to R/S for including assembled binary code.
- Implements support for integer hardware division (ARMv7+).
- Generates optimized code for divisions by a power of 2 literal (ARM).
- Vastly improved loop counter handling robustness.
- Full support for special float values (-0.0, 1.#NaN, 1.#INF, -1.#INF).
- Drops support for % and // operators on float types.
- Adds support for function pointers in literal arrays.
- Switches to 16-bytes stack alignment on Linux.
- Adds log-2 function to standard library.
- Allows cross-referenced aliased fields in structs defined in same context.
- Support multiple variable assignments.
- Allows grouping arguments and local variables type specification.
- Relax lexical format of hexadecimal literals.
- Allows get-paths pointers on function nested in contexts.
- Adds support for simple pointer to pointer type.
- Allows function! type to be specified for local variables.

### Toolchain

- Optimizes critical section in linker, twice faster linking time now on average.
- Adds --show-func-map compilation option.
- Various minor improvements to PE format support.
- Adds working Linux-musl target.
- Expands libRedRT to support View backend.
- Adds --no-view option for Red binaries.
- Shows the global words used by the toolchain in the compilation report.
- Adds new Pico compilation target.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [4:22 PM](https://www.red-lang.org/2024/02/065-changelog.html "permanent link") [7 comments:](https://www.red-lang.org/2024/02/065-changelog.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3278958425894333157&from=pencil "Edit Post")

Labels: [changelog](https://www.red-lang.org/search/label/changelog), [release](https://www.red-lang.org/search/label/release)

## February 11, 2024

[]()

### [Important Change! Switching map and construction syntax.](https://www.red-lang.org/2024/02/important-change-switching-map-and.html)

Sometimes deep changes take a huge amount of code. Sometimes they take a lot of detailed explanation and consideration, leading to long discussions and people taking sides. Rarely does an important syntactic change to a language happen quickly, with universal agreement, simple implementation, *and* tools to help update scripts in the wild. Today is one of those rare days.

Admittedly, this *idea* has been discussed for a long time. It would surface, people nodded their virtual heads, and it would submerge again. Today it's ready to deploy. Not only that, but Rebol3 is making the same change, so the two languages will still be compatible in this regard.

What is the change?

It's easy to describe. Today, **map!** values use this syntax: **#(...)** and construction syntax (sometimes called *serialized form* or *loadable form*) looks like this: **#\[...]**. Going forward, those syntactic forms will be swapped. Why? The answer is easy. In Redbol langs, blocks do not evaluate by default, you have to **do** or **reduce** them. Parens, on the other hand, *do* evaluate by default. Today, maps use paren-like syntax, but they do *not* evaluate, while construction syntax uses block-like syntax, but *does* evaluate. This is a carryover from Rebol, so the major concession here is that Red and Rebol3 will no longer be compatible with Rebol2's construction syntax.

If you've never heard of construction syntax, there's a nice explanation of it [here](https://stackoverflow.com/questions/27070260/whats-the-purpose-of-datatype-constructor-in-rebol). Red only supports a few values via construction syntax today, all datatype literals, true, false, none, and unset; but eventually it will support much more. If you look at the help for **mold**, you'll see that **/all** is TBD (very partially implemented for now), and that's how you create loadable, serialized, data that can safely and easily contain any value (like **redbin** but readable by humans). It helps avoid cases where **none** or **true/false** may load as words. This is also why **construct** evaluates those specific words (including also **on/off/yes/no**), but not others. When loading untrusted data, we have to strike a balance between ease of use and safety.

What do I have to do?

Not much. There are two tools available, which will convert your scripts automatically. The first is small and simple, showing just how powerful Red is, and leveraging its lexer instrumentation. You can find it [here](https://github.com/red/red/blob/master/utils/migration/map-conv.red) (once merged, that branch may go away and the tool will be in the main branch). The second is a more advanced and standalone tool written by @hiiamboris. You can find that [here](https://codeberg.org/hiiamboris/red-cli/src/branch/master/mockups/mapconv).

For the simple script it's ***necessary*** that you run it under a current version of Red's lexer. Once the change is in place, running it under the new lexer will make the exact opposite change. Of course, you can compile it into a standalone EXE, or use Boris' app, which is already available.

To run the simple script from a Red console, you can just:

```
  do https://raw.githubusercontent.com/red/red/master/utils/migration/map-conv.red
```

then you can use **help** **map-conv** to see all the available options. By default it runs in preview mode, making no changes, and showing you all the instances it found, which will be changed if you use the **/save** refinement. A copy of each changed file is created with a .saved extension in the same folder. If you don't want them, you can use the **/no-copy** refinement.

A word of warning, if you run the conversion tools a second time on the same files, they will convert the data back, because they can't know what you're thinking. On the bright side, this is an effective "undo" feature. Still, it's wise to back up your data before running any tools against them.

Thanks to the power of Red, and these tools, there are already PRs pending for updates to docs and community scripts. But the other thing you can do to help is to let us know when you find things that need to be updated for this change, and especially if you run into any issues when converting your own code.

Conclusion

We know changes like this can be hard, but better now than when there is even more code in the wild that would be affected. If we had been any other language, this long-view improvement might not have happened. Only because Red (and Redbol langs in general) can consume their own code as data and have powerful parse and lexing features, was this change so easy and safe. It's still a code-porting process, and if you run multiple versions of Red you may need to maintain separate versions for a while. The other hard part is retraining your hands and eyes to the new syntax.

Happy Reducing!

Posted by Gregg Irwin at [3:37 PM](https://www.red-lang.org/2024/02/important-change-switching-map-and.html "permanent link") [2 comments:](https://www.red-lang.org/2024/02/important-change-switching-map-and.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3619281764431796096&from=pencil "Edit Post")

Labels: [map](https://www.red-lang.org/search/label/map), [migration](https://www.red-lang.org/search/label/migration), [syntax](https://www.red-lang.org/search/label/syntax)

[Newer Posts](https://www.red-lang.org/ "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2024-02-11T15%3A37%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2024](https://www.red-lang.org/2024/) (4)
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2024/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2024/05/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [February](https://www.red-lang.org/2024/02/) (2)
    
    - [0.6.5: Changelog](https://www.red-lang.org/2024/02/065-changelog.html)
    - [Important Change! Switching map and construction s...](https://www.red-lang.org/2024/02/important-change-switching-map-and.html)

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

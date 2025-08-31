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

## March 19, 2025

[]()

### [0.6.6: Memory Management Improvements](https://www.red-lang.org/2025/03/066-memory-management-improvements.html)

This new milestone brings many low-level improvements to Red's memory management and garbage collecting. Most of those are long-planned additions needed to complete the internal memory model and make it robust enough for the future stable Red v1.0.

First, here is a simplified overview of the Red memory model (existing parts in green color, new parts in orange, non-Red parts in blue):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiUovettUfTXeVOZ6eocd-ysUvfOQT-8wnpAp48DsXQt46Q4rhZrYABsfR1rXmyNba_ACReO-eVszLxGpBBwjn9wC8TJKeuK3NOU7i4WLueoR5k92IW1dovnHV5q55poRQhDXkGNE5oalUVVdHxW9rYvvnL9xpERqsUVVU0nJ0XHNhfJwDkfxbWwk8mOU0v/s16000/Red-memory-model.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiUovettUfTXeVOZ6eocd-ysUvfOQT-8wnpAp48DsXQt46Q4rhZrYABsfR1rXmyNba_ACReO-eVszLxGpBBwjn9wC8TJKeuK3NOU7i4WLueoR5k92IW1dovnHV5q55poRQhDXkGNE5oalUVVdHxW9rYvvnL9xpERqsUVVU0nJ0XHNhfJwDkfxbWwk8mOU0v/s554/Red-memory-model.png)

All Red values are stored in series. Some Red values require one or more buffers to hold their content. The values can never reference a buffer directly, but only through a node reference, to enable relocation when expanding the series buffer or when moving it around during compaction by the GC.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjLn6v2UlcxdNnVaim7UZD_vzpsZdyuxuaOZ4ddwcCUsM0ezVI5McIHkuOc9LSltUJ6xM6pYcszXWFE8Evwxez0TEBgISYyZ-PrKpdLkR91sSuA7I_4p5h0fFbX2oxn7k1SIk2Q57InG9SKMcM0w9rF1kUVtKt3VWVnmVjD-rj0h4zA8gMmt9i4UW9twFND/s16000/Red-memory-model3.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjLn6v2UlcxdNnVaim7UZD_vzpsZdyuxuaOZ4ddwcCUsM0ezVI5McIHkuOc9LSltUJ6xM6pYcszXWFE8Evwxez0TEBgISYyZ-PrKpdLkR91sSuA7I_4p5h0fFbX2oxn7k1SIk2Q57InG9SKMcM0w9rF1kUVtKt3VWVnmVjD-rj0h4zA8gMmt9i4UW9twFND/s502/Red-memory-model3.png)

Now let's dive into the hairy details!

### External resources GC

The Red/View engine backends rely on external resources provided by the OS. Among those resources, some are linked to **face!** or **font!** object and require special care when those objects are not reachable anymore. So far, our GC (Garbage Collector) was not able to release such resources (images bitmap buffers and fonts handles), as unreachable Red aggregate values are seeing as simple series during the sweeping GC stage. In order to improve that, we have added an [external resources manager](https://github.com/red/red/blob/master/runtime/externals.reds), that will track and free unused resources, allowing now unrestricted images and fonts usage!

### Accurate GC

The Red GC relies on allocated memory walking and native stack scanning to identify live Red values. Scanning the native stack can be challenging. The [scanner](https://github.com/red/red/blob/master/runtime/collector.reds#L811) used so far a [conservative](https://en.wikipedia.org/wiki/Tracing_garbage_collection#Precise_vs._conservative_and_internal_pointers) approach, which is simpler, but can lead to corruptions or crashes in rare cases (e.g. a floating point number being mistaken for a series or node pointer). Moreover, such approach precluded from having a nodes frame GC, as there was no way to accurately identify node pointers on the stack. This is now solved. The plan was always to make it *precise* when getting closer to a Red v1.0 and that's what we did in this release.

In order to achieve that, several key additions were made:

➤ Frame records hints: the R/S compiler now generates a map of hints for arguments and local variables which are series/nodes pointers, using bit arrays stored in the .data segment and retrieved during scanning. In order to match a call frame on stack to the right bitmap array, an offset is now pushed on stack by each function call as part of their prolog sequence. Only the stack slots corresponding to 1's in the bit array are analyzed further to identify their origin series/node frame, then marked and stored in an list for the collector to later update them if needed. The bit arrays are compressed using our [CRUSH](https://ccsenet.org/journal/index.php/mas/article/view/0/37289) algorithm [implementation](https://github.com/red/red/blob/master/runtime/crush.reds), so that, e.g. for the GUI console executable, all bit arrays add only about 3472 extra bytes to the final executable.

➤ Variadic hints (typed vs untyped): for variadic functions, the bit array is [dynamically created](https://github.com/red/red/blob/master/runtime/collector.reds#L773). If the **typed** mode is used, an accurate bitmap is produced. If the generic untyped **variadic** mode is used, all the arguments stack slots will be marked for processing. This could, in theory, create false positives, but in practice, in Red's runtime code, all such cases are safe, referencing only Red values.

➤ Optimized pointers identification performance: each extracted pointer from the stack needs to be confirmed to be a valid series or a node pointer. Such checking is [now achieved](https://github.com/red/red/blob/master/runtime/collector.reds#L58) using cached sorted lists and binary search, ensuring vastly faster operation.

➤ Optimized frame walking by skipping non-Red frames: the stack scanning is done by jumping between call frames, relying on the saved frame pointer in each frame to chain the frames. However, when R/S callback functions are invoked by external (mostly OS) code, those external frames should be skipped to avoid false positives and for sake of performances. Now the scanner identifies which call frames are part of Red's code segment and skips the rest. However, one last hurdle remains, the dreadful compilation option in C compilers where the frame pointer is omitted in call frames (e.g. -fomit-frame-pointer in gcc). In such cases, walking the stack by dereferencing frame pointers is not an option anymore. The workaround is to save an extra "last known Red frame" pointer before calling any external code, which is then used by the scanner to jump over external code directly into the parent Red frame.

### Node frames compaction

The GC is now capable of reclaiming node frames where the number of used slots is very low. It was, until now, a cause of memory leaking for long-running apps with bursts of high number of series allocations, as new node frames were allocated, but unused (non-empty) ones were never released.

This is now taken care of through a special GC pass that runs when [specific conditions](https://github.com/red/red/blob/master/runtime/collector.reds#L311) are fulfilled, moving live nodes from emptier frames to fuller frames, then freeing the entirely empty frames. The GC is then updating all references to relocated nodes during its marking and stack scanning stages.

In addition to that, the internal structure of node frames was improved. The free slots tracking method was changed from a stack-oriented model, to free slots linked-lists, resulting in doubling the node frames capacity, while keeping constant-time allocation/freeing performance.

### External Red values reference management

Red values can sometimes be referenced by external non-Red code. The View engine relies on that and was storing copies of face object values inside external OS structures in order to be able to retrieve them on OS-generated events that would trigger Red callbacks. Such practice is not reliable and not compatible with the new node GC, as some node pointers could be stored away from the GC reach. So a new external values [management system](https://github.com/red/red/blob/master/runtime/references.reds) was introduced to only export a reference (an array index used as ID) to external code and keep all values inside Red series. The View backends were modified accordingly to rely on those references instead of copying the face object values.

That sub-system could in the future also be used for libRed external values management, to replace the ring buffer used there, which is functionally almost identical but now redundant.

### Low-level allocations tracking

The Red runtime code sometimes has a need for allocating memory regions which last until the end of the Red process or need to be kept away for the GC. For that purpose, Red relies on **malloc** for such use-cases, just importing it from C library. Instead of a direct mapping, it now uses a thin layer on top of it in order to track all allocations providing extra features:

➤ Freeing of all system allocated memory regions on Red exit. This is not strickly needed for Red runtime, but allows to track possible leaks (rare case as most of such allocations are permanent).

➤ Ability to gather stats about such allocations (reported in **show/info** in "allocated on heap" part).

➤ Buffer overflow detection in debug mode using [guard barriers](https://github.com/red/red/blob/master/system/runtime/heap.reds#L19) at the tail of allocated buffers and checked on freeing for possible overflows.

➤ This layer is part of the R/S runtime, so available to R/S code too.

### Other Changes

➤ **stats** native improvements: **/info** has been extended to contain also total allocated from OS and allocated memory from heap (see above). **/show** refinement has been implemented to pretty-print all those infos.

➤ Lowered memory allocations in Red runtime at start (about 1MB gained in total).

➤ Memory frames integrity [auto-testing](https://github.com/red/red/blob/master/runtime/collector.reds#L1097) in debug mode (only node frames for now).

➤ Handle! values now hold a [sub-type](https://github.com/red/red/blob/master/runtime/datatypes/handle.reds#L16), revealed by **mold/all** (for debugging purposes):

```
    view [b: button "Hi!" [print mold/all b/state/1]]

    #[handle! 030A063Eh window] 
```

➤ Now the final buffer is preallocated internally for **insert** and **append** calls with **/dup** refinement, resulting in much lower memory usage.

➤ Using **zero?**, with a point3D value was always returning false due to an incomplete copy/paste change. Fixed now.

➤ Out-of-range integer math operations now promote results to float values.

➤ Updated GPIO definitions for RaspberryPi devices. Pi 4 should be supported, but untested yet. Pi 5 not yet supported (should be updated soon).

➤ Camera widget: now viewport aspect ratio is honored regardless of the container face size. Viewport is now centered and black bars are added if needed to fill the container face. A [%camera-resize.red](https://github.com/red/red/blob/master/tests/camera-resize.red) script is provided for testing.

➤ Toolchain: --view &lt;engine&gt; [compilation option](https://github.com/red/red/blob/master/encapper/usage.txt#L58) added to force a different View engine than the default one for the target.

➤ 47 [tickets closed](https://github.com/red/red/issues?q=is%3Aissue%20state%3Aclosed%20milestone%3A0.6.6) with a fix since 0.6.5.

➤ Stable releases are back!

### Red/System changes

➤ Added system/lib-image to support libRedRT [image properties](https://github.com/red/red/blob/master/system/runtime/system.reds#L172).

➤ Improved native stack trace reports (frame address, stack records chaining support).

➤ On IA-32 backend, the passive casting mode (no conversion, all bits preserved) between integer! and float32! (as \[integer!|float32!]keep)now returns the correct results.

### What's next?

Next release (should be 0.7.0) will feature the full async IO support we are all waiting for! There are also other major features we're working on which probably will be released after 0.7.0.

In the meantime, enjoy this release!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [5:11 PM](https://www.red-lang.org/2025/03/066-memory-management-improvements.html "permanent link") [9 comments:](https://www.red-lang.org/2025/03/066-memory-management-improvements.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1071361973518362744&from=pencil "Edit Post")

Labels: [GC](https://www.red-lang.org/search/label/GC), [memory](https://www.red-lang.org/search/label/memory)

[Newer Posts](https://www.red-lang.org/ "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2025-03-19T17%3A11%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

Subscribe to: [Posts (Atom)](https://www.red-lang.org/feeds/posts/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [▼](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [March](https://www.red-lang.org/2025/03/) (1)
    
    - [0.6.6: Memory Management Improvements](https://www.red-lang.org/2025/03/066-memory-management-improvements.html)

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

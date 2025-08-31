![Red](https://static.red-lang.org/red-logo.svg)

# Red Programming Language

## Pages

- [Home](http://www.red-lang.org/)
- [About](http://www.red-lang.org/p/about.html)
- [Getting Started](http://www.red-lang.org/p/getting-started.html)
- [Download](http://www.red-lang.org/p/download.html)
- [Documentation](http://www.red-lang.org/p/documentation.html)
- [Contributions](http://www.red-lang.org/p/contributions.html)
- [Roadmap](http://www.red-lang.org/p/roadmap_2.html)
- [Privacy Policy](https://www.red-lang.org/p/privacy-policy.html)

## April 15, 2025

[]()

### [Multiple monitors support](https://www.red-lang.org/2025/04/multiple-monitors-support.html)

Here is a short blog entry just to explain the newly added multiple monitor support to View engine.

### Screen faces

Each connected monitor gets associated with a screen face in **system/view/screens** list. You can check that all monitors have been detected correctly using (two monitors in this case):

```
    >> length? system/view/screens
    == 2
```

Each screen's **/offset** indicates the screen position using [virtual screen coordinates](https://learn.microsoft.com/en-us/windows/win32/gdi/the-virtual-screen). The main screen gets a (0, 0) offset. All other screens are positioned relatively to that, in the same virtual space. Screen sizes are also expressed in virtual coordinates. Screen's scaling factor is exposed in the **/data** facet as a float value.

Monitors properties changes and adding/removing detection are also supported, updating the screens list. Windows present on removed monitors are automatically closed by the OS.

A simple [display-geometry.red](https://github.com/red/red/blob/master/tests/displays-geometry.red) script is provided to show how screen faces reflect the monitors topology in that virtual space:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEifudpJkVNP232X8iOmHWrro67VkP_yUeZGeHq-Z9ji4LU0wP-xU2qdad2kbkQ-SN-3tRmkA5BQCCaITdYdXBlqVwr8tr1RnLeKwO4DumtETIDbXoUZw_vax5l0HTanrl5RkfvOstTaTwRe3RdQCBf9VgdUaCS8ZPjiwzVmPdO7yPfOpId2FwHHSkVCQFrk/w302-h320/Screenshot%202025-04-14%20195306.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEifudpJkVNP232X8iOmHWrro67VkP_yUeZGeHq-Z9ji4LU0wP-xU2qdad2kbkQ-SN-3tRmkA5BQCCaITdYdXBlqVwr8tr1RnLeKwO4DumtETIDbXoUZw_vax5l0HTanrl5RkfvOstTaTwRe3RdQCBf9VgdUaCS8ZPjiwzVmPdO7yPfOpId2FwHHSkVCQFrk/s664/Screenshot%202025-04-14%20195306.png)

That script will also output the screen details in the console:

```
    >> do %tests/displays-geometry.red
    1 - offset: (0, 0) size: (3840, 2160) scaling: 150%
    2 - offset: (1165, 2160) size: (1480, 320) scaling: 100%
```

NB: I am using a little 11.9inch screen below my main display for developing this specific feature, as it takes very little extra space on my desk.

### Red apps on multiple screens

You can now launch Red consoles and apps on any display, the app will open on the screen it was launched from, using the specific scaling value of that screen.

A **get-current-screen** function has been provided to return the current screen (where the mouse cursor is currently located).

When displays have different scaling factor or DPI, View will adjust the window and its content to fit that scaling factor. This also works when dragging a View window between displays with different DPI, the window and its content will resize accordingly.

On Windows, the API View requires, are not supported on pre-Windows8 platforms. So a new  Windows7 compilation target has been added to fallback on an older API that is less accurate and may produce sizing issues.

### Known limitations

\- Screen offsets are using virtual coordinates, but window offsets are in scaled coordinates (using scaling factor). This is a current implementation constraint and a semantics problem, as we express windows content in a DPI-independent coordinate system, which also affects windows geometry.

\- Opening a child window from one screen to another one is currently not supported. It could be achieved manually by forcing a window offset to another virtual space, though the scaled coordinates would make the target offset calculation more complex and will create sizing issues (unless you write a routine that will recalculate all face sizes on the fly).

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:08 AM](https://www.red-lang.org/2025/04/multiple-monitors-support.html "permanent link") [4 comments:](https://www.red-lang.org/2025/04/multiple-monitors-support.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1989246842914237324&from=pencil "Edit Post")

Labels: [monitors](https://www.red-lang.org/search/label/monitors), [screen](https://www.red-lang.org/search/label/screen), [View](https://www.red-lang.org/search/label/View)

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

## June 11, 2024

[]()

### [Text-UI View backend](https://www.red-lang.org/2024/06/text-ui-view-backend.html)

Last year, [qtxie](https://github.com/qtxie) worked on a toy text backend project and submitted a PR for that. After some extra additions and testing recently, it has now been merged even if it is still incomplete, it is usable enough. So, in addition to the shiny GUI backends in Red/View, now we have an old-school [text-based user interfaces (TUI)](https://en.wikipedia.org/wiki/Text-based_user_interface) backend for the View engine!

The new TUI backend has currently a subset of the GUI backends features. Here is an overview:

- [View](https://github.com/red/docs/blob/master/en/view.adoc) [styles](https://github.com/red/docs/blob/master/en/vid.adoc): base, panel, button, check, radio, field, text, progress, rich-text, image and text-list.
- [Draw](https://github.com/red/docs/blob/master/en/draw.adoc) commands: text, line, box, triangle, circle, ellipse (block-based for now).
- [Rich-text](https://github.com/red/docs/blob/master/en/rtd.adoc) supported in Draw.
- Keyboard handling: key-down and key events (which are the same event).
- Mouse handling: disabled by default. Use system/view/platform/mouse-event?: yes to enable it.
- Images support [Truecolor](https://en.wikipedia.org/wiki/Color_depth#True_color_.2824-bit.29) (24-bit RGB) for image rendering if the terminal supports it, otherwise it falls back to 256 colors.
- Timers supported through /rate facet.
- [Facets](https://github.com/red/docs/blob/master/en/view.adoc#face-object) supported: /offset, /size, /text, /image, /color, /data, /enabled?, /visible?, /selected, /flags, /options, /pane, /rate, /para and /draw.
- Flags supported: password and all-over.
- Frames drawing using squared or rounded corners (
- Limited ANSI escape codes support in /text facet, only [Colors / Graphics Mode](https://gist.github.com/qtxie/a5f31ccba82320ac964c311d768149d4#colors--graphics-mode) codes.
- Uses 256 colors for text. It should works fine on most of the terminals.
- Works on the big-3 platforms (Linux, macOS and Windows10/11).

The pre-built CLI console binaries on our [Download page](https://www.red-lang.org/p/download.html) now have View/VID included by default along with the TUI backend. You can use them to test and play with the TUI code examples here and in the [TUI folder](https://github.com/red/red/tree/master/tests/TUI).

To use the TUI backend in your own compiled code, you need to add the two following options in the Red header block:

```
    Needs:  'View
    Config: [GUI-engine: 'terminal]
```

Here are a few examples, starting with a HelloWorld!:

```
    view [text "Hello TUI World!"]

    Hello TUI World!
```

When view is invoked, an event loop is launched. In order to return back to the console prompt, press the Escape key.

Here is an animated example using a progress bar:

```
    view [
        bar: progress 30% rate 10 on-time [
            face/data: remainder (face/data + 10%) 100%
            info/text: form face/data
            info/font/color: random white
        ]
        info: text 4 font-color white "30%"
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUgbU5jcDJE1KVpNg8tnZpohKEMnuFrFgUC-r2v0RJ8nnSlBrGtzD8jnmmfrHWGN94LmctC5XvhmnLN91lgpMK6k_2-EDLjtAtdvHfYMTnXdVFKpY0lxlR6VV5HyCq1gOf_g1G1QXindkhtcRC3X7PrTOLK-EAU0JeduDkvoMLZebcDOgklWSUFzN63KG8/s1600/tui1.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUgbU5jcDJE1KVpNg8tnZpohKEMnuFrFgUC-r2v0RJ8nnSlBrGtzD8jnmmfrHWGN94LmctC5XvhmnLN91lgpMK6k_2-EDLjtAtdvHfYMTnXdVFKpY0lxlR6VV5HyCq1gOf_g1G1QXindkhtcRC3X7PrTOLK-EAU0JeduDkvoMLZebcDOgklWSUFzN63KG8/s270/tui1.gif)

[Spinners](https://github.com/red/red/blob/master/tests/TUI/spinners.red) are also fun to watch:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhFiNoUfLNtVp-n8L6l9pRkrK0hxRhGIA_wPnNv3-arJn2JRb6qG8FIVxXpQBVRV4wME8BNFiz6l3eIrDturOY7WYhWUpAADVdrXUtM2cUvPDaTGIlhTn3CBvrODG_D99_GaSQNXOwZ7mGi3tSiUyqWFac1ye6la24CK9xRA-mlsNJ5mRjmKpx8Kyt0iMU1/w400-h127/tui-spinners.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhFiNoUfLNtVp-n8L6l9pRkrK0hxRhGIA_wPnNv3-arJn2JRb6qG8FIVxXpQBVRV4wME8BNFiz6l3eIrDturOY7WYhWUpAADVdrXUtM2cUvPDaTGIlhTn3CBvrODG_D99_GaSQNXOwZ7mGi3tSiUyqWFac1ye6la24CK9xRA-mlsNJ5mRjmKpx8Kyt0iMU1/s701/tui-spinners.gif)

Here is a rich-text example. Press TAB key to switch focus between the buttons. Press Enter key to push the button.

```
    btn-quit: rtd-layout [i/red ["Q"] "uit"]

    view compose/deep [
        rich-text 40x3 transparent data [
            yellow "Hello"  white red " Red "  green "World!^/"
            u "Underline" /u " " s "Strike" /s i " Italic" /i
        ] return
        button "button 1"
        button 4x2 draw [text 0x0 (btn-quit)] [unview]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhN2XitG-JoUoHl2Lvx_jZ_5gDEIEPnx95erunRpu3TuPU1HNgCey6-uStgXBqiNLROj3BaYbk9SxWN-T_93wClZG7E1JnSRmM0dOgsVvvRgN8cue3q29h013kIKFTvRWU0WMFDozWtks9-Lh1qdgpTbpqetG-c4QFjleahzFw0TsFj4N9ZPt7h-HEVbE5E/s1600/tui2.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhN2XitG-JoUoHl2Lvx_jZ_5gDEIEPnx95erunRpu3TuPU1HNgCey6-uStgXBqiNLROj3BaYbk9SxWN-T_93wClZG7E1JnSRmM0dOgsVvvRgN8cue3q29h013kIKFTvRWU0WMFDozWtks9-Lh1qdgpTbpqetG-c4QFjleahzFw0TsFj4N9ZPt7h-HEVbE5E/s242/tui2.png)

An example of mouse support (not all the terminals have mouse support):

```
    system/view/platform/mouse-event?: yes

    view [panel 80x20 [base 11x1 center "drag me😀" loose]]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhDejT9x38LP4nlnK5-L59LH9xFMjWHBG3a9iszAEPDDbrfCNrZ-ePfEGljfU7sDQkq3UEBlAl5Eu_8EhGrse4AtBGF4eC5IQyFBaQHtBayXF-JeLy2Te2JFjJehtU9SbCJ3D-YAsGberXlaYK6T5oPO5YLbEchjmBu7Hh_eHDDdJYxTHF0rFJ4bkdU3aw_/s320/tui3.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhDejT9x38LP4nlnK5-L59LH9xFMjWHBG3a9iszAEPDDbrfCNrZ-ePfEGljfU7sDQkq3UEBlAl5Eu_8EhGrse4AtBGF4eC5IQyFBaQHtBayXF-JeLy2Te2JFjJehtU9SbCJ3D-YAsGberXlaYK6T5oPO5YLbEchjmBu7Hh_eHDDdJYxTHF0rFJ4bkdU3aw_/s438/tui3.gif)

Simulating old-style text interfaces:

```
    view [
        panel navy 40x15 draw [
            pen off fill-pen black box 5x4 36x10
            fill-pen pewter pen black box 4x3 35x9
            pen red text 15x3 "Hello Red"
        ][
            origin 5x5
            rich-text 30x1 pewter data [
                green "Welcome" yellow " to" red " Red "
                u "TUI" /u blue " World!"
            ]
            return
            pad 12x1 button 4 "<OK>" [print "Hi!"]
        ]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjItH03xNe3ehw2DiUBdsfIe_Y7hRBiHIh2vP8HRA7LTSAkvLJuXPE8v8Ke5SiS658wTUlgMCI4UxXvDkMQ2iHaxA1B0rcYpOlMa4LJL_GGHQ3rMkkFbDrISJa0bs1gdVf-q5tbT8C8wYT43LOKc9FOk0u3QeDZI6vQUezcD4_RziGSeFj3AVTbgPY59hs/s320/tui4.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjItH03xNe3ehw2DiUBdsfIe_Y7hRBiHIh2vP8HRA7LTSAkvLJuXPE8v8Ke5SiS658wTUlgMCI4UxXvDkMQ2iHaxA1B0rcYpOlMa4LJL_GGHQ3rMkkFbDrISJa0bs1gdVf-q5tbT8C8wYT43LOKc9FOk0u3QeDZI6vQUezcD4_RziGSeFj3AVTbgPY59hs/s359/tui4.png)

File and folder requesters are also available in TUI, navigation is done using TAB and arrow keys, selection using Enter key:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgi42l0nlw4VcSP9VMcKdsdtafnXpFnYSqjuj2PFqGIuNsqSwRr4B8uSmGoEeZVkflndaByNKbpaABbBEZOkCaDoAxVLXtUuoPv18y-FgEdGpAzykbwDqQwoPi5Y0hE8xCeNVd8GpIuBiVuA3THmEp7xF_PI754Nc4oG57Cm_D1Q19pCO57dbL6A8EKcxnu/w496-h640/tui-req.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgi42l0nlw4VcSP9VMcKdsdtafnXpFnYSqjuj2PFqGIuNsqSwRr4B8uSmGoEeZVkflndaByNKbpaABbBEZOkCaDoAxVLXtUuoPv18y-FgEdGpAzykbwDqQwoPi5Y0hE8xCeNVd8GpIuBiVuA3THmEp7xF_PI754Nc4oG57Cm_D1Q19pCO57dbL6A8EKcxnu/s1069/tui-req.gif)

Images support:

```
    url: https://upload.wikimedia.org/wikipedia/en/e/e9/Red_Language_Tower_Logo.png
    view [image url 32x15]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiNwguyQ2_lj_vlaAwW3AoEuBmSEdP-wIYtRmwo4stSUyYV6VTFa0rQ7U7fFPMrC-JgUXQxkAMbxvkMO_n5AoYO3GZt70JWCUe1BeQBQuIKX6ji6acY2wFGKt56Lrke0dOl9mSp1RIB9Uc_pKkhyr0p7AglCP3x1QU2_nP2-QyIjjaIqkVD_vxud30AJVsX/w200-h196/logo.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiNwguyQ2_lj_vlaAwW3AoEuBmSEdP-wIYtRmwo4stSUyYV6VTFa0rQ7U7fFPMrC-JgUXQxkAMbxvkMO_n5AoYO3GZt70JWCUe1BeQBQuIKX6ji6acY2wFGKt56Lrke0dOl9mSp1RIB9Uc_pKkhyr0p7AglCP3x1QU2_nP2-QyIjjaIqkVD_vxud30AJVsX/s421/logo.png)

Here is the same image displayed in TUI next to the GUI version:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgRimdUEn7uvGEBs6MQNLc_vQx57cj1ch7XTDW3zx26SPI_S8hDdgBMJN_Z4NEQV9w485LKi1zMX92Aereqi_sXcuz696UJ7mAdLoyr8AiFHAZ4YaiPW9U6JW2pyeUZ_La9w1YWH6OUOwz0KzWLu151DDoPcS8doKDHw7eoJvWT5RZk7Pxzr9j3Nu17g7T5/w640-h339/dogs.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgRimdUEn7uvGEBs6MQNLc_vQx57cj1ch7XTDW3zx26SPI_S8hDdgBMJN_Z4NEQV9w485LKi1zMX92Aereqi_sXcuz696UJ7mAdLoyr8AiFHAZ4YaiPW9U6JW2pyeUZ_La9w1YWH6OUOwz0KzWLu151DDoPcS8doKDHw7eoJvWT5RZk7Pxzr9j3Nu17g7T5/s1729/dogs.png)

Some examples of 2D vector graphics using the Draw dialect (currently using only *block* graphics, *braille*-based graphics in the future):

```
    view [
        base 80x40 transparent draw [
            pen orange
            triangle 3x2 18x5 5x15
            fill-pen blue
            circle 30x8 5
            pen off
            fill-pen green
            ellipse 50x2 15x15
            pen brick fill-pen brick
            box 3x20 15x30
            pen gold
            line 20x30 28x20 40x28 44x24
        ]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjiM0aCiz6p6S3vwy-HnrP1rJufE2HtMDPKkX1TLMY3dxmwtyoOgY0SOYdiSYXdbXBL4-a_CRtKSexwPI_hK15DbtTzRxCuouLCyK6PGx1MveWxlpk0zefF5R442CPZ2Ip8E_xWSMhBdhERvW1KVqNLyFax4vi2sSL66BZc5Rh_vhu18szV1L_mB9U2Wr4X/w379-h400/draw.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjiM0aCiz6p6S3vwy-HnrP1rJufE2HtMDPKkX1TLMY3dxmwtyoOgY0SOYdiSYXdbXBL4-a_CRtKSexwPI_hK15DbtTzRxCuouLCyK6PGx1MveWxlpk0zefF5R442CPZ2Ip8E_xWSMhBdhERvW1KVqNLyFax4vi2sSL66BZc5Rh_vhu18szV1L_mB9U2Wr4X/s904/draw.png)

A special mention to group-box widget. It has a couple of new options for the frame style:

```
    border-corners: round | #(none)
    border-color: #(tuple!)
```

Here is a usage example:

```
    view [
        group-box font-color green " Folders " 26x8 options [
            border-corners: round
            border-color: 255.0.0
        ]
        group-box " Files " 26x8
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYC8K6AOj1SHSamgWcz3f3Oqlw87dRJgv40Nar6PTnAsFtF5AV_bpyvuAOwIl4j1fjp9kqPw972TA4OeiHtdn2Kwh0I-UQ8-GU9pGtnYcIYY1PkWJb_epl7g1-r7pPccZF7LLgcEfGfgZcN2X0-HJupbvoEfCi9663QF3XlWmVn81bDgyNgSEhWFf87OuS/w640-h218/tui-borders.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYC8K6AOj1SHSamgWcz3f3Oqlw87dRJgv40Nar6PTnAsFtF5AV_bpyvuAOwIl4j1fjp9kqPw972TA4OeiHtdn2Kwh0I-UQ8-GU9pGtnYcIYY1PkWJb_epl7g1-r7pPccZF7LLgcEfGfgZcN2X0-HJupbvoEfCi9663QF3XlWmVn81bDgyNgSEhWFf87OuS/s726/tui-borders.png)

This TUI implementation is still not on par with our GUI backends. If some of you are motivated to extend and improve it, contributions are welcome! For example, we did not yet implement menus support. If someone is up to the task, please follow the GUI View menu dialect.

What's next?

We are finishing the work on some significant improvements to the Red and R/S memory management sub-systems and garbage collector that will bring them to the level required for a Red v1.0. Those changes will be released in a bumped 0.6.6 version. Those memory improvements are also needed for completing the work on the async IO branch.

Another version bump will follow with the deprecation of the high-level Red compiler and the addition of a new powerful layer to our Red tower of languages. All those changes are pre-requirements to start our work on 64-bit support.

In the meantime, enjoy this new toy!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [4:02 PM](https://www.red-lang.org/2024/06/text-ui-view-backend.html "permanent link") [8 comments:](https://www.red-lang.org/2024/06/text-ui-view-backend.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2496820446235831275&from=pencil "Edit Post")

## May 27, 2024

[]()

### [Red in the real world](https://www.red-lang.org/2024/05/red-in-real-world.html)

We're often asked what Red can be used for, or what apps have been written in Red. Red can be used to write almost anything, but the sparse ecosystem and some missing pieces limit certain use cases. It's used a lot for in-house data processing, custom DSLs, simple GUI apps, and more. We also used it to build Redlake's DiaGrammar product.

When we heard that someone had written a commercial app in Red, we thought that was great news, and we're here to tell you a little about it. Your first question is likely "What is it?" and the second "Where can I get it?". It's an XML processor, and you can find it [here](https://redata.dev/smartxml/). The video on their site goes into detail about use cases and features, so we won't cover that here.

[![](https://blogger.googleusercontent.com/img/a/AVvXsEjtu5lDSUa-8xvcGb1SEY-_5v_MbCvS5BYN-SlbBS5Tz8Ww94PKOkHocQ1oiSnYouOYgkItyQtLSo81OPEmgNmMqEX3m8Sow1Kvhdhcs_VdKi-p2083wsWf0azSQ9zW2EZj6YjLrloyxscRJsnlD-lSddO8kXB2eoO5B4Yq8VvySBTBWUHrLZmn_jxRPAY=w640-h392)](https://blogger.googleusercontent.com/img/a/AVvXsEjtu5lDSUa-8xvcGb1SEY-_5v_MbCvS5BYN-SlbBS5Tz8Ww94PKOkHocQ1oiSnYouOYgkItyQtLSo81OPEmgNmMqEX3m8Sow1Kvhdhcs_VdKi-p2083wsWf0azSQ9zW2EZj6YjLrloyxscRJsnlD-lSddO8kXB2eoO5B4Yq8VvySBTBWUHrLZmn_jxRPAY)

We asked the author to talk about why they wrote SmartXML why those chose Red for the implementation. Here's what they had to say:

* * *

```
Once I encountered the need to parse multiple XML files. I always thought that parsing tasks were very simple and that I wouldn't encounter any difficulties because there are things like XPath and XSD that, as I was told, solve all possible problems. However, I quickly realized that this was not the case, and some tools/standards only complicate life and are of little use for real-world usage. Thus, my XML parser project was born, which would allow working with real data rather than synthetic examples where XPath and XSD are truly effective.

I chose Red because I was tired of the complexity of 90% of modern languages and the constant breaking changes in many of them. If you were to ask me what language I would choose to start a project with, looking back, I would still choose Red or perhaps try to use Hare (even considering that it's not yet completed) simply because I want to be sure that my solution will work in 10 or even 20 years. Initially, I thought I could finish within half a year, but the project took me many years. Nevertheless, I brought the project to completion.

The main idea behind SmartXML was:

1. To make the parsing process as visual and simple as possible.
2. To abandon the use of XSD schemas, which create more problems than they solve.
3. To rethink XPath by creating a replacement that could work with complex structures.
4. To implement the ability to generate SQL from XML.
5. To implement batch processing of files.
```

* * *

And their advice on development in general:

* * *

```
During the writing process, I had a lot of time to think about what constitutes good code and a good product. Here are some of my thoughts that I realized while working on SmartXML:

1. Standard tools have standard problems. And people very often become hostages of such solutions. Most people prefer the shortest, not the most correct path.

2. The time spent on design is directly proportional to the lifetime of the software product. If you spend 10 years thinking about a problem from different angles, you are more likely to come up with an architecturally beautiful and cohesive solution, but maybe not on the first try. The easiest way to make your application 100-200 times heavier than necessary is not to try to think ahead, but to solve problems as they come.

3. You need to have the strength to admit mistakes. Even if they are design mistakes that require rewriting everything from scratch. Sometimes it is wiser to throw everything away and start over than to continue day by day moving into a dead end.

4. Sometimes it's better to do reengineering of the old instead of inventing something new.

5. A language that allows you to write code quickly solves tactical, not strategic tasks. A huge amount of code written in C 30 years ago will still be relevant in another 30 years. Rebol was designed for 20 years, so most of the code on it will still work with minimal modifications in 30 years.

6. Fighting complexity should take as much time as optimizing algorithms. Simple things are always obvious in hindsight. Writing complex code is always easier than writing simple code. Simple code will always be easier to extend and maintain, and it will always have fewer errors.

7. If you can sacrifice 10% of functionality at the cost of removing 90% of code, you should do it.
```

* * *

This application is a great fit for Red, whose \`parse\` function makes processing data easy (as much as XML processing can be) and clearly defined. The latter aspect is important, and often ignored. Can you write code to get that job done, maybe with regexes in this case? Yes. But can you maintain and extend that code? This is where dialects add enormous value. In a use case like this, being able to represent the data in Red format internally, for processing, also makes your life easier.

We thank the author of SmartXML for taking the time to talk about SmartXML with us, and we're excited to see what others do with it. Tell us about your project!

Happy Reducing!

Posted by Gregg Irwin at [7:37 PM](https://www.red-lang.org/2024/05/red-in-real-world.html "permanent link") [6 comments:](https://www.red-lang.org/2024/05/red-in-real-world.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=102033591061716189&from=pencil "Edit Post")

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

## November 22, 2023

[]()

### [Tab Navigation](https://www.red-lang.org/2023/11/tab-navigation.html)

We finally got [tab navigation](https://en.wikipedia.org/wiki/Tabbing_navigation) implemented! You might think it should have been an easy feature to add, but achieving a consistent and controllable behavior across our different native GUI backends is not that straightforward. So we opted for a mixed implementation with a general high-level navigation layer in Red and left [spatial navigation](https://en.wikipedia.org/wiki/Spatial_navigation) handling to each backend, in order to preserve the native behavior as much as possible.

Automatic navigation

By default, pressing TAB key will allow you to navigate to all the GUI widgets in a window, capable of acquiring the focus. Once the last widget is reached, the next TAB press will circle back to the first focusable widget. Conversely, back-navigation can be achieved using Shift-TAB key combination, circling from first face to last one. Here is a simple example:

```
    view [
        text  "Name"     field focus return
        text  "Surname"  field return
        below
        check "Single"
        check "Employed"
        button "Send"
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgSP672DqsfygeuPy2w0YtkQh1etv2inEENXX-8CceewJWfzyp6pKb1AwEEP89mbdyFA4iGWNgmJJ8exYk0lP34PBp5JFy7yN5TcHbLfYxIcB94-IWM5H3PmLHYnflBlSalfSDofZaZySmyQpVlyrw0H2Pt-LaawhxJpF9crHnb1otH37JWnL5w-SyXMgNO/s1600/tab1.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgSP672DqsfygeuPy2w0YtkQh1etv2inEENXX-8CceewJWfzyp6pKb1AwEEP89mbdyFA4iGWNgmJJ8exYk0lP34PBp5JFy7yN5TcHbLfYxIcB94-IWM5H3PmLHYnflBlSalfSDofZaZySmyQpVlyrw0H2Pt-LaawhxJpF9crHnb1otH37JWnL5w-SyXMgNO/s301/tab1.gif)

Note: check-boxes selection/unselection is done using the Space key (default on Windows).

It is possible to make a face "TAB-transparent", so that TAB navigation will skip it in both directions. This is achieved by removing the **focusable** flag from a navigable face. For example, in the following code, clicking on the "Click me!" button will toggle the button's **focusable** flag on and off (using **set-flag/toggle**):

```
    view [
        text "Name"     field focus return
        text "Surname"  field return
        below 
        check "Single"     
        check "Employed"   
        button "Send"
        button "Click me!" 100 [
            face/text: pick ["TAB ignore" "TAB stop"] to-logic face/flags          
            set-flag/toggle face 'focusable
        ]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiz6KH_wGYaOHkipTGplsV2hKYrIESZ3KJSYm98FE4EJJ9tI6gLtG4tDF90bhpOhSKlbXfuggZDYIvVkcE7FNXSomlXqiGBpCuEcT2_I6GiXlXlq4RX6ktsMOo_i7yp4xu25EK7wboKlAeELoIQlBEVeZVc7q01If1gZrXkGbBRrz77mLg3J_3znUUjQ2vF/s16000/tab2.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiz6KH_wGYaOHkipTGplsV2hKYrIESZ3KJSYm98FE4EJJ9tI6gLtG4tDF90bhpOhSKlbXfuggZDYIvVkcE7FNXSomlXqiGBpCuEcT2_I6GiXlXlq4RX6ktsMOo_i7yp4xu25EK7wboKlAeELoIQlBEVeZVc7q01If1gZrXkGbBRrz77mLg3J_3znUUjQ2vF/s354/tab2.gif)

In case of **area** face, the default behavior for TAB navigation means that tab characters cannot be input in the area. In such cases, the alternative Ctrl-TAB key combination can be used to input tab characters. In case the **focusable** flag is removed from an area face, then TAB key will directly produce tab characters. Here is an example:

```
    view [
        text "Name"     field focus return
        text "Surname"  field return
        below 
       	text "Comments" com: area 
        button "Send"
        button "Toggle Area" [set-flag/toggle com 'focusable]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjGmReuDpyW3ziRvmV6qZkQjCewnLGFhAPz0EAuv2sqyqRXlOA_hR-DK9WD2OjuzBPxsE3DFam7XyCVjbpqJ8Wst7hqYuPT-TFsVqQuAFgYyWm4Xwjpk2SSldsUp6IZKtmCDjx_hbOIXlJvL0DCSHP5Kes-3JBQ9WU0aRuP-9P9uaazLaFdRNSY841rgexE/s16000/tab3.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjGmReuDpyW3ziRvmV6qZkQjCewnLGFhAPz0EAuv2sqyqRXlOA_hR-DK9WD2OjuzBPxsE3DFam7XyCVjbpqJ8Wst7hqYuPT-TFsVqQuAFgYyWm4Xwjpk2SSldsUp6IZKtmCDjx_hbOIXlJvL0DCSHP5Kes-3JBQ9WU0aRuP-9P9uaazLaFdRNSY841rgexE/s547/tab3.gif)

Note: when the **focusable** flag is on, Ctrl-TAB is used to input tab characters, when it's off, it's just using TAB key.

Manual override

In some cases, the user can decide to set a different path for keyboard navigation. For each navigable face (the ones with a **focusable**  flag), it is possible to manually define the next and/or previous one when tabbing forth and/or back. In order to do so, **next** and **prev** options can be set to define how tabbing will navigate to the next or previous face.

Here is a simple example where the default navigation is changed to jump into fields marked as invalid or empty (using pink background) after a typical form submission:

```
    view [
        group-box 2 [
            style error: field pink
            text "Name"     field "John"
            text "Surname"  field "Smith"
            text "Age"      error "abc" focus
            text "Address"  error "-"
            text "Zip code" field "12345"
            text "City"     error
            text "Country"  error
        ] return
        btn-send: button "Send"
        do [
            list: collect [foreach-face self [if face/color = pink [keep face]]]
            forall list [list/1/options/next: list/2]
            btn-send/options/next: list/1
        ]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgU4oJ9I0tgZj6-Iye7qYXeflH3pKNKIhelwoGNlq2m5J_gZdVnb4T8rDcCmCzjf-O3Saxt-RMvOLPa9BzDBLF7k_bQE9ICWvw5UyZtaTyF9wncin0HhqppEuK2hLFoHeU7Kcs7vu84SYi9jb9mRw3DnVm45-20J7KIOnXdLObDeLuaWt67QxN6TAD4Z84z/s16000/tab4.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgU4oJ9I0tgZj6-Iye7qYXeflH3pKNKIhelwoGNlq2m5J_gZdVnb4T8rDcCmCzjf-O3Saxt-RMvOLPa9BzDBLF7k_bQE9ICWvw5UyZtaTyF9wncin0HhqppEuK2hLFoHeU7Kcs7vu84SYi9jb9mRw3DnVm45-20J7KIOnXdLObDeLuaWt67QxN6TAD4Z84z/s503/tab4.gif)

Notes:

- For the sake of simplicity in this example, only forward navigation is restricted, backward navigation will visit all focusable faces.
- In the **do** block, **self** refers to the window face, as **do** denotes a global section, not widget-related.
- When **list/1** refers to the last element, **list/2** returns **none**, so it does not point to any specific face. In such case, the default tab navigation will automatically (and conveniently) select the next face, which is the "Send" button.
- The last line is there to connect that last face (the button) to the first face in our restricted list.

Other notable changes

An important change concerns the **insert-event-func** function specification, it now requires a name as argument:

```
    >> ? insert-event-func
    USAGE:
         INSERT-EVENT-FUNC name fun

    DESCRIPTION: 
         Adds a function to monitor global events. Returns the function. 
         INSERT-EVENT-FUNC is a function! value.

    ARGUMENTS:
         name         [word!] 
         fun          [block! function!] "A function or a function body block."
```

The name is an arbitrary word that only needs to be unique, so it becomes easier to check if a given global handler has been installed or not. It also makes it easier to remove it, as it can be referred by name in **remove-event-func**. Existing handler names can be checked using:

```
    >> extract system/view/handlers 2
    [tab field-sync reactors radio enter debug dragging]
```

Please update your code if you have been using those functions.

Enjoy!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:00 PM](https://www.red-lang.org/2023/11/tab-navigation.html "permanent link") [5 comments:](https://www.red-lang.org/2023/11/tab-navigation.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4458754066259059138&from=pencil "Edit Post")

Labels: [GUI](https://www.red-lang.org/search/label/GUI), [navigation](https://www.red-lang.org/search/label/navigation), [tabbing](https://www.red-lang.org/search/label/tabbing)

[Older Posts](https://www.red-lang.org/search?updated-max=2023-11-22T23%3A00%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

Subscribe to: [Posts (Atom)](https://www.red-lang.org/feeds/posts/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [▼](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [▼](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
    
    - [Multiple monitors support](https://www.red-lang.org/2025/04/multiple-monitors-support.html)
  
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

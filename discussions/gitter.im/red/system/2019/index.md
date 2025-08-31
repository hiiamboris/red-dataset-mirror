# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2019

## Tuesday 1st January, 2019

dockimbel

[03:24](#msg5c2add680b7fc97caacd9a17)@meijeru Correct. Emitted code should be a bit more efficient for `case`.

## Saturday 12nd January, 2019

hiiamboris

[09:11](#msg5c39af24ba5936605ba91b29)Is there any way to use R/S functions defined in runtime from a Red program?

gltewalt

[09:18](#msg5c39b0edba5936605ba924e6)Did you try through `routine!` ?

hiiamboris

[09:23](#msg5c39b209ba355012a4275fcf)yes, but it does not recognize any symbols

[09:24](#msg5c39b25b28513d605a1350c5)to start with something simplest (read a constant defined at https://github.com/red/red/blob/master/runtime/allocator.reds#L14):

```
Red []
r: routine [] [print-line COLLECTOR_DEFAULT]
r
```

```
*** Compilation Error: undefined symbol: COLLECTOR_DEFAULT
*** in file: %/D/devel/red/red-exp/1.red
*** in function: exec/r
*** at line: 332
*** near: [COLLECTOR_DEFAULT]
```

dockimbel

[09:32](#msg5c39b42c95e17b45253bcf28)Try adding at the beginning:

```
#system [#include %runtime/definitions.reds]]
```

[09:33](#msg5c39b46520b78635b60edb25)Those macros only exist at compile-time, they don't exist in the runtime.

hiiamboris

[09:34](#msg5c39b4a295e17b45253bd1d7)same result

[09:35](#msg5c39b4cb95e17b45253bd224)well, what I really want right now is `gui/get-text-size`

[09:35](#msg5c39b4fd0721b912a569987e)constants I can convert to numbers if need be

dockimbel

[09:37](#msg5c39b57520b78635b60ee1ca)`COLLECTOR_DEFAULT` is indeed not there, it's in `runtime/allocator.reds`. It should be moved to `definitions.reds`.

hiiamboris

[09:45](#msg5c39b73f35350772cf1b859a)so what about R/S functions? I get different compile time errors when I try to include `gui.reds`, i.e. `-c` gives one error, `-c -e` another, `#system [#include]` and `routine [#include]` are also giving different errors

[09:47](#msg5c39b7bbba355012a4277e36)my test script:

```
Red [Needs: View]

; #include %modules/view/backends/platform.red
#system [ #include %modules/view/backends/windows/gui.reds ]
r: routine [] [
	print-line as handle! :get-text-size
]
r
```

dockimbel

[09:48](#msg5c39b7e032a8370605bbda13)@hiiamboris `gui.reds` is already in the runtime when you declare `Needs: View`.

hiiamboris

[09:49](#msg5c39b82a0721b912a569aa16)

```
Red [Needs: View]
r: routine [] [print-line as handle! :gui/get-text-size]
r
```

```
Compiling to native code...
*** Compilation Error: invalid path value: gui/get-text-size
*** in file: %/D/devel/red/red-exp/1.red
*** in function: exec/r
*** at line: 332
*** near: [pointer! [integer!] gui/get-text-size]
```

[09:49](#msg5c39b8389fa58135b5527dba)anything under `gui/` context is invalid to it

dockimbel

[09:53](#msg5c39b9348318994524d89787)It works here if it is compiled in release mode. For the dev mode, only a small part of the runtime API is exported (the one needed by the compiler, the console, and a few very commonly used functions).

hiiamboris

[09:59](#msg5c39ba86ba5936605ba963aa)wow! thanks

dockimbel

[10:00](#msg5c39bacbba5936605ba96525)The exported API in libRedRT can be found here: https://github.com/red/red/blob/master/system/utils/libRedRT-exports.r

[10:01](#msg5c39bafd9fa58135b5528e39)You can add your own exports there temporarily if you really want to use the dev mode (`-c`).

hiiamboris

[10:03](#msg5c39bb6ecb47ec30002f3543)yaay! it's working :)

[10:03](#msg5c39bb7c1cb70a372ac73a86)what's the format of libRedRT-exports?

dockimbel

[10:04](#msg5c39bbc728513d605a13860d)First block is a list of exported functions, second block is a list of exported variables with their type.

hiiamboris

[10:09](#msg5c39bcdd20b78635b60f0e0e)do I have to modify `libRedRT-include.red` as well? it seems to match the namespaces

dockimbel

[10:11](#msg5c39bd3a0721b912a569c877)No, that's an auto-generated file. You should use `red clear` to force the refresh of libRedRT file when the export list, or the runtime code is modified.

hiiamboris

[10:15](#msg5c39be328318994524d8be95)`*** libRedRT Error: definition not found for red/gui/get-text-size`

dockimbel

[10:17](#msg5c39bea020b78635b60f18d7)Hmm, that might not work indeed, as View is a module and not part of the core runtime...

hiiamboris

[10:17](#msg5c39bea0ba5936605ba97cd4)nvm, too much trouble

dockimbel

[10:17](#msg5c39bec1cb47ec30002f4a51)Try `exec/gui/get-text-size`. `exec` is an internal context created by the compiler for the user code. IIRC, modules should also be wrapped in that context.

hiiamboris

[10:21](#msg5c39bf950721b912a569d698)

```
*** Compilation Error: invalid definition for function red/gui/get-text-size: [return: [exec/gui/tagSIZE]]
*** in file: %/D/devel/red/red-src/red/redexplorer.red
*** at line: 332
*** near: [
    #import ["libRedRT.dll" stdcall [
            get-text-size: "gui/get-text-size" [face [red/red-object!] str [red/red-string!] hFont [pointer! [integer!]] pair [red/red-pair!
] return: [exec/gui/tagSIZE]]
        ]]
]
```

[10:21](#msg5c39bfa6ba5936605ba98239)some kinda bug?

dockimbel

[10:35](#msg5c39c30632a8370605bc1c17)No, `tagSIZE` struct is only defined in the View module, inside libRedRT, so it's unknown in the main app that is importing the libRedRT API. I guess the only working option is the release mode.

hiiamboris

[10:37](#msg5c39c37032a8370605bc1ee5)okay, thank you!

dockimbel

[10:37](#msg5c39c37c1cb70a372ac76c0c)Though, that `get-text-size` function is called by the high-level `size-text`, why not use that one?

hiiamboris

[10:38](#msg5c39c3b3116bc43001f47134)I wanted a non-rounded &amp; non-scaled result from it (it saves it into a pair)

[10:39](#msg5c39c3f628513d605a13b966)Actually, let me bring it to your attention...

[10:41](#msg5c39c44b1cb70a372ac77256)`size-text` is measuring the \*actual* text size in a \*specific window\*. `para` settings apply, window width applies, etc, etc. It's good and useful and all, but! It's totally useless when I want a single character cell.

[10:42](#msg5c39c48b20b78635b60f3c60)In fact, since `draw` uses much more simple text rendering routine, `DrawText` that has no idea of the word 'formatting', so any result of `size-text` is incompatible with `draw [text ...]`.

[10:43](#msg5c39c4c339596c372bcc7f4e)I'm just saying that there's a need sometimes to know how much space `draw [text ..]` will occupy and no built in means for that.

[10:44](#msg5c39c5020999400604db6555)Keep it in mind for future design decisions ☺

dockimbel

[10:52](#msg5c39c70439596c372bcc8dac)&gt; It's totally useless when I want a single character cell.

That's not clear. Do you mean that `size-text` does not work if you size a string of length 1?

[10:59](#msg5c39c87c1cb70a372ac78f2b)You should be able to use `size-text` on an invisible face to measure the size of `draw [text ...]`, as long as you provide the same font specifications. Otherwise, you can also try switching to rich-text mode in draw, and then `size-text` can return you the accurate text size from the rich-text face.

hiiamboris

[10:59](#msg5c39c8859fa58135b552df92)Yes. It's useless because of:  
1\) it scales results by DPI and then rounds them  
2\) it measures text inside the window, which seemingly takes into account a few pixels of padding  
3\) DrawText/GetTextExtentPoint is generally incompatible with higher level GdipMeasureString because of different metric algorithms, different font types (ClearType, Antialias on/off etc.), different proofing method for the same antialias mode...  
4\) lower level funcs are not constrained by the face width, the do not care about it at all (and so is `draw`), but `size-text` does (no problem for 1 char, but due to (1) I have to measure a 100x100 char array)

dockimbel

[10:59](#msg5c39c89832a8370605bc3b18)@qtxie probably has more insights to share on that topic.

[11:02](#msg5c39c95f95e17b45253c4ed0)So `size-text` does not have the same behavior for a one-character string and a string of two or more characters?

hiiamboris

[11:04](#msg5c39c9b2116bc43001f4942e)Yes, that in particular:

```
>> s: system/view/screens/1
>> size-text/with s "x"
== 12x17
>> size-text/with s "xx"
== 19x17
>> size-text/with s "xxx"
== 27x17
```

[11:05](#msg5c39c9deba355012a427eb23)The whole story about it is here: https://github.com/red/red/issues/3336

[11:06](#msg5c39ca1ecb47ec30002f9599)After that I also modified size-text to be more high level, like on MacOS backend, so it understands multiple lines now and formatting.

[11:06](#msg5c39ca5095e17b45253c541d)But the core issue remains, `draw` using different methods of output remains unpredictable.

[11:08](#msg5c39cabc1cb70a372ac79bac)And it's the simplest of cases, where the font is fixed-cell...

[11:09](#msg5c39cacf20b78635b60f64da)@dockimbel I didn't know btw that `draw` has a rich text mode. Is there any info on it?

dockimbel

[11:11](#msg5c39cb7f95e17b45253c5d56)From your ticket:  
&gt; So now there's no reliable solution to determine the glyph size of a fixed-size font

`size-text` was never meant for that anyway. It's returning the size of a given string as displayed on screen (taking into accountfont, para, ...).

[11:12](#msg5c39cb990999400604db8d7c)https://github.com/red/red/wiki/%5BDOC%5D-Rich-Text-support

[11:12](#msg5c39cbb235350772cf1c05b6)This doc should have been cleaned up and merged into the official doc in 0.6.4 release...

hiiamboris

[11:13](#msg5c39cbefba5936605ba9d161)&gt; was never meant for that anyway

I understood that later :)

[11:14](#msg5c39cc339fa58135b552f664)`text-box-metrics` is using D2D functions, so it again will be different from plain `draw [text]`

[11:20](#msg5c39cd8939596c372bccb5f6)

```
>> f: make-face 'rich-text
== make object! [
    type: 'rich-text
    offset: none
    size: 150x150
    text: n...
>> f/draw: [text 0x0 "A"]
== [text 0x0 "A"]
>> f/text: none
== none
>> size-text f
== 0x11
```

Great :) Got a zero-width string

qtxie

[11:21](#msg5c39cdc932a8370605bc5d0a)@hiiamboris @dockimbel I was thinking add a refinement to `size-text/pixel`, it will return text size in pixel.

hiiamboris

[11:23](#msg5c39ce1f32a8370605bc6126)@qtxie Good idea, but it won't solve problems (2)-(4)

qtxie

[11:23](#msg5c39ce4d8318994524d921c6)@hiiamboris Did we change the text drawing function to GDI+? If not, we can change it, so the drawing function and the measuring function are in the same system.

hiiamboris

[11:25](#msg5c39cec1ba5936605ba9e1f1)Yes, `base` is drawn with GDI+. All in all, GDI+ is by far better at predicting face's text size. Not totally compatible, but in most applications being off by 1-2 pixels is okay.

[11:26](#msg5c39cef2cb47ec30002fb473)`draw` still uses GDI.

[11:28](#msg5c39cf6a0721b912a56a3b64)See my comparison btw https://github.com/red/red/issues/2503#issuecomment-447576716

[11:30](#msg5c39cfd828513d605a14004d)

```
view/no-wait [f: rich-text]
f/draw: [text 0x0 "A"]
```

Just 2 commands and GUI console becomes totally shot in the head ;)  
Worth making an issue?

qtxie

[11:30](#msg5c39cfe90721b912a56a3e25)We use GDI+ in draw, but just for image context. I think it's OK to use GDI+ for face too.

dockimbel

[11:32](#msg5c39d03cba5936605ba9ec60)@hiiamboris Your usage of rich-text is incorrect there, a rich-text face object should be at the place where `"A"` is.

[11:32](#msg5c39d06a0999400604dba7f2)@qtxie Do we have any rich-text examples in the %red/tests folder, I can't find any? I also can't find your old examples for rich-text...

hiiamboris

[11:35](#msg5c39d0faba355012a4281a70)Well, the doc above said: `: a string, or a rich-text face object with a rich-text description in single-box mode.` Not implemented?

qtxie

[11:36](#msg5c39d138116bc43001f4c1b5)@dockimbel I remember toomasv create one, not sure where it is.

dockimbel

[11:37](#msg5c39d17539596c372bccce29)@hiiamboris It is just the extended copy of the `text` command description. `a string` is the existing default behavior of `text`. The added behavior is the rich-text face.

[11:38](#msg5c39d1a7cb47ec30002fc3a3)@qtxie Can you find your old examples anywhere?

hiiamboris

[11:41](#msg5c39d2818318994524d9383b)!\[](https://i.gyazo.com/3d732c5d3aa63a5cd08d17fd6bd02709.png)

[11:42](#msg5c39d292cb47ec30002fca94)`g` is `draw: compose [text 0x0 f]`

dockimbel

[11:42](#msg5c39d2ab35350772cf1c2e07)

```
lisp
f: make-face/spec 'rich-text ["A"]
view/no-wait compose/deep [rich-text draw [text 0x0 (f)]]
probe size-text f
```

hiiamboris

[11:43](#msg5c39d2e90999400604dbb758)nice magic :+1:

dockimbel

[11:44](#msg5c39d32735350772cf1c3211)So basically, you wrap the rich text into a `rich-text` face, and you use that in Draw instead of a string.

hiiamboris

[11:45](#msg5c39d36835350772cf1c3385)`f: make-face/spec 'rich-text ["A"] probe size-text f` this also works

[11:46](#msg5c39d37f35350772cf1c3476)I think you meant it like this:

```
f: make-face/spec 'rich-text ["A"]
view/no-wait compose/deep [q: rich-text [text 0x0 (f)]]
probe size-text q
```

but it says `0x11`

[11:46](#msg5c39d3a335350772cf1c35ba)Moreover,

```
>> q/text
== none
>> q/draw 
== none
```

dockimbel

[11:48](#msg5c39d3f9cb47ec30002fd510)Still not right, yes...

[11:50](#msg5c39d498116bc43001f4dced)We don't have any example of how to use the multi-box mode...

hiiamboris

[11:51](#msg5c39d4b520b78635b60fa794)...and it's not working with `size-text` anyway...

dockimbel

[11:52](#msg5c39d4fe116bc43001f4df7c)@hiiamboris It's not related to `size-text`, the rich-text face properties are somehow wrong.

[11:53](#msg5c39d52ccb47ec30002fdb70)This code should be working, but displays no text:

```
f: rtd-layout ["A"]
view/no-wait compose/deep [rich-text [text 0x0 (f)]]
```

qtxie

[11:54](#msg5c39d56028513d605a142212)@hiiamboris

```
view/no-wait [f: rich-text "A"]
probe size-text f
```

hiiamboris

[11:54](#msg5c39d56c0721b912a56a5b42)But in my example above I followed the docs:

```
view/no-wait [f: rich-text "A" g: rich-text]
g/text: none  g/draw: compose [text 0x0 (f)]
```

And it displays the text, but size-text returns 0x11 for `g`

dockimbel

[11:55](#msg5c39d5bcba355012a4283905)@hiiamboris IIRC, that's wrong, the rich-text face inside Draw needs to be specific for each `text` command, it cannot be a displayed face like `f`.

hiiamboris

[11:56](#msg5c39d6089fa58135b55330f5)

```
>> f: make-face/spec 'rich-text ["A"] view/no-wait [g: rich-text] g/text: none g/draw: compose [text 0x0 (f)] size-text g
== 0x11
```

dockimbel

[11:58](#msg5c39d668ba355012a4283de3)What a mess...

qtxie

[11:59](#msg5c39d6a20721b912a56a61e3)That's correct. `g/text` is none... Why do you measure `g` instead of `f`?

hiiamboris

[12:00](#msg5c39d6d8ba355012a4284050)@qtxie From https://github.com/red/red/wiki/\[DOC]-Rich-Text-support  
&gt; /text (none!): this facet must be set to none in order to enable this \[multi-box] mode.

dockimbel

[12:00](#msg5c39d6f028513d605a142bbf)I can't make the multi-box mode work either...

[12:02](#msg5c39d751ba5936605baa1894)Finally:

```
f: rtd-layout [red "A"]
view/no-wait compose/deep [rich-text draw [text 0x0 (f)]]
size-text f
```

hiiamboris

[12:03](#msg5c39d782cb47ec30002fe6af)you meant `size-text r` ?

dockimbel

[12:03](#msg5c39d7928318994524d958f2)No, that was a typo.

hiiamboris

[12:03](#msg5c39d7addab15872ce817019)what's the point of the 2nd line then?

dockimbel

[12:05](#msg5c39d8068318994524d95b72)In multi-box mode, the `rich-text` can contain several different rich-text paragraphs, each defined as a face argument to `text`.

hiiamboris

[12:06](#msg5c39d82c95e17b45253cac19)but you're measuring only `f` paragraph here

dockimbel

[12:06](#msg5c39d82d35350772cf1c5197)`rtd-layout` compiles the RTD dialect to a proper face that can be used in multi-box mode.

[12:06](#msg5c39d848cb47ec30002fec17)I am measuring the size of `"A"`.

hiiamboris

[12:06](#msg5c39d85828513d605a143326)this is enough:

```
>> f: rtd-layout [red "A"] size-text f
== 6x11
```

dockimbel

[12:07](#msg5c39d88f20b78635b60fc35a)Oh, I thought that the face needed to be displayed first... haven't touched rich-text since more than a year...

qtxie

[12:09](#msg5c39d8ed9fa58135b55343c9)@hiiamboris When using it in draw, rich-text is a graphic object (not a face), just like `circle`, `box`, `image`, etc. It can be measured standalone, no need to be associated to a face.

[12:11](#msg5c39d95d95e17b45253cb30c)So if the face is a canvas, you can draw many `rich-text` on it, just like you can draw many `circles`.

[12:12](#msg5c39d9c61cb70a372ac7fdf6)IIRC, when using it as a graphic object, you can also set the size of `rich-text` to 0x0, that means no bounding box for rich-text.

dockimbel

[12:13](#msg5c39d9f239596c372bcd01fc)We need a proper documentation for rich-text usage, the wiki page is only a spec...

hiiamboris

[12:14](#msg5c39da0f28513d605a143f7b)@qtxie Yeah I understand. I was just pointing out that multi-box is not working with `size-text`. Not that it solves the scaling/rounding problem... Want a new issue about size-text and multi-box? It'll then be the 4th I raise today ☺

qtxie

[12:14](#msg5c39da11dab15872ce8180b3)Yes. with lots of examples. :-)

dockimbel

[12:19](#msg5c39db4795e17b45253cbbf7)For the record, the "paragraph" face is never displayed, but used as a container only for the rich-text info + string to display in one of boxes of the multi-box mode:

```
f: rtd-layout [red "A"]
g: rtd-layout [blue "B"]
f/type: g/type: 'paragraph
view/no-wait compose/deep [rich-text draw [text 0x0 (f) text 0x20 (g)]]
```

[12:20](#msg5c39db749fa58135b553531c)So better call that "inner" face `paragraph` or anything else than `rich-text`, otherwise it becomes very confusing.

[12:22](#msg5c39dbf028513d605a1449d1)I think `rtd-layout` should have a refinement for that, maybe `/box` refinement with a `size` argument, to set the `/size` facet and return a face with `/type: 'box` or `/type: 'paragraph`.

[12:23](#msg5c39dc35ba355012a4286464)@hiiamboris So, rich-text (with underlying D2D) does not return a proper size either?

hiiamboris

[12:24](#msg5c39dc7c1cb70a372ac80db8)@dockimbel it's scaled to DPI just the same. But let me see how closer it is to the `draw [text]` metric...

dockimbel

[12:24](#msg5c39dc9332a8370605bcbb96)

```
lisp
d2d: rtd-layout ["A"]
view/no-wait compose/deep [rich-text draw [text 0x0 (d2d)] gdi: text "A"]

>> size-text d2d
== 7x15
>> size-text gdi
== 12x18
```

[12:25](#msg5c39dcbc0721b912a56a8aa3)(200% scaling factor here)

hiiamboris

[12:32](#msg5c39de73ba5936605baa4827)Unfortunately it's way off, even more than GDI+'s result.

[12:37](#msg5c39df9520b78635b60ff2f0)GDI+ gives about 0.5% bigger horizontal size than GDI's DrawText draws, while D2D gives it ~1% lesser.

[12:38](#msg5c39dfd2ba5936605baa5160)A few dozen characters away it becomes misaligned.

[12:53](#msg5c39e35432a8370605bce19e)Come to think of it, RTD has even more issues. I think does not apply DPI at all or smth.

[12:54](#msg5c39e37c39596c372bcd3e8b)!\[](https://i.gyazo.com/48ff0983c417564962f9c7bb1630fada.png)

[12:54](#msg5c39e3849fa58135b5538bea)

```
f: make font! [name: "Consolas" size: 10 color: red]
s: "" repeat i 100 [append s #"0" + (i % 10)]
r: rtd-layout reduce [copy/part s 50]
r/font: copy f
r/size: 0x0
sz: size-text r
r/text: s
view compose/deep [
	; at 0x0 rich-text 1000x100 draw [text 0x0 (r)]
	at 0x0 rich-text 1000x100 (s) font (copy f)
	at (sz * 1x0) box 1000x100 draw [font (copy f) text 0x0 (skip s 50)]
]
```

[12:59](#msg5c39e4b6116bc43001f54179)`size-text` applies the DPI, but for D2D rendering it's not used. I think that's it.

[13:16](#msg5c39e8b31cb70a372ac853ad)No. Wrong. `box` applies the DPI twice. `base` and RTD only once.

[13:24](#msg5c39ea9b95e17b45253d197a)But what I wanted is to show how D2D is off from GDI:  
!\[](https://i.gyazo.com/cbe747ea7116579d24ef1abdd704e06d.png)

```
f: make font! [name: "Consolas" size: 10 color: red]
view/no-wait [b: base font f]
f: make b/font [parent: state: none]
s: "" repeat i 100 [append s #"1" + (i - 1 % 10)]
r: rtd-layout reduce [copy/part s 50]
r/font: copy f
r/size: 0x0
sz: size-text r
r/text: s
view compose/deep [
	base 1000x100 black draw [
		font (copy f)
		text 0x0 (s)
		font (make f [color: green])
		text (sz * 1x0) (skip s 50)
	]
]
```

[13:25](#msg5c39eae295e17b45253d1b8b)Same applies to GDI+ vs GDI, to a lesser extent. Different metric functions are not interchangeable.

dockimbel

[14:41](#msg5c39fc881cb70a372ac8cea5)Let me get my 3D glasses to look at your screenshot. ;-)

[14:42](#msg5c39fcbd32a8370605bd86c1)@hiiamboris We have planned since a year at least to switch all the Windows backend to GDI+, while waiting for a full D2D one. As we dropped XP support, I hope the transition would be easier now.

hiiamboris

[14:50](#msg5c39fea0dab15872ce825c59)&gt; Let me get my 3D glasses to look at your screenshot. ;-)

:D

dockimbel

[15:09](#msg5c3a03358318994524da78e9)@hiiamboris  
&gt; But what I wanted is to show how D2D is off from GDI:

How about GDI+ vs D2D? How much difference?

greggirwin

[21:36](#msg5c3a5df90721b912a56dc524)This chat should be in the gui-branch room. I'm going to point to it from there, and alert @gltewalt and @toomasv for doc support.

toomasv

[22:06](#msg5c3a64f51cb70a372acb72f7)@greggirwin Thanks for alerting! Late here now. Will look in the morning.

## Sunday 13th January, 2019

hiiamboris

[03:42](#msg5c3ab38a1cb70a372acd4665)@dockimbel it's like this: GDI = 99.5% * GDI = 101% D2D size, so GDI+/D2D = 101.5% (approximate metric comparison for 100 chars)

[10:22](#msg5c3b116ac45b986d1152c05d)Now this really surprised me...  
@dockimbel You'd like to know how GDI/GDI+/D2D handle older fonts ("Courier" this time, it's not a TrueType but a bitmap font)  
!\[](https://i.gyazo.com/d936ac35d8ab6280490c084031dcf45f.png)

[10:23](#msg5c3b119d0721b912a571a543)Unbelievable!

[10:24](#msg5c3b11ee8318994524e0d9b4)I don't know what D2D did with it, but it turned monospace font into a variable width (see how `:` is thin)

[10:26](#msg5c3b126539596c372bd44bef)Here's "Terminal": GDI+ can't even render it  
!\[](https://i.gyazo.com/0cea7dae6e99a0af7c42f79073aac082.png)

[10:28](#msg5c3b12b01cb70a372acf558b)I guess D2D just substitutes any non-truetype font with something of it's own choice.

[10:33](#msg5c3b141232a8370605c40d0e)A few more true type fonts... "Comic Sans"  
!\[](https://i.gyazo.com/560bc6a5f1baf111996e51ab665fd779.png)

"Gputeks"  
!\[](https://i.gyazo.com/c6b89b8ff975df076ead7c1a32ed2756.png)

"Sylfaen" 14pt  
!\[](https://i.gyazo.com/bb4308271cd43dda79885162c77e579e.png)

"Sylfaen" 12pt  
!\[](https://i.gyazo.com/fd4ce838bc0b988bb4f40f609d87a98f.png)

[10:35](#msg5c3b147039596c372bd459ba)So, disregard what I said about 1% error... It's much worse.

pekr

[10:36](#msg5c3b1499ba5936605bb1756d)Should be in the gui related room imo :-)

hiiamboris

[10:36](#msg5c3b14ac0999400604e3492e)Right! Sorry :) Keep forgetting

## Monday 14th January, 2019

ericguedespinto

[18:13](#msg5c3cd14f0999400604ee5bdc)Hello everyone!  
Is there a way to deal with forward declare struct alias (to deal with circular dependency)?  
What I want to do is something like this:

````
nextRel  [ relationship! ]
]```
````

relationship!: alias struct! [  
startNode \[ node! ]  
endNode \[ node! ]  
]  
\`

endo64

[19:02](#msg5c3cdcaadab15872ce940e19)@ericguedespinto I think it is not possible yet (at least as I know), `node!: alias struct! [ nextRel [struct! [ startNode [ node! ] endNode [ node! ] ] ]]` is the way to go.

ericguedespinto

[19:29](#msg5c3ce30a8ce4bb25b8afbc19)thank you!

## Tuesday 15th January, 2019

dockimbel

[05:52](#msg5c3d75150721b912a580bf6e)@ericguedespinto Not supported, as Red/System has a single-pass compiler. You can eventually use macros to workaround that:

```
#define relationship! [ struct! [ startNode [ node! ] endNode [ node! ] ] ]
node!: alias struct! [ nextRel [ relationship! ] ]
```

## Friday 18th January, 2019

ericguedespinto

[15:18](#msg5c41ee3395e17b4525700c4b)Is there a way to check if a word is defined inside a given context in R/S without an undefined symbol error ?

endo64

[19:03](#msg5c422308cb47ec300064e228)in R/S there is only global context and function contexts, and namespaces are compile time only. So what do you mean by `given context`?

ericguedespinto

[19:04](#msg5c42235683189945240ee2b6)I mean namespaces, which basically answers my question... thanks

## Friday 1st February, 2019

rebolek

[08:36](#msg5c540506ca428b064537b5c9)I have simple code:

```
Red/System[]

x: -0.00000008742278

print x
```

When I try to compile it, I get following error:

```
Compiling to native code...
*** Compilation Error: unknown directive .0- 
*** in file: %/home/sony/Code/sint/test.reds 
*** at line: 3 
*** near: [#.0- 8742278 
    print x
]
```

[09:15](#msg5c540e4693fe7d5ac0258ca5)`x: -0.01` is enough to trigger this bug.

hiiamboris

[09:17](#msg5c540e90c2dba5382ec16b90)I can confirm

rebolek

[09:17](#msg5c540ec7454aad4df7d82421)Thanks, reporting.

hiiamboris

[09:18](#msg5c540ece8aa5ca5abf676b13):+1:

rebolek

[09:22](#msg5c540fbcf04ef00644bf6356)https://github.com/red/red/issues/3763

rcqls

[16:10](#msg5c546f65975714406b7a138e)@rebolek confirmed too! Really weird bug ....

rebolek

[16:18](#msg5c54713c7b68f9410254fc43)Some bug in lexer, it probably checks only for 1-9, or something like that, I'll try to write a fix for it, it should be easy.

[16:18](#msg5c547170ca428b06453aa3cb)However it's interesting noone has encountered it yet. -0.01 is not such unexpected number...

meijeru

[16:23](#msg5c54728c8aa5ca5abf6a2012)I wonder how many people are compiling at all. Unless you have routines, interpreting is quite convenient for rapid development.

rebolek

[17:21](#msg5c54800a93fe7d5ac0289be2)Of course it means that not many people are working in Red/System.

rcqls

[18:43](#msg5c549367454aad4df7dbca88)However, the whole red (notably the GTK backend for me) is made in Red/System. But `-0.01`inside red/system code is not something useful indeed from now.

rebolek

[20:37](#msg5c54ae19975714406b7bda27)Ok, I should clarify that, not many people are working \*with math* in Red/System. R/S understands what `-0.01` is, it just can't read it from source code :)

greggirwin

[22:11](#msg5c54c3fd54f21a71a1e2ae47)Aside from mandelbrot-fast, I don't recall much R/S math code. Would be good to work up some demos, which may turn up more bugs.

moliad

[22:14](#msg5c54c4e27b68f94102575c62)We will start doing some work on attempting to use Red for state of the art Neural Network machine learning. We are looking at various approaches, one of them is a native implementation of some of the current RNN and LSTM practices... there may be issues with performances, since these are commonly offloaded to GPU-based solutions, but it may be possible to port C code from another project like Torch or TensorFlow.

[22:16](#msg5c54c5218aa5ca5abf6c5336)since mapping DLLs is relatively easy and complete in R/S I am optimistic to a degree. we'll know in 2-3 weeks time if it pans out in the end.

[22:17](#msg5c54c584454aad4df7dd25d6)thanks to @ldci for some headwork and some tests showing that speed is decent.

[22:20](#msg5c54c6179221b9382dfccef2)advanced matrix stuff we can add as its needed. and maybe even use libs or examples in other languages. I can even build a C compiled shim library to use an optimising compiler's advanced features to interface GPU and vectorized (parralel ALU) instructions

[22:20](#msg5c54c63754f21a71a1e2be15)this way, if the structs are compatible, we just need to manage the data in Red and let C do the heavy lifting for now.

greggirwin

[22:20](#msg5c54c6417b68f9410257645a):+1:

moliad

[22:22](#msg5c54c6b0ca428b06453cfa5a)I'm already doing this kind of work with my graph database (I've tested DB over 5GB in use from Rebol 2, using advanced memory management from the dll).

[22:23](#msg5c54c6c654f21a71a1e2c336)(R2 memory footprint stays below 100mb)

[22:23](#msg5c54c6faceb5a2264f7b7a3d)(and its been runing for 18 months without a single restart with several thousand queries a day).

greggirwin

[22:28](#msg5c54c802f04ef00644c45113)This is why we loved Rebol, and need to carry the torch, burning it even brighter. But the world won't come around to our way of thinking easily.

## Monday 4th February, 2019

ldci

[11:10](#msg5c581d8f7b68f941026c386c)Update for red OpenCV here https://github.com/ldci/OpenCV3-red. Improved for red 0.6.4 compiler;

rebolek

[11:26](#msg5c5821741b62f126509e0fc7):clap:

ldci

[12:54](#msg5c5836199221b9382d1239dd)Update for redCV and red 0.6.4 : https://github.com/ldci/redCV

greggirwin

[20:21](#msg5c589ed8f04ef00644dcc8e6)Thanks @ldci !

## Thursday 7th February, 2019

moliad

[17:18](#msg5c5c685cf04ef00644f6d189)will be testing this in a project with TesseractOCR to improve image quality (and text box detection) sent to OCR

## Saturday 9th February, 2019

ericguedespinto

[06:54](#msg5c5e791bdc3f0523cc84c102)@max Hi Max, what graph batabase engine are you using?

## Monday 11st February, 2019

moliad

[21:14](#msg5c61e5a75095f6660cd96be4)I guess you meant @moliad ;-)

[21:14](#msg5c61e5b1adf6cb0b2ca10901)our own graph database developped in house.

## Wednesday 13th March, 2019

toomasv

[11:29](#msg5c88e97d1c18c82b3c03d285)System-newbe question: How to return a red `string!` value from routine where it is `c-string!`?

NjinN

[11:31](#msg5c88e9f4bf7990126e9702cc)`return as red-string! stack/set-last as red-value! rs-str`

toomasv

[11:59](#msg5c88f09525e4e24c07611bb3)@NjinN Thanks! But:

```
Compilation Error: undefined word red-string!
```

NjinN

[12:00](#msg5c88f0c3bf7990126e97322d)Try the `-r` option

toomasv

[12:00](#msg5c88f0e2bf7990126e973314)Same result

NjinN

[12:03](#msg5c88f1751c18c82b3c0409b9)What？I compile it today, successfully.

[12:06](#msg5c88f22f1c18c82b3c040d71)Take a look at this https://github.com/NjinN/Recode/blob/master/Red/flappyBird/mci-cmd.red

toomasv

[12:27](#msg5c88f7341c18c82b3c043670)@NjinN When I try on little snippet, it works. Something is wrong with my main code. Without `red-string!` it compiles.

9214

[16:12](#msg5c892bd80a6b91516322ffe7)@toomasv

```
foo: routine [
    /local c-string red-string
][
    c-string: "this is a C string!"
    red-string: string/load c-string length? c-string UTF-8
    SET_RETURN(red-string)
]

print replace foo "C" "Red"
```

toomasv

[16:36](#msg5c89318b2f2fb54c37e4819d)@9214 Thanks alot! This worked finally:

```
red-string: string/load c-string length? c-string UTF-8
return as red-string! stack/set-last as red-value! red-string
```

## Friday 22nd March, 2019

BeardPower

[12:19](#msg5c94d2bf8aa66959b6514a5f)Proof that Red can be used for a kernel/OS as well ;-)

[12:19](#msg5c94d2d49d9cc8114a01e788)\[!\[red\_kernel.gif](https://files.gitter.im/red/red/system/uaNN/thumb/red\_kernel.gif)](https://files.gitter.im/red/red/system/uaNN/red\_kernel.gif)

vazub

[15:21](#msg5c94fd945547f77448497ae5)Wow! Do you have a demo repo or something? And has Red been ported to Haiku already? That is something I would be very interested in!

ldci

[15:23](#msg5c94fe0e81b15c5e4b6b7959)Great

BeardPower

[16:55](#msg5c9513838aa66959b6532d7c)@vazub No, it's just a PoC and Red needs some more features to continue on the Kernel. Red has not been ported to Haiku. I just used Haiku for linking the Kernel and demo it with qemu.

Respectech

[18:00](#msg5c9522b549fdaa0d81fb0fd1)@BeardPower I asked for a demo, and there it is!

[18:00](#msg5c9522c849fdaa0d81fb108e)Amazing! How big is the kernel so far (in KB)?

greggirwin

[18:34](#msg5c952ad349fdaa0d81fb4464)Woohoo!

BeardPower

[19:46](#msg5c953b826a3d2e230d0adb85)@Respectech about 10KB.

Respectech

[20:16](#msg5c9542b05547f774484b7239)@BeardPower What bloat! :D

## Saturday 23th March, 2019

BeardPower

[02:23](#msg5c95988b3dd8171149376c32)@Respectech There is a lot of space for optomization ;-)

## Monday 25th March, 2019

ldci

[12:32](#msg5c98ca7852c7a91455f24918)Denoising images with redCV : https://redlcv.blogspot.com

Respectech

[17:24](#msg5c990eb20d7190505763b968)@ldci Nice job!

greggirwin

[18:29](#msg5c991dee0d7190505764232f)Thanks for the update @ldci ! Including convolution kernels in Red's ultimate, standard effect pipeline will be great.

BeardPower

[19:15](#msg5c9928d252c7a91455f52963)@greggirwin Any ETA on that pipeline?

greggirwin

[19:19](#msg5c9929ba8126720abc415d97)It's a low priority right now. We loved it in R2 of course, but using native widgets in Red makes it a bit less valuable.

rebolek

[19:21](#msg5c992a3b2fb6800d807d87b8)I'm not sure what do native widgets have in common with effect pipeline that is used on images.

greggirwin

[20:52](#msg5c993f952fb6800d807e1d24)Effect pipeline for images is still useful, but in R2 it was also very useful for creating a disabled look for buttons and such.

[20:53](#msg5c993fb80d71905057651d7a)Tiling backgrounds is the other thing I used a lot.

## Tuesday 26th March, 2019

BeardPower

[11:22](#msg5c9a0b8f49fdaa0d811b2a09)I prefer non-native buttons to native ones.

[11:23](#msg5c9a0bafd0133e21e51a0197)They are not limiting you in any way.

rebolek

[11:23](#msg5c9a0bbf8126720abc47590d)No, they are limiting you in their special way.

BeardPower

[11:24](#msg5c9a0bdc9d9cc8114a23f0d6)@rebolek Which is?

rebolek

[11:24](#msg5c9a0bedfcaf7b5f731936f1)That depends on the UI toolkit.

BeardPower

[11:24](#msg5c9a0bf15547f774486a918c)You are able to create anything you like.

[11:24](#msg5c9a0c000d719050576a7464)Solution: don't use a UI toolkit.

[11:24](#msg5c9a0c0adfc69a1454fa3ea0)Roll your own.

rebolek

[11:25](#msg5c9a0c1e49fdaa0d811b2c83)Even then you will have to impose some limits.

BeardPower

[11:25](#msg5c9a0c3dd0133e21e51a059c)Which are?

rebolek

[11:26](#msg5c9a0c4d3dd817114953dfbb)That depends on you.

BeardPower

[11:26](#msg5c9a0c5149fdaa0d811b2ef6)It's like saying you are limited when programming in machine code.

[11:26](#msg5c9a0c6752c7a91455fb183a)But your limited skills is not the fault of the machine.

rebolek

[11:26](#msg5c9a0c7fd0133e21e51a0854)You need to set some limits, your button can't realistically be expect do anything.

[11:27](#msg5c9a0c99f3dbbd230cbd03d9)What is Turing complete button good for? :smirk:

BeardPower

[11:27](#msg5c9a0ca28aa66959b673968e)It can, technically wise.

[11:27](#msg5c9a0cbe52c7a91455fb1a58)Turing completeness is not about a limitation of what something can do.

9214

[11:28](#msg5c9a0cce9d9cc8114a23f888)Chit-chat, anyone? :suspect:

BeardPower

[11:28](#msg5c9a0ceaf3dbbd230cbd05dd)It means: computationally universal

[11:28](#msg5c9a0cf0dfc69a1454fa45c1)Sure, boss ;-)

## Friday 29th March, 2019

ericguedespinto

[01:29](#msg5c9d74f7e422d151992dc3d9)hi everybody

[01:31](#msg5c9d758751353e5a4db0e7eb)can someone point me to a tutorial on how to export red-values from RS?

[02:08](#msg5c9d7e38b67112519845d373)for example, how can I return a red-string! from a func in RS

greggirwin

[02:32](#msg5c9d83d5e2245b5109cd3c50)We had a couple examples posted recently. Should get some of this in a wiki page, as it's a common question.

```
return as red-string! stack/set-last as red-value! rs-str
```

```
foo: routine [
    /local c-string red-string
][
    c-string: "this is a C string!"
    red-string: string/load c-string length? c-string UTF-8
    SET_RETURN(red-string)
]

print replace foo "C" "Red"
```

ericguedespinto

[02:33](#msg5c9d840a1f98a87112b9fd19)thanks a lot

greggirwin

[02:35](#msg5c9d8487e2245b5109cd3f9d)I should have noted where it came from, and if there was a preference for one approach over the other. @9214 or @hiiamboris might remember.

9214

[05:43](#msg5c9db0697160b4228531a012)Added a note \[here](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#convert-c-string-to-red-string).

&gt; if there was a preference for one approach over the other

`SET_RETURN(X)` is a runtime macro alias for `stack/set-last as red-value! X`. @toomasv never made it clear why he added `return as red-string!` portion.

toomasv

[07:58](#msg5c9dd025dfcacf510abada88)The reason was it didn't work otherwise. Quite probably I did something wrong (\[here](https://github.com/toomasv/send-keys/blob/master/win-shell.red#L230)), but being very dumb in RS it was the result of lots of T&amp;E.

9214

[08:03](#msg5c9dd14bb7e27d2f05a00add)Ah, I see. Probably because you have `return: [red-string!]` in spec.

toomasv

[10:50](#msg5c9df8911f98a87112bd1892)Should it be done differently?

ericguedespinto

[11:03](#msg5c9dfb6e8df8b02f047cd487)I am getting a cryptic error message when trying to call a R/S code from Red

```
Compiling to native code...
*** Red/System Compiler Internal Error: Syntax Error : Invalid path -- pointer!/ 
*** Where: none 
*** Near:  "(line 1) system/alias/pointer!/[integer!]"
```

This is my Red code:

```
RED [
    title: {graph database frontend}
]

#system[ 
    #include %graph.reds
]

getLabelByNodeId: routine [ id [ integer! ] /local l r ][
    l: graph/getLabelOfNode graph/getNodeById id
    r: string/load l length? l UTF-8
    return as red-string! stack/set-last as red-value! 
]

print getLabelByNodeId 2
```

The R/S code is quite large by on itself compiles and works as expected. The problem is calling it from Red.  
Any suggestions ?  
I am trying to follow the examples but seem to be stuck

9214

[11:07](#msg5c9dfc84a100047111db4308)@toomasv It doesn't make sense to use `return` in a routine and do type casting if you want to pass argument to top-level Red. All what is needed is to allocate a cell on evaluation stack, and this is what `SET_RETURN(...)` does.

[11:09](#msg5c9dfccee422d15199317a47)I might be wrong though, but in your case compiler got angry at the fact that your spec declairs a return type but you don't actually return anything.

[11:10](#msg5c9dfd224de4296efc1ce239)@ericguedespinto I would change the header to `Red [...]` and see if it fixes anything.

[11:10](#msg5c9dfd31dfcacf510abc1efa)All I can say that you have a malformed path somewhere, related to integer pointer.

[11:13](#msg5c9dfdd108f8e7361a68d808)And your `getLabelByNodeId` is missing an argument near `as red-value! ...`.

ericguedespinto

[11:19](#msg5c9dff450b3b8749f4e0f937)Thank you  
None of that worked though.  
The strange thing is that if I call `graph/getLabelOfNode graph/getNodeById 2`from the R/S file it works as expected.  
Since all that the routine is doing is that, I am lost

9214

[11:21](#msg5c9dff9c08f8e7361a68ec2a)Well, it's hard to say anything else without seeing the rest of your code.

rcqls

[11:22](#msg5c9e000ee4561321d05966be)@9214 code of @toomasv does not look like a routine even though it is inside a red file....

9214

[11:26](#msg5c9e0103dfcacf510abc3c47)@rcqls right, my mistake. It's a Red/System function that gets called from routine \[here](https://github.com/toomasv/send-keys/blob/master/win-shell.red#L363), and in that case function indeed need to return an argument to calling routine.

rcqls

[12:12](#msg5c9e0bc56a9761361b2053cc)@9214 Good to know that this possible too, I thought at the beginning that only routine was possible in Red file for calling red/system code.

9214

[12:14](#msg5c9e0c18dfcacf510abc90dc)@rcqls it's possible to write arbitrary R/S code inside `#system` and `#system-global` directives. Their content will be inlined in Red compiler's output as-is.

rcqls

[12:27](#msg5c9e0f4ca100047111dbcf49)@9214 Of course, I know `#system`, since as you know, it is something I see very often when developing Red/GTK and learning the red design by watching red source code. Thanks for the info about `#system-global` less often used inside red source files.

toomasv

[12:43](#msg5c9e130e6a9761361b208913)Thanks guys for explaining this. I probably could (/should have) put everything in routine, but I left it in state where it started to work.

ericguedespinto

[13:23](#msg5c9e1c6edfcacf510abd104c)@9214  
incidentally, I changed #system to #system-global and now I no longer get the malformed path any more...  
I get this

```
*** Compilation Error: undefined symbol: red/string/load 
*** in file: %/Users/eriqueguedespinto/Downloads/graph.red 
*** in function: exec/getLabelByNodeId
*** at line: 332 
*** near: [string/load l length? l UTF-8 stack/set-last as cell!]
```

```
Red [
    title: {graph database frontend}
]
#system-global[ #include %graph.reds ]
getLabelByNodeId: routine [ id [ integer! ] /local l r ][
    l: graph/getLabelOfNode graph/getNodeById id
    r: string/load l length? l UTF-8
    SET_RETURN(r)
]

print getLabelByNodeId 2
```

[13:24](#msg5c9e1ca96a9761361b20cb83)Now it seems no to recognise string/load

[13:25](#msg5c9e1ce64de4296efc1dd07d)using up-to-date build  
system/build  
\== make object! [  
date: 27-Mar-2019/23:57:31  
git: make object! [  
branch...

9214

[13:26](#msg5c9e1cf8aee5b449f3b391d2)@ericguedespinto I don't follow why you put Red/System code outside of `red` context (where runtime is defined) and then expect `string/load` (a runtime function) to work.

ericguedespinto

[13:29](#msg5c9e1dceaee5b449f3b3975e)@9214  
you mean calling string/load inside a routine?  
Sorry, I am trying to follow examples on how to get a string! in Red by calling a R/S func (in this case graph/getLabelOfNode) which returns a c-string!

9214

[13:31](#msg5c9e1e49b7e27d2f05a259ab)@ericguedespinto read \[this](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#using-redsystem-contexts-in-red-routines).

[13:32](#msg5c9e1e896a9761361b20db2a)Also extra info \[here](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes#what-do-system-and-system-global-do-when-used-in-red).

ericguedespinto

[14:08](#msg5c9e26f9e2245b5109d1c7bc)I found a solution, which is to compile with -r option

```
./red -c -r graph.red
```

9214

[14:15](#msg5c9e287ab6711251984a6af2)@ericguedespinto uhm, yes, because, again, usage of any runtime function (like e.g. `string/load`) requires the actual runtime to be present (this is what `-r` flag is for).

[14:15](#msg5c9e28961f98a87112be781e)And `-c` is superfluous in this case.

ericguedespinto

[16:51](#msg5c9e4d29e422d1519933ddae)@9214  
also, I think that using a custom struct named `node!` collided with the runtime, as I found `node!` already defined in unicode.reds  
I changed it to n! as now it seems to work fine (no more malformed path error)  
live and learn...

9214

[16:53](#msg5c9e4d83b6711251984b92c2)@ericguedespinto yep, `node!` is an \[alias](https://github.com/red/red/blob/master/runtime/definitions.reds#L53) for `pointer! [integer!]`, that would explain your first error message.

[16:55](#msg5c9e4dfe8df8b02f047f3e28)And it's a part of global runtime definitions, not `unicode.reds` file. All Unicode code is wrapped in a dedicated namespace, and all definitions inside it cannot possibly collide with anything.

greggirwin

[17:38](#msg5c9e5821aee5b449f3b5481e)@9214 thanks for adding the notes. @ericguedespinto please add more notes to the wiki that might help others. Thanks!

## Monday 1st April, 2019

ericguedespinto

[20:21](#msg5ca272ddb34ccd69e74b2043)Thanks a lot for all the help. This is really a great community.  
While I am trying to figure out how R/S works, I now have another question:  
How does one call a variadic R/S func with `typed` attribute from a routine?  
I am assuming that I would need to convert a series! value in Red to a pointer native array (?) I could then pass as an argument to the R/S func...  
Any more ideas?

9214

[20:28](#msg5ca274601f6e900d5ec0ca1f)@ericguedespinto what are you trying to achieve?

ericguedespinto

[20:30](#msg5ca274fbb34ccd69e74b3115)I have created a func in R/S with a `typed`attribute. I used it as a factory function for creating a specific custom datatype.  
Now I am trying to access that factory function for Red.

[20:33](#msg5ca2757d31aec969e8376c3c)I could recreate the factory function from inside the routine in the Red file, but I am just wondering if there is any good way to call a variadic or typed R/S func from a routine.

9214

[20:38](#msg5ca276cb8148e555b23167a7)Red/System specification has a straightforward example with `typed` argument, see \[p. 6.3.5](https://static.red-lang.org/red-system-specs.html#section-6.3).

[20:42](#msg5ca277a3a0790b29c945dcc0)&gt; I am just wondering if there is any good way to call a variadic or typed R/S func from a routine.

You just... call it?

```
Red []

#system [
    vprint: func [
        [typed]
        count [integer!] list [typed-value!]
    ][
        print ["count: " count lf]
        until [
            print [list/value " : "]
            print [list/type lf] 
            list: list + 1
            count: count - 1
            zero? count
        ]
    ]
]

foo: routine [][
    vprint ["c-string" DEADh #"^(BE)" #"^(EF)"]
]

foo
```

[20:44](#msg5ca27834a0790b29c945e1d5)@dockimbel looks like `form-type` conversion function is missing. Is this intentional?

ericguedespinto

[21:07](#msg5ca27da9a0790b29c946090f)@9214 Thanks!

## Saturday 27th April, 2019

fergus4

[20:05](#msg5cc4b5f48446a6023e889904)Anyone play around with scrollable faces? Examples?

greggirwin

[20:20](#msg5cc4b977e416b84519ef3785)@fergus4 some people have, yes. red/gui-branch is the room to ask.

toomasv

[20:22](#msg5cc4b9eb4b4cb471d96a9232)@fergus4 For simple cases try `flags: 'scrollable`. To build your own scroller see \[here](https://github.com/toomasv/learning/tree/master/snippets/scroller).

fergus4

[20:39](#msg5cc4be03375bac7470172021)Sorry I thought I was in GUI...

## Thursday 9th May, 2019

dockimbel

[15:29](#msg5cd4476f0824230a770719ff)@9214  
&gt; @dockimbel looks like `form-type` conversion function is missing. Is this intentional?

I vaguely remember removing that function a few years ago, as it was not used at all.

## Friday 10th May, 2019

9214

[13:40](#msg5cd57f33f52a2375160afce5)@dockimbel in such case R/S spec need to be updated, since it contains an example with `form-type` usage.

## Sunday 12nd May, 2019

dockimbel

[11:30](#msg5cd803d556271260f94b4e31)@9214 Please open a ticket so we can fix that.

9214

[13:07](#msg5cd81a91b149ca50987b629b)@dockimbel done https://github.com/red/docs/issues/166.

## Tuesday 14th May, 2019

gurzgri

[17:25](#msg5cdaf9fbda34620ff93f3064)I must be missing something very fundamental about Red/System: I just don't understand why in

```
Red [file: %test.red]

#system [test: context [
    worker: func [input [red-string!] return: [red-value!] /local result] [
        result: block/make-in null 5
        integer/make-in result 1
        as red-value! result
    ]
]]

bridge: routine [input [string!] return: [block!]] [as red-block! test/worker input]
caller: function [] [result: bridge "why?" print mold result]

caller
```

`bridge` doesn't return the block `[1]` rather than the somewhat uncalled for string `why?`.

I guess it has to do with how arguments are handled on the Red/System stack. But I didn't manage to find some helpfull explanation in the docs. Any hints here?

9214

[17:39](#msg5cdafd68da34620ff93f4e46)@gurzgri

&gt; I guess it has to do with how arguments are handled on the Red/System stack

You haven't actually passed anything on Red evaluation stack (which has nothing to do with system stack).

```
#system [
    test: context [
        worker: func [input [red-string!] return: [red-value!] /local result][
            result: block/make-in null 5
            integer/make-in result 1
            stack/set-last as red-value! result
        ]
    ]
]
```

gurzgri

[17:55](#msg5cdb010df251e60ffa7fbd40)@9214 So it's called the "Red evaluation stack" - I knew I could only be imprecise here. Of course `stack/set-last`is the missing piece, thank you very much! (You don't happen to known about a doc to learn more about the evaluation stack, do you)?

9214

[18:06](#msg5cdb03a86fd7c11cd8b96714)@gurzgri \[you have some hard homework to do](https://github.com/red/red/blob/master/runtime/stack.reds).

gurzgri

[18:18](#msg5cdb067e79d70050996f025f)@9214 Yeah, I'd expected the answer to be "Use the Source, Luke", I can only learn from that. Thanks for the hint!

## Wednesday 15th May, 2019

dockimbel

[09:11](#msg5cdbd7c456271260f9654520)@gurzgri @9214 There's even the `SET_RETURN()` \[macro](https://github.com/red/red/blob/master/runtime/macros.reds#L323) for that.

9214

[09:55](#msg5cdbe1f98fcdb05d47dc480c)@dockimbel I know, but in this case it was easier just to prepend `stack/set-last`.

hiiamboris

[10:12](#msg5cdbe60079d700509974c8db)Wow that's an obscure practice... So why is it that `func [... return: [integer!]] [as integer! test/worker input]` does the stack magic and even `integer!` to `red-integer!` boxing, while `func [... return: [block!]] [as red-block! test/worker input]` doesn't even do the former?

dockimbel

[11:34](#msg5cdbf956f52a23751636ae0e)@hiiamboris Because `integer!` type exists in both languages, while `block!` only exists in Red.

[11:38](#msg5cdbfa19bdc3b64fcf4da92b)

hiiamboris

[12:18](#msg5cdc03895d48a24fd0d0add3)Still, can't R/S execute stack/set-last on the last value without asking it explicitly?

dockimbel

[12:25](#msg5cdc051e5d48a24fd0d0bb5d)It could. We can have a look at the currently existing routines across some of the biggest Red repos (like RedCV) to see if adding such automatic stack manipulation would benefit or harm those routines.

hiiamboris

[14:33](#msg5cdc231f5a887e1cd9f1513e):+1:

## Saturday 18th May, 2019

Softknobs

[19:56](#msg5ce0636863dea422b4a64c8b)Hi everybody. I am new to Red and Red/System. I have been trying to make some binding to different dlls but it is a lot of trial and error since I don't really know how to map native types to red types. Binding simple apis works fine as long as the types are simple. Binding examples help a bit, but I still have no clue for this case where I have to pass a value by reference in order to retrieve some data.  
In C the call is done like this:

```
midiInGetDevCaps(i, &caps, sizeof(MIDIINCAPS))
```

and MIDIINCAPS is

```
typedef struct {
  WORD      wMid;
  WORD      wPid;
  MMVERSION vDriverVersion;
  TCHAR     szPname[MAXPNAMELEN];
  DWORD     dwSupport;
} MIDIINCAPS;
```

I have tried mapping with a struct! using mostly integer! but when I pass that to the api, my program just seems to crash with no error message. What I mean by crash is that this code:

```
print-line "==== START ====="
winmm-device-names device-id caps winmm-device-count
print-line "====  END  ====="
```

won't write anything to the console, not even the "start" and "end", while calling other APIs .  
Do you have any hint on how I can map theses type with R/S and get debug information?  
Thanks.

9214

[23:19](#msg5ce092e96366992a94e0d32c)@Softknobs

&gt; I don't really know how to map native types to red types

Do not confuse Red with Red/System. Red values are boxed structures of fixed size, and don't have a direct mapping to native C types. Red/System, on the other hand, is C-level language; it has a more limited set of types, compared to C, but you can emulate the missing ones with structs, pointers and some bit-trickery.

&gt; I still have no clue for this case where I have to pass a value by reference

See \[Section 4.8](https://static.red-lang.org/red-system-specs.html#section-4.8) in Red/System spec, which explains how to declare and use pointers. Structs are passed by reference.

&gt; my program just seems to crash with no error message

Start with putting your code in a gist and writing a small example, so we can reproduce the crash and help you. \[Here](https://gitter.im/red/red/welcome?at=5cb759866a84d76ed8ac9939) are some additional resources on R/S to get you started. Additionally, try to compile your program with `-d` flag, and see if it gives you any clues; also, bear in mind that Red is limited to 32-bit at this point.

## Sunday 19th May, 2019

Softknobs

[14:07](#msg5ce1632683ae782aee95594c)Thanks for the hints. I am trying to pass a struct! but I am not sure what types to use for that struct. I have done it like this:  
https://gist.github.com/Softknobs/0e0c39a47640d66cb3b01a9e8a78cc4b  
This code compiles and works fine but goes wrong when I uncomment line 24. I am pretty sure I am doing something wrong but with no error it is hard to debug.  
I also tried using the -d as you suggested but I get an "invalid value" error not matter what I put in the file (even if it is only the Red/System header block. So it does not help in this cases.

9214

[15:29](#msg5ce17666879f4478c7a775b8)@Softknobs I don't have neither any MIDI devices nor any real-world experience with library bindings, so went out in blind mode. See the comment on your gist.

The most obvious mistake is that you use `cdecl` instead of `stdcall` calling convention (which is AFAIK used by Windows API). You also pass integer `1` instead of integer pointer (`uDeviceID`) and number of available MIDI devices instead of `MIDIINCAPS` struct's size (`cbMidiInCaps`).

In my case device count is (obviously) zero, but call to `midiInGetDevCaps` fails with "Can't find DLL entry point" error :confused: \*shrug\*.

hiiamboris

[16:04](#msg5ce17ea3ef853135c8e9e615)`WORD` is 2 bytes, `DWORD` is 4 bytes

[16:08](#msg5ce17f867c363c75a709b92d)you can use \[these macros](https://github.com/red/red/blob/75778d3aff181b7323b3bf0dbe403ec3ace1a8ac/modules/view/backends/windows/win32.reds#L524) to deal split `WORD`s properly

[16:13](#msg5ce180a983ae782aee961eed)Now that I look at them though, I don't consider them \*proper* anymore. Who ever said that `WORD` is a signed value?

Softknobs

[16:38](#msg5ce18688ef853135c8ea2237)@9214 Thank you! Actually cdecl was a test, I started using stdcall. I get the same behaviour with your script ie. the print-line does not display anything when I call midiInGetDevCaps, even if I put code that should print a "access violation" error. Though, I am going to see what you did exactly to understand it better.  
@hiiamboris thank you for pointing out the macros, maybe I can learn from them and understand better how the binding work

endo64

[21:45](#msg5ce1ce900ac9852a9507b54e)@Softknobs @9214 Is `szPname [c-string!]` for `TCHAR szPname[MAXPNAMELEN];` correct? `TCHAR` is not a pointer but `c-string!` is.

9214

[21:54](#msg5ce1d098ef853135c8ec12a3)@endo64 `TCHAR szPname[MAXPNAMELEN]` is an array of `TCHAR` type, that is, a null-terminated string, probably in UTF-16LE format.

hiiamboris

[21:57](#msg5ce1d140ef853135c8ec18a7)I agree with @endo64 . Good observation btw. In a struct it should be a 32-char (64-byte) field. (32 = MAXPNAMELEN)

endo64

[22:05](#msg5ce1d3419d64e537bcd92fb9)Yes, `szPname` is an in-place array in the struct, it should not be a pointer to a char array, hence it should be `byte-ptr!` to an already initialized memory. No?

hiiamboris

[22:07](#msg5ce1d3a313e9854e33320365)See how gracefully it is handled by R/S: https://github.com/red/red/blob/3951b6e863ed64e421eefa70de0790f8f40fd5f1/runtime/platform/win32.reds#L93

9214

[22:07](#msg5ce1d3a69404bf2aed75c389)@endo64 I think it should rather be `szPname [struct [a [integer!] b [integer!] ... value]]` - 64 byte allocation inlined in a struct.

endo64

[22:09](#msg5ce1d4249d64e537bcd93430)&gt; it should be byte-ptr! to an already initialized memory.

No it is not :) It would be same as `c-string!`, @9214 Yes something like that.

[22:10](#msg5ce1d4660ec37966a19aa543)@hiiamboris Yes.

9214

[22:21](#msg5ce1d6ce9404bf2aed75d56b)Should be `szPname [struct [...] value]` though.

greggirwin

[22:37](#msg5ce1daa275d9a575a60e4452)@hiiamboris R2 had this design problem in its FFI. With R/S, at least we can fix it in the next version. :^)

## Monday 20th May, 2019

hiiamboris

[13:16](#msg5ce2a8ae509b1035c77ee2d7)Found another set of word decomposition macros ☻ Unsigned this time, but only used in console - https://github.com/red/red/blob/3951b6e863ed64e421eefa70de0790f8f40fd5f1/environment/console/CLI/win32.reds#L161

Softknobs

[21:18](#msg5ce3198d75d9a575a6172054)Thanks for the hints, I have to try this.

## Thursday 30th May, 2019

Claudio08

[15:48](#msg5ceffb52e41fe15e75e423fb)Hi, i have played a little with R/S to interface with Windows API GetUserDefaultLocaleName. I have not experience with C lang. The Red code, compiled with -r on Win10 64bit, good or bad run.  
But there are things that i do not understand:  
The "length? of buf" is only 1 but the characters number returned by the API is exactly "6".  
If i use "6" i get only "it-" so i have to use "6 * 2" to get "it-IT".  
The content of Red string returned by the routine is "i t - I T" and not "it-IT".  
Any suggestion? Thanks

```
Red[]
#system [
	g-loc: context [
		#define LOCALE_NAME_MAX_LENGTH  85
		#import [
       ;https://docs.microsoft.com/it-it/windows/desktop/api/winnls/nf-winnls-getuserdefaultlocalename			
			"kernel32.dll" stdcall [
				get-user-dname: "GetUserDefaultLocaleName" [
				lpLocaleName  [c-string!]
				cchLocaleName [integer!]
				return:       [integer!]
				]              
			]
 			"msvcrt.dll" cdecl [
				malloc: "malloc" [
					size    [integer!]
					return: [c-string!]
				]
				release: "free" [
					block   [c-string!]
				]
			]		
		]
	  	prnt-values: function [nr [integer!] buf [c-string!] /local c rs [red-string!]] [
        	either nr = 0 [print-line "error"] [
				print ["length? buf: " length? buf]
           	 	print [" #chars returned: " nr " text: "]
            	c: 0
            	loop nr * 2 [c: c + 1 print buf/c]
            	print-line ""
	            rs: string/load buf (nr * 2) UTF-8
  		        print-line ["red-string!: " rs] 				
            ]
    	]
		get-locale: function [/local buf nr-chars [integer!] rs [red-string!]] [	
			buf: malloc  256
			nr-chars: get-user-dname buf  LOCALE_NAME_MAX_LENGTH
			print-line "Win API-> GetUserDefaultLocaleName"
			prnt-values nr-chars buf
			rs: string/load buf (nr-chars * 2) UTF-8
			release buf		
			SET_RETURN(rs)
		] 
	]
]	
l-n: routine [] [g-loc/get-locale]
locale-name: l-n 
print ["returned Red" type? locale-name ": " locale-name]
```

output

```
Win API-> GetUserDefaultLocaleName
length? buf: 1 #chars returned: 6 text: it-IT
red-string!: 024CD474
returned Red string :  i t - I T
```

endo64

[16:04](#msg5cefff2b5de053468be464f6)It looks an issue about Windows APIs character encoding. It uses UTF16. Sorry I'm on mobile so cannot test.

9214

[16:20](#msg5cf002da7c1dab468c71ee6c)&gt; The "length? of buf" is only 1 but the characters number returned by the API is exactly "6".

Red/System uses ASCII encoding, whereas Windows API uses UTF-16LE encoding. `length?` just returns a number of bytes up to null byte, and the very first null is contained in the upper-half of `I` binary representation (2 bytes).

&gt; If i use "6" i get only "it-" so i have to use "6 * 2" to get "it-IT".

As I said, Windows uses UTF-16LE encoding, with 2 bytes per character. `it-` is 3 characters (6 / 2).

&gt; The content of Red string returned by the routine is "i t - I T" and not "it-IT".

Because you haven't converted it properly from UTF-16 to UTF-8 (encoding used by Red strings). Spaces probably are null bytes.

## Friday 31st May, 2019

Claudio08

[05:19](#msg5cf0b968481ef4167ba5decf)@9214 thanks, i used `rs: string/load buf (nr-chars * 2) UTF-16LE` and now it return exactly Red string "it-IT"

hiiamboris

[11:52](#msg5cf11581ff3f016baa7f393c)@9214 if I may correct you a tiny bit ☺  
String literals defined in R/S are UTF-8 encoded because that's the source file encoding (although from R/S point of view those are just bytes not chars, so you can loosely call that ASCII).  
But if I'm getting it right, Red strings can internally be Latin-1, UCS-2 or UCS-4 (these are all fixed-length encodings, so simple length calculations are working) and are promoted on the fly when required.

9214

[12:07](#msg5cf1190fbf4cbd167c08cb33)@hiiamboris per R/S specs:  
&gt; For now, Red/System uses 8-bit character encoding (ASCII). Once proper Unicode support will be provided by the Red language layer, Red/System will switch to UTF-8 source encoding.

[12:10](#msg5cf119c0faac643934183520)I'm not sure if this relates to `c-string!`s though. In the above examples I guess it's okay to call them ASCII encoded, since each character fits in one byte and ASCII is a subset of UTF-8.

## Saturday 22nd June, 2019

endo64

[11:05](#msg5d0e0b73cedb297a81991635)How does `allocator-tests.reds` work? The file starts with `#include %../runtime/red.reds`.  
When I put `#include %red.reds` in `test.reds` file and compile (with `-c` or `-r`) it gives below error:

```
*** Compilation Error: expression is missing a return value
*** in file: %.../runtime/allocator.reds
*** in function: red/allocate-virtual
*** at line: 191
*** near: [#in system/catalog/errors internal #in system/catalog/errors/internal no-memory]
```

[11:07](#msg5d0e0bd95bc3210bb779bb33)I also couldn't run `allocator-tests.reds` alone.

## Saturday 29th June, 2019

dockimbel

[15:36](#msg5d178584676ff14d274c1e86)@endo64 That's a question for PeterWAWood, but I'm not sure if he's part of this group.

endo64

[17:11](#msg5d179baf03d62b4d28adbad8)Thanks, I'll contact to him.

## Tuesday 23th July, 2019

Softknobs

[21:14](#msg5d3778b1ec5abe7bbc37adde)I feel like I am missing some important parts of the R/S documentation: I see references here an there to string/rs-head and string/load but nothing is mentioned about these in the language specification page. I am stuck with a `Access Error: invalid UTF-8 encoding: #{90394104}` error trying to convert a c-string! coming from an external C program to string! using `red-port-name: string/load c-port-name size UTF-8` and I don't know if I am using string/load correctly. I suspect it is because the c-string! is an array and not a real string but I have no idea if there are alternatives to string/load to convert the c-string!. Thanks.

9214

[21:21](#msg5d377a60e2d1aa6688f90312)@Softknobs `string/rs-head` and `string/load` are a part of Red runtime library written in Red/System (see \[here](https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L1121)), and therefore are not covered by R/S documentation. \[Here](https://github.com/red/red/wiki/\[DOC]-Guru-Meditations#convert-c-string-to-red-string) you can find a conversion example (that is, assuming that your `c-string!` is properly encoded and does not require extra conversion).

Softknobs

[21:34](#msg5d377d508fe53b671dc57a57)@9214 Thanks I'll browse the runtime code, that's interesting. I my case the c-string! is not a text string, it is used as an array of bytes and it may not be a valid "string". I can get each value by iterating over it but since c-string! is the only "array" type available this makes it difficult to pass as a whole to Red code as a single parameter. What do you mean by "extra conversion"?

9214

[21:42](#msg5d377f2f1dc6332966007110)@Softknobs `string/load` converts UTF-8 encoded `c-string!` to `red-string!` (a Red-level string value). So, if your array of bytes is not a proper UTF-8 `c-string!`, then conversion will fail (and it does, as evident from the error message). You probably want to convert it to `binary!` instead, using \[`binary/load`](https://github.com/red/red/blob/master/runtime/datatypes/binary.reds#L933) and passing a byte pointer to `c-string!`.

[21:49](#msg5d3780fbbe916e76e225453b)Here's a straightforward adaptation of wiki example:

```
Red [Note: "compile with -r flag"]

foo: routine [
    /local c-string red-binary
][
    c-string: "abracadabra"
    red-binary: binary/load
        as byte-ptr! c-string
        length? c-string      ; N.B. null end marker is excluded
    
    SET_RETURN(red-binary)
]

probe foo
probe to string! foo
```

```
#{6162726163616461627261}
"abracadabra"
```

## Thursday 25th July, 2019

Softknobs

[20:59](#msg5d3a18314a32b65507d6902c)@9214 Thank you Vladimir binary is what I was looking for! I don't know if this is the intended behaviour of the binary/load but if the last value converts to 0, it is ignored. So when 3 bytes are read and, for example, #{904000} is expected, only the first two bytes (#{9040}) are returned.

9214

[21:16](#msg5d3a1c216f384439765cf670)@Softknobs note that `length?` on `c-string!` ignores trailing null byte. Try to use `size?` instead, but bear in mind that, per R/S specs:  
&gt; `size?` can only be used on a literal c-string, when only a c-string pointer is available use `length?` function.

Softknobs

[21:39](#msg5d3a219517279f5506b8ccd2)@9214 In this case the 0 value that comes from an external dll seems to be considered as "NULL" in the c-string context. I guess there is no way for Red to see the difference in this case. This only happens when 0 is the last value, other 0 values are converted correctly (ex: #{090010} middle 0 value remains). Anyway size? does the trick. Thanks for your help.

9214

[22:18](#msg5d3a2ab417279f5506b913a0)@Softknobs you're welcome.

## Saturday 17th August, 2019

Softknobs

[21:50](#msg5d5876aa4e17537f524f55be)Just a piece of advice to beginners in R/S: note that every example saying the -r parameter is required can also use the -u and -c afterwards.  
Maybe this is obvious to experienced R/S developers but I found it by accident. This means that the compilation with -u will take a bit more time than -r the first time you compile your script but just a few seconds on subsequent compilations since you can use the -c parameter.  
In my case compiling anything with -r takes around 90 seconds and I almost gave up Red althogether just because of compilation time in trial and error debugging phases...  
I don't think this is clearly mentionned in the R/S documention but I just found this blog post about this behaviour while writting this message: https://www.red-lang.org/2017/03/062-libred-and-macros.html  
Sorry if you find this to be "obvious" stuff but I wanted to share this experience as it changed \*\*a lot\** my Red experience.

9214

[22:06](#msg5d587a5153490e334d109463)@Softknobs thanks for sharing your experience! Red/System specification describes the language itself (i.e. syntax and semantics), which is totally unrelated to how toolchain functions (compilation flags and the like).

I think the best place to document your gotchas is our Github wiki, which already has a lot of R/S-related pages. Feel free to update any of them (\[this](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes) one seems like a good fit) or create a new one.

[22:16](#msg5d587ca69507182477fa5618)Also, note that usage of new runtime calls in your code (after `-u`) requires rebuilding of a new custom libRedRT, which in turn requires cleanup with `red clean` command.

## Monday 26th August, 2019

ldci

[11:23](#msg5d63c12e3c1aba311bd3d6f2)New samples and doc for ffmpeg and Red: https://github.com/ldci/ffmpeg.

9214

[11:55](#msg5d63c8b5a080d70ab583b36d)@ldci good job as usual, but may I kindly suggest to not cross-post your announcements in multiple channels? `/red` one is enough.

pekr

[12:06](#msg5d63cb55c8228962acc8fe91)I will gladly propagate in terms of the Facebook group, once I get home ....

9214

[12:13](#msg5d63cd0135f914538d8b47f0)By "channels" I meant "Gitter rooms" of course, my bad.

ldci

[12:25](#msg5d63cf9ce403470ab6dc97f8)@9214 : OK no problem , I'll focus on red git room

## Wednesday 28th August, 2019

GiuseppeChillemi

[07:43](#msg5d6630913770ed0cbda06490)An "announce" room like we have on AltME would be really good !

[07:44](#msg5d6630c549ac051923c4a590)(And also its announce-reply companion)

greggirwin

[14:19](#msg5d668d88a080d70ab5973bef)We use red/red for that. Gitter make it harder to manage a large number of groups than AltMe did, so we have to limit special purpose groups that are public.

GiuseppeChillemi

[19:49](#msg5d66dab44b1189084e7edffd)@greggirwin I agree with you. Lets postpone it if red/red could be used for announces.

## Sunday 1st September, 2019

melcepstrum

[23:43](#msg5d6c57aab4d8294074b58163)how to invert sign of a variable in Red/System? like x = -x in C

[23:47](#msg5d6c58a75b9a174fdf1cfbcf)and where can i find information about math functions supported by Red/System (e.g. sqrt, atan2, tanh ...)?

## Monday 2nd September, 2019

9214

[00:37](#msg5d6c6445d3fda15e744cd584)@melcepstrum  
\* two's complement (`1 + not x`)  
\* \[here](https://github.com/red/red/blob/master/system/runtime/libc.reds#L81)

melcepstrum

[00:58](#msg5d6c694ab4d8294074b5f5e9)@9214 thanks, and for floats, `-1.0 * x` ?

9214

[00:59](#msg5d6c698538499c13a684b39e)Well, you can actually use multiplication by -1 in either case.

melcepstrum

[01:03](#msg5d6c6a6429dba2421ce957d0)ok, i thought there is unary operator

## Tuesday 3th September, 2019

Respectech

[20:12](#msg5d6ec9448ab9652541b0e780)`negate` should also work, no?

endo64

[20:43](#msg5d6ed0571a16fc38873d35e5)@Respectech There is no `negate` in R/S, only in Red.

Respectech

[22:54](#msg5d6eef32d72013254231cb70)Oh, I missed the part where it was R/S.

## Saturday 7th September, 2019

luce80

[09:35](#msg5d7379e96e889c4bbdb3a1fc)@melcepstrum also `x: 0 - x`

melcepstrum

[09:43](#msg5d737bdb3b1e5e5df16a0ffa)@luce80 thanks

## Wednesday 25th September, 2019

psahani21\_gitlab

[22:20](#msg5d8be834cdbb7d4f7888d6b0)I require a systems programming language for an upcoming project of mine. I like Red a lot as a language so I figured I would use Red/System; however, I'm finding it hard to justify using it over Rust. Rust offers safety features such as its borrow checker, and it doesn't seem like memory-safety or thread-safety is planned to be implemented in Red/System. So does anyone know if there are any plans to implement any safety features in Red/System sometime in the future?

greggirwin

[22:29](#msg5d8bea5986eddb6ea0d51e07)Red/System will likely stay at the C level, maybe with some features added in the future, but more "advanced" system level dialects may be done as experimental or permanent variants of R/S. e.g. there could be a Red/System/Safe version that adds memory safety features and compiles to R/S. It could probably even be done with macros.

One of the issues is that you have to give things up to get safety, even Rust does, so R/S will always be kept simple and unsafe, like C.

9214

[22:31](#msg5d8beab3f8b2736b387733df)@psahani21\_gitlab you're comparing apples to oranges. R/S was designed to give user full control (foot-shooting and all), with tight Red integration in mind - it's not even a language per se, but a system programming DSL. All safety features are postponed for R/S 1.0 experiments.

[22:33](#msg5d8beb5486eddb6ea0d523b5)Another thing is why try to apply Rust mindset where it doesn't fit? R/S is unsafe by design, but Red \_is_ safe by design; so, combine both (that was the initial idea anyway).

psahani21\_gitlab

[22:37](#msg5d8bec1b14635d6b37edd67a)Ok, thanks for the replies

greggirwin

[22:37](#msg5d8bec41bae2907f6c3961b5)Well, one of the great things about being full stack is that we can experiment, you macro fiends you--but also without them, by trying new features and generating R/S that could then be incorporated directly if there's a benefit. There will surely be some very low level bits that might need some custom support in the R/S compiler, but that's a future conversation.

## Saturday 28th September, 2019

hiiamboris

[20:48](#msg5d8fc70066c8b451223479cb)Why can't I `declare pointer! [logic!]` in R/S?

9214

[20:59](#msg5d8fc9b40e829f6047436fdd)@hiiamboris spec says that

&gt; logic! pointer is not needed

Go figure :smile:

hiiamboris

[21:14](#msg5d8fcd26deb6da63d7c5f8a0):D

## Tuesday 8th October, 2019

dockimbel

[12:21](#msg5d9c7f4749c7720aaf8818df)R/S (pre-Red 1.0) is supposed to serve only as a low-level layer for Red using a throw-away implementation in Rebol, so many features that we could add were left out. Once we get the toolchain ported to Red, then we can add many extra features. You can use `pointer! [integer!]` as an alias to `pointer! [logic!]`, so strictly speaking a "logic! pointer is not needed". ;-)

[12:28](#msg5d9c80eb0e67130aae36a1e2)@psahani21\_gitlab  
&gt; So does anyone know if there are any plans to implement any safety features in Red/System sometime in the future?

R/S provides already type-safety, which is the most important one. For Rust-like "memory safety" features, they are a bad match for R/S as stated by Vladimir, as R/S aims to give full control over the hardware (going even further than C language). Once we add proper array support, you'll get bound-checking. A full-blown borrow-checker could be considered for experimentation, but not by copying the over-complicated approach from Rust.  
If you really require a "system programming language" for your project, you are likely to interface with low-level hardware and/or system libraries, which means using unsafe mode in Rust. For thread-safety, we have a theoretical solution for that, if the prototype proves it viable, we should have it before 1.0.

## Wednesday 9th October, 2019

Softknobs

[18:47](#msg5d9e2b3d940b4c2fc0a3ca30)Hi, can I find somewhere the list of Red/System functions? For example I am trying to figure if there is a function to compare c-string! types (in Red it would be "a" = value) or if there are functions to work with series! (for example to resize a series). Is there some documentation or code I can look into to figure out if functions already exist? Thanks.

hiiamboris

[19:40](#msg5d9e379849c7720aaf949e8b)Unfortunately, it's not documented yet. You'll have to poke around ☺  
c-strings are compared using \[memcmp](https://github.com/red/red/blob/master/system/runtime/libc.reds#L45), while every Red type has it's own funcs to deal with - \[can be found here](https://github.com/red/red/tree/master/runtime/datatypes).

[19:42](#msg5d9e380d49c7720aaf94a1cf)\[This tool](https://gitlab.com/hiiamboris/red-codex/) helps me a lot as it sort of understands the syntax. Sometimes though, a good old file search is your best friend.

Softknobs

[21:20](#msg5d9e4f067aa5602ffc9b1bdb)@hiiamboris Thanks! libc.reds is very interesting. Your tool is also nice however it is almost impossible to download it and move around with BitDefender installed because it detects it as a virus. This seems to happen frequently with Red executables.

## Thursday 10th October, 2019

9214

[04:06](#msg5d9eae4949c7720aaf97db91)@Softknobs

&gt; can I find somewhere the list of Red/System functions?

Dig into \[R/S runtime](https://github.com/red/red/tree/master/system/runtime), it shouldn't be very hard to follow, as it is kept relatively small.

&gt; if there are functions to work with series!

`series!` simply don't exist at Red/System level, they are a \[part](https://github.com/red/red/blob/master/runtime/datatypes/series.reds) of Red runtime (written in Red/System).

&gt; Is there some documentation or code I can look into to figure out if functions already exist?

Aside from the \[official spec](https://static.red-lang.org/red-system-specs.html)? Not that I know of.

[04:08](#msg5d9eaec23220922ffb5d4098)WRT BitDefender: it's one of the bad AVs (others are Avira, McAffee and Windows Defender) that frequently cause us troubles. Either whitelist all Red-related directories or consider to switch to another vendor.

## Friday 11st October, 2019

Softknobs

[16:26](#msg5da0ad2839d0c70757904112)@9214 Thank you for the hints. I will browse the runtime. About series! I was thinking about arrays but I see now there are only literal arrays, so they can't be changed. Is there something close to an array, except cstring! ? Are we supposed to work with pointers and cstring! only? I am not used to C at all and working without an array type is something new and challenging to me.

hiiamboris

[16:51](#msg5da0b3188e2e9a7c6bde0d77)Let us know when you really need an array, we'll help you do what you require using pointers.

## Friday 18th October, 2019

Softknobs

[19:10](#msg5daa0e17a28cd16529bdd09d)Hi, is there a way to work with thread at this point either in Red or Red/System? I have a R/S script using a C webserver (libmicrohttpd) which is multithreaded.  
My Red callback is called correctly to handle requests. However if there are many requests at once, and I use `#call` I get errors:  
\- if Red function is empty =&gt; no error  
\- if Red function has a simple `print`statement with static text =&gt; access violation, it looks like a previous `#call` has not ended when this happens.  
\- if Red function has a write/binary =&gt; on occasions I get a error that write/binary does not support binary! type  
On other occasions, I get errors on `wait`function, though I only use it to keep the program running (`wait -1`)  
Well, this is obviously related to thread handling, hence my question. I know threads are not supported yet but is there some kind of workaround to have either Red or R/S code handle such situations? Thanks.

endo64

[19:15](#msg5daa0f4c714b8b0538182cae)Didn't test but what about creating global mutexes manually (CreateMutex api on Windows) and wait for the release, finishing the previous request's job? It will slow down your server but should solve the issue.

Softknobs

[19:21](#msg5daa109ec86aec24c667fa9e)Thanks for the hint. I already tried to make the whole code blocking and it works. The problem then in the server usage: If an upload is being processed, the server can no longer process other requests. This is why I am looking for alternatives but maybe there is no simple way to do this at this time.

greggirwin

[19:33](#msg5daa136dfa637359fca0d9e1)@Softknobs, @qtxie has done some work in a private branch, but it isn't ready for public consumption yet. It sounds like you'll be a great candidate for testing it though.

## Saturday 19th October, 2019

Softknobs

[13:29](#msg5dab0fc824af474d28daf281)@greggirwin if at some point some testing is needed, I'll gladly do it on my script.

greggirwin

[15:58](#msg5dab328da28cd16529c5dc66)Thanks!

# Archived messages from: [gitter.im/red/julia](/gitter.im/red/julia/) from year: 2017

## Sunday 25th June, 2017

dockimbel

[03:00](#msg594f274a4bcd78af56414d2e)@joa-quim In this code you've posted in red/red:

```
using Red

function blabla(bla)
    println(redTypeOf(bla))
    return redUnset()
end

cf = cfunction(blabla, Ptr{Void}, (Ptr{Void},));
redOpen()
redRoutine(redWord("blabla"), "[]", cf);

cmd = "view [backdrop yellow  t: text  yellow {Hello World!} 
    button {Click} [blabla t] 
]"
redDo(cmd)
```

The routine definition is wrong again, it creates a routine with no arguments `"[]"`, while you are trying to pass one. That will result in random values on stack.

[03:02](#msg594f27d0bf7e6af22c6df3db)You can pass an object to `blabla` function, just declare a proper type in the routine, like: `"[obj [object!]]"`. Though we don't have direct accessors on objects yet exposed in libRed (I should add them asap).

[03:11](#msg594f29dd76a757f808a1adfe)Here is an example of accessing a face object field directly using paths, without passing the object through the routine (untested):

```
using Red

function blabla()
	face_text = redPath(redWord("t"), redWord("text"))
    println(redCString(redGetPath(face_text)))
    return redUnset()
end

cf = cfunction(blabla, Ptr{Void}, (Ptr{Void},));
redOpen()
redRoutine(redWord("blabla"), "[]", cf);

cmd = "view [backdrop yellow  t: text  yellow {Hello World!} 
    button {Click} [blabla] 
]"
redDo(cmd)
```

[03:12](#msg594f2a08ceb5bef82ea9d724)You can build any access path you need and use `redGetPath()` and `redSetPath()` to access them.

[06:57](#msg594f5ee0703e565c333ecf2b)@joa-quim LibRed API extended for accessing objects fields in a more direct way:  
https://doc.red-lang.org/en/libred.html#\_accessing\_a\_red\_object\_field

[07:00](#msg594f5f8bad9c781843993901)I let you upgrade the Julia binding accordingly.

[07:00](#msg594f5fa6bf7e6af22c6e9be0)See the usage examples there: https://github.com/red/red/blob/master/tests/libRed/test.c#L59

joa-quim

[15:19](#msg594fd48c703e565c33408c35)@dockimbel @dockimbel Yeap, the {obj \[oject!]] bit was crucial. This works

```
using Red

function blabla(t)
    face_text = redPath(redWord("t"), redWord("text"))
    println(unsafe_string(redCString(redGetPath(face_text))))
    return redUnset()
end

cf = cfunction(blabla, Ptr{Void}, (Ptr{Void},));
redOpen()
redRoutine(redWord("blabla"), "[obj [object!]]", cf);

cmd = "view [backdrop yellow  t: text  yellow {Hello World!}
    button {Click} [blabla t] 
]"
redDo(cmd)
```

\`  
Updated the bindings and will play a little in train back home.

## Monday 26th June, 2017

joa-quim

[11:02](#msg5950e9d83230e14f3af6f4d5)@dockimbel First, I ported the test.c to test\_c.jl and added to tests of the Red.jl repo. It works like the C version.  
Now, sorry to bother again, but don't understand why neither of the two attempts below updates the text on figure. Specially, the first one. If we can do redGetPath, why the redSetPath is ignored?

```
function blabla(t)
    face_text = redPath(redWord("t"), redWord("text"))
    println(unsafe_string(redCString(redGetPath(face_text))))

    redSetPath(face_text, redWord("BlaBla"))
    println(unsafe_string(redCString(redGetPath(face_text))))

    id = redSymbol("text");
    redSetField(t, id, redWord("BlaBla"))
    redProbe(redGetField(t, id));
    return redUnset()
end
```

`

`

```
Hello World!
Hello World!
make error! [
    code: none
    type: 'script
    id: 'invalid-path
    arg1: none
    arg2: 'text
    arg3: none
    near: none
    where: 'redGetField
    stack: 419201976
]
```

\`

dockimbel

[12:59](#msg5951053a76a757f808a8b7ec)@joa-quim You need to set the `t/text` field to a string value, so you need to pass `redString("BlaBla")` and not `redWord("BlaBla")`.

[13:00](#msg5951055a11755ab05623d057)For the `redGetField` error, I'm investigating it...

## Tuesday 27th June, 2017

dockimbel

[08:07](#msg59521243ad9c781843a49062)@joa-quim I've pushed a fix to avoid possible arguments corruption on Red stack when using external routines. Your code above now works fine (after replace the `redWord`calls by `redString`).

joa-quim

[12:58](#msg5952566c6ae41d5d338d4d24)@dockimbel Nice, confirm it works for me too.

dockimbel

[13:22](#msg59525c1a11755ab05629e9c4):+1:

greggirwin

[16:10](#msg59528382ad9c781843a6d5cb)Would one of the Julians please update https://github.com/red/red/wiki/Combining-Red-and-Julia with all this great info? I would do it, but can't add helpful comments or ensure accuracy. No time to set up Julia here at the moment.

joa-quim

[23:15](#msg5952e7148dae4250315ef8a2)OK, I did but we can't keep adding what are small details in the broader picture of the two languages communications. When nice useful examples are written their place is the Red.jl repository.

## Wednesday 28th June, 2017

greggirwin

[00:17](#msg5952f591c101bc4e3a2a4f4d)By all means, edit and direct people to `red.jl`.

[00:18](#msg5952f5c711755ab0562cc90e)My fault for not keeping up with that. Looks fantastic!

joa-quim

[11:36](#msg595394aa329651f46e300c31)@dockimbel Now that things start to work I have so many questions ... but will try not consume many of your time/patience.  
The above case worked well because I transmitted only one handle. But when transmit two, I'm afraid that there name clashes and the procedure is no longer valid. See this next example.

```
using Red

function blabla(t, b)
    id = redSymbol("text");
    redSetField(t, id, redString("BlaBla"))
    redProbe(redGetField(t, id));

	id = redSymbol("size");
    redSetField(t, id, redPair(160, 48))
    redProbe(redGetField(t, id));

	id = redSymbol("offset");
    redSetField(t, id, redPair(20, 20))
    redProbe(redGetField(t, id));
    return redUnset()
end

cf = cfunction(blabla, Ptr{Void}, (Ptr{Void},Ptr{Void}));
redOpen()
redRoutine(redWord("blabla"), "[obj [object!] obj [object!]]", cf);

cmd = "view [backdrop yellow  t: text  yellow {Hello World!}
    b: button {Click} [blabla t b] 
]"
redDo(cmd)
```

`it correctly prints`

```
"BlaBla"
160x48
20x20
```

`but the problem is that there are now two fields with the same name. One for the text t and the other for b button handle. (from red console)`

```
>> t
== make object! [
    type: 'text
    offset: 10x10
    size: 80x24
    text: "Hello World!"
  ...
>> b
== make object! [
    type: 'button
    offset: 99x9
    size: 62x25
    text: "Click"
    imag...
```

`and apparently only first one is caught. And notice that trying id = redSymbol("b/text");`\` didn't make any difference.

dockimbel

[11:55](#msg59539936329651f46e302268)@joa-quim Your routine definition is wrong:  
`redPrint(redRoutine(redWord("blabla"), "[obj [object!] obj [object!]]", cf))`  
will show you the error:

```
*** Script Error: duplicate variable specified: obj
*** Where: redRoutine
*** Stack:
```

[11:56](#msg595399674bcd78af56543ffd)@joa-quim You cannot have two arguments with the same name in a function definition. Use rather:  
`"[obj1 [object!] obj2 [object!]]"`

joa-quim

[12:52](#msg5953a69b76a757f808b4cc1f)@dockimbel Well odd, because it works for me with the same name. I see why it shouldn't work but it does. But than how can I access both the text strings of the t and b objects?  
Doing id = redSymbol("t/text"); errors with

```
make error! [
    code: none
    type: 'script
    id: 'invalid-path
    arg1: none
    arg2: 't/text
    arg3: none
    near: none
    where: 'redGetField
    stack: 410289092
]
```

\`

dockimbel

[12:53](#msg5953a6c25a1ab55f6433924f)`t/text` is not a symbol, it's a path.

[12:55](#msg5953a7246ae41d5d3393489a)You access them in the same way:

```
id = redSymbol("text")
    redProbe(redGetField(t, id))
    redProbe(redGetField(b, id))
```

[12:57](#msg5953a7a811755ab0562f9555)&gt; Well odd, because it works for me with the same name.

If you keep the same Julia console session opened, then you are probably using an older definition of the routine, as all the newer ones with duplicate argument name will fail to create a new routine. Here, I run the julia script from the DOS shell, so a new session each time, to avoid such side-effects.

joa-quim

[13:10](#msg5953aabf329651f46e30711e)Within the Julia console you can issue a workspace() command and it will clear all variables and reset the state ... but just confirmed it's not enough. By running from the dos cmd I get an error, but a different one (perhaps because my version is older than yours)

```
*** Script Error: blabla has no value
*** Where: act
*** Stack: view do-events do-actor do-safe
```

\`

dockimbel

[13:11](#msg5953aaf2bf7e6af22c815887)`workspace()`: good to know.

[13:11](#msg5953aafd11755ab0562fa5e3)I get that error too when `redRoutine` fails and I click on the button.

joa-quim

[13:16](#msg5953ac12bf7e6af22c815e80)OK, and imagine now a window that has many widgets. Is there a way to send the handle of the figure and than from that handle fish the handles of all its widgets?  
I'm asking this because I have a large (GUI) program that is written in Matlab (that's where my GUI programming experience comes from). And the Matlab handles graphics works that way. We can inquire the handle of one widgets about its descendants, find their handles and do modifications.  
Is there a parallel to this in Red?

[13:20](#msg5953ad00bf7e6af22c816536)Just FYI, \[these](http://w3.ualg.pt/~jluis/mirone/screeshots.html) are old screenshots of my program that I would really like to move out of Matlab and the main reason why I am trying the Red GUI.

dockimbel

[13:29](#msg5953af394bcd78af5654ac44)The Red GUI system relies on a tree of face objects that you can walk on at run-time in anyway you want. When you have a face, you can easily access its parent and children.

[13:33](#msg5953b01a8dae4250316246d1)According to what I see from the screenshots, it seems very easy to replicate such GUIs using Red (the toolbar widget should arrive in the 0.6.4 release).

joa-quim

[13:40](#msg5953b1c24bcd78af5654bd08)I am counting on that :smile: But the rest of the story is that there are some 200 k lines of Matlab and C code behind it. That is where Julia comes in and why I'm concentrating first in the inter-language communication aspects.

[14:06](#msg5953b7e076a757f808b529cd)@dockimbel BTW this kills Julia

```
julia> redCString(C_NULL)

*** Runtime Error 1: access violation
*** at: 564C0D59h
```

\`

dockimbel

[15:58](#msg5953d2094bcd78af56556048)@joa-quim libRed could check for NULL argument values passed to some API functions, but it cannot check if the pointer is valid or not, so you can always find ways to crash it.

joa-quim

[16:06](#msg5953d3eac101bc4e3a2e0601)Right, I see but this actually happened when I passed a pointer that turned out to be NULL (due one of my mistakes). Protecting against NULL pointers would be a good thing I think. Much better to have a error message than a crash. Off course, for invalid pointers there is nothing that can be done besides fixing the error.

[23:49](#msg5954407076a757f808b7bd37)OK, I read the all three GUI System manuals and have a 'little' feature request. I see that drawing is currently possible only in pixel coordinates but this is very reducing when one deals with referenced data (georeferenced in my case). For example, most of the data I deal with is in geographical coordinates but could be in cartesian projected coords. It is than very convenient (to say the least) that one can use other than pixel coordinates.  
As an example on how Matlab deals with this please see \[this](https://www.mathworks.com/help/matlab/ref/image.html) doc of its image command. In particular the part that refers to image(x,y,C).  
Now, I have no idea on the work involved in supporting such a feature but I think that it's a real important one (and hopefully, not only to me).

## Thursday 29th June, 2017

dockimbel

[03:14](#msg5954707b5a1ab55f6437194f)@joa-quim We plan to support a "virtual pixel" coordinate system in later releases. Though, I don't see how that relates to the link you posted. As I understand it, `image(x,y,C)` is about image placement, which is a trivial thing to accomplish in Red/View (either set the image face position, or use \[Draw dialect](https://doc.red-lang.org/en/draw.html#\_image) to paint, position and resize the image).

[03:18](#msg5954717dc101bc4e3a30b1f9)You can play with this \[demo script](https://github.com/red/code/blob/master/Scripts/resize-image.red) to see how images can be resized dynamically (just copy/paste the script into a Red GUI console).

joa-quim

[10:53](#msg5954dc2211755ab05634c5ca)@dockimbel image(x,y,C) is not about image's placement. It's about having a mapping function between pixel coordinates and some other referencing system. For example when we move the mouse on a GoogleMaps or GE image we see the geographical coordinates of the point pointed by the mouse. Having that mapping functionality allow another very important feature. To import x,y(z) data form an external source (a file or a data from a database) in some coordinate system and directly plot it over an image. See for example this \[Mirone screenshot](http://w3.ualg.pt/~jluis/mirone/images/datasets.jpg).  
Since I am at this, and sorry for keep adding new issues, the above image shows another \*extremely* useful feature in Matlab vector graphics, which is the capacity that with a left-click on an element (symbol, polyline, text, etc ...) one can bring up a popup menu (the one at image's center) from where a series of actions may be selected.  
Well, there is more around this vector graphics and coordinates (like polyline editing) but this is already a long enough list of things ... for now.

[10:57](#msg5954dd04ad9c781843b13e15)  
You can play with this demo script to see how images can be resized

Fabulous and fabulous speed.&gt;

dockimbel

[11:55](#msg5954eaca703e565c33571a10)@joa-quim You can trivially implement a mapping from another coordinate system to pixels or virtual pixels. About 2D graphic elements becoming reactive individually to mouse events, you can already do that if you put your 2D shape in a base face with transparent background (and add a context menu). Though, for a big number of graphic elements, such approach is too heavy, but we are planning a new kind of graphic object that will support that at low cost.

[12:02](#msg5954ec603230e14f3a08ae4c)Here is a simple example with a small disk and contextual menu you activate by right-clicking on it:

```
view [
	size 200x200
	b: base transparent
		draw [pen red fill-pen pink circle 20x20 4]
		on-menu [print switch event/picked [act1 ["Hello"] act2 ["World!"]]]

	do [b/menu: ["Action 1" act1 "Action 2" act2]]
]
```

joa-quim

[12:50](#msg5954f7ac703e565c33575a78)Yes, the user can implement the mapping himself but it would be nicer if the language accounted for it directly. And besides, I fear for the accuracy of that mapping and possibly the speed. I don't know how these things work but I imagine that many of those operations are carried on at the graphics card level.

Thanks for the context menu example (they are called uicontextmenu in Matlab, so clearly the same concept).

One more, axes. Can we add them to images/draw plots? I've tested many of the examples but couldn't find one with it.

greggirwin

[16:29](#msg59552ae276a757f808bb91a4)Mapping and plotting (graphs/charts) are great ideas for modules. Easy to prototype in Red, and drop to Red/System for the parts that need speed.

Oldes

[19:13](#msg59555152bf7e6af22c88f35d)3

[19:13](#msg595551564bcd78af565be2e1)F

## Friday 30th June, 2017

joa-quim

[16:31](#msg59567cd0bf7e6af22c8e1aac)@dockimbel Hi Doc, could you please answer to this \[question](https://github.com/JuliaLang/julia/pull/22632#pullrequestreview-47436585)? It's about the manifest to have Window Visual Styles in Julia.exe

[18:34](#msg595699ba703e565c335ed17d)BTW, I tried with the manifest and without and made no difference to the window look, which is the same as when I create it from the Red console. Windows 10 here.

[19:51](#msg5956abaea42fa68a30880692)A question about resizing. Say I have an image of size W1xH1 but want to display it at a smaller size (W2xH2). How can I do that?  
Tried with Window resizing but the resizing doesn't change the image's display size.

```
using Red
redOpen()
img = rand(UInt32, 400,400);
redSet(redSymbol("img"), redImage(400, 400, img, 0));
redDo("view/flags [size 500x500 image img] 'resize");
```

\`

greggirwin

[23:34](#msg5956e004c101bc4e3a3b6bbb)The effect pipeline for faces isn't in place yet, so you need to use `draw` right now.

```
view [base 200x200 draw [image i 0x0 200x200]]
```

joa-quim

[23:55](#msg5956e4f1ad9c781843ba7a62)Thanks. And what is the0x0 for?  
The resizing doesn't work with this too. Is it what you referred by "effect pipeline"?

## Saturday 1st July, 2017

joa-quim

[00:23](#msg5956eb8cc101bc4e3a3b9536)Never mind, I found what the 0x0 is. And, sorry, I'm being dumb ask questions for which I already got an \[answer](https://github.com/red/code/blob/master/Scripts/resize-image.red) (but before asking).

greggirwin

[01:52](#msg59570060329651f46e3f1a9b)The effect pipeline is where you could just say `'fit` on a face and have any image in it automatically resized.

dockimbel

[02:56](#msg59570f7a3230e14f3a121469)In VID, if you constraint the size, the image will be resized for you:  
`image 200x200 img` should work fine.

[03:03](#msg595711095a1ab55f64428525)@joa-quim  
&gt; BTW, I tried with the manifest and without and made no difference to the window look, which is the same as when I create it from the Red console. Windows 10 here.

Without that manifest, you get the Windows 2000 look. It makes a difference on XP and Seven, haven't tried on Windows 10.

## Monday 3th July, 2017

joa-quim

[20:54](#msg595aaf23329651f46e4cd05e)One more. How would I draw a line with many points? And by many I mean thousands of them. Calling line p1 p2 thousands of times seams out of question, and furthermore I also have not thought/tried on how to append to an existing figure.  
The idea now is to try something like \[this](http://w3.ualg.pt/~jluis/mirone/images/shade\_illum2.jpg) on the updated example GMT&lt;-&gt;Red example of the Red.jl repo.

## Tuesday 4th July, 2017

geekyi

[02:32](#msg595afe4c76a757f808d28cd5)@joa-quim looking at your linked pic, by thousands of lines, did you mean thousands of points which look like a connected figure? :smile:  
You could write raw image data and overlay that (assuming you want the black outline in the pic), just a suggestion.  
But otherwise you might be looking for \[`polygon`](https://doc.red-lang.org/en/draw.html#\_polygon)?

joa-quim

[11:18](#msg595b79834bcd78af5674252f)@geekyi No, no mistake, I really meant lines because that's the Red command to create lines. Polygon is not a solution because it's a closed entity. What is missing is here is a 'polyline', which is like a polygon but not closed.  
But anyway, the problem of plotting thousands of vertices would remain.

greggirwin

[16:07](#msg595bbd404bcd78af5675cf40)Polyline sounds useful. But it would also be good to performance test `line` so we have an idea of where we \*need* polyline.

joa-quim

[16:40](#msg595bc5063230e14f3a248734)@greggirwin I think polyline is always needed an can't be replaced by a sequence of lines. With this later there is an awful repetition of points because: line1 goes from A to B; line2 goes from B to C (point B is repeated). And for future edition mode (with the mouse) a sequence of lines would be useless.  
I'm also curious on the performance but don't know how to do it myself.

greggirwin

[17:11](#msg595bcc32bf7e6af22ca334ca)"Always needed" depends on context. We never had it in Rebol. `Line` may not be as efficient or elegant, but it can work. Asking about draw testing in red/red or red/gui-branch would be good, as someone may have profiling tools or ideas already. I just generated draw blocks with a lot of line commands and timed showing the window.  
\- No draw commands .05s  
\- 100 line commands .10s  
\- 1'000 line commands .30s  
\- 10'000 line commands 2.5s

I have a low end workstation card, rated at 5.3 on the Windows Experience benchmark. In past tests, others have seen much better performance on their machines with graphic demos.

[17:17](#msg595bcdabad9c781843ce0cf3)Mind you, I'm not discounting your needs in your context. It's just that when someone says something is always needed, or that X is useless, it can pay to ask questions so we know we're solving the right problems. e.g., I could ask, "Why do you need thousands of points? Is it because it makes things easier, so you don't have to interpolate or elide nodes as users zoom? Or do you have a command center with walls of 8K monitors and need to overlay lines real time on satellite images?" My guess is that there is existing data to be used, and just pulling that data in and generating draw commands from all of it would be the easiest thing.

joa-quim

[17:38](#msg595bd2b26ae41d5d33b55107)The "Always needed" was in the context that line and polyline already exist and polyline is a natural companion to this series.

Regarding the number of points. Maybe we in Earth Sciences (I'm a Geophysicist) are exaggerated but thousands are often small numbers. For example the image I linked above shows a small chunk of coast (from where I live) and uses a world shoreline database that has some 90 Mb in binary, so probably on hundred thousands points count. BTW, in my MBP 2014 it takes about 11 seconds to read and plot all of those points.

To give you another idea, for example LIDAR surveys (a laser surveying technique) to measure the Earth surface generate data on the order of several million points. Off course it's silly trying to display all those points at once on a screen. But it's just an example on why thousands ... are not that many. And, IMO, if Red GUI will want to be competitive being able to plot 'large' numbers and fast is a must.

greggirwin

[17:47](#msg595bd49f5a1ab55f64553456)Great info @joa-quim. Thanks!

joa-quim

[17:49](#msg595bd50f76a757f808d700ed)My pleasure if I can contribute with other \*perspectives*

greggirwin

[17:49](#msg595bd5235a1ab55f645536ee)Real-life use cases are enormously helpful. Is there some available data that you think we might be able to transform to `draw` commands relatively quickly? Then we'd have some real numbers and test cases.

[17:51](#msg595bd58dbf7e6af22ca3693a)Pointers to geophysical resources (formats and data) would be a great start. Not my area, though I did do some geo/UTM work for a precision agriculture product some years back.

joa-quim

[17:54](#msg595bd67276a757f808d70922)Now I have to leave but I can prepare an ascii or binary file with coastlines.  
Yes, I know a bit about some formats. Mainly raster (matricial) formats.

greggirwin

[19:39](#msg595bef072723db8d5ed8fa78)Great, thanks!

## Wednesday 5th July, 2017

Oldes

[13:57](#msg595cf033329651f46e57a5f8)@joa-quim there is `polyline` as `line` accepts any number of points:

```
view layout [base 400x400 draw [line 0x0 200x200 400x0 100x100 0x400]]
```

greggirwin

[15:59](#msg595d0cf32723db8d5ede658e)How do I forget these things. When in doubt, I need to revisit docs. Thanks @Oldes.

joa-quim

[19:06](#msg595d38b8c101bc4e3a55fb63)@Oldes Yep, I should have tried but I found the doc a bit dubious "Draws a line between two points. If more points are specified, additional lines are drawn". From this description it's not clear if it implies a polyline or a sequence of lines.

[23:37](#msg595d782b3230e14f3a2cbcc2)@greggirwin Ok, coastlines is a more complicated case because we have them stored in segments not necessarily contiguous. I have extracted instead the Italy outline that you can download from \[here](w3.ualg.pt/~jluis/ftp/tmp/italia.zip). However, the data is in geographical coordinates (~4300 points), which are not ready to plot with Red that requires pixel coordinates.

## Thursday 6th July, 2017

greggirwin

[02:06](#msg595d9b35329651f46e5ac7e3)Thanks! I've pulled it. Do you have a formula handy that we can use as a reference when converting to pixels?

[02:10](#msg595d9c1776a757f808df73fc)Need the format of the data as well I suppose. :^)

[02:12](#msg595d9cab2723db8d5ee0e6cd)In any case, using a single line with lots of points is fast. 0.3s for 10K points. 0.4s for 100K points.

joa-quim

[10:58](#msg595e17f01c8697534af784a3)@greggirwin That data has no particular format. It's just a two columns file with coordinates in degrees (longitude latitude). One can convert it to pixels with shift and scale operation.

Let lon\_0 &amp; lat\_0 be the minimum of longitude and latitude.  
Subtract lon\_0 form first column and lat\_0 from second. Let's call it \*italia\_0*  
Let lon\_1 be the maximum of \*italia\_0* longitude.  
Assume we want to create an image with 600 pixels width.  
Compute the scale factor:  
\*scale = 600 / lon\_1*  
Multiply by the scale factor and round it.  
\*italia\_px = round(italia\_0 * scale)*  
Now this need to be converted to Red pairs. Don't know how to do this step.  
\[This file](http://w3.ualg.pt/~jluis/ftp/tmp/italia\_px.dat) has the \*italia\_px*

## Friday 7th July, 2017

greggirwin

[02:50](#msg595ef6e4c101bc4e3a5d8dab)Thanks. Lots of other things going on, but I'll take a look when I can.

## Friday 4th August, 2017

dockimbel

[10:13](#msg598448b72723db8d5e73de53)@joa-quim `line` should be fast-enough for most use-cases, when providing a list of points (instead of just two). If there is no dynamic changes required, I strongly suggest drawing onto an `image!` and displaying that image.

[10:14](#msg59844919a7b406262d5a340e)The Draw documentation lacks some examples and screenshots, if anyone has time to add that to our red/docs repo, that would be helpful.

# Archived messages from: [gitter.im/red/red](/gitter.im/red/red/) from year: 2021

## Friday 1st January, 2021

planetsizecpu

[09:35](#msg5feeeccddbb17f28c5b11909)I'm joining you Gregg, happy new year, and hope 2021 full of sucess to all the audience.

ldci

[11:24](#msg5fef065baa6bb528c38425a1)Happy New Year to the Red community. Thanks a lot for your comments . Thanks @GiuseppeChillemi for the link about Sikuli. All coders interested can join redCV for adding new functionalities :)

GiuseppeChillemi

[13:14](#msg5fef203ae7f693041f445c5d)@ldci not so easy without some help

## Saturday 2nd January, 2021

rebred

[22:00](#msg5ff0ece8c746c6431cefc5ee)is there a plan to make Red work on apple silicon ?

## Sunday 3th January, 2021

greggirwin

[02:07](#msg5ff126d497312f4b6b05f586)Not at this time. Too many other things already in the queue.

gltewalt:matrix.org

[02:26](#msg5ff12b4ec746c6431cf05029)Apple will support Intel (at least through emulator) for the next two years

XANOZOID

[08:49](#msg5ff18505aa6bb528c389cf20)Deleted some comments . . gave myself some answers

rebolek

[08:54](#msg5ff1864463fe03449634d8ff)It doesn't make sense to support M1 when Red is still 32bit only.

ldci

[11:26](#msg5ff1a9d4e7f693041f49fa8a)redCV is updated and includes now a support for Flir thermal images: https://github.com/ldci/redCV

greggirwin

[18:34](#msg5ff20e25e7f693041f4af745)Woohoo! :+1:

## Monday 4th January, 2021

gltewalt

[02:59](#msg5ff284a363fe03449637383f)Humbly ask for your additions to a "common tasks" list that we have started in the Wiki.  
Anyone?  
https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F

GiuseppeChillemi

[03:13](#msg5ff287c2e7f693041f4c110e)@gltewalt nice!

ldci

[10:13](#msg5ff2ea46acd1e516f8d1200e)A general update for Red OpenCV binding which is compatible with the new Red compiler: https://twitter.com/fjephe/status/1346036499414986752 and https://github.com/ldci/OpenCV3-red

pekr

[11:32](#msg5ff2fcc269ee7f0422e0193e)@ldci Is there any significant difference in speed between the binding and RedCV R/S version?

ldci

[11:37](#msg5ff2fdeb4eba353cdf18cdb6)@pekr Red is lower than C and thus redCV too. For example for face detection: 20 ms in OpenCV vs. 40 ms for redCV. Have a look here : http://redlcv.blogspot.com/2020/07/

pekr

[14:20](#msg5ff3241469ee7f0422e07cc5)OK, thanks. I thought most of that is written in R/S, which, again, is slower than C, but not such slow, as pure Red alghoritms would be?

ldci

[16:31](#msg5ff342e197312f4b6b0b00a7)@pekr: Split a 512X512 image in 3 RGB Channels. Pure Red: 66 ms. Pure Red/System: 13 ms.

hiiamboris

[17:20](#msg5ff34e5963fe034496393c3f)R/S should do that in less than 1 ms.

ldci

[17:42](#msg5ff3537be7f693041f4e1eb1)@hiiamboris Optimized version: 6.0 ms

pekr

[18:07](#msg5ff35978ce40bd3cdb1f45d0)Ah, I thought that RedCV is mostly a R/S implementation. Looking into a code it is a mixture of Red and some R/S ....

ldci

[18:19](#msg5ff35c3197312f4b6b0b4610)@pekr You're right. It's a mixed approach which combines Red for simplicity and Red/S for speed when processing images or matrices.

pekr

[18:20](#msg5ff35c834eba353cdf19deac)Sounds good. I thought that OpenCV binding is not going to be further maintained, so update in that area is a nice surprise .... (of course not sure, how complete binding it is ...)

[18:25](#msg5ff35d89c746c6431cf596e7)@hiiamboris Why do you think R/S should do it in 1 sec? If the alghoritm is already optimised, then it is about the efficiency of R/S compiler, no? :-)

hiiamboris

[18:47](#msg5ff362a52084ee4b788f7263)I may be wrong, just a hunch. It's just 1 MB of data after all ;)

## Tuesday 5th January, 2021

ldci

[07:40](#msg5ff417dcdbb17f28c5bd36ea)@pekr OpenCV 4 is now a mainly C++ code. Red binding allows to call about 600 basic functions from the C code core of OpenCV. This is sufficient for a lot of classical applications. I stopped the support of OpenCV after the 3.3 version. I have to look if C functions are still supported in 4.0 version and newer. The second problem is that under macOS, I can't generate 32-bit libs since Xcode imposes 64-bit compilation. So I'm waiting for a 64-bit Red compiler :)

pekr

[08:35](#msg5ff424d569ee7f0422e302fe)So RedCV is the way to go for the time being 🙂

GiuseppeChillemi

[18:04](#msg5ff4aa4597312f4b6b0e99f1)@ldci I dind't know there was an OpenCV binding for Red.

## Wednesday 6th January, 2021

ldci

[08:29](#msg5ff574e74498e01bbf8df52a)@GiuseppeChillemi This is the first code I wrote at the beginning of Red story :)

[10:15](#msg5ff58dc481c55b09c7ee86dc)@GiuseppeChillemi BTW: there is also a OpenCV binding for Rebol: https://github.com/ldci/OpenCV3-rebol

GiuseppeChillemi

[11:13](#msg5ff59b57fb85d46e04c53db5)@ldci but you are not maintaining it...

[11:14](#msg5ff59b93dc2e4809aa05b0a3)You are longer in our Redbol world than I have imagined

ldci

[12:24](#msg5ff5ac0be578cf1e95cf3eee)@GiuseppeChillemi Yep. L began to use Rebol in 1999:)

GiuseppeChillemi

[12:46](#msg5ff5b13dfb85d46e04c57583)You have started using it before its birth!

[12:47](#msg5ff5b16a03529b296bd29712)Rebol, a wonderful stroke of genius

ldci

[15:53](#msg5ff5dcf9e578cf1e95cfccd1)@GiuseppeChillemi : I've tested today the Rebol binding: still operational and efficient. I'll make an update in a few days:)

GiuseppeChillemi

[16:34](#msg5ff5e68091e9b71badbcf841)@ldci Are you using some automation script to make the bindings?

ldci

[17:11](#msg5ff5ef49252c0a6dedf36f2a)Nope. All hand done

## Thursday 7th January, 2021

GiuseppeChillemi

[10:30](#msg5ff6e2ce9632f63d8700a87d)@ldci are there similar libraries for sounds and vibrations?

ldci

[12:07](#msg5ff6f995787d8f79c8e8ad19)@GiuseppeChillemi : I don't know, soory

[12:07](#msg5ff6f99c252c0a6dedf5fd53)sorry

greggirwin

[18:28](#msg5ff752d103529b296bd6c90c)@Oldes has done some audio lib bindings, but I don't know of any related to analysis for vibrations and such.

Oldes

[19:43](#msg5ff76479787d8f79c8e9d952)@GiuseppeChillemi for audio I was playing with bindings for \[Bass](https://github.com/red/code/tree/master/Library/Bass), \[FMOD](https://github.com/red/code/tree/master/Library/FMOD), \[Portaudio](https://github.com/red/code/tree/master/Library/Portaudio), \[Vorbis](https://github.com/red/code/tree/master/Library/Vorbis), \[MPG123](https://github.com/red/code/tree/master/Library/mpg123) and \[Ogg](https://github.com/red/code/tree/master/Library/ogg)... all of these are years available... anybody could take it where I left it and improve it.

[19:45](#msg5ff764c5cd31da3d9a9a5584)I really don't understand what you mean with vibrations? One can use vibrations on some gamepads and or mobiles...I'm not aware that anybody is using these devices with Red yet.

[19:47](#msg5ff7654dd5f4bf2965d11431)Also I'm not sure what you are asking for when you mention \_something similar to OpenCV\_. OpenCV's main usage is Computer Vision... so take an image from video and get some info from it.

giesse

[19:48](#msg5ff76593fe007479e4f9b4b6)@GiuseppeChillemi I think you'll want to search for "Digital Signal Processing"

GiuseppeChillemi

[21:14](#msg5ff77998fb85d46e04ca1d3e)I would like to investigate vibration amplitude, harmonic content, frequencies and period, in my machinery. There is already some failure predictive technology but I want to investigate on signal directly an build some of my own. Those signals could be used for AI training, so it can analize them and react.

[21:15](#msg5ff779dbdc2e4809aa0a8aa0)@giesse DSP, thank you, I have for a moment forgotten this term.

[21:18](#msg5ff77a8d81c55b09c7f39f03)@Oldes I want to take some informations from the production line analog dimension like surface material vibrations and sounds.

[21:18](#msg5ff77aa691e9b71badc10ae5)(nice work on bindings!)

## Friday 8th January, 2021

rebolek

[07:45](#msg5ff80dad787d8f79c8eb69d3)The basis for signal analytics is FFT. I'm not sure if there are Red bindings for any FFT lib (like http://fftw.org/), I have some FFT functions but I'm not sure if they are published online. I will take a look later.

Oldes

[08:48](#msg5ff81c665562a61e9a91aadd)I believe that OpenCV may be used for such a purpose too... it works with arrays.

[09:34](#msg5ff827259632f63d8703ecf3)Although you would have more success if you use \[TensorFlow](https://www.tensorflow.org/).. like \[here](https://towardsdatascience.com/how-to-easily-process-audio-on-your-gpu-with-tensorflow-2d9d91360f06)

[09:51](#msg5ff82b26e578cf1e95d59c5f)Here is \[TensorFlow c-api](https://www.tensorflow.org/install/lang\_c) which would be needed to write Red binding... but it is huge... 400MB dll on windows (GPU version)

[09:56](#msg5ff82c40e578cf1e95d59e43)I would probably recommend just use Python scripts and control these thru input args.. (at least that is what I did when I needed to train own model for image upscaling). Else you will invest years of work.

pekr

[10:09](#msg5ff82f4cdc2e4809aa0c3ca9)Reading post from @Oldes, I do wonder if other communities are so big, that they have such a big bindings, or some tools to create a semi-automated wrappers?

[10:10](#msg5ff82f8a252c0a6dedf928db)Also - some tools are moving from C to C++, what are your chances then? Create some middle layer, to translate calls to C level, so that you can interface using a FFI methods?

Oldes

[11:45](#msg5ff845cecd31da3d9a9c7bdd)I think that this kind of \_math_ communities mostly just use the Python these days. Even the TensorFlow C-api is behind as \[you can see in comments](https://github.com/tensorflow/tensorflow/blob/277e22a01540b76151f5a664c8fd08854663fe27/tensorflow/c/c\_api.h#L946-L950)

[11:48](#msg5ff8467091e9b71badc2ef53)Btw.. the tensorflow file looks quite parseable for semi-automated binding... but I don't have a strong need for it.

[11:54](#msg5ff8480ffe007479e4fbd222)\[Rust's OpenCV binding](https://github.com/twistedfall/opencv-rust) has 22 contributors.. so it's 5x more than Red's

[11:56](#msg5ff848724498e01bbf9517c6)Apparently they are using \[a binding generator](https://github.com/twistedfall/opencv-rust/tree/master/binding-generator/src)

pekr

[12:32](#msg5ff850c6cd31da3d9a9c9911)Thanks, that makes things more obvious ....

ldci

[18:19](#msg5ff8a2164498e01bbf961363)Hi everyone. redCV proposes some routines and functions for DSP including, FFT 1-D and FFT-2D. I used some ideas form Mel Cepstrum and Toomas Voglaid's code. You'll also find a dynamic type warping method and some filters such as a Savitzky-Golay filter. Regards

greggirwin

[18:51](#msg5ff8a9acfe007479e4fce5f9)An important aspect that @Oldes points out is need. When someone needs a feature, that's the driving force. Then the rest of us can help with advice, snippets, and tools. What will also help on the binding side is a Red level FFI. Not necessary of course, but removes a barrier for many people, especially if we can make it easy to use.

GiuseppeChillemi

[23:53](#msg5ff8f0679632f63d87060f4b)@greggirwin what a great thing the "driving force": sometime I spend empty days wrangling around but when I need to do something and I have the idea, nothing can stop me to code it in very little time.

## Monday 11st January, 2021

pixel40

[01:16](#msg5ffba6d599549911fc1420fe)What a wonderful opportunity for a Red based messaging application similar to Twitter.  
With everybody being censored by large corporations. Doesn't Red have blockchain components? No centralised data centres needed or to be controlled by large companies.

greggirwin

[01:20](#msg5ffba7f803529b296be10b6e)Twitter scale is hard to do on a shoestring, but we have plans for a messaging app. We need to focus on a couple commercial endeavors first, like \[DiaGrammar](https://www.redlake-tech.com/products/diagrammar-for-windows/), for sustainability.

Blockchains are slow, so also a big challenge for real-time apps of any kind. Side-chains and other solutions are the way to go there, but we're not there yet. There are also downsides to the blockchain approach for this kind of thing, because of their lack of control over content. That's a huge issue. Posting facts, data, and source code are one thing, but opinions are quite another.

pixel40

[01:34](#msg5ffbab3914cec811ec8e5b2d)@greggirwin When will Diagrammar be available? I have already written a Red application that interacts with the Wordpress Woocommerce REST Api and it has a full delivery screen with customer data, scrollable and drag and drop fields which are scalable to full screen etc. It has many components like customer database, customer live search, order entry. I have made a custom bracket on my vehicle dash, which houses my Surface Pro, so I can click off the delivery fields as I deliver them, all the customer data is available to me at any time. BTW Red works really well on my Surface Pro X, running with 32bit emulation. And thanks very much to the team for the much faster compiler results.

greggirwin

[01:46](#msg5ffbadfacd31da3d9aa484fe)Diagrammar is available now! See the link above.

[01:47](#msg5ffbae24fe007479e403b7eb)Wow! It sounds like you've done some amazing things with Red. Very cool.

pixel40

[02:01](#msg5ffbb18a252c0a6ded017310)@greggirwin Thanks just purchased it.  
Red is an amazing language, and every time I have to use PHP, Javascript, to write my own plugins, for my Woocommerce site, I cringe. Why can't they just use RED, I can do it 10x faster in RED. If only they turfed PHP, javascript and even HTML, everything could be done in RED, all the needed components could be exported through REST components, for people that don't want to go RED all the way. Such a shame, RED spoils you and hampers your learning progress in Other languages. :-)

greggirwin

[02:13](#msg5ffbb466d5f4bf2965db3c3e):^) We're all spoiled.

Thanks for supporting us by buying DiaGrammar! Post any thoughts or feedback in https://gitter.im/redlake-comm/DiaGrammar.

GiuseppeChillemi

[02:32](#msg5ffbb8c0fb85d46e04d42580)@pixel40 how have you done drag&amp;drop fields?

pixel40

[02:49](#msg5ffbbca6d5f4bf2965db4db3)@GiuseppeChillemi It took a while to figure it out, the hard part is having it scalable as well, which works mostly. So now I just click to full screen and every field with their containing panels is automatically scaled vertically, and all the Drag and Drop still works. The fields are automatically added every time a new order comes in. I did a custom Scroll bar as well. How do I post a screenshot here. Will have to blur out the customers.

greggirwin

[02:56](#msg5ffbbe46dc2e4809aa14c02f)You should be able to copy the image to the clipboard and just paste as a message here.

pixel40

[03:14](#msg5ffbc29703529b296be141f6)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/Jypo/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/Jypo/image.png)

greggirwin

[03:17](#msg5ffbc3589632f63d870c797e)Nice anonymizing. :^) :+1:

pixel40

[03:21](#msg5ffbc42de578cf1e95de1930)@GiuseppeChillemi I just changed the names and phone number entries. Any row can be deleted by clicking the X, rows will automatically be moved up. Any field can be edited, copied or pasted. The pay column fields are toggle buttons for different payment methods. The Box numbers are color coded according to Box Sizes and also are toggle buttons up to 7. The Yellow squares are buttons which open a sub panel for delivery instructions. The ToDo buttos are toggles to mark what has been delivered. The Green Buttons at the ends are the Drag and Drop Handles. The Scroll bar is obvious.

[03:22](#msg5ffbc46d5562a61e9a9a1417)@greggirwin Thanks

[04:02](#msg5ffbcde1e578cf1e95de2fc2)@GiuseppeChillemi I should add, that this is only One panel of a much larger application.  
I said it scaled vertically, but should have said horizontally as well. I do get a slight space between the fields if I scale upwards, and downwards, several times, which could be fixed.

ldci

[04:09](#msg5ffbcf91fb85d46e04d45807)@pixel40 Very impressive. Congratulations.

pixel40

[04:19](#msg5ffbd1ed5562a61e9a9a2f98)@GiuseppeChillemi @ldci Thanks.I am willing to share the code to do it, but seeing that it is only a small portion of the total code, and that I wrote this a long time ago, will have to go through the code to work out what I did. :-) From memory I used actions a lot, and it creates the panel dynamically. Also I kept adding functionality, so the code would probably need a complete rewrite, I wrote some ghastly stuff. :-) There is also a complete RED to HTML, JS, CSS, so that I can print labels using from a Web Page. PDF's were to painful to deal with. Would be nice if RED had a Print Module to interact with the Windows Desktop App Printing API. One day I will look at how to do this.

GiuseppeChillemi

[04:35](#msg5ffbd5815562a61e9a9a389c)Wow, looking forward to see the code when you will share it

[04:36](#msg5ffbd5dffe007479e4040d53)@pixel40 when the text-table style will be available things will be very easy for you.

greggirwin

[04:44](#msg5ffbd7ae252c0a6ded01c533)Very cool @pixel40. @giesse did a PDF lib for R2 long ago, which I used for label printing and such.

Even if it's ghastly, it's getting the job done. That's what counts.

gltewalt

[04:52](#msg5ffbd99efb85d46e04d46df8)You can print from windows command line, I believe.

pixel40

[04:53](#msg5ffbd9be14cec811ec8ec279)@greggirwin Thank you. I think at one stage I looked at that and may have used it. I used to edit PDFS using Acrobat Pro and a special plugin which cost a fortune. Unfortunately I am spending too much time learning ridiculously complicated JS frameworks like REACT, DINO, Svelte and the silly WordPress/WooCommerce API's. They all amount an enormous amount of Nothing. I'm tired, I just want everything to be RED :-)

[04:58](#msg5ffbdadf787d8f79c8f45bd3)@gltewalt Yes you can, but it isn't great. I found converting everything to HTML is probably a better choice at this stage. If i spent all my time on RED, I would probably have made something by now.

ldci

[06:36](#msg5ffbf1f103529b296be1aa79)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/uyVw/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/uyVw/image.png)

[06:37](#msg5ffbf2124498e01bbf9da958)GLFW-red is also updated for new Red compiler : https://github.com/ldci/glfw-red

pixel40

[12:05](#msg5ffc3ef6e578cf1e95df4e4d)@GiuseppeChillemi The main block that is responsible for the Drag &amp; Drop, is called by do.  
I store the offsets in the face/extra of the first field of each row. That way the offsets are updated to face/extra on every drop event. So each row offset can easily be calculated because you know the row height. Here is the piece of code for that...  
add-actors: [  
;Go through each complete customer row.  
foreach face del-row-container/pane [  
;Copy the face offset to extra for future use.  
face/extra: face/offset  
;Add an action to each row for dragging and dropping.  
face/actors: make object! [  
on-drag: func \[face \[object!] event \[event! none!]][  
;Save current face, before modifying, so we can compare offsets.  
nowface: face  
;Narrow down foreach-face selection to only faces of type 'panel, which is each row.  
foreach-face/with del-row-container [  
if (face/offset &lt; nowface/offset) and overlap? face nowface [  
face/offset: nowface/extra  
;Check if the parent panel of the rows has moved up past the viewport.  
if (face/offset/2 + nowface/parent/offset/2) &lt; face/size/2 [  
;Attempt to scroll parent pane of rows down as the row is dragged up to the highest row in viewport.  
nowface/parent/offset/2: nowface/parent/offset/2 + face/size/2  
]  
del-row-container/extra: face/extra  
nowface/extra: face/extra  
face/extra: face/offset  
]  
]\[face/type = 'panel]  
]  
on-drop: func \[face \[object!] event \[event! none!]][  
;Make sure that the used offset is not none, otherwise calculations won't work.  
if not none? del-row-container/extra [  
;This prevents a false on-drop occuring when just clicking the face.  
if not-equal? face/extra/2 face/offset/2 [  
face/offset: del-row-container/extra

;Save index of row to face/extra of first name field  
either not (face/offset/2 = 0) [  
;face/pane/2/extra: (face/offset/2 / 20)  
face/pane/2/extra: (face/offset/2 / del-row-height)  
][  
face/pane/2/extra: 1  
]  
]  
]  
]  
]  
]

[12:07](#msg5ffc3f75d5f4bf2965dc89aa)Oops I don't think I pasted that code the right way :-)

rebolek

[12:08](#msg5ffc3fd9fb85d46e04d56eb7):)

[12:09](#msg5ffc3ffa9632f63d870dab57)start your code with three backticks on separate line, end it the same way: \*\*\`\**

pixel40

[12:16](#msg5ffc419e14cec811ec8fc2a0)@rebolek Sorry, thanks for that.

rebolek

[12:27](#msg5ffc4427fe007479e405192a)no problem!

pixel40

[12:30](#msg5ffc44e2fe007479e4051b55)@GiuseppeChillemi Try again.

```
add-actors: [
     ;Go through each complete customer row.
    foreach face del-row-container/pane [
        ;Copy the face offset to extra for future use.
        face/extra: face/offset
        ;Add an action to each row for dragging and dropping.
        face/actors: make object! [           
            on-drag: func [face [object!] event [event! none!]][
                ;Save current face, before modifying, so we can compare offsets.
                nowface: face
                ;Narrow down foreach-face selection to only faces of type 'panel, which is each row.
                foreach-face/with del-row-container [
                    if  (face/offset < nowface/offset) and overlap? face nowface  [
                        face/offset: nowface/extra
                        ;Check if the parent panel of the rows has moved up past the viewport.
                        if (face/offset/2 + nowface/parent/offset/2) < face/size/2 [
                            ;Attempt to scroll parent pane of rows down as the row is dragged up to the highest row in viewport.
                            nowface/parent/offset/2: nowface/parent/offset/2 + face/size/2
                        ]
                        del-row-container/extra: face/extra
                         nowface/extra: face/extra
                        face/extra: face/offset
                    ]
                ][face/type = 'panel]
            ]
            on-drop: func [face [object!] event [event! none!]][
                ;Make sure that the used offset is not none, otherwise calculations won't work.
                if not none? del-row-container/extra [
                    ;This prevents a false on-drop occuring when just clicking the face.
                    if not-equal? face/extra/2  face/offset/2 [
                        face/offset: del-row-container/extra
                
                        ;Save index of row to face/extra of first name field
                        either not (face/offset/2 = 0) [
                            ;face/pane/2/extra: (face/offset/2 / 20)
                            face/pane/2/extra: (face/offset/2 / del-row-height)
                        ][
                        face/pane/2/extra: 1
                    ]
                    ] 
                ]    
            ]
        ]
    ]
```

hiiamboris

[13:34](#msg5ffc53c814cec811ec8ff6c3)@pixel40 please next time use http://gist.github.com/ for big snippets to keep the chat cleaner

[13:35](#msg5ffc54109632f63d870de258)Good job on making your own UI anyway ;)

pixel40

[14:18](#msg5ffc5e1e5562a61e9a9b92a0)@hiiamboris Thank you, will do.

greggirwin

[20:34](#msg5ffcb638fb85d46e04d6c6fa)@ldci nice! The link to glfw.org in in the repo doesn't work though.

@pixel40 if you know Vue and Hugo, we need a web dev. Then you can at least spend more time with Red. :^)

ldci

[21:19](#msg5ffcc0f7cd31da3d9aa76cb4)@greggirwin : Corrected for links. Thanks a lot.

pixel40

[21:34](#msg5ffcc44be578cf1e95e0ca96)@greggirwin Thanks, I don't know Vue or Hugo.  
I just find the whole framework stuff is getting out of hand. Even WordPress has parts of the Admin and the Gutenberg Blocks written in React, so to be a Wordpress Dev, you basically need to know Html, CSS, PHP, React, JSON. It still has parts written in JQuery. That is insane when you think, about it. All just to put pixels on a screen. I find it actually takes longer to learn the frameworks than the native language. If you look at the package manager in React, and what it is downloading, it is a mind boggling amount of code. Who would know what Facebook put in there to spy on people. The browser engines are written in C/C++ and then have all these layers of nonsense on top, might as well do it all in C++ to start with. I have used RED in the past to quickly work out an idea, then write it in vanilla JS. I just learn another language if I need it to do a particular project. And this is where RED is so opposite to everything else. Just one mainstream RED commercial application, is all it needs, something like Dir Opus, cross platform, and the devs will come. I'm only very part-time programming ATM, learning Blender 3D at the moment, so I can print some 3D parts.

greggirwin

[21:46](#msg5ffcc73899549911fc170f5f)@pixel40 Amen!

GiuseppeChillemi

[22:12](#msg5ffccd604498e01bbfa00ab0)@pixel40 Waiting for next REDproject: WID, the Web Interface Dialect

pixel40

[22:18](#msg5ffccecdd5f4bf2965de23cf)@GiuseppeChillemi HaHa, actually it might be useful to use RED and Web Assembly. That would be a direct hook, people see how little code you need, and they go "I want some of That" :-)

GiuseppeChillemi

[22:36](#msg5ffcd2decd31da3d9aa7a561)@pixel40 One day we will be there: https://gitter.im/red/red.js

pixel40

[22:44](#msg5ffcd4e3787d8f79c8f70c8a)@GiuseppeChillemi Oh! I didn't know that was there. thanks. Is that on top of the JS interpreter, which is on top of the browser C++ engine?

hiiamboris

[23:02](#msg5ffcd912fb85d46e04d73184)On top of AngularJS which is on top of JS which is on top of browsers C++ engine (;

GiuseppeChillemi

[23:21](#msg5ffcdd64fb85d46e04d73d1c)... and RED.JS is not written in Javascript but in HAXE and then transcoded to JS!

pixel40

[23:28](#msg5ffcdf1e99549911fc175802)@GiuseppeChillemi Oh dear! That looks like a very cool project, but I just wonder if it will be seen as another framework type thing. So if any changes are made in any of those languages, it then cascades down to the next language above it. I wonder sometimes how much time would be saved by developers, just using the lowest common denominator at the start instead of contorting ones self through all those bugs, and code errors at multiple layers.

GiuseppeChillemi

[23:30](#msg5ffcdfb291e9b71badce1f79)Haxe is a well-established language built to transcode to JS and other languages. It is very stable, mature and errors seem to be quickly spotted, so no "cascading" effect, or at least they won't last so long.

## Friday 15th January, 2021

greggirwin

[19:43](#msg6001f07a4498e01bbfad8fb5)Coming from red/docs chat about parens in paths:

@GiuseppeChillemi I do \*greatly* appreciate the examples. Look at all the innovation it's fostered. :^) Now we can compare different syntactic approaches directly. More thoughts.

\- @Oldes' reference to the old "sticky space" ticket is applicable.  
\- @toomasv's `get-path` is a nice name. Is it good that it mirrors `get-path!` as a name, bad, or indifferent?  
\- Even in small cases, something like `(series)/(idx)/('mystruct/size)` is a "noisy" line to my eye. And the only place you \*could* add spaces may make it even less clear as a path: `( series )/( idx )/( 'mystruct/size )`.  
\- Parens as selectors also raise an ambiguity, the same as blocks do. With blocks you need to use `select/only`. What do you need to use for parens? Because they are evaluated by default, the rules are different. It's not that you can't or shouldn't use them as keys, but it means more rules to remember.

```
>> blk: [a (b c) d]
== [a (b c) d]
>> blk/(b c)
== none
>> select blk (b c)
== none
>> select blk '(b c)
*** Syntax Error: (line 1) invalid word at '(b c)
*** Where: case
*** Stack: load 
>> select blk quote (b c)
== none
>> select/only blk (b c)
== none
>> select/only blk quote (b c)
== d
>> blk/((b c))
== none
>> blk/(quote (b c))
== d
```

\- In that console example, note that there's no `lit-paren!` support. You can do `blk/'a`, but do you want to also do `blk/'(b c)`? What are the ripple effects for that new form and type?  
\- `Resolve` is a \*really* nice name IMO. Looking at definitions, this one jumped out at me: "to become `reduce`d by dissolving or analysis". (emphasis mine)

GiuseppeChillemi

[21:05](#msg60020388cd31da3d9ab531d2)@greggirwin thanks Gregg, you have had the strength to move the thread out of Red/doc, I didn't!

[21:16](#msg60020627fb85d46e04e4b613)To my eyes `'(a b)` is new great way of quoting, because it would be useful in another scenario: `compose`, to quote parens in code and to avoid them being evaluated.

greggirwin

[21:28](#msg60020907fe007479e41452e4)But we already have parens that don't get evaluated. They're called blocks. :^) And if you don't want your parens evaluated you can put them in blocks until you need them. It's seductive to think of lit-parens, but because evaluation is at the core of everything, adding more rules about when things are evaluated can make it \*much* harder to reason about.

GiuseppeChillemi

[21:40](#msg60020bc0fe007479e41459ee)About my selectors, they are not complex. In place of using `'mystruct/size`, I often use something like`word/(idx)/(column headings 'size)`. Other times I use this `word/(select-row-gui 'word)/(column headings 'size)` where `select-row-gui`, as you can imagine, open a panel with a `text-list` containing the rows of a table.

greggirwin

[21:44](#msg60020ca3d5f4bf2965ebae62)I can imagine it, and that leads to an obvious line of thought: make it a dialect.

GiuseppeChillemi

[21:48](#msg60020dbcd5f4bf2965ebb0a3)Yes, we are looking at the same blonde: `lit-parens` are really seductive because they give additional control in `compose`when you use parens in blocks. Expecially useful when you need parens to group expressions to give priority like `... if (length? 'word) > 10 [a/(idx)/b]`

[22:02](#msg600210fe99549911fc24d7ab)Gregg, it took years to me to acquire all the knowledge needed to start using dialects. It's not a newbie topic. But I remember being able to use understand and use parens in paths as soon I have read about them. That expressive way has accompanied me until now as one of the most simple and powerful to access block elements. It is a concept that every other newbie will master and use in few seconds. Everything is in one line and It's simplicity makes it a perfect power tool for anyone starting with Red. We need simple tools for immediate use just when someone starts using Red. Dialects are a thing of Pros. We would lose a powerful and ready to use instrument without parens in paths.

[22:08](#msg60021246dc2e4809aa25617a)(Note: above is `... if (length? series) > 10 [a/(idx)/b]`)

Numeross\_\_twitter

[23:17](#msg600222a2d5f4bf2965ebe469)I don't know much about concurrency except from brief wikipedia readings, and I can't stop thinking about this question :  
Would it make any sense to implement as a first model an "easily modable" colored petri net model ?  
It would allow, for example, to declare restrictions to parts of the petri net. For example:  
\* This part of the net is an actor model  
\* This net has only pure functions

And then, after implementing that, one could optimize the actor model or make it easier to use

[23:31](#msg600225c95562a61e9aaaa106)(I like petri nets because they are visual and to me, they seem to be able to display complex stuff intuitively)

## Saturday 16th January, 2021

greggirwin

[17:18](#msg60031fec03529b296bf42109)@Numeross\_\_twitter a graphical component needs an underlying implementation to render. Mixing concurrency models also implies that we have working versions of each model to combine.

There are many thoughts and some core work done on concurrency, but if you want to add a concurrency page to https://github.com/red/red/wiki, we can add notes and thoughts there.

## Sunday 17th January, 2021

GiuseppeChillemi

[00:04](#msg60037f0c5562a61e9aadc9f0)Now I have the time to try diagrammar. Here are the first simplest steppes:

[00:04](#msg60037f11252c0a6ded156642)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/KDTs/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/KDTs/image.png)

[00:14](#msg60038182e578cf1e95f1bbe3)Does anyone recognize this?

[00:15](#msg60038186787d8f79c8080299)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/v2wO/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/v2wO/image.png)

greggirwin

[02:52](#msg6003a686cd31da3d9ab8f22d)Nice! Have you tried the Generate feature with your first example?

[02:53](#msg6003a6a1dc2e4809aa2903de)It's the first public Hello World! diagram. :^)

pixel40

[08:27](#msg6003f4f703529b296bf5f882)Where can I purchase a "Knowledge Module" like in the Matrix Movie. There is too much to learn. Need to learn faster. :-)

toomasv

[10:25](#msg6004107f9632f63d87216df1)@GiuseppeChillemi I don't see how the last line in your second example (`skip ...`) can work. I would expect it to be something like

```
skip (set 'value load/next str 'new probe :value) :new
```

GiuseppeChillemi

[11:49](#msg60042458fb85d46e04e9962a)@toomasv  
It's this: http://www.rebol.net/cookbook/recipes/0042.html

toomasv

[11:54](#msg6004257ed5f4bf2965f064cf)Remind you, DG is written in Red, and `load/next` works differently in Red and REBOL. For diagramming it is ok to use REBOL syntax, but trying it out will fail.

GiuseppeChillemi

[12:02](#msg60042753d5f4bf2965f068db)Thank you, have you resources which explain the differences?

toomasv

[12:17](#msg60042abe4498e01bbfb2a106)Yes, `help` :)

[12:22](#msg60042c08dc2e4809aa2a29bc)Compare:  
REBOL

```
>> str: "one two three"
== "one two three"
>> set [value str] load/next str
== [one " two three"]
>> set [value str] load/next str
== [two " three"]
>> set [value str] load/next str
== [three ""]
```

Red:

```
>> str: "one two three" 
== "one two three"
>> load/next str 'str 
== one
>> load/next str 'str 
== two
>> load/next str 'str 
== three
```

ldci

[12:38](#msg60042fc6d5f4bf2965f07c4c)Hi everybody: The software I wrote with Red for paediatric application about face evolution in children is now open source . You can get the code here: https://github.com/ldci/Face

pixel40

[13:45](#msg60043f6dfb85d46e04e9d6e5)@ldci Wow, I just read through your Research article, just amazed that you used RED for this. I don't know much about OpenCV/RedCV, wish I did though. Keep up the incredible work you do.

ldci

[15:54](#msg60045da299549911fc2a152b)@pixel40 Thanks a lot. Red is really a fantastic language for a lot of applications:)

x8x

[16:14](#msg6004627fd5f4bf2965f0fa2f)Great stuff @ldci ! Thanks for sharing! :thumbsup:

ldci

[16:20](#msg600463d74498e01bbfb32c82)@x8x Thanks. I’ve just updated face.md and deleted some non neccessary files in libs.

toomasv

[16:30](#msg6004662403529b296bf6fb4b)Great work, @ldci, congratulations!

ldci

[16:31](#msg60046675fe007479e419c9ce)@toomasv Thanks. BTW redCV use the matrix-object we developed during yhe last summer:)

GiuseppeChillemi

[16:45](#msg600469ae4498e01bbfb33a58)@toomasv So in Red you are forced to use the same word that contains the source series.

```
/next        => Load the next value only, updates source series word.
  position     [word!] "Word updated with new series position."
```

```
a: {does x: 22 print ["hello"] probe x}
== {does x: 22 print ["hello"] probe x}
>> load/next {x: 22 print ["hello"] probe x} 'a
== x:
>> load/next a 'val
== x:
>> load/next a 'val
== x:
```

```
>> load/next a 'a
== does
>> load/next a 'a
== x:
>> load/next a 'a
== 22
```

While in Rebol it can be any word. I don't understand the reason but it's ok.

hiiamboris

[16:47](#msg60046a1d5562a61e9aafd5b1)reason is less memory pressure

GiuseppeChillemi

[16:49](#msg60046a80d5f4bf2965f10d9f)So, why not `{load/next 'a}`? (Where Red gets the value `a` once `next` is true, and then `set word new-position`}

[16:51](#msg60046b12787d8f79c80a03b7)(note: it's a curiosity and not a complaint)

hiiamboris

[17:03](#msg60046de75562a61e9aafdf83)no idea ;)

[17:04](#msg60046e0691e9b71bade129ae)but guess for compatibility with normal `load`

[17:05](#msg60046e3e91e9b71bade12a24)when your argument's type and meaning changes based on refinements it's kinda bad

GiuseppeChillemi

[17:09](#msg60046f509632f63d8722547d)In this case you map various meanings to the unused datatype. It is like `copy/part` where `part` can be: series, position, number elements. Why you think it is bad? I have started to use this in dialects.

toomasv

[17:09](#msg60046f52dc2e4809aa2ad07b)@GiuseppeChillemi There is no difference between REBOL and Red in this respect. If you want to use exactly same line of code to move forward then both REBOL and Red have to use same word, but you can change word on each line if you want, e.g.

```
>> str: "one two three" 
== "one two three"
>> load/next str 'str1 
== one
>> load/next str1 'str2 
== two
>> load/next str2 'str3 
== three
```

GiuseppeChillemi

[17:12](#msg6004700d252c0a6ded177e89)@toomasv You are right! I have made a mistake:

```
>> load/next a 'val
== x:
>> load/next a 'val
== x:
```

This is the correct version

```
>> load/next a 'val
== does
>> load/next val 'a
== x:
>>
```

It's @hiiamboris fault which has not corrected me! :-)

hiiamboris

[17:15](#msg600470b003529b296bf713cb)bad because I have hard time even imagining how the docstrings would be spelled ;)

GiuseppeChillemi

[17:24](#msg600472bbcd31da3d9abacca8)Now I have understood and no, I do not map different meaning but the working of the element in the meaning which the arg is representing (as `copy/part`)

greggirwin

[17:45](#msg600477d5fe007479e419f906)@ldci fantastic! Thanks for posting.

@pixel40 if you find a way to jack in, let me know. I could use it too. :^)

[17:54](#msg600479b8e578cf1e95f3f63c)@GiuseppeChillemi using @toomasv's example, this is correct for Red:

```
parse text blk-rule: [
        some [
            str:
            newline |
            #";" [thru newline | to end] new: (probe copy/part str new) |
            [#"[" | #"("] blk-rule |
            [#"]" | #")"] break |
            skip (value: load/next str 'new probe :value) :new
        ]
]
```

[18:07](#msg60047ce95562a61e9ab00871)I added a note about it to https://gitter.im/redlake-comm/DiaGrammar

pixel40

[20:57](#msg6004a4c3fb85d46e04ead60e)@greggirwin Just a silly question. Would RED work on a linux based phone like Pine Phone?

greggirwin

[21:51](#msg6004b14be578cf1e95f47f44)@Respectech is our resident expert on that. I haven't tried it.

[21:52](#msg6004b1a6e578cf1e95f48002)He owns https://ameridroid.com/ and they sell Pine64 products.

pixel40

[21:56](#msg6004b29d99549911fc2ae794)@greggirwin Thank you, that's a great site. Just what I wanted. I won't use Google anymore, just ask you LOL

greggirwin

[21:57](#msg6004b2e4fe007479e41a8765)I know a lot about a little. :^)

## Monday 18th January, 2021

GiuseppeChillemi

[00:27](#msg6004d5f103529b296bf81066)@ldci Great work!

ldci

[06:14](#msg60052751cd31da3d9abc60ff)@GiuseppeChillemi Thanks

planetsizecpu

[07:37](#msg60053aa7787d8f79c80beab1)@ldci good job!  
@greggirwin An old journalist from the parliament in my country once said on TV:

A specialist is someone who knows almost everything about almost nothing.  
A journalist is someone who knows almost nothing about almost everything.

So you are a specialist, the right person to ask. 😊

greggirwin

[08:15](#msg600543985562a61e9ab1cf76):^) My Dad used to say that an expert is someone who knows more and more about less and less until they know absolutely everything about nothing.

rcqls

[19:30](#msg6005e1e397132e2480eb84cc)Very wise father! Lucky man!

GiuseppeChillemi

[19:59](#msg6005e89ad8bdab47394459db)I have seen something new for red in Diagrammar:

[19:59](#msg6005e89dd8bdab47394459df)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/ObEp/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/ObEp/image.png)

[19:59](#msg6005e8bc8816425540d596e5)How have added inner and outer hyperlinks? Is it a new Red feature?

[20:01](#msg6005e92d8816425540d597db)I like this help doc navigator, it reminds me of Windows Help. I see it simple to create: a text-list, a text-area and 2 button. Is there other magic behind?

greggirwin

[20:14](#msg6005ec42ac653a0802c8914c)It is magic, using Red's \[rich-text](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html) style and \[rich text dialect](https://github.com/red/docs/blob/master/en/rtd.adoc), driven by a custom parser against an internal make-doc/markdown like format used for help content.

GiuseppeChillemi

[20:18](#msg6005ed056b20cf7730c1efb5)@greggirwin Will you share the magic with us?

greggirwin

[20:20](#msg6005ed993855dd07fd627a2e)Someday, yes. :^)

Respectech

[21:21](#msg6005fbce753011449b001b00)&gt; @greggirwin Just a silly question. Would RED work on a linux based phone like Pine Phone?

Yes. I have a PinePhone running Ubuntu Touch and Red works fine. Just make sure you run the Linux ARM version. You can even run Red/View by using the GDK branch.

BTW, PinePhones are selling really well on our site. They are selling out as faster than we are getting them in.

pixel40

[21:55](#msg600603de97132e2480ebde63)@Respectech Is the 3Gb /32 Gb version available?

## Tuesday 19th January, 2021

greggirwin

[04:36](#msg600661c0cf8b8277343d15d2)Coming from red/chit-chat, @GiuseppeChillemi the Chrome bookmarks file contains a single string field which takes up about half the file. It's called `sync-metadata` and it takes about half the total parsing time here for just that field. That is, if I remove that field, it takes half as long to parse.

Here's the rule for string fields:

```
string-literal: [
		#"^"" copy _str [
			any [some chars | #"\" [#"u" 4 hex-char | json-esc-ch]]
		] #"^"" (
			if not empty? _str: any [_str copy ""] [
				;!! If we reverse the decode-backslash-escapes and replace-unicode-escapes
				;!! calls, the string gets munged (extra U+ chars). Need to investigate.
				decode-backslash-escapes _str			; _str is modified
				replace-unicode-escapes _str			; _str is modified
				;replace-unicode-escapes decode-backslash-escapes _str
			]
		)
	]
```

Note that it copies the string first, which has alternative rules for escaped characters. Then is has to handle escaped characters, which is does naively by parsing the string twice more, modifying it in place if needed. Note that this happens for all literal strings in the JSON, not just the big metadata string. While the code is very simple, it's also brutally inefficient.

Just replacing the internal `translit` function used by the escape handling funcs with an R/S equivalent might not be too hard, and should provide a nice boost. Optimizing will require some heuristic choices for allocations if the string has to grow, but the rest of the codec might not need to be touched, giving us a good ROI.

[04:37](#msg600661f1a2354e44ac92be89)@hiiamboris what do you think?

[04:38](#msg600662608816425540d6ad2b)That said, here are my local profiling results:

```
Time         | Time (Per)   | Memory      | Code
0:00:00.001  | 0:00:00.001  | 12288       | [load/as bf-nano 'json]  ; ~1K
0:00:00.714  | 0:00:00.714  | 24276068    | [load/as bf-sm 'json] ; ~1.5M
0:00:02.439  | 0:00:02.439  | 118880976   | [load/as bf-lg-no-meta 'json] ; ~5M
0:00:05.148  | 0:00:05.148  | 173835384   | [load/as bf-lg 'json] ; `10M
```

pekr

[06:26](#msg60067ba5d8bdab473945aa9b)Looks nice, Gregg. Could codec be a mixture of Red and R/S code? I mean - it would have to be pre-compiled, right?

toomasv

[10:00](#msg6006adbed8bdab4739462c22)I see latest downloads to be from January 8th. Is there a problem?

hiiamboris

[10:03](#msg6006ae603855dd07fd643a33)@x8x

ne1uno

[10:39](#msg6006b6cc3855dd07fd644e2e)https://static.red-lang.org/dl/auto/red-latest-source.zip server error

x8x

[10:42](#msg6006b7a98816425540d78292)@hiiamboris @ne1uno Should be fine now, had to reboot a server to increase memory to fix build issue.

hiiamboris

[10:43](#msg6006b7c2410c2214400b9eef):+1:

[10:45](#msg6006b82e3855dd07fd645158)@greggirwin not only it geometrically increases in time, but also buggy:

```
s: "abc\^Adef"
0.0 μs	[save/as bin: #{} s 'json]
101 μs	[s2: load/as bin 'json]
s2: "abc\\u0001def"
s2 == s : false
```

[10:45](#msg6006b851cf8b8277343dea03)I'll see what I can do

x8x

[10:46](#msg6006b8a3ac653a0802ca6f9e)@ne1uno Just curious why are you using source archives instead of a git clone? We plan to remove archives download very soon.

ne1uno

[10:51](#msg6006b9a197132e2480ed7d6a)I haven't recently, just to test access. I'm usually getting archive master or d2d from github

[10:51](#msg6006b9a1a2354e44ac9393ee)git is flaky on a slower connection in windows.

[10:53](#msg6006ba1f410c2214400ba563)replace source link to https://codeload.github.com/red/red/zip/master

x8x

[10:57](#msg6006bb266244ee14509ac9a8)@ne1uno Ok, thanks! Good to know, so maybe we'll leave a line mentioning that option.

ne1uno

[10:59](#msg6006bb7e6244ee14509aca49)https://github.com/red/red/archive/BRANCH.zip works too

x8x

[11:02](#msg6006bc60004fab47414f5d18)@ne1uno Still curious about git being flaky on slow connections, it's supposed to download only deltas, is it slow doing that or does it rise errors?

ne1uno

[11:08](#msg6006bdc8753011449b01dff2)verizon or git changed something and I get timeouts, with any repo, gitlab too. after a little research I see problem reports going back for years with no resolution.

[11:08](#msg6006bdc96244ee14509acf86)beginning of my data month un-throttled there are no issues.

[11:16](#msg6006bf73cf8b8277343dfdb1)many people using a phone or hotspot with marginal connection can have problems . the timeouts built into servers have gotten shorter for anything under 100kbps

x8x

[11:17](#msg6006bfc3a2354e44ac93a27f)@ne1uno Humm.. if you can't change provider and their DPI is messing things, have you tried using a VPN? WireGuard is pretty solid on slow connections. Good luck! We're getting OoT here.. :smiley:

ne1uno

[11:19](#msg6006c04da2354e44ac93a4dc)it affects video too. instead of increasing buffers a few seconds, the players are stuck refilling every few seconds. unwatchable. the digital divide

hiiamboris

[14:56](#msg6006f31edfdbc1437f9b8171)@ne1uno as I've recently discovered sometimes providers don't like it when you share your phone connection with the PC. What helped me is setting TTL=65 for the main OS and VMs.

Respectech

[16:39](#msg60070b5da2354e44ac947199)&gt; @Respectech Is the 3Gb /32 Gb version available?

@pixel40  
Yes, we just got confirmation that more are on their way last night - this time it will be preloaded with the Mobian Convergence Package (Debian Mobile) and USB-C Dock on the 3GB model (10/100 Ethernet, 2x USB type A ports, HDMI digital video output and power-in via USB-C). We don't have an estimated landing date at our warehouse yet, though. You can preorder it here: https://ameridroid.com/products/pinephone?variant=33012150796322

[16:48](#msg60070d75ac653a0802cb5aa4)Even if you don't use this as a phone, it makes a great mobile hardware platform for Red applications. ;-p

greggirwin

[16:49](#msg60070da2753011449b02bcb7)Very cool @Respectech. Thanks!

Respectech

[17:06](#msg6007118d410c2214400ca205)@greggirwin Thanks for your support!

rcqls

[17:43](#msg60071a406244ee14509bd663)@Respectech No chance to preorder this beautiful PinePhone for a delivery in France?

greggirwin

[18:03](#msg60071edaac653a0802cb8a29)New \[codec chat room](https://gitter.im/red/codecs) now available.

pekr

[18:14](#msg6007216dcae490555f550bde)OK, so I can finally ask about the DTS:X Pro 30.2 virtual channel codec, which I need to run on my 5 speakers :-)

greggirwin

[18:14](#msg6007219fd8bdab473947665f)The 11.2 Atmos codec should come soon. ;^)

Respectech

[18:47](#msg6007295aa2354e44ac94ca32)&gt; @Respectech No chance to preorder this beautiful PinePhone for a delivery in France?

@rcqls Yes, we deliver to France. :-)

rcqls

[19:42](#msg6007364136db01248a8b77ab)@Respectech Great!

pixel40

[21:23](#msg60074dde36db01248a8bb7bb)@Respectech Thanks, just ordered.

## Wednesday 20th January, 2021

rebolek

[09:29](#msg6007f7f236db01248a8d5c6e)I have a wish https://github.com/red/REP/issues/93

## Thursday 21st January, 2021

gltewalt

[03:02](#msg6008eeaa97132e2480f36206)Never tried it, but at a glance thought that since `key-arg` can be a block in `remove/key` that one could pass multiple keys to it

greggirwin

[03:08](#msg6008f040cf8b82773443d3b4)Nope. You can only remove one key at a time. You can't use blocks as keys today, but we shouldn't rule that out as a possibility in the future. Also, the premise of `remove` is simple. If you need more, that's what wrappers are for. Now... `pick` is an interesting one to consider, but I think we're OK with a `pick-multiple` wrapper until enough people ask for it.

[03:09](#msg6008f05adfdbc1437fa0e2e2)But, boy, it's an easy one to want to do. :^)

[03:18](#msg6008f28edfdbc1437fa0e8e0)From @rebolek 's REP, and with an example from @Oldes, here's a mezzanine that does it. Play and comment.

```
remove-each_map: func ['word [word! block!] data [map!] body [block!]][
	foreach [key val] data [
		if do body [remove/key data key]
	]
	data
]
m: #(a 1 "b" 2 c #[none] d: 3) 
rm: remove-each_map [key val] m [any [string? key none? val]]
```

gltewalt:matrix.org

[03:18](#msg6008f28ecf8b82773443d97b)You can feed it a block of stuff but nothing happens

[03:20](#msg6008f2ec004fab47415549f2)Even if it did work with a block of multiple keys, a loop would have to be there somewhere.

greggirwin

[03:21](#msg6008f32c97132e2480f36e6e)I don't know why the `key` arg supports `block!`. Anybody else know what I'm missing?

gltewalt:matrix.org

[03:21](#msg6008f34736db01248a8ffee3)Well, obviously not me 😁

[03:29](#msg6008f52a97132e2480f3733a)Does `remove` predate `remove-each`?

greggirwin

[03:34](#msg6008f638410c22144011a3a0)Yes.

gltewalt:matrix.org

[03:37](#msg6008f6e1dfdbc1437fa0f595)Guessing that there was a plan to let it loop through a block of keys, but it wasn't finished?

greggirwin

[03:42](#msg6008f8156b20cf7730c9d11c)No, if it's there by design (which I'm not sure of right now), it's likely because if we can add block key support to maps, you'd need it.

toomasv

[06:19](#msg60091d06410c221440120322)No need for `'word` argument here. Without it func works.  
But, it works only because `key` and `val` are global. My alteration:

```
remove-each_map: function [data [map!] body [block!] /only][
    unless only [bind body :remove-each_map]
    foreach [key val] data [
		cond: either only [find body key][do body]
		if cond [remove/key data key]
    ]
    data
]
```

`key` and `val` are make local here, and you can also feed it block of keys to remove.

```
>> rm: remove-each_map/only m ["b" c]
== #(
    a: 1
    d: 3
)
```

Oldes

[11:26](#msg600964cfcf8b82773444fbbe)I believe that Rebolek's wish was, because he doesn't want to use such a mezzanines, because if `foreach` works with map, `remove-each` should work with them too.

[11:28](#msg6009654a2cb18a437c311c09)&gt; I don't know why the `key` arg supports `block!`. Anybody else know what I'm missing?

I think that there is missing implementation:

```
b: [[1] "foo"] remove/key b [1]
;==  [[1] "foo"] ;<-- but it should be []
```

[11:29](#msg60096581d8bdab47394d77c2)(I would not recommend anybody to use blocks as a keys btw.)

hiiamboris

[12:35](#msg600974f7410c22144012f565)then why not `any-block!`?

[12:35](#msg60097524cae490555f5b1af7)more like it was there for bulk removal

greggirwin

[17:57](#msg6009c07adfdbc1437fa32134)Thanks @toomasv.

@Oldes I understand the wish, but mezzanines are a great way to see if we like ideas before spending much more time and thought on R/S code and design issues. Yes, it \*could* work with maps, but I (personally) don't know yet if it \*should\*.

This approach is also important to me because language changes are forever, or at least much, much more painful to change later.

[18:13](#msg6009c445cf8b8277344616ce)On `/key` with blocks, I didn't remember that this was supported, maybe hoping it wasn't because it raises other questions (general interface for key-val blocks). However, the reason and solution is that `/only` is not implied (and we don't want to complicate the interface for this IMO, so you need to do it like this: `b: [[1] "foo"] remove/key b [[1]]`.

If `/only` is assumed, you can't use multi-value keys, e.g. `A 1`, which should be a much rarer need. That's broken today anyway, because it removes the next value after where the key is found, which is \*part* of the key in that case.

```
>> b: [1 2 "foo" 3 4 5 "bar"] remove/key b [3 4 5]
== [1 2 "foo" 5 "bar"]
```

If others agree, the simple option is to open a ticket for using `/only` internally (%series.reds @L845) on series in this case, which lets this work for the most general case.

[18:17](#msg6009c532753011449b0a01e0)Blocks can be used as compound keys, which is powerful, but I think the best practice there is do define an API for when you know you're doing that, because nobody wants to forget `/only` just once in their code. :^)

toomasv

[18:53](#msg6009cd916b20cf7730cc3c90)@greggirwin Sorry, it seems I misunderstood the purpose of this snippet and responded hastily :flushed:

hiiamboris

[18:53](#msg6009cdba753011449b0a1bde)&gt; If others agree, the simple option is to open a ticket for using /only internally (%series.reds @L845) on series in this case, which lets this work for the most general case.

I'm against designing blindly, and not a fan of `remove/key` btw. It can imply `/only` and remove block + value in the blocks. Will it also imply `/same`? What about maps? Will maps support block keys? Isn't the main use of `remove/key` maps, not blocks? And then why block keys and not any-block? ...Or it can take a block with multiple keys to remove? ...Or we may forbid block for key argument altogether. What is most reasonable behavior? Do we have use cases? And how does it fit into the big picture of other series funcs design? `remove/key` is already an outlier, unlike anything else in Red (or is not?), and twisting it further won't bring any beauty to it's design. Instead of extending special cases with other special cases we should focus on solutions that bring generality.

[19:02](#msg6009cfc836db01248a9265bb)Speaking of which.. I would rather like to see `remove at map key` instead of `remove/key`. \*Why can't* we do that? I know, unordered and such, but so what? `series/head` is 32-bit, map key is 32-bit, perfect fit ;)

greggirwin

[19:06](#msg6009d0b06244ee1450a33118)What does `at key` return?

[19:07](#msg6009d105dfdbc1437fa35487)I don't think any of us really \*like* `remove/key`, it was just the best of the worst alternatives. Certainly, if we can come up with something definitively better, that's great.

hiiamboris

[19:08](#msg6009d1393855dd07fd6cb071)&gt; What does `at key` return?

Same map with it's "head" property set to a certain key in the hash table.  
(Right now map is a `hash!` with it's head unused anyway, but whatever the implementation is, I'm talking more about interface right now)

greggirwin

[19:08](#msg6009d13fac653a0802d2de85)Not to worry @toomasv, this is general design and idea chat right now. All input, especially concrete examples, help.

[19:09](#msg6009d16edfdbc1437fa3558c)@hiiamboris so then you need to support `index?` as well, correct?

[19:10](#msg6009d19eac653a0802d2e032)And that leads to asking about all other series related actions.

[19:13](#msg6009d247d8bdab47394eb162)And if `at` is used, does it need to support `/case` for maps like `select` does?

[19:14](#msg6009d27f8816425540dfdc43)Or is `/case` implied, as with `remove/key`?

[19:20](#msg6009d40acf8b8277344645ad)Personally, I think it would be better to have a true key-value interface for blocks, for consistency. Because `remove/key` on blocks today also doesn't enforce `/skip 2`, which makes it consistent with `find/select`, but I think not with tPoLS.

`remove/key` exists as a workaround, really, so maps can hold all kinds of values. Originally, for those who don't know, setting a map value to `none` removed the key. That's how old associative arrays work, and most everyone else followed suit. But that meant maps could never have a `none` value for a key, which is a huge limitation, and makes for other workarounds users have to deal with. Using `unset!` as the special "remove me" value is no better. The old model is also inconsistent with anything else in Red.

hiiamboris

[19:28](#msg6009d5d3a2354e44ac9bf77a)&gt; @hiiamboris so then you need to support `index?` as well, correct?

No need really. But possible. Although then `index?` would have to return the key, not an integer.

&gt; And if `at` is used, does it need to support `/case` for maps like `select` does?

Good point. My first thought then is to have `remove find map key` support, and `at` will be like without `/same` or `/case`. Or have just `find`, no `at`.

&gt; Or is `/case` implied, as with `remove/key`?

See? That's why I already don't like `remove/key`. It has /case implied but it's name never tells that. I didn't even know that.

&gt; And that leads to asking about all other series related actions.

Again, `at` (or `find`, whatever) support does not have to involve anything else. But let's play and imagine what is possible. We already have iteration (foreach), why can't we support `next` and `back`? We know it will be unordered iteration, and `skip map 2` won't make sense, but `next` and `back` will make sense, if only just to traverse the whole thing.  
`append` and `insert` make sense and may work the same way `extend` does. Do we want them? If only for consistency with series, but I don't see any value here (yet).  
`remove` when called repeatedly could empty the map (orderless). What `remove-each` is supposed to do but step by step. And `clear` already works on a map.  
`swap` - would be possible to swap k/v pairs between 2 maps. Could be extended to blocks.  
`alter` won't work. `sort` &amp; `reverse` too.

[19:30](#msg6009d66ecae490555f5c4307)I propose we write a wiki entry with all series actions and everyone could write a meaning for every action. And we'll have an overview, see if it's sane or not ;)

greggirwin

[19:37](#msg6009d80b6244ee1450a34865)This is the hard part of design. I don't like rippling changes in general, which is like your comment about designing blindly (with which I agree). It's also about how \*useful* a feature is. We can't be 100% consistent, or include every feature, so we weigh cost/benefit in multiple axes. I'm all for a wiki, of course. :^)

If we can agree that maps are, by design, unordered, then `[head tail head? tail? next back first last at skip index? sort swap reverse]` make no sense, and are also not useful in general because any changes to the map can't be reasoned about in non-atomic use cases.

Can we agree on that much to start?

[19:45](#msg6009d9eb6244ee1450a34cf8)A fundamental design question, when faced with what any of us think is a bad bit of design, is "How would you have done it?"

I think this is what makes Rebol so special, and so different. Carl spent a \*loooooong* time thinking about these issues, and he got \*sooo* many things right. Our goal now is to keep all the best elements from that, not screw them up (do no harm :^), extend and refine based on what we know now, after 2 decades of using Redbol langs in the real world. Balance elegance, simplicity, consistency, usability, and pragmatics. Oh, and find good names for everything. ;^)

giesse

[19:58](#msg6009dccc004fab474157c9b3)as I've said in the past, it would be better to turn `map!` into a `series!` type (ie. a list of key-value pairs), because that fits best with the rest of Red. as it is right now it's a weird special case.  
I don't really see the benefit of it being unordered, but I'm also not sure it matters that much either way, unless there is a real use case for it being ordered. (the only "use case" for unordered is that it "allows more freedom for the implementation", which is a \*meh* reason to me.)

hiiamboris

[19:58](#msg6009dcf98816425540dff9b7)@giesse benefit is O(1) insertion/removal

giesse

[20:03](#msg6009de02a2354e44ac9c0d93)@hiiamboris one could use a linked list for the key order, again this is just implementation details, and i'm not sure that anybody really cares about it being ordered (or said another way, where the key ends up when you add a new one).

hiiamboris

[20:15](#msg6009e0dc36db01248a929dbb)That makes sense. But also will force us to interface with maps as with any other series, no? E.g. we would have to write `find/skip` and `remove/part 2` and `insert/only insert key value` all the time.

[20:16](#msg6009e10d36db01248a929e59)Brings me back to my idea that blocks should carry `skip` value within themselves.

greggirwin

[20:16](#msg6009e10f753011449b0a596f)Maybe https://github.com/red/red/wiki/%5BDOC%5D-Comparison-of-aggregate-values-(block!-vector!-object!-hash!-map!) is a good place to make notes related to this topic.

[20:23](#msg6009e2ca004fab474157df44)I don't know that we can say maps are a special case, anymore than objects are. As @9214 documents clearly in that wiki page, they are different structures with their own behaviors. Where it gets sticky is (especially if you're a Bertrand Meyer fan :^), you want maximum leverage in action/name consistency but "things that \*are* different should \*look* different" is another design view.

gltewalt:matrix.org

[20:56](#msg6009ea622cb18a437c32b061)There's a reason they are called hash maps elsewhere. Doesn't being stored internally as a hashtable make them a special case?

greggirwin

[21:01](#msg6009eb8c97132e2480f63a30)That comes back to information leakage. The more you can hide, the less people can depend on internal details. So we can document how they work today, and if we ever changed it so maps were a lot slower people could be upset, but if we say "Maps exist as extensible key-value structures, which is all you should depend on.", then...well, they could still be irritated when we slow down their code for other reasons they may not care about. Conversely, if we say they're ordered, for those benefits, then change to unordered for performance reasons and have to give up \*behavior\*, we break code.

hiiamboris

[21:08](#msg6009ed44ac653a0802d33b1e)Another maps advantage is automatic deduplication. If we made it ordered, how would we handle this?

Oldes

[21:31](#msg6009f2a297132e2480f64eeb)&gt; If we can agree that maps are, by design, unordered, then \[head tail head? tail? next back first last at skip index? sort swap reverse] make no sense, and are also not useful in general because any changes to the map can't be reasoned about in non-atomic use cases.

I agree with that. But I don't think that should be a problem why one should not use `remove-each` on `map!`.

[21:31](#msg6009f2c2753011449b0a8673)Actually I think it is quite natural. In the same way, that `remove/key where key` should take `key` as it is and not to be used as block of many keys. To be honest.. I'm not able to figure out a scenario, where I would know, that I want to (for example) remove keys 1, 6 and 34 in one call.

[21:57](#msg6009f8b76b20cf7730ccbd69)&gt; one could use a linked list for the key order, again this is just implementation details, and i'm not sure that anybody really cares about it being ordered (or said another way, where the key ends up when you add a new one).

@giesse should not it be than a `list!` type instead of `map!`? I think it's unordered, because if you keep adding values into the map, in one moment you must extend the hash and there is no assurance that the keys will be in the same order after re-hashing with the new hash-table size. Maybe i'm already too tired, but I don't see any advantage to have a `map!` as a `series!` (with all available actions mentioned by @greggirwin above).

[22:17](#msg6009fd5d2cb18a437c32e57b)@greggirwin btw... what's going on with @dockimbel ? I think that many mayflies died since he was last time active here in Gitter.

greggirwin

[22:38](#msg600a027f3855dd07fd6d44eb)He's been in the cave, recovering from Gitter poisoning. Every week or so I throw onion rings into the cave. As long as I hear him devouring them I assume he's still alive. Unless he was killed by robots who like onion rings and post commits to his github account.

## Friday 22nd January, 2021

planetsizecpu

[11:29](#msg600ab70036db01248a94c3a4)He has a special character, which we respect, but without this character he would not be our appreciated Nenad, so go throwing onions, we are anxious for hear him 😉

loziniak

[13:13](#msg600acf668816425540e279f6)Hi. Is Red's compiler going to work in parallel?

I've heard that it's not easy to parallelize compilation, and that it usualy doesn't matter, because big projects have parts that can be compiled independently anyway (like classes in Java). This is not the case with Red, because we only have `#include`, `do` etc. to help with dividing code into smaller parts.

So I thought maybe in Red it could be achieved at module level? Also fast compilation is important mostly in big projects, which usually can be modularized easily and compiling couple modules in parallel perhaps could be doable. I imagine some simple steps (like explicitly declaring globals/imports) that could help. Is parallel compilation perhaps taken into account when you design modules?

hiiamboris

[13:20](#msg600ad11697132e2480f888ab)Good consideration. I think even include-like model can be parallelized if we build a tree of dependencies.

loziniak

[13:49](#msg600ad7f3dfdbc1437fa606c8)It's frustrating watching my computer struggle with the compilation of my project for 5 minutes (it's really old hihi!), when I could to this in 2 minutes :-)

hiiamboris

[13:56](#msg600ad9816244ee1450a5e7dd)This should be solved simpler, by automatically exporting \*everything* into libRedRT. And then linking with it.

loziniak

[14:10](#msg600adcd76244ee1450a5f170)Probably in bigger projects most of Red is exported to libRedRT anyway. This could have one more advantage – no need to update libRedRT on every bigger change (when exports change). Just generate it and forget, until you use other version of Red.

giesse

[14:53](#msg600ae6eb3855dd07fd6f9f58)&gt; That makes sense. But also will force us to interface with maps as with any other series, no? E.g. we would have to write `find/skip` and `remove/part 2` and `insert/only insert key value` all the time.

no, because a map is a series of key-value \*pairs\*. ideally that would imply a pair type, but, i don't really think it makes real difference. i'd be ok with it behaving like just a list of keys for the purpose of series actions.

[14:55](#msg600ae7653855dd07fd6fa18f)&gt; I don't know that we can say maps are a special case, anymore than objects are.

you can't remove words from objects (which should really be named contexts, but, let's not digress). in fact, right now, you can't even add words. therefore, yes, contexts are very special.

[15:00](#msg600ae8a46b20cf7730cf2311)&gt; Conversely, if we say they're ordered, for those benefits, then change to unordered for performance reasons and have to give up \*behavior\*, we break code.

I really don't buy the performance argument. First of all, i'm not sure anybody cares about preserving key order between insertion/removal. But even if you do, an additional linked list for the order is not such a big deal in the big scheme of things, and, in the general case usage that you have in Red it hardly makes sense to switch to some specialized structure; the current hashtable works and does preserve order.

[15:03](#msg600ae931d8bdab473951a8f5)&gt; @giesse should not it be than a `list!` type instead of `map!`? I think it's unordered, because if you keep adding values into the map, in one moment you must extend the hash and there is no assurance that the keys will be in the same order after re-hashing with the new hash-table size. Maybe i'm already too tired, but I don't see any advantage to have a `map!` as a `series!` (with all available actions mentioned by @greggirwin above).

the advantage is that it will behave like every other series and there won't be a need for hacks like `remove/key`. you'd automatically get `remove-each` as well as the other series natives and mezzanines.

hiiamboris

[15:19](#msg600aed02d8bdab473951b32e)I see your idea. And I like it ☻

rebolek

[18:39](#msg600b1bd86244ee1450a6a889)@greggirwin  
&gt; Yes, it could work with maps, but I (personally) don't know yet if it should.

`foreach` works with maps, why shouldn't `remove-each`?

greggirwin

[19:12](#msg600b23ae36db01248a95fa0f)I wasn't even sure I wanted `foreach` to work, but it does now, and it's a special case requiring exactly 2 words. So that's already an exception. Yes, it provides a shortcut, but now it's a justification for more additions which may over time weaken the core language. Maybe weaken is the wrong word, but the idea that the more things the core language and semantics do, the more stuff is in there which has to be built, maintained, and considered for compatibility and general language understanding.

I often ask for use cases and concrete examples. What I may also start doing is asking what other languages support X, or if people using them have asked for X. This is \*not* so we can include all those things, but so we can see holes that really need to be filled, benefitting users. That's hard, and may only be clear in hindsight, because some things that seem like a good idea will turn out not to be and we won't know until they've been around for a while.

Already for this request we have other ideas about removing multiple keys. Do we want that? If so, do we also want that for blocks?

This is why I love, love, love using mezzanines to play with ideas. If an idea gains traction, and is refined over time, even entire suites of them for things like a single key-val interface to series/objects/maps, then we can make it standard and eventually convert to R/S or such.

In general, then, is it OK for me to say "Why shouldn't we take that approach, almost always?"

https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars) was originally meant for people coming from other langs and asking for features, but it just as readily applies to Reducers (myself and Nenad included). As I noted there:

&gt; The burden is not on Team Red, or its designer to justify why it shouldn't be added.

## Saturday 23th January, 2021

ldci

[12:41](#msg600c19836b20cf7730d20522)Hello: I have an Aquarius 4.5 ubuntu phone with a mediatek ARM Mali-400 GPU. Do you think we can compile red applications for this phone?

Respectech

[16:46](#msg600c52dba2354e44aca233f8)You should be able to.

## Sunday 24th January, 2021

ldci

[08:54](#msg600d35d536db01248a9ab451)Another question. I try to compile for Android:

```
Compiling to native code...
*** Warning: OS_TYPE macro in R/S is redefined
*** Compilation Error: invalid path value: image/extract-data 
*** in file: %/Users/fjouen/Programmation/Red/tests/datatypes/binary.reds 
*** in function: red/binary/to
*** at line: 1 
*** near: [1031x7 
    proto: image/extract-data as red-image! spec EXTRACT_ARGB
```

[11:15](#msg600d56dc97132e2480fe8903)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/csEj/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/csEj/image.png)

hiiamboris

[11:22](#msg600d58698816425540e880f7)wow `azerty` keyboard

ldci

[11:42](#msg600d5d21410c2214401cc64f)There are the results of testing Red on Ubuntu phone. No problems for compilation with -t RPi or -t RPI-GTK. Some libs are required, but unfortunately apt-get fails. Ubuntu version (15.04) is too old. However these tests show that Red could be used with smartphones:)

hiiamboris

[11:51](#msg600d5f28a2354e44aca48fb4)Does it fail because it only has an older version of `libcrypto`? If so, which version?

ldci

[16:19](#msg600d9e26dfdbc1437fac8909)@hiiamboris It doesn’t find libcrypto. This a 15.04 ubuntu kernel

hiiamboris

[16:29](#msg600da068a2354e44aca53651)I wonder if Red really needs 1.0.2/1.1 version of this lib or 1.0.0 would have worked the same.

ldci

[16:29](#msg600da087ac653a0802dc56d8)Ni idea:)

meijeru

[18:42](#msg600dbfb2ac653a0802dca987)I have looked at Red's web presence and found 8 different homepages, some of which are not kept up-to-date. I have sent the list with my comments to @dockimbel and @greggirwin. Could at least one of them make a statement here about which homepages are worth bookmarking, and which are either obsolete or actually still in development?

greggirwin

[19:01](#msg600dc3f22cb18a437c3bee79)@meijeru if you sent it recently, I haven't seen it yet, sorry. How did you send it?

@ldci there was a HUUUGE amount of Android work done in recent times, but I don't know it's merge status.

meijeru

[19:05](#msg600dc4e897132e2480ff9d45)Just now.

[19:05](#msg600dc4f6d8bdab4739586aad)A PDF by email.

greggirwin

[19:08](#msg600dc5bc97132e2480ff9e75)Got it. Thanks!

ldci

[21:31](#msg600de7408816425540e9dff5)@greggirwin I’m using Red every day in intensive care unit in hospital and for a project we’ll get a lot of android tablets from industrial partner. and of course I would prefer use Red :)

GiuseppeChillemi

[22:16](#msg600df1b097132e2480000b5a)&gt; @ldci there was a HUUUGE amount of Android work done in recent times, but I don't know it's merge status.

Waiting for it with the light of love coming out from my eyes.

## Wednesday 27th January, 2021

greggirwin

[20:08](#msg6011c8229238c531ad08d4d2)Coming from :point\_right: \[chit chat](https://gitter.im/red/chit-chat?at=60105aaad8bdab47395f3a1a)

It's important that people have choices, and there are a lot of big picture thoughts here related to the x-net, a Red browser, and more. I like and support the idea of UPXing (because it is an extra step, but can be automated) for a few reasons:

While it does add complexity, it reduces the wire and storage footprint. Yes, we have huge desktop systems with more RAM than we use (most of the time), even in an SBC context. But it all adds up. We do have to stop thinking in terms of floppy disks and more of "If you're a secret agent, you want your entire system to fit in your back molar and update quickly when the plan changes, and plans always change." In reality it's "how big is a web page and how easy is it to use?" That's our competition as much as anything else.

Consider time. It's often our enemy. How many old versions of apps do you keep for compatibility? Do they have an environment they can run in? You saved that too? The data format changed and you need an old version? What if you could keep a history of every version, like we do with source code?

Don't think about us as devs, think about businesses, people in other parts of the world where cost gravity hasn't helped enough and maybe 256M RAM and 2GB storage is "all" they have. Maybe your user or "agent" is an IoT device.

This is about fighting complexity, and complexity isn't just code size. Code has space and time complexities as different axes. Sometimes you trade one for the other. As devices have exploded in resolution options, that adds complexity in having to deal with it. And not just for us. A user may have an \*entirely* different experience on a desktop, browser, tablet, or phone.

The push to be popular, to follow trends and do what others are doing, to be competitive on their terms is a full time job. Trying to move software forward, for both creators and consumers is also a full time job. We have to choose how to spend our time. While fashion changes rapidly we have, as an industry, forgotten and lost so many great ideas and fundamental principles. My goal, and I think Nenad and I agree here, is \*not* to harken back to the old days trying to be cool by doing things just like they were done then. That's following fashion. But to learn and take inspiration from how much they did with so little. Their creativity, borne of necessity, is what we need.

Our "necessity" is very different today, but people haven't changed much at all compared to technology. Of course, people can be easily reprogrammed, as evidenced by the rise of the phone. People are great consumers, whether it be modern food or modern media. Give them what they want and they will eat all they can. What I hope we can do is let some light into the cave, lure people out, and empower them. Not just to build software, only a few will do that, but to explore their own creativity and curiosity whatever their circumstances may be.

To that end, we have to distill things to their essence, while presenting them in a pleasing way. We have to include enough fat, sugar, and salt, that they enjoy the experience, but make it nutrient dense and show them that trying new things, simpler things, being more than a passive consumer, can be rewarding. This is what Personal Computing is about.

## Thursday 28th January, 2021

greggirwin

[00:33](#msg6012065a9238c531ad097e0d)\[DiaGrammar 1.1 is available!](https://www.redlake-tech.com/blog/2021/01/diagrammar-1.1-available-now/)

rebred

[11:45](#msg6012a3be32e01b4f715bb8aa)are there any plans of having Red compile to the Raspberry Pico microcontroller ?

pekr

[15:26](#msg6012d78c428d9727dd3cc474)Seems Direct2D backend just got merged to Master? :-)

hiiamboris

[15:28](#msg6012d81d063b6c68d522e202)Yep. Hooray!

planetsizecpu

[15:52](#msg6012dda1ae4b9b27c183916e)I tested my game and run as normal 🎉

rebolek

[16:56](#msg6012ecba428d9727dd3d03c3)@rebred that would be wonderful but rPi pico has 264kB RAM and just running Red on my machine takes more than 1,5MB. What could be run there is Red/System compiled programs. R/S supports ARM, I'm not sure what exactly are the differences between ARMv6 and ARMv6M used by Cortex-M0+, I expect something is missing but I'm no expert.

[16:56](#msg6012ecd484e66b7f7eb7b2fb)When I have a RPi pico I will certainly try it.

[16:58](#msg6012ed389d5c644f6635bf7f)Having some limited subset of Red that could run on microcontrollers would be wonderful. I've been thinking about such dialect and I believe it's possible. There's Lua and Python running on microcontrollers, so why not Red.

pekr

[17:00](#msg6012edcb1ed88c58d80600a0)+1

greggirwin

[18:33](#msg601303655500a97f82cf0302)@rebred it's technically possible, absolutely, but not on our current roadmap.

## Friday 29th January, 2021

gltewalt

[23:37](#msg60149c3c24cd6b60d806e2bc)Test

## Saturday 30th January, 2021

YaronKoresh

[08:09](#msg6015144024cd6b60d807fa7e)hey guys, i started to learn about red a few days ago, but the AV problem dont give me to compile my program... i have to compile to msdos, with a black console behind my program, to bypass the AV.. even then, when i changed the PE header from CUI to GUI, the AV started again to make me problem with the PE.. what can i do to bypass this??

planetsizecpu

[08:29](#msg6015190332e01b4f71625364)Welkome @YKProg I had the same problem, I just instructed the AV to not scan the Red toolchain folder so it bypasses everything inside

YaronKoresh

[08:35](#msg60151a379d5c644f663b923f)yes, but i want to send it , or maybe, after some enhances, to upload it to a public website... and that is a big problem with that, i literally trying to inject it to a the memory using python, but for myself, i can just run the code itself. the problem is the publication, i cant tell people to download red and run my code inside a console

[08:36](#msg60151a7455359c58bf0d6936)thanks for the help btw

planetsizecpu

[08:45](#msg60151cb49238c531ad119b97)Ah, some AVs incorrectly flag us, but some others does not. This is a recurrent problem, I think there are requests on some AV builders to not flag Red exe files but the problem persists on time

[08:48](#msg60151d5b9fa6765ef8e797f9)You may send a request to your AV provider to avoid flagging Red, sometimes they react.

YaronKoresh

[08:51](#msg60151df4063b6c68d528e60e)yeah, i will send a request and will see what they will do, but for the general problem, i understand there is no "trick" for that :( . thanks!

ne1uno

[08:52](#msg60151e4d1ed88c58d80bd69e)try `pkzip` maybe

YaronKoresh

[08:54](#msg60151eb955359c58bf0d71c5)thanks, i will try this

ne1uno

[08:59](#msg60151fe3ae4b9b27c1899a91)let me find the program name, not sure is pkzip

planetsizecpu

[09:04](#msg6015210f428d9727dd42dd45)Also make sure you have the latest build, the stable one is so old.

YaronKoresh

[09:05](#msg6015216c5500a97f82d4a363)@planetsizecpu thanks, i have 0.64, maybe i will try to compile it from source for the latest

planetsizecpu

[09:06](#msg60152193428d9727dd42df37)You just need the latest nightly build.

YaronKoresh

[09:06](#msg601521a7a0246860dc1d294a)@ne1uno pkzip evaluation page seems to not work on chrome nor edge browsers.. there is an error with the form.

[09:07](#msg601521dc4f7d1b68e51c4cd4)@planetsizecpu thanks! i hope it will solve this

ne1uno

[09:11](#msg601522a70eed905f187e24e4)https://upx.github.io/

YaronKoresh

[09:11](#msg601522cd0eed905f187e259a)oh, i have UPX, its not solved it sadly :(

ne1uno

[09:11](#msg601522dcaa6a6f319df223bd)https://www.virustotal.com/ will check against many AV

[09:12](#msg601522fd428d9727dd42e201)maybe 7z does executable?

YaronKoresh

[09:13](#msg601523419fa6765ef8e7a5e5)yeah, i checked in virus total &amp; hybrid analysis, hybrid analysis say that the program is safe in the dynamic scan, but the AV say its malicious so it flag it as malicous

[09:13](#msg6015235284e66b7f7ebda21f)@ne1uno 7z make self extracted

[09:14](#msg6015235a9fa6765ef8e7a61b)not executables

[09:19](#msg601524b50eed905f187e2a4b) @planetsizecpu damn, the latest build work for me as windowsxp target!!! not just ugly msdos console! thanks! i will try now with windows target!

planetsizecpu

[09:20](#msg601524e34f7d1b68e51c5604)You're welcome!

YaronKoresh

[09:25](#msg601525f15500a97f82d4ad47)@ne1uno btw, UPX dont work for me on the PE form the latest red compiler, it says "internal error, should not happen", but i dont need it anyway ;)

ne1uno

[09:26](#msg60152648ae4b9b27c189ab7a)thanks, I haven't tried lately myself.

hiiamboris

[09:54](#msg60152cbe84e66b7f7ebdb784)@YKProg may find this useful https://github.com/red/red/wiki/%5BNOTE%5D-Anti-virus-false-positives

YaronKoresh

[11:33](#msg6015440e9fa6765ef8e7f74b)@hiiamboris i already read that, thanks

[11:34](#msg6015443e5500a97f82d4f6a7)i just needed for a solution, but now all works fine

greggirwin

[19:44](#msg6015b70daa6a6f319df3969f)In the future we will EV code sign periodic builds to help avoid this problem.

[19:44](#msg6015b7199fa6765ef8e9259d)Thanks for the report @YKProg.

## Sunday 31st January, 2021

greggirwin

[18:07](#msg6016f1fb0eed905f188288a8)Has anyone tried https://www.framer.com/, or their https://www.framer.com/motion/ animation DSL? We need to think about this in Red's GUI context. Some of you are more into this area and can evaluate it knowledgably, like @rgchris and @henrikmk.

rgchris

[23:04](#msg6017377355359c58bf12924f)@greggirwin Would have to look it over—obviously not being in a familiar language (🙂) it's not immediately clear how you go about getting started. In \[latter View experiments](https://gist.github.com/rgchris/b6fdf694df53ea82af424c48abeeefac), I was moving towards a more free-form state-based approach to managing appearance and the behaviours when transitioning and some elemental functions to put the transitions into effect (e.g. \*\*move face 100x10\*\*)—very much with the CSS model in mind. I don't think this looks altogether different at a glance

[23:07](#msg6017383d5500a97f82d9b6b0)I'd be inclined to say that specific functions (such as the above \*\*move\** or, say \*\*fade\** or \*\*rotate\*\*) are more important at an internal level, at a higher level it's more useful to specify how a thing should look in a given state and what parameters are used when in transition (how fast, how smooth, etc).

greggirwin

[23:14](#msg601739efae4b9b27c18ec48a)Great input. Thanks Chris.

rgchris

[23:14](#msg601739f11ed88c58d8110f58)To follow the thought through, one might want to say: \*if x then rotate the box\*, but it's more likely one would want to say: \*when x condition is met, the box should be at a certain rotation; on the occurence of x, the box rotation will change slowly\*.

[23:17](#msg60173a6faa6a6f319df73a28)I hadn't finished that thought in code, but that's the direction I was headed.

## Monday 1st February, 2021

pekr

[05:59](#msg601798c932e01b4f7168651e)@greggirwin do you remember, that Carl's revision of R3 VID had an UI annimation built in? I do remember UI elements to fly-in/out ....

[06:00](#msg601798f284e66b7f7ec3b53e)Also - in old days, Jeff Kreis did an animation dialect, it was like using a Scala on Amiga ;-)

GiuseppeChillemi

[06:58](#msg6017a6925500a97f82dabda2)@pekr di you have a link for this dialect?

pekr

[08:28](#msg6017bbc55500a97f82daf59f)I tried to search rebol.org, but no luck. I have it on one of my harddrives, just give some time, to find it ....

GiuseppeChillemi

[09:53](#msg6017cfa61ed88c58d812756a)@pekr I have searched it too with no luck, I hope you will find it

rebolek

[11:23](#msg6017e4cd32e01b4f71692b4f)For my Pitch green demo for the \[Rebol Demo Contest](http://rebol.net/demos/demo-contest.html) I used custom animation dialect. I make look for the sources if anyone's interested.

GalenIvanov

[13:49](#msg601806fb55359c58bf14b4ee)It would be great to have an animation DSL !

greggirwin

[22:27](#msg6018803f9d5c644f66441b59)@pekr I didn't remember that. It's an interesting space, and layered.

The GUI use case is driven by modern UIs, but those are often more flash than substance. That is, there is "movement" but I'd like the HCI background and information on how useful they are. Helping to track flow or state change is proven to be helpful, rather than elements just (dis)appearing. And most systems have gone to static decals or flash popups rather than wiggling notifications.

Going beyond simple transitions, which are important, it's a fine line between something like games with sprites and interactive visualizations of data and systems. For us, we also have `draw` to consider.

Do we have anyone here with scene graph experience?

Oldes

[22:56](#msg60188711a0246860dc25bc3e)I would say that current trend is heading to Immediate Mode GUIs https://github.com/ocornut/imgui

[23:00](#msg6018881e1ed88c58d8148e10)https://floooh.github.io/sokol-html5/imgui-highdpi-sapp.html

## Tuesday 2nd February, 2021

magicmouse

[01:04](#msg6018a537ae4b9b27c192ae62)The issue of higher level graphical layers is a very difficult one, without easy solution. The top commercial entries are things like Unreal Engine (3d), Unity (3d), and Qt (2d) , and the old Adobe Flash (now continuing forward in the Haxe space and OpenFL). In the 2D animation realm, the open source Starling add-on was excellent, and it has sprite sheets ,and all the basic animation things one needs for 2D games (a lot of games were made on that tool). There are programming tools whose main claim to fame is the built-in animation and collision detection, such as RAD tools and GameMaker, not to mention the ecosystems of Roblox and Minecraft, which are the extreme end of "prebuilt". There is also Google's Flutter project, which saved Dart from extinction, by building an incredibly complex layer that renders everything to bitmap so that it is OS independent. That is another extreme endpoint in graphical approaches.

IMGUI is the kind of product that might work for you if the graphical style of all the widgets they offered match your requirements, but for a roll-your-own universe like Red, i don't see that as the correct approach.

In the 2D world which is my wheelhouse, you need both primitive support (lines, shapes, text, etc.), and then there is the standard issue controls, which due to the dominance of mobile platforms have evolved into Android vs. IOS control styles and aesthetics. They copy each other back and forth, so it is a kind of always changing ping-pong match between Google and Apple, but one can certainly say that dark interfaces are dominating now, with horrendous color schemes and microscopic typography abounding. Certainly not a good time for people with limited vision.

The Starling framework i mentioned above was particularly well designed; it gave you access to GPU accelerated 2D animation, which is mostly what people need. 3D is a giant can of worms that most programmers will avoid. Look at the credit pages for Red Dead Redemption game, and marvel at how many full-time people it took to build the shrubbery. 3D is a giant time sinkhole.

greggirwin

[01:53](#msg6018b0b30eed905f18873f8f)Thanks for the info and thoughts @magicmouse !

temperfugit

[02:20](#msg6018b6e555359c58bf16b929)@pekr Re: Jeff Kreis' animation dialect, do you mean Prez, the presentation dialect, or something else? Even it it's not what you meant I'm sure some here will find it interesting: https://www.cs.unm.edu/~whip/make-presentation.r

Respectech

[02:31](#msg6018b99c32e01b4f716b899d)It would be so much more cool if we could run that link directly from R2, but the https kills that.

```
>> about
REBOL/View 2.7.8.3.1 1-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
>> do http://www.cs.unm.edu/~whip/make-presentation.r
connecting to: www.cs.unm.edu
connecting to: www.cs.unm.edu
** Command Error: SSL Error:  error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:s
slv3 alert handshake failure
** Where: build-port
** Near: system/words/set-modes port/sub-port [secure: true]
```

magicmouse

[02:40](#msg6018bba59fa6765ef8f0ca72)@greggirwin i finally put out a pre-release version of my Beads language, so now Red has at least some decent competition. I would say we cover different application spaces so we don't overlap that much, but as both are general purpose i would say we are lumped into the same "100% opposed to OOP paradigm" space. Red has made a huge amount of progress, and it is nice to see your project expanding. Frankly getting people out of Java, and C++ both of which i loathe dearly, is quite a challenge, as inertia appears to be the most powerful force in the universe... so often in the history of programming languages, people have clung to outdated languages because of habit, and the reluctance to leave the herd. I saw it with COBOL, and i see it with Java (the COBOL of our time). If you need any further input on the graphic stuff, i will be glad to share my experience with you. I did write 100 iphone titles and a few android titles before i threw in the towel on mobile software. Such a grind, and the race to the bottom in pricing was brutal, not to mention dealing with Apple's petty tyrannies.

greggirwin

[02:42](#msg6018bc0b32e01b4f716b8e35)Congratulations on your release @magicmouse. :+1:

Respectech

[03:08](#msg6018c234ae4b9b27c192f7c0)Beads looks interesting. I couldn't find any actual code examples on your site, however. Does it use Rebol/Red-style coding?

magicmouse

[04:40](#msg6018d7c3063b6c68d5327e17)Beads is at www.beadslang.com, it has code examples and the full SDK there. Beads is basically a continuation of Prof. Wirth's Modula-2 but in a Pythonic, indent-significant syntax. Unlike Red which is a pure computational language, Beads includes a graph database, layout, drawing and event model. It is intended for client/server, webapp, and mobile apps. It's most unique feature is time travel, which is baked into the runtime. It is so distant from Red that is why i think there will be almost no intersection of the two user bases. Who knows maybe someday i will rewrite the compiler in Red to get on more platforms (currently on Mac + Windows for the compiler). I don't like Rust that much, which is darling of many compiler authors nowadays.

pekr

[05:45](#msg6018e6dd55359c58bf1730ce)@temperfugit Yes, I meant prez probably, but I can't see no dialect there, so it might as well be something else.

[05:50](#msg6018e82e84e66b7f7ec760ab)I have always wished for Scala like engine in Rebol. So transitions, nice text (which we've got with AGG in the past - just remember some glory demos, e.g. from Cyphre), but jerky scrolling and speed were always a problem. For smooth animations without tearing, techniques like double / tripple buffering were needed, proper sync, etc. We are now on D2D, so that might be easier, just don't know.

[05:54](#msg6018e900ae4b9b27c1935527)As an PowerDirector long time user, I have suggested many times to Cyberlink to create some advertisement module, with easy video editing, and after those years (and a hateful swith to subcription model), it finally comes - https://www.cyberlink.com/products/powerdirector-business-video-editing-software/features\_en\_US.html

[05:55](#msg6018e960aa6a6f319dfbcf6e)@greggirwin as for the node based animation engine, Max lived in that space. He was working as an anim director or something like that, working with Shake. He even used that principles in his alternative GUIs for Rebol.

temperfugit

[06:31](#msg6018f1c24f7d1b68e52605b2)There's a little bit of discussion about Prez here too, fyi: http://www.rebol.org/ml-display-thread.r?m=rmlBYZS

greggirwin

[06:54](#msg6018f71c9238c531ad1b66c4)@pekr, yes! I should have thought of Maxim.

pekr

[07:10](#msg6018faef1ed88c58d815a803)I have digged my old hard disks. I remember having each R3 alpha release since 0.6.something. Also archive of old Ally mailing lists, etc., but one of my harddisks went thru failures, so we will see. I am curious what you guys have in mind in terms of animations ;-)

[07:11](#msg6018fb1e1ed88c58d815a87f)I do remember Carl's VID had some function to anim fly-in/out of UI elements. If I have corresponding R3 release, I will create a small package to download .... will get back to you later.

YaronKoresh

[08:08](#msg6019087da0246860dc270f60)Hey guys, if i open several 'view\[]' windows, does any one of the windows have their own name/id? and if so, how can i read it? i just need a function that take the window ID as an argument, and then, for example, if id=1 \[...], to make a filter which window have access to run each function.

[08:09](#msg601908d31ed88c58d815d1a6)i have been searching here: https://github.com/red/docs/blob/master/en/view.adoc

[08:10](#msg601908e8aa6a6f319dfc247f)i hope i have been searched properly

greggirwin

[08:31](#msg60190dd99d5c644f66457b4a)There's no built-in ID, but you can easily add your own.

```
wnd-1: view/no-wait [
	title "1" size 300x200
	button "Close" [unview/only wnd-1]
	button "Show ID" [show-id face/parent/extra]
]
wnd-1/extra: "ID_1"
wnd-2: view/no-wait [
	title "2" size 300x200
	button "Close" [unview/only wnd-2]
	button "Show ID" [show-id face/parent/extra]
]
wnd-2/extra: "ID_2"
wnd-3: view/no-wait [
	title "3" size 300x200
	button "Close" [unview/only wnd-3]
	button "Show ID" [show-id face/parent/extra]
]
wnd-3/extra: "ID_3"

show-id: func [ID][print ID]

do-events
```

[08:32](#msg60190e1f24cd6b60d8122d30)Here you can see that `view` returns a reference to the window, which you can use directly in your check, and also to set the `extra` word to whatever you want to go along with that window.

[08:33](#msg60190e409d5c644f66457c55)And having the window reference is handy for use with `unview/only`.

YaronKoresh

[08:33](#msg60190e6b55359c58bf179aa8)oh, i see... i can use face/parent/extra after assigning an Id to /extra , thanks!

greggirwin

[08:34](#msg60190e8e4f7d1b68e5265561)Yes, you can mix and match to suit your needs.

hiiamboris

[10:15](#msg6019262c1ed88c58d816236b)@magicmouse somehow in PaleMoon your beads site shows absolutely nothing. Same in old FireFox.

GiuseppeChillemi

[11:38](#msg6019399f4f7d1b68e526c6e4)@pekr I am searching everywhere on the web from 3 hours with no result. The presentation dialect seems gone. We should contact Jeff directly.

pekr

[12:48](#msg60194a154f7d1b68e526f738)Maybe you would fe faster writing your own one 🙂

rgchris

[12:59](#msg60194c99063b6c68d533b39d)I had hacked Jeff's dialect into style form so that it could be used for a reusable slide-based presentation. Possibly still have that version.

[13:04](#msg60194ddf9238c531ad1c5baf)@pekr You can see \[the prez dialect](https://www.cs.unm.edu/~whip/test-prez.r) in the linked data file.

[13:14](#msg60195030ae4b9b27c1946a13)Managed to get this working in View 2.7.8: \[Presentation Style](https://gist.github.com/rgchris/23868b3b74a3d7ffc5474703a3666882#file-test-prez-r)

GiuseppeChillemi

[13:36](#msg601955481ed88c58d816a12f)@rgchris It has worked! Great

rgchris

[13:36](#msg60195574ae4b9b27c19476bd)Timeless tech

[13:36](#msg6019557a32e01b4f716d2354)🙂

GiuseppeChillemi

[13:37](#msg601955a31ed88c58d816a22b)When we will have timers it would be to have a presentation system on Red.

[13:38](#msg601955bc1ed88c58d816a294)Maybe it would be possible right knwo but I can't say

[13:38](#msg601955cdaa6a6f319dfd0627)We shoudl port it on Red when possible.

rgchris

[13:51](#msg601958ffae4b9b27c194802b)I'd suppose it may be possible to do the above now, but couldn't say for sure.

pekr

[14:18](#msg60195f2b24cd6b60d8130f07)I feel stupid, and devastated. I have found only a pre 2008 archive. That's the time I switched the jobs. I did so again 4 years ago and asked my colleagues, to back-up my files. Did not check, so they exported only the profile folders. But I had !Rebol in the root. All is gone, including the whole IOS history, etc. That hurts :-(

[14:29](#msg601961de9fa6765ef8f29342)I have found slightly different version to what Chris posted. Where it differs is it shows more of a dialect. It's from 2001, 20 years old :-)

http://2zone.cz/pekr/presentation.zip - you can download the archive and run it ...  
http://2zone.cz/pekr/presentation.r

rebolek

[14:30](#msg601962009fa6765ef8f2938f)that's sad :(

pekr

[14:32](#msg60196296ae4b9b27c1949c17)The animation dialect looks like that:

!\[alt](http://2zone.cz/pekr/presentation.jpg) http://2zone.cz/pekr/presentation.jpg

[14:36](#msg6019637b9d5c644f66466088)Listing thru all the past efforts, demos, I have to admit there was lots of a talent in Rebol community back then ...

GiuseppeChillemi

[16:16](#msg60197aceae4b9b27c194e3bc)It is really Sad.

rgchris

[16:40](#msg6019808a4f7d1b68e5279f23)@pekr That's too bad 😥. I do have some historical stuff—maybe even IOS instances I can get working even if they've nothing to connect to any more.

GiuseppeChillemi

[17:10](#msg6019877c4f7d1b68e527b72c)@rgchris why? Is IOS dependent from Rebol tech?

ldci

[17:17](#msg6019892084e66b7f7ec927ba)@GiuseppeChillemi IOS means REBOL Internet Operating System. It was revolutionary when proposed by Carl in early 2000. See http://www.rebol.com/ios/ios-intro.html

rgchris

[17:21](#msg60198a264f7d1b68e527befc)@GiuseppeChillemi My memory is a little hazy, but I believe it was Windows only and some problems handling accounts for multiple servers—the keys for a given server were embedded in the executable and in requiring installation, you kind of had to do an executable switcharoo if you wanted to access multiple servers

[17:23](#msg60198a949d5c644f6646cedd)Oddly enough, it was only when I switched away from Windows that I was better able to use with multiple servers by setting up a Wine wrapper for each instance

[17:24](#msg60198adb9fa6765ef8f3103a)It wasn't the most top-down Rebolish experience even though it was end-to-end Rebol in operation

ldci

[17:25](#msg60198b269d5c644f6646d098)@rgchris I’stll have a copy of IOS for Linux which was perfectly running with unix and windows client. But this required a complicated licence specific to the server.

rgchris

[17:27](#msg60198b68063b6c68d53460d9)I suspected on saying that there might have been a Linux version. I assume there were similar issues accessing multiple servers?

ldci

[17:27](#msg60198b90ae4b9b27c1951558)Yes I think so

[17:28](#msg60198bc0ae4b9b27c1951601)We used IOS in the lab during a few years, for internal communication network :)

pekr

[17:37](#msg60198dcd063b6c68d5346a0b)As for IOS, it won a Webby award in 2001 IIRC? And one of big companies used it, not sure, but maybe it was an AMD.

Respectech

[17:37](#msg60198df5aa6a6f319dfdabfb)I think some part of the Italian government also used IOS.

pekr

[17:39](#msg60198e5024cd6b60d81398ff)It was a really nice system. Carl fulfilled his plan - small apps for the next web. Pity he was not able to sell it to some big parties. In 2007, iOS from Apple came, which just confirmed, that Carl's ideas were ahead of the time, again, as with AmigaOS. Just look at Altme, 800KB app, and what it does - still unseen by today's standards.

[17:39](#msg60198e640eed905f18899487)OK, I am off-topic here, sorry, did not realise we are in Red channel.

ldci

[17:40](#msg60198e9c24cd6b60d8139a44)@pekr Red is a direct descendant of REBOL :)

pekr

[17:51](#msg6019910d55359c58bf1913bd)I know, but this is mostly a chit chat, whereas purpose of this channel is mostly for technical topics, right? Well, I would like to know what was the purpose of animations anyway :-)

[17:52](#msg6019916c55359c58bf19151a)Heh, my wife migh have saved me a day, she told me, that when I left the company 4 years ago, I have copied something to her old harddrive. I can see the Rebol folder there, investigating!

ldci

[17:54](#msg601991ed5500a97f82e028de)@pekr : Women are men's future:)

pekr

[18:10](#msg601995a855359c58bf192398)You are right! Found even an exotic stuff like Rebcode version, Rebol Apache module and Rebol 1.0.3 :-)

GiuseppeChillemi

[19:41](#msg6019aad31ed88c58d8179cba)@pekr We love your wife too!

pekr

[19:41](#msg6019ab01428d9727dd4eb6e4):-)

GiuseppeChillemi

[19:42](#msg6019ab084f7d1b68e5281ede)Why don't you put everything in a public repository?

[19:42](#msg6019ab2432e01b4f716e23a4)You have, literally, our history in your hard drive!

pekr

[19:42](#msg6019ab3584e66b7f7ec98d1a)Trying to get Carl's VID running, but there was a `demo`, which could be run from web. Unfortunately, at rebol.com, it is not available anymore ....

GiuseppeChillemi

[19:44](#msg6019ab8e32e01b4f716e24c8)@ldci Inalready knew about IOS, I would like to install it and study the architecture and code structure.

pekr

[19:50](#msg6019ad140eed905f1889efa0)I have IOS architecture docs, just saw it in some folders :-)

greggirwin

[20:07](#msg6019b1130eed905f1889faa3)If I lost all my Redbol history it would be like losing a limb. Glad you found it @pekr.

[20:17](#msg6019b3570eed905f188a0258)Carl did a simple presentation script as well. I'll post mine simply because I don't want to post his content and images without his permission. This way it should at least run for those who want to try it.

[20:17](#msg6019b35d063b6c68d534de6b)\[rebol-show.zip](https://files.gitter.im/5565a1d415522ed4b3e10094/hNnu/rebol-show.zip)

[20:22](#msg6019b4874f7d1b68e5283a9e)Both presentation demos are fantastic. Thanks for digging those up @pekr and @rgchris !

pekr

[21:22](#msg6019c2a6a0246860dc2923a8)I have also found Carl's demo source code. Now jus to find R3 version it runs with ....

[21:24](#msg6019c329063b6c68d5350af3)I have also found Carl's presenter. He used it to present during the 2007 Devcon, or so. Simulated slides and bullets.

GiuseppeChillemi

[22:08](#msg6019cd479fa6765ef8f3d2de)Please, to everyone: share as much as you can: it's the history of everyone.

[22:47](#msg6019d669aa6a6f319dfe7eac)I have a gift for you from Jeff Kreis: the dialect \[documentation](https://github.com/GiuseppeChillemi/programming.red/blob/master/projects/prez.txt)!

greggirwin

[22:51](#msg6019d77f4f7d1b68e5289e75)Thanks @GiuseppeChillemi !

GiuseppeChillemi

[22:57](#msg6019d8cba0246860dc295f5e)You are welcome, I have contacted him and he has answered in few hours, he has been very gentle and open.

greggirwin

[23:01](#msg6019d9bea0246860dc29611b)That's great.

## Wednesday 3th February, 2021

pekr

[05:55](#msg601a3acb84e66b7f7ecaf42d)When Carl created his own version of VID for R3, he initially wanted widgets to be composed by Draw elements for certain states (button pressed, non pressed, over, etc.). He thought of introducing a `Frame` term for that. Later on, he found it a bit complex, so it was not there, but I have found there was a function like `switch-panel recent new 'fly-right`

GiuseppeChillemi

[09:34](#msg601a6e3f84e66b7f7ecb7050)Jeff has a new gift for us, \[Prez and 10 presentations](https://github.com/GiuseppeChillemi/programming.red/tree/master/projects/Jeff-Kreis-Prez) from his backup archives! I wish to express him my greatest appreciation (He is reading the chat), thank you Jeff!

pekr

[09:45](#msg601a709f55359c58bf1b5d4d)Perfect :-)

[09:46](#msg601a70e31ed88c58d8199755)Now we could try to port that to Red View engine, which has D2D acceleration. But that counts only to Draw, IIRC. Not sure, how are our timers precise though ....

hiiamboris

[09:50](#msg601a71f332e01b4f717020bd)15ms resolution

pekr

[09:51](#msg601a722a0eed905f188be888)Please explain this:

```
== 0:00:15.5941
>> b: make block! 1000 dt [repeat i 1'000 [wait 0.0001 insert b i]]
== 0:00:15.6075
>> b: make block! 1000 dt [repeat i 1'000 [insert b i]]
== 0:00:00.0019814
```

hiiamboris

[09:52](#msg601a7267428d9727dd50b8f7)15 ms * 1000 = 15 sec

pekr

[09:53](#msg601a72905500a97f82e266c2)Yes, because it does not differ from `b: make block! 1000 dt [repeat i 1'000 [wait 0.001 insert b i]]`

[09:55](#msg601a72fc9d5c644f66492cb6)So does R2 have much better timers?

```
>> start: now/time/precise b: make block! 1000 repeat i 1'000 [wait 0.0001 insert b i] now/time/precise - start
== 0:00:00.008
```

hiiamboris

[10:00](#msg601a74351ed88c58d819a073)Stupid gitter ate 4 of my messages.

[10:01](#msg601a746d9d5c644f66493063)OK.  
&gt; So does R2 have much better timers?

No. R2 simply wastes CPU by executing `now/precise` in a tight loop until it gets to the desired point in time.

[10:01](#msg601a74799d5c644f66493082)This is very very bad idea.

[10:02](#msg601a74b65500a97f82e26ce5)We can do better by leveraging multimedia timers, up to sub-millisecond resolution, but that will hit power consumption too (of the whole OS), and not desired just by any application.

pekr

[10:08](#msg601a76349d5c644f6649347c)I am not all that in multimedia, but thinking mostly about IO multiplexing in an event loop (web server, concurrency, etc.). Is 15ms good enough?

hiiamboris

[10:14](#msg601a778da0246860dc2ae70b)If we ping pong the evaluation between our own threads, the situation might be better. Can't say for sure, didn't read any info on this.

[10:30](#msg601a7b2a1ed88c58d819b041)Also servers are probably preconfigured with 0.5 - 1 ms defaults.

pekr

[10:31](#msg601a7b9d4f7d1b68e52a3798)But we have only 15ms, right?

hiiamboris

[10:32](#msg601a7bba0eed905f188c0012)On desktops.

[10:32](#msg601a7bcd1ed88c58d819b173)Though IIRC my W7 desktop has 1ms default. But it's in another town ;)

[10:33](#msg601a7bfd9d5c644f66494204)http://www.lucashale.com/timer-resolution/

[10:34](#msg601a7c26a0246860dc2af1f9)They even sell this omg. It's like 20 minutes-to-make kind of utility.

[10:36](#msg601a7ca5aa6a6f319d001fbe)Again, no guarantee that this will actually affect `wait` or just the precision of `now/precise`.

townbully

[15:47](#msg601ac59d9238c531ad205839)Hey y'all.. good to see some old familiar faces.

rgchris

[16:37](#msg601ad1519fa6765ef8f67269)@townbully 👋

pekr

[16:41](#msg601ad231a0246860dc2bdb2f)Oh no, is that even possible? :-)

GiuseppeChillemi

[17:38](#msg601adfaaae4b9b27c1989cec)@townbully Hi Jeff, it is nice to have you here!

[17:55](#msg601ae3a224cd6b60d8172674)After Rebol Technologies, Jeff's experience has ranged from videogame making to AI and embededd DVR products. Actually, he leads the development of a new robotic warehouse automation technology at River System: impressive! It has been a great journey after Rebol Tech times.

planetsizecpu

[18:35](#msg601aece65500a97f82e3cff2)Wow! that's good news, hi Jeff, good to know you!

greggirwin

[20:24](#msg601b066b063b6c68d5387653)Thanks @GiuseppeChillemi and please thank Jeff for us.

[20:28](#msg601b07770eed905f188d8b13)Ah, I see he's here! Thanks so much @townbully.

[20:36](#msg601b093932e01b4f7171c94a)I just had to comment out the `link-styles` line to get %make-presentation.r to run.

[20:38](#msg601b09aea0246860dc2c879c)I don't know how the %prez-ex/ stuff comes into play though.

[20:50](#msg601b0c8f24cd6b60d817a3b4)Will take just a little time to port it I think. Decimal, time syntax, join, second on objects were easy, but then I need to understand how the dialect is applied. Will try to revisit soon.

## Thursday 4th February, 2021

proksi21

[10:17](#msg601bc9c6ae4b9b27c19b22e8)Hey guys!  
Is there any roadmap for Red?

[10:18](#msg601bc9f19d5c644f664ccfdf)Seems like trello, blog and twitter was not updated for a long time

[10:19](#msg601bca2ca0246860dc2e90e9)To be more direct - are there any plans for 64bit or maybe Apple Silicon support?

rebolek

[10:23](#msg601bcb2355359c58bf1f0710)Hi! There are 64bit plans. Unfortunately, I don't know how far 64bit support is. But let's hope it's getting closer :-) Apple Silicon should be that hard IMO once we get 64bit support. It's still an ARM and Red supports ARM.

Numeross\_\_twitter

[20:27](#msg601c58c11ed88c58d81f10b7)Hey guys, I've been reading discussions about Red's lexical flexibility, custom types, etc.  
I would identify the problem as a compromise between lexical flexibility and abstraction expressiveness. Is that correct ?  
Too much lexical flexibility would make your Red runtime and data less compatible around the world, but we want Red to be able to express abstract concept well, thus making abstract stuff less complex.

[20:29](#msg601c592aaa6a6f319d05a84f)Did I corner the problem well enough ?

hiiamboris

[21:05](#msg601c61919fa6765ef8fb0bde)what discussions? ;)

Numeross\_\_twitter

[22:11](#msg601c71295500a97f82e86928)Mainly \[this](https://www.red-lang.org/2019/11/editorial-brief-essay-on-lexical.html) and its comments

hiiamboris

[22:47](#msg601c799d55359c58bf2185a9)That essay I understand. But what does it mean to express an abstract concept in Red - I do not ;)

[22:51](#msg601c7a739d5c644f664f2ffc)IMO the cues of that essay:  
\- the more datatypes we support the quadratically more effort it requires to do so  
\- \*readable* lexical space is limited, so should not be used lightly (if you like to prefix values of your user datatype with `##$%` or something - that's not readable, though there's plenty of lexical space for such abominations)

[23:05](#msg601c7dd40eed905f1891f042)Also I've no idea what "lexical flexibility" is either. Essay makes a point about lexical ambiguity, which can be illustrated like: `#a:b@c/d`. What does it look to you like? An `#issue`? `a:url`? `an@email`? `a/path`?

## Friday 5th February, 2021

gltewalt

[01:41](#msg601ca2429fa6765ef8fbf59e)`to email! "What am I?"`

[01:44](#msg601ca3050eed905f18927561)What's the @d type?

```
>> type? #abc@d
== @d
```

toomasv

[05:41](#msg601cda889d5c644f66505160)There are 2 expressions without space between

```
>> probe type? #abc@d
issue!
== @d
```

gltewalt:matrix.org

[07:19](#msg601cf1899238c531ad26c9c2)Should it parse it as two expressions if no space, though?

[07:23](#msg601cf25f84e66b7f7ed2f384)`Issue! values are terminated by whitespace, semicolon, or a delimiter marking the start of a new value (e.g. [ starting a block).`

I guess so

gltewalt

[07:36](#msg601cf57c428d9727dd58552a)I believe it will throw error on `type?` if you add `:` back in. Like Boris example.

toomasv

[07:56](#msg601cfa169fa6765ef8fce333)According to \[lexer-states description](https://raw.githubusercontent.com/red/red/master/docs/lexer/lexer-states.txt) it should throw error if ":" (or "/" unless in first position) appears in issue.

[08:04](#msg601cfbfa9fa6765ef8fce7e3)And these terminate issue:  
`[ ] ( ) { } " ; @`

meijeru

[13:50](#msg601d4d374f7d1b68e5328bc1)On 14 -Jan-2021 I updated the specs document with new lexical definitions for refinements and issues. See \[sections 5.2.15 and .16](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#refinement)

toomasv

[14:45](#msg601d5a0b9d5c644f6651aa48)@meijeru :+1: Thanks

## Sunday 7th February, 2021

Numeross\_\_twitter

[18:50](#msg6020366924cd6b60d82552af)@hiiamboris oh, I got confused by the word utype!, I thought it meant union types.  
I also confused what a lexicon is ^^'  
With language we can communicate abstract concepts, and it's the same with programming language. ((here)\[https://stackoverflow.com/questions/2427496/what-do-you-mean-by-the-expressiveness-of-a-programming-language] are better explanations of what I'm trying to say). It seems to me that Red is very expressive, but wouldn't some kind of algebraic data types would bring it to the next level ?

[18:52](#msg602036f69d5c644f665887a4)Maybe I am missing techniques that can replace it ? With the parser ?

hiiamboris

[19:54](#msg602045664f7d1b68e539a7c2)You can open a wish ticket \[here](https://github.com/red/REP/issues) for anything you're really missing or edit \[this wiki](https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-%28Feature-Wars%29)

[19:55](#msg602045ba5500a97f82f2092b)Right now team is busy with priority tasks that should guarantee Red's overall success rather than just implementing new types for the sake of it (even if it may be fun).

[19:56](#msg602045d384e66b7f7edb0922)Ports, when done, will help high level experiments with types I think.

greggirwin

[20:27](#msg60204d429238c531ad2eee3c)@Numeross\_\_twitter I'm happy to be enlightened, but I think Red's generalized and idiomatic equivalent \*is* `blocks+parse`.

## Wednesday 10th February, 2021

greggirwin

[01:56](#msg60233d5e428d9727dd67d972)A lesson to keep in mind when we work on modules: https://blog.golang.org/path-security

Numeross\_\_twitter

[20:58](#msg602448de32e01b4f7189e564)I don't know if my previous message read as "yeah Red should have this" but that wasn't the intention at all. I was really wondering if such type system would benefit Red expressiveness-wise, out of curiosity. Right now I'm experimenting with petri nets, if I need something I'll tinker with the idea myself beforehand.  
I guess the answer is that with its homoiconicity and parser, Red is already very expressive, and the benefits are possibly not that big in that direction. And regarding types, there will be exploration and experiments. Yeah, that sounds exciting. I'm not impatient, but sometimes I get very obsessed with ideas.  
How would ports help with type experiments ? I don't see the connection

Would it makes sense to annotate the type of functions' outputs ? Is there a reason that they are not ?

greggirwin

[21:08](#msg60244b555500a97f82fc6653)You say "obsessed" like it's a bad thing. ;^)

We can certainly experiment with return type specs for funcs. The func spec dialect supports it, but I don't think there's any use of it internally today. They aren't used today because it hasn't been a pressing need, and has open design questions because of Red's dynamic nature. There may be cases where the compiler can't do the check, so there would have to be an interpreted fallback mechanism. But it's like @rebolek's dependent type experiments or DbC stuff some of us have played with, easy to do at the mezz level and explore ideas.

Numeross\_\_twitter

[21:50](#msg6024550e0eed905f18a5bea7)Haha yeah It's definitely not a bad thing, but sometimes it gets out of hands and become very time consuming :p  
Thanks for the answers !

Oldes

[21:57](#msg602456d04f7d1b68e54418a7)&gt; A lesson to keep in mind when we work on modules: https://blog.golang.org/path-security

@greggirwin if we should consider security, isn't serious security hole, when `call/shell` is taking the \_shell_ from \[environmental variable](https://github.com/red/red/blob/18bc5f7468c71d04f3b229cf426fa7326fc672e3/runtime/call.reds#L396)? Setting `SHELL` to some evil app may cause quite a surprise.. although Red at leasts checks it only at boot... in Rebol it is resolved with each call.

loziniak

[22:00](#msg60245785428d9727dd6abaed)@Oldes if you already can change env variables on the system, where script runs, you probably don't have to run Red to fire some malicious binaries.

greggirwin

[22:16](#msg60245b3d9238c531ad393db3)@oldes, there are things that are out of our control. This is also where the `secure` dialect can help when we implement it. So you can for example, have a script that can't use `call` at all. We should also look at how to apply `secure` at the module level, because then you can lock them down in a sandbox, which should help catch more malicious actions.

rebolek

[22:36](#msg60245fee428d9727dd6ad0a9)@Oldes not taking SHELL from env seems wrong to me. If you're running Red in a hostile environment, it's not Red's fault.

greggirwin

[23:02](#msg602465e955359c58bf3597b8)Another way to look at is: What's the better alternative?

## Saturday 13th February, 2021

greggirwin

[04:20](#msg6027538a47585464db75c5ff)Here's a fun little experiment. @mbk mentioned Go lang's `defer` a short time back, in one of our team channels, and I mocked up a mezz level version. But it was terrible and nagged at me. Here's a slightly less terrible version:

```
; Go lang defer experiment

deferreds-ctx: context [
    stack: []
    cur-stack:	does [last stack]					; current function's stack
    push-frame:	does [append/only stack copy []]	; new stack frame
    pop-frame:	does [take/last stack]				; drop last stack frame
    push-defer:	func [blk [block!]] [append/only cur-stack blk]
    do-deferreds: does [foreach blk cur-stack [attempt [do blk]]]
    
    set 'on-exit func [blk [block!]][push-defer blk]	; a.k.a defer; what the user calls to add a deferred call
    exiting:  does [do-deferreds pop-frame]
    entering: does [push-frame]
    
    set 'function-with-deferreds function [spec body][
    	body: compose/deep [
    		entering
    		__def-res: attempt [(body)]
    		exiting
    		__def-res
    	]
    	function spec body
    ]
]

outer: function-with-deferreds [][
	on-exit [print "leaving outer"]			; not done until the function returns
	print inner 1
	print inner 2
	'outer-result
]
inner: function-with-deferreds [arg [integer!]][
	on-exit [print ["leaving inner" arg]]	; not done until the function returns
	arg * 10
]

outer
```

All the tests for it are what you see right there, so be warned. But this is about things other than the functionality.  
\- It's Forth-y in the style of writing tiny funcs that build up a vocabulary.  
\- It was about me understanding the concept, and maybe explaining it to others.  
\- It shows what we can do at the mezz level with just a small amount of code.  
\- It lets us play and think about ideas that are actually quite advanced in very simple ways. Before spending time on adding features in Red's core, it always makes sense to me to find out if we even \*like* the idea, and see how it fits with Red. For example, should every function support them, or is a wrapper like this OK, because when you see `function-with-deferreds` it tells you that function is special.  
\- No, I haven't thought about things like real errors in the user's `body`, that `exit/return` are blatantly not considered, or that `entering/exiting` will surely collide with user's words. Oh yeah, deferreds are blocks not expressions or function calls. And `on-exit` doesn't check to see if you're in a valid func with deferreds. I had to leave something for you all to do. ;^)

So what is it? The idea is kind of like `finally` that other langs use with `try/catch`, guaranteeing that certain things will be called when a function exits, no matter what. That's where you do cleanup, etc. What `defer` in Go does, is let you sprinkle them anywhere in a function, rather than having to remember them all at the end. That's it. They are processed in the order they were declared, and I'm sure the Go folks thought deeply about the FIFO v LIFO approach. Were they right, or is FIFO better? What would it take to change this to LIFO?

What use cases do you see for something like this? It's a relative of Design By Contract in my mind, where you can denote pre and post conditions, and invariants. These, like static typing, help more in large scale projects, but there are other ways to build robust software too.

Happy Reducing!

[04:34](#msg602756c28031c8234bda9049)\[Gist for playing](https://gist.github.com/greggirwin/052983865fc684c006b18bbac6c6d2b7)

rebolek

[09:41](#msg60279eb08031c8234bdb2a00)I made a change to my XML codec, making it tolerant (at least a bit), so it can now handle wild close tags and ignore them. This means that stuff like this:

```
<div>
    here follows wild close tag </span>
</div>
```

can be properly parsed. is ignored in such a case and parsing can continue. It allows parsing more real HTML pages which are usually full of errors.

[09:41](#msg60279eb2a37fc1784c1bdaf9)https://github.com/rebolek/red-tools/blob/master/codecs/xml.red

[09:43](#msg60279f5d8621811d587450b5)btw, XML codec will be moved to the CASTR repo soon

hiiamboris

[10:15](#msg6027a6df4c79215749e3a264)@greggirwin  
1\) It should \*unquestionably* be LIFO.  
2\) Special function is not the right place. Instead, you should be able to use that on \*every* scope level. And this is a problem on mezz level, as you have to `bind` that scope (block) every time.  
3\) It should transparently handle exceptions, returns, loop control flow (mostly impossible on mezz level).  
4\) The moment you used `attempt` you made your program a debugging hell :D  
5\) And this is the hardest thing, I haven't solved it yet - when an error occurs in the code, it should not blame your `attempt code` or `try/all code`, it should blame the original code \*at the position where that error comes from\*.  
6\) Error in any of `on-exit []` (or `leaving []` as I call them) finalizers should be treated as an \*error in code* from the POV of all outer (previously deferred) finalizers, be reported as `on-exit [..erroneous code..]` and should not prevent all other finalizers from firing. Same for control flow, e.g. `return` from any finalizer should call outer finalizers and pass the returned value transparently. Unless another finalizer replaces it by a new `return` or other control flow diversion, and this is actually one of tricky points.  
7\) This outlined functionality I consider a \*must have* for any mature modern high level language, as it makes the code much more readable and lifts some implementation details off the coder.

rebolek

[13:34](#msg6027d5704c79215749e40bab)I've just pushed another improvement, XML codec (I should rename it to HTML codec, as most rules now deal with HTML quirks instead of parsing well-formed XML) can now automatically close unclosed P tags. Now it's even more useful in the real world.

hiiamboris

[14:34](#msg6027e388e634904e6099fa0c)@rebolek great :+1:

GiuseppeChillemi

[14:40](#msg6027e4ec47585464db771763)@rebolek Nice!

toomasv

[15:45](#msg6027f41d47585464db773ed3)@rebolek :clap:

planetsizecpu

[19:49](#msg60282d494c79215749e4e1fb)Well done @rebolek

greggirwin

[20:49](#msg60283b568621811d5875badc)@rebolek :+1:

@hiiamboris I noted those issues up front, to some extent. The conversation I hope to spark is whether the idea has value, is worth more than 20 minutes of work, and how it has fared in the wild's of Go (if anyone knows). This is, naturally a deep subject when considered for real, which is why it has to be worth it. On 5), if you haven't figured it out, it's a hard problem. ;^) What language has solved this most effectively? Or is it one of those things that \*can't* be easily solved. Common Lisp is often noted in this area, but the more advanced, dynamic things you do, the harder it is to accomplish cleanly.

gltewalt:matrix.org

[23:17](#msg60285e03a8c6a778480a3679)I dont know, if I remember right, Ruby had a pretty good handle on it.

[23:18](#msg60285e5be634904e609b1cc5)If I were king, I'd call it `on-exit`

gltewalt

[23:32](#msg6028618a9337c51bc6859a9b)If you wanna use a stack, it's LIFO

gltewalt:matrix.org

[23:34](#msg602861ef6825b964d60a0094)(Or borrow the name `ensure`)

zentrog:matrix.org

[23:55](#msg602866dfa8c6a778480a4aaf)I think the reason that LIFO is correct is that (assuming this is all about resource cleanup) resources are used in a nested manner. First you open a file, then you open a socket, and copy bytes from the file into the socket. Since the socket depends on the file, that should be cleaned up first. Maybe it would be ok to clean them out of order, but it should always be safe to do it in a way that gets rid of dependencies first

## Sunday 14th February, 2021

hiiamboris

[09:16](#msg6028ea629337c51bc686aa59)Exactly

greggirwin

[22:25](#msg6029a3458621811d5878d1e9)&gt; assuming this is all about resource cleanup

This is a driving question. Clearly that's the reasoning in Go. And also, logically from their perspective, that resources are reverse-order dependent WRT cleanup. But what if they're forward order dependent? e.g. you have data flowing in, and need to close that pipe first.

```
defer-streams: function-with-deferreds [][
	; open input  stream
	; open munge channel
	; open output stream
	; process data until <some event>
	on-exit [probe "close input stream"]
	on-exit [probe "wait for input 'closed, then close munge"]
	on-exit [probe "wait for munge 'closed, then close output"]
]

defer-streams
```

Do any lang's `finally` handlers use a stack model, or do you just write imperative code in the handler? Then, in stack oriented cases as with things like DB resources, as @zentrog:matrix.org notes, \*you* have to remember to reverse their order and get it right. In a LIFO model, automatic is much better.

In some quick skimming, it sounds like Go still have a lot of wrinkles that need to be considered when using `defer`. That is, it isn't 100% magical and easy. They just say "Here's how to deal with this." which sometimes means opinion.

hiiamboris

[22:39](#msg6029a6937ba8124e54664a47)`finally` is an obsolete model, which both requires a lot of indentation levels and separates closely tied concerns visually

[22:50](#msg6029a93c8621811d5878e184)\[It's fun actually. I expected next error up the stack to override the previous one, but it doesn't...](https://tio.run/##fY@7CsMwDEXn@CtEJnsJtB0z90OMrSSG2g6ymrQUf7ubpI8p7SA4gqMrri3F@TESQ2LbLONiK6boLHjtglTwEJULDN0Lq2TiiCDx5ljBTI7xEmS9rnCoVfvfOO4YPFCcIeAMZ6JIsvaYku5xN@6n/E4m5CsFOK38fR1wQgJCbQa0m5dFxXSHbkGj2QxySwNcKn6usPGpV20WuZQn)  
But it's just a stack illustration.

greggirwin

[22:52](#msg6029a99ea37fc1784c2082d1)Is there a definitive "state of the art" in this area, that a significant number of people agree on? Can there be only one?

[22:54](#msg6029aa19e634904e609de5c6)That `tio` example shows the issues we face. We want all handlers to be called, but they may fail, so we potentially end up with a resulting block of compound errors.

hiiamboris

[22:59](#msg6029ab697ba8124e546655b9)Why in your example you \*have* to close streams in that specific order?

greggirwin

[23:07](#msg6029ad339337c51bc6887e62)Maybe because if input is consumed it has to be processed. So if you consume it, but don't have anywhere to write it, that input is effectively lost. Or because closing the output first creates backpressure because the munging step has nowhere to send results. I chose the word "flowing" intentionally for that example.

hiiamboris

[23:12](#msg6029ae698621811d5878ec7a)I get the intention, but not sure you can read from a stream you just closed ;)

greggirwin

[23:16](#msg6029af338031c8234bdfd3e7)Sure you can, it's called buffering.

[23:17](#msg6029afa48621811d5878effe)Or think of it in terms of events. As long as your input is firing events, the next stage has to process them. So the first thing you need to do is say "Stop firing events."

## Monday 15th February, 2021

dander

[08:27](#msg602a307aa8c6a778480e3e4c)It seems to me that the `defer` pattern has a lot to do with imperative style programming, where it cleans up the temporal separation "If I use this now, I will have to come back to it later". I don't think it is as relevant if using some other model, like Actors, or event steams. Technically, in my example, the file and socket needn't know anything about each other, but there'd be a dependency if you had some OOP style file uploader class that takes an IO source as an input. In that case, it might be bad to close the file before you clean up the uploader. However, if there was an event source streaming data out of the file and an event listener streaming data into a socket, they are more independent.

[08:40](#msg602a337cdc108172e77a4392)I think that stream example could be changed to be like this (with LIFO or actually any order):

```
defer-streams: function-with-deferreds [][
    ; open input stream
    ; hook up <some event> to "close input stream"
    
    ; open munge channel
    on-exit [probe "close munge"]
    
    ; open output stream
    on-exit [probe "close output"]

    ; process data until end of stream
]

defer-streams
```

And really, instead of the `on-exit` calls, if we have events for when a stream is closed, then those can be used to close the next one in the chain, and so on. Then we are declaring the order in which things should be done rather than relying on the implementation detail of the `do some cleanup later` method

[08:43](#msg602a344ca7fc4b573bd63654)I guess I'm thinking about this model (which I am not an expert in, but have dabbled with)  
http://reactivex.io/

pekr

[08:46](#msg602a34d04c79215749e96069)Couldn't we look into a DB transaction models? They are able to roll-back even a complex transactions. But well, changing data back might be difficult, but doable, whereas in case like events etc., it might be a problem? Sorry, if I am completly off ... :-)

giesse

[10:48](#msg602a517adc108172e77a8bec)@pekr I/O is by definition not stateless. Rollback is not really an option is the most common cases.

[10:51](#msg602a52487ba8124e5467d702)I think I prefer the way `with` is used here: https://trio.readthedocs.io/en/latest/design.html

[10:53](#msg602a5291a8c6a778480e9582)ie. make clean up automatic. @greggirwin's example sounds more like a pipeline to me which should be its own concept (closing the input first etc.)

hiiamboris

[15:51](#msg602a987793539e234378c26c)It's an indentation level though.

greggirwin

[17:42](#msg602ab27b8621811d587b6eb8)Thanks all.

@dander I've done some FRP experiments in the past. Good to be reminded about them.

@giesse ah, right! We talked about Trio and structured concurrency before. I have notes on their nursery model.

There are a number of ways a "do this later" feature can be applied. Maybe it can't be easily generalized.

[21:38](#msg602ae9e4e634904e60a0dcea)@giesse looks like there's some cross lang chat about structured concurrency \[here](https://trio.discourse.group/t/structured-concurrency-kickoff/55)

## Tuesday 16th February, 2021

henrikmk

[13:11](#msg602bc49b8031c8234be501af)Something I miss in REBOL, and apparently also Red, is a clue to what went wrong in a case like this:

```
>> f: func [a [integer!]] [a]
== func [a [integer!]][a]
>> f 'y ; pretend you can't see this value
*** Script Error: f does not allow word for its a argument
*** Where: f
*** Stack: f
```

The wrong type was passed. But what value of what type was actually passed? Valuable debug data is forever lost.

hiiamboris

[13:31](#msg602bc9249337c51bc68dbac5)+1

[13:32](#msg602bc97693539e23437bc48d)Btw I often get this error when I screw the arity up, e.g. by forgetting some argument or if I change the spec but forget to update one of the calls

Oldes

[14:42](#msg602bd9bea7fc4b573bda620b)@henrikmk if I pretend that I'm inside some evaluation, I can see the value in Rebol2:

```
>> f: func [a [integer!]] [a] do [f 'v]
** Script Error: f expected a argument of type: integer
** Near: f 'v
```

and also in Rebol3:

```
>> f: func [a [integer!]] [a] do [f 'v]
** Script error: f does not allow word! for its a argument
** Where: do
** Near: do [f 'v]
```

But not in Red:

```
>> f: func [a [integer!]] [a] do [f 'v]
*** Script Error: f does not allow word! for its a argument
*** Where: f
*** Stack: f
```

rebolek

[14:44](#msg602bda48dc108172e77e5d27)I wonder if it's not part of `error!`, it would make sense.

Oldes

[14:45](#msg602bda836825b964d6124de4)In Rebol3:

```
probe try [do [f 'v]]
make error! [
    code: 305
    type: 'Script
    id: 'expect-arg
    arg1: 'f
    arg2: 'a
    arg3: word! ;<------------ the type
    near: [do [f 'v]] ;<----- the value ('v)
    where: [do try]
]
```

[14:46](#msg602bdacadc108172e77e5f41)Maybe it would help to see an example of the ideal `error!` in such a case.

rebolek

[14:47](#msg602bdb0d6825b964d6124f7f)Red is different here:

```
(...)
arg1: 'f
arg2: word!
arg3: 'a
near: none
where: 'f
stack: -159018252
```

[14:49](#msg602bdb7f7ba8124e546bc364)`'v` is not present in the error unlike in R3.

Oldes

[14:52](#msg602bdc4493539e23437bfd79)I have no idea why the `near` field is empty in such a case in Red.

rebolek

[14:55](#msg602bdcece634904e60a32eab)me too, is there a bug for this?

henrikmk

[15:03](#msg602bdecf9ba13e72e432e2d4)@Oldes technically, you can only see the value, because you are typing it out for NEAR to see it. If you for example pass a native!, you cannot see the return value without a temp storage.

R2:

```
>> f: func [a [integer!]] [a] do [f now]
** Script Error: f expected a argument of type: integer
** Near: f now
```

Oldes

[15:20](#msg602be2aa726a881d4f7ab703)@henrikmk I'm not sure if I'm following you correctly... could you provide an example how the `error!` should look like? In Rebol3 and even in Red I can see, that it does not accept `date!` in your last code example:

```
** Script error: f does not allow date! for its a argument
```

[15:21](#msg602be3028621811d587e95ce)Btw...there is not much space left in the error object for other data... only the `near` field, where it should be.. it should be always \_near_ in such a case... at least if you don't have functions with too many arguments.

henrikmk

[15:23](#msg602be357a7fc4b573bda870c)I don't care about NEAR other than for locating the problem. You can disarm and inspect an error! easily, so why not put the offending value in there too.

```
make object! [
    code: 303
    type: 'script
    id: 'expect-arg
    arg1: 'f
    arg2: 'a
    arg3: [integer!]
    arg4: 16-Feb-2021/16:23:29+1:00
    arg5: [date!]
    near: [f now]
    where: none
]
```

Oldes

[15:29](#msg602be4d6a8c6a778481292d2)But currently there is just:

```
>> system/standard/error
== make object! [
    code: none
    type: none
    id: none
    arg1: none
    arg2: none
    arg3: none
    near: none
    where: none
    stack: none
]
```

henrikmk

[15:29](#msg602be4ed47585464db80dcc8) Yes, so not fixable in R2, but it should be fixable in Red.

Oldes

[15:30](#msg602be5177ba8124e546be48c)Is really so important to see `16-Feb-2021/16:23:29+1:00` if the function requires `integer!`?

henrikmk

[15:33](#msg602be5e4dc108172e77e8618)@Oldes in the context that triggered the discussion where I saw this issue, yes, very much so. I was testing some network code for a customer and it failed with a crash. The error was mishandled in my error handler code, so the handler crashed and the error was lost. I still don't know what the error was, and I will probably not know for a while, so there is still unhandled problems.

When I think about it this way, losing that error actually gives a lot of extra work and lost chances for fixing an issue and making my code more robust, if it's hard to repeat. It's actually a fairly critical problem.

Oldes

[15:36](#msg602be67747585464db80e136)I think that adding `arg4` would not be such a big problem, but I'm not sure if this value should be visible in \_formed_ error message.

henrikmk

[15:37](#msg602be6a3726a881d4f7ac7c1)Who FORMs a whole error object? Why have this limitation?

Oldes

[15:37](#msg602be6c04c79215749edb751)I mean the error when it does not look like `make object...`

henrikmk

[15:37](#msg602be6d48031c8234be56539)You have error formatters to shorten the output. The error! object must be for deep analysis.

hiiamboris

[15:57](#msg602beb774c79215749edc4a8)I totally agree the value should be shown. (in the formed output as well, just cut to ~50 chars or so)

[16:00](#msg602bec39a37fc1784c26374c)My guess it's not present because `mold` has bugs too and by calling it during error output we may replace the original bug with a bug in `mold`.

[16:03](#msg602becbca7fc4b573bdaa2e2)@henrikmk would you create a \[wish ticket](https://github.com/red/REP/issues) as a reminder?

henrikmk

[17:14](#msg602bfd784c79215749edfcd7)@hiiamboris Done

hiiamboris

[17:29](#msg602c0105a8c6a7784812e735)Thanks

greggirwin

[19:00](#msg602c1650a8c6a778481324d9)I commented on the ticket, but agree that the more helpful we can be to ourselves, the better off we are.

[19:04](#msg602c1730dc108172e77f19ba)@toomasv noted that we lost `load/trap` with the new fast lexer. Don't know if it coming back, but with `transcode/trace` we can do something similar. I worked up a `load-trap` example and had some fun with the output, but there's something to be said for being nice to the user.

```
probe load-trap s: {
[1 2 3]
[[4 5 6] 7 8 9] word #issue @ref
"string" <tag>
[10 11xx]
}
; returns
[[1 2 3 4 5 6 7 8 9 word #issue @ref 
    "string" <tag> 10
] [error "x]^/" pair! 5 62x65]]

show-nice-trap-info load-trap s

; displays this:
So far I loaded 15 values 
The last of which are  [
    "string" <tag> 10
] 
But I stopped parsing after "11x" 
On line 5 
Where I thought I found a pair! 
But then saw "x]^/"
```

giesse

[19:17](#msg602c1a488031c8234be5fa7f)@henrikmk

&gt; The wrong type was passed. But what value of what type was actually passed? Valuable debug data is forever lost.

```
>> f: func [a [number!]] [a]
== func [a [number!]] [a]
>> f 'y
*** Script error: Invalid type for argument A: word! not in number!: y
*** Stack: 'y
*** Stack: f 'y
```

guess the language.

## Wednesday 17th February, 2021

GiuseppeChillemi

[23:02](#msg602da07e726a881d4f7f6b09)So it is fully legal to have this:

```
f: func [a b /local c [block!] "A value"] []
```

Even if it has no effect?

[23:03](#msg602da0bfa37fc1784c2acf2e)I mean , could I have helper strings and blocks in locals definition, having Red not affected by them?

greggirwin

[23:18](#msg602da453e634904e60a80bf1)The risk of doing things like that is that you can't complain when we break it. That is, just because something undocumented works today doesn't mean it always will.

GiuseppeChillemi

[23:26](#msg602da632a7fc4b573bdf4e82)The question was just that: is it safe? Otherwise `; c [block!] "A Value"` or function specs preprocessor will make things safe. So, the answer is: it is not safe! ;-)

greggirwin

[23:32](#msg602da771e634904e60a815fd)This particular hack should be safe, because it aligns with how the spec works today. That doesn't mean all tools will understand it, e.g. the DG func spec rule.

GiuseppeChillemi

[23:34](#msg602da81de634904e60a817ae)Gregg it was an idea to have description on locals too, so the onlooker can have an idea on what the local value does.

[23:39](#msg602da9249403f11bb58d2350)This night I am playing with function and objects specs. Another idea:

`f: Func [a b c d :check] []`

Where function is defined as:

`check: func [ctx] [check code]`

The idea is: when the function is invoked, the context is passed to `check` for a verification and it could `THROW` and error...

greggirwin

[23:44](#msg602daa6ba7fc4b573bdf5829)Get-words are already used in func specs, so that would be incompatible with how things work now.

GiuseppeChillemi

[23:46](#msg602daaf07ba8124e5470b2fe)Yes, you are right, they are possible only if `/local`, or another "refinement" is present like:

`f: Func [a b c d /check :check-func] []`

greggirwin

[23:47](#msg602dab2347585464db85b38e)https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#literal-arguments-and-get-arguments

https://github.com/red/red/issues/1850

## Thursday 18th February, 2021

GiuseppeChillemi

[09:48](#msg602e37f79ba13e72e4392aa5)@greggirwin Could you help me identifying the commit since the old Parse Based lexer has not been developed anymore, so I can keep track of the changes?

[09:49](#msg602e381e93539e2343827057)The question also for anyone which can answer to this question.

ne1uno

[15:29](#msg602e87c2a7fc4b573be1991d)http://progress.red-lang.org/ https://www.red-lang.org/ on the progress page merged commit messages for new fast lexer, and blog started around Jul/Aug/2020

## Friday 19th February, 2021

ScotSutherland

[16:34](#msg602fe88f8031c8234bf01e2f)Looking into Red again. Looks like major progress. However, the binary for MacOS doesn't seem to work on Catalina. Anyone else experiencing this?

pekr

[16:35](#msg602fe8e8e634904e60adedc8)@ScotSutherland not a Mac user, but IIRC Catalina is 64 bit, which is not supported by Red yet ....

rebolek

[16:37](#msg602fe9559337c51bc698f3a4)@ScotSutherland : @pekr is right, new macOS version needs to wait for 64bit solution. Let’s hope it will be done soon.

hiiamboris

[16:41](#msg602fea4247585464db8ba8c3)@ScotSutherland https://github.com/red/red/issues/4652#issuecomment-695329813

## Saturday 20th February, 2021

ScotSutherland

[00:00](#msg60305107a37fc1784c31f654)@hiiamboris Thanks for the link. Helpful.

## Sunday 21st February, 2021

sleepnova\_twitter

[12:56](#msg6032587edc108172e78f4ccb)&gt; @ScotSutherland not a Mac user, but IIRC Catalina is 64 bit, which is not supported by Red yet ....

:'(

## Monday 22nd February, 2021

gltewalt:matrix.org

[01:55](#msg60330f0f4c792157490022b7)I was under the impression that Catalina came with an emulator?

greggirwin

[01:56](#msg60330f488031c8234bf7c325)Not AFAIK. It's their hard break from the past.

GiuseppeChillemi

[17:53](#msg6033ef93a8c6a77848277eac)

ldci

[19:23](#msg603404a47ba8124e54811aee)Untested : http://netkas.org/?p=1491

## Tuesday 23th February, 2021

XANOZOID

[16:04](#msg6035277d8031c8234bfd646d)I just want to say, Red is a beautiful language

greggirwin

[16:54](#msg603533374c792157490600db)Thanks @XANOZOID. :^)

planetsizecpu

[17:33](#msg60353c569ba13e72e44b3f66)+1 @XANOZOID

XANOZOID

[18:53](#msg60354f13a37fc1784c3ecc92)( :

## Thursday 25th February, 2021

GiuseppeChillemi

[11:16](#msg6037870ab13524529aad1d04)How do we call the form where the symbol is split from its value and how do we represent this? If `a` has value `22` which the standard way to split and then do the opposite, make the contextnamd assign this value? I have create something but I would like to know if there is a standard way.

[13:25](#msg6037a55442f30f75c7c84211)Pardon, I have seen that my message has a lot of confusion; it happens when you write quickly on mobile.

[13:41](#msg6037a9204821572018fd676e)The correct question: do we have a standard to split words from their values to save/send/receive them and then recreate a context?  
For objects I use:

```
oo: make object! [c: 22 d: 33 e: [l n m]] 
mold/all body-of oo
```

if

```
l: 66 m: 77 n: 88
bb: [l m n]
```

Do we have a standard to split `l m n` from their values to transfer them like?

```
bb: [l: 66 m: 77 n: 88]
```

9214

[13:49](#msg6037aafc0045466209529bb9)

```
text
>> words: words-of object [a: 1 b: 2 c: 3]
== [a b c]
>> reduce words
== [1 2 3]

>> data: save/as #{} words 'redbin
== #{
52454442494E0204010000008400000003000000180000000000000008000000
100000006100000000000000620000...
>> reduce [:a :b :c]
== [unset unset unset]

>> words: load/as data 'redbin
== [a b c]
>> reduce words
== [1 2 3]
>> reduce [:a :b :c]
== [unset unset unset]
>> context? first words
== make object! [
    a: 1
    b: 2
    c: 3
]
```

GiuseppeChillemi

[13:57](#msg6037ace46eb766540c22b872)Nice, is there an human readable form of redbin?

9214

[13:59](#msg6037ad44b1837054051794db)Yes, it's called Red.

GiuseppeChillemi

[14:32](#msg6037b5136eb766540c22d54f)@hiiamboris et ALL: I have forgotten to test the modifications the fixes you have made to REDBIN reaching "20.000" hardcoded limit:

I confirm everything is ok:

I have run the foollowing code:

```
location: %bookmarks

prin "load-json: " probe dt [j: load/as location 'json ]
prin "save-redbin: " probe dt [save/as %bmarks.redbin j 'redbin]
```

Here is the result:

```
load-json: 0:00:18.3891
save-redbin: 0:00:15.8749
```

[14:46](#msg6037b85148e4d527e8096def) But... it is the second time on load/as .. 'json and printing the time on the console I receive the following error:

```
>>
draw-end error: 142213121
```

[14:57](#msg6037baf7cfd9b375cd55af75)And Again!.

Here is the code:

```
location: %bookmarks

times-load-json: to-integer ask "How many times should I loop json-load? > "
times-save-redbin: to-integer ask "How many times should I loop redbin-save? > "

loopnum: 0
loop times-load-json [loopnum: loopnum + 1 prin ["load-json: cycle #" loopnum " Time: "] probe dt [j: load/as location 'json ]]
loopnum: 0
loop times-save-redbin [loopnum: loopnum + 1 prin ["save-redbin: cycle #" loopnum " Time: "] probe dt [save/as %bmarks.redbin j 'redbin]]
```

Tested for: 5 loads, 0 saves.

Result:

```
load-json: cycle # 1  Time: 0:00:18.3671
load-json: cycle # 2  Time: 0:00:29.6577
load-json: cycle # 3  Time: 0:00:44.2965
load-json: cycle # 4  Time: 0:00:46.7807
load-json: cycle # 5  Time: 0:00:46.0426
== none
draw-end error: 142213121
```

[15:07](#msg6037bd36e820835296b180ec)@9214 Also redbin is showing an interesting behaviour on this 80mb json file:

The first time it runs, it takes 18 seconds, then 2,7 seconds!

```
How many times should I loop json-load? > 1
How many times should I loop redbin-save? > 5
load-json: cycle # 1  Time: 0:00:18.4871
save-redbin: cycle # 1  Time: 0:00:17.715
save-redbin: cycle # 2  Time: 0:00:02.69317
save-redbin: cycle # 3  Time: 0:00:02.75516
save-redbin: cycle # 4  Time: 0:00:02.75716
save-redbin: cycle # 5  Time: 0:00:02.74316
== 0:00:02.74316
>> 
draw-end error: 142213121
```

I suppose it triggers a garbage collection cycle at the end of its work but this test shows it should be triggered at its start too.

9214

[15:11](#msg6037be056c077b203576d365)@GiuseppeChillemi please use `/bugs` room to report issues, and please make an effort to minimize code examples, narrowing them down to the actual culprit. In this specific case, the error is unrelated to either JSON or Redbin codec — it comes from the \[Draw backend](https://github.com/red/red/blob/0645c80d93681b41b2f3e0cc9973edb99ad98189/modules/view/backends/windows/draw.reds#L346).

hiiamboris

[15:16](#msg6037bf4de820835296b18761)Also you should call `recycle` manually between your tests or your results will be misleading.

[15:17](#msg6037bf7042f30f75c7c8a3b6)Thanks for testing. Looks like save and load times are almost balanced then.

GiuseppeChillemi

[15:17](#msg6037bf9db13524529aadd66d)I have no called recycle manually just to test how overgrown internal structures influence exection time.

[15:20](#msg6037c058e0d7284c735a6238)@9214 I was closing the discussion here before moving as this new behavior of redbin arose while testing. So I have kept it for just one more message. Everything was happening in realtime.  
:point\_up: \[Here is the link to the thread start in RED/Bugs](https://gitter.im/red/bugs?at=6037bfe82a9d4f27f1329736)

## Sunday 28th February, 2021

giesse

[19:04](#msg603be925457d6b4a94941e09)https://ahgamut.github.io/c/2021/02/27/ape-cosmo/

hiiamboris

[19:48](#msg603bf397823b6654d274be47)Portable \*binaries* starting from 12kB? Wow. I'm gonna test that.

Oldes

[20:51](#msg603c026922a5ce4a9124dfeb)Interesting... but:  
&gt; Please note this is intended for people who don't care about desktop GUIs, and just want stdio and sockets without devops toil.

hiiamboris

[21:02](#msg603c04f4e5f1d949d46e2ce3)&gt; Bloat might work by the same principles, in which case, zip source file embedding could be a more \*socially conscious way of wasting resources in order to gain appeal with the non-classical software consumer. *

:D

## Monday 1st March, 2021

greggirwin

[02:17](#msg603c4eae457d6b4a949526a5)Someone must have linked to her work before, or I found it another way. I had seen SectorLisp and the big table of magic numbers. The bit on the \[lib page](https://justine.lol/cosmopolitan/index.html) regarding `memcpy` improvements is great. I sure wish we could hire her. Really fresh thinking.

Imperatorn

[07:51](#msg603c9d04a3a2f04f1fc67b84)Is this the main place to discuss Red?

hiiamboris

[07:54](#msg603c9dbd120cd84f78e71482)Hi @Imperatorn . This room is for Red design discussions. red/help room is for learning.

Oldes

[19:23](#msg603d3f2ae562cf54ac90bf20)Any tip for a proper name and doc-string for such a function?:

```
func[file [file!]][#"/" <> first file]
```

[19:27](#msg603d4026e5f1d949d471a487)Maybe something like this?

```
>> absolute?: func[path [file!]][#"/" = first path]
== func [path [file!]][#"/" = first path]
>> absolute? %/c/aaa
== true
>> absolute? %../aaa
== false
```

[19:28](#msg603d405ee5f1d949d471a592)Or:

```
>> relative?: func[path [file!]][#"/" <> first path]
== func [path [file!]][#"/" <> first path]
>> relative? %/c/aaa
== false
>> relative? %../aaa
== true
```

greggirwin

[19:41](#msg603d436c120cd84f78e9146a)Since `absolute` can also relate to numbers, I might include `file` as part of this name (unless you generalize it to other values, but we don't have a notation standard for relative references. In my old R2 file lib I have the following funcs: `abs-path? has-path? as-relative-file to-relative-file`

I probably chose `*path` because of `split-path`, but `*file` for the conversion funcs because the file itself is an important element there.

hiiamboris

[20:01](#msg603d4806e8267a46f2e63990)+1 for `abs-path?`

Oldes

[20:43](#msg603d51f3d1aee44e2db9c679)What about this one?

```
>> absolute?: func[val [file! number!]][ either file? val [#"/" = first val][val = absolute val] ] ()
>> all [absolute? 42 absolute? %/c/xx] 
== true
```

[20:57](#msg603d5541d1aee44e2db9d02f)but `absolute?` on number is probably not much useful... so maybe the `abs-path?` is the best one.

[21:01](#msg603d5620120cd84f78e94e65)@greggirwin don't you have in your collection a function, which would take a block of paths and make these relative to given directory... if possible?

hiiamboris

[21:22](#msg603d5b03e5f1d949d471f77f)I may have.. recall something like that..

greggirwin

[21:28](#msg603d5c8db5131f4f28e6cba1)Something like this (just hacked using my old R2 base func)?

```
to-relative-file: func [file [file!] /local res] [
	res: remove/part find file: copy file what-dir length? what-dir
	either res [head res] [file]
]
to-relative-files: func [files [block!]] [
	collect [foreach file files [keep to-relative-file file]]
]
files: read %.
abs-files: collect [foreach file files [keep clean-path file]]
rel-files: to-relative-files abs-files
```

hiiamboris

[21:30](#msg603d5ced457d6b4a94982693)@Oldes you're lucky

```
;@@ TODO: refactor and export this into the warehouse
get-relative-path: function [
    "Get PATH relative to BASE"
    path [file!]
    base [file!] "Should be a directory!"
][
    #assert [dir? base]     ;@@ or convert to a dir?
    path: split clean-path path #"/"        ;@@ this is where a longest match algorithm could have been useful!
    base: split clean-path base #"/"
    take/last base          ;-- remove the empty part
    while [all [path/1 path/1 = base/1]] [remove path remove base]  ;@@ BUG: OS dependent: in Windows should use `=`, in Linux `==`
    insert/dup path ".." length? base
    parse path [any [skip ahead skip insert "/"]]
    as file! rejoin path
]

#assert [%1/2    = get-relative-path %1/2 %./]
#assert [%2      = get-relative-path %1/2 %1/]
#assert [%../1/2 = get-relative-path %1/2 %2/]
#assert [%1/2    = get-relative-path %/1/2 %/]
```

Oldes

[21:31](#msg603d5d19b5131f4f28e6cd87)@hiiamboris thanks!

greggirwin

[21:31](#msg603d5d31e562cf54ac911957)@hiiamboris nice. :+1:

Oldes

[21:44](#msg603d602ad71b6554cd15bb1e)@hiiamboris what do you mean with \_this is where a longest match algorithm could have been useful!\_?  
(I understand, that it's what's done in the 4 lines, but how it should look like reduced?)

hiiamboris

[22:06](#msg603d6563e5f1d949d47219c0)I think I meant that we have `find/match` but we can't ask "how big part of str and substring have in common" so I have to do that `while [][remove]`, tedious task.

[22:07](#msg603d65a5d1aee44e2db9fd17)If we had `longest-common-match? series1 series2` it would be just one `remove/part` call.

[22:09](#msg603d65fdd71b6554cd15cb0f)And I also mean it should be a `native!` or `routine!`.

Oldes

[22:12](#msg603d66ebd2619a4f2e17914c)`longest-common-match?` is not the best name.. I would start trying to find a better one ;-)

[22:13](#msg603d670322a5ce4a9128c7b2)I think that there could be a split between `find` and `match`.. as a starter... than maybe have `match/common`?

hiiamboris

[22:34](#msg603d6bf9a3a2f04f1fc8f544)Agreed.

[22:36](#msg603d6c83d71b6554cd15dbeb)Also some refinement to find longest common substring (not necessarily starting from index 1).

greggirwin

[23:30](#msg603d7923457d6b4a9498749e)Almost 20 years ago now, if my comments are to be believed, I did some longest-common-subsequence experiments in R2, then ported it to `rebcode` (anyone remember that?). Did a number of things it seems, but only experiments, e.g. `diff` on blocks, `patch` dialect as code, so you could get a diff that was Redbol commands you could send somewhere and run it. Even a little GUI that showed diff offsets (at a glance anyway).

I think this is still something that could be a new way of looking at things; block level vs text level. Anything we do to emulate things that have proven valuable (awk, grep, etc.) need to work on Red data as well as strings. Plain text as an interface had its day. Still valuable and \*probably* worth supporting for legacy and adoption purposes ;^), but we will save our future selves huge amounts of pain if we go all Red.

[23:41](#msg603d7b91823b6654d27910df)If anyone wants to pursue these, and thinks my naive code from decades past might be useful, I'll put it somewhere.

## Tuesday 2nd March, 2021

rebolek

[09:16](#msg603e026395e23446e408b06c)My Hackintosh crashed and I had to reinstall it from the scratch. As a result, I’m now running Catalina instead of El Capitan, which means no 32bit apps for me. As Red sadly still doesn’t support 64bit OSes, I must run Red in a container. Fortunately, I’m not using GUI very much, because currently, I can’t think of a way to run Red GUI version on Catalina (besides running VM with older macOS or Windows).

Anyway, as this is a common request, I wrote a guide on how to get it running, so you can just type `red` in macOS console and have Red running with access to macOS filesystem. Docker probably would be the expected solution, but Docker seems too complicated to me, so I used Multipass which took like five minutes to both install and understand. So here’s the guide: https://github.com/rebolek/red-tools/wiki/Red-on-Catalina

dander

[09:41](#msg603e084ba3a2f04f1fca7a0e)@rebolek have you looked into something like https://www.xquartz.org/ for running a GUI on Mac? I don't have one, but I've done something similar with graphical Linux apps on Windows, and it works well enough

rebolek

[09:47](#msg603e0998823b6654d27a7ea2)@dander thanks, but I probably leave this to others as I don’t need it that much :-) But if it’s possible to run XQuartz on Mac and connect to it from the container, then I guess it would work.

toomasv

[10:16](#msg603e107fe5f1d949d473ddc2)An old attempt on \[Longest Common Subsequence](https://gist.github.com/toomasv/92eb0d1e382e27cd6ebd26b9f56a2725), may be faulty.

greggirwin

[16:39](#msg603e6a29d71b6554cd1879f0)Added @rebolek's notes to https://github.com/red/red/wiki/%5BDOC%5D-Installing-Red-and-Getting-Started

rebolek

[16:43](#msg603e6b45d74bbe49e0cc1c81)@greggirwin thanks, the document is a work in progress, so I haven’t added it anywhere yet but should be usable even in this raw form.

greggirwin

[16:45](#msg603e6b8eb5131f4f28e99f24)It's a link in the wiki, so as you improve it, we get it for free. :^)

GiuseppeChillemi

[19:39](#msg603e946ce8267a46f2e9b279)Do you think that in the future, external script in compiled form could be run isolated in a container Red application, and interact with it via API? Is it planned?

rebolek

[20:14](#msg603e9cb9e8267a46f2e9ca78)It sounds like encap+services. I believe you can do something like that even today with some effort.

greggirwin

[20:18](#msg603e9dab44f5a454a44daaf7)You can hack almost anything this way. It's not something we plan to make standard in Red, but people can share their solutions. Basically you include your binary payload, write it to disk, run it, optionally delete it when your app exits. I think people did fancier things too, but don't remember the details.

GiuseppeChillemi

[20:43](#msg603ea388e5f1d949d475697d)Apps should be isolated and have VID output as sub element of the main one and controlled by it. The hosting app should have the power to kill it and exclude from some services it provides.

## Sunday 7th March, 2021

justjenny

[00:19](#msg60441c0db5131f4f28f91faf)Hi - Been working in Germany for the last 8 months, so boring - and now quarantine - even more boring - what's the latest on the AV scanners - are they still giving us false positives ?

greggirwin

[00:33](#msg60441f74a3a2f04f1fdb0ff1)They still do, but the plan is to do much more frequent "stable" releases and EV Code Sign those, so people downloading them shouldn't have issues.

justjenny

[00:38](#msg60442087d71b6554cd27f36f)Yes I guess the EV signing is the only way to do it - so frustrating when these scanners block us

[00:51](#msg6044239be5f1d949d482885c)Tell me something, anything - I'm in a 'Best Western' - not the best of hotels, but only another 5 days to go

greggirwin

[00:56](#msg604424aaa3a2f04f1fdb1a28)You've been away for a while, so check out the red-lang.org blogs about fast lexer and R/S updates. Lots of other work done as well. Ports are getting close, and we released our first commercial product built with Red. See https://www.redlake-tech.com/products/diagrammar-for-windows/

## Monday 8th March, 2021

greggirwin

[22:34](#msg6046a675d2619a4f2e305893)https://www.redlake-tech.com/blog/2021/03/diagrammar-1.2-available-now/

mrjbq7

[23:33](#msg6046b42fb5131f4f28ffa4c3)Any word on red for 64-bit or the new Apple Silicon (arm64)?

## Tuesday 9th March, 2021

GiuseppeChillemi

[01:07](#msg6046ca4722a5ce4a91419a35)@greggirwin a lot of improvements! Great!

greggirwin

[05:43](#msg60470aebb5131f4f28007b22)@mrjbq7 no timelines for those yet.

pekr

[09:55](#msg604745f6e5f1d949d4899f5c)@greggirwin congrats to the Diagrammar update. Interesting section for me is - getting DG to be D2D backend compliant. Seems like a tough task, to get a pixel precise results. Did DG cope well in that regard? Any noticable benefits, with e.g. bigger diagrams, etc.?

plegoff

[13:06](#msg604772f1e562cf54acabd4e7)@GiuseppeChillemi Sorry for the late, I've just see your message on Digicamsoft (RebelBB) about the Rebol core translation I've made few years ago. Do you need the files (html, txt) ?

m\_a\_j\_ch\_rz\_a\_k\_twitter

[15:11](#msg6047902ce562cf54acac28b8)Hello, is there any web server for red?

artixfox:matrix.org

[15:27](#msg604793e622a5ce4a9143b38e)hello everyone, just found out about red language. but i am getting a error

when trying to run  
Red [  
Title: "Download links"  
]  
args: system/script/args

comment {  
\- Accept a URL as input to program  
\- HTTP GET URL  
\- Parse response as HTML  
\- Extract a links  
}

raw-html: read (to-url system/script/args)

foreach part (split raw-html "href=") [  
foreach part2 (split part "^"") [

if find/match part2 "https://" [  
print part2  
]  
]  
]

it doesnt works

hiiamboris

[15:37](#msg60479629120cd84f780492e4)@artixfox:matrix.org  
hi (;  
1\. use `?` or `help` in console to debug your code  
2\. https://gitter.im/red/help is the proper room for learning  
3\. to paste code you need to add 3 backticks from both sides

artixfox:matrix.org

[15:40](#msg604796d35d0bfb4e58994837)lemme try

[15:40](#msg604796ff22a5ce4a9143bd06)not working

Gtk-Message: 21:10:24.024: Failed to load module "canberra-gtk-module"  
Gtk-Message: 21:10:24.026: Failed to load module "canberra-gtk-module"  
\--== Red 0.6.4 ==--  
Type HELP for starting information.

&gt;&gt; do %hello.red  
\*\** Script Error: invalid argument:  
\*\** Where: do  
\*\** Stack: do-file

&gt;&gt;

hiiamboris

[15:50](#msg6047995ad74bbe49e0e1e9bc)please do not spam in this room anymore

artixfox:matrix.org

[15:51](#msg6047996d95e23446e4221b93)wht?

pekr

[15:52](#msg604799ab457d6b4a94b3351d)Hiiamboris is trying to say, that for the usual user requests, there are other rooms better suiting the discussed topics. This rooms tries to stay to the Red development purposes ...

[15:52](#msg604799d522a5ce4a9143c51a)use either Help or Welcome rooms, please: https://gitter.im/red/help, https://gitter.im/red/red/welcome

artixfox:matrix.org

[15:54](#msg60479a45e8267a46f2019ab2)oh sorry!

GiuseppeChillemi

[17:45](#msg6047b41c95e23446e4227521)@plegoff HI, I have been searching for the content of this site: https://web.archive.org/web/20071124212507/http://rebdocproj.org/ You should have the backups of it.

[17:46](#msg6047b47995e23446e4227635)Also, if you have Rebol/Core translations, they are welcome, either in html and txt. I hope you have a make doc version too.

[17:47](#msg6047b4b8a3a2f04f1fe4632e)Oh, I have read your private messages right NOW.

greggirwin

[19:36](#msg6047ce2195e23446e422cb63)@pekr, I don't know if I'd say pixel precise, and there's more work to do to tune it, but it wasn't too hard to get it close to what we wanted.

[19:37](#msg6047ce7f22a5ce4a91447706)@m\_a\_j\_ch\_rz\_a\_k\_twitter a web server will come after ports are available, which is high on our priority list.

## Wednesday 10th March, 2021

JacobGood1

[01:20](#msg60481ec55d0bfb4e589ae8f5)t

gltewalt

[01:23](#msg60481fabd71b6554cd327c60)f

greggirwin

[01:38](#msg604822fce8267a46f2034101)You guys and your Lisp humor.

m\_a\_j\_ch\_rz\_a\_k\_twitter

[10:11](#msg60489b60d2619a4f2e35b77f)@greggirwin what do you mean by "ports"? Could I use other programming languages by those?

hiiamboris

[10:13](#msg60489bc9d1aee44e2dd7fb9d)http://www.rebol.com/docs/core23/rebolcore-14.html

m\_a\_j\_ch\_rz\_a\_k\_twitter

[10:15](#msg60489c27120cd84f78078d22)oh! I see now. It would be really good to have async/await pattern with those ports.

greggirwin

[20:18](#msg6049298ed71b6554cd3580c3)The concurrency model is not finalized. It's a big space. e.g. compared to Callback Hell :tm:, async/await is an improvement, but there are other models, structured concurrency to consider, etc. Ultimately, the core needs to let us build other models on top of it.

[23:20](#msg60495420e8267a46f206c3e7)https://www.redlake-tech.com/blog/2021/03/diagrammar-1.2.1-rule-update/

## Thursday 11st March, 2021

luce80

[17:55](#msg604a5992d2619a4f2e3af10d)@m\_a\_j\_ch\_rz\_a\_k\_twitter I have implemented \[promises](http://www.rebol.org/view-script.r?script=promises.r) in Rebol2 and I can say they are a pain to implement and to use. I must admit that even if my implementation is more feature rich than the original I haven't implemented a proper async/await pattern. All this said Instead of `promises`I would prefer that async HTTP(S) was implemented and then, send a request by inserting it into a port, then when downloading finishes or gives an error insert an appropriate event! in the wait-list so we could do something like:

```
on-download [...
	;or
	insert-event-func func [face event][
		if all [
			event/type = 'download
			; event/picked = 200 ; OK code
			; or
			; event/key = 200 ; OK code
			]
			[
			; file: read http-port
			; or
			; file: event/picked
		]
		none ;-- the event can be processed by other handlers 
	]
```

GiuseppeChillemi

[21:22](#msg604a8a2944f5a454a46deaf4)@luce80 "I have implemented" ?!? So you are Marco!!!

## Friday 12nd March, 2021

Nuc1eoN\_gitlab

[01:40](#msg604ac6a0823b6654d29d51e0)How does Elixirs concurrency model work? If I understood correctly Elixir works on mulitple cores "out-of-the-box". I wonder if this could be achieved for red.

greggirwin

[02:19](#msg604acf9ed1aee44e2dde8dad)Elixir runs on Erlang. It's a big, complex runtime system. It used to run only on a single core but now has multiple schedulers, from a quick search. Processes are very lightweight, so not OS processes. I can't speak to the internals.

But there's concurrency, and there's CONCURRENCY. That is, there are levels of granularity, each appropriate for different needs. OS processes go a long way. Threads are helpful if you have a monilithic app and you don't want, e.g., the GUI blocked while you print a document. Then you have lightweight/green threads and co-routines (whether things are cooperative or pre-emptive), and finally ultralight process objects like Erlang with custom schedulers and a runtime to manage them.

Do you need a ten processes, a hundred, a thousand, or a hundred thousand? As you think about that, bear in mind that those processes are not all equal to each other in their richness. e.g. an Erlang process is more like a closure, not an interactive app.

For Red, the question is how best to mix and match, leveraging modern hardware effectively and easily for the user, while building on the things Red is good at.

qonn

[16:52](#msg604b9c5ce8267a46f20d5616)Hi guys, I just discovered Red today, does Red support webview as of right now?

greggirwin

[18:11](#msg604baee0d71b6554cd3cd8bf)No, sorry.

qonn

[19:08](#msg604bbc31e5f1d949d49586a6)Oo alright, thank you for answering. So let's say I were to create a simple button from scratch, is the only way is to start from `base`?

hiiamboris

[19:14](#msg604bbd8c44f5a454a47163b4)Yes if you want to define it's look.

[19:15](#msg604bbdbb95e23446e42e45d8)We have a dedicated https://gitter.im/red/help room btw, for beginners questions ;)

greggirwin

[19:17](#msg604bbe5de562cf54acb867be)@qonn Red's current GUI system is based on native widgets, so you don't have to start from square one. It just doesn't run in the browser.

Oldes

[19:54](#msg604bc6f7e562cf54acb8822b)WebView would be nice addition imho... even if it would be thru external dll. This could be good start: https://github.com/webview/webview

[20:00](#msg604bc84dd2619a4f2e3f0970)When I was checking it last time, I had a feeling, that WebView2 for Windows is quite a bloat... it's not installed on system by default.. and it simply creates a system inside a system. My EdgeWebView folder have 414MB

[20:01](#msg604bc89395e23446e42e6698)The old WebView can be used without any special installation, but it's very limited these days.. it's based on IE and many current pages simply does not work in it.

[20:02](#msg604bc8e9d1aee44e2de15a9e)It should be quite easy to add webkit2gtk support I guess.

[20:05](#msg604bc97de5f1d949d495b54e)I wonder what WebView versions are using Epic and Steam for their apps.

Respectech

[20:06](#msg604bc9aa22a5ce4a914fe972)Can WebView apps also run on Android?

Oldes

[20:10](#msg604bcaaa457d6b4a94bf878e)I think that almost all apps except games are using WebView on Android.

[20:10](#msg604bcacd44f5a454a4718e3c)At least apps like Facebook, Slack etc..

Respectech

[20:19](#msg604bccc8e5f1d949d495c02a)Well, I'd really be excited if Red worked with Webview then! I could rewrite our company software in Red instead of hacking together web technologies in a bunch of different languages...

Oldes

[20:22](#msg604bcd8bb5131f4f280e8b94)But WebView is about hacking together web technologies.. it's basically just a browser running inside an app.

[20:23](#msg604bcdb122a5ce4a914ff654)I guess, that Steam's WebView will be bundled inside SteamUI.dll which has 12MB

[20:25](#msg604bce3ad2619a4f2e3f1c54)I'm sure that they are using WebView for the UI, because there are css, html, json files... and they are running own server to serve the pages to view.. that will be steamwebrtc.dll (5MB)

[20:26](#msg604bce91e5f1d949d495c435)Heh... Origin is using QT5 and the Qt5WebEngineCore.dll component has 54MB! With other QT5 dlls it's 82MB.

greggirwin

[20:31](#msg604bcfa4d1aee44e2de16f95)I don't see, out of ignorance, how this would work with Red. Can someone outline what an app would look like (code and structure) that uses it? Is it just that you could display web content inside your Red app? Can you get events from link clicks?

Oldes

[20:32](#msg604bcfea44f5a454a4719e8e)I guess that the winner is Epic... I think that they are using the WebView2 and their games launcher has 940MB on my notebook!

[20:32](#msg604bcfede5f1d949d495c771)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/nuHL/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/nuHL/image.png)

[20:34](#msg604bd040e5f1d949d495c846)@greggirwin it could work how others are using it.. you start an app, which starts a local server and UI is made like classic web pages.

hiiamboris

[20:34](#msg604bd040457d6b4a94bf9961)Let's just write a `bloat` module that will spawn 1GB of randomly named files with random data inside upon compilation, so we could include that into the app bundle ;)  
Also our bloat will be top notch as nobody will be able to compress it..

Oldes

[20:34](#msg604bd072b5131f4f280e936f)WebView are not imho bad.. but it should be using resources which you already have on system, like the GTK based webview.

Respectech

[20:40](#msg604bd1b295e23446e42e7f4f)In that case, nevermind. I thought Webview would be more like a system where it maps the app's UI to a Javascript Canvas, or something like that...

greggirwin

[20:41](#msg604bd1f322a5ce4a915003bc)@Oldes so your Red app is just a launcher, and everything else is web, correct? If so, what value does Red add there? What are other people doing with it that are like things we would build. Or are they using webview in place of other GUI options for their lang?

Oldes

[20:42](#msg604bd227e562cf54acb8a480)You can call native functions from the locally served pages (GUI)

greggirwin

[20:42](#msg604bd22e823b6654d2a04eb0)@hiiamboris PowerBASIC had a `bloat` switch in later years, which make your EXE as large as you wanted, filled with gibberish data, so it would look more respectable.

[20:43](#msg604bd281d71b6554cd3d4c78)So you write in JS+CSS+HTML for the UI, then hook into actions like link clicks to call Red funcs?

Oldes

[20:44](#msg604bd2aee562cf54acb8a5d8)yes

greggirwin

[20:45](#msg604bd2ddd1aee44e2de177e5)And how is that better or easier than just using Red? That's what I'm missing.

Oldes

[20:45](#msg604bd2e6d1aee44e2de177f6)To make my research complete, Ubisoft is having UplayWebCore (1.5MB), but 129MB in dlls.

[20:47](#msg604bd34a5d0bfb4e58a5bc41)@greggirwin I don't think you can do a modern looking GUI (like modern web pages) in Red app. At least not now.

[20:47](#msg604bd378457d6b4a94bfa3ae)And I don't say it is easier. One have to know all the web technologies.

[20:51](#msg604bd43c95e23446e42e86f8)I just wanted to say, that WebView is quite common now. When you open any of Steam, Epic, Uplay, Origin or whatever (to start a game) you are opening a custom made browser, which tries to sell you other games.

[20:52](#msg604bd4a5d1aee44e2de17c3e)I don't have any Slack, Discord, Gitter or similar local app installed, but I bet, that all of these are also based on bundled web browser (WebView).

greggirwin

[20:53](#msg604bd4de823b6654d2a05586)We don't have a non-native GUI system yet, correct. The question is how webview will help Red, with applications or adoption. If I'm a web dev, why would I even add Red to the mix? And if I'm a Red dev, I need to learn all the other stuff and grow my app size by 100x. I do appreciate all the research and info. Would be great to put that in a wiki so it's not lost.

The big apps I know of are all based on Electron.

Oldes

[20:55](#msg604bd544120cd84f7810e9fa)Electron is based on Chromium

[21:05](#msg604bd79d5d0bfb4e58a5c99d)@greggirwin The old WebView (IE based) is part of system and one can make a really small app with richer GUI than is the native GUI.

[21:05](#msg604bd7b3823b6654d2a05e06)\[!\[webview.gif](https://files.gitter.im/5565a1d415522ed4b3e10094/bXVu/thumb/webview.gif)](https://files.gitter.im/5565a1d415522ed4b3e10094/bXVu/webview.gif)

[21:07](#msg604bd824823b6654d2a05f3f)It's imho possible to mix native widgets with the WebView... so you could for example have Red console on one side and file editor on the other side.

[21:10](#msg604bd8d4457d6b4a94bfb216)But I must say, that I was not able to compile any WebView2 example on Windows.. so it definitely is not easy.

hiiamboris

[21:25](#msg604bdc5295e23446e42e9a40)&gt; @greggirwin The old WebView (IE based) is part of system and one can make a really small app with richer GUI than is the native GUI.

My educated guess is that the "use the OS-provided browser backend" approach was abandoned by almost everyone 5-10 years ago. Likely reason is the amount of effort to keep the code compatible with all browsers. Which of course is the consequence of modern Browser wars.  
So I should assume PC programs built on top of this crap will weigh 200MB+ (at least those I know of do).  
On Android it's the opposite, there aren't many thin apps that are just wrapped webpages, but those usually are about 2-5MB (like 10x smaller than their native counterparts). However it also looks like Android runs these apps using the default browser rather than Chrome, and you get a risk of incompatibility again, even if it's smaller there. In any case these thin apps do not include the backend (obviously) and if we want a cross platform app, we can't rely on that code ported to Android with no effort.  
No idea about iOS, but since Apple would never let their users configure anything at all, my guess would be that Safari will be running the code. Which is at war with Chromium, so in the long run it will be PITA to port webapps to iOS.

greggirwin

[21:27](#msg604bdcd95d0bfb4e58a5d73d)Good thing we won't need it for creating rich interfaces in the future. :^)

hiiamboris

[21:34](#msg604bde49e5f1d949d495eec9)Indeed ;)

Oldes

[21:39](#msg604bdf9ee8267a46f20e224c)@hiiamboris current browsers compatibility is much more better than 5 or 10 years ago. And not all pages need fancy cutting edge technology. Anyway.. I've not started this discussion... I just used it for a temporary procrastination. We should ask @qonn why he want to use WebView :-)

[21:39](#msg604bdfaba3a2f04f1ff0b75b)Btw.. on iOS is \[WebKit](https://webkit.org/). https://trac.webkit.org/wiki/Applications%20using%20WebKit

[21:45](#msg604be10a457d6b4a94bfc73a)Here is some MS promo: https://blogs.windows.com/msedgedev/2020/10/19/edge-webview2-general-availability/

[21:46](#msg604be13f95e23446e42ea869)@greggirwin as Red is supposed to be a \_full stack\_, you should not be so negative to web dev.

[21:48](#msg604be1afd2619a4f2e3f524f)But true also is, that before getting port support, the web view does not make sense yet.

hiiamboris

[21:59](#msg604be44ae562cf54acb8d546)&gt; current browsers compatibility is much more better than 5 or 10 years ago.

My web surfing experience tells the opposite ;)

Oldes

[22:06](#msg604be5d3e8267a46f20e3615)If you are using IE, than it would not surprise me. The compatibility is much better now when IE is supposed to be dead (although it's still present in Windows core).

hiiamboris

[22:11](#msg604be711823b6654d2a08599)PaleMoon and Vivaldi (yeah, I'm running two browsers in parallel for some years already)

Oldes

[22:13](#msg604be79fd71b6554cd3d8360)Btw... I was searching a little bit more and I can say for sure, that Steam has embedded Chromium browser.. 210MB

[22:13](#msg604be7a0457d6b4a94bfdac3)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/Llnj/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/Llnj/image.png)

[22:15](#msg604be80622a5ce4a91504314)According \[this chat](https://stackoverflow.com/questions/8222571/how-to-have-the-minimum-size-possible-chromium-embedded-framework-dlls) the minimum chromium could be between 30-40MB (at least 2 years ago)

[22:20](#msg604be941d71b6554cd3d8901)I must wonder how many Chrome versions I have on my notebook. It's like a cancer.

hiiamboris

[22:42](#msg604bee47d1aee44e2de1c04b)Indeed.. Why no AV toolkit cleanses the PC from this most harmful software piece? ;)

Oldes

[22:45](#msg604beeee22a5ce4a91505531)Nice... I made a scan and found, that I have 27 `libcef.dll` files (2.3GB total) - and that is just one of \[embedded chromium](https://en.wikipedia.org/wiki/Chromium\_Embedded\_Framework) files.

ALANVF

[22:45](#msg604bef00a3a2f04f1ff0e246)@greggirwin btw webview would theoretically be possible once red.js is stable

greggirwin

[23:33](#msg604bfa47a3a2f04f1ff0fe6b)&gt; as Red is supposed to be a full stack, you should not be so negative to web dev.

I was a little snarky @Oldes, I admit, but a) you didn't answer my questions and b) you're the one who called it a cancer. ;^) Full stack means what we want it to mean. For me that's metal-to-meta. It doesn't mean \*everything\*, even if something is popular.

What is the \*value proposition* for this? Is it better than an in-browser solution like @ALANVF is working on? Ultimately, though, if \*somebody* makes it work, and it can be included by users so it doesn't bloat Red, isn't that enough? If it has to be built into Red, because it's an embedded style of some kind, it will take a deep dev to make it an optional sub-component of View.

Oldes

[23:41](#msg604bfc40e5f1d949d4963cbf)&gt; What is the value proposition for this?

If I can steal from Unreal Engine source code:

```
<Function>Allows for embedded web browser in applications</Function>
  <Justification>We have a need for a web browser within the editor and launcher applications to display documentation pages and to integrate external web pages for marketplace etc. more seamlessly</Justification>
```

But you know that I'm mostly CLI person ;0) I just want to say, that it makes sense to request this feature... and since today I may say, that chromium is probably currently the only cross-platform solution and that is the reason why it is so much used.

[23:43](#msg604bfc9ad1aee44e2de1e447)And of course... I expect it to be a \_future_ module... not a built-in function.

[23:44](#msg604bfcded71b6554cd3dbd3a)It's interesting, that it's present even in Minecraft and GTA5 games. In GTA it's used probably for the in game browser (it has in game internet simulation).

greggirwin

[23:48](#msg604bfdc1e8267a46f20e717d)It looks like Unreal had a very clear and specific need, and added it to support that.

## Saturday 13th March, 2021

pekr

[05:18](#msg604c4b1e823b6654d2a16f32)I don't understand what would be so wrong with having a wrapped web-view container in general. On the big scale, whatever we don't support, will eventually make ppl to consider other solutions. But - that's the life and I understand the focus of the Red team is eventually elsewhere.  
Not sure what would be the WebView good for - to display a documentation? You can run web browser externally for that. To make a browser app, using Red as a "glue"? In the long run, I wish we would get into the browser, but using some web assembly as a target.  
In my opinion, Red GUI, though still might be buggy, got to some point and further than Rebol - HW accelerated, native widget for those who need this, some real life apps (View console, DiaGrammar). I am also for making it further with GOBs eventually, allowing non native GUIs, improving reactivity (Hiiamboris' reactivity related PR) etc.

15926222352

[06:20](#msg604c59c2e562cf54acb9e8dd)@greggirwin Can I buy diagrammar with a red token？

[06:22](#msg604c5a1a44f5a454a472e6ca)\[!\[20210313142150.png](https://files.gitter.im/5565a1d415522ed4b3e10094/fXUS/thumb/20210313142150.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/fXUS/20210313142150.png)

wallysilva

[06:56](#msg604c6224a3a2f04f1ff1e9ba)@guaracy shared \[Beads](http://beadslang.org/the-beads-project) with me which is basically Red for web dev (full stack approach), worth a look.

qonn

[07:24](#msg604c6890457d6b4a94c106ae)@Oldes,

I'm pretty much just looking around, trying to see if I can create a mordern-like UI with Red. Basic box shadow, rounded corners. borders, gradients. It doesn't have to be a webview, although with webview I can then use HTML, CSS, JS to do it easily.

Flutter uses skia library to render the UI. (basic hello world filesize: 20mb++)  
In Rust, there's currently a UI framework called Iced that uses wgpu to render the UI. (basic hello world filesize: 10mb++)  
In Red, the closest I can find If I were to do this is using base and draw everything from scratch.

I really hate electron and whatever related to it because the final file size is too big. (200mb++)

But Red really is interesting, that single executable everything, together with super small executable file. Is really triggering my excitement heheh.

hiiamboris

[08:36](#msg604c7992d2619a4f2e40b72a)You will have that in a few months.

[08:41](#msg604c7aa6a3a2f04f1ff22403)Few meaning 1-2 ;)

pekr

[08:56](#msg604c7e25120cd84f78127a7a)What does "that" mean in your above remark? :-)

hiiamboris

[09:04](#msg604c8003457d6b4a94c13eb4)&gt; to see if I can create a mordern-like UI with Red.

pekr

[09:08](#msg604c8119823b6654d2a1eb8e)Great, thanks, whatever it means! :-)

Oldes

[10:46](#msg604c980ed74bbe49e0ef037d)I think it's good to mention Ultralight project... https://github.com/ultralight-ux/Ultralight

greggirwin

[19:20](#msg604d108822a5ce4a915332e0)@15926222352

&gt; Can I buy diagrammar with a red token？

Not at this time, from the web site. We want to support that eventually. In the meantime, if anyone wants to, we will process those transactions manually and generate keys for you.

[19:24](#msg604d115f823b6654d2a38b6f)@qonn thanks for the info. It will be some time before that's all baked into any non-native UI system we build, but here's a cool experiment done recently by @toomasv: \[shadow lab](https://toomasv.red/images/Misc/shadow2.gif)

[19:30](#msg604d12e2b5131f4f2811da25)Ultralight looks cool, and good info on Edge Webview2. Thanks for those links @Oldes. Please put things in a webview wiki page.

[19:44](#msg604d1622457d6b4a94c2d9f3)As @pekr notes, people want solutions and features. If we don't have them, they may go elsewhere. But we can't include everything and, for us, simplicity is a feature. How do we decide what to include?

```
view [
    base 1000x700 white draw [
    	; This draws a Venn diagram
    	circle 500x250 200
    	circle 350x450 200
    	circle 650x450 200

    	text 430x150 "What is our mission?"
    	text 430x175 "(Fight Software Complexity)"

    	text 200x450 "What is fundamental to software?"
    	text 200x475 "(Data Structures and Algorithms)"

    	text 600x450 "What will change with time?"
    	text 600x475 "(Popular trends. The Wild West.)"
    ]
]
```

[19:53](#msg604d183f22a5ce4a91534852)Everyone here, chime in. We could even make this a voting app very easily. But for now, just post the three elements in a block, like so: `[mission fundamentals trends]` in your own priority order. It doesn't matter if you post regularly or just lurk here, please post. We have over 800 people here, let's see how many respond to this simple questionnaire. You don't even have to run the above to see the diagram.

[19:56](#msg604d190795e23446e431c5d1)Extra Credit: We have a great mix of old timers and new people. For old timers, why are you still around (that is, why do you love Redbol langs)? For newcomers, what made you want to check out Red?

[20:50](#msg604d25b0e562cf54acbc0e04)OK, that code above produces a boring result. How about an interactive Venn diagram instead?

```
circle-blk: [
	; This draws a Venn diagram
	circle 500x250 200
	circle 350x450 200
	circle 650x450 200
]
view [
    base 1000x700 white draw circle-blk

	style goal: text sky center wrap loose font-size 12 on-drag [
		circle-blk/(face/extra): face/offset + (face/size / 2)
	]
		
	at 410x200 goal extra 2 " What is our mission? ^/ (Fight Software Complexity) "
	at 200x450 goal extra 5 " What is fundamental to software? ^/ (Data Structures and Algorithms) "
	at 600x450 goal extra 8 " What will change with time? ^/ (Popular trends; The Wild West) "
]
```

GiuseppeChillemi

[21:53](#msg604d344ba3a2f04f1ff42913)@greggirwin Nice! I have bent it a little with `font-size: 54`, the circle is properly clipped at the border, while the text...

[21:53](#msg604d344ee5f1d949d4994f1d)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/VhJ4/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/VhJ4/image.png)

[21:53](#msg604d345d120cd84f78146918)Do you think we have to report it as a bug?

greggirwin

[22:07](#msg604d37bbe5f1d949d4995817)May be D2D + DPI related, as I get a different rendering result.

[22:07](#msg604d37beb5131f4f28123982)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/dMvU/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/dMvU/image.png)

[22:08](#msg604d37fb44f5a454a47530b8)The Fundamental box is an issue here. I'm happy for others to do some R&amp;D and report details in a ticket.

[22:10](#msg604d3859e8267a46f2119948)Any font size over 12 causes the second line in that face to not display for me.

[22:10](#msg604d386bd71b6554cd40df29)Seems I randomly picked the max value. :^)

gltewalt

[22:46](#msg604d40d0e562cf54acbc5491)Chime in where?

[22:49](#msg604d417ed74bbe49e0f0d682)\[mission fundamentals trends], though some things that appear to be a trend, probably aren't - like GUI moving to the network

gltewalt:matrix.org

[22:51](#msg604d420222a5ce4a9153b30e)the internet

greggirwin

[23:03](#msg604d44b8457d6b4a94c350bd)Just posting a message you did is the chiming in I'm looking for. Keep it easy.

&gt; GUI moving to the network

What does that mean? Like X Windows, HTML+JS in a browser, or something else?

gltewalt:matrix.org

[23:59](#msg604d51e25d0bfb4e58a9a118)Html 5+, css, in some kind of browser

## Sunday 14th March, 2021

adam-acosta

[00:03](#msg604d52bdd2619a4f2e43077f)chiming in. lurker. noob. love redbol. don't use it, love the mission. waiting for red so i can stop doing js, python, powershell.

greggirwin

[00:12](#msg604d5505e8267a46f211dfb6)Thanks @adam-acosta ! Would you post your own priority order for `[mission fundamentals trends]`?

And what are the key things you need in order to use Red for what you do?

15926222352

[00:25](#msg604d5813d71b6554cd412b68)@greggirwin That is great! I hope it can be done by myself on the website.

snotbubble

[00:53](#msg604d5e99823b6654d2a44c80)&gt; Just posting a message you did is the chiming in I'm looking for. Keep it easy.  
English &lt;&gt; Red

greggirwin

[01:46](#msg604d6af05d0bfb4e58a9d7df)Communication is hard. Let me try to clarify.

To "chime in", post a block in single-backticks so it formats as code. In the block, include the three words `[mission fundamentals trends]` \*in order of importance to you\*. Nothing else. If `trends` are most important to you, put that first in the block. If `mission` is least important, put it last. We can learn a lot from this, not the least of which is how many people are willing to take 30 seconds to think about that and post one simple message here.

[01:57](#msg604d6d96d71b6554cd415980)@snotbubble I'm going to ask a question, and please don't think I'm attacking you in any way by asking it. Your comment of `English <> Red` prompts it.

It's true that Red has a stricter syntax than English, like a teacher rapping your knuckles with a ruler for poor grammar or punctuation. But if you look at my code examples above, for the Venn diagrams, can you make sense of them? Is it possible to glean information from them \*without* knowing that they were written as Red code? If so, what are the key points of information you \*do* get from them? Even without executing them in a console, can you picture what the result might be (assuming you know what a Venn diagram is)?

Red isn't natural language, and isn't intended to be. Here's the question we (I) want to answer: is it an effective language for communication? If that's the goal (and it is) what languages do it best and what can we learn from them?

PeterWAWood

[02:08](#msg604d7015e5f1d949d499dceb)

```
[
    fundamentals [consistency completeness robustness reliability platform-uniformity quality testability multi-paradigm mulit-processing]
    trends [new-processors 64-bit upgraded-operating systems specialist-processors [gpu aipu mlpu]]
    mission [{Develop easy-to-use yet powerful multi-platform programming language and tools}]
]
```

greggirwin

[02:08](#msg604d702644f5a454a475adc9)@adam-acosta bravely started us off on the lurker side. :^) We have over 800 people as members in this room. Can we get at least 200 of them to respond?

It's not about details, features, or functionality. It's about what direction to steer the ship.

Nuc1eoN\_gitlab

[02:14](#msg604d7197457d6b4a94c3b5e1)@wallysilva  
&gt; @guaracy shared \[Beads](http://beadslang.org/the-beads-project) with me which is basically Red for web dev (full stack approach), worth a look.

Wow Beads looks really aweswome. timetravel and renaissaince proportions build in... holy sh\*t

[02:15](#msg604d71c422a5ce4a915421b7)Any of those videos blows my mind lol https://www.youtube.com/channel/UCiBO5hr2IVsYK8wiLznImTQ/videos

[02:17](#msg604d7224a3a2f04f1ff4b552)Red and beads should team up :D

wallysilva

[02:17](#msg604d723f22a5ce4a915422bc)`[mission > fundamentals > trends]`  
I love what Red is about. The simpler the better. Also, I don't think Red has to cover every single thing under the sun - it would be impossible to do that without becoming a giant chimera.  
I just wish that Red could just put itself out there with its flaws and everything. 1 year became 11 years and it feels like it will only be released to the world when it's perfect, but I wonder what that means and if it's a realistic goal.  
I remember that the earlier versions of Python were buggy and kinda messy, but because it put itself out there it became a topic for conversations and its community started to grow. Red kinda feels like a private club some times.  
There's a lot of real world tasks that Red is more than ready to tackle already and I think a new stable version would be enough for that.  
\*Please, take all the above with a grain of salt as it's just my opinion.

[02:18](#msg604d726ba3a2f04f1ff4b604)+1 @Nuc1eoN\_gitlab I think the same!

greggirwin

[02:21](#msg604d7314457d6b4a94c3b92e)Thanks @wallysilva and @PeterWAWood !

[02:22](#msg604d734bd71b6554cd416662)@wallysilva how do we put ourselves out there more than we already are?

[02:24](#msg604d73d7457d6b4a94c3bb3e)I mean that as a real question, because it's something we don't know how to do well. Clearly. :^)

[02:28](#msg604d74d85d0bfb4e58a9f07b)As technologists, we we think \*are* "released to the world" because we're out here on the internet, where anyone can get it. But we're really bad at playing the popularity game. Paul Graham once noted that popularity is a full time job.

snotbubble

[02:38](#msg604d772e95e23446e432adf2)@greggirwin I meant your comment `Just posting a message you did is the chiming in I'm looking for. Keep it easy` read like a Red statement; had to read it a few times to understand what you meant.

Nuc1eoN\_gitlab

[02:58](#msg604d7bde44f5a454a475c76b)Well personally I just think the documentation needs to be better. The lack of documentation makes it feel more like a feature preview than a product.

[02:59](#msg604d7c00120cd84f78150df8)Rust probably gained popularity so fast because its documentation is excellent

[02:59](#msg604d7c2e823b6654d2a48c73)Something akin to a "Red-book" would probably help grapsing the concepts of red

[03:00](#msg604d7c4022a5ce4a915438dc)Becasue frankly I think most people look at it, and have no idea what it is about

[03:02](#msg604d7cb8d2619a4f2e43675d)And well, the website is basically just a blog, so it does not really scream "Im ready to be used" to the people

greggirwin

[03:02](#msg604d7cbbd71b6554cd417c95)@Nuc1eoN\_gitlab we still point people to the very old Rebol Core guide, as the seminal reference. We have wanted to write our own User Guide as one of the four docs pillars, but it's a big task and will take one of the core team a block of dedicated time. We've evaluated a lot of other lang docs.

[03:03](#msg604d7d0e457d6b4a94c3d147)The new web site has also been on our list to get to a point of making it the primary point of contact. It's there, but not in a state where we think it represents everything well. Lots of content needs cleaning up.

[03:04](#msg604d7d2e22a5ce4a91543ad0)You can see the beta \[here](https://beta.red-lang.org/)

[03:05](#msg604d7d73823b6654d2a48ed7)We're looking for a web dev, who can also branch out to more Red work.

Nuc1eoN\_gitlab

[03:10](#msg604d7eb35d0bfb4e58aa0807)Maybe start the Documentation by making a "wireframe", so basically collection and ordering all the needed chapters of red to get an overview.  
For example use a software similar to https://doc.rust-lang.org/stable/book/ or https://docc-theme.netlify.app/docs/ and put in the chapters/structure, then work on the chapters incrementally with most parts being TBD at first. If the documentation code is hosted on a repo then the community can chime in and help. There seem to be enough ppl around that would help here and there, but you would need to make the base.

This is just my idea.

[03:12](#msg604d7f3be5f1d949d49a01b9)(Personally I find documentation based on the github wiki or whatever very diffuclt to parse or search, which is why I would recommend a dedicated frontend for the docs)

wallysilva

[03:13](#msg604d7f62e562cf54acbce6a8)@greggirwin First of all, I would like to note that it's very easy for outsiders to say this and that about projects which they are not directly involved in nor know the ins and outs of it. So, I would take my own words with a grain of salt. Also, I'm no community expert.

That said, I think the first contact that a lot of people have with Red is through its website (arriving from Google searches or articles around the Internet). The thing is, the first instinct for a newcomer is to try the stable version which is very outdated (released in December 7, 2018). That means that somethings don't work as expected, others are broken and even some code samples/examples don't work properly due to compatibility issues. That can be frustrating and leaves a bad first impression and may have become a gatekeeper preventing many curious people to make their way to this chat room for instance.

Beyond that, I think that the Red team should actively seek opportunities to team up with other interesting projects out there (both new and well established ones) and open up some more to interact with other communities. Also, some side projects like a Red project to teach coding could be a powerful way to spread the word (many people came to Python because it was the "easy language to learn how to code"). Those are just off the top of my head, so I'm sure that there are many more other ways to achieve that.  
On a side note, I just would like to tell you how much I admire your patience and diplomacy dealing with all sorts of opinions. Kudos!

greggirwin

[03:15](#msg604d7fe495e23446e432c0cb)We have a number of outlines already, so we agree there. The tricky part, and this applies to Red as well as its docs, is maintaining quality and coherence while encouraging contributions. Having authored and edited (paper) books in the past, co-authors have different styles, and maintaining a consistent narrative voice is challenging. I often push to start with something we can clean up later, but that misses as often as it hits. Getting info into the wiki or later reference is the best balance I've found so far. Wikis are clearly what they are, but getting things written down at all is often the hard part, and they have a lot barrier to entry.

Nuc1eoN\_gitlab

[03:16](#msg604d7ff344f5a454a475cfdd)@greggirwin Oh and btw thank you for the website beta link! As a frontend designer I really it, I am pleasantly surprised :))

greggirwin

[03:19](#msg604d80bee8267a46f2124375)Thanks for all the input @wallysilva and @Nuc1eoN\_gitlab. I'm still learning patience, and I nearly failed Diplomacy.

I keep using a cattle prod on @dockimbel about getting that change made for stable and monthly releases, but he's tough. Keeps going on about how important finishing I/O is or some nonsense. ;^) Soon. :tm:

Nuc1eoN\_gitlab

[03:20](#msg604d80f55d0bfb4e58aa0dd9)&gt; We have a number of outlines already, so we agree there. The tricky part, and this applies to Red as well as its docs, is maintaining quality and coherence while encouraging contributions. Having authored and edited (paper) books in the past, co-authors have different styles, and maintaining a consistent narrative voice is challenging. I often push to start with something we can clean up later, but that misses as often as it hits. Getting info into the wiki or later reference is the best balance I've found so far. Wikis are clearly what they are, but getting things written down at all is often the hard part, and they have a lot barrier to entry.

I absolutely hear your point. This project is your vision and this is why I think it always needs to follow your quality criteria and ideology in the end.  
Maybe something like a dedicated "Community" help section / Community docs would help. So that it would clearly state is is unofficial, but still at a single place and following a certain structure. Just coming up with some ideas.

greggirwin

[03:20](#msg604d811bd2619a4f2e437290)That's sort of what red-by-example is, for function references anyway.

Nuc1eoN\_gitlab

[03:23](#msg604d8199e8267a46f21245d0)Seems like you need to find the right balance between receiving help from the community while maintaining your vision of the project. At least that how it appears to me?

greggirwin

[03:23](#msg604d81b1e562cf54acbcec65)And @loziniak has risen to the challenge of getting an Exercism channel going for Red. If anyone wants to be his lieutenant, I'm sure he'd appreciate having a second. I think that's a great way to help people get a taste of Red.

[03:24](#msg604d81eed2619a4f2e437489)That's exactly what it is, which it turns out is not easy.

wallysilva

[03:27](#msg604d82a4e562cf54acbceebd)+1 @loziniak I can't wait to try your Exercism tracks!

greggirwin

[03:29](#msg604d831dd2619a4f2e437763)Red attracts some \*really* smart people (have you met our team?). They say managing programmers is like herding cats. With Reducers, it's more like being a lion tamer. Without respect, affection, and lots of coffee to stay alert, they will eat you. :^)

wallysilva

[03:30](#msg604d8364e8267a46f21249c1)LOL  
I can see how that's true!

Nuc1eoN\_gitlab

[04:28](#msg604d90e6e562cf54acbd0d61)My advice is, try to attract some more linux people to give red a go. Linux severely lacks a consize GUI concept, where Windows does not really suffer from this problem.  
Maybe I am making things up, but I think especially in the linux/open source GUI landscape Red might enable new concepts to design graphical user interfaces.  
Still when I look at most of the examples, it seems to be centered around windows gui. This might throw some linux users off (maybe giving the impression that there is a lack of tooling or support).  
Please tell me if I am totally wrong, I am fairly new here and this is my first impression :)  
But think the linux (gui) sphere could tap into a lot of potential that red has to offer.  
E.g. take AwesomeWm which a window manager thats controlled by Lua. It seems to have a great adoption in the linux/bsd community. Those projects mostly go viral for a reason.  
A window manager/desktop written in red might find a lot of resonance.

gltewalt

[04:30](#msg604d9154e562cf54acbd0e34)For as much as i read of it, Rust Book is some of the best doc st, but the old Rebol guide isn

[04:30](#msg604d916f22a5ce4a91546587)Gah... phone. Rebol guide isnt far behind

snotbubble

[04:33](#msg604d923422a5ce4a9154672e)@gltewalt also Nick Antonaccio's \[Learn Rebol](http://www.re-bol.com/rebol.html) site is a goldmine

gltewalt

[04:35](#msg604d9294e5f1d949d49a31ca)Yes. Ive often wondered why he isnt around.

greggirwin

[05:09](#msg604d9a8622a5ce4a91547c86)@Nuc1eoN\_gitlab if we knew why some things succeed, we would do that. :^) Unfortunately there is no answer to how you succeed as a proglang. I'd be soooo happy to be wrong about this. So what we have to do is make our best guesses about what will help, work on what we're good at, and keep plugging away until something catches fire (in a good way). And the community has to play a role. If not for @rcqls, we wouldn't have GTK. @bitbegin and @qtxie picked it up and carried it forward, and it would be done without them, but someone championed something they wanted, we saw value in it, and now we have it.

Nix v Windows is tough. Nix is great for server side use, giving things away, and getting street cred with devs. But there's no business market there. Zero, zilch, zip, nada. Again, boy would I love to be wrong.

And when we talk about popularity (I love being the bad guy here, not to you but to our target and goals), Rust (as an example) has been around for a decade, backed by Mozilla, and how does it compare with, say, PHP or VB in terms of popularity? Well, it sits between COBOL and Ada. This is not intended as an insult. Spread the gap wider and it's between Fortran and Logo. Elixir seemed hot for a bit, and it runs neck and neck with RPG. Do modern devs even know what RPG is? Have they ever met a green-screener?

Look at the top langs. Note the interesting mix of high and low level langs. One of my views on this is that the OS really shouldn't matter. We can say with some confidence that Windows apps needs GUIs much more than Linux apps do, in order to be successful. Most Linux deployments run on servers, by a vaaaaasssssst margin. So if we want Linux users, we should reduce pain on that side. GUIs might be nice icing, but you need a cake to put it on first. But do you know where you \*must* have a GUI? Phones. How many phones are there versus Linux desktop installs? That's where we need to focus our next GUI efforts. Android.

We also need to ask why "old" langs haven't died off. Porting is hard, expensive, and risky. While I don't want to add functions to core Red just to please devs from other langs (e.g. I've never been a fan of `unless`), I \*really* want to make dialects and libs that make it easier for them to try Red, apply it where they can, and ease their pain. For that we need experts in other langs. All volunteers are welcome, just tell me what lang you know, be our (compensated) expert and how we can make Red useful to your tribe. :^)

Ultimately we need to view Red like a consumer product if we want people to use it. At the same time, if we focus \*primarily* on that view, it may have shine without substance. We don't want that, because we want Red to endure.

Nuc1eoN\_gitlab

[05:48](#msg604da3bad71b6554cd41d229)@greggirwin thank you for the great perspective on your view!  
I understand that linux has no "business" market, I also understand that Rust or Elixir have not that many users. But what they do have is hype and community recognition. What that brings them is that they reached a critical mass. They have recognition by the community. I understand Red doesnt want to be "the new linux open source project", but the red project could certainly use a "shill" to the open source ecosystem; simply to gain a certain initial and valuable userbase. "Cool open source projects" are good marketing material, they get featured in articles, by crap youtubers and shared on reddit. And thus red could gain community recognition.  
That initial "hype" will certainly enable you to reach some other goals you have in mind for red...  
That doesnt mean write those open source tools. Rather I would shill it to the Linux community, so that people get motivated to start such work themselves. Maybe put out a blog about a cool linux helper tool in red, and how it is superior to anything before. This stuff headlines well on reddit.  
Please just take this as my thoughts, unfiltered. Just so you get my perspective.

pekr

[06:09](#msg604da89b22a5ce4a91549bc7)We never know, what gets us boosted. Ruby got popular because of Rails, not the language itself. So who knows - looking into really cool GTK screenshot, some Linux users might get excited, especially in a situation, where there are not muny other GUIs like that - https://twitter.com/i/status/1296920676104908800

snotbubble

[06:26](#msg604dac9ed71b6554cd41e67e)@pekr Totally agree. The clock and spreadsheet gifs should be on the front page of the Red website. Try doing those with QT...

nuc1eon:matrix.org

[06:35](#msg604daeab823b6654d2a4ff10)@pekr that looks super cool! Thanks for making me aware!

pekr

[06:38](#msg604daf60a3a2f04f1ff54689)You see, what might be enough? :-) I'll get some notes about Red and it's potential from a bit different perspective shortly ...

[06:48](#msg604db1ce5d0bfb4e58aa7d14)Carl once asked me, why ppl did not switch to R3, as he regarded it being superior to to R2, along with many language and infrastructure advancements. And I provided him with a bit different perspective - R3 has missed on all networking protocols but http, if I remember correctly. Its native Windows console was an awful experience, compared to R2. There was no single database connector and GUI styleset was not complete either. `Call` function, important to basic OS interfacing, was not complete either. It also missed DLL interfacing, pushing ppl not fluent with C into a plug-in dead-end.

For a real life scenarios, ppl need some featureset being available, not just cool under the hood concepts. Red fixed most of those things, being it `call`, View console, R/S and its targets and interfacing, compilation, decent GUI along with D2D, the land, Rebol never even touched remotely. So what is next enabler in my opinion? Please let me say it again - in my opinion. IO ports. Wouldn't ppl love to have all those protocols as an interfacing enablers? https://trello.com/c/BW1SPeOU/48-i-o-support . Being able to load libraries dynamically might help few bits too. The good thing is, that it is long time planned and hopefully comes at some point in time.

[07:18](#msg604db8cb95e23446e43342ae)But I have even different perspective, noone mentioned yet - marketing &amp; building the community ecosystem. I don't want to sound like a self acclaimed community coordinator, but working 4 years for Amiga Review and co-running Czech Amiga news, I know how to post news. Or I think so.

So let me just ask - how is that even possible, that Diagrammar as a big achievement, was not posted to Twitter? How is that Red FB page is frozen in 2018 with ICO related stuff? I try to at least post to FB group. Also @Oldes mentioned it some time ago - we miss our guru here, for quite some time already. Is that a year maybe? Latest blog post? 08/2020.

I would not dare to post a blog article myself, as those are of a high standard. But I could probably get FB page going, freeing a FB group for user purposes. Such initiative should be though aligned with some Roadmap point - new web page, new release, monthly releases and all such stuff.

[07:19](#msg604db918e5f1d949d49a8a0f)We might have 800 ppl here, but most of them probably in a lurk mode. I can see it on the FB group - posting something interesting, might get ppl engaged again. You see - one posted screenshot above did it.

snotbubble

[09:22](#msg604dd5dd120cd84f7815e455)Interesting insight into R3 vs R2.  
Like most things, Red needs to be trusted to earn patronage, to be trusted it should be reliably, consistently useful. That means seriously addressing the wishlists of people who are busy using Red for practical commissioned work, even if the requests seem 'incorrect' (like 64-bit or FTP). Some unreasonable requests may come from clients of Red users, who have zero interest in technical reasons why they shouldn't have what they asked for... and who will shop-around.

I'd also suggest lowering the barrier-to-entry to Red by making it more forgiving to new users, especially easing up on the hard boundary between dialects and allowing instanced variables anywhere (two-way relations without react).

15926222352

[09:29](#msg604dd763e5f1d949d49ad9ef)\[!\[20210314172720.png](https://files.gitter.im/5565a1d415522ed4b3e10094/r9NZ/thumb/20210314172720.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/r9NZ/20210314172720.png)

[09:29](#msg604dd76695e23446e4339142)@greggirwin Test whether the time and date of this place on the website are written wrongly? When will C3 be launched in 2020?

pekr

[09:37](#msg604dd96ba3a2f04f1ff5b2d7)As for the website, I generally like boxed, crispy designs. Those rounded corners, and especially the scattered font type, does not look pleasant to me. If I should change just one thing about the website, it would be the font type ...

15926222352

[09:39](#msg604dd9c1d1aee44e2de68d67)@pekr :)

hiiamboris

[09:43](#msg604ddabb120cd84f7815efb6)I am likely biased but I think my OS theme (all of a sudden) fits the site better than the original grey/black:  
!\[](https://i.gyazo.com/5c6274058a09e1868ddf4fc7de344f29.png)

Oldes

[09:43](#msg604ddac0e8267a46f213188a)To be really honest.. the web looks terrible and not ready for year 2021.

hiiamboris

[09:45](#msg604ddb3ea3a2f04f1ff5b639)@Oldes what do you mean?

Oldes

[09:45](#msg604ddb40e5f1d949d49ae53b)There shoud be colorized code samples and screenshots and not some sort of wonder woman with shanghai behind.

pekr

[09:45](#msg604ddb575d0bfb4e58aae305)@Oldes I think the same, but as I was called being a troll, I don't want to be unnecessarily negative :-(

snotbubble

[09:46](#msg604ddb7822a5ce4a91551c90)also: fighting software complexity, in heels &amp; cape

Oldes

[09:46](#msg604ddb81a3a2f04f1ff5b6cd)Maybe I'm biased.. but I see just a badly customuzed template.

pekr

[09:46](#msg604ddb895d0bfb4e58aae380)@hiiamboris just look at million of Wordpress designs out there, choose some, and the impression is going to be much better imo.

15926222352

[09:48](#msg604ddbe95d0bfb4e58aae465)@Oldes To tell you the truth, although the test network still has many places not perfect, but it seems that the overall effect is much better than the original main website

[09:49](#msg604ddc19d2619a4f2e444243)Hope to get better and better, let more and more people know the red language

Oldes

[09:49](#msg604ddc215d0bfb4e58aae53b)There is no main web page.. there is just an old blog.

15926222352

[09:49](#msg604ddc29457d6b4a94c4b528)@Oldes :)

Oldes

[09:50](#msg604ddc6ed71b6554cd425843)But I understand very well.. that the main focus is elsewhere.

15926222352

[09:50](#msg604ddc7622a5ce4a91551f16)@Oldes Your suggestion is very direct, but it will be very effective.

mikeparr

[10:18](#msg604de3105d0bfb4e58aaf74a)Some comments about the docs etc, raised by @nuc1eon. The current first contact is a blog site, not updated for 6 months. These is a language summary page, but it is in 'about', i.e not the first page we see. However, good to see that changes are coming - thanks @greggirwin for the beta version. The top image is rather lurid, not appealing to me personally, and the longer lines of the code example are only half-visible on my screen. I know it is a work-in-progress though.

Oldes

[10:35](#msg604de6dde8267a46f2133755)@greggirwin for me the order could be: `[fundamentals > trends > mission]`

pekr

[10:39](#msg604de7e8d1aee44e2de6b165)+1

Oldes

[10:39](#msg604de7eb457d6b4a94c4d2c3)Regarding documentation... I personally see a problem lack of comments inside code itself (especially in the Red/System files). Imho.. good and maintainable frontend documentation should be generated from sources (at least its core). That is what Carl was using for Rebol.

hiiamboris

[10:40](#msg604de818120cd84f7816128e)My impression doesn't seem to match the others :) Then all the more reason to outline it.

First, that "wonder woman" is the mascot I gather. Though I agree that those fancy pictures align with the capitalist trend of prioritizing appearances (which I clearly don't like) rather than displaying the substance. Still, I think that it may work well in the long run.

At the core of every project is the dream. This dream is the center around which the community and it's culture revolves. By imprinting a certain aesthetic marker into people's neural networks, we can both help people connect with this dream, and improve visual recognition (e.g. you see the colors match on some tiny banner - you immediately guess the technology this project is built upon).

Whether or not the chosen mascot and the background theme aligns best with the vision of internet of open, simple, and powerful software that we, the people, are in control of - that I cannot tell. But it sure feels Rebollious, and whatever is going to be chosen, some will like it, some won't - it's a matter of tastes, but eventually people will get used to that symbol. I must say though - amazing art. @greggirwin may I ask who made the illustrations?

As to the balance of visual vs text info, tastes also vary greatly between people, because some minds are better at recognizing code samples, while other minds will panic at the sight of that. So there can be no one-size-fits-all answer here.

TBH I can't stand most of the modern sites. They prioritize appearances so much that there's no substance in them at all. It is common nowadays to see a site full of abstract images and mottos, and yet the only question I bear in mind when visiting such a site: "what the hell is this and how it may be useful \*to me\*?" is left unasnwered. Often I have to scroll all the way down the page thru all the marketing BS, to find a site map which will provide me with at least some hints on what this is all about. I'm glad Red beta site is not like that: every illustration is accompanied by good enough text that makes a point, and my question is answered without ever scrolling down a bit. That itself is an accomplishment.

However down the about page, what I see is this mess:  
!\[](https://i.gyazo.com/dfdc65ead644b6602de59f23eae269a4.png)

In this matrix at least half of the statements are empty of meaning or at least will appear so to the eye of an outsider. I vote to exclude this section or make so clear that it will not look like nonsensical boasting.

Still, it's a shame that this site has been in a hidden state since 2019 and still is.

pekr

[10:40](#msg604de835e5f1d949d49b07c9)@Oldes Yes, but wasn't R/S supposed to be replaced once Red reaches 1.0, enabling modular compilation, and such? It was maybe meant as a throw-away code, to get us there (to 1.0).

Oldes

[10:41](#msg604de85e5d0bfb4e58ab0401)And the frontend documentation should be core of the main web page... not some marketing mumbo-jumbo with images for teenagers.

[10:49](#msg604dea39e8267a46f2134207)@pekr I guess that the code written in Rebol is supposed to be replaced.. I'm not sure how much Red/System is supposed to be changed after 1.0. I just believe, that good documentation system is based on documentation inside the code itself... so when you change the code, the documentation is updated as well.

[10:51](#msg604dea94d1aee44e2de6b84c)But again.. I understand, that current focus is make the job done asap... but still having some one-line comments here and there is better than having nothing.

[10:55](#msg604deba1823b6654d2a59ca5)If you take a look on some of my old Red bindings... you can see, that there are comments, like in \[SQLite binding](https://github.com/red/code/blob/master/Library/SQLite/SQLite3.reds) and that is because the bindings were generated from sources, where the documentation was structurally presented.

[11:02](#msg604ded38e5f1d949d49b15a1)I think that @giesse was good in making documentation right from sources.. like in his \[Power Mezz](https://web.archive.org/web/20140330055322/http://www.rebol.it/power-mezz/)

[11:04](#msg604dedd4d2619a4f2e4470fc)(at least I think that he was making the documentation using the source files.. I may be wrong)

[11:06](#msg604dee415d0bfb4e58ab14e5)Anyway... his (now only archived, 10 years old) Power Mezz web page is example, how I imagine nice looking \_technical_ frontend.

[11:24](#msg604df25ad71b6554cd429244)Hm.. it looks that Gabrielle was not writing a Rebol code directly for his Power Mezz, but used his own dialect and documentation web was generated with the source files from it. https://github.com/giesse/rebol-power-mezz/

[11:27](#msg604df32d120cd84f78162fcf)(I would personally avoiding this way.. and instead was using regular comments in normally executable code)

hiiamboris

[11:49](#msg604df8305d0bfb4e58ab2f5c)Most of Gabriele's documentation is just code formatted as a web page :D

dsunanda

[14:19](#msg604e1b7dd1aee44e2de74750)Gabriele was inspired by Literate Programming - an approach in which you write a human-readable narrative that explains what the program does. And ALL the code is in the narrative....but in the logical place for the narrative, not in the lexical order of the code (eg all necessary start-up initialization might be in a technical appendix as it is not the first thing most people need to read to understand the core of the program).  
http://www.literateprogramming.com/

hiiamboris

[14:31](#msg604e1e58d71b6554cd43138e)Thought so ;)

greggirwin

[18:47](#msg604e5a2fd2619a4f2e45b299)Thanks for the input all. I won't respond to specific messages because it may come off as defensive, or offensive.

@hiiamboris we collaborated with an artist named Buck Down who Lucinda connected us with.

[18:55](#msg604e5c1c120cd84f78176fce)I will ask, @mikeparr, what do you find lurid about the image? There was an early draft image I vetoed, which I felt could be misinterpreted, but thought we had found a good set. The hero is modified stock art, so we had limited choices there to work from.

[19:04](#msg604e5e3e457d6b4a94c62def)@pekr can you point me to the FB page that is frozen at 2018? I'm happy to have you manage that, and greatly appreciate you keeping the other one updated. This is the one I know about: https://www.facebook.com/groups/redlanguage Seems they changed the UI, so I'm lost there...again.

[19:05](#msg604e5e78e5f1d949d49c6098)Oh, wait, I found https://www.facebook.com/Redprogramminglanguage. I thought the search link pointed to the other page.

pekr

[19:10](#msg604e5f8944f5a454a47831b3)Yes, that is the one. It was the time of the Red ICO, Lucinda joining the team. She even took over the Group, but changed only the cover image IIRC. If I would be allowed to manage both, I need some advice here. Will explain shortly - we don't allow users to post to the group, without the moderation. And there are two kind of users - the ones who wrote to me privately, that if there is more than one post a day, they will leave the group, and the ones that complained to me, that we don't openly allow to post.

It could be done as other companies do it - the Page is treated as an official news feed (as we do with the Group now), whereas the Group is open to the users. But then it opens secondary channel to Gitter, and I am not sure I have enough time to provide a tech support there.

greggirwin

[19:21](#msg604e621cd2619a4f2e45c62d)I wish I had good answers. Every new channel is overhead, and having someone who knows how to work each service effectively.

[19:47](#msg604e683422a5ce4a9156bded)We've had some chat that buried the recent survey request. Chat scrolls.

:point\_up: \[start here](https://gitter.im/red/red?at=604d1622457d6b4a94c2d9f3)  
:point\_up: \[instuctions](https://gitter.im/red/red?at=604d6af05d0bfb4e58a9d7df)

Please, everyone, take a minute to post.

mikeparr

[20:34](#msg604e7362e5f1d949d49c9eef)@greggirwin , re my 'lurid' description of the image. Maybe the word is a bit strong, but the style (intended, I'm sure) is pulp SF, not sure if it fits. Just my opinion.

Red-Beginner

[20:47](#msg604e767ba3a2f04f1ff77ec4)Order of importance to me  
`[mission fundamentals trends]`  
Is this enough? @greggirwin

greggirwin

[21:05](#msg604e7a995d0bfb4e58acb1c6)@Red-Beginner yes, thanks!

toomasv

[21:06](#msg604e7abc22a5ce4a9156f284)\[!\[mission-tech-trends.png](https://files.gitter.im/5565a1d415522ed4b3e10094/5MnS/thumb/mission-tech-trends.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/5MnS/mission-tech-trends.png)

greggirwin

[21:06](#msg604e7aeb44f5a454a4787d26)LOL! That's what happens when @toomasv types `[mission fundamentals trends]` into his experimental DG build. :^)

toomasv

[21:07](#msg604e7b2544f5a454a4787e04):)

Boum69

[21:11](#msg604e7c08457d6b4a94c6838c)Hi @greggirwin I send you my vote : \[trends fondamentals mission].

greggirwin

[21:12](#msg604e7c27d74bbe49e0f417c3)Thanks @Boum69 !

Boum69

[21:19](#msg604e7dd4e5f1d949d49cb9be)In order to introduce myself. I'm a french military who use rebol since many years. Also it helps me to generate documents for dangerous good transportation. I made other applications: one to manage personnaltm data from my colleagues, an other one to manage storages. I use Red  
also. I made a simple wall breaker game. I support Red and hope it will be soon available for Android. And of course I bought Diagrammar in order to support your work.

greggirwin

[21:19](#msg604e7dff44f5a454a4788572)Thanks @mikeparr. I approved the design, and hope it's somewhere between pulp and the modern Marvel movies. I know what my take on it is, and what I hope it may communicate, but only time will tell what others think.

[21:20](#msg604e7e22e5f1d949d49cba88)Thanks for the info @Boum69, and for your support!

Boum69

[21:23](#msg604e7edf823b6654d2a7506d)Your welcome @greggirwin 👍.I know that you made a huge amount of work for the community, it's really impressive! Very glad to read about you. I m proud to be one of you and hope all the best for all of you.

greggirwin

[21:24](#msg604e7ef2120cd84f7817d0c0)We're all in this together. :^)

gltewalt

[22:20](#msg604e8c4044f5a454a478adcc)&gt; You can see the beta \[here](https://beta.red-lang.org/)

Example 1 - give us line breaks.

[22:24](#msg604e8d38d74bbe49e0f44a16)

```
; Say Hello
print "Hello World!"

; Refer to values
a: 1 b: 2
x: a + b

; Define functions
times-2: func [n [number!]][n * 2]

; Show results in the Red console
print ["The answer is" times-2 x]

; Read URLs
str: read https://www.red-lang.org/

; Load JSON
res: load https://jsonplaceholder.typicode.com/todos/1

; Or CSV
url: https://raw.githubusercontent.com/GSA/data/master/dotgov-domains/current-full.csv
res: load/as url 'csv

; Get help in the REPL
help
```

greggirwin

[22:43](#msg604e917fe5f1d949d49cf5d1)What do you mean @gltewalt ?

[22:47](#msg604e9278120cd84f78180c7e)Ah, blank lines?

gltewalt

[23:23](#msg604e9addd1aee44e2de8bf79)Yep

## Monday 15th March, 2021

Nuc1eoN\_gitlab

[02:53](#msg604ecc10d2619a4f2e46e1cf)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/hFzc/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/hFzc/image.png)

[02:53](#msg604ecc17b5131f4f2816621c)@hiiamboris The matrix is only broken on your end, on my end it looks very nice

gltewalt

[03:19](#msg604ed24bd2619a4f2e46f47c)The graphics with the person reminds me of the esurance animation/graphics

[03:19](#msg604ed24ee5f1d949d49da13e)https://youtu.be/WEpoCDLWGHc

greggirwin

[03:27](#msg604ed431823b6654d2a8376d)Indeed @gltewalt.

Thanks @Nuc1eoN\_gitlab it's fine here as well. But I'd like to reduce the number of items in the matrix.

GalenIvanov

[08:20](#msg604f18d195e23446e437159b)For me it's  
\[mission fundamentals trends]

greggirwin

[08:30](#msg604f1b0a95e23446e4371b7a)Thanks!

GalenIvanov

[08:33](#msg604f1bf1d74bbe49e0f5b91f)I've always been amused how little of the code actually does the important job and the most part is boilerplate (at least with the popular mainstream languages)

[08:35](#msg604f1c6444f5a454a47a2bfa)I'm patiently waiting for precise timers (for smooth animations) as well as audio support - for game development. :)

15926222352

[09:15](#msg604f25cfa3a2f04f1ff9504c)@GalenIvanov I'm waiting, too :)

GalenIvanov

[09:44](#msg604f2c63a3a2f04f1ff962ba):+1:

hiiamboris

[09:46](#msg604f2ce4b5131f4f28176736)@Nuc1eoN\_gitlab never said it's broken. Just that some items make little sense.

[09:47](#msg604f2d45e8267a46f216c7f8)@GalenIvanov current timers are 60 fps. Smooth enough for even a 3D shooter.

pekr

[09:57](#msg604f2f84b5131f4f28176f4b)Does fps really equals to smooth? I do remember reading about vertical sync periods, double and tripple buffering, to prevent tearing, etc. :-)

hiiamboris

[10:03](#msg604f30dfe562cf54acc15cbc)No tearing since W8, because of hardware window composition, and automatic vsync.

GalenIvanov

[10:24](#msg604f35f3d2619a4f2e47ff5b)@hiiamboris Thank you for your info! I need to try double buffering then, as @pekr has indicated.

hiiamboris

[10:36](#msg604f38aaa3a2f04f1ff984ec)Try timing your timer. When it skips a frame, double the animation.

pekr

[11:40](#msg604f47a05d0bfb4e58aece1c)Double the animation? Can you do that without your backend supporting it in the low level somehow?

[11:41](#msg604f47f0d74bbe49e0f63842)I meant terms like this - https://en.wikipedia.org/wiki/Screen\_tearing

Oldes

[11:49](#msg604f49ded74bbe49e0f63def)@hiiamboris as Red is using `SetTimer` function, it's not producing stable rate... when I count it for 60fps, I can see it jumping between 0.016 (which is correct) and 0.032.

```
b: copy [] t: now/time/precise
view [
	base 300x300 rate 60 on-time [
		nt: now/time/precise
		append b nt - t
		t: nt
		if 50 = length? b [
			unview none
			new-line/all b true
			probe b
		]
	]
]
```

hiiamboris

[11:59](#msg604f4c0644f5a454a47ab28a)I know. That's why I propose timing it.

[11:59](#msg604f4c2a120cd84f7819f239)Also choose the FPS carefully. https://github.com/red/REP/issues/26

[12:00](#msg604f4c475d0bfb4e58aeddaf)rate=65-100 will give you 15ms most of the time, with occasional 30ms delays.

xqlab

[12:09](#msg604f4e7d120cd84f7819fc27)

```
[
[ fundamentals 
 trends
 mission
 ]
```

pekr

[13:35](#msg604f62995d0bfb4e58af2342)\[fundamentals trends mission]

greggirwin

[17:01](#msg604f92e9b5131f4f2818a7d1)Thanks! 11 responses so far. Keep 'em coming.

Nuc1eoN\_gitlab

[17:07](#msg604f945bb5131f4f2818ad98)@pekr The only reason why screen tearing is happening, is when the 60fps of the game are out of sync with the 60hz of the monitor. That casues tearing. There are technologies like Adaptive Sync now, which fix the problem.

[17:10](#msg604f9511b5131f4f2818b019)Also I dont know why people are so overly critical about the website. In my opinion it looks great. And I am a web designer. Being unconventional or different does not make design bad. In the contrary, nowadays every webpage looks the same.

[17:12](#msg604f958344f5a454a47ba89f)The only thing I dont like about the describtion texts, and I already mentioned this point, is that it targets windows users. This will throw off any potential linux or mac user immediatly. By that I mean the words like "EXE" which only exists on Windows. Instead I would simply use the term executable. Which frankly is also the more correct term.

greggirwin

[17:14](#msg604f9612b5131f4f2818b42e)For Docs, @x8x created \[this](https://w.red-lang.org/en/) approach.

Nuc1eoN\_gitlab

[17:34](#msg604f9abce562cf54acc29bf6)&gt; For Docs, @x8x created \[this](https://w.red-lang.org/en/) approach.

It looks beautifuly crafted. How is the content managed, or how would one edit a page for example?

hiiamboris

[17:38](#msg604f9b92e8267a46f21824ba)it's official docs, so thru PRs only

[17:39](#msg604f9be1d2619a4f2e493eec)&gt; words like "EXE" which only exists on Windows

yeah.. I also noticed the word "DOS" there in place of command prompt or shell ;)

greggirwin

[17:40](#msg604f9c0dd1aee44e2deb9c8f)@x8x does great work.

[17:40](#msg604f9c2a457d6b4a94c9cb9a)Good thoughts on `exe`.

[17:43](#msg604f9cd55d0bfb4e58afed11)Things I'd like to see on his docs are the ability to collapse the second level in the nav area, and a light theme. If you scroll wheel in the nav pane, and it's at the bottom of the nav list already, the content scrolls. That can also be addressed. Other thoughts are welcome, and whether you think this should be our main docs page.

hiiamboris

[17:46](#msg604f9d905d0bfb4e58afef53)I also asked him to expand the 4rd level (of only the selected 2nd level), so it will be accessible on the left, not just by scrolling. Otherwise it's annoying when you want to jump to some draw keyword, but have to use ^F to get to it.

[17:48](#msg604f9ddf823b6654d2aa8e15)+1 for being the main docs, I'm using it all the time

greggirwin

[17:50](#msg604f9e6395e23446e438b51b)Good point on keywords. This is where adding "curation" notes could make auto-docs even smarter, but if you have control over the sub-lists showing it's only bad if you have a huge number of items in it. That's where a second list to the right of the tree would be good.

hiiamboris

[17:53](#msg604f9f12d74bbe49e0f75844)Maybe even as a popup list.

greggirwin

[18:12](#msg604fa37b823b6654d2aaa26e)@x8x, is the code out where others can help contribute? What are your thoughts?

GiuseppeChillemi

[21:25](#msg604fd0cb95e23446e4395fbe)We had VSync on Amiga using copper timings in 1985, it's incredible the world still struggles with VSync problems.

## Tuesday 16th March, 2021

nuc1eon:matrix.org

[00:41](#msg604ffecfd71b6554cd48a2f0)Well adaptive sync already fixed the problem...

[00:50](#msg605000d244f5a454a47cfde5)As soon as you have a framebuffer you are prone to synching problems.

pekr

[05:13](#msg60503e90b5131f4f281ab64f)@nuc1eon:matrix.org Show me a smooth, not jittering, scrolling text, done easily. Amiga could do that with 25MHz CPU :-)

rebolek

[07:51](#msg6050636cd71b6554cd49a2c1)7 MHz. Only A3000 and A4000 had 25MHz CPU.

GiuseppeChillemi

[07:59](#msg6050656a44f5a454a47e039e)7Mhz, using More to scroll text.

## Wednesday 17th March, 2021

greggirwin

[00:39](#msg60514fd9563232374c244c8d)Sadly, not many weighed in on the recent survey here, but that's not surprising. Here are the results:

```
votes: [
    [fundamentals trends mission] 
    [fundamentals trends mission] 
    [fundamentals trends mission] 
    [fundamentals trends mission] 
    [fundamentals trends mission] 

    [mission fundamentals trends] 
    [mission fundamentals trends] 
    [mission fundamentals trends] 
    [mission fundamentals trends] 
    [mission fundamentals trends] 

    [trends fundamentals mission]
]
```

[00:42](#msg6051508133346c16275832d7)Interesting how big the clusters are, and that `mission` never fell in the middle. Small sample of course, but a mission \*is* a polarizing element, where I think `fundamentals` are something most agree are important.

[00:45](#msg6051510cf07ffa1eb546f75d)Yes, I just sorted the block rather than breaking out `group-by`, because that's a work in progress and while HOFs are fundamental, we haven't nailed them down yet. :^)

[01:01](#msg605154e7ac0fd631ca710741)We don't like answering surveys, at least I don't. But we \*LOVE* writing code. I recently went looking for my old permutation function, but couldn't find it. Maybe I imagined writing it, or it was so bad I destroyed the evidence. So I did a quick search or two, pulled a couple books off my shelf, and realized that copying a C++ or Lisp model wasn't what I wanted to do. Having the basics in my head, I tripped a few times doing my own, but it was good for my brain. Here it is:

```
permutations: function [
	"Return a block containing all the permutations of the series"
	series [series!]
][
	drop: [head remove find copy series val]	; used like a subroutine
	either 1 = length? series [series][
		collect [
			foreach val series [
				foreach p permutations do drop [
					keep/only either any-block? series [
						to series compose [(val) (p)]
					][
						make series reduce [val p]
					]
				]
			]
		]
	]
]
print mold permutations [a b c]
print mold permutations 'a/b/c
print mold permutations quote (a b c)
print mold permutations "abc"
print mold permutations %abc
print mold permutations <abc>
```

I should probably have destroyed this one too. It doesn't feel particularly elegant, might be more efficient, and produces at least two bad results from the above samples. So why post it?

Because turning The Great Red Optimizer (that's you all) loose on it will surely produce a better result than I can alone, and it will be fun to watch. Go recursive, or with an interchange approach. Should we have a `next/prev-permutation` approach? The recursive model is \*not* efficient. And how useful are permutations beyond a certain point? What are the use cases?

\- Fix the known bugs.  
\- Consider what types are useful to permute.  
\- Decide if it should have limits imposed.  
\- Have fun thinking about it.

[01:12](#msg6051577833346c16275844b6)Somehow I think @GalenIvanov, with his twisty-turny puzzle brain will like this challenge.

snotbubble

[01:19](#msg60515934f07ffa1eb5470c3b)&gt; Sadly, not many weighed in on the recent survey here...

question was ambiguous, plus these priorities change from project to project.

For example: I have one project that won't finish until FTP and 64-bit MacOS is available (anti-trends), while another project has issues with cruft caused by the strict separation of dialects (mission), but both depend on easy manipulation of dates and blocks (fundamentals).

greggirwin

[01:21](#msg6051599ea7dfe1372eda439d)Indeed. Why are none of our questions easy (including this one)?

Numeross\_\_twitter

[01:26](#msg60515ad188edaa1eb8bf529e)\[mission fundamentals trends]  
With that I wrote a text on my phone but I can't find my phone  
It was about my interpretation of 'fighting complexity', in short : we have to fight complexity by making complex and abstract concepts accessible with simple explanations. Pushing away the complexity behind "quirky but simple" and quick to use interfaces like we find in game engines, music production and 3d animation softwares and other doesn't fit to me at all.  
I'm never satisfied with what I can do, and it's way too complicated under the hood

[01:29](#msg60515b7ac1e10242c5a361bf)And yeah it's not an easy question but it made me think. I had to reflect on what you mean with each concepts

greggirwin

[01:34](#msg60515cc1ef43061daa79c9c9)And \*that* comes back to the Venn diagram that started it all. A simple priority list makes us look at it one way, but the overlapping nature in the diagram is a different experience. We can't even weigh the circles by size, because each is a different axis. `Mission` is an abstract concept, about \*not* adding things in our case. `Fundamentals` have concrete, durable artifacts, but still aren't bounded, except by what our mission "forces" us to include. Trends are a flowing, ephemeral river, without long term value. And we haven't even included a number of other important circles.

GalenIvanov

[08:00](#msg6051b700563232374c255501)@greggirwin Thank you for the challenge! I already have a function `n-permutaton` that returns the `nth` permutation of a series, zero indexed. So

[08:01](#msg6051b74333346c1627594742)

```
>> n-permutation [a b c] 0
== [a b c]
>> n-permutation [a b c] 5
== [c b a]
```

[08:02](#msg6051b7872beb1e1da3b02b93)The first permutation is the original arrangement, tha last one - the reversed original arrangement.

[08:04](#msg6051b7f49ebdfd16407c6f25)\[Combinatorics](https://github.com/GalenIvanov/Combinatorics-Red/blob/master/combinatorics.red)

[08:14](#msg6051ba6d83533831b4e60729)Here's a link to the article that explains the math behind the method I used:  
\[Representing a Permutation](https://code.jsoftware.com/wiki/Doc/Articles/Play121)

[08:17](#msg6051bb19bc554b42d605ebf2)Too bad (because of the notation used) it's in J - a wonderful array language

dsunanda

[09:29](#msg6051cbe79ebdfd16407caba4)A permuation toy that does not have to precalculate all the permutations - it can instantly return you the 1000 billionth permutation of the alphabet:

```
nth-permutation: func [
    array-in [block! string!]
    nth [integer!]
    /local
    fact array-mid array-out
][
    fact: func [ "Reverse factorial calculator"
    n-in [integer!]
    /local n-out nn c digit fact-n
][
    n-out: copy []
    c: n-in
    nn: 0
    while [c <> 0] [
        nn: nn + 1
        append n-out c // nn
        c: to-integer (c / nn)
    ]
    return n-out
]
    nth: max 0 absolute nth  ;; sanitize input
    array-mid: copy/deep array-in
    array-out: make array-in []

    fact-n: fact (nth - 1)
    while [(length? fact-n) < length? array-in] [append fact-n 0]
    foreach digit reverse fact-n [
        append array-out pick array-mid (digit + 1)
        remove at array-mid (digit + 1)
    ]
    return array-out
]

print nth-permutation [1] 1
print nth-permutation [1 2] 1
print nth-permutation [1 2] 2
print nth-permutation "abcdefghijklmnopqrstuvwxyz" 1'000'000'000
```

GalenIvanov

[09:34](#msg6051cd0c33346c16275987ae)@dsunanda Great! My function doesn't calculate all the permutations too, just the one in interest.

dsunanda

[09:39](#msg6051ce67c1e10242c5a49717)@GalenIvanov Cool! We've taken slightly different approaches - you are using 0-based indexing, and I've gone for 1-based.

GalenIvanov

[09:46](#msg6051cff5f07ffa1eb5484b68)@dsunanda Yes, 1-based is idiomatic for Red

hiiamboris

[10:03](#msg6051d3f8ef43061daa7b048b)

```
ith-perm: function [a i] [
	also r: make a n: length? a: copy a
	loop n [
		append/only r take skip a i // n
		i: to 1 i / n
		n: n - 1
	]
]
```

[10:04](#msg6051d43aac0fd631ca725196)(index likely does not align with the counting they used in J)

GalenIvanov

[10:10](#msg6051d594563232374c25b40e)@hiiamboris That's some really short code! Amazing!

pekr

[10:10](#msg6051d5a82beb1e1da3b07fe4)+1 :-)

[10:11](#msg6051d5e328e6153d7224d56d)I have not used `also`nor `take`in my code yet. I need to adapt somehow :-)

hiiamboris

[10:12](#msg6051d5f02beb1e1da3b0809b)@GalenIvanov That moment when I wish we had `repeat/reverse` ;)  
(or `for n n 1`)

GalenIvanov

[10:14](#msg6051d68a28e6153d7224d7c8)@hiiamboris or ranges? :)

hiiamboris

[10:14](#msg6051d69128e6153d7224d7e7)Yes!

GalenIvanov

[10:14](#msg6051d69c3b9278255bb50c36)I have never used "also" too

pekr

[10:15](#msg6051d6a62beb1e1da3b0825d)Don't do that, now Gregg will write down his elaborate on that stuff and it is going to be long. Like real long :-)

hiiamboris

[10:16](#msg6051d6e03a9448256c0f7f22)LOL. Now that you mention it, he has no choice :D

dsunanda

[10:19](#msg6051d7afad83ec3d7d35951f)@hiiamboris That is amazing! So compact.

Added challenge....Can you tweak it so the permutations are returned in "natural" order? eg:

```
(ith-perm [1 2 3 4] 1) = [1 2 3 4]
```

hiiamboris

[10:20](#msg6051d7f4ad83ec3d7d3595a9)It's just 0-based right now. It kinda makes some sense that 0th permutation is synonymous to do not permute. (OK, guilty - it also makes the code shorter :D)

[10:39](#msg6051dc673a9448256c0f8f78)`swap` should be faster in practice but the order is less natural:

```
ith-perm: function [a i] [
	also a: copy a
	forall a [
		swap a skip a i // n: length? a
		i: to 1 i / n
	]
]
```

[10:50](#msg6051dee09ebdfd16407ce16a)&gt; turning The Great Red Optimizer (that's you all) loose

@greggirwin using the above function, the rest of the code will be:

```
fac: function [n][m: #(0 1) any [m/:n m/:n: n * fac n - 1]]
all-perms: function [a] [
	also r: make [] n: fac length? a
	repeat i n [append/only r ith-perm a i - 1]
]
```

or `all-perms: func [a] [map-each/only i fac length? a [ith-perm a i - 1]]` if HOFs are allowed ;)

GalenIvanov

[11:27](#msg6051e7bf9ebdfd16407cfdf8)@hiiamboris So you are using `also` instead of explicitly writing and returning `r` (or `a`) at the end of the function?

hiiamboris

[11:29](#msg6051e82a3a9448256c0fae96)Yep. When it's just a few lines.

GalenIvanov

[11:30](#msg6051e85f2beb1e1da3b0b9c9)OK, thanks!

hiiamboris

[11:32](#msg6051e8be3b9278255bb53b6d)Look at the source code of `also`. It's brilliant ;)

GalenIvanov

[11:33](#msg6051e906ef43061daa7b425e)I will

rebolek

[14:10](#msg60520de5563232374c265c79)I can'ŧ access rebol.org, does it work for anyone?

wezl:privacytools.io

[14:11](#msg60520e0fa7dfe1372edc5546)looking for rebol.com?

rebolek

[14:12](#msg60520e55c1e10242c5a56441)No, rebol.org, library of rebol scripts

wezl:privacytools.io

[14:14](#msg60520ec983533831b4e70618)well doesn't load for me either

rebolek

[14:15](#msg60520ef43b9278255bb5ab6e)ok, thanks. let's wait for someone who has some control over it

hiiamboris

[15:01](#msg605219dc9ebdfd16407d93f7)works perfectly fine here

wezl:privacytools.io

[15:05](#msg60521ab93b9278255bb5ccfb)is there any chance of building on an unsupported platform? I need rebol, and in order to build rebol I need... rebol ::/

dsunanda

[15:12](#msg60521c70a7dfe1372edc8239)@rebolek Working for me right now.  
It's HTTP only, so your browser may be blocking that - and looking only for a HTTPS site.

wezl:privacytools.io

[15:14](#msg60521cebad83ec3d7d36698b)@hiiamboris: wouldn't I still need a compiled red executable? So I'll have to ask someone else to build for me?

hiiamboris

[15:16](#msg60521d523a9448256c105854)Red doesnt compile Red (yet). Rebol does. But you can compile exe for your unsupported platform on any other platform, including a VM.

[15:17](#msg60521d933a9448256c105920)What's the platform in question btw?

wezl:privacytools.io

[15:47](#msg6052248533346c16275a905e)Linux localhost 4.19.155-10581-g8bdb5ed8e80c #1 SMP PREEMPT Mon Feb 15 21:45:33 PST 2021 i686 Android

[15:51](#msg6052258c563232374c26ac75)does that help at all?

hiiamboris

[16:04](#msg605228a2ef43061daa7c0f24)Is this some kind of Android-x86 kernel?

[16:09](#msg605229b5ad83ec3d7d36945d)If it's an i686-compatible device, with Linux, why Rebol doesn't work there?

wezl:privacytools.io

[17:18](#msg605239c9ac0fd631ca738b9c)¯\\\_⦕'~'⦖\_/¯ It probably has to do with termux

hiiamboris

[17:31](#msg60523ce7ef43061daa7c52c7)Terminal can't affect whether a program runs your machine or not. It can only affect how it displays the info. Anyway, try to run R2 in non-interactive mode, e.g. `rebol -qws red.r environment/console/cli/console.red`. If that doesn't work you'll need to set up a VM to \*build* things, because R2 is closed source. You'll still be able to \*use* software built for your machine without it.

rebolek

[17:41](#msg60523f44ac0fd631ca739ea3)@dsunanda thanks, it's working for me again too. my browser read HTTP sites, so it was some other problem, but it's fine now

greggirwin

[18:15](#msg60524756f07ffa1eb549c28a)Thanks all! I've copied the code and chat to https://github.com/red/red/wiki/Great-Red-Optimizer-Challenge:-Permutations.

[18:40](#msg60524d2bf07ffa1eb549d49d)@hiiamboris has shown that Red can find a human minima before becoming an array language. And with a memoizing factorial func for good measure.

I have deep respect for those who can write in APLs, and even more if they can read them too. ;^)

Total agreement here that `also` is a brilliant func. That said, I would probably not put @hiiamboris code into production the way it's used here. Not without reformatting and comments for clarity.

I have a number of things on my list for today, and setting up profiling for the various submissions will take a little time. If someone else wants to do that, go for it.

As a funny side note, @hiiamboris saves a few bytes here `also r: make [] n: fac length? a` by using `make []` rather than `make block!`. I recently brought this up with Nenad. I couldn't find any code using that pattern, but didn't go through Boris' gitlab repos. I want to consider `make` with a prototype block or map work like it does with objects. That is, include the prototype data. Blocks raise questions because they're not key-val structures, and what to do if the spec is an integer, but if we doc the behavior, we can choose the most useful and keep it simple. This would give us more consistency and make it much easier to use the different types in data files. This ties to a couple existing tickets, and came from a real-world use case.

\- https://github.com/red/red/issues/2167 WISH: Have `copy/deep` copy all copyable types by default  
\- https://github.com/red/red/issues/2254 WISH: /types refinement of COPY should have typeset! argument.

hiiamboris

[18:43](#msg60524ddebc554b42d607ae5e)I'm using `make []`, `to []`, `to 1`, `to ""`, `as []` all the time ;)

[18:45](#msg60524e53f07ffa1eb549d849)It's more readable to my eye in many cases, as instead of the name of the thing, I see the thing itself.

greggirwin

[18:46](#msg60524e9fad83ec3d7d370d07)Interesting. Good to know.

hiiamboris

[18:48](#msg60524f0ef07ffa1eb549e089)Also, I use this pattern sometimes (e.g. in composite), where `make` is fed an argument of the function:

```
>> ?? sum
sum: func [
    "Returns the sum of all values in a block" 
    values [block! vector! paren! hash!] 
    /local result value
][
    result: make any [values/1 0] 0 
    foreach value values [result: result + value] 
    result
]
```

greggirwin

[18:49](#msg60524f1fac0fd631ca73d536)I've only ever used them in cases of indirection, e.g. wanting to make the same type as a func arg. That's another case that would trip up with keeping prototype data, unless integer specs mean "make an empty one".

[18:49](#msg60524f57ef43061daa7c91e8)Yes, that's a good example.

gltewalt:matrix.org

[18:50](#msg60524f59bc554b42d607b264)Should Red adopt the lexical indicator"!" at the end of function names for destructive functions?

hiiamboris

[18:50](#msg60524f8c88edaa1eb8c21814)No, it would conflict with datatypes. I like this idea actually, since I first seen it in some other lang. But that means no compatibility with Rebol.

greggirwin

[18:50](#msg60524f8f563232374c2734b1)@gltewalt:matrix.org no. `!` is used for datatype notation.

[18:51](#msg60524fcb83533831b4e7e08a)And because we don't view mutability as dangerous, if we use a warning sigil it should be for other things, like "Boris wrote this func, so you can trust it to work but you may not understand the code." :^)

hiiamboris

[18:52](#msg60524ffaad83ec3d7d371263):D

[18:54](#msg6052504f28e6153d72265bff)On `make [a: 1] [b: 2]`, what's stopping you from using `make object [a: 1] [b: 2]`?

gltewalt:matrix.org

[18:54](#msg6052505728e6153d72265c14)A symbol at the end is an easy way to know at a glance. Use the Irwin smiley face

greggirwin

[18:54](#msg60525057f07ffa1eb549e462)Or we could do this: `danger⚠: func [] []`

[18:55](#msg6052508c88edaa1eb8c21acd)I'm a fan of sigils when used appropriately and in moderation.

hiiamboris

[18:55](#msg605250a6a7dfe1372edd34f3)`reverse☠: func ["DESTRUCTS YOUR SERIES!!1" series..][..]`

[18:57](#msg6052512733346c16275b24b0)Seriously though, I find that one gets used pretty quickly to which functions are modifying. It's not a problem in programming, only in learning.

greggirwin

[18:57](#msg6052512dc1e10242c5a64fae)@hiiamboris nothing stopping me from doing that, of course, but why \*wouldn't* the structures work consistently in this case? Blocks are the big question, but I generalized after hitting it with maps.

That's how we deprecate functions. Rename the old ones based on why they were deprecated. Bug, crash, turtle for slow ones.

[18:58](#msg6052514a3b9278255bb684ee)And we have a standard practice of noting modifiers in doc strings.

[18:58](#msg6052516c88edaa1eb8c21d87)There's nothing preventing people from doing that kind of thing in their own libs of course. It may be very effective in some cases.

hiiamboris

[19:00](#msg605251c8ad83ec3d7d371849)What's the practical use of `make #(a: 1) [b: 2] -> object`?

gltewalt:matrix.org

[19:05](#msg605252fe563232374c2740ea)It's not just in the learning. It's also about the remembering. Neither are necessary if there is a lexical indicator at the end of a function name. Self documenting.

[19:07](#msg6052535783533831b4e7ebe0)`borisize*`

hiiamboris

[19:08](#msg605253c088edaa1eb8c22454);) I would have supported the initiative if not for Rebol roots.

greggirwin

[19:13](#msg605254c9ac0fd631ca73e50e)`make proto-map partial-map`, where `partial-map` is a record in a file. `proto-map` has more fields that the app uses, like a schema. We can look at this a lot of ways. e.g. maps will add new keys as needed, so why use a prototype? Sometimes you want flexibility, but a fully spec'd structure is its own documentation. Partials in files "leaks" less info, where users don't need to care about it. So it comes down to context as well. If maps copied strings, I might never have brought it up. :^)

It's also interesting to think in terms of what the type choice says to intent. Objects say "code + data", Maps, say "key-val data", and blocks say...could be anything, what does it look like? If it looks like key-val and walks and talks like key-val, it probably is. Of course, you can't `parse` objects or maps, so it's not like they are all transparently interchangeable.

[19:16](#msg6052558b33346c16275b3330)@gltewalt:matrix.org propose a different sigil then. Red won't use `!` to denote mutability without \*very* strong arguments behind it. Even better, evidence that it helps.

gltewalt

[19:17](#msg605255bd3b9278255bb695b1)I just did. `*`

hiiamboris

[19:17](#msg605255e5c1e10242c5a65ef5)@greggirwin as you may recall there be dragons in what you're doing: https://github.com/red/REP/issues/100

gltewalt

[19:19](#msg6052562788edaa1eb8c22bce)There are no great other ascii symbols, though

[19:19](#msg60525647563232374c274c26)People may be used to `*` for pointers

hiiamboris

[19:22](#msg605256f8ac0fd631ca73ebd0)@greggirwin on maps, I would myself like to be able to copy them. Right now to deeply copy a map (with other maps) I have to recursively walk thru it.  
Seems like `copy/deep` only copies value blocks, not even strings, which makes little sense.

greggirwin

[19:23](#msg6052573183533831b4e7fb23)`borisize* v * n* v`doesn't look great to me. Good point on pointers. Lexical space is tight, so it's tough.

Consider this, do you want to write `append!` \*every time\*, rather than `append`. What about `insert!`, `change!`, `replace!`, `sort!`, `remove-each!`? Modify some code and see what it looks like if you denote all current modifying funcs this way. It would be interesting to see.

[19:25](#msg605257a288edaa1eb8c22fdc)Thanks for the link to the `construct` issue. I'll note that as well.

gltewalt

[19:27](#msg605258242beb1e1da3b228aa)Yeah that might get kind of noisy if you have a big chunk of code that contains a bunch of modifiers

[19:29](#msg6052587ca7dfe1372edd4e7f)The ruby way is to have a non destructibe version and a destructive version where appropriate. `remove!` and `remove`

greggirwin

[19:29](#msg6052589dac0fd631ca73f1b2)Which comes back to the point that mutability is not the exception in Red, it's the norm.

gltewalt

[19:30](#msg605258c03b9278255bb69ef4)Well it's not exactly the exception in ruby either

[19:31](#msg605259269ebdfd16407e5ab4)Just thought I'd throw it out there and see what others think.

greggirwin

[19:32](#msg60525937c1e10242c5a668f6)And they have 2 versions of each func for those cases, right? We don't want that.

gltewalt

[19:32](#msg6052594483533831b4e802ad)Yes

[19:32](#msg605259663a9448256c11171c)Can we at least get Irwin smiley face in certain error messages?

greggirwin

[19:33](#msg60525976c1e10242c5a669b3)@gltewalt could I impose on you to add a section, and notes from this chat to https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars) ?

gltewalt

[19:34](#msg605259c59ebdfd16407e5d01)I can do that after my evening shift. Is that ok?

greggirwin

[19:34](#msg605259cf563232374c275550)Anytime is great. Thanks!

gltewalt

[19:36](#msg60525a2628e6153d722678af)You want both the symbol and the make stuff?

greggirwin

[19:36](#msg60525a41bc554b42d607d3aa)Just the symbol stuff.

gltewalt

[19:36](#msg60525a56ad83ec3d7d373541)Ok

Oldes

[19:41](#msg60525b593a9448256c111c13)@gltewalt maybe you should just use some editor which allows you to create own group of key-words and set it right color which suits your feel of danger.

giesse

[19:43](#msg60525bcbf07ffa1eb54a0680)@gltewalt it's very easy to remember.  
Assume all functions mutate the input series. Add `copy` if you don't want that.  
If you need to optimize your code, then look at the source of the functions you are using and remove any redundant `copy`.

gltewalt

[19:57](#msg60525f25ad83ec3d7d3743bf)It's not about my feel for what is dangerous, its a general inquiry and proposal to see what red users think about it. Or if they think about it.

greggirwin

[20:52](#msg60526c10ef43061daa7ce931)@gltewalt we can add smileys to error messages when it's the user's fault, but we don't want them to feel too bad about it. :^)

rebolek

[20:57](#msg60526d3e88edaa1eb8c27660)We can also make adaptive errors:

```
>> context [err-count: 0 errors: ["x must be integer!" "you made the same error again, x must be integer!" "are you kidding me? I already told you that x must be integer!"] set 'f func [x][unless integer? x [err-count: err-count + 1 do make error! pick errors err-count]]]

>> f "a"
*** User Error: "x must be integer!"
*** Where: do
*** Stack: f  

>> f "a"
*** User Error: "you made the same error again, x must be integer!"
*** Where: do
*** Stack: f  

>> f "a"
*** User Error: {are you kidding me? I already told you that x must be integer!}
*** Where: do
*** Stack: f
```

GiuseppeChillemi

[21:01](#msg60526e252beb1e1da3b26bda)@hiiamboris  
&gt; What's the practical use of `make #(a: 1) [b: 2] -> object`?

I can answer you as I am actually working on it: when you want to receive data via a JSON web API you could use its content to build an object.

[21:02](#msg60526e5028e6153d7226b7a1)(Either as a server or as a client)

greggirwin

[21:04](#msg60526edf88edaa1eb8c27a9e)@rebolek . Yes!

[21:04](#msg60526ef9a7dfe1372edd8eed)Another good use case @GiuseppeChillemi.

[21:06](#msg60526f5383533831b4e84544)@rebolek while it's funny, consider that something like that could also really be useful. Tracking how many times certain errors occur, especially where users are involved, could teach us a lot about which functions are harder to use correctly.

rebolek

[21:08](#msg60526fbbac0fd631ca7436a8)of course, this example is just a joke but I agree that it has practical use.

hiiamboris

[21:22](#msg60527317a7dfe1372edd9b36)@GiuseppeChillemi in case of JSON, it's just `make object to [] #(a: 1) to [] #(b: 2)`, no dangers

greggirwin

[21:31](#msg605275312beb1e1da3b2815f)@hiiamboris what did I tell you about the obfuscation contest not starting yet. ;^)

hiiamboris

[21:38](#msg605276bb83533831b4e85c62)I just don't see a solid use case. Besides, even if there was one, I would be totally against a special case in `make`.

greggirwin

[21:41](#msg60527782ad83ec3d7d378e7e)Isn't `object!` a special case in `make` already?

[21:45](#msg60527877ad83ec3d7d37911a)Probably worth adding a section to https://github.com/red/red/wiki/%5BDOC%5D-Comparison-of-aggregate-values-(block!-vector!-object!-hash!-map!) as important points are made in chat.

[21:50](#msg6052799b3b9278255bb704e7)Functions would be another interesting case, with twice the questions of blocks, where one of them is dialected.

hiiamboris

[22:10](#msg60527e3f2beb1e1da3b29b47)&gt; Isn't `object!` a special case in `make` already?

How so?

greggirwin

[22:14](#msg60527f502beb1e1da3b29e28)In that it uses the `type` arg as a prototype, not just as its datatype.

hiiamboris

[22:24](#msg605281acc1e10242c5a6ea08)Ah, right. But still datatype is the same as the prototype.

greggirwin

[23:46](#msg605294bea7dfe1372ede02e7)That's what I want with the others as well. I don't want maps or blocks to become objects. Sorry for any confusion.

## Thursday 18th March, 2021

greggirwin

[00:42](#msg6052a1f0f07ffa1eb54ad344)@hiiamboris @GalenIvanov do you know why factorial with floats blows the stack? even 1.0 does it. Integers are fine up to their limit.

[00:57](#msg6052a57533346c16275c1c74)@hiiamboris you have `map-each/only`. In mine I always use `/only` internally, which I decided to do based on the result matching the number of values being mapped. That's the traditional approach, and we can always flatten the result to go the other way, but I'm interested what others think, as this will play out in the general HOF design as well.

hiiamboris

[08:11](#msg60530b279ebdfd16408034da)I found that /only occurs as often as no /only, and flattening is extra overhead.

[08:11](#msg60530b4ea7dfe1372edf27d9)&gt; why factorial with floats blows the stack? even 1.0 does

[08:12](#msg60530b6f9ebdfd1640803591)Because it's not on the map and map strictly checks for the key (:

GalenIvanov

[08:22](#msg60530dc69ebdfd1640803b3b)memoization?

hiiamboris

[08:29](#msg60530f7528e6153d72285903)yeah

GalenIvanov

[08:41](#msg6053125388edaa1eb8c41cad)Factorial is the epitome of recursive functions, but I've always thought that iteration is no worse here

[08:42](#msg6053126233346c16275d2cd5)

```
Dyalog APL
fact←×/⍳
      fact 10
3628800
```

hiiamboris

[08:44](#msg605312efbc554b42d609c4e5)in Red it'll be slower than memoized, as it's not a compiled lang

GalenIvanov

[08:44](#msg605312fc3b9278255bb894c9)(fact is a function : reduce by multiplication the range 1 to the argument)

[08:48](#msg605313e933346c16275d313c)@hiiamboris ok, thank you for the clarification! I just wanted to show some "write-only" APL code to @greggirwin :smile:

[08:55](#msg6053159def43061daa7e9c0d)Joking asids, @greggirwin is right about difficulties in reading APLs - I have some minor experience in J/K/APL and I love them, but I'm not experienced enough to read them freely. That's probably true for most people. Maybe this explains the existence of Q language.

hiiamboris

[09:05](#msg605317e9a7dfe1372edf4cd2)I agree, but I'd also love to see the opinion of someone from China or Japan on this, as their minds are well trained for short pattern recognition. And when I read the code I kind of expect the amount of work be proportional somewhat to the amount of code, and don't like it when one hardly noticeable symbol changes everything. It reminds me of product labels - what you really wanna read is always written in tiniest font possible :D

GalenIvanov

[09:07](#msg6053186233346c16275d4097):smiley:

wezl:privacytools.io

[14:15](#msg60536069ac0fd631ca76d7e5)\*\*advertisement\** there's discussion about array languages on matrix (search for array languages) \*\*/advertisement\** ;)

greggirwin

[19:24](#msg6053a904c1e10242c5aa39cf)@hiiamboris ah, map. :^\\ Thanks.

@GalenIvanov :^). I have this conflict in my brain at times. I'm a K fan, and think Arthur Whitney is an amazing developer and designer. What you can do with human code compression astounds me. And I \*want* to do it soooo badly. Like I wanted to do Lisp many years ago. I've tried both, and others like Smalltalk, but some things just don't click in my head.

An important point we don't talk about much in programming is \*writing for your audience\*. DSLs are about as close as we come. Hemingway isn't better than Wilde or Tolstoy, and CS textbooks aren't better than romance novels. Look at the power of sequels and now serial blockbusters or horror films. People come in with context, and studios know there's an audience.

But with proglangs, while we have genres (imperative, FP, OO, symbolic, logic, stack-based, etc.), we only have a few directors for each one. In this analogy, I suppose the big players like FAANG are like A List celebrities.

wezl:privacytools.io

[19:27](#msg6053a99488edaa1eb8c5f378)that's why I'm a distant fan of Red

GalenIvanov

[21:04](#msg6053c05628e6153d722a9517)@greggirwin Thank you for sharing, I completely agree!

## Friday 19th March, 2021

wezl:privacytools.io

[00:01](#msg6053e9edac0fd631ca78897c)does red compile with r3?

greggirwin

[04:46](#msg60542c8ead83ec3d7d3c75d3)No, only R2 at this time, AFAIK. @Oldes might be able to say more on the R3 side.

Oldes

[07:21](#msg605450faf07ffa1eb54f933e)It doesn't as Red compiler is using `struct!` which is not in R3 (plus other incompatibilities between r2 and r3). I think there was some attempt (not mine) years ago.. but Nenad was not interested and Red's code is changing quite a lot.

greggirwin

[19:32](#msg6054fc45563232374c2f148f)Thanks. Good to know, as I thought R3 had `struct!`. That's a big one we want to add at the Red level.

Oldes

[22:20](#msg605523b49ebdfd1640869d38)Atronix version has it. But Atronix version is a dead end now. But it is definitely one of good to have datatypes.

## Sunday 21st March, 2021

gltewalt

[21:35](#msg6057bc25ac0fd631ca8208a1)I forgot for awhile, but added to Feature Wars in the wiki.

[21:35](#msg6057bc2788edaa1eb8d036f8)https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)#sigils-to-denote-destructive-functions

greggirwin

[22:02](#msg6057c27788edaa1eb8d04791)Thanks. Not sure when I'll be able to wordsmith into content, but now that it's there it will gnaw at me to do so. :^)

GiuseppeChillemi

[23:11](#msg6057d2962beb1e1da3c06e12)@BaronRK et all: We have a new language and data format from Carl!  
As I have imagined, there was a reason why Carl has started thinking about block items count beginning at zero: there was an undergoing flow of ideas and thoughts about making easier for other developers the transition to Rebol. Those ideas have evolved further, now we have \[ASON and AltScript](https://altscript.com/). They come from merging the experience of Rebol and the JSON data format.  
Carl's creative and rebel soul is still alive and burning!  
NOTE: I have found them while looking at his new \[personal site](https://sassenrath.com/)

[23:14](#msg6057d36da7dfe1372eeb9f69)Take a look at the \[differencies](https://altscript.com/?page\_id=16) between Rebol and AltScript

greggirwin

[23:41](#msg6057d9a78478e061b94f9c12)Wow! Nice find @GiuseppeChillemi.

## Monday 22nd March, 2021

greggirwin

[00:01](#msg6057de71a7dfe1372eebb803)@GiuseppeChillemi where did you see Carl talking about zero-based blocks?

GiuseppeChillemi

[00:38](#msg6057e6f93b9278255bc50a77)@greggirwin It's an old memory I have dating 10 years ago and connected to @pekr , I remember him writing somewhere that people were not happy when Carl expressed the idea that Rebol3 indices could be changed to start at zero. I can't find any reference.  
On the web, only this \[mailing list article](http://www.rebol.org/ml-display-message.r?m=rmlVMHK) exists about Rebol blocks starting at zero, and it concerns Rebol2.

greggirwin

[00:40](#msg6057e770ad83ec3d7d45a106)OK, thanks.

GiuseppeChillemi

[00:45](#msg6057e8b13b9278255bc50f26)You are welcome.

Respectech

[01:03](#msg6057ecfe2beb1e1da3c0ab1c)Well, that is quite interesting!

BaronRK

[03:38](#msg60581140f07ffa1eb558b6cc)Fun!

pekr

[06:52](#msg60583ec48478e061b9508133)ha! ASON and AltScript and AltOS? Carl basically returning to Rebol? :-) As for his plans - he want to bring in some libraries, so that ppl can start / swith to ASON. Did't we have some name already, to that? Was it REN? or something like that?

greggirwin

[07:57](#msg60584de52beb1e1da3c1900e)After reading it, does anyone else think some things sound...odd? Including some of the design choices. It feels like an uncanny valley somehow.

@pekr, yes it's Ren, but Carl never participated in that conversation.

GiuseppeChillemi

[09:09](#msg60585ede9ebdfd16408e0dee)It's Rebol with JSON object parens. I like the absence of the make constructor, but can't decide on counting starting from zero. Also, paths are of two types, dotted and slashed, I think because this let you distinguish between selection and execution at path level. Carl wants to attract the huge json/Javascript coders world masking Rebol inside something they are used to see.

[09:13](#msg60585fbf3a9448256c2097b7)It's a smart choice from him. Sometime these moves brings great success.

pekr

[09:21](#msg6058618333346c16276ad99c)No zero based indexes for me in Redbol. Or just cancel all those `first`.... etc. funcs ....

[09:22](#msg605861cf3a9448256c209c84)Well, though `first` might still mean first element of an array, which is at zeroth position. But what do you do with path access as`blk/1`

hiiamboris

[09:25](#msg605862a7a7dfe1372eecfb4b)@greggirwin You may be right. It doesn't read to me as "I see how to build a better world", but rather as "These ideas were gnawing at me long enough that I decided to pour them into the internet, to let go". That would explain why instead of joining the effort he decides to split it (you know, divide and be conquered). That would also explain the oddities, biggest of which to me nowadays is talk about AltOS.

GiuseppeChillemi

[09:28](#msg60586329563232374c37040c)Blk/0, so you can go from positive to negative index continuously. But yes, you have to get used as first creates the appearing of number 1 in minds, so it is like someone rising the right hand while saying left.

hiiamboris

[09:32](#msg605864118478e061b950eb61)For zero indexes, some "skip" notation would be more undestandable, e.g. `blk+0`.

```
-2  -1   0   1   2   3   4
 [ s | e | r | i | e | s ]
         ^
         head
```

GiuseppeChillemi

[09:35](#msg605864e733346c16276ae2c9)@hiiamboris Carl has started creating and OS, so he likes making an OS out of everything. If he creates a new radio station, he will also make a RadioOS too, on every autumn a new VineOS is produced and every son is new ChildOS release!

pekr

[09:36](#msg6058652aac0fd631ca839fc3)@hiiamboris on the other hand (apart from OS), providing tool made to the point, is a good aproach imo. See the Curl - defacto standard for scripted networking? Long time ago, I have proposed making `parse.exe`command line tool. The world does not need to care about Redbol, but `parse` could just make it. The Redbol would benefit from that too. Not sure about the parse tool usefulness today, respectively - don't know, if something like that already eventually exists, or not ...

hiiamboris

[09:38](#msg605865899ebdfd16408e220d)Good idea @pekr . I'll add that to the \[CLI demos](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups)

[09:40](#msg605865f828e6153d72364e34)@GiuseppeChillemi (:

rebolek

[09:42](#msg60586685bc554b42d6177d90)indexes start at one, offsets at zero

GiuseppeChillemi

[09:46](#msg605867742beb1e1da3c1d4c8)Think about parse being used directly on JSON, without conversion/additional code of any type and being manipulated at AltScript level as we do with Red elements and datatypes. It could have great success!

nuc1eon:matrix.org

[09:52](#msg605868f4c1e10242c5b62a4a)To me it doesn't seem like Carl is creating something for "success". Else he probably would focus on Windows rather than writing his own OS :p  
Seems like a personal motivation to me.

[09:55](#msg605869a633346c16276aed4b)I mean, is there a market for an OS? 😂

GiuseppeChillemi

[10:01](#msg60586aeb563232374c37179f)I see te personal motivation too, he has written it is a personal project.

nuc1eon:matrix.org

[10:07](#msg60586c7488edaa1eb8d1e0b6)Yes and I love it!  
I think I just realized that a Dockerfile is also basically a homoiconic specification? :D

[10:08](#msg60586c8e3a9448256c20b992)Because you write code to create data?

[10:08](#msg60586c99c1e10242c5b6349f)So exiting 😄

GiuseppeChillemi

[10:15](#msg60586e31a7dfe1372eed181a)Also the `1..20` indexes datatype is something Red could add.

[10:35](#msg6058730c3b9278255bc66789)@BaronRK is this the tech you were working on for APIs when you have written to me about this topic in chit/chat? I can't believe you were not aware of this new project from Carl. You have made too many things together! Confess! :-)

planetsizecpu

[11:59](#msg6058868cac0fd631ca83fc96)I just wonder if @carls will show here, so we can ask about, that would be great!

WayneCui

[12:04](#msg605887d0ad83ec3d7d4737f6)Has red supported network IO such as TCP now？

pekr

[12:06](#msg60588852ac0fd631ca840172)Isn't Carl a member of the Red Foundation? But - I think, that his involvement is very formal. He does not like to be tied by any obligations imo. Some time ago we have even learned, he mentioned Rebol 4 to @Respectech. Those of us, who remember Carl's "cave modes", know, that he tends to announce / mention something, and then you never hear about it again. One of examples is here - 3 years and still no more words on the subject - http://www.rebol.com/article/0554.html

[12:08](#msg605888ab9ebdfd16408e8529)@WayneCui There is ongoing effort to bring full IO to the Red. There is even a special branch for that, and as far as my understanding goes, IO should be merged into master soon. But I have no access to any internal info, so regard it being just my guess ....

WayneCui

[12:09](#msg6058891733346c16276b3c35)Thanks for your info. :-) looking forward to it

GiuseppeChillemi

[12:20](#msg60588b8ead83ec3d7d4742b6)I don't know when it will be ready but it is not important. We need real and usable solutions. Red is a concrete project which gives us the stability and support needed. When AltScript and ASON will be ready, we will consider them but we can achive the same results on Red with just a little overhead. Those projects are a thing of the future but Red is a thing of now.

GalenIvanov

[12:21](#msg60588bcb33346c16276b4553)@GiuseppeChillemi `can achieve the same results`

[12:21](#msg60588bd98478e061b9515627):smile:

GiuseppeChillemi

[12:23](#msg60588c54bc554b42d617e8d2)@GalenIvanov I have not understood if you agree or not agree with my phrase. :-?

GalenIvanov

[12:25](#msg60588ca1a7dfe1372eed6b38)Yes, I agree - just wanted to show you a small typo

GiuseppeChillemi

[12:25](#msg60588cc288edaa1eb8d23de5)The problem is that I don't see the typo! :-D

[12:26](#msg60588ce1ac0fd631ca840f90)Ok, I have seen it!

GalenIvanov

[12:26](#msg60588d02c1e10242c5b69353):+1:

GiuseppeChillemi

[12:27](#msg60588d1a28e6153d7236b96e):-D :-D :-D , ok let's archive this error, I have edited the phrase, thank you!

GalenIvanov

[12:27](#msg60588d498478e061b9515a99)It's already archived :smile:

GiuseppeChillemi

[13:04](#msg605895c9bc554b42d6180638)@pekr  
&gt; Those of us, who remember Carl's "cave modes", know, that he tends to announce / mention something, and then you never hear about it again.

Carl is a man of ideas and visions. I share with him this trait. This kind of mind tends to enter in creative states where you end up with projects and the day to day activities blocks your from realizing them, so you announce the project but life block you from realizing it. In fact, if you read carefully the blog article, he admits it is suffering about this problem. Please remember when Carl has started Rebol, he created and lived with Rebol Tech, he was fully involved with it: life, work, projects, family, ideas, all were in the same dimension. When your work is at Roku and visions have just your spare time to be realized, you end up thinking you can do something when really you can't do it. So you announce you will make &lt;a project&gt;, you believe you can, you even evaluate you have the time but really you don't have it. it's a psychological mechanism where the evaluation process of the available resources returns the result needed to achieve the dream and not the real one. In other words, the mind tends to tell us lies and create a fake answer to realize something and we believe in it. Consider it a kind of hypnosis/trap! What I really see is the suffering of a creative visionary caged in his day-to-day life. Something we all, as humans, face in our existence.

[13:16](#msg605898b78478e061b9517a26)Even Red is suffering from this problem: our friends are struggling to release new features they have announced. This happens because It is not easy when you run a company, have bills, customers, life, and a team to maintain. So my blessing goes to Carl for his new vision and all of us to fulfill the dreams we are planning for ourselves.

blkstph\_gitlab

[16:15](#msg6058c29428e6153d72375a84)I think @dockimbel is a man of great vision and integrity, also. It's been a little while since I last said that, and I want to say it again...and again. I am in awe of the integrity, perseverance, and hard work all those of exceptional vision have brought to actualizing this vision.

BaronRK

[16:17](#msg6058c32a9ebdfd16408f2f12)'I can't believe you were not aware of this new project from Carl.'

:)

Many years before REBOL (late 80s), I created a brutally simple language called MIDAS (Machine Independent Demo and Animation System, amazingly it was not a backronym), it of course produced .GOLD files.

These were P-code files that would then be converted to ML almost directly.

I designed it working backwards from 6502, 68000, etc.

REBOL shares a few similarities with MIDAS in that as OPPOSED to trying to build a language that is as base or core as possible, instead of building a language that 'knows' structures' and has key commands that we all know everyone needs and wants (normally those are religated to libraries or add ons).

Since I was focused on the flow of entertainment products, we had commands (and what might be thought of as a dialect) for things like INPUT, where a mouse or a joystick could give us Up, Down, Left, Right, and Fire Button(s), etc.

Carl and I of course talked about this even very early on.

it was super easy to write programs that controlled the flow of a game.

\- Start up showing images, allow people to click past them (titles, credits, help, etc)  
\- Select 1 player, 2 player, view Score card  
\- Start a game  
\- End a game

Write once, play many.

So with this, the whole game's logic instantly worked on C64, Apple II, Amiga, IBM-PC, Mac, etc.  
At that time in history, that saved a LOT of time and money.

[16:18](#msg6058c3529ebdfd16408f2f93)I spent a few days with Carl just before COVID happened. He is having fun at Roku.

blkstph\_gitlab

[16:26](#msg6058c5188478e061b952063c) “The dreamers are the saviors of the world. As the visible world is sustained by the invisible, so men, through all their trials and sins and sordid vocations, are nourished by the beautiful visions of their solitary dreamers.”

― James Allen, As a Man Thinketh

greggirwin

[18:43](#msg6058e54b33346c16276c5eb5)Coming from red/bugs and issue #4860: I commented on the ticket, but will ask here too.

Should `ref!` values `form` with their sigil included? My gut says yes. That's the human friendly form.

However, that also raises the question for `issue!`. When Rebol was created, there was no such word, and issues were for serial numbers and such (also were string based in R2 for those who don't know). The name "hashtag" came about in 2007 (per wikipedia), so a decade after Rebol's release. The question is whether they are so common now, and recognized by a wide audience, that their natural form includes the sigil. My gut says yes. That will eliminate a lot of `mold` calls for people looking for hashtags in texts, and it likely the far more common case. To omit the sigil, `to string!` is still the base converter.

We need to add `ref!` to https://github.com/red/red/wiki/%5BDOC%5D-Table-for-to-string-etc., but that table is valuable for discussions like this.

GiuseppeChillemi

[19:05](#msg6058ea8ff07ffa1eb55b222e)@BaronRK I have not understood the sense of your discourse related to Altscript, would you please explain it on chit-chat?

[20:47](#msg60590255f07ffa1eb55b7030)Here is the continuation of AltScript and ASON on \[chit-chat](  
:point\_right: \[22 marzo 2021 21:26](https://gitter.im/red/chit-chat?at=6058fd5d2beb1e1da3c39f0e)

planetsizecpu

[20:51](#msg60590338ac0fd631ca857518)+1 to form ref! with sigil @greggirwin

greggirwin

[20:52](#msg6059037a8478e061b952c5ca)Thanks @planetsizecpu. One vote in.

GiuseppeChillemi

[20:57](#msg6059049f2beb1e1da3c3b4e1)@greggirwin Why sigil should have a special treatment than objects?

```
>> form make object! [a: 33 b: 33]
== "a: 33^/b: 33"
```

[21:03](#msg605906143b9278255bc826b3)And also, why we retain the sigil when we have a object in object and we don't do it when we have an object in block?

```
>> probe form reduce [make object! [a: 22 b: 33 c: make object! [d: 44]]]
{a: 22^/b: 33^/c: make object! [^/    d: 44^/]}
```

[21:03](#msg6059063ca7dfe1372eeee20e)There should be 2 `make object!`

[21:10](#msg605907b1ad83ec3d7d48c1b7)If we lose lexical information in `make object!`, we should lose it also for `ref!` for congruence. Also, a `/sigil` refinement should be available to have them in formed strings. This would make the working of forming such type of containers homogeneous across datatypes.

greggirwin

[21:14](#msg605908b1ad83ec3d7d48c69e)Let's tackle them separately. How we render "atomic" lexical values is different from how we render aggregate values. Strict consistency can also play against usability. It's about what the most useful rendering is for how things are used, and what options we have. e.g. `to string!` is the most rudimentary, then `form`, then `mold`. `Form` is expected to be a lossy operation in some cases.

What we have to balance is the usability of each rendering, while not making them all the same when the differences are useful.

I'll say -1 for `/sigil`, because that's what `mold` is for.

[21:15](#msg605908faad83ec3d7d48c750)Many of these design choices came from Rebol, and it makes sense to revisit them.

GiuseppeChillemi

[21:20](#msg60590a0768921b62f47ccf57)Please, add a note to the `form` documentation that each conversion could obey different rules for different datatypes. As humans, we tend to extrapolate a common working from multiple things and we could be here in some months with a new coder asking "hey, I expected sigil to be removed as in..."

[21:24](#msg60590af88478e061b952e025)&gt; I'll say -1 for /sigil, because that's what mold is for.

I have changed my idea to `/render arg` where `arg` is the conversion style, ie: `[sigil flat newline]`

greggirwin

[21:31](#msg60590c99ad83ec3d7d48d16e)So you'd rather write `form/render sigil` than `mold`?

`Form` already says "Returns a user-friendly string representation of a value. ", that seems vague enough. ;^) When `mold/flat` is implemented, I would like it to produce single-line values.

GiuseppeChillemi

[21:35](#msg60590dbcac0fd631ca85971a)`/render` argument is a kind of `options` block , so the coder could choose the rendering style when you convert data into user-readable strings. You could even have options for RTF like `[sigils [bold italic]]`

[21:37](#msg60590e2228e6153d7238425c)(My imagination core is running ;-) )

greggirwin

[21:43](#msg60590f9df07ffa1eb55b9e7e)Seems like that should be a new func entirely.

[21:44](#msg60590fbff07ffa1eb55b9ed2)Which is an interesting idea.

GiuseppeChillemi

[22:03](#msg60591448ad83ec3d7d48e955)Yes, I have thought the same but also, the code for a refinement like this could be isolated at the end of the function's code so you keep just `form` and you don't add another word to the language. Both options are open to me with a slight preference for the former.

greggirwin

[22:44](#msg60591de43a9448256c22d29c)`Form` is an action, so a lot more work to add. I always support prototyping at the mezz level, which is often enough.

## Tuesday 23th March, 2021

gltewalt:matrix.org

[00:41](#msg6059395428e6153d7238c02f)When mold/flat is implemented? It's used in parse-trace

greggirwin

[00:48](#msg60593ae4a7dfe1372eef7239)Hey! I just tested that for another reason. Why does the doc string still say "TBD" then?

gltewalt

[00:50](#msg60593b56f07ffa1eb55c1117)Little notes are hard to keep track of?

greggirwin

[00:53](#msg60593bfa33346c16276d656b)Would someone like to submit a PR for that, removing "TBD: " from the `/flat` doc string?

gltewalt

[01:04](#msg60593eb22beb1e1da3c457ec)#4861

greggirwin

[01:06](#msg60593f13ac0fd631ca861c30)Thanks!

gltewalt

[01:46](#msg6059485cad83ec3d7d4967d7)Why did travis fail?

greggirwin

[01:58](#msg60594b53c1e10242c5b8cc99)ARM builds are failing.

hiiamboris

[17:58](#msg605a2c463b9278255bcb3283)We have `single?: :last?` defined.  
It makes sense to have `true = single? #(a b)` (I just happened to hit this use case).  
But `last? map` - not so meaningful.  
Should we split `last?` from `single?` and define `single?` for maps also?

greggirwin

[18:16](#msg605a3086c1e10242c5bb3b15)How are you using maps where you want `single?`. e.g. is it a `foreach` scenario, or removing keys and wanting to know when one is left?

hiiamboris

[18:18](#msg605a30f2563232374c3c08e8)I have 2 maps of row/col sizes, and with a `default` key being a word, the rest of keys (if present) is integers. And I'm mapping pixel coordinate to a specific row/col number. Single maps make a special case where I can just use division `return to 1 px / map/default`.

greggirwin

[18:22](#msg605a31f8bc554b42d61c6d86)OK. Is the model that if no changes are made to defaults (row or col size) then `default` is the only key, and changes are the integer keys, which override the default?

[18:23](#msg605a3221bc554b42d61c6e44)I know this is not answering your question yet.

hiiamboris

[18:23](#msg605a32362beb1e1da3c6d3b2)E.g.

```
widths: #(
   default 100
   1 200
   2 300
   3 10
   100000 50
)
```

[18:24](#msg605a327488edaa1eb8d6ec7d)Model is if no sizes are customized (only default key present), it's division (optimization). Otherwise I'll have to sort keys and walk the map.

greggirwin

[18:27](#msg605a32f78478e061b95602d3)So it's not that you really care if there's just one, but if there's an entry for a key or not. If not, use the default. And you want to avoid `find` for performance reasons.

hiiamboris

[18:27](#msg605a3319bc554b42d61c7066)No. I do care ;)

[18:28](#msg605a333888edaa1eb8d6edf2)

```
locate-line: function [level [integer!] "pixels from 0" array [map!] "widths or heights"] [
			guess: level / (def: array/default) + 1
			if 1 = len: length? array [return to 1 guess]	;-- special case - all cells are of their default size
			keys: sort keys-of array
			remove find keys 'default
			#assert [keys/1 > 0]						;-- no zero or negative row/col numbers expected
			repeat i len [								;@@ should be for-each
				size: array/(keys/:i)
				guess: guess + (size / def - 1)
				if i >= guess [return to 1 guess]		;-- guess is correct, since the rest is beyond it
			]
			none										;-- level is bigger than the whole size
		]
```

(not tested yet though)

[18:29](#msg605a337568921b62f47fd35d)Side note: funny how gitter manages to screw up tab indentation on `if` and `repeat` lines. Epic. So many years of progress.

greggirwin

[18:39](#msg605a35c4c1e10242c5bb49a3)I get it now. My brain was headed down a hierarchical/scoping model, where the default is the next level up (e.g. table priorities of cell/row/col/default sizing). Is there a specific reason you keep the default in the map, rather than separate (i.e. then use `empty?`? Or use a sorted key-val block rather than a map which could then let you use a range search and sum, but that's going OT for now. :^)

hiiamboris

[18:41](#msg605a36589ebdfd16409333d8)To keep default - no reason other than I think this is more straightforward from the user's perspective. Sorted block would have to be backed up by RS to justify it's usage.

greggirwin

[18:43](#msg605a36cb9ebdfd164093349a)`Single?` for maps is something to keep in mind, but I'm not ready to commit to it right now.

## Wednesday 24th March, 2021

rebolek

[10:35](#msg605b15fbac0fd631ca8b06a5)I’ve made Red Docker image, so if you’re on macOS Catalina and newer or want use Red in Docker for whatever reason, you can: https://hub.docker.com/repository/docker/rebolek/red

If you want to run Red locally in your current host’s directory: use this:

```
docker run -it  -w /app -v "$(pwd):/app" rebolek/red
```

I’ll add the info to my Wiki.

[10:37](#msg605b166e3b9278255bcd9fe5)The image is based on Debian currently, I want to use some smaller distro instead, but need to find some appropriate first. I thought about using Alpine, but Alpine can’t run Rebol, so isn’t able to compile Red. If you have any tips for small distros, I’m really interested.

Oldes

[16:23](#msg605b67863b9278255bce8d8f)When reviewing Red's compiler (written in Rebol2) I see, that \[it is using non typeable words](https://github.com/red/red/blob/6378183233387d79c0b514511923c6cf51e42691/system/utils/profiler.r#L85-L103). I wonder if it is feature which should be available in Red as well?

rebolek

[16:24](#msg605b67afc1e10242c5be97b7)I’m against it :-)

hiiamboris

[16:33](#msg605b69e028e6153d723ea313)I thought I'd hack it but..

```
>> w: to word! to issue! "<s>"
== <s>
>> get w
*** Script Error: <s> has no value
*** Where: get
*** Stack:

>> set w 1

*** Runtime Error 1: access violation
*** at: 75658E30h
```

[16:33](#msg605b69f2f07ffa1eb561e1b0)):

greggirwin

[16:34](#msg605b6a168478e061b9596276)I think the same thing can be achieved with something like `gensym` or using unicode characters, maybe from the `specials` range. Generating them means you need control for reproducibility.

`#"^(FFFC)"` is interesting.

Oldes

[16:40](#msg605b6b7768921b62f4832233)@greggirwin that could work... good idea.

```
>> w: to word! "^(FFFC)s"
== ￼s
>> sw: to set-word! w
== ￼s:
```

greggirwin

[16:42](#msg605b6be52beb1e1da3ca2d89)

```
gensym: func [/with 'word /reset /local count] [
	count: [0]
	count/1: add 1 either reset [0] [count/1]
	to word! append to string! any [word "g"] count/1
]
loop 3 [print gensym]
gensym/reset
loop 3 [print gensym/with #"^(FFFC)"]
```

hiiamboris

[16:42](#msg605b6bef563232374c3f6cbe)`￼s` is a lexically valid word though so may (in theory) clash with the user code

greggirwin

[16:44](#msg605b6c649ebdfd1640968831)Of course. The question is whether it's worth supporting unlexable words to prevent that rare case. How far have other langs gone by using `__` prefixes and just telling people not to do that themselves.

[17:13](#msg605b735768921b62f4833996)https://www.compart.com/en/unicode/category/Ps

```
gen-sym: func [/with 'word /reset /no-count /local count] [
	count: [0]
	count/1: add 1 either reset [0] [count/1]
	; Using codepoints here because my editor doesn't like the characters.
	; Editing alignment goes wonky for the insertion point.
	to word! rejoin [
		#"^(2989)"				; #"⦉"  left binding bracket
		any [word #"^(1F70)"]	; #"🜀" aether :^)
		either no-count [][count/1]
		#"^(298A)"				; #"⦊"  right binding bracket
	]
]
proxy-sym: func [word][gen-sym/with/no-count :word]
loop 3 [print gen-sym]
loop 3 [print gen-sym/with #"^(FFFC)"]
print proxy-sym 'a
print proxy-sym 's
```

[17:17](#msg605b7416a7dfe1372ef55832)What's interesting, ignoring the playful aspect above, is thinking about this in the context of code generation, compiler stages, and IL.

## Friday 26th March, 2021

Oldes

[16:59](#msg605e13049ebdfd16409e15a8)In Rebol2 it was possible to do:

```
>> append #{} 'aha
== #{616861}
```

That is not allowed in Red and Rebol3... is it ok? It looks that Red compiler (written in R2) is using this \_feature\_.

## Sunday 28th March, 2021

greggirwin

[04:17](#msg606003653a9448256c352789)It's OK. Just `form` the word first. Or use `redbin` if you need to save word values in binary form.

## Wednesday 31st March, 2021

Oldes

[16:25](#msg6064a283af65792631bae54f)It looks that the biggest obstacle when porting Red compiler from Rebol2 to Rebol3 is not missing `struct!` \[as I was claiming](https://gitter.im/red/red?at=605450faf07ffa1eb54f933e):point\_up: but difference between \_string based `issue!` in R2_ in opposite to \_word based `issue!` in R3\_.

greggirwin

[17:43](#msg6064b4b76b7b535ee1ebe74e)@dockimbel would have to say. I think he noted things in the past but don't remember where now.

Oldes

[18:01](#msg6064b8e5cfd0b814ebb2a9a6)I can say it.. because I've spend already a few hours trying to port the compiler from R2 to R3 ;-) It's not unsolvable... it's just one of many obstacles, because in R3 one must use `ref!` instead of `issue!` (as it would be needed when porting to Red one day)

[18:02](#msg6064b92447b0403241af8b31)Although when porting to Red... one would not need these decorations probably.

[18:05](#msg6064ba0714188a5edfd936f9)There is also many small obstacles.. like that in Rebol2 is `select/skip` returning a value inside a block, while in Red and R3 it's just the value. And so on.

pekr

[18:09](#msg6064bada47b0403241af8f2d)@Oldes you should not spend time bringing compiler from R2 to R3, but from R2 to Red. It generates code, right? So what is missing for a self hosting?

Oldes

[18:15](#msg6064bc24f8add214d809bd8f)To be honest, porting to Red would be wasting of my time as I don't believe such a huge change would be ever accepted (I bet than Nenad have own plans how it should look like). Porting to R3 is a good test case for R3 itself as there is not a more complex Rebol code than Red compiler.

pekr

[18:18](#msg6064bceb679f465566b3ddde)Yeah, from such a point of view, it makes sense ....

greggirwin

[18:18](#msg6064bcff8ebd68695059843b)Thanks for the R&amp;D @Oldes! If it hadn't already been pretty much set in stone, I would have kept issue as a string. Not sure if I'd want ref to be a word. That's one of the few breaking changes I think was a mistake. Carl, AFAIK, didn't ask or analyze, but made the case based on his own use of issues as keywords. Even there it's simply an optimization. I used them for all kinds of things, including GUIDs, record IDs, phone numbers, and hashtags. But that's water under the bridge.

[18:20](#msg6064bd518ebd68695059856d)Porting to R3 is a \*great* test case. @dockimbel does have ideas, and plans to use lessons learned to make the new Red compiler better.

Oldes

[19:27](#msg6064cd396831fa2647da6391)Another interesting obstacle is that in R2 there is: `round/ceiling 1.2` resulting to integer, while in R3 and Red it is still decimal.

## Sunday 4th April, 2021

greggirwin

[23:32](#msg606a4c740508990a25d471c8)Paths are series values, and `swap` works on series. Do you think `swap` should work on paths?

```
>> p: 'a/b/c/d
== a/b/c/d
>> swap at p 2 at p 4
*** Script Error: swap does not allow path! for its <anon> argument
*** Where: swap
*** Stack:
```

[23:33](#msg606a4cb40147fb05c5d8895f)I found this via @hiiamboris' second permutation option, which uses `swap`.

[23:35](#msg606a4d5a657d022d5a6144f9)My first instinct was "of course it should", but some of you may do really clever things with paths, where the first element is special, so I thought I'd put this out there for comment to see what horrible consequences you can all dream up.

## Monday 5th April, 2021

toomasv

[05:45](#msg606aa408458fc52d5f2eed31)As first element of path mostly is special (function, object, map, block...) IMO it is justified to treat it differently from other series. It is non-special only if you treat it as a block of values, and then you can do weird things with it (e.g. `as path! [1 a %c] ;== 1/a/%c`).

hiiamboris

[07:31](#msg606abcd415cd52559d7e305f)+1 "of course it should"

[07:32](#msg606abd1b9ecc541fc8d9abda)There's always a method to do crazy things, but we shouldn't make it harder to do normal tasks

[07:36](#msg606abdfe9ecc541fc8d9add6)Else we end up forbidding swap on tags, which also have a special first char.

greggirwin

[07:43](#msg606abfb115cd52559d7e3819)Tags don't have a special first character. They're just strings. Paths have a special first \*value\*.

hiiamboris

[07:58](#msg606ac3229ecc541fc8d9b9cf)you can't start literal tags with `<<` or `<-` or `<(space)` that makes it special, same as you can't start paths with integer

greggirwin

[08:03](#msg606ac4560508990a25d56d6f)Ah, I see what you mean.

toomasv

[08:50](#msg606acf7356ddab18d72dd61e)While I've nothing against paths being swappable, and leaving sanity checking to user, I still think first element in path is special in much more fundamental way. While any char that \*\*can\** be in first position in tag is just as any other char in tag, first element in path is same as others only exceptionally. Path is hierarchical series and this makes it different.

hiiamboris

[09:07](#msg606ad33adb595f5599d7227e)That's just most common interpretation though. Dialects may not use any hierarchy.

GiuseppeChillemi

[09:59](#msg606adf9c1dbd860a23317b22)Please, leave the freedom. Paths can be used in dialects in many ways. Even to keep table headings `name\surname\age` in a joined form.

[10:01](#msg606adffad765936399d57ee3)The if you swap columns you may need to swap the first element too.

[10:02](#msg606ae03fd765936399d57f5a)\*If you swap columns you need to swap first path elements too

[10:03](#msg606ae055ed315705c29b824f)(I am on mobile, can't correct)

[10:14](#msg606ae2ffd765936399d58584)And also, please keep usage patterns as wide as possible in Red. You have removed `find`on objects and now I must perform a `words-of object` before `find`on every run of a function which checks if a `method` exists. I am working on a command server which executes functions aggregated in loadable object libraries, so the need to ckeck if the function exists. Performing a `words-of`before `find` at every call, of the function that query objects members, hits performance and readability.

hiiamboris

[10:55](#msg606aecae56ddab18d72e1b9e)`in obj 'word`

GiuseppeChillemi

[13:07](#msg606b0b771dbd860a2331e56a)Yes but I use either functions in blocks and functions in objects so I would like to have just one method and not add conditional code to do the same thing  
I have worked for long time on a `SET` which works on multiple types of data. Having the management code split on different access methods has created a lot of confusion and cognitive overwork. I was going crazy managing all cases because of the multiplication created from `SOURCE-TYPE x DEST_TYPE x REFINEMENTs x ACCESS_METODS x CASE_CONDITIONS`. To handle this and simplify everything I have put even single words on blocks and used a couple of `FIND`s and I was able to complete my work on the function.

[13:14](#msg606b0d2656ddab18d72e6912)I admit as a human I have a limit managing multiple combinations and on that work I have reached it multiple times.

[13:16](#msg606b0dab63fb5651c1f013e3)I still can't imagine how Doc managed all the states combinations in the new lexer. My admiration goes to his skill.

hiiamboris

[13:21](#msg606b0edc15cd52559d7ef67b)Now you have a glimpse of what language design is ;)

GiuseppeChillemi

[14:21](#msg606b1d001dbd860a2332120e)It's not easy, every time I read your discussions on GitHub, I realize how difficult is to make a decision. A choice needs a problem to be observed under different lights and scenarios. Every brain there enriches the discussion and gives his experience.

greggirwin

[14:50](#msg606b23c03153ce63a3be59e4)@GiuseppeChillemi this is where tiny wrappers can help. If the language doesn't support it, at least it can be hidden from most of a code base.

GiuseppeChillemi

[15:35](#msg606b2e5d9ecc541fc8dac2d6)Yes, it's an idea. Like `index??` not giving error `NONE`

greggirwin

[15:38](#msg606b2f0f0147fb05c5da8c48)Right.

## Sunday 11st April, 2021

lylgithub2021

[13:10](#msg6072f542c60826673b993f0f)

```
>> parse "abce" [(i = 0) "a" (i = i + 1) to end]
*** Script Error: i has no value
*** Where: =
*** Stack:
```

[13:10](#msg6072f550d7953918614f6f89)why

hiiamboris

[13:12](#msg6072f5bc46a93d4a19bcbf06)Please use the /help room.  
`i` has no value if you haven't assigned one. In Red `i: 0` is an assignment.

lylgithub2021

[13:14](#msg6072f61ec60826673b9940f5)Thank you. and Where is the /help room?

hiiamboris

[13:14](#msg6072f628c60826673b994102)https://gitter.im/red/help

## Tuesday 13th April, 2021

greggirwin

[00:41](#msg6074e8a91f84d71853b302af)For the security minded, there are some good notes about 2/3 through \[this](https://www.changelog.com/podcast/432) (I'm skimming the transcript). When we get ports, and start doing networking in Red, security it going to be a high priority. That may mean limiting features and flexibility. When we look at special cases ("I just need a little escape hatch to execute custom code and work around this security feature."), we will push back hard. Security is critical, convenience for special cases is not.

And the best thing to prevent phishing attacks? Something like a Yubikey.

zentrog:matrix.org

[04:12](#msg60751a21a9dd556843d51497)I haven’t seen too much news about this, but I think it’s a pretty important security issue. Should be top of mind for anyone who wants to create a package manager: \[dependency confusion](https://medium.com/@alex.birsan/dependency-confusion-4a5d60fec610)

greggirwin

[04:16](#msg60751b31d79539186154ad4e)And that would be...me, if you just `replace s "wants to" "must"`. Thanks for the link, I'll read it tomorrow.

[04:17](#msg60751b4b1f84d71853b37739)And add it to the ~30 links I already have on the subject.

[04:19](#msg60751bcc1f84d71853b37836)It absolutely terrifies me how this is still done today. If it was any worse, you'd see me on a street corner with a sandwich board reading "The End is Near", not justified because...`left-pad`.

zentrog:matrix.org

[04:44](#msg607521a8a9dd556843d525d0)It’s actually a really simple attack, but resolving it doesn’t seem very simple. Think of a company hosting their own private package repository, but also uses some public packages. The attacker needs to determine the name of a private package. Then they upload a same-name package to the public repo with a higher version. The thing that makes it really scary is some package types have install phases that could compromise a build server.

greggirwin

[22:14](#msg607617bdb6a4714a29c1d71f)https://www.redlake-tech.com/blog/2021/04/diagrammar-1.2.2/

## Thursday 15th April, 2021

GalenIvanov

[09:25](#msg6078067581866c680c250638)\[Arturo](https://arturo-lang.io/) has its site updated with documentation and playground and all looks very nice.

drkameleon

[17:10](#msg60787373a9dd556843ddf829)@GalenIvanov Just happened to discover the post here. I've worked hard on the project, so I definitely appreciate the mention! (Needless to say, any other feedback is more than welcome...) :)

hiiamboris

[17:16](#msg607874e446a93d4a19cacf42)@drkameleon Looks like you've already made what Carl \[only planned](https://altscript.com/?p=116), even if with a bit different syntax :)

drkameleon

[17:22](#msg6078765197cf50674664878a)@hiiamboris I obviously know about the project (now) :). The funny thing is... when I started out, my main sketches where about something like https://sdlang.org/ - only, a "real" language.

hiiamboris

[17:38](#msg60787a05dc24646812c2c1c2)looks C-inspired ;)

[17:43](#msg60787b27a2ac0d38e7ba8a0f)@drkameleon How much OS API are you using? Would it be possible to wrap your interpreter with \[APE](https://justine.lol/ape.html) format so that single binary would work on a few platforms?

GalenIvanov

[18:00](#msg60787f4bae90f36840826f5c)@drkameleon Congratulations for the great job with Arturo!

greggirwin

[19:03](#msg60788e1f969f8b38ee7ebea9)\*Really* nice @drkameleon. :+1:

[19:14](#msg6078907bdc24646812c30105)I noticed your `version` type says "SemVer compliant". SemVer 2 adds quite a bit beyond numbers (build and prerelease info), so you may want to note that.

[19:15](#msg607890e8c60826673ba78de1)Is the string dash notation something from Nim? What is the main use case for that?

[19:40](#msg607896aa969f8b38ee7ed703)Wonderful list of examples as well.

## Friday 16th April, 2021

planetsizecpu

[04:41](#msg6079155e46a93d4a19cc5cbe)Well done @drkameleon push hard.

drkameleon

[07:36](#msg60793e85b9e6de24d63b0312)@GalenIvanov @greggirwin @planetsizecpu Thanks a lot for your kind words. I appreciate it - honestly. And doing my best :)

[07:37](#msg60793e9cd7953918615f725d)&gt; @drkameleon How much OS API are you using? Would it be possible to wrap your interpreter with \[APE](https://justine.lol/ape.html) format so that single binary would work on a few platforms?

This looks interesting. I'll certainly have a look into it. ;)

[07:41](#msg60793f971f84d71853be4ee3)&gt; I noticed your `version` type says "SemVer compliant". SemVer 2 adds quite a bit beyond numbers (build and prerelease info), so you may want to note that.

Well, it's one of those cases where the documentation falls a bit short.

Actually, what you suggest has already been implemented. (I'm not sure it's 100% perfect yet, but it \*is* quite SemVer-compliant).

Have a look: https://arturo-lang.io/playground/?mydYTg

[07:43](#msg6079401e97cf506746667a22)and that's one of the intended uses (with embedded comment code): https://arturo-lang.io/playground/?7Hkh79

[07:46](#msg607940c7969f8b38ee806f64)&gt; Is the string dash notation something from Nim? What is the main use case for that?

No, it has nothing to do with Nim. Basically, the inspiration is YAML front matter and templates (e.g. for static website generation).

For example this could be a perfectly valid template data file (and Arturo code, at the same time):

https://arturo-lang.io/playground/?Fy1Fne

DideC

[12:38](#msg6079853cc60826673ba9e218)Please, is there any red script available to convert ANSI texte file to UTF-8 ?

hiiamboris

[13:37](#msg60799323d79539186160460c)ANSI text or just ISO-8859-1 one?

DideC

[14:01](#msg607998ad06e2e024e85904ac)iso-8859-1, yes !

rebolek

[14:05](#msg607999b681866c680c29293f)@didec yes

[14:06](#msg607999efa9dd556843e0e0c2)see `codepage.red` in https://gitlab.com/rebolek/castr/

[14:08](#msg60799a51a9dd556843e0e1ad)usage is `read-cp`

[14:08](#msg60799a66b6a4714a29cae824)it supports 11 most used non-CJK codepages

[14:09](#msg60799a9a97cf506746675d21)you also need the `%codepages` file with the conversion tables

[14:10](#msg60799ad106e2e024e8590b79)and if your ISO-8859-1 file comes from internet, you can use the `send-request` function from `%client-tools.red` which does the conversion automatically

hiiamboris

[14:12](#msg60799b4dd795391861605b8e)iso-8859-1 can be decoded simply with a loop of `to char! to integer! byte` calls  
which is far from efficient, but dependency-free

rebolek

[14:19](#msg60799cf1c60826673baa2147)Right.

## Saturday 17th April, 2021

GiuseppeChillemi

[14:36](#msg607af26d969f8b38ee84a881)&gt; @GalenIvanov Just happened to discover the post here. I've worked hard on the project, so I definitely appreciate the mention! (Needless to say, any other feedback is more than welcome...) :)

Nice but I ask to myself why another language and not joining the team to improve Red/Rebol3.

greggirwin

[16:24](#msg607b0ba7a2ac0d38e7c0ed36)@GiuseppeChillemi we then have to ask ourselves, why don't we just join Rust, Go, Zig, Nim, or some other project.

[16:27](#msg607b0c5c969f8b38ee84e63f)Of course @drkameleon has shown commitment and deep language skills with his work on Arturo, so if he was ever looking for work, or we wanted to port Red to Nim, there's always a possibility we could work together in the future.

GiuseppeChillemi

[20:04](#msg607b3f30b9e6de24d64001f8)Because he has used the words "similar" and "inspired"

[20:04](#msg607b3f51c60826673bae2129)The others are neither similar nor inspired

greggirwin

[21:01](#msg607b4cbd969f8b38ee857bf2)OK then, why didn't we join an R3 or other Redbol project? We can be similar but not the same. And while we want to be self-hosting, few other languages do. Arturo is written in Nim, and has an internal VM and bytecode compiler, so while the syntax may look similar in \*some* cases, it's actually quite different. In some ways it is very much a Redbol language, but in others (math precedence for example). And the syntax is far enough from Redbol langs that porting code will be a bit more work. I don't know if Arturo is, or aims to be, homoiconic, but that's another possible difference.

I hope we can all learn from each other, taking the best of what we learn from each project and language, to improve software development for everyone.

GiuseppeChillemi

[21:43](#msg607b569a46a93d4a19d1fd5e)Yes, mine was not a complaint but just a curiosity.

[21:46](#msg607b5737ae90f36840896c17)I hope one day we can all converge towards a unique project with the best feature of every language derived/inspired by Rebol.

## Sunday 18th April, 2021

pekr

[05:37](#msg607bc57fd79539186165586f)Not sure it belongs to this channel though, which belongs to the Red lang development itself ...

greggirwin

[06:44](#msg607bd54b81866c680c2e640a)This is the main channel, so it will end up with a range of topics.

konglinglong

[14:16](#msg607c3f3506e2e024e85f1f36)read does not support GBK? What's the solution?

```
>> read %decode_result.txt
*** Access Error: invalid UTF-8 encoding: #{D6D0B9FA}
*** Where: read
*** Stack:  

>> read/as %decode_result.txt 'GBK
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: read
*** Stack:
```

hiiamboris

[15:03](#msg607c4a5b06e2e024e85f356f)it's not that hard to write your own decoder :)

btiffin

[23:35](#msg607cc252b6a4714a29d21c65)Hello, crew.

So, my ex asked me to create an archive copy of an email account. I bragged about setting up a few lines of REBOL or Red. Umm, now I find out I'm old and can't remember things. Setting up popspec.r and mailsave justs spins on the connection. So, I'm missing a critical bit or newness that probably happened in the last 11 years or so that is blocking simple REBOL access? Or is it deeper? Should I focus on learning more Red? (i.e. can Red handle POP3 and IMAP protocols yet?)

[23:37](#msg607cc2b246a93d4a19d5142f)Do I move this type of newbie level question to chit-chat?

## Monday 19th April, 2021

greggirwin

[01:03](#msg607cd6dba2ac0d38e7c4ca90)The issue is likely that R2's ESMTP protocol can't get modern mail servers to trust it. It's terribly out of date.

btiffin

[02:47](#msg607cef2f2e5574669b45e4f8)Does that effect IMAP or POP3 retrievals?

GiuseppeChillemi

[02:54](#msg607cf0ea55d78266a652f27f)@btiffin  
I have just made a similar request. Some more info are there :point\_up: \[7 aprile 2021 00:30](https://gitter.im/red/help?at=606ce1010508990a25dad6a9)

btiffin

[03:08](#msg607cf416969f8b38ee88fb20)Thanks for the hints, gentlemen. I'll keep trying some things.

drkameleon

[08:06](#msg607d3a19b9e6de24d64445f3)@greggirwin @GiuseppeChillemi @pekr First of all, thanks a lot for all the kind words.

Trying to avoid to over-pollute the Red community with something not-so-relevant, I believe I owe an answer.

I think the answer - or at least mine - to the rather common question "why another language?" is that none of what already exists seems to cover what you are looking for, so... you set off to build it yourself. (usually failing, rarely succeeding).

In my case, as I have already mentioned, yes, I did know about Rebol and Red, but little more than the name. So I set off to build something that would cover what I thought I needed. (And yes, that something, for some weird reason, ended up having far too many similarities with something that already existed as I later discovered). But even that, is interesting. I mean... the same approach but by a different set of eyes.

For me, that's how things in general improve: the more ideas around, the better (think of it: it's impressive how, even projects that didn't have much success themselves, may have in turn influenced immensely other projects - and I'm not even talking just about software - that turned out to be far more popular or significant). So... I'd stick to that. The more ideas moving around freely, the better. I don't see it as competition. I never did. It's just (slightly or not-so-slightly) different approaches to the same problems. And everyone benefits in the end. ;-)

hiiamboris

[08:16](#msg607d3c76b9e6de24d6444b64)True. Diversity covers more ground (in both senses: more followers and more application domains), in the end getting a part of global audience away from mainstream languages and their complexity. Good job!

drkameleon

[08:19](#msg607d3d271f84d71853c78469)@hiiamboris Couldn't agree more. I could name an endless list of less-than-optimal but ultra-mainstream languages that I would definitely not mind at all if they got less attention. And if the reason for that is Red, or Arturo, or both, it's not an issue. ;)

planetsizecpu

[08:55](#msg607d45752e5574669b46a9db)Welcome! @btiffin

DideC

[12:23](#msg607d764bae90f368408e1139)@rebolek @hiiamboris Thanks ! The short version is enough for my need.

## Tuesday 20th April, 2021

pontaoski

[20:01](#msg607f3304dc24646812d32189)has anyone had any luck running red on 64-bit fedora?

hiiamboris

[20:03](#msg607f33a706e2e024e8667f56)Tried following instructions \[on the download page](https://www.red-lang.org/p/download.html)?

pontaoski

[20:05](#msg607f33f11f84d71853ccbfd1)yes

hiiamboris

[20:05](#msg607f3407d7953918616dcee7)what part failed for you?

pontaoski

[20:05](#msg607f340e97cf506746745f38)

```
❯ ./red
** Script Error: Not enough memory
** Near: script: decapsulate 
if none? script
```

hiiamboris

[20:06](#msg607f343cb9e6de24d6497612)Interesting. Looks like R2 problem.

[20:07](#msg607f349fa9dd556843ee5eb5)Have you tried `sudo ./red`?

pontaoski

[20:08](#msg607f34c0b9e6de24d649770d)that works...

hiiamboris

[20:08](#msg607f34ca06e2e024e8668211)so must be some permission thing

[20:09](#msg607f34f7dc24646812d32750)`red` unpacks the console sources into `~/` and tries to compile it

[20:09](#msg607f3502b9e6de24d6497797)apparently unpacking stage failed

[20:10](#msg607f3551b9e6de24d649780e)when you figure out why it didn't work for you out of the box, please tell us ;)

pontaoski

[20:11](#msg607f355eb6a4714a29d85252)does red require an X server to run

hiiamboris

[20:11](#msg607f356a969f8b38ee8eccea)yep

pontaoski

[20:14](#msg607f361997cf506746746409)time to bonk one into existence on my pure wayland session then

[20:17](#msg607f36caae90f3684092c0e4)oh right i can't do that because it needs root...

[20:23](#msg607f3842b9e6de24d64981be)hiiamboris: i think i identified the issue?

[20:23](#msg607f384ed7953918616ddaf6)sudo red correctly attempts to open itself

[20:23](#msg607f385181866c680c36cd65)

```
openat(AT_FDCWD, "./red", O_RDONLY)     = 3
```

[20:23](#msg607f385d06e2e024e8668ab3)

```
openat(AT_FDCWD, "/home/jblackquill/KDE/usr/bin/plasmashell", O_RDONLY) = 3
```

[20:24](#msg607f3868a9dd556843ee6768)non-sudo red opens a totally incorrect file

[20:24](#msg607f389b2e5574669b4bce1c)wait no that's not how you do a mention on gitter

[20:25](#msg607f389cb6a4714a29d85b03)@hiiamboris

[20:31](#msg607f3a0bd7953918616ddf2f)seems like deleting `_` from the environment fixes it

hiiamboris

[20:38](#msg607f3bc0dc24646812d3387b)Curious..

GiuseppeChillemi

[23:13](#msg607f6007a9dd556843eeccba)While trying to do a mini command server, I am discovering other differences between REBOL and RED:

\*\*Rebol:\**

```
>> probe do [print "hi"]
hi
** Script Error: probe is missing its value argument
** Where: halt-view
** Near: probe do [print "hi"]
>>
```

\*\*Red\**

```
>> probe do [print "hi"]
hi
unset
>>
```

Probe handles unset returned

While

\*\*Rebol:\**

```
>> a: do [print "hi"]
hi
** Script Error: a needs a value
** Near: a: do [print "hi"]
>>
```

\*\*Red:\**

```
>> a: do [print "hi"]
hi
*** Script Error: a: needs a value
*** Where: a
*** Stack:
```

Both behaves the same

greggirwin

[23:15](#msg607f60a21f84d71853cd32cd)Yes, Red is more forgiving with `probe`, by design.

GiuseppeChillemi

[23:16](#msg607f60cf1f84d71853cd335f)I have always thought that any Redbol function returns a value but `Print` seems an exception.

[23:29](#msg607f63f4969f8b38ee8f3fbd)I have seen that `unset?` and `type?` are able to handle this situation, so I can manage it.

greggirwin

[23:35](#msg607f6532a2ac0d38e7cb4987)Functions designed to output to the console often return unset, to keep things cleaner.

## Wednesday 21st April, 2021

GiuseppeChillemi

[00:02](#msg607f6bb055d78266a6596c04)Moving to red/help :point\_up: \[21 aprile 2021 02:00](https://gitter.im/red/help?at=607f6b32dc24646812d3a684)

## Friday 23th April, 2021

loziniak

[20:50](#msg60833314ae90f368409cd70b)

```
>> ?? to-red-file
to-red-file: func [
    {Converts a local system file path to a Red file path} 
    path [file! string!] 
    return: [file!] 
    /local colon? slash? len i c dst
][
    colon?: slash?: no 
    len: length? path 
    dst: make file! len 
    if zero? len [return dst] 
    i: 1 
    insert dst path 
    dst
]
```

What's the point in all this? Wouldn't simple `to file! path` be sufficient?

hiiamboris

[20:57](#msg608334c255d78266a662dfa7)`to file!` simply changes the datatype, does not convert anything.

[20:58](#msg608334f1b9e6de24d653a25f)

```
>> to-red-file "C:"
== %/C/
>> to file! "C:"
== %C:
```

loziniak

[20:58](#msg6083350606e2e024e870b37e)obviously!

[21:00](#msg6083356fa9dd556843f89d45)ah, I see, probably it works differentlyy depending on system. in Windows `?? to-red-file` gives another result, yes?

[21:01](#msg6083359681866c680c40d295)In Linux:

```
>> to-red-file "C:"
== %C:
>> to file! "C:"
== %C:
```

hiiamboris

[21:02](#msg608335f3b6a4714a29e26c2e)hmm.. `??` result is different indeed about 3x bigger

loziniak

[21:04](#msg6083364a06e2e024e870b686)I hope it does not have as much excess code as in Linux version :-)

hiiamboris

[21:05](#msg6083369381866c680c40d71d)also I find linux output quite funny.. I get what you mean there...

[21:06](#msg608336ccc60826673bbf7107)ah I see where that comes from..

[21:06](#msg608336e7ae90f368409ce1a6)https://github.com/red/red/blob/6efcbb5e92127c319e748c41291b26b40f9b3aec/environment/functions.red#L602

[21:06](#msg608336f0c60826673bbf711e)wanna PR a change? ;)

[21:08](#msg6083373a969f8b38ee98ecc8)if you do, remove the 1st line from all versions - it's useless

loziniak

[21:08](#msg6083373f81866c680c40d8bf)looks like a low hanging banana

## Saturday 24th April, 2021

loziniak

[02:02](#msg60837c311f84d71853d77da0)came up with this: https://github.com/red/red/pull/4883/files

ldci

[11:49](#msg608405ba06e2e024e8726705) A detailed version for thermal image segmentation here: http://redlcv.blogspot.com/2021/04/

planetsizecpu

[14:04](#msg6084255497cf5067467edf8c)Great job @ldci interesting how it works

ldci

[14:41](#msg60842e3097cf5067467ef5c3)@planetsizecpu Thanks

## Tuesday 27th April, 2021

ulysses-io

[03:54](#msg60878ae72c5b9d392f353765)So for a project I've been looking for something vaguely at the intersection of python, lisp, and SQL but lightweight and portable like lua. I just found out about REBOL and its descendants yesterday and I feel like I've seen the light (or something dramatic to that effect). Anyone know the status of using Red with javascript/node.js or should I be looking at Ren-C?

pixel40

[06:00](#msg6087a897c1a9210b3c22af3e)@ulysses-io Careful, RED will spoil you :-)

[06:50](#msg6087b437c29ca4049cd9046a) @ulysses-io If you want to Interact with any backend that has a REST api, then you don't need JavaScript. A good example would be WordPress/WooCommerce. You can write everything in RED, as a full desktop program, and then also have the ability to interact completely with the WordPress database, all through REST.

dander

[06:54](#msg6087b5306258d04c53059f99)@ulysses-io Welcome! There is a community member working on a javascript runtime for Red, though I think it has a ways to go. You can follow progress in the \[red.js room](https://gitter.im/red/red.js)

btiffin

[10:07](#msg6087e25ce2b4072e55f49c44)@planetsizecpu Why Thankees.

[10:09](#msg6087e2d2e2b4072e55f49d5e)&gt; @ulysses-io Welcome! There is a community member working on a javascript runtime for Red, though I think it has a ways to go. You can follow progress in the \[red.js room](https://gitter.im/red/red.js)

I need someone to hint me the ways of the libRed.

A fairly low cost way to Javascript in Red is to link in Duktape, or Jsish, or gjs, or...

Once you have the C ABI, \*you have* the C ABI, all of it. These layers can be thin. Like Duktape, Fabrice Bellard has a one file QuickJS now, a little bit of boilerplate, and Red to Quick embedded and back, in a page of code-ish. Then just let people script any js that might be needed (with args) and set a Red word/block on the way out.

Need to find the beginners guide to libRed. I've done a libRed.so link sample for GnuCOBOL, but not to a level of understanding that a binding will require...

[10:26](#msg6087e6d92c5b9d392f362190)Umm, is Start a Thread on the ellipsis the same as a Reply? I wasn't sure how to Reply here. Still aren't.

dsunanda

[10:29](#msg6087e79d0e19524c642a4d25)@btiffin This is an ordinary reply in reponse to you - works fine except when there are several concurrent conversations all being interleaved.

planetsizecpu

[13:25](#msg608810c1a05f8b582a0de6ab)@btiffin I tend to welcome newcomers, but that is the case that I have seen your name writen in the board of maintainers of GnuCOBOL some time ago, as I used COBOL in the mid 80s, it is a pleasure and a privilege to greet you here 😀

Oldes

[13:42](#msg608814cc0dd2e30b30ef4ee8)@ulysses-io you should probably better define, what you would like to do? But the answer probably will be, that Red is not ready yet .. at least before \[IO branch](https://github.com/red/red/tree/IO) merging into the master.

btiffin

[17:18](#msg608847706258d04c53071f37)@planetsizecpu Then more thankees. Before GnuCOBOL I was a REBOL/2 guy. Started the REBOL or the Year Awards, then faded from the scene. Now I'm a babe lost in the woods of too many Red things to learn while wanted to learn it all at once. ;-)

[17:19](#msg608847aac29ca4049cda8ae7)@dsunanda How did you get the 1 reply thingy? \*Excuse the channel noise* I see the sidebar, but what clicky-click sequence is that? The ellipsis Start a Thread thing?

[17:21](#msg60884837da3e853b33d80840)I'm back to wanting to process junk (instead of a syntax error during LOAD). Getting unexpected outcomes, highlighting some basic misunderstandings.

[17:24](#msg608848db2c5b9d392f372ec4)For a trial. What should `load/trap "listing,"` do? I'd expect the \[\[values] pos err] block, but it just errors out instead.

```
>> load/trap "listing,"
*** Syntax Error: (line 1) invalid word at listing,
*** Where: transcode
*** Stack: load
```

hiiamboris

[17:39](#msg60884c4f9b27712e507c84fc)it was broken by new lexer IIRC

btiffin

[17:41](#msg60884ce6da3e853b33d815b1)Ahh, ok. So it's just an interstitial period of feeling crazy then. This has been so tantalizingly close for so many years...

hiiamboris

[17:44](#msg60884d876258d04c53072f03)you can work around it with `transcode/trace` in the meantime

[17:45](#msg60884db1d24b29049788e8f7)https://github.com/red/docs/blob/master/en/lexer.adoc#transcodetrace

btiffin

[17:45](#msg60884dbcbdc0bc32e62056b6)Is this the right channel for noob level questions? For instance, what motivated dumping the counted `for` loop? And is there a Redder way/idiom of coding indexed loop blocks?

hiiamboris

[17:46](#msg60884df99b27712e507c8a07)In https://gitter.im/red/help room we can answer more verbosely to noob questions.

btiffin

[17:47](#msg60884e1bd24b29049788ea0e)I'll move there then, thanks @hiiamboris

hiiamboris

[17:47](#msg60884e4aa05f8b582a0e8933)But `for` question is ok for this room.

[17:48](#msg60884e5a471bee582e1a6412)It's not there because there is no consensus on it yet.

[17:48](#msg60884e64d24b29049788eaab)For example, see https://github.com/red/REP/blob/master/REPs/rep-0101.adoc

[17:49](#msg60884eb1e2b4072e55f5c9db)Redder idiom for now is `repeat i count`, but I'm using `for i start end` myself at times when I need it.

[17:50](#msg60884ed8be3536391593ade8)One other option is add a `range!` datatype and use it as a loop argument. I actually would prefer this option as it would work with `map-each`, `remove-each` and so on

dsunanda

[17:51](#msg60884f2fb38a713b2fb1e711)@btiffin Side-stepping the design issues with FOR, you can borrow FOR from Rebol - it's a mezzanine. Works just fine in Red.

```
r2>  write clipboard:// mold :for 
Red> for: do read-clipboard
```

btiffin

[18:15](#msg608854d9be3536391593bd68)@dsunanda Nice!

And hello Sunanda, long time. Assumerations of the having of the good.

[18:21](#msg60885622471bee582e1a7927)@hiiamboris Yeah, first thing I looked for was range!, but I'm also thinking Red should have simple indexed loops with the three statement blocks internally managed, AND easy ranges. :-) And lightsabers and teleportation, and LOAD anything with a text! fallback datatype. And 64 bits and the 8 minute Learn You Some Red \*Matrix* brain pattern injectors.

[18:25](#msg608857046258d04c53074ae9)Oh, and more Go Doc Go! Loves and assumerations of good. But instead the team gets people like me that come in and ask for more asks without putting in the work. :-)

dsunanda

[18:26](#msg6088573d69231732f4c49e5d)@btiffin Hello! And welcome to Red. It's like Rebol but with some nice advanced features, some blind spots, and the odd gotcha.

btiffin

[18:29](#msg608858189b27712e507ca429)Oh, I've been Redding since day one, two? But, GnuCOBOL still takes the lions share of volunteer time now and I keep losing my Altme credentials during the long pauses in between visits. @dsunanda

We need to reinstate and backfill on some Roty awards, and start in on the Red show, get the votes on a blockchain.

dsunanda

[18:30](#msg6088585dd24b29049789064a)@btiffin A stealth Redder!

pekr

[18:37](#msg608859eb2c5b9d392f3758a5)... abbreviated as an ASTERoid.

btiffin

[19:27](#msg6088658ae2b4072e55f6064a)What's the current trend on thinking about reflective capture? I see `help` has `fetch-help` and `what` has `what/buffer`. If there are still votes that count, I'll opine I'm a fan of `command/buffer`, versus separate words.

hiiamboris

[19:31](#msg608866979b27712e507cc931)If you have any arguments besides personal taste, forward them to @greggirwin . He'll come around in 2 weeks or so. Or change the \[help system](https://github.com/red/red/blob/master/environment/console/help.red) and make a pull request for his review ;)

btiffin

[20:09](#msg60886f7b6258d04c53078e89)Wouldn't just be the help system, I don't think. With a `command/buffer` idiom, pretty much any function that displays console output (?? for instance) could toggle for capture \*without need of a reference manual refresh\*. I think. Sadly, have not been running with current crowd, behind, and not zen with the ways and where performance or complexities might drive decisions.

hiiamboris

[20:31](#msg608874b66258d04c53079c4f)Some Red functions use the `/into` refinement. But mostly those where it's critically important. Even then it's a case where simplicity is sacrificed for an optimization, and I'm no fan of it. `??` or `source` is for debugging / source code inspection, so unlikely will have a use for `/into`.

[20:39](#msg6088769bc1a9210b3c24d38b)Look how many issues we have with those `/into`s: https://github.com/red/red/issues/4109  
And that ticket does not describe the mess that's in Parse.

btiffin

[22:30](#msg6088907d471bee582e1b105c)Hrmm, I was thinking more general console words, words that print and don't return the actual data items, trap those prints. `??` may as well be bufferable. Handy for producing semi-automated docs, and how-to's, at a minimum. The generator type `/into`s at least have the common (if not spiky) idiom.

## Wednesday 28th April, 2021

hiiamboris

[06:45](#msg6089048dbe35363915955d5b)For docs, `help-string` should be enough, no?

greggirwin

[17:11](#msg6089974c6258d04c530a6f7d)While `load/trap` is broken, you can use \[this](https://gist.github.com/greggirwin/91dc025b1c25b9efc24996af0207bde2) and comment on how we can make other versions. @toomasv wrote a slightly different version for use in DiaGrammar.

gltewalt:matrix.org

[17:31](#msg60899bd6bdc0bc32e623943e)For docs help-string is enough, but it isn't obvious that it's available if you aren't looking at help source

[18:10](#msg6089a52dc29ca4049cddf75b)I guess they can see it in `what`, but I did a PR anyway

ldci

[18:24](#msg6089a840c29ca4049cddfebc)Hi everybody. Thermal images segmentation (part 2): http://redlcv.blogspot.com/2021/04/thermal-image-segmentation-part-2.html

GiuseppeChillemi

[18:30](#msg6089a9b669231732f4c7f36d)@ldci Nice!

planetsizecpu

[19:56](#msg6089bdd5da3e853b33dbb010)Superb @ldci

GiuseppeChillemi

[20:00](#msg6089bee2bdc0bc32e623f9bd)Note: when I read: "Travis red/red#4xxx still failing (5592)", I always ask to myself "who is Travis?"

## Thursday 29th April, 2021

greggirwin

[17:38](#msg608aef02bdc0bc32e626ea86)Very cool...and hot @ldci.

## Friday 30th April, 2021

gltewalt

[03:23](#msg608b782ed261cc4d749b7c15)Why would travis fail on that?

greggirwin

[15:21](#msg608c208893ac573bba771dac)Travis has been failing for other reasons for some time.

GiuseppeChillemi

[21:04](#msg608c70f7d964ec553880c782)Who is Travis?

greggirwin

[22:28](#msg608c848720d4f02631951a43)The continuous integration system.

## Saturday 1st May, 2021

giesse

[17:34](#msg608d91420845c416dcba683f)@GiuseppeChillemi https://travis-ci.org/

## Sunday 2nd May, 2021

usdotnew

[01:18](#msg608dfde8963923553ada9d13)Is the OSX binary still 32 bit? I get this error running it:

./red-064: Bad CPU type in executable

The Google says that 2 years ago that was the issue. Is that still the case?

rebolek

[05:44](#msg608e3c2531d2306a0e872354)Yes, there's no 64bit Red yet. To run on macOS, I use Docker.

ldci

[09:44](#msg608e749693ac573bba7c44a6)@usdotnew . You can also use virtualbox with. an earlier macOS version such as Mojave

GiuseppeChillemi

[17:05](#msg608edbc6ff705616c76ab4a5)@giesse Thank you!

## Monday 3th May, 2021

btiffin

[00:44](#msg608f475d20d4f026319b1b18)I started a thread, re load/trap, but I'm not sure how long the sidebar sticks around, and/or who sees what I'm seeing at the moment. @greggirwin

hiiamboris

[08:33](#msg608fb56875aeb43be723ea1e)@btiffin Perhaps this wiki entry is for you :)  
https://github.com/red/red/wiki/\[DOC]-Red-Should...-(Feature-Wars)

pixel40

[10:15](#msg608fcd3020d4f026319c3f25)@hiiamboris Thanks for sharing that link. I found the "JS as a Back End Target" very interesting  
Especially "but the costs... oh, the costs." Doing web Development with multiple languages and frameworks, is just getting plain ridiculous. Coming back to RED, it's like having a Holiday, everything is just there, especially with the upcoming IO features.

hiiamboris

[10:29](#msg608fd087c651cb6a000c7432)Indeed. Our economy has become ridiculous through and through, web being just one facet of it. Let's be grateful to Nenad and all the other enthusiasts whose actions come from sane mind, not corporate greed.

pixel40

[10:45](#msg608fd45bff705616c76cdf4a)Yes, I can't thank Nenad and the RED team, and contributors enough. I have always wondered if it is worth having a database like mySQL written entirely in RED. I mainly use maps! to store text data, and it's fine for small projects, but does it scale? It would be wonderful to have no mySQL. Be nice to have some thoughts, just in case, I am tempted to in the future embark on such a large project.

hiiamboris

[11:03](#msg608fd89498ee821821a79151)No, of course maps won't replace a database, nor they are meant to. But it equally makes no sense to use a database for small tasks that don't require such complexity :)

pixel40

[11:05](#msg608fd90c0845c416dcbf5ae6)Thank You, I just once had a dream that I was using REDPress instead of WordPress. :-)

hiiamboris

[11:06](#msg608fd92920d4f026319c5c03):D

rebolek

[15:59](#msg60901dd4ff705616c76d9d7e)@pixel40 that’s actually not that far away, unless you want also to have all the WordPress bugs, that will take some time :-D

[17:02](#msg60902cc3d261cc4d74a62f82)I have a question. I have an anonymous context that works like a closure, keeping values and functions together with one function exposed using `set ...`. But I now need that function to be reentrant. The main function takes care of all maintenance, it clears values on calling however, when reentering it, it would clear values for the original context also. So I need to clone the context. But the context is anonymous, there’s no need to expose it. So can I clone it from inside and then move to the new context to process with the call? Or is there some simple way that I missed? Do I need to wait for modules and real closures? Or am I damned?

hiiamboris

[17:10](#msg60902e8598ee821821a86d54)`copy self`?

rebolek

[17:12](#msg60902ee7c651cb6a000d610b)@hiiamboris it would need to be `copy/deep self` at least but what next? If I just put everything into a `function!` it would be much easier...

hiiamboris

[17:13](#msg60902f23d261cc4d74a63761)Can't say without looking at the code :)

rebolek

[17:13](#msg60902f4098ee821821a86fcc)let me cook some basic example as the code is not short :)

hiiamboris

[17:13](#msg60902f5331d2306a0e8b80ea)~~Also `copy/deep` has probably no effect on objects..~~ Nvm, it affects deep blocks inside it.

rebolek

[17:16](#msg60902ff44d0065337e4ef0cb)it does, but even if I make a copy, I am still in the old context and would somehow need to move to the new one

[17:17](#msg6090301075aeb43be7251af4)it probably would need another function that would manage it

[17:21](#msg6090312e2cc8c84d850a3042)@hiiamboris ok, I probably cannot came up with a simple example because of how it works: the function uses an inside stack. So when I reenter it, I corrupt the stack. This is what I need to solve - reenter the function but preserve the inside stack of previous call. If the stack was local to the function, there's no problem. But because I'm using poor man’s closure, I have problem.

[17:23](#msg6090317675aeb43be7251dbf)And I need to use this solution because I need some helper functions and functions inside functions are problematic.

hiiamboris

[17:25](#msg6090321793ac573bba804bd6)If you have some point in your code where you `copy/deep self` and return the function of it, what is your next issue?

[17:26](#msg60903244d261cc4d74a63fd5)Also what are you using the stack for?

[17:26](#msg6090325d98ee821821a8790b)Also, let's move to chit-chat :)

rebolek

[17:28](#msg609032cac651cb6a000d6ba5)ok

greggirwin

[17:41](#msg609035b8d964ec5538892c4b)This group is fine for technical design chat like this.

rebolek

[18:13](#msg60903d5cff705616c76df7ab)yeah if we used threads it would probably be fine, but they’re an interesting design

giesse

[19:03](#msg609048fc20d4f026319d869e)@rebolek closures are terribly expensive in REBOL-like languages (have to copy and rebind all the code all the time). IMHO it's better to find a different solution.

rebolek

[20:00](#msg6090565cd5e2793379edb071)@giesse true and I believe I have the solution thatnks to the chat with @hiiamboris . Basically leaving the function’s inner stack untouched on reenter and \[adding stack for | having local] output. It should probably solve my problem.

greggirwin

[21:43](#msg60906e8e2cc8c84d850acfaa)@btiffin I saw your thread briefly, then lost it, and now don't know how to find it without an unread message in it as a link. :^\\

## Tuesday 4th May, 2021

btiffin

[14:47](#msg60915e8275aeb43be727fadf)@greggirwin Yeah, me neither. Oh well, called that a failed experiment. Same old argument I've been giving for opening a potential non-programmer LOAD power. And with a non-pure data fallback, it would be possible to write things like a command based line editor in Red that allowed for Red scripting. A DSL that would allow a Red console user to not worry about mental swaps from Language to Editor and back to Language, as the Editor would be part of the Language. No worries for now. Will await the next cut and see if LOAD/TRAP comes back.

hiiamboris

[15:26](#msg6091678c98ee821821ab72d5)you can do all that with `parse` or `transcode/trace`

btiffin

[16:23](#msg60917505d261cc4d74a95d39)Yep. But a generalized LOAD/ANY with a fallback token capture would make it so much easier, and likely orders of magnitude faster. I keep picking use case examples that may not make all that much sense to a programmer. Imagine a data source, with a teenie bit of out-of-band data, say a stray comma. As is, REBOL and Red LOAD are either 100% combat effective, or 0%. First bit of bad news, and the data source becomes useless for blocking. In code that make sense, be clean or fail the load. With data as data, who cares if 8 tokens out of 100,000 are not clean. Those exceptions can be flagged, and the user still gets all the Red powers of block! parse and all the nifty set theory words. Again, LOAD/ANY is not for code, but for data analysis. Sitting at a console pondering, and refining. In a editor example, the non-pure loadables are just string!. In a genome project, non-pure word! data might be utterly ignorable (say ISBN numbers, or page markers that snuck into the data source). Easy to track, as a block! scanner word could just highlight all the non-pure items. As is, that data source would be limited to string! parse (or require upfront massage), which is far less powerful than getting a block of data with little bits of untyped tokens intermixed.

pekr

[16:38](#msg609178780056b2262c2b3bde)I thought that we have already got more flexibility in loading? Wasn't it even explicitly mentioned in some blog article?

btiffin

[16:39](#msg609178aad964ec55388c4981)Yep, @pekr, but it's broken in current 0.64 versions. LOAD/TRAP errors out instead of actually trapping.

[16:46](#msg60917a50d964ec55388c4da2)Willing to wait for the next cut. Always willing to wait for the next cut. ;-) Red only gets better and stronger as it builds to a 1.0.

rebolek

[16:46](#msg60917a5f93ac573bba8375b8)@btiffin I'm no expert in LOAD/TRAP but if that's the case have you reported the error?

btiffin

[16:54](#msg60917c4cf7e4221825b8bdbf)It's a known problem, as far as my limited current Redness is aware of. I've always tried to treat this kind of change with kids gloves. I'm not out to make @dockimbel feel stressed, or to lessen the purity of code is code and needs to be clean. I've been a bystander for too long now to press too hard on this one. But it would make the lives of a lot of near-programmers quite a bit easier when it comes to data analysis and creating DSLs that are more tolerant of edge case inputs. I think. @rebolek

[17:04](#msg60917e9831d2306a0e8e9aae)I keep falling back to the combat effectiveness term. A stray comma should not stop a tank in it's tracks. It should blare an alarm and keep moving and shooting. Small applications can lean to all or nothing. Larger multi-feature applications should still work, even if one of the features is dangerously bugged, but the 980 other features are still usable. I think.

hiiamboris

[17:09](#msg60917fe5d964ec55388c5c27)Use `transcode/trace`. When it becomes too slow for you (unlikely event), let us know, we'll advice on possible optimizations ;)

[17:11](#msg609180502cc8c84d850d5db2)But do you actually have a real need in that or just sharing thoughts?

btiffin

[17:41](#msg6091874920d4f02631a0a5a9)Kinda. It started when I wanted to analyse the GnuCOBOL FAQ text as REBOL blocks. That didn't work. Let's say I want to analyse some programming language sources, like COBOL and count how many SECTIONs there are. Or in the same analysis session, load some Pascal and look for integers in the source. Or load a weather report scrape, which happens to include some preamble text for copyrights or what not. These are not final result experiments, but the exploration phase. Currently, it's 100% or 0%. What if the task at hand only needs about 95% accuracy to glean relevant factoids from and some slop is not a show stopper. Currently the show stops. This post is not LOADable, because I use commas. But the 20 tokens of junk don't need to stop the load of the other 200 tokens. If this is making any sense. Given a `page: read url`. Who cares if the url data has a comma or two, or a long string of garbage equal signs, I still want to LOAD it, and experiment with UNIQUE, as a set. :-)

hiiamboris

[17:43](#msg609187dad261cc4d74a98e93)Good. Then you'll succeed ;)

btiffin

[17:52](#msg609189c375aeb43be7286da9)As a programmer, yes. Hand those same problems to an Engineer or Office Worker, and they get 0% combat effective LOAD. So, they use Python data science tools instead. Far less powerful, but they don't need to program around junk, as they only get string or number types to start with.

## Wednesday 5th May, 2021

pekr

[08:46](#msg60925b51f7e4221825bac8e4)@hiiamboris could you please again post the link to the parse executavle eperiment, for the CLI puposes? @btiffin there is my long time idea, that in fact parse might be cool as a command line tool and that's what hiiamboris did ...

[08:48](#msg60925bc90056b2262c2d45a1)Wasn't there even other CLI effort mentioned in some blog?

hiiamboris

[15:39](#msg6092bc29963923553ae5bfc1)@pekr https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/parse

pekr

[16:18](#msg6092c5390056b2262c2e5d71)Perfect, thanks ...

ldci

[16:39](#msg6092ca2d0056b2262c2e6c2e)redCV can talk to C++ Pandore lib: https://twitter.com/fjephe/status/1389956792000647171

TimeSlip

[18:47](#msg6092e82631d2306a0e9201ab)@ldci Awesome!

greggirwin

[18:54](#msg6092e9feff705616c7748351):+1:

planetsizecpu

[19:40](#msg6092f4b0ff705616c7749f4a)Well done!

## Monday 10th May, 2021

GiuseppeChillemi

[21:18](#msg6099a33e75aeb43be73b86a1)@ldci Nice work Francois!!!

## Tuesday 11st May, 2021

ALANVF

[00:54](#msg6099d5d393ac573bba9756af)question: does `remove-each` work with `map!`? (or is it supposed to?)

greggirwin

[01:08](#msg6099d91cd964ec5538a04599)Not at this time.

ALANVF

[01:08](#msg6099d92b4d0065337e65c2bb)hmm ok

[01:09](#msg6099d9422cc8c84d85212422)(sounds like a missed opportunity though imo)

greggirwin

[01:24](#msg6099dcceff705616c784ed8e)There's a wrinkle, because removing from a map requires `/key` and the key as an argument for that refinement. Adding `map!` support to `foreach` meant enforcing the `word` arg to be a block of two values. We would have to do the same for `remove-each`, and then use the word the user chose as the `key` reference implicitly. Or do something more involved.

ALANVF

[02:41](#msg6099eed42212f12e7c172b5c)@greggirwin I think going the same way as `foreach` would make sense, since they're already fairly related

rebolek

[06:44](#msg609a27babc138140b3cced10)yes, doing the same as `foreach` makes most sense to me

## Thursday 13th May, 2021

XxTheAlexGamerxX

[11:40](#msg609d1027d523ee3d3e2da714)Is there a red discord?

hiiamboris

[12:41](#msg609d1e6901edef5b50416b46)Nope.

## Friday 14th May, 2021

hiiamboris

[13:21](#msg609e79745ca66330b0419ebc)DRAW BASED WIDGETS project now has reached it's alpha stage, and I welcome interested reducers to play with it ☺

https://gitlab.com/hiiamboris/red-spaces

GalenIvanov

[13:25](#msg609e7a485ca66330b041a09a)@hiiamboris Wow, that's great! Animations show some really nice examples!

snotbubble

[13:42](#msg609e7e2e5ca66330b041a9cd)@hiiamboris and I was just about to go to bed...

hiiamboris

[13:54](#msg609e8116233397424dc11460):D

Respectech

[14:57](#msg609e8fe0c60a604255bbf1a1)That is really cool!

toomasv

[16:10](#msg609ea11301edef5b504516fc)Truly amazing! I wondered at it some time ago and it has grown even further.

loziniak

[16:13](#msg609ea1acd3b89834a73e4def)Fantastic. So bad that http://progress.red-lang.org/ does not catch GitLab projects.

pekr

[17:29](#msg609eb386e263442db829e2f7)@hiiamboris posted to Altme and FB group, thanks a lot for all your work! :-)

hiiamboris

[17:30](#msg609eb3ba233397424dc19850)Thanks for your support guys :)

pekr

[17:38](#msg609eb580233397424dc19de0)I really have to find some time to ding into all of that. What I always missed in VID, was some higher concepts, as grid layouts / screen splitted containers along with resizing, nice typography settings.

As for web design, I have used an Artisteer and it was really nice - allowed to do websites even to ppl like me. Now the same ppl did a NicePage and they provide a "building blocks". You mostly create a website out of the grid design block pre-made and customisable templates: https://nicepage.com/nicepage-review

[17:39](#msg609eb5da5fff1f4a98d81252)I think that our GUI could be called Blocks, as blocks are the basic building elements of Redbol langs :-)

hiiamboris

[17:47](#msg609eb79c2ee2b13d95ab803f)Thanks for reminding me of splitters and for the link. I'll see if anything useful can be picked from there when I have time.

planetsizecpu

[17:47](#msg609eb7c25fff1f4a98d81723)Great job @hiiamboris I will try to make time for test on weekend 😍

[17:49](#msg609eb844617459308f7385ff)That grid widget feels superb!

pekr

[17:50](#msg609eb867e263442db829efd4)There is not many widgets there, but a screenshot of various grids for layouts ...

GiuseppeChillemi

[18:00](#msg609ebab517d35f3d9fc86de5)@hiiamboris Truly amazing job!

greggirwin

[18:19](#msg609ebf48d3b89834a73e9e08)Woohoo! @x8x, can we add @hiiamboris' gitlab projects manually to the progress page?

GiuseppeChillemi

[18:20](#msg609ebf79b10fc85b5697467a)@hiiamboris Just a question, which is the overclock frequency of your mind? Do you use drugs? Are the same drugs of Toomas or other Red team members? You are doing a lot of incredible work on debugging Red and bringing us new technology!

GalenIvanov

[18:21](#msg609ebfc0e263442db82a05d8)Looking once again at the amazing @hiiamboris 's Spiral Editable Field - can we have raster operations on top of `Draw`? I mean blending modes, as well as displacement maps (either software lookup tables, or realtime shaders) - this way the spiral effect could be achieved relatively easy. I'm starting imagining a hyperbolic GUI :smile:

greggirwin

[18:24](#msg609ec059d523ee3d3e31c94a)@GalenIvanov I think you mean hyper-Bolek. :^)

GalenIvanov

[18:27](#msg609ec115e263442db82a0913)@greggirwin Of course! :smirk:

greggirwin

[18:34](#msg609ec2c0617459308f73a08d)There goes my Friday. Thanks for the quickstart doc @hiiamboris. :+1:

[18:45](#msg609ec53417d35f3d9fc8896b)@hiiamboris does the leading `*` in `list-*aces*` denote `f | sp`, for face or spaces?

[18:59](#msg609ec88f233397424dc1cf1b)For those who want to play, be sure to clone @hiiamboris' `common` repo as well.

[19:00](#msg609ec8c45fff1f4a98d84540)I hadn't seen the web demo (draw spiderweb). Very fun @hiiamboris. :^)

hiiamboris

[19:03](#msg609ec994b10fc85b569761f5)&gt; @hiiamboris does the leading `*` in `list-*aces*` denote `f | sp`, for face or spaces?

Exactly :)

[19:05](#msg609ec9e1e263442db82a2030)&gt; I hadn't seen the web demo (draw spiderweb). Very fun @hiiamboris. :^)

I wanna add a spider there sometime later. The quest will be to locate it :)

greggirwin

[19:05](#msg609ec9f401edef5b50457d1f)On an infinite web.

hiiamboris

[19:07](#msg609eca696a950f3d46e5b298)Yes, but it all depends on the random distribution chosen :) And luck..

greggirwin

[19:10](#msg609ecb16b10fc85b569765bc)With button style, if I mouse down, move off the button, then mouse up, it still triggers a click. Just FYI.

hiiamboris

[19:11](#msg609ecb50c60a604255bc930e)Yeah. I didn't decide if I should prevent it?

greggirwin

[19:11](#msg609ecb6017d35f3d9fc896f4)The dotted focus indicator on them is nice. :+1:

[19:12](#msg609ecba0617459308f73b70f)I think it's standard UI practice to let the user move off, otherwise there's no way to not click "Format Hard Drive" when you meant to click "Make me a Cappuccino", which was right next to it.

[19:13](#msg609ecbc101edef5b5045836e)Unless you support handling `escape` to undo the button's pressed state.

hiiamboris

[19:13](#msg609ecbf4d523ee3d3e31eb2d)well one could pull the plug before releasing the button :)  
but I guess you're right, I'll add it to my other 300 or so todo plans

greggirwin

[19:16](#msg609ecc7a233397424dc1da60)Grid cell spanning is very nice too. %grid-test-3.red and %grid-test-4.red for those who are interested.

[19:18](#msg609ecd0dd3b89834a73ec269)Maybe also note for people why %grid-test-5.red is slow.

[19:23](#msg609ece426a950f3d46e5bc53)I know the comments note it, but it's an important point since people may try to go crazy with the nesting feature.

hiiamboris

[19:40](#msg609ed2215ca66330b0428442)You mean note it in the demo window itself?

greggirwin

[19:41](#msg609ed27d17d35f3d9fc8a915)Either that, or in the readme. In the window would be contextual.

hiiamboris

[19:45](#msg609ed34317d35f3d9fc8aa99)I have a feeling you've jumped right into the test files without looking at https://gitlab.com/hiiamboris/red-spaces/-/tree/master/tests page, which explains the slowdown

greggirwin

[19:47](#msg609ed3e7d3b89834a73ed6b5)You explained it to me, and there are short comments in the code, but people will want to run it, not knowing that, and unfairly think "Man, Boris' code is almost as slow as Gregg's".

hiiamboris

[19:51](#msg609ed4d35ca66330b0428bf5)So this is not an explanation enough?  
&gt; Stress test. A grid-view that contains itself in each cell, truncated at some depth. Very slow. At depth=6 it has to render 4^6 = 4096 cells. Depth=7 contains 16384 cells, and 8192 scrollers, and takes about a minute to render.

greggirwin

[19:55](#msg609ed59fd3b89834a73edb34)I missed that. Where is it?

[19:56](#msg609ed5d82ee2b13d95abcdd7)I haven't gotten through the docs yet.

hiiamboris

[19:57](#msg609ed6196a950f3d46e5cfb9)Thought so. It's in the link above :)

[19:57](#msg609ed637e263442db82a3eca)I guess I'll add a "This is gonna take a while" warning for the bravest like you :)

greggirwin

[19:59](#msg609ed6be5ca66330b0429022)Got it, thanks. Yes, buried way to far for the impatient. :^)

hiiamboris

[20:40](#msg609ee02dd3b89834a73ef4c0)Fixed

greggirwin

[21:05](#msg609ee633416d8734b9472272)Thanks. Big, red print. Hard to miss now.

## Saturday 15th May, 2021

ldci

[06:29](#msg609f6a57233397424dc333e9)@hiiamboris Really nice approach. Unfortunately macOS is nit fully supported. Error in modulo such as `ASSERTION FAILURE: [nan? r: modulo/trunc 123 1.#INF 'r] *** User Error: "r is 123.0 »`

hiiamboris

[07:19](#msg609f761ee263442db82ba280)Thanks for the report. I fixed that yesterday I think, try updating (;

ldci

[07:28](#msg609f7839e263442db82ba643)@hiiamboris : OK I’ll test ASAP

hiiamboris

[07:54](#msg609f7e1ab10fc85b5698f137)What I find funny is that this is not Red, but libc bug. After all these 35 years since ieee754 standard came out, it's still buggy.

ldci

[09:24](#msg609f935501edef5b50473a92)Nobody’s perfect:)

[13:28](#msg609fcc60c12aec4aa2c825aa)@hiiamboris New error with macOS `#including %styles.red *** Script Error: + does not allow none! for its value1 argument`

[13:36](#msg609fce422ee2b13d95adeec1)@hiiamboris under macOS svmc: system/view/metrics/colors = none

hiiamboris

[14:08](#msg609fd5e9c60a604255bee17c)OK so Mac backend is behind GTK even. Try again now @ldci . Also see https://gitlab.com/hiiamboris/red-spaces/-/issues/1 if it helps

ldci

[14:12](#msg609fd6cec60a604255bee3b1)@hiiamboris : for macOS and Linux system/view/metrics/colors not yet implemented in platform.red. I made some modification in your code. in order to get an usable version for Mac.

hiiamboris

[14:21](#msg609fd8d1c12aec4aa2c84425):+1:

ldci

[14:32](#msg609fdb83233397424dc4372c)@hiiamboris Last error

```
#including %debug-helpers.red
*** Driver Internal Error: Script Error : status needs a value 
*** Where: run-console 
*** Near:  [status: either all [Windows? gui?] [
gui-sys-call exe any [all [file form-args file] ""]
]]
```

hiiamboris

[14:43](#msg609fddf4617459308f76211f)this is known https://github.com/red/red/pull/4902

ldci

[14:44](#msg609fde4bd3b89834a74127e8)@hiiamboris OK. Thanks

m\_a\_j\_ch\_rz\_a\_k\_twitter

[16:46](#msg609ffafe233397424dc48476)@luce80 @greggirwin Ok, I see that there is no async right now. So for running 500 concurrent request to http server I have to bind C lib with async and then send the result to Red?

greggirwin

[16:57](#msg609ffd975fff1f4a98db05ae)Or just wait a bit. Async I/O is coming. You can even play with it today. https://github.com/red/red/tree/IO is the most current, and @rebolek can give you the best advice if you're feeling daring.

rebolek

[17:10](#msg60a0009317d35f3d9fcb48ac)@m\_a\_j\_ch\_rz\_a\_k\_twitter going with the IO branch is the way to go. It wil be merged into master eventually so it's certainly a better solution than writing custom binding. Less of work also :-D

m\_a\_j\_ch\_rz\_a\_k\_twitter

[17:14](#msg60a0015d233397424dc49474)oh I see. https://github.com/red/red/blob/IO/tests/IO/tcp-client-2.red it looks like a something which I need. I have only a question abut "wait" in repeat. Is there anything like a "wait for all" ? I would like to run my X requests in "the same time" and then later get the amount of time necessary for each of them.

rebolek

[17:20](#msg60a002fa5fff1f4a98db131e)`wait` actually waits for all. this is a simple test that opens a client, connects to server waits for reply, closes a nd then repeats. It does not open clients simultaneosly, I believe you would need to run multiple clints. However the server should accept multiple clients from what I've tested.

m\_a\_j\_ch\_rz\_a\_k\_twitter

[17:51](#msg60a00a395ca66330b04537af)Can I just make 500 times "open client" and then one "wait" ?

rebolek

[18:06](#msg60a00db19f2c352db10fdfba)I don't think you can do it in one instance of Red but I haven't try TBH

## Sunday 16th May, 2021

GiuseppeChillemi

[12:24](#msg60a10ef5b10fc85b569c60b2)Does the Red team still think that maps should not store functions?

greggirwin

[17:49](#msg60a15b236a950f3d46eb74f9)Maps can store functions.

[17:52](#msg60a15bdf5fff1f4a98de1bfa)Ah, you probably mean store as in serialized values, not just referencing them. That depends on construction syntax for non-literal values, but shouldn't have any other limitations.

GiuseppeChillemi

[18:21](#msg60a162b2d3b89834a744907a)I mean referencing it, I remember Doc has stated "do not count on functions being stored in maps" but I me wrong.

[18:21](#msg60a162bfc60a604255c263f3)\*I may be wrong.

greggirwin

[18:28](#msg60a16453b10fc85b569d2607)I don't remember him saying that. Maps are general storage containers, and can reference any value. Keys types are limited, but not values.

pekr

[18:30](#msg60a164d0617459308f79905b)In theory you could store there a loadable redbin container, or am I wrong? Kind of storage of modules :-)

greggirwin

[18:30](#msg60a164e15fff1f4a98de2f60)And while you can't persist them in literal form, you can use `redbin`.

```
>> m: #()
== #()
>> m/fn: :rejoin
== func [
    "Reduces and joins a block of values." 
    block [block!] "Values to reduce and join"
][
    if empty? bloc...
>> b: #{}
== #{}
>> save/as b m 'redbin
== #{
52454442494E020401000000440200000E000000700000000000000008000000
100000001800000020000000280000003000000038000000400...
>> mm: load/as b 'redbin
== #(
    fn: func [
        "Reduces and joins a block of values." 
        block [block!] "Values to reduce and join"
  ...
>> type? :m/fn
== function!
```

[18:31](#msg60a164fcc60a604255c26906)Same thought @pekr.

pekr

[18:31](#msg60a165036a950f3d46eb8990)Thanks :-)

greggirwin

[18:31](#msg60a1651ac12aec4aa2cbccec)Just not human readable. That's the current tradeoff, until we have construction syntax.

GiuseppeChillemi

[18:42](#msg60a1678f5fff1f4a98de36d0)Thanks, I am building a validation model for rows of data and they could be faster than finding strings to get the corresponding validation function. Strings and Maps keys give you more column names character combination than words.

[20:55](#msg60a186ac233397424dc8041c)Ok, it has been simple, on Redbol languages everything is simple. Now I can validate against multiple function at once. I am also building a validation dialect.

greggirwin

[23:50](#msg60a1afbb5fff1f4a98ded90b):+1:.

## Monday 17th May, 2021

ALANVF

[02:10](#msg60a1d0a42ee2b13d95b265e6)&gt; Keys types are limited, but not values.

@greggirwin that reminds me, are there ever plans to allow `issue!` and `refinement!` values as map keys?

pixel40

[02:43](#msg60a1d854d523ee3d3e38d382)When saving Jpg images, is their any options for saving as progressive, and different lossy settings?

greggirwin

[03:44](#msg60a1e69ec12aec4aa2ccde11)Not at this time.

pixel40

[03:46](#msg60a1e709b10fc85b569e3c4c)Thank you, can I use a C/C++ library to enhance the current Jpg Encode? There are several around.

greggirwin

[03:47](#msg60a1e73901edef5b504c6c1d)Yes, Red needs a C interface. It doesn't handle C++ name mangling.

pixel40

[03:50](#msg60a1e7f12ee2b13d95b293af)Thanks. You answered a second question I was just about to ask about C. You must have premonition or something. LOL

greggirwin

[03:52](#msg60a1e876233397424dc8cdf0)Psychic abilities save time. :^) To that end, %./runtime/platform/image-\*.reds are where you'll find the current encoders. We haven't planned to extend them, but if you want to think about doing that, @qtxie might have advice for you.

GiuseppeChillemi

[04:56](#msg60a1f763617459308f7ac872)@greggirwin ok, now I remember, it was about using functions as keys in maps and not as values.

rebolek

[05:38](#msg60a20167d3b89834a745e5a2)@pixel40 IIRC @Oldes did bindings for ImageMagick

pixel40

[05:45](#msg60a202fb233397424dc90732)@rebolek Thanks, I will have a look at that. Looking at the win32 gdiplus, there is Encoder Parameters available already for Compression Level.

pekr

[06:08](#msg60a20846d3b89834a745f559)@m\_a\_j\_ch\_rz\_a\_k\_twitter not sure what you mean by one wait for the 500 clients, but you can certainly do it. In Redbol, `wait`waits for multiple things - ports, time. It returns, what happen first. So basically the way to go is to `wait [0.001 port-list]`, which will release your loop each 0.001 sec, or, if any of ports in the `port-list`(block of waiting ports) has some event ....

zwortex

[10:37](#msg60a2478001edef5b504d42ed)For those interested, I have pushed my first application in Red. A scientific calculator that I have called \*\*recalculator\*\*. It can be found \[here](https://github.com/zwortex/recalculator/blob/main/recalculator.red). Note that is not meant to be a \*nice* implementation in Red, as it served mainly as a supporting material for me to learn Red. Still it is a functional application that has a good set of features. Some more should come in the near future : copy/paste, reverse polish notation. \*\*Currently only tested on Windows 10 x64\*\*. I have no idea whether it works on other environments but it should, I guess.

XxTheAlexGamerxX

[10:45](#msg60a2493601edef5b504d46dd)Wow that's sick

pixel40

[11:17](#msg60a250ddd523ee3d3e39e56b)@zwortex Congratulations, Showing the power of RED, works really well on windows 10 x64, both as interpreted and compiled.

ldci

[11:23](#msg60a2523617d35f3d9fd07a19)@zwortex Nice. Running on macOS only as interpreted.

zwortex

[11:33](#msg60a2548e617459308f7ba2d4)@ldci, thanks for your feedback. Currently it is compiling with -e (don't know if you used the option - don't know either what it means anywhay or what I should do about it to make it work without this option). I need to check that in the /help room. We'll see.  
@pixel40, thanks, that was one of my intention - push the language to see where it leads.  
@XxTheAlexGamerxX thanks

ldci

[11:37](#msg60a25577e263442db8320b36)@zwortex compiles with -e option on macOS :)

pixel40

[11:45](#msg60a2574301edef5b504d6926)@zwortex I initially only used -r -t windows, and it wouldn't compile either. -e is in encap mode, so code is interpreted at runtime. never used -e before, so I learned something. I don't know enough about the compiler to comment, others here can help with that. Keep up the good work.

GalenIvanov

[12:02](#msg60a25b736a950f3d46edaddf)@zwortex Nice work!

zwortex

[12:23](#msg60a260465fff1f4a98e06842)@ldci thanks for your feedback.  
@pixel40 when trying to compile, I had to restructure the code, to limit circular dependencies. However -e turned out to be mandatory, right at the start of the script (tree context). As I was chasing to make it compile, I did not investigate further.  
@GalenIvanov cheers.

rebolek

[12:44](#msg60a265322ee2b13d95b3be83)@zwortex really nice! works fine on Linux, just the display font is very bright and harder to read.

zwortex

[13:09](#msg60a26b0f17d35f3d9fd0bf6a)@rebolek thanks for your feedback. The script does not change the default font, nor use any default settings for that. It just plays with the font-size. You may change the font globally however by changing : system/view/fonts/system with the intended font-name.  
When choosing the font, one problem is that the script uses some extented characters that work fine on windows with Segoe UI but maybe not that fine with other default fonts. In particular, I had issuses with the underscripted h for hyperbolic functions, and the characters used for ceil and floor operations. I might just get rid of these to give more freedom in the choosing of a font.  
If you find a suitable font on Linux, let me know. In any case, I will probably add the ability to change the font that is used.

hiiamboris

[15:16](#msg60a288ebd3b89834a7473c87)wow that's the biggest calculator in the world probably :)

zwortex

[15:42](#msg60a28edd6a950f3d46ee3b2d)@hiiamboris I agree that pico-calculator would have been a deceitful naming scheme.

greggirwin

[16:06](#msg60a2949bd523ee3d3e3aa13c)@pixel40 look at %image-wic.reds instead, if you can. GDI+ was used in the past, but Red uses D2D on Windows now.

[16:40](#msg60a29c8801edef5b504e1dfb)Great work @zwortex. :+1: I haven't played much yet, but simple use is clean and solid. Paren buttons are nice. Explanatory comments in the code are \*great\*. My one piece of UI feedback is that the popups use `X` to close, and that button looks exactly like `X` for multiplying. Took me a minute to figure it out. Also, supporting `escape` to close those would be nice.

Feels like your background is in OOP from the style, with clean structure and grouping.

zwortex

[17:43](#msg60a2ab4a2ee2b13d95b4809f)@greggirwin, thanks for your feedback and kind comments. Definitely oop - I started programming with smalltalk. I register your remark on the button for closing the popups, and for adding the support for the escape key. Maybe also provide the ability to click outside of the window as this is the intention of this application to be used with a mouse or a finger. For the closing button, it is the standard character in windows, but I should use a different one. That would prevent any confusion, either mac or android. They are well-known conventions also. Cheers.

## Tuesday 18th May, 2021

complyue

[13:31](#msg60a3c1ba6a950f3d46f14e18)Hello! I'm excited to know about red, out of curious I wonder whether red features a stepping debugger? Didn't find one after skimmed the home readme.

hiiamboris

[13:34](#msg60a3c25401edef5b50510bb3)Not yet, although I know of a basic experiment in this area

[13:34](#msg60a3c26c617459308f7f54a3)Welcome, by the way ☻

complyue

[13:35](#msg60a3c2a2d523ee3d3e3da299)Thanks @hiiamboris , I'll keep watching :)

hiiamboris

[13:35](#msg60a3c2b85fff1f4a98e3fc0b)\[here's the experiment](https://raw.githubusercontent.com/red/community/master/tools/rdbstep.red)

[13:36](#msg60a3c2ede263442db835cb48)however interpreter tooling work is ongoing and sometime later we might have a proper tool built

complyue

[13:38](#msg60a3c33901edef5b50510f85)500 lines is quite impressive for a working debugger!

hiiamboris

[13:38](#msg60a3c33bc12aec4aa2d1a3c8)I myself am using \[this macro](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/show-trace.red) to locate the buggy part most often

GiuseppeChillemi

[14:15](#msg60a3cc17d523ee3d3e3dc463)Working with paths I have ofter encountered the needing to continue to skip position and navigate a series horizzontally then continue the path.  
Example:

```
a: [b c d f f f [g h i]]
probe x: a/d/+4/g
>> h
```

What about this?

[14:17](#msg60a3cc5dc12aec4aa2d1bef6)If `+` and `-` are present before a number, it would be "skip"

hiiamboris

[14:25](#msg60a3ce5c17d35f3d9fd465d3)make your own dialect

GiuseppeChillemi

[14:58](#msg60a3d6192ee2b13d95b78b3d)I have already some prototype dialects with many different features, but this seems to most simple one and useful to have, so I would like to have opinions and propose.

hiiamboris

[15:07](#msg60a3d8385fff1f4a98e43add)

```
>> 'a/+4/g
== a/4/g
```

GiuseppeChillemi

[15:13](#msg60a3d98c5ca66330b04e44b8)I know about this problem but I don't know how to solve it. Or at least, I know how to solve in my proto dialect: having the previous path segment with a special symbol which means "the next one is a skip number"

greggirwin

[16:54](#msg60a3f132d3b89834a74af272)I would probably use parens to denote escaping to logic `'a/d/(+4)/g`, so you can distinguish literal indexes.

[16:55](#msg60a3f18f5ca66330b04e88f0)Or even better `'a/(d -4)/g`

[16:56](#msg60a3f1bbd3b89834a74af470)That way you don't have to use lookahead logic.

GiuseppeChillemi

[17:27](#msg60a3f91c9f2c352db1192a8c)It's a solution for custom dialects but I would like to find one compatible with parens. Those lit parenss are tempting me again: `'(d - 4)`

greggirwin

[17:32](#msg60a3fa4a9f2c352db1192d43)lit-paren is an oxymoron. :^) Just use a block in those cases.

GiuseppeChillemi

[17:36](#msg60a3fb16d3b89834a74b0d7b)Is escaped parens better?

[17:36](#msg60a3fb1ac60a604255c8cbd3):-)

greggirwin

[17:42](#msg60a3fc6dc12aec4aa2d242f6)Parens in Red denote a "hot value" which is evaluated. `lit-paren!` is a fine name, as a parallel to `lit-path!`, but we have to draw a line somewhere. e.g. what would a `get-paren!` mean? But since we already have a value that represents what you want, why not use that? Of course, this is all part of exploring and balancing the core language and what it lets you create. Constraints can be very helpful. e.g., you're using path notation, but if you described your dialect, what are the key elements and actions?

GiuseppeChillemi

[17:57](#msg60a4000d416d8734b95314f8)&gt; Constraints can be very helpful. e.g., you're using path notation, but if you described your dialect, what are the key elements and actions?

Are you telling me to take into considration the key elements of my ideas when I think about path dialects or are you asking me to write them down here?

greggirwin

[18:05](#msg60a401df01edef5b5051c0fc)I assume you've considered them already, but we don't know what they are in detail. So our recommendations may not match your needs and goals. From what \*I* know, you want a mix of declarative, keyed access and offset navigation. But I \*don't* know if keys can be dynamic, if you need more than +/- offsets, etc.

[18:08](#msg60a402b92ee2b13d95b808f5)It's interesting, because we tend to normalize data structures for access \*either* by key or fixed size, but when they are mixed we call it "semi structured" data, which has historically been a challenge to deal with because the "semi" part makes it a bit squishy and easier to get wrong...sometimes, or over time.

GiuseppeChillemi

[18:14](#msg60a40419416d8734b9531f61)I'll answer later, I am driving.

[18:35](#msg60a408d517d35f3d9fd4ff0c)What you mean for DYNAMIC KEYS in this context?

greggirwin

[18:45](#msg60a40b5cc60a604255c8f930)Are your keys always literal, or can they be indirect or computed, for example. `a/b/c` vs `k: 'b a/:k/c` or using a paren that computes a key.

GiuseppeChillemi

[20:40](#msg60a42644617459308f8064b0)@greggirwin I have read again my last year's notes and your replies. You are right, many things have to be considered but I now think parens are not a good solution. The current working must be maintained, we should just change the path segment operation to skip using some symbol and maintain the current mechanism. Let's made the hypothesis we choose `>>` or `>` as `skip`

This skips 2 positions on the right

```
word/>>2/word2
```

This skips 4 positions on the left

```
word/>>-4/word2
```

as before but gets the gets the number from :value

```
word/>>:value/word
```

as before but gets the gets the number from the resulting of (code)

```
word/>>(code)/word
```

But we can just go further.  
Paths navigate through series and we have another great Red tool to navigate through them: PARSE! Why don't we use it?  
Please take a look at this path:

```
word/<:[skip 2 thru 'section-start <:]/word
```

If a path segment has `<:[]` then the current path series position is passed to PARSE and the block is its RULES argument. While parsing, each time you encounter `<:` the path current series position is changed to the parse one. If parse fails, the path fails and it returns `none`.  
(Conceptually this last solution seems so easy and straightforward)

I like both ideas but second one is even more powerful and implementable reusing 99% of the code we have in Red.

greggirwin

[21:49](#msg60a4365db10fc85b56a42abf)Paths don't just navigate through series though, and this is a specialized case. You may have needed it often, but I have never seen this type of need mentioned before. And I still don't know what fundamental need your dialect addresses, just what syntaxes you're considering.

GiuseppeChillemi

[22:09](#msg60a43b0d2ee2b13d95b89d9e)About skipping, when you have 2 sequential data sections like ``[Id "section2" id 33] parts and similar names, let you express the elements after object in one path selection, without using blocks and reusing the same words: word/>>3/id returns 33. Excessive nesting is sometime also a problem and not all structures are better when nested, sometime they are better when expressed linearly... 22:14Skipping is really useful to get elements which are not consecutive to the key and organized as rows: [key "column1" "column2" key2 "column1" column2"]. You can get column2 using word/:key/<<2. 22:28(pardon << is really >>) The last usage I forgot to write is the SKIP to value or datatype. Let's take the first example and extend it [Id word word data data id 33] the first part, as before, ends in object. With TO shifting you can have variable data length on the first segment of data and in the second just with word/>>object!/>>id. With this syntax a full horizontal navigation is possible in just one line. 22:28*to skipping (pardon, I am in mobile in my bed) greggirwin 22:41Do I understand that, ultimately, this is about fixed length, non-nested records with positional fields? And that those may be inside other structures that are based on keys, in any combination. Wednesday 19th May, 2021 GiuseppeChillemi 07:06Why non-nested records? If you do not use the SKIP characters you select the series on the right side of the series, as usual, so you navigate and get deeply nested structures. 07:14This enhancement would let you navigate any type of structure and this night, while writing, I have realized you could even use this approach to have a path which returns a series AT position instead of an element of it. Think about having multiple find expressed in one efficient and compact path. 07:21** you select the series on the right side of the series, as usual > you select the series on the right side of the KEY Oldes 09:59@GiuseppeChillemi With all my honest, your proposal looks very ugly to me. And hard to read... not mentioning that its implementation would slow down all path access evaluations. Also having large records in pure block is not too good. Instead of your proposed _perlism_ I would rather wanted to see struct! datatype, which would be more memory friendly than block! and would provide named accessors to all values. 10:00Or a proper in memory database, where you would not require artificial value skipping. GiuseppeChillemi 13:36@Oldes Mine is not an "it's needed now" idea, I liked to discuss it with you. I love paths a lot and they are a linear way to navigate series. greggirwin 18:30@GiuseppeChillemi what I mean by non-nested is [1 2 3 4 5 6 7 8 9] vs [[1 2 3] [4 5 6] [7 8 9]]. Nesting, and keys vs positional values, add overhead, but also information. There is no single solution that it best in every case, so it will be interesting to see what comes of your work. GiuseppeChillemi 18:39@greggirwin let's see, implementing the path dialect is no more a distant dream, as I am mature enough for a good part of this task. Thursday 20th May, 2021 xqlab 13:25Is that true that the IO branch can only be compiled to Windows as a target? rebolek 13:44@xqlab no. I am using it on Linux (and on mac in Docker, so it’s also Linux) and it works fine. Friday 21st May, 2021 xqlab 07:44I got this Target: Linux Compiling to native code... *** Compilation Error: undefined symbol: alloc-at-tail *** in file: %/home/anton/red/red-IO/environment/console/CLI/input.red *** in function: exec/terminal/init-globals *** at line: 510 *** near: [alloc-at-tail root 1] 07:45With target Windows I got an .exe rebolek 12:12hm, that’s interesting 12:17@xqlab I’ve just compiled Linux version on Linux (actually on macOS in Docker, but that’s just a Linux in disguise) and haven’t seen this problem. Monday 24th May, 2021 ldci 10:36DSP with redCV: https://twitter.com/fjephe/status/1396764706887585795/photo/1 10:39BTW: the code is about 10 faster under windows10 than under macOS. Any idea about this difference? Oldes 13:40Debug cv build? 13:40Or maybe better gpu on windows? CodingFiend_twitter 15:52For those wondering why Windows is faster than Mac OS, i have noticed this performance difference many times, as i run Windows and Linux under OSX via VMware Fusion. One massive difference between Windows and OSX is that Windows has a much faster file system, with read ahead and caching, and OSX is rather dumb in this area. So anything that involves reading data is going to be noticeably faster in Windows, and since Windows will keep a file in RAM even after you have closed the file (on the off-chance that it might be used again), second and later runs of the same program on Windows tend to be rather quick. In general the I/O on OSX is slow. This may be unrelated to why redCV has a performance difference, but there is no cleaner comparison than the same exact hardware! ldci 16:05@CodingFiend_twitter.Thanks for the the tips.For windows, I’m using virtualBox. CodingFiend_twitter 17:01I have a Mac and Windows version of my Beads compiler (Beads is a completely different kind of language than Red, a State-Action-Model graphical language), and it is baffling how the Windows version is so much faster at compilation compared to the Mac version, running on the same hardware! I think it boils down to Windows being highly optimized for I/O after so many versions, while OSX has pursued Realtime Audio Processing integration, and fancy typography as priorities along the way. Respectech 17:23I have also noticed in my experience that Windows accessing files from a Windows fileserver is WAY slower than Windows accessing files from a Linux fileserver running CIFS, especially when the directory that is being accessed has thousands of files in it. And FreeBSD is even faster than Linux as a fileserver in this regard. Wednesday 26th May, 2021 Oldes 08:14My experience is, that one can speed up Win10 i/o quite a lot by turning off Real-time protection. Respectech 16:41My experience is that the same Windows client has at least an order of magnitude speed improvement when accessing a large directory from a Linux fileserver when compared to the same directory on a Windows fileserver. Perhaps there's a way to speed up the Windows fileserver, but I would think the real-time protection would be running on the client machine. Thursday 27th May, 2021 henrikmk 13:05I suppose Windows is faster than MacOS in many areas because Windows does a lot of things inside the kernel, where MacOS spins everything out into services. But my knowledge on that might be quite outdated. It used to be like this back in the WinXP/OSX Tiger days. Oldes 13:30I had a chance to try the new macOS on M1 chip and I was very surprised how faster it is when I compare in with MacBook Pro from year 2016 (even when running thru Rosetta emulation). Friday 28th May, 2021 henrikmk 11:04The tragedy of the M1 is that we will not see this CPU family outside of Apple, so many people will not get to experience it. pekr 11:33Is that M1 really so good in comparison to others? I mean - if Apple can develop such a cpu/gpu combination, could not just Samsung, nVidia or Qualcomm develop a similar one? All use the ARM designs, which they further develop / change, no? henrikmk 12:06Everyone I hear using the M1 are a bit shocked at how fast it is, even on a Mac that only has 8 GB RAM. The key to the design is very wide memory buses and of course having all the memory right on the main chip. Also, each CPU core can saturate the memory controller that can handle around 60-70 GB/s. An intel/AMD CPU core can only do 15-25 GB/s. That's pretty astounding. Then of course is the low TDP of less than 30 W can make it do long running tasks with little cooling needed. The GPU isn't very powerful though. The cost is also presently only a maximum of 16 GB RAM. What is even more interesting is that Mx series CPUs will grow much faster in the near future, if Apple's CPU speed ramp will be maintained from the earlier Ax CPUs. There's lots of low-hanging fruit left for Apple to pick. pekr 12:07So after all those years, they have finally implemented an Amiga :-) henrikmk 12:08I always thought the iPhone was Amiga-like. It's a beautiful design in many ways. pekr 12:09Should Intel be worried now? Will other tech companies follow with similar designs? henrikmk 12:11Intel should worry for many other reasons, since they squandered their position for 7-8 years now. So far behind AMD now. The "upside" for them, is that Apple will also squander certain opportunities with the Mx series, such as producing open hardware at a reasonable price. That's not in their nature. GiuseppeChillemi 21:20@henrikmk While amiga architecture was designed to give Multimedia Chips maximum priority, M1 is designed CPU first. Now they only need to make a GPU designed the same way and they will have the best system possible right now. CodingFiend_twitter 23:53Intel has lost the entire Apple account, which was probably at least 5% of Intel's total business. So it's a big loss. They have been idling for years they didn't have any serious competition. Intel still has the best Quantum Physicists on the planet, and they are only one invention away from blowing away the world again. We are in the plateau region of the development curve, where almost nothing changes. If you put more than 10 cores in a chip you don't get much useful work out of it, so we are flattening out everywhere in the computer biz. Saturday 29th May, 2021 pixel40 07:40@GiuseppeChillemi Brings back memories. I had an Amiga with a 68060 accelerator, running Jim Drews Mac emulator. I used it in PrePress, and the Mac Emulator literally produced work 3 x faster than the fastest Mac you could buy at the time. GiuseppeChillemi 12:52> We are in the plateau region of the development curve, where almost nothing changes. If you put more than 10 cores in a chip you don't get much useful work out of it, so we are flattening out everywhere in the computer biz. We have still a large margin of improvement in software. Algorithms are tuned for single processor tasks. Once they will move to multi-core operations we will see again a lot of improvements. Sunday 30th May, 2021 GiuseppeChillemi 23:59It is strange for europeans see the dollar symbol after euro currency, is there any way to change it? >> as-money 'eur 22 == EUR$22.00 Monday 31st May, 2021 greggirwin 00:31$ is the standard Red denotation. To use something else, form it and replace, or wait for format. The latter doesn't have a locale design yet. Tuesday 1st June, 2021 meijeru 10:17The Unicode universal currency sign is U+00A4. Unfortunately that is outside the ASCII range... I try to put it here: ¤ Does everyone see it? rebolek 10:27I do, Unicode shouldn’t be a problem today. 10:28What’s problematic OTOH is locating such sign on most keyboards. With $ it’s much easier. pekr 10:28How do I type it easily on a keyboard? rebolek 10:28Exactly. greggirwin 15:32¤ was part of money's design discussion, and I have it in my format exploration. In addition to the typing issue, it's universal but also universally unknown. :^\ One thought I had in format was that $ could be literal for that symbol, but ¤ could be replaced based on a locale setting. wezl:privacytools.io 15:42While it may be of no importance, on [Code Golf Stack Exchange](https://codegolf.stackexchange.com/), Red is the [Language of the Month](https://codegolf.meta.stackexchange.com/q/22414/90614), which means more people will try to learn it and use it in the contest of code golf (where it does quite well, other than requiring a Red[] header :) hiiamboris 15:54Great! 15:54Once we finish HOFs there'll be no competition ;) greggirwin 16:13Thanks for letting us know @wezl:privacytools.io ! 16:14Let people know they can come here for tips and tricks. 16:17For the compass problem, others just use a literal, so Red could do that too, avoiding prin. kidd 17:01hi, just wanted to ping you that ripgrep now recognizes red files: https://github.com/BurntSushi/ripgrep/commit/53c4855517ff3d6ef0cb612579ede1f6e281a506 greggirwin 17:02:+1: 17:13Thanks for providing binaries. 17:18 ./ripgrep>rg -tred /user: unrecognized file type: red CodingFiend_twitter 18:05@pekr to get the Euro symbol, on the mac you type Option + Shift + 2, and on windows Alt and type 0128 The universal currency symbol was a really dumb idea, as it is nobody's currency, so basically a wasted unicode glyph that only confuses people. The committee running the Unicode consortium are dumb as doorposts; constantly making it more and more complex, and now busy turning it into a completely unsystematic clip art database that is only accessed by number, which is a misguided thing to do. hiiamboris 18:11> on windows Alt and type 0128 Two issues: smaller keyboards don't have numpad, and you have to **memorize** the code which is a waste of brain cells. That's why I also asked Gregg **not** to use this symbol in format. Oh and 3rd issue: I've experienced that in this load of crap which is W10 Alt+numpad entering didn't work in a whole range of revisions. GalenIvanov 18:16@wezl:privacytools.io Thank you for posting here! (I had forgotten) djrondon 18:27do you have a fix to run Red on Big Sur ? greggirwin 19:48You'll need to run Red in a container or VM @djrondon. Thursday 3th June, 2021 meijeru 15:30Concerning Red publicity as language of the month in Stack Exchange: is the following statement given there actually correct? * Red doesn't have reserved words, instead blocks (arrays / lists of arbitrary values) are used as arguments to functions. * hiiamboris 15:32Looks like a few topics mixed in one sentence. A typo? GalenIvanov 17:54@meijeru @hiiamboris It's probably my fault. @wezl:privacytools.io created the nomination, then I added more text to it. This sentence clearly doesn't make much sense. I suggest the following edit: * Red doesn't have reserved words, even conditionals and looping constructs are functions that use blocks (arrays / lists of arbitrary values) for their bodies. hiiamboris 18:03Well, these functions are natives written in Red/System code. You wouldn't go far without them. Though: you can rename them, and build your own loops on top of that. 18:06If it's the "reserved words" you want to put accent onto, how about: - Red doesn't have reserved words. Even conditionals and looping constructs are ("native" function) values provided by runtime, which can be assigned any names. GalenIvanov 18:29@hiiamboris Thank you! I don't remember what I meant, but it was probably that Red's syntax is uniform and conditionals/looping are achieved with function calls and don't need reserved words and special syntax. I can edit the page in SE if there are no other suggestions. greggirwin 23:00Make the change @GalenIvanov. :+1: Friday 4th June, 2021 GalenIvanov 07:37Done razetime 09:57hi there galen ivanov 09:57and @wezl:privacytools.io GalenIvanov 10:33@razetime Hi! Nice to meet you here! Saturday 5th June, 2021 cloutiy 19:39Hello, ive been away for some time...does red have the necessary pieces to use as a web server yet, or still in progress? Thx GiuseppeChillemi 19:57We are near, I suppose we will see something before the end of the year. cloutiy 20:16Ok thx👍 GiuseppeChillemi 21:51Is it normal Automated build are stopped at 26th of May? ne1uno 22:00download page, Direct links to latest builds, windows zip says not here GiuseppeChillemi 22:03Confirmed ne1uno 22:06maybe fail test on mac build prevents update? Sunday 6th June, 2021 rebolek 08:36@cloutiy this web runs on Red webserver https://rblk.eu/ GiuseppeChillemi 08:38@rebolek 👏🏻👏🏻👏🏻 pekr 08:42@rebolek I expect your web server uses an IO branch? rebolek 08:46@pekr yes Monday 7th June, 2021 RayMPerry 00:13Something I've always wondered about this language: Has someone used it in each domain highlighted in this graphic? https://3.bp.blogspot.com/-xhOP35Dm99w/UuXFKgY2dlI/AAAAAAAAAGA/YQu98_pPDjw/s1600/reichart-abstraction-diagram.png 00:14Is the split in the line mean to represent Red/System? toomasv 03:11Yes, some are using it in each domain all the time, others are working more in one or other end. From left: Red/System, Red (proper), and dialects like Parse, VID, Draw. henrikmk 12:23Does REPEAT intentionally ignore alterations to its index word? It makes it a lot less flexible than REBOL's REPEAT function. REBOL: repeat i length? [a b c] [print i i: i + 2] 1 == 3 Red: repeat i length? [a b c] [print i i: i + 2] 1 2 3 == 5 toomasv 13:13@henrikmk There was recently a chat connected to this :point_up: [June 2, 2021 9:28 PM](https://gitter.im/red/help?at=60b7cdbdfec22b4786f613f2) henrikmk 13:19@toomasv thank you toomasv 13:19You are welcome! greggirwin 23:27@RayMPerry some examples: - Hardware: https://www.red-lang.org/2019/07/gpio-port-for-raspberry-pi.html - Drivers: The Red Wallet has its own USB driver built in. - OS: @BeardPower has done some experiments in this area. So even writing your own OS from boot is possible, but also system applications that run just above that. - Apps and scripting are the bulk of what people do with Red. - DSLs: There are plenty of those in the wild, along with some that come built into Red. Tuesday 8th June, 2021 razetime 02:57[![{0A05AAD8-6EE4-410A-BEF6-52EBBB32D4A1}.png](https://files.gitter.im/5565a1d415522ed4b3e10094/WWYh/thumb/0A05AAD8-6EE4-410A-BEF6-52EBBB32D4A1-.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/WWYh/0A05AAD8-6EE4-410A-BEF6-52EBBB32D4A1-.png) 02:57I'm trying to use the draw dialect here 02:58I'm not sure what's causing the problem 02:58arr here is a series of pairs toomasv 03:26@razetime You can't use Red proper inside VID just like that. Prepare your draw-block beforehand and feed it to VID, something like this: arr: [10x10 190x190 10x190 190x10] lines: collect [foreach p arr [foreach q arr [keep reduce ['line p q]]]] view [base 200x200 draw lines] 03:32Or you can compose it inline: view compose/only [base 200x200 draw (collect [foreach p arr [foreach q arr [keep reduce ['line p q]]]])] razetime 03:32oh, interesting. 03:33what is the keep reduce for? toomasv 03:37keep is subfunction in collect (see ? collect), and reduce reduces (i.e. evaluates words (and other reducible things)) the block before keeping it. razetime 03:38ah, so collect and keep together create a list of lines toomasv 03:38Yes razetime 03:38sort of like a flatmap greggirwin 03:40You can use them together that way, yes. General HOF design is in the works. Friday 11st June, 2021 GiuseppeChillemi 06:47Could http links be made clickable if printed on the console? toomasv 09:31They could. Tried a quick hack [![Console links](https://toomasv.red/images/Console/links.gif)](https://toomasv.red/images/Console/links.gif) GiuseppeChillemi 09:46@toomasv Thanks, the idea that has triggered the question was to make web addresses in function spec string clickable on HELP function-name console printout: aname: func [ {This function does <this>. For additional documentation go to: HTTPS://github/docs/extended/aname } arg {This arg does <that>. For examples go to: HTTPS://github/docs/extended/aname/arg} ] [ ...somecode... ] 09:46I have really needed it while learning. Toomas, what you think about this? 09:47@greggirwin And you Gregg, what you think about this? toomasv 10:11Yeah, would be nice to have it, something like this: [![Console links2](https://toomasv.red/images/Console/links2.gif)](https://toomasv.red/images/Console/links2.gif) (Links are not actually included in online version (which is old), as it is just a hack) GiuseppeChillemi 10:17That's the idea. You added one "feature" : the highlighting of any link on screen. My idea was to have an highlight function which is called by help to print specs descriptions. 10:19(so the string creates a clickable output on the console when encountering web links) meijeru 13:43HELP! red-latest-exe is not updated beyond 26-May (commit 9b645b93). There are already 5 newer ones. greggirwin 18:22@GiuseppeChillemi @toomasv *very* cool, and yes. We can use @rebolek's nsource as well, e.g. producing the necessary URL from help for natives. 18:23@x8x do you know what the server issue is for @meijeru 's report? GiuseppeChillemi 18:25@greggirwin I will write a request for it. greggirwin 18:27@toomasv I can't remember, is your console stuff in a gist or repo? GiuseppeChillemi 18:36@greggirwin Here? https://github.com/red/red/issues toomasv 18:40@greggirwin In a [repo](https://github.com/toomasv/console-tools), but I haven't updated it for long time, some things don't work. Saturday 12nd June, 2021 x8x 03:34@meijeru Issue is fixed. Try again please! razetime 04:25is there an equivalent for maximum-of in Red? 04:25I need to get the meximum of a series GalenIvanov 04:32@razetime No, last sort series razetime 05:23thanks meijeru 07:48@x8x red-latest-exe is up to date. Tx! greggirwin 14:58@x8x what was the issue? 15:08@GalenIvanov sorting and pulling a value doesn't match the behavior. maximum/minimum-of in R2 are not great names, because they return the series offset, not the value. I proposed either at-max or find-max in the past. But they also need design input. e.g. what are they used for, is /case worth supporting, or even /skip? And if you need this behavior, is it better to do it with an aggregator, because a linear search is not efficient. No big deal if your data is small or the query infrequent, but finding the maximum *feels* more like something you need in larger data analysis scenarios, where it can add value. e.g. graphing data and setting chart bounds. 15:08My old mezz versions use forskip to support /skip, so aren't applicable to Red at this time. GalenIvanov 18:34@greggirwin I (correctly) guessed that @razetime needs maximum-of as value and not series offset, for code-golf :smile: I agree with your comments. Linear search is easy to alias as reduce series :max (or fold, or scan) once we have HOF. greggirwin 18:38:+1:. I see now that @razetime is into esoterics and golf. :^) ne1uno 22:56[quote] Red ephasizes the paradigm "Code is data". [/quote] https://codegolf.meta.stackexchange.com/questions/22414/language-of-the-month-for-june-2021-red 22:56emphasizes? Sunday 13th June, 2021 greggirwin 00:18Yes. GalenIvanov 09:48@ne1uno Fixed! ne1uno 09:49ty. a friend spotted it 18:20.freenode.net Message of the Day -You have been blocked due to filtering problems. Contact kline@freenode.net 18:20they've been indiscriminately banning users after most of the staff abandoned ship, if red-lang is still linking to freenode, it might be time to switch to another network. 18:52background from last month, https://boingboing.net/2021/05/19/freenode-irc-staff-quit-after-new-owner-seizes-control.html 18:52https://netsplit.de/networks/statistics.php?net=freenode 18:52most everyone moved with the staff to http://libera.chat/ @rebolek Monday 14th June, 2021 rebolek 05:45@ne1uno I'm not against switching the network, I've read about freenode's dubios behavior in last weeks and moving elsewhere makes sense to me. GiuseppeChillemi 21:55When code is data and data is code, sometimes you can't distinguish a situation from a value: >> a: [b c #[none!]] probe type? probe pick a 3 probe type? probe pick a 10 none none! none none! None is returned either as an element picked from a block and when we are out of the boundaries. In any function of this kind, you have to create another one to check if we are in a situation that returns None. 21:56It's just a personal thought spoken out instead of remaining in my mind. Monday 21st June, 2021 Phryxe 08:11What is happening with Red? No update on the homepage for almost a year. Is there no news to report on? kskarthik:poddery.com 12:04hello everyone! 12:06I just created a docker image for red 0.6.4 https://hub.docker.com/r/kskarthik/redlang Just wanted to share it with you 😀 hiiamboris 12:06hi, and welcome, @kskarthik:poddery.com ☺ 12:07we probably need to start a list of Red docker images already ;) kskarthik:poddery.com 12:07yes, I found none. So, i thought of making one 12:07and i don't want to pollute my system with 32bit binaries 12:08Hope the team can get rid of that dependency soon hiiamboris 12:09so, to be clear, you're using it on 64-bit linux? kskarthik:poddery.com 12:09yes hiiamboris 12:09thanks for sharing! kskarthik:poddery.com 12:15@hiiamboris 👍️ 12:18@hiiamboris: so any plans of dropping those 32bit library dependencies ? hiiamboris 12:22Of course, just not the top priority. See https://gitter.im/red/red?at=5e09152cd5a7f357e6a1af83 for team's official stance (on Mac it's a more pressing matter ;) kskarthik:poddery.com 12:24Got it. Mac needs more priority. I assume that solution works for Linux as well hiiamboris 12:26OK I conjured up a list https://github.com/red/red/wiki/%5BLINKS%5D-Unofficial-Red-images @rebolek if you would add your image there as well ;) I couldn't locate it kskarthik:poddery.com 12:32Why not migrate the website to hugo? https://gohugo.io/tools/migrations/#blogger 12:32I can try that if the team is willing to move 12:33Just in case if you aren't aware, Hugo is a static site generator hiiamboris 12:36There's already a new website (Hugo-based in fact), but I forgot the link ;) kskarthik:poddery.com 12:38@hiiamboris: i got it https://github.com/red/web-red hiiamboris 12:40But it's actually live at some address. And that page links to the current (old) site. kskarthik:poddery.com 12:41oh 12:41let me know the link hiiamboris 12:50Jackpot: https://beta.red-lang.org/ kskarthik:poddery.com 12:52BTW i get this err in latest red linux snapshot inside docker 12:52` root@92ab33b581b8:/# red Compiling compression library... Compiling Red console... Unable to init server: Could not connect: Connection refused (console-2021-6-19-58594:10): Gtk-WARNING **: 12:51:21.774: cannot open display: 12:52i think it's looking to fireup the GUI hiiamboris 12:52Do you have $DISPLAY defined and accessible? GTK requires it yes. kskarthik:poddery.com 12:53what should i set it ? 12:54oh 12:54any way to run cli only? 12:54any flags ? hiiamboris 12:55No, I think you'll have to compile a CLI-only build for that. 12:57Instructions here: https://github.com/red/red/#running-red-from-the-sources-for-contributors kskarthik:poddery.com 12:57Thanks! I will try 17:23@greggirwin: is there source code repo of the beta website? Regarding porting the old blog, blogspot exporters exists. We can experiment once you can export to xml format greggirwin 17:57@hiiamboris noted that it's at https://github.com/red/web-red. @x8x manages our servers, and also did the progress site and another variant that is more dev oriented. I don't know how far he got on R&D for blog transfer, but all help is welcome. kskarthik:poddery.com 19:44@x8x ping! 19:45Can you share the blogspot XML format? Tuesday 22nd June, 2021 kskarthik:poddery.com 04:44@gtzip: blogspot has option to export entire blog to XML. We could use that to migrate gltewalt:matrix.org 05:11Is that the only format? Can it export to json? kskarthik:poddery.com 05:14[gltewalt (The other Greg)](https://matrix.to/#/@gltewalt:matrix.org): no, only to XML file AFAIK 05:22[Screenshot_20210622-105143068.jpg](https://gitter.ems.host/_matrix/media/v1/download/poddery.com/uoFlIVQLTAFPOfhtshlOnIai) razetime 10:20what is the equivalent of found? in Red other than not-equal? NONE? hiiamboris 10:23if find ..., found?: none <> find ..., found?: not none? find ... razetime 10:39thanks a lot 10:39none <> is the shortest approach, which I'll use hiiamboris 10:40yeah there's also to logic! find ... but again a bit longer ;) 10:41not not find .. - not recommended, too cryptic razetime 10:41I'll note those down 10:42I did try not not before you showed none <> :P 10:42after all, unreadability is one of the more fun parts in golf hiiamboris 10:44haha kskarthik:poddery.com 12:39@razetime: you're working on any program in Red or exploring? 13:52BTW Any there any real world programs in Red? hiiamboris 15:53https://www.redlake-tech.com/products/diagrammar-for-windows/ 15:55https://github.com/red/red/wiki/[LINKS]-Projects-showcase-%28links-to-remember%29 some games here, esp. Cave-In, developed as we speak in https://gitter.im/red/red/gui-branch ;) Wednesday 23th June, 2021 GalenIvanov 06:18@razetime to logic! find ... can be shortened to to on find... (or any one of true false on off yes no instead no) gltewalt:matrix.org 20:00Small advantage to that weird naming style where the first letter is a type hint. sHeadings fVerify-headings Or something like that 20:02Hard to find one word verbs for functions. Which probably means in a perfect world that my functions are doing too much greggirwin 20:07I used Hungarian Notation a *lot* in the 90s. If you only have 6 types, starting with unique letters, it works much better than it would in Red. Also why you end up with things like sz as prefixes for "C string", because that makes sense. Well, it does if you're a C programmer. But it's also onerous to maintain, and often hints at leaking details through large systems. If you have a rich, strong type system, it's less helpful. Thursday 24th June, 2021 hardkorebob 14:11Wow. Amazing work. Truly what the future has to be more like. I'm truly blown away at this. Im glad I started to research new languages. Looking forward in having some hands-on. Will build latest from source on a Devuan 3 amd64. hiiamboris 14:25We all share the feeling. Welcome @hardkorebob ☺ hardkorebob 14:26I'm here to help too. I am fluent in Spanish as well. 14:26Thank you hiiamboris hiiamboris 14:30In the topic of https://gitter.im/red/red/welcome room you'll find learning resources we're usually advising. There's a huge lot of work ahead in Red, so I'm sure everyone willing to help will find a way that he likes best ;) hardkorebob 14:42I was about to ask. :) greggirwin 15:19Welcome @hardkorebob ! hiiamboris 19:39We were discussing string interpolation with Gregg, and would like others input. Preliminary design was #composite macro and composite function. Both are described [here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md), but TL;DR is #composite turns a string into a rejoin with block and composite does it internally and returns rejoined string: >> probe expand-directives [#composite {"(player)" "(vfile)" --audio-file "(afile)"}] [rejoin [{"} (player) {" "} (vfile) {" --audio-file "} (afile) {"}]] The latter as you can see gets very ugly at times. So first purpose of it is **readability**. Second purpose is **localization** \(see [on the same page](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md#localization)\). There are however some issues. - #composite is a long thing to type. I found myself writing macro wrappers around it: #print for print #composite, ERROR for do make error! #composite and so on. - #composite can't accept strings indirectly (being a macro), e.g. strings conditionally fetched or built at runtime. - composite (func) requires runtime binding, and that we provide it every time (see the above page for details). Which is a bag of gotchas for everyone not deeply familiar with Red. - What escape syntax should be preferred? Current implementation uses (\ to denote literal (, which is backwards ☻ My stats so far are: - ERROR is a very common use case, probably 50-70% of my use of composite. - #print is most of the rest. - other #composite uses are present (e.g. composing file content) but not very numerous. - composite (function) I only used once. Some recent ideas: - Replace #composite "value=(v)" with a shorter macro, e.g. "value=(v)" . Backtick does not stick to strings and tags, but stick to files and raw-strings (though it can be fixed). No need for wrappers anymore. Such triple quotes are harder to count visually though. - Most languages [reserve](https://en.wikipedia.org/wiki/Variable_interpolation#Examples) some quotation format for this (very common) use. We could code backticks directly in the lexer to transform strings like value=(v) into rejoin ["value=" (v)] (or just into blocks?) *on load*. That however harms localization, as we don't get the string form anymore and need some kludges to extract it. - We can build and expand macros at runtime as shown above, so there really is no strict need for composite function and we may even abandon it, or make it a wrapper around the macro: build the macro pattern, expand, bind and evaluate. What do you guys think? Any ideas on how to best support interpolation? Have you used it (or wanted to use) in your code? gtzip 20:06Value for templating? 20:08I've used rejoin and compose rejoin as a common pattern for some templates. 20:09At first i wished for it, but rejoin with a block is essentially bizzaro string interpolation. The inverse sort of. 20:10Its a must for string heavy languages, but for red? greggirwin 20:35Another question is the markers for placeholders. In [mine](https://github.com/greggirwin/red-formatting/blob/master/formatting-functions.adoc#composite) I used :( ... ): (what @hiiamboris refers to as the sad eomji format. :^) @giesse pointed out in another chat the main binding problem, which Boris also covers. Basically, the simple case where you use it in a func, but then it needs a context given because it's not a block to begin with. gltewalt 20:40log-info compstr "Started worker <%name%> PID: (<%pid%>)" 20:41Is there something against the rebol choice of <%..%> ? 20:42I know that folks are used to parens for compose 20:43Sad emoji isn't bad until you throw in set-words or get words 20:54And forgive me if I've forgotten if backticks make for an illegal word 20:55Those would be fairly clean 20:57I suppose going by the boris breakdown, I'd prefer \var\ ^\text\, then (var) (\text) 21:02And would vote for macro hiiamboris 21:30> Is there something against the rebol choice of <%..%> ? So unreadable IMO as if it was not designed at all ;) hardkorebob 21:58Im not a developer per se. I do work with the command line a lot in Linux and I would consider myself a PowerUser than anything else. Readability is definitely very nice but maybe the whole thing needs to relooked at. I dunno. Just my 2 cents. 22:00I am very new to Red and the whole Rebol/Forth family. But I love to learn and I am willing to share my insights. Friday 25th June, 2021 rebolek 06:29Comon format for the delimiters is also {{ and }} (see [Mustache](https://mustache.github.io/)) 06:30And of course I would welcome an option to override default delimiters. GalenIvanov 07:56While working on the [Red functions for Python programmers](https://github.com/red/red/wiki/Red-functions-for-Python-programmers) article, I wrote a simple [format](https://github.com/GalenIvanov/format) function that uses a tiny formatting DSL. I find it slightly related to the composite function and that's why I'm posting it here. rebolek 07:58@GalenIvanov nice! GalenIvanov 08:05Thanks! hiiamboris 15:46Comparison of short macro formats as currently possible to lex: |string|alt string|tag|file|note| |-|-|-|-|-| | "value=(v)" | {value=(v)} | |  %"value=(v)"  | | | @"value=(v)" | @{value=(v)} | @ | @%"value=(v)" | 1 | | &"value=(v)" | &{value=(v)} | & | & %"value=(v)" | 2 | | /"value=(v)"/ | /{value=(v)}/ | /  / | /%"value=(v)"/ | | | ="value=(v)"= | ={value=(v)}= | == | = %"value=(v)" = | | | ^"value=(v)"^ | ^{value=(v)}^ | ^^ | ^ %"value=(v)" ^ | | 1. similar to [reshape](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md) 2. & can't be an operator then gltewalt:matrix.org 19:14Well I can say you've done the work and provided examples and justifications, which is normally an Irwin requirement. Aesthetically, parens are not my favorite but I'm sure I would get used to it. gltewalt 19:31First short macro format would be my pick greggirwin 19:32@hiiamboris knows how to sway me. I'm on to him though. 19:59@gtzip the question of value in Red is a good one. We tend to think in terms of little strings, and bits of code we compose or rejoin. While we don't have measurements, we do have evidence that non-developers understand, and can effectively use, templates (e.g. mail merge). Where blocks of code are normal for us, they are foreign to others, flipping the model on its head. No longer are there placeholders within a string of text, but there are interspersed *bits* of text and expressions. In my own work, I've used external templates more than internal, not counting rejoin/reform cases where devs are the only consumer. I also noted to @hiiamboris that a key elements is the WYSIWYG aspect. Rejoin/reform make you look at *every* text snippet to make sure you have leading trailing spaces right. That's probably one of my most common mistakes in formatting. The other place that's huge is in multiline string formatting. e.g. templated email bodies. Compare this R2 build-markup example body { The <%PROCESS_NAME%> process sent DISKPART the following commands: <%mold MARKUP_1%> The DISKPART result was: <%mold MARKUP_2%> } with something like body [ "The " <%PROCESS_NAME%> " process sent DISKPART the following commands:^/^/" tab <%mold MARKUP_1%> "^/^/The DISKPART result was:^/^/" tab <%mold MARKUP_2%> ] We can put the former in a user's hands, and if errors aren't dangerous, e.g. malformed fields, they can still deal with it. The latter, based on my experience, is *not* user friendly. It can be especially confusing because the blank lines in the template do *not* affect the output. hiiamboris 20:04I can add that first time I saw Gregg's #composite my reaction was "why would we ever want that?". But then with every print or rejoin I was using in my code I had this thought "what if..". Then I started using my experimental implementation, and after some time I believe it's a total must have. zentrog:matrix.org 20:41I think this Red version is a little closer to the R2 example body rejoin [{ The } PROCESS_NAME { process sent DISKPART the following commands: } mold MARKUP_1 { The DISKPART result was: } mold MARKUP_2 { }] The direction that the 'delimiters' point around the code parts feels a little odd to me, but I don't know if it's good or bad. You do get accurate syntax-highlighting this way, which is nice. greggirwin 20:58Indeed. Users won't have syntax highlighting, more than likely, but this is something we should absolutely consider, as we support people writing more tools to help their users. hiiamboris 21:00Why not have it? greggirwin 21:01I mean end users, who might be given "merge files". They'll have Notepad. Saturday 26th June, 2021 GiuseppeChillemi 21:47Will there be a way in Red to create a context where some words are refinements? It is needed to replicate the function's context exactly. greggirwin 22:06Not likely. Refinements do not support set syntax, like set-words. Accessing them via path syntax would also lead to a double slash syntax, which is problematic. Why not use a separate context within the context for them, which is sort of what Red does internally. 22:32[Composite syntax](https://gitter.im/red/red?at=60d5fa3ceffd491d8c84a1d0) :point_up: On the chance that we want to support @"..." syntax for ref! someday, let's not do that. Double sigils, head+tail are unattractive to me, and those with spaces required are problematic from a general "whitespace separates values" standpoint. If it's a macro, I don't mind it looking like one, with a leading # sigil. The editorial "change/insert" mark is ^, which is a problem in Red. #^^ seems...icky ~ is close to "transpose", but that meaning isn't a great match for "substitute". I still like aspects of the backtick, but #\ is pretty subtle. #\\` less so. The number of bracketed string types in Red makes the other options quite ugly. As a more traditional macro it could also work for composing blocks at compile time. More thought required. 22:39The worst-looking syntax with leading/trailing backticks is for regular strings, which are likely the most common case. GiuseppeChillemi 22:42@greggirwin Let's see, I am currently working on Rebol on a way to send remotely the current command and start it there from inside the called function: get-command-line: func [ "Returns a block ready to be transmitted that replicates the current function start parameters" fname [word!] "The name of the functions" args [block!] "The argument words inside a block" refinements-block [block!] "The refinement block in the form [/refname [arg1 arg2] /refname [arg3 arg4]]" bound-word [word!] "A word of the caller function context" /specs the-specs /local out-data remote-command refs argument-refs arguments argg command-line in-block; block with refinements ] [ args: copy args refinements-block: copy refinements-block remote-command: to-path fname ;--- Here we neutralize functions in words on reduce ; forall args [ if word? first args [change args to-get-word pick args 1] ] ;--- Here we neutralize functions in words on reduce ; forall refinements-block [ if block? in-block: first refinements-block [ forall in-block [ if word? first in-block [change in-block to-get-word pick in-block 1] ] ] ] refs: copy [] arguments-ref: copy [] arguments: reduce append copy [] args parse refinements-block [ any [ set ref refinement! set argg block! ( if true = first reduce [get in bound? bound-word ref] [ append remote-command to-word ref append arguments :argg ] ) | set ref refinement! ( if true = first reduce [get in bound? 'server ref] [ append remote-command to-word ref] ) | skip ] ] command-line: mold/all reduce compose [remote-command (arguments)] ] afunction: func [a b /c d e] [ probe get-command-line 'afunction [a b] [/c [d e]] 'a ] >> afunction/c 1 2 3 does [] "[afunction/c 1 2 3 #[function! [][]]]" Many things are still not there in Red to redo this but it is maturing from day to day. greggirwin 22:43By far my most common case for filenames is date-naming them, which isn't a good match for composite and handled better by format. GiuseppeChillemi 22:52Note, in Rebol I could have parsed third bound? 'a to get the needed argument for get-command-line but there is a terrible bug: if you ask the context of a local word of a function, it is returned without the first word of the context. >> a: func [b c][probe bound? 'b] >> a 1 2 make object! [ c: 2 ] 22:58While in Red: >> a: func [b c][probe context? 'b] == func [b c][probe context? 'b] >> a 1 2 func [b c][probe context? 'b] I get the whole function definition. greggirwin 22:58I'm not clear what you're trying to accomplish @GiuseppeChillemi. e.g. bound? behavior. I've posted my refine experiments in the past, which may be applicable. It looks like you're trying to bind parts of a remote call to different contexts, but I don't know why you'd do that. If you're making remote calls, you shouldn't know anything about the server side. GiuseppeChillemi 22:59Bound? on Rebol is Buggy, as you can see: :point_up: [27 giugno 2021 00:52](https://gitter.im/red/red?at=60d7afbc24f0ae2a242ca0f5) greggirwin 23:00My instinct says you're making this harder than it needs to be, but I don't know enough about what you're *trying* to do to know for sure. GiuseppeChillemi 23:02I want to execute code on the remote side. I am passing commands together with their arguments. They are terminals values, words are used as symbols and no context is sent. I will try later to make remote work contexts for the lines I am passing. 23:02There is a reason I am choosing this way: 23:06**I am experimenting into creating commands that can be run either locally or remotely:** A command could be run as command/ref arg1 arg2 refarg1 but if you write server: HTTP://192.168.0.22 command/ref/remote arg1 arg2 refarg1 server Then command creates a block with its name and parameter, and executes it remotely. Then it receives the result from the remote server. 23:12(Remotely, the same command exists and it is avaliable inside the execution context) greggirwin 23:13Using a refinement to make it remote seems to be the complicating factor. As far as you're concerned, a call is complete (command/ref arg1 arg2 refarg1), correct? So you can store that internally as a block, and make the remote part separate if it's used. my-call: [command/ref arg1 arg2 refarg1] do my-call ; local RPC reduce [my-call 'on server] ; remote, semi-dialected block for fun. RPC does all the magic and the func is none the wiser. 23:14i.e. RPC sends the block to the server who does it, and returns the result. GiuseppeChillemi 23:31I don't know about RPC function but I remember having seen it in Cheyenne. Yes, refinement is the complication factor but I have chosen to have it on purpose. I have already made experiments with: * blocks * objects * Dialected blocks Mostly I have experimented creating functions whose arguments is a block or an object containing the arg/value pairs and build the internal function context bypassing the function interface, doing everything by hand. It worked well but the experiment goals is to pass regular Redbol commands and bind them to a remote object with contains the "allowed" commands and I want to take into the picture passing refinements too. This It is the most difficult thing as I have no way to get a make specs with refinents as set words. 23:34I have in mind that one day we will have protected contexts like in Rebol3, so we could safely bind blocks to them without removing refinements of functions, so cutting the expressiveness of Redbol languages. greggirwin 23:39RPC is just a placeholder name. :^) 23:41Red is about message passing for this kind of thing. Think of your RPCs as dialected message blocks, look at reb-services for inspiration, and keep us posted. GiuseppeChillemi 23:46@greggirwin I have already a RPC like function, it is called RUN-REMOTE. You simply provide a block of code and it Is executed remotely and you receive the return value. As I have said this experiment goal is to have regular functions which run on a remote server just having the /remote refinement set and passing the server address, so they recreate the command needed to run themselves. This to not change the current usual coding, otherwise everything would become run-remote compose [command/arg (arg1 arg2 arg3 refarg)] 23:49As make blocks are not usable for the refinement setting problem, it remains another approach, map everything to the apply syntax. I will try. 23:54(Edited) 23:55With /remote server the command just dispatches the request to an execution server` 23:55Goodnight! 23:58(I will reread your messages tomorrow as they contain other useful topics) Sunday 27th June, 2021 lnxw37d4:matrix.org 04:31It is time to add 2-3 new entries to https://www.red-lang.org/ so that people cruising by can see that development and use are still active. GiuseppeChillemi 07:57@greggirwin Another option to transfer the current function context words and refinements and the values, is to use the set syntax. It is perfect for keeping trace of refinements: ctx: [[a b c /red ref-arg] [a b c false false]] You have just to convert /red to word before executing set When words-of and values-of will be implemented for function it will be easy to write ctx: reduce [words-of context? 'ref values-of context? 'ref] Also set words argument could accept refinements, so you can simply write: set ctx/1 ctx/2 hiiamboris 08:15Nenad withdrew binding info from refinements so they won't be possible to set. GiuseppeChillemi 09:30I don't know the reason but I don't like this. It complicates the portability of blocks, forcing us to have a sidecar. hiiamboris 10:14Reason is refinements and issues are symbolic only tokens by design and should not carry any hidden payload. 11:14> By far my most common case for filenames is date-naming them, which isn't a good match for composite and handled better by format. It's [good](https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/visuals.red#L52) until you want to customize it a lot. GiuseppeChillemi 13:41The problem is that we do not have a direct make block nor a visual representation of the context with refinements information. Also, actually there is no easy way of getting the refinements from the inside without parsing the specs block. 13:45Once you get all in [[keys][values]] split form with refinement you have to make a last management of the keys block to extrapolate the refinements, change to words and build a separate refinements block in case you would need this information. 13:47While for objects contexts it is easy to manage, copy and transfer it, for function ones it is very complicated. gltewalt 17:36Sorry about my github blunders greggirwin 18:24@lnxw37d4:matrix.org thanks for the reminder. :+1: 18:26> It's good until you want to customize it a lot. I guess I've always customized them a lot, because it's so helpful IMO. e.g. zero padding counts and ISO8601 formatting dates, so lexical sorting works. Monday 28th June, 2021 gltewalt:matrix.org 01:38Backtick itself isn't hard to type. It's one keystroke on my keyboard greggirwin 01:43By itself, I agree. But #' has a shift and unshift, and '" ... "' has shift-unshift on each end, plus wide space between the backtick and quote, at least on U.S. keyboards. Using ticks, as Gitter is driving me mad trying to get backtick syntax right. gltewalt 01:48Wide space between backtick and quote, but backtick is close to the left hand About as close as ( ) is for the right hand hiiamboris 07:17@greggirwin if "..." is so utterly bad for you, let's consider just an empty issue # "...", because # is completely ugly and using only opening quote makes no sense to me, if it's quotes they should be on both ends. # "..." is somewhat similar to char syntax though. But then any other symbol allowed in issues will be better than backquote. ## #! #$ #% #= #| #/ #\ #. #~` 07:23I would still prefer them backticks on both ends. Simplest syntax and readable unless your font is not monospace and you're not using syntax highlights. 07:29![](https://i.gyazo.com/b160689cb5b800a07203c1a11ca127cd.png) (editor) ![](https://i.gyazo.com/f9b4fcf488cf72c1c58af96ce25d7349.png) (gittard) ![](https://i.gyazo.com/328317ebae76a9dc4f9f4a8296002ba2.png) (GUI console) this is how it looks for me without any steps done on my end (and I would highlight backticks and all operators) Tuesday 29th June, 2021 hiiamboris 14:31# A poll from Nenad ☻ Which way to you guys use try **most** of the time? 1. To silence errors, as in if error? try [...] [..after-error recovery..] 2. To catch errors and process them later, as in set/any 'err try [...] (... later err is processed...) 3. I never used try Please post your answers into thread if possible. Thanks. Oldes 21:22@hiiamboris may I ask what we should expect as a result of this poll? And why Nenad is not asking here himself anymore? greggirwin 21:26The new try/keep feature is there now, for including stack traces, but we don't know if it should be the default. Being on Gitter can take a lot of time and pull focus. When there's a Nenad sighting, people tend to swarm. I'm sure he'll reappear here at some point. gltewalt:matrix.org 22:45Instead of try / catch, how about... what amounts to enums... custom types that only accept a few things - either succeeds or the error message comes directly from the type greggirwin 22:55Do you mean like specific exception values, as in Java? 22:56Note that in Red try/catch isn't a thing. We have throw/catch which is not specifically error related, but is about general non-local flow control. gltewalt:matrix.org 22:57See the chit chat room 22:58Yes, but when I think of try, catch is always trying to sneak into to the party 22:58Into greggirwin 22:58Ah, category types as in Haskell, got it. 23:10For those more versed in Java and Haskell, the two approaches are very similar, aren't they? You have to declare all the specific exception/error types that can occur, and then you need to specifically handle each one of them. gltewalt:matrix.org 23:17I dont know much about Java. I could never bring myself to use it. 23:25You handle each one in a custom type that ideally models your application - for error messages, There's a separate type for recovery. greggirwin 23:44It's an age-old question, without a single answer that is right for every situation. Treating errors symbolically moves toward general symbolic computing, which Red is well suited for. Thursday 1st July, 2021 kskarthik:poddery.com 06:31Does red standard lib has http server ? That would be useful rebolek 06:41@kskarthik:poddery.com that certainly would be :-) Current Red’s IO is pretty limited, you can do requests and not serve anything, however, there’s IO branch with the new IO which can do both and you can write a HTTP server with it. I am working on [one](https://gitlab.com/rebolek/castr/-/blob/master/hub.red) and I believe there will be some simpler variant in the standard library (basic HTTP/1.0 server can be done in few lines). 06:48Here’s the server in [action](https://www.rblk.eu/) 06:48it’s not much, I know :-) kskarthik:poddery.com 06:50@rebolek: nice!! rebolek 06:53@kskarthik:poddery.com Thanks! My current focus is not content, but strong server security by default where it does not stand [very bad](https://observatory.mozilla.org/analyze/rblk.eu) hiiamboris 07:15Looks like we've got [trojans uploaded to our wiki](https://github.com/red/red/wiki/Home/_compare/3df062ff4a8a066e5eb703839f6eb90733df65b1...6ca9cffa04967bb06375bf2401e1ff0477dfd808). I reverted it and reported it using GH form, for now. kskarthik:poddery.com 07:16@hiiamboris: github wiki's are editable by anyone. Better to move wiki to version control hiiamboris 07:17If that repeats we should consider it. OTOH, being editable is convenient for us all. greggirwin 17:16Thanks for taking care of that @hiiamboris. GiuseppeChillemi 22:01Do we have a function that creates a contex and binds the following code to context it running? I want to create a with function: with [a: 33 c: 33] [...code...] Which is equivalent to: do bind [...code...] make object! [a: 33 c: 33] But I would like to know if it already exists. greggirwin 22:07https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/with.red 22:08Feedback is welcome, as there are many variants out there and it's likely something we will make standard. GiuseppeChillemi 22:33This would make elements setting in objects really fluent. 22:34Oh my God, I have deleted everything instead of editing it! :-( 22:42Here I am again: Why not allowing path in parse SET? It would make setting values in context very easy: (Please pardon me the wrong usage of IFbut I have still not studied it) valid?: func [data test-name] [ result: switch test-name [ size [either data ... [true] [false]] position [either data ... [true] [false]] ] ] options: [size 300x200 position above] ctx: make object! [ size: none position: none ] parse options [ set ctx/size 'size pair! (if not valid? ctx/size 'size] [fail!] set ctx/position 'position word! (if not valid? ctx/position 'position] [fail!] ] 22:43Note: options: [size 300x200 position above] 22:44But Gitter removes the number 3 for no reason! greggirwin 23:00@dockimbel noted [here](https://github.com/red/red/issues/3528) that path's higher overhead is a primary reason they aren't supported. However, if you don't use paths and aren't penalized, I don't see why those who want to use them shouldn't be allowed to. As long as they don't complain about performance. If there's no wish ticket for that, feel free to open one. Friday 2nd July, 2021 toomasv 04:41@GiuseppeChillemi You can bind the rule to ctx. E.g. working example: between?: func [data min-test max-test][ all [min-test <= data max-test >= data] ] valid?: func [data test-name] [ switch test-name [ size [all [between? data/x 250 500 between? data/y 200 400]] position [find [above below left right] data] ] ] ctx: make object! [size: none position: none] options: [size 300x200 position above] parse options bind [ 'size set size pair! if (valid? size 'size) 'position set position word! if (valid? position 'position) ] ctx == true ctx == make object! [ size: 300x200 position: 'above ] GiuseppeChillemi 05:51@toomasv thanks, I know this tecnique but it has 2 drawbacks: you can't use it on blocks; the more the size of the context words, the more the probability it uses words between parens (in case of longer and parse rules and code in parens). 05:52*in case of longer parse rules and code in parens toomasv 06:30@GiuseppeChillemi What do you mean in (1)? Do you mean subrules as named blocks? For (2) you can use @hiiamboris' bind-only to pin-point binded words; or even bind same word to different contexts in different parts of the rule. hiiamboris 11:05Don't forget you can write parse options [set ctx/size ..] as parse options reshape [set !(in ctx 'size) ..]. See [reshape](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md) 11:06You get precisely bound words this way. 11:08You pay a little cost of preparing your rule block, but you don't pay extra during parsing. GiuseppeChillemi 12:39@toomasv I simply mean: struct: [size "aaa" position "bbb" color [background none text none]] options: [size 300x200 position above background red] parse options [ 'size set struct/size pair! if (valid? struct/size 'size) 'position set struct/position word! if (valid? struct/position 'position) 'backgound-color set blk/color/background word! if (valid? blk/color/backgropund 'colors) ] 12:46@toomasv @hiiamboris Bind-only and Reshape are nice functions but the former does not use path notation; the latter uses it but statically, at rules block binding. I prefer having the path notation 1) to keep the flexibility this gives to me when set word is expressed as setrule: [set word] 2) to avoid loosing myself when mentally transforming complex Parse rules !!! (Like multiple stacked compose). I am human and I have my limits. hiiamboris 12:58Why stack compose? 13:07Anyway, paths are cleaner but are not gonna be there anytime soon (unless you PR it and defend ;) GiuseppeChillemi 13:58@hiiamboris > Anyway, paths are cleaner but are not gonna be there anytime soon (unless you PR it and defend ;) The ultimate defense is simplicity. As "stacking compose" I mean the code practice where you nest multiple compose calls, which can be generalized as "the code practice where you have to transform the block of code multiple times under compose/reshape like functions". This forces you to keep in mind the reshaping/transformation mechanisms of the functions you are using for this purpose; multiple meta states of the code block; the relevant elements; the final version of the code and where it will interact. *Paths are simple, visible, straightforward with no layer of complications: what you see is what you manage.* The second side defense is @greggirwin one: if you have heavy overhead only when using them, well it's your choice as no one will have penalties for these features. 14:36I have looked at https://github.com/red/red/issues/3528: Doc refers to tight loops overhead in a scenario of parse reducing word to their content for RULES, like >> rules: [end: [to end]] == [end: [to end]] >> parse "foo" [rules/end] == true Which usually happens far more frequently than set ctx/key in my usage scenario. But even as rule word reduction, you should not have any overhead in standard usage if you put the check for path after parse check for word as once a "word" is found, the extra check for "path" is not performed. In any scenario, you have overhead only if you use paths, it's your choice! Oldes 15:45Paths should be supported imho. I believe that using bind as a workaround is much heavier solution than processing paths. greggirwin 15:59 w-rule: [to end] b-rule: [end: [to end]] o-rule: object [end: [to end]] oo-rule: object [a: object [end: [to end]]] ooo-rule: object [a: object [b: object [end: [to end]]]] count: 1'000'000 x: [loop count [[to end]]] w: [loop count [w-rule]] b: [loop count [b-rule/end]] o: [loop count [o-rule/end]] oo: [loop count [oo-rule/a/end]] ooo: [loop count [ooo-rule/a/b/end]] profile/show [x w b o oo ooo] Time | Time (Per) | Memory | Code 0:00:00.035 | 0:00:00.035 | 440 | x 0:00:00.042 | 0:00:00.042 | 284 | w 0:00:00.074 | 0:00:00.074 | 284 | o 0:00:00.084 | 0:00:00.084 | 284 | b 0:00:00.093 | 0:00:00.093 | 284 | oo 0:00:00.112 | 0:00:00.112 | 284 | ooo 16:04Naturally parse needs to check for the new datatype as well, which adds to this. And this is just reading the value, not setting it. But if the user isn't paying the cost when the feature isn't used, this seems like a useful way to modularize rules. Of course, creating "modules" of common rules, assuming people use them, means many people are paying that price for common rules. Oldes 16:35I don't say that paths have no cost.. just that using bind on a large block of rules is also not cheap. 16:36Not mentioning that not every parse call must be in a tight loop. greggirwin 20:35Personally I think it's worth supporting. GiuseppeChillemi 21:57About opening a wish ticket: my feelings tells me that anything requested by me, because of my past exchanges with Doc and Vladimir, has an higher chance of being rejected. As I think this feature is very important, please someone else should take the task, so that another name appearing on the github ticket won't trigger automatic negative responses. Hovever, I will try to partecipate if I feel this won't damage the request too. greggirwin 22:07I don't think it's anything personal @GiuseppeChillemi, just that your wish tickets often push boundaries, where we tend to be quite conservative about what the core does versus what users do in their own code. This is perhaps the most difficult part of design: a lack of evidence and information. Putting things in the language is forever (nearly always), so if there isn't general consensus (given our small community), we play the waiting game. GiuseppeChillemi 22:42@greggirwin I don't think all of my ideas have been rejected because my exchanges with Doc and Vladimir: some were good, some were wrong, some were already possible without changing the language (I was inexperienced). But I feel this one is more important than the others, so if there is a chance my name could harm it being adopted, it's the time I should step back. I will write the next but not this one. ;) Saturday 3th July, 2021 ALANVF 01:58is this official? looks cool af https://beta.red-lang.org/ gltewalt:matrix.org 02:52Yes, just not quite ready yet GiuseppeChillemi 13:30I have added the path in parse request as comment to https://github.com/red/red/issues/3528 Monday 5th July, 2021 rebolek 06:53I have some strange troubles with git, after doing git pull I get an error: Your configuration specifies to merge with the ref 'refs/heads/master' from the remote, but no such ref was fetched. however, when I list remote branches, master is of course there. Anyone experienced same problem? hiiamboris 07:06Try comparing config to a fresh clone? rebolek 07:17My repo says there is only one remote branch, IO and I'm not able to convince it that it's not true. I moved the repo elsewhere and made a new clone, I don't have time to argue with Git. hiiamboris 08:22likely some .git/config corruption.. for whatever reason gltewalt 18:40Did someone delete or rename a remote branch? Tuesday 6th July, 2021 rebolek 04:30I don't think so, I had troubles with a master branch which obviously is still present. Thursday 8th July, 2021 Oldes 13:04Try main branch.. looks like Github is doing anti-slave movement. 13:09https://github.com/github/renaming greggirwin 17:29The problem I see is that this particular change is based on incorrect language interpretation. In this context master is not a noun, it's an adjective meaning "original" or "primary". Could we also use one of those words? Sure. We used to call the main branch trunk, which is great when working with metaphorical branches. Though the analogy breaks down because branches don't naturally grow back into a trunk. But in the days of DVCS, are we still holding on to old notions beyond their time? I ask this for a reason, imagining distributed system models, but don't have an answer, linguistically or technically. Friday 9th July, 2021 kskarthik:poddery.com 11:28Homoiconicity in red ? I read that rebol has it rebolek 13:47yes GiuseppeChillemi 23:03@greggirwin Master is the element used to create all the other copies. In history we had master tape recordings, video... . I still remember having read that Ray Charles was the first black artist who owned his song masters. So, losing Master as word, Github looses one of the most important words which rapresent black people success and liberation. Saturday 10th July, 2021 hiiamboris 06:40That's modern attempts to rewrite history :) Respectech 16:30Politics and wokeness is getting into everything. I agree that we should try to not offend people, but sometimes woke people try to protect other people even when they don't feel they need it. My father was an actual slave the first half of his life, was discriminated against, beaten, and treated very poorly. I never thought to be offended by the terms Master and slave. They are an accurate description. But somehow people whose ancestors were slaves many generations ago are offended by it? ne1uno 17:01when I see default, think of options. when I see master I think of slave and I'd rather not. YMMV 17:05I do agree the search for politically correct speech is never ending with diminishing returns. master/slave is kindof where it began. why'd it take so long? 17:16grandmaster, master craftsman, master apprentice and all the others probably remain but git & other RCS really have no excuse for piling on. lnxw37d4:matrix.org 21:01You can't control what git and github decide to do, and we do want to be non-offensive when possible, but master has so many other meanings besides slavery. My ancestors were slaves. My grandfather had to flee his hometown to escape a lynch mob. There is nothing in a 'master' branch that reminds me of slavery. A master is the original, from which all others are copied. I hope we can move on and stop obsessing about non-issues like this. /off-topic GiuseppeChillemi 21:12Personal note, 2 years ago I have registered the domain masterslave.it . When I will find the time I will make something of it. Any ideas/proposal about it content is welcome. Sunday 11st July, 2021 gtzip 17:47Italian dominatrix site? GiuseppeChillemi 18:22No, site on "master/slave" language change. (If you wish, let's continue in CHIT-CHAT or privately) greggirwin 18:32I was going to post the same joke as @gtzip. :^) GiuseppeChillemi 18:39Yes Master! Monday 12nd July, 2021 tmphei:matrix.org 09:42Hey folks! When we will be able to see a new roadmap of the project? I understand that team is working hard but nobody knows what exactly is happening. Red looks dead from the outside world: no news, no blog updates, etc I’m super excited about the language and everything you guys doing, but lack of visibility makes adoption hard. Does anyone have anything to share? GaryMiller 12:11Do you know about this site https://progress.red-lang.org/ by looking at the issues you can see what is being worked on but not really why? in terms of prioritization. Also I see sometimes that a lot of bigger stuff is taking place in separate branches not quite ready to reveal yet. At least I hope that is true. mikeparr 12:22Just a note to say that on the official Red site - download page - the link to the source zip (https://static.red-lang.org/dl/auto/red-latest-source.zip) does not work. meijeru 13:15I remember that same condition from some time ago... It was solved rather quickly then, I think by @x8x x8x 14:40We don't provide source download anymore so I removed the links from the download page. Preferred way moving forward is to clone the repo git clone https://github.com/red/red.git, alternatively, go to https://github.com/red/red/ , click the green button Code just above the files list right side and select Download ZIP. I don't think these need to be mentioned on the download page as someone interested in source would probably know, let me know if you have an alternate view, thanks! 14:47Me think @tmphei:matrix.org is right in his request, about time to give the [Roadmap](https://token.red-lang.org) an update as a sign of respect for the investors at least! greggirwin 17:51We have the Fork Me link now, but a small note at the bottom of the download page. "For source downloads use Github." wouldn't hurt. If they scroll past binary downloads, they're looking down the page, not up. 17:56We have been meaning to do a new blog post for some time. Thanks for letting us know you want it. Tuesday 13th July, 2021 GiuseppeChillemi 08:48Is there a site where you can download assembly language instruction for a specific processor and its opcode? 08:49*opcodes meijeru 10:30"We don't provide source download anymore" I am fine with that, but the "preferred way forward" could be mentioned on the pages where the link used to be. hiiamboris 10:39Why not hotlink it directly to https://github.com/red/red/archive/refs/heads/master.zip ? greggirwin 17:08One of the thoughts was to simplify things, as many more people care about the binary than the source. Linking to the zip on github works for me to. 18:20@greggirwin (coming from red/help) I made a few more tweaks to https://github.com/red/red/wiki/Coming-to-Red-from-Python. The last paragraph in the context section is great, whoever wrote that. It distills things very well IMO. @gltewalt:matrix.org recently noted that we never played up the power of libRed after showing the really cool Excel demo Nenad did. I agree that we should, and do some that are more practical. If we have any Excel users who want to pursue that, we'll advise and sponsor the work. I also think that could be really cool for Python, given the new intros we have. If Pythonistas face some pain that Red could help address, libRed may be the most effective way for them to do it. Just as Red/System can be applied in a targeted fashion. Examples would be parsing or GUIs, but maybe also config files. I recently dusted off some old config lib code and notes and want to see that built in (after HOFs and CLI). It's a near-universal need, and one I think Red can serve better than JSON, YAML, TOML, EDN, INI, and others. Configurations tie to more than just local files though. I put them in a "hierarchical environments" category. What I mean by that is starting with a template or skeleton and overlaying or extending it with "more local" information. Very much like scoping. Many features intersect, which makes the design challenging. Lock one thing down tight and it makes other things harder to do. Like tightening bolts a little bit each, adjusting as you go, until the thing you're bolting down (the design) is lined up so it doesn't cause any of the bolts to bind. Another way to approach this is via abstraction and interfaces, letting you build plug-in systems. We need a balance, and choosing each approach appropriately. And just because Red offers a tightly integrated solution doesn't mean people can't write other plug-in based models themselves. Our solutions won't serve everyone's needs or solve every possible problem. That's not the goal, which is good because it's unattainable. :^) hiiamboris 18:29Config files: ideally format of those should also be user-configurable somehow. Because some people may not want to learn a new config format (time spent on that may have no justification) and work with the thing they know best. greggirwin 18:32That would be a config codec system. 18:33So while we may have a default Red-based format, codecs could be applied in a plug-in fashion. 18:34The trouble, of course, is that you immediately run into the issue of what values can be represented in any other format. hiiamboris 18:40Yeah Wednesday 14th July, 2021 greggirwin 19:04I was recently going to point @GalenIvanov to https://github.com/red/docs/blob/master/en/ownership.adoc for how ownership works, but found that the example there (from the original blog post about it) no longer works. I just spent a few minutes banging on it, having not touched ownership myself for a long time, and it's behavior is not intuitive to me. i.e., my quick hacks didn't work. I know @hiiamboris has done quite a bit with it, and opened a number of related tickets, but he's quite busy. Would someone like to play with ownership, documenting its current behavior in detail, with examples, on a new wiki page? From there we can update docs. Others of us can help and test, and maybe @hiiamboris can do a quick primer to help us ramp up. We will sponsor this work. It's a powerful feature, but needs more people using it to move the design and ticket processing forward. Noting tickets, limitations, and workarounds should also be a part of this. hiiamboris 19:14How it works - see ?? deep-reactor!/on-change*. Limitation of the current model is if series is shared it may be "stolen" from the observer that listens for events. This is bad. greggirwin 19:20> How it works - see ?? deep-reactor!/on-change* ROFL! Yup. Technically accurate. Tells me nothing. If nobody else wants to do it, I will, but I'm busy too. ;^) hiiamboris 20:00Example looks broken yeah. Deserves an issue IMO. OTOH maybe not, it seems the implementation has been changed a lot. To make it work use appended action instead. On design, some notes are also here: https://github.com/red/red/issues/4524 greggirwin 20:21That was my guess too, and why my hacks didn't work. Here's what I banged up: numbers: object [ list: [] on-deep-change*: function [owner word target action new index part][ print mold action if word = 'list [ switch action [ poke insert append [ if not integer? new [ print ["Error: Item" mold new "must be an integer."] print mold target remove target ;target: back target ] ] poked inserted appended [ sort list ] ] ] ] ] probe append numbers/list 3 probe append numbers/list 7 probe append numbers/list 1 probe insert next numbers/list 8 probe poke numbers/list 1 4 probe numbers/list probe append numbers/list "hello" probe append numbers/list "trigger" probe numbers It's not obvious when/how/what to do in response to events to force changes. e.g. append isn't a "pre" event that you can cancel, which is the intuitive meaning in my mind. Saturday 17th July, 2021 bkalef88_gitlab 13:13@greggirwin, is there a link to the red/lib excel library demo? ldci 17:30Hi. Very proud to announce a new tool for monitoring epilepsy in infants. Code use Red/System, Red and OpenCV binding. 17:30[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/oCST/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/oCST/image.png) 17:40oups uses GalenIvanov 17:43@ldci That's great! gtzip 17:46https://github.com/red/red/tree/master/tests/libRed greggirwin 17:47@bkalef88_gitlab - https://github.com/red/red/tree/master/tests/libRed - https://github.com/red/red/blob/master/libRed/libRed.bas 17:47Absolutely wonderful @ldci! ldci 17:51@greggirwin and @GalenIvanov Thanks a lot. We can do professional apps with Red now:) greggirwin 18:05And apps that make the world a better place. So inspiring. pekr 18:25@ldci - really sounds great. Will post to FB group tomorrow. Please, what do you mean by "now" - because of the RedCV getting certain functionality, or something new in regards to Red? ldci 18:28@pekr - Just meaning that Red is sufficiently stable and usable pour real apps and not only POC:) pekr 18:52Thanks! Respectech 19:36@ldci My first grandchild was born yesterday. Thankfully, she is healthy. But it is comforting to know you are helping others not as fortunate. Great work! greggirwin 20:04Congratulations Bo! Sunday 18th July, 2021 ldci 04:05@Respectech Congratulations GiuseppeChillemi 09:30@Respectech Nice, congratulation! I am on the first phase, in a couple of months I will be huncle for the first time. It will take about 25 years to reach your level. planetsizecpu 13:18Great job @ldci much encouragement. @Respectech congratulations! Ominous333 16:34Hello, do you know when or if support for this language will be native to Apple Silicon in the future? I am really fascinated by the type system and macro's this language has to offer. I think what you guys on the Red Team are doing is innovative. Please let me know, thanks in advance! greggirwin 17:37@Ominous333 welcome! There are no plans to support Apple silicon at this time. Personally I don't know anything about its architecture or instruction set, so can't even predict how hard it might be to do. If we do (no guarantees) target LLVM as a back end, that's probably how it would happen. Apple is apparently going to help provide that support in LLVM. lnxw37d4:matrix.org 17:39I think Apple's chips are ARM-based. greggirwin 17:58That makes things easier. PeterWAWood 21:59Apple cpus are designed to use ARM Instruction Set Architectures. At the moment, Apple uses ARM 64-bit ISA Version 8 which I believe still supports 32-bit instructions. ARM has released ISA Version 9 which will not support 32-bit instructions. Apple was the first company to produce a Version 8 CPU and is expected to be the first to produce a Version 9 CPU. 22:01I suspect porting 32-bit Red to Apple's M1 chips woould soon lead to a dead-end. Monday 19th July, 2021 greggirwin 00:35Certainly 64-bit is our first priority. As we plan that in more detail, we need to consider options that don't paint us into a corner. Tuesday 20th July, 2021 spTorin 14:40I saw the site https://enso.org . Interesting implementation of the NODE programming. But installation package is 1 GB in size. It seems to me that Red is an ideal environment for creating such a project, only simpler and more lightweith. CodingFiend_twitter 18:17The Apple M1 chip will be soon replaced by the much nicer M2 chip. The M1 was just their first try at making their own silicon. Not a very pretty situation as they haven't documented it that thoroughly. I expect the M2 to be their workhorse chip for most of their line. But i expect it to ship early next year. That will be the ideal mac target. The M1 chip will likely be one of those orphaned mac products, as Apple is fairly ruthless about forcing people to upgrade. They just added 3000 engineers to the Berlin campus, where the chip is developed. That's a lot of people to hire in one year. greggirwin 18:18Great info @CodingFiend_twitter. Thanks! 18:31:point_up: Any takers on [ownership](https://gitter.im/red/red?at=60ef3541515cab3e4fb9f210)? 18:34It should be fun, pretty much playtime we'll sponsor. In addition to dry docs, what cool tools could you write to see ownership in action? @gltewalt did [Parse Caddy](https://github.com/gltewalt/parse-caddy), and I'm working on something similar to help with the design of a new split function. zentrog:matrix.org 18:47Ownership does sound interesting, but I don't think I could commit enough time to it right now. I was curious if there are some high-level design goals for it, besides just "support for reactivity", or was that the entire goal? The request sounds a bit like defining it through reverse engineering greggirwin 19:16"Reactivity" is a general term, but what features like this enable go by many names: eventing, flow-based, and instrumented being a few. It also offers a data-oriented spin on FRP. With FRP everything channels through functions, with data as the payload. With DRP (Data Reactive Programming) that view pivots. Maybe it does anyway. I don't know...yet. It hasn't been outside the known context(s) that justified it. Combine ownership with reactivity and what does a "spreadsheet cell" look like as a deep reactor? Or maybe an object can track its change history, which could be used for debugging, auditing, and live system version control. If it persists its history, now you're looking down the Alan Kay Croquet alley. But to start with, how does it work now? Is it easy to understand by someone other than the author? Does it have limitations we need to address before using it more widely? What other types can and should be "owned"? Certainly maps come to mind, and probably other objects. But is the latter the purview of ownership, or is that where the reactive system comes into play? So this task is a combination of exploration, explanation, and extrapolation. hiiamboris 20:10Here's a thought along these lines, but of lower level. Our interpreter reinterprets every block every time as if it may have changed. If loop evaluates it's body 1M times, we pay for 1M evaluations, even though I've never seen anyone modifying loop's body from the loop itself. If we could track changes of words values/context back to the body block, and if interpreter could cache each function/op call in the block, and invalidate this cache on change, we could save the interpretation cost of each loop and function. This would be like JIT-compilation but more flexible as it would allow you to change the code. zentrog:matrix.org 20:38The word "ownership", to me has connotations of control, like access control, and responsibility (for things like cleanup, or some other management of the owned things). I don't know that it implies any of that in this case, or if there would be any plans for stuff like that in the future. I'm just trying to understand the scope of 'ownership' specifically, since it's somewhat distinct from reactivity, which I think I have a better grasp of greggirwin 21:25Naming is hard, always. It's really a specific take on the observer pattern, currently limited to having one observer; hence the "owner" moniker. gltewalt:matrix.org 22:39Trade of for that efficiency would be lots of memory wouldn't it? 22:39(That was supposed to be a reply to boris) zentrog:matrix.org 23:48@greggirwin: That's great! That really tells me a lot about what it is. Not that I think the name should be changed, or that this would even help with understanding, but I think "beholder" would be a fun alternative :) Anyway, it's an interesting design decision. It should be pretty easy to wrap it with a subscription-based observer if needed, so it doesn't necessarily give anything up, but I imagine the implementation is much simpler greggirwin 23:50It's simple and it's very lightweight. Although @hiiamboris' node! design could probably also keep it light, while supporting graphs of observers. Wednesday 21st July, 2021 gltewalt 00:06Couldn't you "protec" system/words with on-deep-change*? 00:06Lock the system down greggirwin 03:35We'll get a secure dialected func for word protection. Ownership wouldn't work for that today, as it doesn't trigger on binding, only series values. pekr 04:05@hiiamboris I like that JIT without actually JIT loop speedup potential 🙂 hiiamboris 06:02> Trade of for that efficiency would be lots of memory wouldn't it? That's up to the implementer :) We don't evaluate every block we create, so we could start from only attaching a cache to blocks on do or reduce. Thursday 22nd July, 2021 greggirwin 17:39https://fourtonfish.com/project/redacted/ is interesting. It's a clever solution, and something we could build into a Red browser. If we had a screenshot feature built in, e.g. so users could send bug reports, it could even be an option to automatically apply it when screenshots are taken. Friday 23th July, 2021 ALANVF 01:05hmm, how come 0:00:01 = 1 and 1.0 = 0:00:01 are true, but 1 = 0:00:01 is false? 01:05seems to directly contradict this line here https://github.com/red/red/blob/master/runtime/datatypes/integer.reds#L270 01:05is this a bug? greggirwin 01:07What build are you using? >> 0:00:01 = 1 == true >> 1 = 0:00:01 == true ALANVF 01:08july 2nd (latest build in Nix) 01:10(runnable here https://replit.com/@theangryepicbanana/nixed-red) greggirwin 01:14Nix shouldn't be different here. Interpreted or compiled? Interpreted here it looks like it was fixed last Aug or Sep. ALANVF 01:15currently using the interpreter greggirwin 01:16 >> about Red 0.6.4 for Linux built 21-May-2021/6:47:54 >> about/debug Looks like this Red binary has been built from source. Please download latest build from our website: https://www.red-lang.org/download.html and try your code on it before submitting an issue. 01:16I wonder if something is out of sync in that build. ALANVF 01:17huh 01:27huh it won't let me pass -c/-r 01:39well anyways, even the preprocessor says that it's false 01:41seems like a bug to me greggirwin 03:11Can anyone else reproduce it? gltewalt 04:00reproduce it in latest Linux build? Or that 21-May build? hiiamboris 07:36true in 4th of july build rebolek 08:07also true in July 7th build Saturday 24th July, 2021 ALANVF 18:01curious, are tuples implemented as a single integer or an actual pointer? 18:01can't tell from the R/S impl hiiamboris 18:083 integers 18:0896 bits 18:09https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L289 ALANVF 18:26@hiiamboris yeah I was looking at that, but I wasn't sure what it meant. thx GaryMiller 18:41It say 3 to 12 here and gives examples https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html ALANVF 18:42:thumbsup: Tuesday 27th July, 2021 greggirwin 18:41Just found https://maggieappleton.com/. I've only read one article so far, but the importance of figuring out how to explain things, visually and otherwise, and help people learn can't be overstated. GalenIvanov 18:51@greggirwin Looks interesting, thank you for sharing! greggirwin 19:08WikiWolfram? https://meta.wikimedia.org/wiki/Abstract_Wikipedia 19:11[The project](https://cacm.acm.org/magazines/2021/4/251343-building-a-multilingual-wikipedia/fulltext). Look at the code/data example syntax. Wednesday 28th July, 2021 ALANVF 12:57why isn't the use native from Rebol in Red? 12:57seems pretty useful GalenIvanov 13:45@greggirwin Wikifunctions and Abstract Wikipedia are really interesting concepts. They will allow the knowledge to be accessible in more human languages and more easily processed digitally. greggirwin 18:53For those not in the [gui-branch](https://gitter.im/red/red/gui-branch) room, check it out. @GalenIvanov has created a really fantastic app based on Truchet Tiles. 19:06@ALANVF it's useful, but hasn't been determined to be useful *enough* to be included yet. You can create a simple version like this to play with: use: func [ "Defines words local to a block evaluation." vars [block!] "Words local to the block" body [block!] "Block to evaluate" ][ do reduce [has vars body] ] hiiamboris 20:14I'm using [with](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/with.red) for the same thing. More often I would initialize vars as with [a: 1 b: 2 c: 3] but when I just need to hide them, I'm using with [a: b: c: none]. 20:16Use cases are quite rare, and mostly when loading the script. Thursday 29th July, 2021 MikeRobbieNZ 08:26Hi as a Red newbie I was wondering if the language has any connectivity to MSSQL or similar databases? Amazing GUI capability in this language, even for a newbie! Thanks for any answers in advance!! greggirwin 16:22Welcome @MikeRobbieNZ! No MSSQL yet. You can see some bindings [here](https://github.com/red/code/tree/master/Library), but many more will be done once we add FFI to Red. Right now you have to write them in Red/System. After full I/O is released, we'll likely see a MySQL driver as the first DB connector. ALANVF 20:01@greggirwin yeah but my thing about it is that it has some overhead due to the function call (and also means I can't use return inside of it) greggirwin 20:191) Don't worry about the overhead. :^) 2) Can you provide an example of how it differs from R2's use behavior? MikeRobbieNZ 20:45@greggirwin Many thanks! A MySQL driver will be awesome! Friday 30th July, 2021 giesse 18:40> @greggirwin yeah but my thing about it is that it has some overhead due to the function call (and also means I can't use return inside of it) use is always going to have a lot of overhead (you need to bind/copy, otherwise it would break recursive functions etc.) R2 has a flag for the returnissue, I don't recall if Red does too; I prefer a different solution to that problem though (function-local return). greggirwin 18:59Return is one of the most painful exceptions that might be worth making. hiiamboris 19:24> function-local return @giesse you mean each function when catching return exception should match it's context against returned one? Saturday 31st July, 2021 btiffin 03:32The red-lang.org home blog page needs an update. ;-) greggirwin 16:48In the works, as is the new web site. We're going to make it happen. giesse 18:41> > function-local return > > @giesse you mean each function when catching return exception should match it's context against returned one? In Topaz, return is a word local to each function. It does not exist as a global word or native. >> f: func [a [number!] return: a+1 [number!]] [print mold this-context return a + 1] == func [a [number!] return: a+1 [number!]] [print mold this-context return a + 1] >> f 1 context [ a: 1 return: #[return [a+1 [number!]]] ] == 2 >> return 3 *** Script error: Word has no value: return *** Stack: return 3 >> g: func [return: a b] [return 2 3] == func [return: a b] [return 2 3] >> g == object none [ == a: 2 == b: 3 == ] 18:42what that means is that if you pass a block of code to some other function, and it has a return in it, it will be bound to the right function and work as expected without any weird hacks. 18:42(additionally you can return multiple values, or check the type of return values etc.) 18:43(as well as document what is being returned in the function spec) hiiamboris 18:45But it's not a word referring to a value anymore? A keyword? 18:46How does #[return [a+1 [number!]]] know the context? Monday 2nd August, 2021 btiffin 04:27> In the works, as is the new web site. We're going to make it happen. All good, Gregg. REBOL, Red, so good; but there is always a horizon of bigger newer better. And the future one, is the one ya want. :-) Decades now. [Bigger smiley] And the whole time, REBOL has been a near perfect tool, Red expanding the sphere. And yet still, the yearnings... [Biggest smiley] As always, have good, make well. giesse 18:42> But it's not a word referring to a value anymore? A keyword? Inside the function it refers to a special native. 18:47https://github.com/giesse/Project-SnowBall/blob/master/topaz/types/return.topaz#L30 18:49(it basically just throws an internal value - https://github.com/giesse/Project-SnowBall/blob/master/topaz/types/return-value.topaz - which is caught only by the appropriate function) gltewalt 23:47Concerning the stray topic in red/help, I only bring up rust, because so far, everything I've learned about it is thought out and 'seems' to be done well Tuesday 3th August, 2021 gltewalt 00:12And they have more of a comment system so far greggirwin 00:45@zwortex, regarding [this](https://gitter.im/red/help?at=610891511a1db149e9f64028), don't forget %.reds files. 00:46Ah, I see now that you do. 00:49It would help if you just summed up the count of lines you think would be affected. I can't really tell without teasing all your numbers apart. Remember, this is the stage where ballpark numbers are all we need. 00:52At a glance it looks like you found ~200 instances that would break. Is that correct? In any case, if you want to pursue it, make a proposal. zwortex 01:03@greggirwin I still don't get it. As mentioned at the end of my listing, there are only those **2** cases where ;;; is used in the current code. All other cases mentioned (234 + 6 = 240) with ;; would only break if you were to break them yourself, attempting to comment out those lines with a badly behaved function of your ide, one that would prepend comment with ";" instead of "; ". My current proposition is that ;; behaves the same way it does already unless a double ;; comes up before the end of the line, in which case that should close the comment within that line. And as for triple ;;; - they should supersede all ;; or ;. greggirwin 10:50Look at %system/runtime/start.reds. A huge number of comments there start with ;; and would break, correct? But the real point is that this would be a breaking change and requires a strong, formal proposal for evaluation and continued discussion. Given that there are other ways to do this already, and has been discussed in depth in the past and rejected, you have your work cut out for you. zwortex 12:00@greggirwin , short answer not - my proposition is that ;; behaves the same way it does already... Anyway, I would write the rep and leave it there. hiiamboris 12:04@greggirwin lack of sleep has it's costs you know ☻ He proposed ;;; (**triple** semicolon, not double) right from the very start. zwortex 16:03Added the following entry https://github.com/red/REP/issues/107 - if this matter is to be further discussed. Cheers. hiiamboris 17:56Good job :+1: greggirwin 18:08Indeed, I must have misread double vs triple, which I will blame on old eyes and that they look sImIIar. 18:08Thanks for the detailed writeup @zwortex. I will try to review later today. Wednesday 4th August, 2021 greggirwin 00:23[New blog post up!](https://www.red-lang.org/) Respectech 00:56Yay! Reading it now. 01:00Great blog post! ldci 01:06@greggirwin Great hearing about you:) pekr 03:15Hi Gregg. Thanks for the Blog article, it was about a time :-) Not because of us, who live here on a daily basis, but mostly because external / first time users, guessing, if the project is alive or not .... 03:17One thing - you nicely mentioned various efforts, including Red Spaces. I would add another one - not sure how much reactivity is used by end users, but I can see a PR, which is supposed to make it generally faster too. I hope that PR of @hiiamboris is going to be accepted .... planetsizecpu 06:52Ah, new blog post is great news, much encouragement @GreggIrwin keep going 😀 lnxw37d4:matrix.org 06:54Likewise, I’m glad to see the blog post … occasional public activity helps the project’s image immensely, IMO. toomasv 07:02Great overview, thanks @greggirwin ! GalenIvanov 07:41Thanks for the blog post, @greggirwin greggirwin 15:56Thanks all. @pekr, there are a *lot* of projects. So many that even I can't keep track. We should note that one in the next blog article. ninja-seahorse:matrix.org 16:29Hello. I'm new to Red. I've compiled the red binary from source using Rebol on Windows 10 using the command [do/args %red.r "-r -t Windows %environment/console/GUI/gui-console.red"], but the resulting gui-console.exe won't let me compile programs. It just launches the red console and says "Access Error: cannot open: %-c". Am I doing something wrong? greggirwin 16:30Use red.exe directly to compile. TimeSlip 16:30@ninja-seahorse:matrix.org Compile your app via the CMD and not the gui-console. ninja-seahorse:matrix.org 16:30How do I get red.exe from the source? 16:31Not sure if I'm using the right command in Rebol to compile Red itself TimeSlip 16:33@ninja-seahorse:matrix.org Just look for the .exe file. I'm not the expert here but what I do is get the daily .exe and download all the supporting files from github. Your "red.exe" will be named with its version so it will be something like "red-28jul21.exe". ninja-seahorse:matrix.org 16:35I see that I can use the automated builds from the Red website. What I'm trying to ask is how do I properly build that .exe myself? 16:35from source 16:37Sorry if this is a newbie question, but I am new to compiling. Only took a year of Java in college greggirwin 16:37Until we are self-hosted, you would need the Rebol SDK which is no longer available (R2 was closed source). But you can compile other Red programs just like you did the console as well. TimeSlip 16:37@ninja-seahorse:matrix.org I see. Well, I've never done that. Sorry. That said, when you first run the .exe from the automated builds, it creates Red console for you. You'll notice how long it takes the first time you run it. greggirwin 16:39As @TimeSlip notes, you can use the automated build. That's the entire toolchain. It will autobuild the GUI console if needed (takes some time), or the CLI console if you use --cli. If you use the downloaded build directly, compiling can be done using that with other switches, per the readme on github. ninja-seahorse:matrix.org 16:41I see. Thanks TimeSlip 16:47@ninja-seahorse:matrix.org Yes, my advice is to go to [https://github.com/red/red](https://github.com/red/red) and get all the files, then the daily build. After that, you can have lots of fun with Red. @greggirwin I was thinking of making of video of just the process I outlined :-) because it stumped me for a while and I couldn't run many of the code snippets found here. ninja-seahorse:matrix.org 16:48Thanks @TimeSlip greggirwin 17:07That would be great @TimeSlip. Your other video was really well done. giesse 18:00> I've compiled the red binary from source using Rebol on Windows 10 using the command [do/args %red.r "-r -t Windows %environment/console/GUI/gui-console.red"] You can do the same thing to compile your own programs if you don't want to use the encapped version. Just replace .../gui-console.red with the path to your script. 18:00eg. do/args %red.r "-r -t Windows %/path/to/my/script.red" TimeSlip 18:11@giesse Will that work with the non-sdk rebol; that is, the one you can download from [http://www.rebol.com/downloads.html](http://www.rebol.com/downloads.html)? greggirwin 18:13Yes, it will. TimeSlip 18:22@greggirwin Great. (Not that I will be doing that anytime soon, mind you :-) ) Me thinks you need some rest Gregg. Didn't you post that Red update in the wee hours? :-) greggirwin 18:23It's one of those non-intuitive things. The console is nothing special, just another Red app. What the Rebol SDK gives us is the bootstrap bit to encap the toolchain itself for distribution. 18:26@TimeSlip the great and terrible thing about working on something you truly believe in, and are deeply passionate about, with people you respect, whose company you enjoy, who teach you and inspire you to be better is....<ZZZZzzzzz....> TimeSlip 18:35@greggirwin Hey, you just wrote some incredible code with your forehead smashing into the keyboard. Now that's amazing. greggirwin 18:36Muscle memory. I dream in Red. gltewalt:matrix.org 18:45@ldci How would you feel about writing a Red/System and Routines by Example book? Or website or docbook. Thursday 5th August, 2021 ldci 01:49@gltewalt:matrix.org . Good Idea, but later 03:02@gltewalt:matrix.org I’m still Dean of Life and Earth Sciences at EPHE until April 2022 and thus very busy:) 03:06Who did that https://www.youtube.com/watch?v=62Y1fHrvqa4 and where find the code? gltewalt:matrix.org 03:17@TimeSlip 03:18https://github.com/TimeSlip/redvlclib ldci 05:45@gltewalt:matrix.org Thanks :) @TimeSlip : Congratulations :) GalenIvanov 09:12@hiiamboris Is [hiiamboris/red-cli-gitlab-mirror](hiiamboris/red-cli-gitlab-mirror) the up-to-date implementation of your CLI library? I intend to test it. I'm asking because it contains "gitlab-mirror" in its name, but I don't see a repo in your GitLab profile. hiiamboris 10:04https://gitlab.com/hiiamboris/red-cli/ 10:04But GH should be synced automagically after every commit. GalenIvanov 10:05Thanks! Apparently I didn't press "View All" - now I see it :smile: hiiamboris 10:06☻ Saturday 7th August, 2021 btiffin 18:41Nice weblog update, Gregg. But, that's not going to stop me opining. ;-) > And while code is expected to change, once people depend on a function or library it causes them pain if we break compatibility. We don't want to do that, though sometimes we will for the greater good and the long view. This is meant as a friendly warning, team. A COBOL perspective biased opinion. The *long view* is always back and fore compatibility. Even if the codebase gets versioning branches. I.e. There is no *greater good* when old source won't load, or old binaries won't run. Long view is, once stuck with a decision, remain stuck to the decision. That can't be a hard rule, but if it eats at your soul with every breaking change decision, you are keeping the long view and greater good in mind, ever expanding with no cutoffs. ;-) Updated protocols should support old, even when it's more work in system code and support. Pollute a namespace if needs be with the new things. In the long term, think about keeping a system that runs code from 5, 10, 50 years ago. Red could easily make 50, or 500. 18:44But mostly, thanks for the everthing. gltewalt:matrix.org 18:52Freely break big things prior to 2.0. Big changes if need be. After 2.0, be cautious. (My opinion) Sunday 8th August, 2021 CodingFiend_twitter 07:08@btiffin I agree with Brian that far too many languages break code over time, and this causes loss of products and useful things. The entire industry goes through 25-30 year cycles where a language achieves large marketshare, and whole piles of code are rewritten, and then that language's evolution invariably breaks the existing code. A few languages have been able to resist changing (such Wolfram language in Mathematica), usually due to the BDFL (benevolent dictator), but people are mortal, and you can see when the dictator leaves that the floodgates can open to major changes as we are seeing in Swift and starting with Python. I believe the solution is fairly simple. Change your syntax to include a language version number required in each source file, so that future versions can attempt to forward convert and save your code. Assuming that one has access to meta-files like makefiles, etc. is a foolish idea, as code moves around in files not as complete projects. In my Beads language, i require beads 1 program mytest, and the first 2 tokens are the indicator of the language, and the second token is the language level. Some day when level 2 comes out, if there are breaking changes, an automatic fixer program can be deployed perhaps. i think Red should imitate my sensible practice so that code can live a very long time. dsunanda 09:20@CodingFiend_twitter Excellent points! Java’s original mission statement: “Write once, run anywhere” was a huge boost for the nascent language. Perhaps “Write once, run forever” would be an irresistable siren call to today’s framework-updating addled dev depts. We can cut Red some slack right now for two main reasons. First, it is still officially in beta so any feature is implicitly experimental - and thus not in its persistent adult form. Second, Red is not engineered specifically for persistent consistency at the moment, and the skills to make that a core feature are rare. But - as a goal – a language with guaranteed temporal consistency is just what the world really needs today. It’s even what blockchain contract code absolutely requires – can’t get more relevant than that :) zwortex 14:11I feel like throwing a stone in the pond (the cat among the pigeons). These are unrealistic expectations if you excuse my saying. Red is a free-form language : no type constraint enforced, no arity, not even reserved words. Consequently the only true mitigation action to counteract how the language might evolve, not in the years to come, but on a daily basis, is to ship along with your code a safety harness of tests. Because your code might run in whatever environment, in particular not the one you expect, not even an environment that is an official version of Red. That being said, versioning is a nice short-cut to prevent running against an old version of the language, but does not protect against newer ones, whatever they are. To that purpose, I wish, as @btiffin, there was a certain conservatism in the language. But I'd be sorry if such conservatism lead to endless discussions that prevent enhancements alltogether for fear of breaking any existing code. You should not be restrained of having the language evolve, especially in alpha phase. Only the pace for such changes should be measured. And of course those changes should be advertised. To that purpose, you may have some deprecation warnings, whenever a function or a refinement is meant to evolve or dissapear. You may also envisage to collect some additional material that could serve, subsequently, as part of an auto-check procedure. Such material could be collecting the extended signatures of the functions that are used in your code (arguments, types, including return type) or their version numbers. The auto-check procedure would then verify that these initial signatures or version numbers do fit with the current ones, and trigger otherwise a warning or even block the execution of the code. And at the language level, you could maintain deprecated version of the functions like : print.1, print.2 etc. the same as you do with unix binaries. I'd rather have this sort of conservative flexibility than an absolute fixness, and a forced ascending compatibility. dsunanda 14:33@zwortex I hope I did not imply it would be easy! It cetainly isn't. But - at the very least - it needs to be indelibly engineered into the core of Red/C3 - https://token.red-lang.org/ - why could anyone chose a block chain language tat did not have that consistency guarantee? And the engineering skllls to make that guarantee for Red/C3 ae also a worthy goal for the core of Red too. https://token.red-lang.org/RED-whitepaper.pdf zwortex 15:43@dsunanda, I know nothing about Blockchain. So it's a mere comment. I guess the stability required in Red/C3 is a highly desirable feature given they are used for contracts. But, in my opinion, this is not as much desirable for the core of the language. One reason being you rarely modify contracts, while you do so constantly with code, either downloading some new version of it or modifying it yourself. If you happen to upgrade your Red environment, you may amend the code you run but you shan't modify any contract. Therefore, as far as the code is concerned, it is more important to detect what might compromise your code and be given a chance to adjust to it : henceforth the auto-check feature I was mentioning. Still, the language could provide a backward compatibility feature so that any "old" code might keep working in the future. That is an extra challenge, if you put on top the need of being compatible across various environments. If core functions have non-regression tests for each version, you may provide older version of those functions within newer versions of the language, and let the user determine what version he is using. Those older versions could be the original implementations, or may have be rewritten, as long they satisfy the original tests set. That is definitely a nice feature to have and maybe not that much of work. You need to write or upgrade those tests anyway for each version. What I would not like however is to end up in a situation where you have everywhere sign posts saying : don't touch anything, for that would break existing code. This does not feel right to me : a language that is dead, even before being alive. greggirwin 16:37It's a big issue, and there's no single answer; just a balancing act. For Red, it's what a particular version of the runtime might understand. Not just official versions, but custom runtimes, or alternate versions. In a strictly controlled environment, e.g. a ratified IETF protocol, version numbers can have very strong meanings. Messages in protocols include a version number for that reason. So receivers can react accordingly. But that doesn't guarantee that a given receiver will understand a given version. And Red, including its runtime, is not a protocol. Can we, and should we, strictly document *everything*? No. But we can do more of that for the most important elements. I'm not the first to note that SemVer, while a noble goal, doesn't solve the problem. In the case of a BDFL, including @CodingFiend_twitter for Beads, it's easier to control. In the case of teams of people working quickly on APIs with large surface areas and complex behavior. Your trust that the versioning means what *you think* it means is entirely on the authors having the same understanding and *also* getting all the details technically right. i.e. there is no software analysis I know of, or even annotation systems to support it, that can identify major, minor, patch level compatibilities. The other approach is JSON. Douglas Crockford broke compatibility but then said "never again". JSON will not change, ever, for all time. So what we have are many competing derivatives. JSON won, but over time has faced the same issue as all frozen tech. Time marches on and as soon as someone needs even a little more of something, they have to be incompatible. Success breeds this problem. And it's just a data format. As soon as you have functionality, it gets worse. R2 would still be viable if not for things like TLS than can't be fixed in the closed source code. Security and new algorithms *will* change things. But fundamentals can carry you a long way, as can abstractions, protecting high level users from changes underneath. XML went the other way. Here's a core, and everything done in the real world is an extension, so include your DTDs and such to look them up, and be reliant on all those other actors doing their job well. Some might say this falls under the modern "opinionated" label. Back when I specialized in BASIC/VB, I remember chatting at a conference about this. MS took great pains, until .NET finally broke down the wall, to break as little as possible in the language. It may have been an Intersystems conference, as those guys also put compatibility at the top of their list (which is good if you're running hospital software). What I remember is a C dev being amazed at that, where every C compiler broke their code with every new release, and not just in small ways. This with an ostensibly simple language. JS has a committee (well, as ES it does), but no single person, or even a small group, can know what they'll break with things they add to the standard. So there *is* a standard, and it breaks things, but also evolves for important things people push it to do. But those standards, as with many in bureaucracies, are reactive, *after* some project(s) in the wild made something so popular that they included it. Blockchain is a whole 'nother beast, but also shows what we need to consider for things out of our control (i.e. modules and packages). This is where versioning *can* be very useful, and aligns with the need for tests. If there's a version of X out there, it should be there for all time so you can get that exact version when you need it. If yours is the only company depending on X, and you go out of business, they are no longer needed in the world. If everybody in the world uses it, e.g. the core Red runtime, it's there until the last user is gone. Everything else is somewhere in between. The most important bits get more redundancy, and change less over time to ease the pain of migration. (4K gitter limit :^) gltewalt 16:38C3 just needs to be dialect with strictness. You make your own rules with a DSL, and any teams working on a product will conform greggirwin 16:38This is something we should be able to see, so we can plan; log complaints against, when our "future test" system shows what breaks in our code in an upcoming release (runtime or module, API); and analyze historically (great lib, but expect the every version to break your code). 16:38Clearly my longest message ever. I've never hit the limit before. gltewalt 16:44Just don't wait until well into version 2 lifespan to decide you want to to redesign things and have major breaking changes. It killed perl, and put a huge dent of chaos in python Monday 9th August, 2021 pekr 17:46I am a beta guy. I don't care about any compatibility at all. As far as I have the ability to compile the target myself. I am not even willing to discuss it further, as historically, I have no "anectodal" evidence of how it ever affected Redbol users at all. I refuse the notion to stop innovation just because some amount of archaic scripts from rebol.org might break. Tuesday 10th August, 2021 ALANVF 12:11@pekr I couldn't have said it any better. new ideas > backwards compatability lnxw37d4:matrix.org 16:34One can be in favor of new ideas and not wish to rewrite your code every time there is a new release. There is a finite number of times someone will rewrite before they choose another language. pekr 17:53Noone pushes you to constantly update the core, unless for a security fixes. I also don't understand, where the notion of breaking something in design of the language, comes from. We are not talking about daily / monthly changes, but the possible evolutions of the language. If you are eventually talking the Linux scenario, where there is language / runtime installed and updated regularly, that's a different scenario. But I don't consider Red being such a language. During all those years, I also keep the small exe of the language in a folder of my app. So in that regard, it works like - forever. Respectech 22:44I think that's what the NEEDS: is for in the Red header. You can specify a version of Red that works for that script. Or you can compile it and distribute the executable with that version. Wednesday 11st August, 2021 pekr 05:26Exactly Oldes 16:44Although I know very well how painfull it can be when there are breaking changes.. I believe there should be such a changes if these are for good in alpha an even in beta versions. greggirwin 16:47Sounds like our approach is 100% on track. :^) Friday 13th August, 2021 hiiamboris 10:47I didn't know it's possible to use colon in filenames. 10:50git fails to clone that ☻ 12:54Great job @ldci ! We should stash the link somewhere in the wiki. 12:56(probably belongs to /help room; gutter is a maze on crappy internet) greggirwin 16:27Somewhere I have an old safe-filename func that tried to account for many OSs. 17:27https://github.com/red/red/commit/183b01a5a9d9e8ade79f9246a0b494609046d83e Guess what? It's a breaking change. :^) If you use find/match be sure to update your code, unless you're just using the result as a logic value. ninja-seahorse:matrix.org 19:10When I try to run Red on MacOS, it says something like "bad CPU type". It does this for the stable and automated versions. Is this because MacOS is 64bit only? greggirwin 19:37Yes, Red doesn't run on 64-bit MacOS at this time. You need to use a Docker container or VM in the meantime. hiiamboris 19:45https://github.com/red/red/wiki/%5BLINKS%5D-Unofficial-Red-images greggirwin 19:45Thanks @hiiamboris. :+1: ninja-seahorse:matrix.org 20:00When do you think Red will run on 64-bit MacOS? Are we talking months or years? Thanks! q60 20:05what about Red IO in compiled binaries? i had this problem quite a while ago Oldes 20:29Any idea how/where should be defined/used codec properties? Once implemented. For example quality in jpeg image.. as now jpegs seems to be saved with 100% quality which is not something what is practical when one needs to generate images for a web page. Saturday 14th August, 2021 greggirwin 17:42> When do you think Red will run on 64-bit MacOS? Are we talking months or years? Thanks! After Full I/O and some other big features. No targeted release date at this time. 17:44> what about Red IO in compiled binaries? This is one of our top priorities. You may have noticed a number of deep bugs being fixed recently. In the next quarter I/O will get focused attention, so the low level interface can be released in automated builds. 17:57@Oldes AFAIK there is no design in place for codec properties. With CSV we exposed separate encoder/decoder funcs with refinements, to be used directly. For images, we need to look at the APIs in %platform/image*.reds to see what's supported for that specific case, but in general for codecs we should start a discussion about it. I don't know if @qtxie has any draft designs to share. Because each code needs a standard interface, and is an object today, an obvious choice would be to add an options word to the codec objects, which could reference a block, a map, an options object, or even a dialected set of option commands. Then it's a matter of documenting and implementing options for each codec. q60 17:59> > what about Red IO in compiled binaries? > > This is one of our top priorities. You may have noticed a number of deep bugs being fixed recently. In the next quarter I/O will get focused attention, so the low level interface can be released in automated builds. i wish i could help with that, but i am not familiar with low-level I/O greggirwin 18:00You can help by testing today, or when it's released. If you need a binary for ease of use, one of us can build one from that branch for early testers. We need some docs to go with it though. q60 19:14 K λ ./hello ~/Downloads/red Gtk-Message: 22:14:15.486: Failed to load module "xapp-gtk3-module" Hello, world! Χαῖρε, κόσμε! 你好, 世界 Dobrý den světe 19:15why do i have gtk warning? Sunday 15th August, 2021 q60 15:43if someone wants neat Red lang badge to their repository, use this https://gist.github.com/q60/2f4f801ff999b6f0ee8c43aa2df13d23 15:50also i have a question on how to parse XML in Red? i'm receiving it as a response from API ldci 19:35Hi Red community. RedCV is now 2.0 : https://github.com/ldci/redCV hiiamboris 19:55:clap: ldci 19:56@hiiamboris Thanks and enjoy:) 19:57@hiiamboris Not yet tested for png:) GalenIvanov 20:11@ldci Great! ldci 20:12@GalenIvanov Thanks a lot. I spent a lot of time in documentation. We have to introduce your work in redCV:) GalenIvanov 20:24:+1: Monday 16th August, 2021 planetsizecpu 07:23Bravo! @ldci ldci 07:57@planetsizecpu Thanks greggirwin 18:01:+1: Thanks @ldci! 18:02Nice badges @q60. Thanks! ldci 18:03@greggirwin Thanks a lot greggirwin 18:03@q60 ask about the GTK error in red/gui-branch, and we'll make sure @qtxie sees it. qtxie 23:05> why do i have gtk warning? I guess you compile your code with red -c, it will generate a libRedRT included view module which use GTK. If you don't need view, clear the current libRedRT withred clear. Then use red --no-view -c to compile the code again. 23:05Or use red -r filename.red to compile your code. Friday 20th August, 2021 greggirwin 16:59https://github.com/red/red/issues/4944 led to a lot of discussion. While this should be a very good change overall, it does change find's behavior in some cases. Technically this crosses the line between bug fix and design choice. But even if it's a bug fix, if you rely on the buggy behavior, it still breaks your code in these rare cases. Chances are, if you're doing things this change affects, you already worked around it by pre-forming problematic values (tags mainly). q60 20:28 red -o "build/mursa" -r "src/main.red" *** Error: cannot access argument file: -o 20:28it never happened to me before greggirwin 20:41Put the source file before the options. hiiamboris 20:45Curious. 20:46Is this the stable build? q60 20:49it's built from master branch a while ago 20:49and it worked as is 20:49now i am using a package from AUR and having the same issue hiiamboris 20:50about says what? BuilderGuy1 20:53Random question: Will the FULL IO release be capable of communicating with Bluetooth devices? Technically they are Serial devices... Sunday 22nd August, 2021 Oldes 01:20@BuilderGuy1 what exact device you need ecactly? meijeru 10:38Could it be that red-latest.exe for Windows is behind? It says 12 -Aug, build 5398... 10:48Or is it the source.zip that is behind? hiiamboris 11:03@x8x ^ x8x 14:30@meijeru Thank you for reporting! Should be fixed, a library dependency issue that is not yet fixed upstream on the server distro. meijeru 16:24I have succeded in downloading the latest source + exe, but the exe was quarantined by Norton :smirk: 16:24succeeded x8x 17:08@meijeru I guess no solution to that until binaries are signed. greggirwin 19:48We haven't talked about AV issues for a while, but they still exist. I can sign the binaries manually, but we don't have an automated approach to it yet. Not sure if we ever will, since it requires a hardware key, at least for our current appraoch. Monday 23th August, 2021 meijeru 10:22I can live with it, because I update only every once in a while and Norton allows me to liberate the exe from quarantine... btiffin 14:24Re 64bit. Windows 11 might put more pressure on this issue. Seems there won't be a Windows 11 32bit installer. It'll still run 32bit code, but Windows 11 seems destined for 64bit now. Not that I care about Windows, but 64bit GNU/Linux builds will be a nice thing to have too. :-) hiiamboris 14:32Installer is only needed for 32-bit-only platforms. Those support 3GBs of RAM tops (well, could reach 4GB), so won't be able to run W11 in any case. So no pressure ☺ btiffin 14:33On breaking change. Yes, sometimes these are a necessity, but in the grand scheme of things; **any** breaking change in a language effectively limits the growth potential, lopping off the tail of the codebase that has built up. But, for Red, being sub 1.0 there is wiggle room. Just don't wiggle too much or you deny Red an infinitely growing codebase, and end up putting in life expectancy limits. Not always a bad thing, but it can be a sad thing. ;-) greggirwin 16:38@btiffin yup. Every breaking change is not equal, and I *love* the analogy of cutting off our tail to move faster. At some point we'll lose our hind legs. Tuesday 24th August, 2021 BuilderGuy1 04:07@Oldes I was hoping I could talk to numerous small bluetooth enabled devices mainly for data gathering. Very simple app(s): Connect to device-gather data-display it-store it. I have a Weigh Scale that gathers 17 different measurements. When investigating the manufacturer supplied app, I found it gathers your info from the scale then sends all of it to the manufacturer!! It also sends info from your phone's address book, etc, etc. I think I can do better. hiiamboris 08:28Familiar picture ;) You can block internet access to individual apps though, using smth like NetGuard (android). Oldes 09:45@BuilderGuy1 I may be wrong.. but I would not expect there will be anything bluetooth related in the Red's IO update.. I think that you should write an request and collect as much useful info in it as possible.. like https://stackoverflow.com/questions/35389894/bluetooth-low-energy-on-linux-api but also for windows and macos. 09:52For windows it could be this https://docs.microsoft.com/en-us/windows/win32/bluetooth/bluetooth-start-page greggirwin 15:17@Oldes is correct. There is nothing Bluetooth specific in I/O plans. Starting a wiki page with information is a great idea. Thursday 26th August, 2021 njamescouk 13:50I've just found out that using RED[] as the preamble in a .red file gives a not a red program. seems strange given that everything else is case insensitive? rebolek 14:03IIRC the rationale is that because "red" is so common word, requiring specific case lowers chance of false positives when detecting if the file is a script. ldci 14:04red is also a color rebolek 14:06yes and because of that, you can do do load %script.red and it will run your script even if your header is in different case. Friday 27th August, 2021 loziniak 10:35hello, is there any archive of nightly builds? seems @rebolek 's page is down. 10:36I want to create/update Arch Linux package on AUR. rebolek 10:44@loziniak it's down and will get back online only when my Red webserver is mature enough for it. loziniak 10:45soon™ ;-) rebolek 10:57Actually it may be mature enough already, so I just need some time to update it :-) loziniak 14:37Seems in Arch there is a possibility to define version at package compilation time by using pkgver(), like in [neovim-nightly-bin](https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=neovim-nightly-bin) package. I'll use this workflow for now. Saturday 28th August, 2021 loziniak 01:16Done: https://aur.archlinux.org/packages/red-nightly-bin greggirwin 02:59:+1: Sunday 29th August, 2021 ldci 10:09[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/cqqP/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/cqqP/image.png) 10:09Hello, redCV supports now Optris infrared camera:) GalenIvanov 11:16:+1: greggirwin 17:17Nice! Is it a custom binary image format you have to parse? ldci 17:19@greggirwin : Yep and I wrote a RIFF library for that. It could be used also for avi files :) greggirwin 17:20Fantastic. thanks! ldci 17:26@greggirwin That was complicated since Optris does not give a direct access to raw temperature data as by the past. This first version requires Ffmpeg for extracting video frames. next version, under progress, will be 100% Red/System. greggirwin 17:29Thanks for this deep work. ldci 17:29[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/szze/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/szze/image.png) 17:29This an example of Red/S 17:30@greggirwin You’re welcome. Red is really fantastic :) greggirwin 18:01Amazing. :+1: Monday 30th August, 2021 planetsizecpu 07:25Wow @ldci great work! ldci 07:29[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/bmsd/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/bmsd/image.png) 07:29@planetsizecpu Thanks. BTW, Red Red/System version is ready. I’ll update redCV withina few days. planetsizecpu 07:32Oh, I want a IR camera for noel, but bracelet as the Predator's wear 😀 ldci 07:34@planetsizecpu : You can add a Flir sensor to your phone:) greggirwin 18:14This makes me think of all kinds of crazy ideas for building programmable Red devices and systems. In the current moment, though, using it for COVID temperature checks is the most timely application. PeterWAWood 23:56Covid19 temperature checks are just a placebo. Yes, if your temperature is high, there is a good possibility that you have Covid19. If you temperature is normal, there is a slightly reduced chance of you having Covid19. Based on infection statistics, in areas where more than 80% of the population have been vaccinated, 80% of the Covid19 cases would be missed by a temperature check. A Covid19 breath test would not only be a most time Red application but also an extremely useful one. Tuesday 31st August, 2021 gltewalt 01:25New website addition: https://beta.red-lang.org/showcase/ planetsizecpu 06:15Great stuff @gltewalt and thanks for showing my game on the front page 😀 GalenIvanov 06:28@gltewalt Thanks for sharing! pekr 10:19@gltewalt I miss a famous clock demo, as can be seen here https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html gltewalt:matrix.org 10:58Noted greggirwin 16:00@PeterWAWood any idea on devices and analysis of their data for breath? YaronKoresh 16:18Hey guys, long time I didnt talk ;) I had about +200 messages lol, does Red gained new abilities from before the covid? I see we have a new website :O greggirwin 16:20The [latest blog](https://www.red-lang.org/2021/08/long-time-no-blog.html) talks about what's been going on. YaronKoresh 16:21ok thanks :) Wednesday 1st September, 2021 PeterWAWood 00:57> @PeterWAWood any idea on devices and analysis of their data for breath? There are a few under development: [this one in the UK](https://www.bbc.com/news/uk-wales-54718848), [this one in Holland](https://abc7.com/covid-testing-breathalyzer-coronavirus-spironose/10941810/) and [this one in Ohio](https://news.osu.edu/ohio-state-researchers-testing-breathalyzer-to-detect-covid-19/). Perhaps there is a way to collabarate with one of them. greggirwin 00:59:+1: snotbubble 03:56@pekr aslo picosheet! The demo gifs should also be on the front page, instead of the textwall & illustrations. ldci 10:14Hi reducers. September redCV update here: https://github.com/ldci/redCV. This includes the support of Optris IR sensors. Sample documentation is also updated. Best regards from Paris. GalenIvanov 10:20Thank you, @ldci ldci 10:20@GalenIvanov You’re welcome hitesman:matrix.org 13:37Hello! Small introduction, I am teaching myself programming, stumbled upon Red while looking into functional programming as a first language to get a grasp on. gltewalt:matrix.org 14:25Do you want to start with functional programming or just get started with programming in general? hitesman:matrix.org 14:43I want to start with functional programming. I dabbled with Haskell a little, but there isn't as much interest in Haskell for graphical progression. From what I've read, the Red language looks to cover a lot of bases that interest me, from low level to higher, all under one roof. hiiamboris 14:51Red is not functional though ;) hitesman:matrix.org 15:02Can't say I know enough to be swayed either way, but everything I've read checks off a lot of boxes for me. Pouring over what language to learn, dabbling and researching, I think this will do for what I need. hiiamboris 15:05Red will be way easier to start with than Haskell, even in absence of official documentation on a lot of topics ;) 15:06Use the https://gitter.im/red/help room, it's dedicated to help learning. hitesman:matrix.org 15:06Most excellent. Thank you. hiiamboris 15:06And welcome :) 15:07Also in the topic of https://gitter.im/red/red/welcome there's a great advice on docs. hitesman:matrix.org 15:20Thank you again. I've downloaded some REBOL documentation as well greggirwin 16:34@hiiamboris Red *is* functional, just not *purely* functional. The key here, @hitesman:matrix.org is that Haskell and other PF langs rely on immutability as a core principle, while mutability is central to Red. You will find that copy is an important function for times when you *don't* want something mutated. We also have some important notes on why things work this way, but won't throw you into the deep end yet. :^) Welcome to the community! JacobGood1 17:23You can program immutably in any language, I find the expressiveness of a language to be more important than anything else. 17:24However, the implementation of a language matters a lot when you start trying to make everything immutable, if you want decent performance 17:25I program in Clojure at the company I work for, just fyi 17:26@greggirwin I think I read somewhere earlier that yall are thinking about potentially targeting llvm, or am I wrong? greggirwin 17:27:+1: Nice to see you again @JacobGood1. LLVM is a *possibility*. JacobGood1 17:27I am the eternal lurker greggirwin 17:29:^) @planetsizecpu recently added The Tall Man from Phantasm to his Cave-In game. JacobGood1 17:29I know that it is against the rebol/red philosophy to have mountains of deps, which I understand, but I think it would be a good idea to make a version of red that acts as a symbiotic (or parasitic =P) language 17:30Rich Hickey took that route with Clojure, certainly, there were some trade-offs, but it made lisp "popular" again 17:31My evil suggestion would be graal over llvm greggirwin 17:36I know nothing about graal. What are the benefits over LLVM, and vice versa? We do already have libRed, which isn't a [fluke](https://en.wikipedia.org/wiki/Trematoda) (ba-doom-cha!). JacobGood1 17:42graal is a polyglot vm, you write an interpreter for the language in truffle, then that language gains a highly optimized jit and interop with any other truffle language. 17:43Graal is oracles future vm for Java, you can create executables with it, it targets llvm, web assembly, and several other targets 17:43any tool written for Graal, works for every language on Graal... debuggers, profilers, etc 17:46oh it also gains multiple gcs, some of which are pauseless 17:48I should have said Graal is meant to replace the JVM at some point since the JVM is less amenable to the multitude of languages that are targetting it... Oracle decided that they needed a more general VM that functional, dynamic, etc, languages can target it greggirwin 18:00Great info, thanks. JacobGood1 18:06so when is truffle red coming out? =P pekr 18:06I refuse to touch anything Oracle related :-) JacobGood1 18:08you would jump right on board if you could easily use libraries from multiple languages =P greggirwin 18:17When *is* Truffle coming out? JacobGood1 18:45it is already out and stable, truffle is a language framework that you write your interpreter in, in order for it to produce a jit on top of graal 18:46here is a blog about writing a language in it... https://www.endoflineblog.com/graal-truffle-tutorial-part-0-what-is-truffle greggirwin 19:03Ah, I misread your post. You said "truffle Red". planetsizecpu 20:19The Tall Man agent is a bit scary @greggirwin but his data object name Yagent is terrifying when you see it on the console debug messages, I don't know why. I keep an eye reading to see if he is chasing in vicinity 😆 greggirwin 21:01Where is agent-smith? :^) Thursday 2nd September, 2021 planetsizecpu 07:19Oh he!, it's really stubborn, maybe we can enlist him in a new Matrix level, but for now it's nothing in development, the new course begins and we have to be prepared, there is little time for fun 😑 ldci 08:18redCV documentation is now updated :) greggirwin 16:09:+1: hitesman:matrix.org 19:50If a "Red From First Principles" styled book is being worked on, I'll throw my hat in the ring as a test dummy to help. hiiamboris 19:55Have you read [Rebol/Core manual](http://www.rebol.com/docs/core23/rebolcore.html)? hitesman:matrix.org 19:57I had not yet, Helpin' Red is what I have been working through currently, also first literature. I should probably start with Core User's Guide GaryMiller 20:11I bought the Packt book "Learn Red- Fundamentals of Red" by Ivo Balbaert and it was really very good but a lot of it may be out of date now. I'm really hoping for a Second Edition. hitesman:matrix.org 20:21Grabbed it. Thank you for sharing this Saturday 4th September, 2021 cloutiy 00:57I contacted ivo regarding whether he was planning an update to crystal lang book now that it had reached 1.0. but he said he wasnt. I dont think an updated red book is planned either though i may be wrong. Sunday 5th September, 2021 ldci 09:58[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/1FoK/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/1FoK/image.png) 09:58For the fun: a new rotary face useful for image rotation for example. vazub:matrix.org 13:32Hey community! Not sure if anyone asked about that recently, but in case you need Red and Rebol2 toolchains dockerized, I've just updated my respective projects: https://codeberg.org/vazub/red-docker https://codeberg.org/vazub/rebol2-docker hiiamboris 13:53Hi! Please add it to https://github.com/red/red/wiki/[LINKS]-Unofficial-Red-images greggirwin 17:18@ldci nice! @vazub:matrix.org thanks! Monday 6th September, 2021 RayMPerry 03:00When using parse, is it inefficient to use multiple some constructs? 03:08For example, to construct snake_case rule, it looked like: some [alphanumeric some ["_" some alphanumeric]] greggirwin 03:08It's about the input and how much backtracking may have to be done, more than any particular construct. Start by writing the clearest rules you can, then see how it performs. You can also use parse-trace to see what's going on inside. 03:09That's perfectly efficient. RayMPerry 03:10Okay, cool. Just making sure I was losing it. 03:10This platform is really neat. Seems very useful ATM. greggirwin 03:11Parse is the crown jewel, though Red adds a few more jewels on top of Rebols crown. :^) RayMPerry 03:13I would wonder why Red hasn't versioned up lately but you didn't get this far by rushing, I'd imagine greggirwin 03:13You may want to try out [DiaGrammar](https://www.redlake-tech.com/products/diagrammar-for-windows/) as well. It's free to use, with the only "limitation" being that exported diagrams are watermarked. All other features are fully enabled. 03:14We want to change the release process, so it's clearer that work is constant and version numbers are kind of unimportant. We are a bit too slow on binary releases with all the fixes and features that are in the code base. It's on our list. 03:15Check out [the latest blog](https://www.red-lang.org/2021/08/long-time-no-blog.html) for more on why we're slow. RayMPerry 03:17Ah. No worries then. I've spent the last two weeks or so using Red in earnest so, you've got my interest. 03:17Will read blog. Cheers. greggirwin 03:18:+1: Tuesday 7th September, 2021 pekr 14:38I get some error on the red progress page .... JacobGood1 14:41https://www.redlake-tech.com/ site is down greggirwin 17:11Same here. Thanks for the reports. @x8x? Friday 10th September, 2021 JacobGood1 15:02hey guys, heads up, google chrome blocked the download of red for me saying it was malicious software greggirwin 15:23Thanks. The A/V heuristics change all the time, so flagging comes and goes. Saturday 11st September, 2021 pekr 07:07Interesting - can see some audio related development at the progress page? rebolek 08:05https://github.com/red/red/blob/audio/modules/audio/tests/basic.red Thursday 16th September, 2021 greggirwin 16:11R2 lexes 1. as a decimal, as does Red with the new fast lexer. But Red *used to* throw an error for that (Syntax Error: invalid integer!). Similar issue for 1.2. which now becomes a tuple of 1.2.0, formerly Syntax Error: invalid float!. My gut says these are malformed values and should not infer the extra data. What do others think? 16:18I actually leveraged this feature in an R2 dialect once, but never felt good about it. You could write a list of numbers with commas separating them. e.g. 1, 2, 3, 4, but the syntax had to be just right of course, and then you ended up with a mix of floats and integers. hiiamboris 16:47I agree with you. Friday 17th September, 2021 rebolek 06:29I agree, it's confusing. toomasv 15:58I agree too. Also, In the other way .1 expands to 0.1, but .1.2 results in invalid float syntax error. greggirwin 17:06Good point @toomasv. And it's not consistent. Does anyone intentionally use decimals *without* a leading zero? I don't think I ever have. >> .1 == 0.1 >> ,1 *** Syntax Error: (line 1) invalid character at ,1 *** Where: case *** Stack: load zentrog:matrix.org 18:19@greggirwin: I think I've used them in hand writing (i.e. school work), but I don't know if I've ever used them on a computer. But that could also be because software/programming languages can be strict about it. When entering decimal values on a calculator, I would probably opt for the fewest keypresses, though the value would likely be displayed with the leading zero. The 1. syntax looks like an element of a numbered list. I could understand treating it as an integer! even, but I think a syntax error is probably better greggirwin 18:44I had the same thought on numbered lists. In that sense, they could be useful in dialects. Sunday 19th September, 2021 henrikmk 12:05I have thought about that allowing comma or any separator to make up numbered lists would make it easier to convert from or to other languages that use separators (which is nearly all of them now?). greggirwin 17:00That can be done with system/lexer/pre-load. Monday 20th September, 2021 GalenIvanov 08:14Some of you have been using caret-to-offset for years. For those who haven't looked at it, here is a simple demonstration: 08:14[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/oHtI/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/oHtI/image.png) 08:14 message: "Know your distance!" font20: make font! [name: "Verdana" size: 20 color: black] txt: make face! compose [size: 800X200 type: 'rich-text text: (message)] txt/font: font20 len: collect [ repeat n length? message [ keep compose [line (p: 1x0 * caret-to-offset txt n) (p + 0x30)] ] ] view compose [ title "caret-to-offset" backdrop beige base 280x50 beige draw compose[ translate 5x5 font font20 text 0x0 (message) line-width 2 pen gray (len) ] ] greggirwin 15:23Nice visualization. :+1: aagroove4_gitlab 16:28Hello, which debugger for red is the best option? hiiamboris 16:29probe function ☻ greggirwin 17:00@aagroove4_gitlab there is no IDE yet, for things like step tracing or breakpoints, but we have a lot of ideas in that area. There is a new feature coming too, for monitoring the interpreter. We will also explore using reactivity and object ownership in this area. Like other aspects and features, we want to design in ways that solve problems in a better way. For example, debugging a local app, or a single service component, has very different needs than debugging a distributed system. In the best of all possible worlds, we can unify things in a way that leverages a consistent mental model. e.g. eventing systems, even internally in apps. If I may ask in return, what aspects of your Red work are you debugging? ldci 17:25[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/c0Hd/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/c0Hd/image.png) 17:25Hi everybody : Some tests for Red under Raspberry PI OS :) greggirwin 17:27Woohoo! Thanks @ldci. ldci 17:34@greggirwin Basically PI OS is based on 32-bit Debian distribution. Red standard is perfectly running. Some pbs with GTK and redCV for image reading. Tests under progress, but really good news for Red. I bought 4 PI boards for monitoring infants in hospital ant then I can use Red for that :) 17:48[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/1H4H/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/1H4H/image.png) GalenIvanov 17:49@ldci Great! ldci 17:50Another sample:) 17:50@GalenIvanov Thanks a lot. You have to test your. code now. henrikmk 19:02REBOL 2 and 3: >> to-block %/z/f/e/ == [/z /f /e /] Red: >> to-block %/z/f/e/ == [%/z/f/e/] hiiamboris 19:04what's the use case? henrikmk 19:06counting path elements greggirwin 19:10Better to use split in this case. Having to block! split strings is probably not going to happen in Red. One of those things R2 had to try and be helpful, but overall not a win from a design standpoint. henrikmk 19:13Split is less useful, since it ruins path notations. Then the "proper" way would be to write a loop with SPLIT-PATH. greggirwin 19:14In a shell environment, maybe handy, as R2 also handled backslashes this way: >> to-block %\z\f\e\ == [/z /f /e /] But because it's not splitting the path into file! elements, mapping them to refinements doesn't have many uses, does it? And the special case of an empty element (/) becomes a word!. henrikmk 19:14The TO-BLOCK version worked well, but I did find a bug in the R2 version. R3 version has a different bug. greggirwin 19:16So you're not just counting path elements, but using them somehow? In my experimental split, you could do it like this: >> split %/z/f/e/ [before #"/"] == [%/z %/f %/e %/] henrikmk 19:16I see, didn't know that. greggirwin 19:17You can see it [here](https://github.com/greggirwin/red-split/tree/master) if you want to play. henrikmk 19:17It depends, sometimes I count, other times I need to find a directory or a sequence of directories in a file. 19:17Thanks greggirwin 19:18That's a good use case. henrikmk 19:20We do a lot of ridiculous file checks at Saphirion... m_a_j_ch_rz_a_k_twitter 19:51Hello there.I've just read the blog post on the red page. Great article. You have made a nice progrrss there :) there is only one thing which is bothering me. Lack of any informations about ports. Do you know less or more when they would be ready ? Lack of ports is blocking the whole "creating libs for Red". greggirwin 19:55Ports are high on our roadmap (being updated as we speak). It's close...so...close. Frustrating for all of us, but how does it block libs more than, say, a module feature (also on the roadmap)? m_a_j_ch_rz_a_k_twitter 20:16With ports should be possible to create modern web frameowork with (for example) postgrrs database. greggirwin 20:22See, now that's very specific. You can write libs in R/S today, via FFI. There is no streaming option there though. And "web framework" is something else entirely. How does that relate to ports? m_a_j_ch_rz_a_k_twitter 20:41Wait so maybe I dont ubderstand ports that well. I thought that they would make it easier (ffi). greggirwin 21:19Ports are for I/O, files, networking, etc. Tuesday 21st September, 2021 m_a_j_ch_rz_a_k_twitter 07:51So still necessary for web framework greggirwin 16:05I guess that depends on the definition of "web framework". For writing services you can access via websockets, yes, but to be a web framework, does something need to use standard web technologies? I don't know. rebolek 17:23web framework - if you’re fine with running Red as CGI, you can do it now. I use it. If you want to use something faster, like FastCGI or SimpleCGI then you need ports. gltewalt:matrix.org 18:27Since it's any-string, I think you can take the length and divide by 2. Maybe with a round/down greggirwin 18:28Context @gltewalt:matrix.org ? gltewalt:matrix.org 18:42Counting file path elements greggirwin 18:48But they may not all be single characters. gltewalt:matrix.org 20:17Don't know if he's working with singles or not greggirwin 21:08Well, it's not a general solution with that limitation. Wednesday 22nd September, 2021 rebred 01:32in linux we need to watch a folder that process files every 60 seconds as they are dropped in is it better to use a red script with a forever and wait 60 or set up cron ? will the Red script (forever with wait) consume the same amount of memory over time ? greggirwin 05:48wait does not consume CPU, so it's fine to use in place of cron. Oldes 07:12@rebred using cron is more safe imho.. CPU is not wasted, but memory is and if you will have some memory leak in your script or bug in Red.... ldci 11:23[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/Og9y/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/Og9y/image.png) 11:23Hi reducers. redCV can be used now with raspberry boards:) hiiamboris 11:29:+1: ldci 11:36@hiiamboris Thanks! planetsizecpu 13:09Good job! GalenIvanov 13:18:+1: Oldes 16:00Regarding making a block from a file, I would propose this: >> to block! %/z/f/e/ == [%/z/f/e/] >> make block! %/z/f/e/ == [%/ %z/ %f/ %e/] 16:03@giesse and also: >> to block! to string! %/z/f/e/ == ["/z/f/e/"] hiiamboris 16:15how is this better than what we have, and than split? Oldes 16:30@hiiamboris having some meaningful result instead of error is always better to me... now there is: >> make block! %/z/f/e/ *** Script Error: cannot MAKE block! from: %/z/f/e/ >> to block! to string! %/z/f%20f/e/ *** Syntax Error: (line 1) invalid path at f/e/ >> split %/z/f/e/ [before #"/"] *** Script Error: split does not allow block! for its dlm argument 16:35Not mentioning, that I *would* prefer to have [%/ %z/ %f/ %e/] instead of [%/z %/f %/e %/] or [%"" %z %f %e ""] hiiamboris 16:40 >> split %/z/f/e/ [after #"/"] == [%/ %z/ %f/ %e/] greggirwin 17:05@Oldes, good point on long running processes vs cron. In the largest Rebol systems I wrote, I had a main crontroller that spawned tasks and used IPC to communicate with them. The main controller itself was a GUI app, which did slowly leak memory and had to be restarted once a year or more because of that. Oldes 17:21@hiiamboris fine, but that is Gregg's experimental split and to be honest, it's [quite a complex script](https://github.com/greggirwin/red-split/tree/master). Anyway.. I don't need to split files in such a way, so it's not a big issue for me. I would probably use some easy parse rule to count the number of file parts or use simple split file #"/" and handle the edge cases. 17:39@henrikmk if you want to just count parts... it would be more memory friendly to use something like: count-file-parts: function[f [file!]][ n: 0 ch: complement charset #"/" parse f [opt #"/" any [some ch opt #"/" (n: n + 1)]] n ] count-file-parts %/z/f/e/ ;== 3 count-file-parts %z/f/e/ ;== 3 count-file-parts %z/f/e ;== 3 zentrog:matrix.org 17:50Another alternative for watching a filesystem instead of polling, or cron would be to subscribe to filesystem events with [inotify](https://man7.org/linux/man-pages/man7/inotify.7.html) but would probably require some red/system, or a higher-level wrapper from inotify-tools greggirwin 17:57@Oldes my experiment is intentionally large in scope. Why do you care if it's complex? One of the goals with it is to have, e.g., @hiiamboris post an example that gives you exactly what you wanted, and that the intent is clear. In the domain of splitting things into pieces, are we better off with a module that covers 98% of use cases, or a simple function that covers 50%, and having users write custom splitters for the other 50%, with all the edge cases, where more things can go wrong? That's something I hope to find out. Oldes 18:03I have nothing against your split. I just wanted to note, that we could have a meaningful result from make block! file instead of current error and that to block! string should have consistent result with to block! file and not current weak and buggy split. rebolek 18:05@Oldes your version should be named more appropiately count-named-file-parts otherwise one could argue that length of %/z/f/e/ is 5 and not 3. greggirwin 18:05@zentrog:matrix.org we need a cross platform solution. Windows has a notification API, and MacOS does as well, so it's doable. I don't know if we want to look at that as new event! types, outside View, or via I/O ports. Oldes 18:05Even with proposed make block! file change, I would personally use function like count-file-parts above, because it is much more lightweight (not creating X series just to get a number). hiiamboris 18:06Current weak and buggy split is load I believe. We're just misusing it here. Oldes 18:06@rebolek it was just an example... I don't know exact use case. rebolek 18:07Of course, I’m just nitpicking, sorry. greggirwin 18:09My view is that filenames are strings, and conversion to block should treat them as such consistently. If we give them special treatment, then we should next ask what to do with URLs, and then emails and tags. Oldes 18:11If you ask, than we could have for example: >> make block! user@foo.cz == ["user" "foo.cz"] instead of: *** Script Error: cannot MAKE block! from: user@foo.cz greggirwin 18:12Shouldn't the result be ["user" "foo" "cz"]? Oldes 18:12Why to have multiple string types when every type would have same meaning. zentrog:matrix.org 18:13@greggirwin: It would be cool, but way down my list of things I would want to see built into Red. Might be a neat use case for modules though. Has there been some thoughts about how a module could contain cross-platform routines with a common high-level interface? greggirwin 18:13And what happens with URLs? It's a can of worms that may be hard to predict reliably for users. Oldes 18:14I don't know... I'm just ventilating my thoughts. 18:17Anyway.. my long standing idea is to have an intelligent query. Where I could do: >> query/mode url 'scheme == http >> query/mode url [scheme host] == [http "foo.cz"] >> query/mode url [scheme: host:] == [scheme: http host: "foo.cz"] 18:23(not a priority as well for me) greggirwin 18:25> Why to have multiple string types when every type would have same meaning. They do have different meaning, as their original type. So let's ask what happens if we do this. - Block! now has to understand the lexical form of any-string! types, which couples it to those forms internally. - For each type, we have to decide what the constituent parts become. For file!, all results can be file!. For email!, should they all become strings? URLs? Does it handle path seps intelligently when round-tripping? Can all values round-trip? (side note: Ladislav did some great work on split-path + rejoin, with round-tripping as a consideration.) >> to url! ["http://" "a" "b/" "c"] == http://://a/b//c Identifying use cases helps here, so we can see where gaps are that have real value. I'm 100% behind writing these things down and analyzing it. These are important docs in any case. 18:26On query, so kind of like GQL @Oldes? 18:29That ties in with HOFs from the aspect of selectors, and also with the concept of specs/schemas. I have notes on both of those, including vet so you can confirm if data conforms to a given spec. 18:36@zentrog:matrix.org so far modules have been designed from the organizational and source/interpreted view. I don't know of a "fat binary" format for shared modules, but wrapping platform specifics would work just like all other R/S code. The reason I mention "interpreted" is because modular compilation is not high on our roadmap, and is a big task. We will work hard to plan for that in the module design, so nothing has to change for users when it's supported. That is, you can run interpreted or compile your app normally, but every module will be recompiled, just like the runtime. To offset the speed hit there, you can still build custom runtimes which include modules, just like view today, for dev mode work. zentrog:matrix.org 18:55If it simplifies things to assume modules containing Red/System must be compiled, that would make perfect sense to me. Is the general plan for them to just be .red or .reds files? Other eventual features like compiling to shared library, or JIT compilation would solve some of those issues too. Once modules are available for general use, I think it lowers the bar a lot for community members to contribute features like this, and experiment easier without needing to worrying so much about how it would fit into the Red project hiiamboris 19:00@greggirwin I don't think recompiling every module is a good idea at all. I'd rather go [R3 way](http://www.rebol.com/r3/docs/concepts/extensions.html) and improve it. henrikmk 19:06@Oldes thanks. I ended up with a function that loops through split-path. I may also need it for serialization, because some file names can't be molded either in R2. Respectech 19:31@rebred In the past, I have used the Linux program incron which is like cron but its operations are based on changes to a filesystem. You can have a process launched immediately when any directory is changed using incron. greggirwin 19:35There are many aspects to modules. We do want people to be able to build, share, and use them, and for them to be bundled together. It should be possible for someone to group modules, put a consistent interface over them, and release that. Ideally, there is a package and organization system that supports this, and also an optional blockchain aspect for verification and tokenomics. There are ways to hack around platform issues, but security is perhaps the most important element in all this. To @hiiamboris' point, sometimes you won't even have access to a module's source, but I don't have a unified design for modules vs shared libraries. Oldes 20:15@henrikmk that must be pretty heavy solution :-/ Thursday 23th September, 2021 henrikmk 00:48@Oldes anything for the customer. but we have done far, far heavier things to make it work. for example, the native R2 SELECT has been ditched, because it has bugs, so we wrote our own mezzanine there. gltewalt 01:08> My view is that filenames are strings, and conversion to block should treat them as such consistently. If we give them special treatment, then we should next ask what to do with URLs, and then emails and tags. >> p: to-path "x/y/z" == x/y/z >> type? p == path! >> length? p == 1 >> length? 'x/y/z == 3 rebred 01:49@Oldes @Respectech thank you!!! x8x 09:44@rebred Yet another option, use systemd path units, have a look here https://www.putorius.net/systemd-path-units.html Friday 24th September, 2021 loziniak 16:55> blockchain aspect for verification and tokenomics super cool! Monday 27th September, 2021 XANOZOID 17:05Hello! Instead of trying to make a window fit everything in a GUI, is there anyway to make containers like panel or tab panel show a scrollbar when they overflow? I tried looking at a number of examples and the documents but found no evidence of scrolling outside of an area facet. Thanks! hiiamboris 17:11Not out of the box, but if you desperately need one: https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/scrollpanel.md XANOZOID 17:19Ahhh yeah i really need one. I am thinking i may just use Red for my processing for this app and something else for the UI then. No problem! I'll take a look at your link though! Tuesday 28th September, 2021 loziniak 11:35Hello. I'm trying to use @bitbegin's [Red language server](https://github.com/bitbegin/redlangserver) with [CudaText](https://wiki.freepascal.org/CudaText_plugins#LSP_Client). I cannot compile it though. Is the project abandoned? I see it as a dependency of officially-supported VSCode extension. Is *redlangserver* indended to be compiled at all for VSCode? Can it be run independently with another LSP client? 13:02Ok, seems it's not intended for compilation. I've managed to run it with CudaText. greggirwin 16:44We have a wiki page for editors. Maybe note that there. I haven't tried it, or CudeText. hiiamboris 17:03It's an open source attempt to replicate SublimeText3, though I haven't figured out how to plug Red syntax to it. I think it doesn't support ST3 syntax files out of the box, and I'm not converting it to it's own format. But otherwise it felt pretty responsive, much more than UltraEdit. @loziniak I would appreciate if you write a howto on pairing it with Red ;) loziniak 20:32I'll try to find that wiki page. greggirwin 20:46https://github.com/red/red/wiki/%5BNOTES%5D-Editor-Integrations loziniak 20:53@hiiamboris I also could not find Red syntax for CT, so I prepared my own very limited syntax file, enough to begin with. I'll share that. hiiamboris 20:55Isn't this 'Red language server' meant to provide syntax highlighting? loziniak 20:56Seems like just a language structure to me. hiiamboris 20:58IIRC when I added this thing to ST3, another 'Red' syntax highlighting mode appeared for me beside another 'Red' that came from the syntax file. loziniak 21:02I know VSCode plugin [contains syntax coloring](https://github.com/red/VScode-extension/tree/master/syntaxes). And language server is a part of this plugin, so maybe that's the case? hiiamboris 21:09Maybe ;) greggirwin 22:18It would sure be nice if the Red LSP code had some comments. :^\ loziniak 22:45https://github.com/loziniak/cudatext-red Wednesday 29th September, 2021 qtxie 00:01> https://github.com/loziniak/cudatext-red @loziniak :+1: It's great to see the LSP be used in other editors. hiiamboris 12:18@loziniak do you also get these errors? BodyReadError: LSP: Red - decode error int() argument must be a string, a bytes-like object or a number, not 'NoneType' ReadLoopError: LSP: Red - local variable 'body' referenced before assignment 12:20Hmm LSP doesn't seem to do anything for me. Your syntax highlighting works though. loziniak 13:13@hiiamboris looks like an issue between *LSP_Client* plugin and *redlangserver*. 13:16maybe try to turn on logging in redlangserver.sh by uncommenting line 4 instead of line 3 (debug-on parameter) and look what's getting logged to redlangserver/logger.txt. hiiamboris 13:16both updated to latest :/ loziniak 13:17you'll need to restart CudaText hiiamboris 13:18yeah.. no luck though ["debug-on"] that's full log-file contents loziniak 13:24What OS you're on? hiiamboris 13:25W10 loziniak 13:26I did the integration on Linux only. Could be that *redlangserver* is not run properly under Windows by my bash script. 13:27LSP_Client is calling a script and sends commands to redlangserver by **stdin**, reading responses thru **stdout**. I'd expect issues here on Windows. hiiamboris 13:28I rewritten it as a batch file. Server runs, I even get a terminal window. But Red can't read from stdin on Windows, that's for sure. loziniak 13:30I have no idea now how to fix that. Wonder how language servers are run on Windows anyway then, as this stdin/stdout communication seems a part of protocol. hiiamboris 13:30Actually I see the server using some 'input-stdin' and 'read-stdin' commands which are not part of Red and were not defined elsewhere. Maybe it requires some special build of Red? loziniak 13:32Maybe @bitbegin or @qtxie can help with that. hiiamboris 13:33Bingo. Those two commands are defined in Linux build of Red. loziniak 13:33It definitely is worth a ticket somewhere :-) hiiamboris 13:35https://github.com/bitbegin/redlangserver/issues/4 13:38BTW LSP [adds known words to highlighing](https://github.com/bitbegin/redlangserver/blob/master/highlight.red) qtxie 13:40> Actually I see the server using some 'input-stdin' and 'read-stdin' commands which are not part of Red and were not defined elsewhere. Maybe it requires some special build of Red? Are those functions in \red\environment\console\CLI\input.red ？ hiiamboris 13:41Yep, those qtxie 13:42> BTW LSP [adds known words to highlighing](https://github.com/bitbegin/redlangserver/blob/master/highlight.red) Looks like a script to generate a list of Red words. hiiamboris 13:43OK those functions *are* in *CLI* console on W10. But then our guess about stdin is wrong, and smth else is not working. qtxie 13:44Probably this one: https://github.com/bitbegin/redlangserver/blob/master/server.red#L38-L44 13:46Maybe CudaText expects "^M^/" on Windows. hiiamboris 13:47Just tried, no effect. qtxie 13:50There is a wiki about using redlangserver on Sublime somewhere, but I cannot find it. 13:51Found it: https://github.com/bitbegin/redlangserver/wiki/demo-for-sublime-text hiiamboris 13:53I'll try 2019 build now. 13:54Nope, same thing. qtxie 13:54If it works on Linux, then it's a platform related issue. 13:58Could be an issue on CudaText also. VSCode works well. hiiamboris 14:02Well anyway, stupid idea this language server IMO. Instead of agreeing on the same *syntax format* between editors, we run a server and *interact* with using the *only API format* is supports. Just increases the complexity one level up ;) 14:05It's like saying "hey, I don't want to write a parser for that format.. but I'm willing to make a server that parses that format and a client for that server" ☺ loziniak 17:35Does it matter if you implement parser for some *common syntax format* or a client for some *common API*? Looks like similar work from text editor developer. The point is – I just have to write one client/parser, not tens of parsers for every known language. 18:00Anyway, that's more for chit-chat probably :-) greggirwin 18:21I glanced at the LSP spec yesterday, but have looked at it before. Many thoughts of course. :^) It makes perfect sense if you're selling an editor and want to promote adoption. Get others to write the parsers for you. But protocols need to be stable, and extending them takes time. LSP is predicated on the few features people think are most important based on history (syntax highlighting, go to definition, autocomplete). But being a protocol kind of locks you into *just* those things they included, and long periods to add a few features. Looks like some semantics came in the new version. But then you have to update your protocol handlers of course, because it's not just a parser, but a full analyzer and reflective help system...which has to match LSP as the lowest common denominator for what you can ask. For Red, including the use of libRed, the parsing is done. Now you can ask questions like: - How do I know when the user is inside a dialect? - Do I offer just a "code" API, or can they ask about the source as data too? - etc. 18:29There are absolutely things we can and should learn from LSP, Eclipse, and more. Our primary goal will not be to make tools for other langs, though people will, but to show how Red's approach facilitates much more. Some things will be built in (app framework level), others will be plugins (what is *our* protocol?), and IDEs can be domain specific too. We're also thinking hard about systems development and operation in general. loziniak 20:50CudaText's developer will be writing a "lexer" for Red: https://github.com/Alexey-T/CudaText/issues/3746 , testers welcome! greggirwin 20:53:+1: Sadly, it seems our grammars won't help much, unless they will be of use to him in mapping to regexes. hiiamboris 20:55Diagrammar might help? greggirwin 21:18Yes, and we do have the old lexer rules all set and diagrammed there. We can pass them on if you want @loziniak. Thursday 30th September, 2021 loziniak 09:18Sure, It could be helpful! Thanks. 09:20Anyway, Alexey already came up with a test version of his syntax for testing: https://github.com/Alexey-T/CudaText/issues/3746#issuecomment-930571021 greggirwin 18:11Sounds like the diagrams may not help at this point. Great progress! 18:17[red-lexer-each.zip](https://files.gitter.im/5565a1d415522ed4b3e10094/4T7p/red-lexer-each.zip) 18:17May not match updates since fast lexer, but will be close. I can also post the diagrams as a single large PNG, but it's huge, so depends on what kind of image viewer they have. Friday 1st October, 2021 greggirwin 22:11If anyone else would like to weigh in on https://github.com/red/REP/issues/101, more perspectives are welcome. If you just want to add :thumbsup: or :thumbsdown: to https://github.com/red/REP/issues/101#issuecomment-932523626 that will give us a rough sentiment count. Sunday 3th October, 2021 planetsizecpu 15:47Done 👍 greggirwin 18:29Thanks! Monday 4th October, 2021 gcaplan 09:51Hi folks. Played with Rebol back in the day and loved it. So I'm thinking of trying Red for a personal project. But it would be data intensive, so before I invest the time in re-learning the language I have a question about performance. Ivo Balbaert claims in his book that optimised Red runs around 2-3 times slower than C. If that's true it's remarkable at this stage of development, because that would put it in the same ballpark as C#/Java/Go. For heavy data processing, could I realistically expect this kind of performance? ldci 10:10@gcaplan Facial recognition for one face: 40 ms for Red and redCV versus 20 ms for a C++ code with OpenCV. gcaplan 10:30Thanks - that sounds promising! Additional feedback would be welcome though. Also, how much potential is there for farther improvements once the compiler is fully optimised? hiiamboris 10:39You can inline binary chunks of CPU opcodes directly into Red/System code. So the only limit is how far you can and ready to optimize it yourself. greggirwin 15:46All that said, that is R/S performance, meaning you're writing at the C level. If you use Red as a high level language, it will be on par with other scripting languages. If you have hard number goals, and more precise information on data layout, format, and volume, we can give better advice. e.g. if you have a lot of data, but can store it in Red or redbin format, loading will be *really* fast. If you have to parse data, we have CSV and JSON codecs already, which you can test easily. If you're doing a lot of numeric work, what @ldci said applies. With Red you can write most of your code at the high level, then mix in R/S routines for optimized bits. e.g. compare the two mandelbrot versions in https://github.com/red/code/tree/master/Scripts. 15:47An optimizing compiler isn't high on our roadmap, but we are considering an LLVM back end, which would give some things a boost. gcaplan 16:06Gregg - thanks, I'm much clearer now. From what you're saying, it sounds as though I should take up your suggestion and run some practical tests. Thursday 7th October, 2021 rebolek 13:19[Castr](https://gitlab.com/rebolek/castr) has been updated with a new file - %curl.red that can translate curl calls to Red. So if you want to try some API examples that usually are written in curl, you don’t have to translate them to Red manually, castr will do it for you. 13:19Also there are some bugfixes as usual. greggirwin 16:39:+1: 17:13You mention the amazing logo, but where can I see it? rebolek 17:40Right in the repo :-) https://gitlab.com/rebolek/castr/ 17:40https://gitlab.com/uploads/-/system/project/avatar/20135800/CASTR.png?width=256 greggirwin 17:43Ah, I missed it. Was looking for the image *in* the repo. I remember it now. Friday 8th October, 2021 planetsizecpu 04:37Great job @rebolek rebolek 08:27Thanks 08:29Also, I’ve rewritten the mime-decoder to use Red codecs, so now it can for example load images properly: >> r: make-request [GET https://xmonad.org/images/screenshots/screenshot.png] >> r/data == make image! [1919x1080 #{ ... toomasv 12:05:clap: :+1: greggirwin 16:05That's great @rebolek! rebolek 17:25Thanks guys. Saturday 9th October, 2021 vazub:matrix.org 13:04Hey everyone! sorry for my excitement (in case I am playing Captain Obvious here), but I just seem to have compiled Red CLI console from sources with Red itself, aka self-hosted. Are we actually there yet? hiiamboris 13:35Console was always compileable, but the compiler itself is encapped using Rebol/Pro and is written in R2 at this time. Geo-7 14:18Hi, in rebol we could listen on a tcp port like this: port: first wait open/lines tcp://:55555 how could I do the same in Red? 14:28I've search in the chats and it seems ports will be in version 0.7. any roadmap to 0.7? hiiamboris 14:52Hi! There should be basic tcp in the [IO branch](https://github.com/red/red/tree/IO) 14:52@rebolek can say more rebolek 19:48@hiiamboris @Geo-7 IO branch works the the same. 19:50If TCP is good for you, there’s not much to add. If you’re interested in higher-level, let me know. Sunday 10th October, 2021 GiuseppeChillemi 21:42@rebolek interested! Monday 11st October, 2021 rebolek 15:41Modifying object!: >> o: context [a: 1 b: 2] == make object! [ a: 1 b: 2 ] >> make o [b: 3] == make object! [ a: 1 b: 3 ] modyfing map!: >> m: #(a: 1 b: 2) == #( a: 1 b: 2 ) >> make m [b: 3] == #( b: 3 ) 15:44Why is the original map! not used as a prototype? hiiamboris 15:48make only has a special case for objects. Everything else yields the type only. 15:48Use extend copy m [b: 3] instead. 15:52Gregg also wants to make blocks with other prototype blocks. 15:55Vectors IMO are the most sensitive type here: we currently cannot (at all) create vectors with the same unit type as the prototype vector. We can copy the prototype and clear it, but this is bound to create RAM problems. 15:59Question then arises: should make vector1 [data]: - as it is now, dumbly create the vector from data/1 type (this rules out float-32 and int-16/int-8) (ignorant type inference) - create an empty vector of type of vector1 (enhanced type inference) - copy vector1 and add data to it (extension model you and Gregg want) (this also does not align with make vector1 size expression where clearly vector1 is not copied) greggirwin 17:05Important note! If you use compress/decompress the spec for those func is changing. There is a lot of discussion [here](https://github.com/red/red/issues/4960) about it. Long term this will be a very good change, but it does mean existing code has to be updated to use new Red versions after the PR for it is merged. Tuesday 12nd October, 2021 ldci 04:54@greggirwin. Some tests Red 0.6.4 for macOS built 7-Oct-2021/13:56:13+02:00 commit #7218fb4 image size: 3155x1963 redCV (Based on Bruno Anselme's Red/System zlib binding) default compression compression: 650 ms decompression: 131 ms Compression ratio: 15.45 % best speed compression compression: 549 ms decompression: 138 ms Compression ratio: 16.96 % best compression ratio compression: 654 ms decompression: 132 ms Compression ratio: 15.45 % Red Natives default (gZip) 954 ms for compression 2013 ms for decompression Compression ratio: 4.05 % /zlib 943 ms for compression 1977 ms for decompression Compression ratio: 4.05 % /deflate 863 ms for compression 1979 ms for decompression Compression ratio: 4.05 % Oldes 11:32@ldci that is logical as Red is not using any library and the de/compressor is written in Red/System only without any optimization. Btw... your test data is raw RGBA binary or molded image? 12:50But it is strange, that decompression is so much slower than compression. It should be opposite, like with the binding version. hiiamboris 13:32indeed ldci 15:14@greggirwin Tests made with raw RGBA binary data. For the slow decompression, no idea greggirwin 17:37Thanks for the tests @ldci. Very helpful. I don't know how Red's defaults differ from zlib so that's one thing to check . Decompression should not be that slow, but someone will have to dig in to see. 17:45Inner loops with bit twiddling, casting, and byte copying all offer opportunities that may affect code like this in an outsize way, where an optimizer can make a big difference. That's my guess in quickly looking through the window anyway. :^) hiiamboris 17:48just need R/S level profiler greggirwin 17:48I seem to recall that some core bits of WinZip were hand-written ASM, but it's no FOSS of course, so we can't see it. It's not worth Nenad's time to dive deep on this right now, but it's something we should note, along with the zlib binding for people who want to make that tradeoff. @hiiamboris yes. 17:50The interesting thing is how good the compression performance is, which tells me decompression *could* be much faster. ldci 17:53Hi again. Here is the code Red [ Title: "Test ZLib " Author: "Francois Jouen" File: %compress2.red Needs: 'View ] ;required libs #include %../../libs/tools/rcvTools.red #include %../../libs/core/rcvCore.red margins: 5x5 defSize: 256x256 imgSize: 0x0 isFile: false isCompressed: false ; compression type cprx: ["GZip" "ZLib" "Deflate"] clevel: 1 n: 0 ;--non compressed image size nc: 0 ;--compressed image size loadImage: does [ isFile: false tmp: request-file if not none? tmp [ imgSize: rcvGetImageFileSize tmp rgb: rcvLoadImageAsBinary tmp img1: rcvCreateImage imgSize img2: rcvCreateImage imgSize img3: rcvCreateImage imgSize img1/rgb: rgb b1/image: img1 b2/image: img2 b3/image: img3 f0/text: f1/text: f11/text: f2/text: f3/text: sb/text: "" f1/text: form imgSize result: copy #{} result2: copy #{} isFile: true isCompressed: false ] ] compressImage: does [ sb/text: "Compressing image..." f0/text: f2/text: "" img2/rgb: 0.0.0 b2/image: img2 img3/rgb: 0.0.0 b3/image: img3 do-events/no-wait n: length? rgb t1: now/time/precise case [ clevel = 1 [result: compress rgb] clevel = 2 [result: compress/zlib rgb] clevel = 3 [result: compress/deflate rgb] ] t2: now/time/precise sb/text: rejoin ["Compressed in " rcvElapsed t1 t2 " ms"] nc: length? result ;image compression ratio τ compression: round/to 1.0 - (nc / n) * 100 0.01 f0/text: rejoin ["Compression: " form compression " %"] f11/text: rejoin [form n " bytes"] f2/text: rejoin [form nc " bytes"] ; not useful for compression ; only to show image compression if cb/data [ img2/rgb: copy result b2/image: img2 ] isCompressed: true ] uncompressImage: does [ sb/text: "" f3/text: "" do-events/no-wait t1: now/time/precise case [ clevel = 1 [result2: decompress result] clevel = 2 [result2: decompress/zlib result n] clevel = 3 [result2: decompress/deflate result n] ] t2: now/time/precise f3/text: rejoin [form length? result2 " bytes"] img3/rgb: copy result2 b3/image: img3 sb/text: rejoin ["Uncompressed in " rcvElapsed t1 t2 " ms"] ] view win: layout [ title "Image compression with Red" origin margins space margins button 90 "Load image" [loadImage] dp: drop-down 140 data cprx select 1 on-change [ switch face/selected [ 1 [clevel: 1] 2 [clevel: 2] 3 [clevel: 3] ] isCompressed: false ] cb: check 130 "Show compression" button 88 "Compress" [if isFile [compressImage]] f0: field 136 button 93 "Uncompress" [if isCompressed [uncompressImage]] button 50 "Quit" [if isFile [ rcvReleaseImage img1 rcvReleaseImage img2 rcvReleaseImage img3 ] quit] return f1: field 125 f11: field 125 text 125 "Compressed" f2: field 125 text 125 "Uncompressed" f3: field 125 return b1: base defSize black b2: base defSize black b3: base defSize black return sb: field 778 ] 17:54You can adapt to avoid redCV libs usage :) Wednesday 13th October, 2021 qtxie 03:06> But it is strange, that decompression is so much slower than compression. It should be opposite, like with the binding version. Two main reasons: 1. R/S is slower than C. 2. The R/S implementation is slower than zlib. The R/S version is ported from this C code: https://gist.github.com/vurtun/760a6a2a198b706a7b1a6197aa5ac747 We can compare the C version with zlib, then we know how much is the C version slower than zlib. The R/S deflate use static Huffman tree encoding only. If using dynamic tree as zlib, it should be much slower. But the compression ration should be much better. mydoghasworms 05:01I have learned via the redlang subreddit (or I forgot and this reminded me) that there is a beta website at https://beta.red-lang.org/, which is a great improvement over the current website. Any reason why it is not live yet, and when is it planned to be live? rebolek 07:04It’s still not fully done yet. greggirwin 16:24I hope we can make them live in the next month or two. We need to get some logistics ironed out, and continue with content. For both of those tasks we need assistance. It can be a single person, as the load is not heavy. If anyone knows a web dev, hook me up. 16:26Thanks for the info @qtxie ! 16:28Nice to see you again @mydoghasworms. JacobGood1 17:15I am seeing a lot of activity on debugging, that is nice =) greggirwin 17:34Just wait until you see what's coming soon. JacobGood1 17:36Hints? Maybe a really cool, extensible ide? greggirwin 18:41That's a little farther out. :^) GiuseppeChillemi 18:56@greggirwin Let's see, I have been silently waiting since the day you know, as I know it is not constant pressure and negative observation which helps a project like this. Hope Santa will come with the gifts I hoped to receive last Christmas. greggirwin 19:00:^) Thursday 14th October, 2021 Geo-7 10:40How could I compile red from source (not only red console) do/args %red.r "-r %environment/console/CLI/console.red" only compile console which does not support -c for compiling. hiiamboris 10:56you need rebol sdk for that Geo-7 11:20OK after getting that? hiiamboris 11:25https://github.com/red/red/tree/master/build Geo-7 11:29Thanks. Friday 15th October, 2021 rebolek 07:48TAR and ZIP (un)packers were updated for latest Red version https://github.com/rebolek/red-tools/tree/master/packers ldci 08:27@rebolek Thanks. I’ll test my samples. rebolek 08:28@ldci please test it, I just changed the compress and decompress calls to fit new specs and haven'ŧ tested it. But it should work fine. ldci 09:31@rebolek Works fine. Decompress is still slower. There is also an error message from macOS /BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.200.3/Common/ChunkCompression.cpp:49: Error: unsupported compressor 8 /BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.200.3/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/Frameworks/AppKit.framework/Resources/Base.lproj/NSTextTouchBarItems.nib’ rebolek 10:38@ldci thanks. The error message is a question for @qtxie , I just changed the calls to compress and decompress. greggirwin 21:42Thanks for updating @rebolek and for testing @ldci. Saturday 16th October, 2021 gltewalt 01:55Anyone know the *why* of having the iteration variable not local to the loop? USAGE: REPEAT 'word value body DESCRIPTION: Evaluates body a number of times, tracking iteration count. REPEAT is a native! value. ARGUMENTS: 'word [word!] "Iteration counter; not local to loop." hiiamboris 08:34https://github.com/red/red/wiki/[LINKS]-Design-questions#why-loops-do-not-make-their-words-local-to-loop-body-but-rely-on-function-to-do-that zentrog:matrix.org 16:39What is the reason that trim/with implies /all? It seems more flexible to have those refinements separate, but maybe I am not correctly interpreting the purpose of /with. greggirwin 16:46That's a carryover for Rebol compatibility, but certainly one we can revisit. zentrog:matrix.org 18:33Makes sense. It's a change that could potentially break things, but it would be pretty simple to just add /all anywhere /with is used. We could consider starting a migration tool... gltewalt 18:51I'd rather remove the whitespace removing part of with. Maybe they only want to trim "!" and keep the whitespace unchanged 18:52And /all could be changed to /ws 18:55I understand that it always technically whitespace, it also removes none from blocks - but then the help description specifically states "all whitespace", so... /ws seems fine to me hiiamboris 20:12whitespace is the most common case (by far), so we should keep it as short as possible greggirwin 20:23And /ws isn't a word. gltewalt:matrix.org 20:30Yes, pronounced "wissssssss" zentrog:matrix.org 21:04It would be handy anyway to have a whitespace (or ws I suppose) word containing all the the white space characters. If that was there, it wouldn’t be that big a deal to do `ws and additional characters’ greggirwin 23:36We plan to include some standard parse charsets in the future. Sunday 17th October, 2021 pekr 08:15I think that red progress page does not update last week ... greggirwin 22:39@pekr thanks, I see the same. Tuesday 19th October, 2021 GaryMiller 22:03No Red Progress since 10/6? Has the link changed? https://progress.red-lang.org/ Wednesday 20th October, 2021 pekr 04:16I think the page is broken again. It happens from time to time. I notified and Gregg kind of confirmed. Not sure who maintans that though and when it is supposed to get fixed :-) greggirwin 04:54@x8x has maintained that in the past. pekr 05:29It's so valuable, that it should imo come under the wings of the Red team. greggirwin 05:33No argument here. pekr 06:28Gregg, looking into a beta page for a red-lang.org, into a Roadmap section. I can see Trello being mentioned there. Trello did not get update for quite some time imo. My thought was to get the progress page there, with just one sentence, something like - you can watch interim advancements here .... At least for me, progress page is the page to go to and shows the project activity nicely. greggirwin 17:38That's a good idea @pekr. Friday 22nd October, 2021 loziniak 14:26hello. does anybody know about a *Redbin* [serde](https://serde.rs/) data format? I'm planning to implement it if there is nothing yet. greggirwin 17:21There are none that I know of, but I remember seeing Serde some time back and thinking it was interesting. Maarten was going to work on ProtoBuf, mainly for gRPC use, but we've also talked about some other binary formats. Schema based codecs are a very cool idea. Keep us posted, or let us know if you want collaborators. loziniak 18:18I want collaborators :-) 18:19Or perhaps more like "mentors", because I'm totally new to Rust. greggirwin 19:27Ah, I see what you mean now. I thought you meant a serde-like project for Red, but you mean a new serde entry for redbin. I could help with the former, but Rust is not in my skills list at this time. 19:28Try reaching out to the Rust and Serde communities. Those are the skills you need, and they will probably be happy to see a new addition, especially if we can add some libRed examples for Rust. loziniak 19:33Exactly, I probably didn't explained that clearly. You suggest using libRed in this implementation? In fact I'm going to use it to create Red <-> Rust bindings, so perhaps it would be awkward if from Red I called Rust, which calls libRed :-) 19:58Anyway, if someone is interested, Here's a repo: https://github.com/loziniak/redbin greggirwin 20:31I wasn't clear either. :^) What I meant was to show a) how you can work in Rust and interchange data with Red apps and services via Serde, and b) how can you write Rust apps that use libRed as an alternative, for handling Red data *and* so much more. Saturday 23th October, 2021 mikeyaunish 03:24What is the best way to deal with datatypes held in a block. It seems that every type of data in a block keeps it's datatype except datatypes themselves, they are retrieved from a block as a word! >> b: [ "hi" string! ] == ["hi" string!] >> type? b/1 == string! >> type? b/2 == word! 03:26I want to retrieve them from the block as a datatype! so I can correctly compare it with other blocks. hiiamboris 06:18'get' them henrikmk 13:35@mikeyaunish to store them as datatypes in the block, you need to serialize them first or REDUCE or COMPOSE the block or build the block. >> b: ["hi" #[string!]] == ["hi" string!] >> type? b/2 == datatype! or: >> b: reduce ["hi" string!] == ["hi" string!] >> type? b/2 == datatype! or: >> b: ["hi"] == ["hi"] >> insert tail b string! == [] >> type? b/2 == datatype! mikeyaunish 13:45@henrikmk Thanks for the clarification. cloutiy 18:48What is #[...] ? I dont think i seen this before 18:49#(...) is for hash but what about with the square brackets? hiiamboris 18:50temporary construction syntax for mold/all cloutiy 18:51Ok thanks for clarifying... 19:10How can i introduce a ] character ? Lets say i have a #macro 'end [ '] ]. Of course '] gives a syntax error. But the problem is i want to replace end with ] in my source. Is it possible? hiiamboris 19:18before you load it - certainly 19:19https://github.com/red/red/wiki/[DOC]-Guru-Meditations#modifying-data-before-loading-it-lisp-reader-macros 19:22more robust solution would be to parse loaded source and transform it 19:25or use https://w.red-lang.org/en/preprocessor/#pattern-matching-macros to replace begin stuff end with [stuff] 19:30#macro ['begin copy stuff to 'end skip] func [[manual] s e][change/part/only s stuff e s] 19:31can't recommend anything not knowing what is it you're doing Sunday 24th October, 2021 cloutiy 18:52Thanks for the links and example @hiiamboris . Ill experiment a bit more and report back Monday 25th October, 2021 GiuseppeChillemi 22:07It would be possible to have description strings on /local words? It would be nice for function documentation on SPEC-OF Example: valid-column-names?: func [ "Check if a block contains only words or strings" data [block!] "The block to check" /local {This is a note} data-local "To be used as local copy of data positioned at head position" element "The current element to check" out "The output result" ] As it seems you are working on a debugger, this would let you have words description/documention at output. The note after /local could document the current function and context from the coder/debug perspective greggirwin 22:56It's not illegal today (though may not compile, I don't remember). We plan to work on a full Red specification next year, to lock down core behaviors. Tuesday 26th October, 2021 GiuseppeChillemi 18:26I use to comment the description texts, instead of using them as strings. It helps a lot remembering what they do. Also, strings are processable after loading while comments are not. Wednesday 27th October, 2021 hiiamboris 16:17Hi! If you feel like expanding mental horizons, here's an experiment I'd love feedback on. ## [MORPH DSL - A dialect for efficient local series conversion](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/morph.md) A few teaser examples (more on that page): >> morph [1 2 3 4] ['x 'y ...] ['y 'x ...] == [2 1 4 3] >> morph/auto [1 2 3 4] ['x ? even? x | skip ...] ['x ...] == [2 4] >> morph/auto/into [1 2 3 4] ['x ...] ['x (not 'x | " ") ...] "" == "1 2 3 4" greggirwin 16:38:+1: GalenIvanov 19:44That's great, @hiiamboris ! ldci 21:39Really interesting @hiiamboris Thursday 28th October, 2021 gltewalt:matrix.org 00:34Block comprehensions? GiuseppeChillemi 05:03@hiiamboris it is a great work. As far I can see it is one way. Isn't it? hiiamboris 06:42Yes. When automatic changes propagation gets implemented you will still have to define separate mappings if you wish your changes to go in both directions. That is because only a tiny subset of transformations can be deterministically reversed, and I don't want to limit the tool to just those cases. 09:15@gltewalt:matrix.org if you would like to write a simple CSV codec using list comprehensions only (without using split/join/readcsv/writecsv functions), it would be a nice comparison ;) GiuseppeChillemi 13:06@hiiamboris Do you see any circular reference problem? I mean the target wich triggers modifications in the source and source which modifies the target. hiiamboris 13:13That's an implementation detail. Reactivity has the same issue, but is able to deal with it. GiuseppeChillemi 13:36I like morph. I have taken multiple annotations during the past years about a way to see the same data in multiple shapes. Let's see how could I use your creation to implement my view. hiiamboris 13:40:+1: 13:43If you could just identify some use cases for it and share with us, that would be already helpful! mikeyaunish 14:17@hiiamboris - Looks good. It feels like this could plug a huge complexity hole. hiiamboris 14:27So I hope :) GiuseppeChillemi 18:53@hiiamboris could be possible to pass the data collected from a Morph rule to a fuction before emission? 18:55Also, the scan seems linear, could we backtrack as using pos: :pos in Parse? hiiamboris 18:58No, you can't go back like pos: :pos. That would create mapping ambiguity ;) You can backtrack just by failing the rule though. GiuseppeChillemi 18:59I would also like to rapresent data as in objects. I mean: could we morph to [ header: DATA body: DATA size: value ] So, if we change something in original data belonging to the header, we can access the update one in output/header hiiamboris 19:04> @hiiamboris could be possible to pass the data collected from a Morph rule to a fuction before emission? there are examples at the end of morph.red, in particular set 'data scan text my-scan-rules/csv ?! data data/tree is what you looking for, but it's format is not fixed beyond what is explained in the documentation GiuseppeChillemi 19:05I am having problems understanding the part which uses a context. I will make questions about it. hiiamboris 19:05Sure 19:06As for parsing objects, I don't think the model fits it. Objects are not sequential. Best I can offer is to map each object's field separately. Or create multiple-source mapping that reads from those fields (not yet designed though). GiuseppeChillemi 19:07Let's see, I was just writing one of the ideas I have had for a reshape command. 19:08I will need to work and ask about Morph to go further. 19:10However, again are my words of recognition for you great work. 19:11> As for parsing objects, I don't think the model fits it. Objects are not sequential I don't want to parse an object but parsing TO a series which has set-words as in object. 19:14Reshaping an object/data and its keys was one of the original goals of my idea. 19:17It is like having VIEWS in relational database. Your work will simplify a lot the creation of this kind of objects. 19:18I will work with Morph on this task. hiiamboris 19:24To match set-words, you can add a datatype! type dispatcher to morph-ctx/scanner/type-rules. I forgot about it ;) Or just use smth like 'x ? set-word? x To emit set-words you may add a quote rule to emit-rules. E.g. quote x:. Or if your set-word comes from outside e.g. as name, use :name to emit it. 19:24Emitting object should be possible with to object! rule. 19:26I can add these features tomorrow and cook up a few examples. No big deal. 19:28But I'm working blindly then, and it would be better if you found an optimal ruleset for you and told me ;) GiuseppeChillemi 19:28To object!/map!. It would be nice to append rows to a block of objects or rows to a map. 19:29> But I'm working blindly then, and it would be better if you found an optimal ruleset for you and told me ;) 19:29Need some time, this juice is too fresh. hiiamboris 19:29Good ideas anyway, thanks! GiuseppeChillemi 19:31You are welcome, I am always happy to share ideas with you, as it is not important who implements them but that they are implemented. I am happy to see that what I think is appreciated and created by someone else. hiiamboris 20:15Piece of cake ;) Quoting in the emitter: >> morph/auto [] [] [quote x: lit [y: z:]] == [x: y: z:] Datatypes in the scanner: >> morph/auto [1 "x" 2] [x: integer! | skip ...] ['x ...] == [1 2] Object creation in emitter: >> morph/auto ["x" "y" 10 20] [name: string! | value: integer! ...] [to object! [to set-word! 'name 'value] ...] == [make object! [ x: 10 ] make object! [ y: 20 ]] >> morph/auto ["x" "y" 10 20] [name: string! | value: integer! ...] [to object! [to set-word! 'name 'value ...]] == [make object! [ x: 10 y: 20 ]] GiuseppeChillemi 20:25Could you append multiple objects in the output Block, so having multiple `rows? 20:26And Maps with multiple Rows? 20:27Pardon, I see it is the first one. 20:29To properly use it as DB table, every object/map should have the same keys. 23:38@hiiamboris Experimenting: >> morph/auto [10 20 12 33 55 99] ['x 'y ...] [to object! [to set-word! quote 'a 'x to set-word! quote 'b 'y] ...] == [make object! [ a: 10 b: 20 ] make object! [ a: 12 b: 33 ] make object! [ a: 55 b: 99 ]] 23:42As map!: >> morph/auto [10 20 12 33 55 99] ['x 'y ...] [to map! [to set-word! quote 'a 'x to set-word! quote 'b 'y] ...] == [#( a: 10 b: 20 ) #( a: 12 b: 33 ) #( a: 55 b: 99 )] 23:45Map! does not limit your key names as some DBMS permits column names which are not allowed as keys in objects. Friday 29th October, 2021 hiiamboris 06:23Try lit [a:] instead of to set-word! quote 'a. GiuseppeChillemi 07:41@hiiamboris do %../red-mezz-warehouse-master/morph.red data: loop 20 [append [] random 100] table: morph/auto data ['x 'y ...] [to map! [lit [a:] 'x lit [b:] 'y] ...] comparison: reduce [data/1 data/2 table/1] probe comparison data/1: 999 comparison: reduce [data/1 data/2 table/1] probe comparison Print "---- Second Test ----" table: morph/auto data ['x 'y ...] ['x 'y ...] data/1: 777 comparison: reduce [data/1 data/2 table/1] probe comparison data/1: 888 comparison: reduce [data/1 data/2 table/1] probe comparison Results: [53 81 #( a: 53 b: 81 )] [999 81 #( a: 53 b: 81 )] ---- Second Test ---- [777 81 999] [888 81 999] In the first test, a does not sync In the second one it seems multiple things are happening.... hiiamboris 07:50Like I wrote multiple times in the docs, syncing is a lot of work and we decided to postpone the implementation for better times. And for now just see if there's enough interest in this project. 07:51 >> ? morph USAGE: MORPH source scan-rule emit-rule (...) /live => Establish a persistent mapping (TBD). >> morph/live [] [] [] *** User Error: "Not implemented!" *** Where: do *** Stack: morph toomasv 09:09@hiiamboris Interesting work! :+1: Playing with some examples I noticed following: morph/auto [1 2 3 4] ['x ? odd? x | x < 3 | skip ...] ['x ...] ;== [1 3] ; I expected [1 2 3] morph/auto [1 2 3 4] ['x ? [odd? x | x < 3] | skip ...] ['x ...] == [1 2 3 4] ; again expected [1 2 3] Was my expectation wrong? How to achieve comparison with multiple criteria? I admit I haven't read the readme thoroughly yet. 09:14Ok, got it morph/auto [1 2 3 4] ['x ? (x < 3 or odd? x) | skip ...] ['x ...] == [1 2 3] hiiamboris 09:16| x < 3 is an alternate branch that will try to match value of x, then value of <, then 3 09:17? any [odd? x x < 3] should work too 09:18it just calls do/next: >> ? :scan-rules/? func [ {Evaluate next expression, succeed if it's not none or false} input args /local r end ][ set/any 'r do/next as [] args 'end as-pair either :r [0] [-1] offset? args end ] toomasv 09:23I obviously get something wrong: morph/auto [1 2 3 4] ['x ? any [odd? x x < 3] | skip ...] ['x ...] *** Script Error: | has no value hiiamboris 09:24let me see... 09:32yeah it calls the any rule instead of any function, because it was bound as such :D 09:43 >> filter: [any [odd? x x < 3]] morph/auto [1 2 3 4] ['x ? do filter | skip ...] ['x ...] == [1 2 3] >> morph [1 2 3 4] context [filter: [any [odd? x x < 3]] return with scan-rules ['x ? do filter | skip ...]] ['x ...] == [1 2 3] I don't have an easy answer :( bind is a double edged sword. We want it to help us fetch named rules, but somehow want to preserve parts of the rule as code. Catch-22 by the looks of it. 09:46I did consider putting all rules into a map!, but by doing this I would introduce lower limit on performance, which will slow it down by an order of magnitude once it gets an R/S implementation. Because each word lookup will become by necessity a hash lookup. toomasv 09:51Got it, thanks! 09:55@hiiamboris :) morph/auto [1 2 3 4] ['x ? or~ odd? x x < 3 | skip ...] ['x ...] == [1 2 3] hiiamboris 09:55Yeah :) or like this for the general case: >> ~: system/words >> morph/auto [1 2 3 4] ['x ? ~/any [odd? x x < 3] | skip ...] ['x ...] == [1 2 3] toomasv 09:56:laughing: Yes hiiamboris 10:05Perhaps this will be reason enough to actually go with the maps. And when it gets R/S implementation, we could just optimize map access. Considering it's a tiny map, it doesn't *have* to be slow. 10:08But there will be another issue: you won't be able to compose rules from different contexts. Like currently there's scan-rules and your own ruleset(s). But if it's a map it has to be prepared upfront. Likely as extend copy scan-rules user-scan-rules. That is, composability is limited this way, plus extra startup overhead. 10:11On the bright side, no rules with the same name but different meaning will be possible :D toomasv 11:03@hiiamboris Another question: Why the difference? >> morph/auto ["x" "y"] ['name ...] [load 'name ...] == [x y] >> morph/auto ["x" "y"] ['name ...] [to word! 'name ...] == [x y] >> morph/auto ["x" "y"] ['name ...] [to-word 'name ...] *** Script Error: cannot MAKE/TO word! from: [name [make vector! [0]... hiiamboris 11:07there's to rule, but no to-word rule. ? :emit-rules/to toomasv 11:08Ah, thanks! hiiamboris 11:09we should ask @greggirwin why ? emit-rules/to doesn't work btw toomasv 11:17Pretty sleek res: morph/auto src: ["x" "y" 10.8 "z" 20 30%] [name: string! | 'value ...] ['name 'value ...] == ["x" 10.8 "y" 20 "z" 30%] >> change src/1 "w" res == ["w" 10.8 "y" 20 "z" 30%] >> change src/2 "q" res == ["w" 10.8 "q" 20 "z" 30%] But changed scalars cannot be tracked? >> change at src 3 11 res == ["w" 10.8 "q" 20 "z" 30%] hiiamboris 11:19Nothing is tracked right now, just some values may be same. But the plan is to track only named values. 11:21That is, in your example both name and value will be tracked once it's implemented. toomasv 11:21Yup, got it, just nothing copied. GiuseppeChillemi 11:26@hiiamboris I should not read the docs late at night. I have not read that live syncing was not available :-) 11:29Also, could Morph code be seen as a loop somewhere? I mean a cycle which has a clear star/end phase. hiiamboris 11:37Absolutely. https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/morph.red#L225 11:37See eval-ruleset and eval-next-rule (they're a bit messy, sorry ;) GiuseppeChillemi 12:03@hiiamboris when you will add Foward sync I will make you a surprise :-) hiiamboris 12:06Great ;) pekr 13:36Morph sounds good, but looks complicated to me ... But most probably I am not a target anyway :-) hiiamboris 13:42Ideas how to simplify it are welcome, @pekr ;) pekr 13:45It might be easier accept the fact, that it might not be done for me. But I worry then, that part of Red code is going to be unreadable for me then. 13:48E.g using not xto simulate parse's end, or just above code morph/auto src: ["x" "y" 10.8 "z" 20 30%] [name: string! | 'value ...] ['name 'value ...].... 13:49Maybe some questions. Does |denotes OR, the same as in parse, whereas ...is something like repeast/some/any? ne1uno 13:51trick and treat pekr 13:55I can feel there's going to be a lot of flexibility here, but worry about the code being understand only by real gurus. 13:56@hiiamboris btw - do you remember R3 DELECT function? It was produced for a quick mapping of command-like interfaces / codecs, but it was really much simpler in nature and later on was even removed from R3 IIRC. 13:59http://www.rebol.com/r3/docs/functions/delect.html hiiamboris 14:07> Does |denotes OR, the same as in parse, whereas ...is something like repeast/some/any? yes, like any 14:08> do you remember R3 DELECT I saw it but never had a chance to use pekr 14:16What my simple mind did (well, I am 3 days after a throat surgery, but I would not understand it probably anyway :-) ), my mind started to look for a translation to parse :-) hiiamboris 14:20Delect-like behavior should be possible to build with Morph. ldci 18:45[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/xi1l/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/xi1l/image.png) 18:45For the fun: Rebol Core runs under Haiku(Beos5) OS, but not Rebol View. 18:46I’ve try to compile execute red code without success. 18:49BTW Rebol R3 also works with Haiku:) loza:matrix.org 19:07wow! porting Red to Haiku is my dream side-project, that I'd like to accomplish at some point. I suspect lots of fun with view implementation :-) 19:07I love Haiku, and follow them even longer, than Red :-) ldci 19:16@loza:matrix.org Haiku is 20 year-old today :) loza:matrix.org 19:25it's like wine! :-) greggirwin 20:26@hiiamboris @toomasv on help for emit-rules/to, the issue boils down to get on path values. >> get 'emit-rules/to *** Script Error: emit-rules/to is missing its input argument *** Where: to *** Stack: to We don't seem to have a ticket for this, and R2 behaves the same. I don't know if changing this has deep implications or not, or how to work around it at the moment. On the help side, giving it a function (e.g. :emit-rules/to) means there's no name, so it just dumps the value. 20:26Fun note on Haiku. Thanks @ldci. 20:29@pekr, I lean in the same direction you do. But I haven't had time to read the docs Boris wrote to understand it fully. Just reading examples, they do look like magical incantations from the land of array languages. :^) hiiamboris 21:50Now you know how outsiders look at parse ;) greggirwin 21:55Well, every feature will be natural or foreign to individuals. But here I'll note a key difference in parse vs regex or even other grammar notations. Parse uses words to describe e.g., [opt any some to thru]. But I'm not being critical of morph (yet ;^) because I'm still in a position of ignorance. Need time to play, then I may become a convert. :^) Saturday 30th October, 2021 gltewalt 01:01@hiiamboris You already mostly did the codec in your README, didn't you? pekr 04:53That was my point. E.g. could ...be replaced just by any? Could three dots become just an alias to any? Something like parse "This is text" [... [space (print "space") | skip]], but then what to use for some? But then, not sure I would really mind more parse like semantics morph/auto ["x" "y"] [any 'name] [any to word! 'name] hiiamboris 07:41@gltewalt yes, but not using list comprehensions ;) 07:48@pekr I don't find any more readable than .... any spells out verbally, but visually it is not distinctive from the other rules. But I have counterquestions for you: - are any/some rules defined in Morph? - if not, can they be defined yourself? - how is any [rule] different from [rule ...]? ldci 14:26Red is really fantastic! #! /usr/local/bin/red Red [ ] nMax: 16 ;--31 max value due to integer 32-bit limitation ;--Fibonacci's suite ;--Recursive memoized with map! datatype fib: function [n] [ m: #(0 0 1 1 2 1) any [m/:n m/:n: (fib n - 1) + (fib n - 2)] ] ;--with negative integers fib2: function [n] [ x: fib absolute n if all [negative? n even? n] [x: negate x] x ] ;--Binet's formula analytic: function [n] [ p: (1 + sqrt 5) / 2 to-integer (p ** n / sqrt 5) + 0.5 ] analytic2: function [n] [ p: (1 + sqrt 5) / 2 q: (1 - sqrt 5) / 2 to-integer ((p ** n) - (q ** n)) / sqrt 5 ] print "Fibonacci Tests" i: 0 t1: now/time/precise while [i < nMax] [ prin [fib i sp] i: i + 1 ] t2: now/time/precise print [lf "Recursive: " third (t2 - t1) * 1000 "ms" lf] i: 0 t1: now/time/precise while [i < nMax][ prin [analytic i sp] i: i + 1 ] t2: now/time/precise print [lf "Analytic 1: " third (t2 - t1) * 1000 "ms" lf] i: 0 t1: now/time/precise while [i < nMax][ prin [analytic2 i sp] i: i + 1 ] t2: now/time/precise print [lf "Analytic 2: " third (t2 - t1) * 1000 "ms"] print lf i: -15 t1: now/time/precise while [i < nMax][ prin [fib2 i sp] i: i + 1 ] t2: now/time/precise print [lf "Negative: " third (t2 - t1) * 1000 "ms"] and the result 14:26 Fibonacci Tests 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 Recursive: 0.1219999976456165 ms 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 Analytic 1: 0.097999996796716 ms 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 Analytic 2: 0.09699999645818025 ms 610 -377 233 -144 89 -55 34 -21 13 -8 5 -3 2 -1 1 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 Negative: 0.1670000056037679 ms hiiamboris 14:49you should use repeat and dt 14:50also, you're measuring the speed of prin mainly ldci 14:51@hiiamboris Good point :) 14:53@hiiamboris I use a while loop for negative and 0 integers. Repeat initializes a count to 1. Thanks for dt :) hiiamboris 15:19Funnier way: >> v: make vector! 40 add v 1 v/1: 0 == 0 >> v: at v 3 forall v [v + v/-2] head v == make vector! [0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 ... toomasv 15:43@hiiamboris Seems I didn't understand explanation about block! type. Expected this to work: morph [1 [2 3]]['a ['b 'c]]['a 'b 'c] ASSERTION FAILED! ... ldci 15:44@hiiamboris Really fun :) hiiamboris 15:50@toomasv looks like a bug ;) 15:53@toomasv fixed toomasv 15:56Thanks! But now I get empty result: morph/auto [1 (2 3)]['a ('b 'c)]['a 'b 'c] == [] Should it succeed? 15:56Ah, sorry, wrong try 15:57It works ok, thanks! hiiamboris 15:57need to use [] ;) toomasv 15:58But should parens work too? hiiamboris 15:59not in this case, no parens just group rules together, they do not dive into subseries 16:00 >> morph/auto [1 (2 3)]['a ['b 'c]]['a 'b 'c] == [1 2 3] only this is how it should work toomasv 16:00Ah, ok, thanks! hiiamboris 16:01thanks for testing ;) toomasv 16:05It opens very interesting possibilities! I read in md that history of parsing is recorded (haven't looked at code so far). I wonder, if I have input like e.g. "title1 para1 para2 title2 para3 ...", i.e. any number of paras after title, how can I guarantee same order in output after transforming each title and para? hiiamboris 16:13found some more bugs :D 16:16ah crap, I never implemented emit/set-word ;) toomasv 16:17Is it tied to my question or just... :) hiiamboris 16:18yeah, gimme a minute 16:35fixed the any rule and something else maybe here's a ruleset for your example: probe morph "title1 para1 para2 title2 para3" context with scan-rules [ digit: charset "1234567890" ws: charset " ^-^/^M" para: ["para" some digit] title: ["title" some digit] title+para: [title any ws (para any ws ...)] return [title+para ...] ] context with emit-rules [ title+para: system/words/quote ('title ['para ...]) return [title+para ...] ] 16:36== ["title1" ["para1" "para2"] "title2" ["para3"]] 16:37look at the picture in the .md, there's "ordered" and "unordered" labels.. my attempt to explain where order is preserved 16:41I really should move to maps to remove the overhead from this toomasv 16:48Ok, thanks! So, in principle we could define scan-rules for all elements of markdown (or html, pdf...) to break the text to a "doc-tree", and emit-rules for rich-text and html and whatever to "compose" a document in given format? hiiamboris 16:49Yep, should be a good use case toomasv 16:52Or, for that matter, define scan-rules for elements of any formal grammar to translate it into some ??? tree, and single set of emit-rules to translate this tree into parse-rule-block. (aka DiaGrammar, only DiaGrammar translates these grammars into parse directly, without the intermediate step) hiiamboris 17:01yeah, should work as well 17:06I've updated it to use maps, aka "rule dictionaries" 17:06/auto is not needed anymore, but /custom can be used to provide one's own rules instead of the default ones 17:07No context clash anymore between rules and Red funcs: >> morph [-33 -22 -11 -5 0 5 11 22 33] ['x ? any [x < -10 x > 10] | skip ...] ['x ...] == [-33 -22 -11 11 22 33] toomasv 17:09Great, thanks! Something changed in md? hiiamboris 17:10working on it toomasv 17:10:+1: hiiamboris 17:10but mostly it'll be changed examples 18:07[full changes to the docs](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/commit/61e931b57d2b684de5d97a6e3c7618f58e95802b) But of note: emitter now supports set-words, which helps to get rid of extra contexts by defining the named groups in line, e.g. csv-txt: context with emit-rules [ line: ['value (#"," 'value ...)] return [line :lf ...] ] can now be just csv-txt: [line: ['value (#"," 'value ...) :lf ...] 18:08Later I plan to actually anonymously *set* all such set-words, like line above, so they can later be repeated: [line: [definition] line line line]. Right now you cannot add line like this. giesse 18:27> Well, every feature will be natural or foreign to individuals. But here I'll note a key difference in parse vs regex or even other grammar notations. Parse uses words to describe e.g., [opt any some to thru]. But I'm not being critical of morph (yet ;^) because I'm still in a position of ignorance. Need time to play, then I may become a convert. :^) I recently stumbled upon a video about APL, with the author saying how beautiful his code was. I stared at it and thought that I'd rather learn Chinese characters - way more useful. Humans look so alien to me most of the time. GiuseppeChillemi 23:36To everyone: what about an online meeting for RED? Covid has made dangerous travelling and meeting each other but now we have tons of service to do this virtually. What about organizing a REDCON? Sunday 31st October, 2021 toomasv 07:57@hiiamboris > I've updated it to use maps, aka "rule dictionaries" *** Script Error: with does not allow map! for its ctx argument *** Where: either *** Stack: probe morph context with hiiamboris 07:58yes, no need for with scan-rules anymore toomasv 07:58:+1: GalenIvanov 09:03@giesse Don't forget that APL was conceived as an extension to the mathematical notation and was used theoretically (without computers) to teach mathematics years before it became A Programming Language. Is this equation readable for non-specialists? 09:05[![Schroddinger.svg](https://files.gitter.im/5565a1d415522ed4b3e10094/MitF/thumb/Schroddinger.jpg)](https://files.gitter.im/5565a1d415522ed4b3e10094/MitF/Schroddinger.svg) 09:25Having said that I admit that I like the readability of Red and that's why I'm here. dsunanda 09:28@GalenIvanov There's a subjective sweet spot between concision and clarity. You may find many Redbolers are a lost cause when it comes to maximum concision - remember, we're the ones who prefer Parse to RegExs. GalenIvanov 09:30@dsunanda I agree pekr 13:24@hiiamboris sorry, did not want to eventually upset you. I don't know answers to your questions. My understanding is, that ... is something like any, repeat, goto 10 🙂 13:26I don't know, if Delect allowed to write some simple parsers, nor how effective Morph would be for codec imolementations. I also know, that for a long time, there was a plan to write some higher level parse builder. Not sure, maybe Gabriele did it eith his Topaz. An example will follow. 13:30I am now trying select some small robotic system to teach my 5 years old son a few bits. My selection so far went to Makeblocks, which is imo based upon Scratch. They generate Arduino C or Python as a result. And i thought to myself - why this nicely expressive visual lang turns i to a bare bones Python eg? It should be a code itself, as it reads nicely, like VID. 13:32So like with Logo, commands like move, turn left, right, around, stop, etc. So let me just easimy specify those commands and possible parameters. 13:34New mBlock Neo robot allows to simply target ai, with faces lookuup, etc, and it still reads like a simple VID code. I don't want to feel like needing a PhD for a simple stuff. 13:35That of course does not mean, that for gurus, some cool and very flexible system might not exist. hiiamboris 13:52I'm not upset, no worries :) Those 3 questions, and especially the 3rd, is simply the key to knowing *the "why?"*, if you're so interested. 13:55Having said that, I'm pretty sure there will be no consensus on rules or style of a userspace parser. Instead everyone should eventually specialize it to own tastes. pekr 14:19I can imagine there being multiple subsystems, parse generators, so that one can choose from what fits best. And if not, parse is good enough to write such thing myself, with some advices from the community 🙂 greggirwin 18:43Does anyone else have an issue with Gitter not showing thread messages? The thread sidebar is always empty for me these days. hiiamboris 20:01try other browser? willyboar:matrix.org 20:41Hello everybody. Is red good enough for web dev? bferris413 21:20Haven't checked in in a while...is network programming possible with TCP/UDP sockets? Last time I dropped by it was in the works but no official announcement yet. Monday 1st November, 2021 willyboar:matrix.org 16:06does red has a package manager or something similar? hiiamboris 16:12yes, https://gitlab.com/rebolek/redquire willyboar:matrix.org 16:15Cool thank you. I will check it. rebolek 16:30It’s not a package manager, but an experiment. willyboar:matrix.org 17:24It is a start I guess greggirwin 19:08@bferris413 you can use the I/O branch, but full I/O isn't in production yet. 19:08@willyboar:matrix.org Red doesn't run in the browser, if that's what you mean. gltewalt:matrix.org 19:37I dont know APL, but the few videos I've watched - the symbols don't repulse me. I could see it being clear or pretty to a person that can read it. Tuesday 2nd November, 2021 cloutiy 22:33Hi, i have a function that exits or returns a value. I have this function inside a reduce [ myfunc]. After reduction, a end up with a block that says [unset]. Is there a way to not get anything inside the block? If i return none the block i get after reduction is [none]. All i want is [] greggirwin 22:38You will have to post-process the result block. 22:39Or do compose [(fn)]. cloutiy 22:43Ok thanks gregg Wednesday 3th November, 2021 cloutiy 16:18Why is the room showing me a ton of APL chat with 'go to thread'? It looks as though i wrote something about APL but i havent hiiamboris 17:31that's mobile client for you ;) GiuseppeChillemi 19:38I would like to open a ticket because I think we have a naming problem with index used in at so its help string. In Rebol and Red, index? returns the **ABSOLUTE** position: >> a: [a b c d] == [a b c d] >> index? a == 1 If we change the start of the series: >> a: [a b c d] == [a b c d] >> a: next next a == [c d] >> index? a == 3 So, when we state in AT help string: USAGE: AT series index DESCRIPTION: Returns a series at a given index. AT is an action! value. ARGUMENTS: series [series! port!] index [integer! pair!] RETURNS: [series! port!] the developer thinks that INDEX is the new position as defined by INDEX? which IS NOT! In: >> a: [a b c d] == [a b c d] >> a: next next a == [c d] >> at a 2 == [d] INDEX in AT is **RELATIVE** to the current position and not the INDEX? one. You may say that as INDEX? help string mentions *relative to the head* and the developer will understand AT uses a relative one but having seen this misunderstanding happening a lot of time, I am sure the first thought is INDEX = (INDEX? series) So think we should change the help AT string a follow: *Returns a series at a given index, **RELATIVE** to the current position* hiiamboris 19:43:+1: GiuseppeChillemi 19:56Let's see what others say and I will write a ticket greggirwin 22:02@GiuseppeChillemi thanks for the note. I don't know how common this misunderstanding it, but it doesn't jump out in my memory as something that has come up a lot. The goal, of course, is making things clear. And consistent if possible. As I look at series actions, index? is the exception to the rule, and [length? skip clear] mention "current index" ([find select] mention it for /reverse). Index? alone *doesn't* use the current index. For many actions no index arg is given, but a couple do: [pick poke]. Nothing else uses "current position" as terminology. Using a different word there solves the ugliness and confusion of this wording: *Returns a series at a given index, **RELATIVE** to the current index*, but doesn't make the problem go away. [head tail head? tail?] are interesting, because head/? refer to the first *index*, while tail/? refer to the last *value*. I don't know if changing at's doc string will help much, unless we decide to do it for all other series actions, which makes them all longer. We have to consider the goal of doc strings as well. They're more like clues or reminders, and necessarily can't contain too much detail. A more important clarification might be between at and skip but, again, we have to rely on the user thinking a bit about what the names imply. We can't explain 1 vs 0 offsets meaningfully in short doc strings. That's what real docs are for. Adding "relative" to at, while it's already used for skip for that distinction might muddy *those* waters. I'm OK with how "current index" is used in clear because it makes the language much more natural IMO. I hope others will give their thoughts as well. Thursday 4th November, 2021 GiuseppeChillemi 00:32@greggirwin While you see each instance of the same series as a reference to the same data and an index, I see a position and its index, where "position" is more like a physical place and index is its street address; so we have multiple places, each one with a number that is always relative to the head of a series. As human, if you have to move a person to a relative position, you don't say: "you will find me at number 4" but "you will find me at the fourth door from your current position", because you always count indexes from the head until you specify it is a RELATIVE index. Low-level Red coders see indexes everywhere, humans see one absolute index and the current position, as a physical one. If we call "the absolute index" the distance from the first absolute element and the "relative index" the one from the series current position, we could use the words as follow: skip uses offset at uses relative indexing to the current position pick uses relative index poke uses relative index index? returns the absolute index head/? refers to the element in the first absolute position tail/? refers to the element after the last one of the series. path! use relative indexing As you note, I have used the word "absolute" only for head/? because there are multiple first positions but just one tail for all, so you need to specify which one in the former but not in the latter. Some other observations: AT has an short-circuit between 0and 1 because at series 0 and AT series 1 returns the both the same element; pick series 0 gives none poke series index value returns an out of range message So, as the common working of everything else seems to not return none when using 0 or raising an error, it should noted only in AT help string that position 0 = 1 gltewalt:matrix.org 00:40I would expect at a 2 to return b 00:42Because intuition reads it as "What's AT index 2 of a" 00:43I wouldn't immediately question if it's relative, or what index the pointy finger points to. GiuseppeChillemi 00:46I think the same way using at. It happens because the human mechanism of counting from the absolute start of the series is in place and also we have the index? question which "answers" and defines what an index is. greggirwin 04:20Somewhere there is a nice treatment, IIRC, of at vs skip WRT 0/1. Just can't find it right now. The behavior there is definitely a design choice we have to nail down, commit to, and document. @GiuseppeChillemi while I deeply appreciate the detailed thought you've put into this, I'm still not convinced that we have an improvement in what you've posted. We may need to mock up doc strings for all the series actions to see how they compare as a complete set. @hiiamboris may have some of the deepest experience in the zero-crossing index handling, from things he's done in various projects. hiiamboris 06:18+1 to absolute index vs relative index terms. GiuseppeChillemi 08:56@greggirwin series at lower level are are inner series reference coupled with an index, which rapresent the current position, aren't they? greggirwin 18:13Yes. GiuseppeChillemi 21:52About this: 21:52> We have to consider the goal of doc strings as well. They're more like clues or reminders, and necessarily can't contain too much detail. 21:56We, as humans, when learning something new, build a series of working hypothesis. The less words you use to describe it, the more are the possible scenarios too chose from. So it is really important that help strings are short but not too short. Otherwise wrong one could arise and be chosen. Friday 5th November, 2021 toomasv 05:08While it doesn't strike me as a matter of high importance, I would vote for "Returns a series at a given relative index." in at help. greggirwin 05:31And what about all the other funcs? Do we add "relative" there, do we add "absolute" in the smaller number of exceptions, do we do both? And does it help since we don't talk about relative or absolute indexes anywhere else, or do we then need to define these terms in series docs? toomasv 08:13As said, I don't think it is of high importance, so I am content with formulations as they stand. But if it is claimed that these are confusing and change is required, then I would suggest to add "relative" to (or replace "a given" with "relative" in) helpstrings where "given index" occurs. Currently following formulations appear in helpstrings: "first index" (head, head?), "given index" (at, pick, poke), "current index" (skip, length?, clear, find, select) and "index after its last value" (tail). Of these only "given" seems to refer to relative index, i.e. index as calculated from the current (absolute) index. 08:55Ah, and index? uses "current index" too: > Returns the current index of series relative to the head, or of word in a context. ... although "relative to the head" seems to be redundant. GiuseppeChillemi 10:59"Absolute index" ldci 11:08I think the confusion is related to the term of index used by head and at. For at we could use position instead of index? hiiamboris 11:58or returns series before i-th item relative to current index GiuseppeChillemi 14:26"Current index" is a concept of low-level Red coders, "Current Position" is more human. As stated by Gregg, we should write an accompanying doc which explains the GEOMETRY of series and talk about position; index (absolute 1 and relative 1), offset. hiiamboris 14:29> "Current index" is a concept of low-level Red coders, "Current Position" is more human But this is nonsense. We even have index? function, and it's in the name. GiuseppeChillemi 14:33Makes sense if you think that people talk about "series at current position", not "the current index", talk about the "positions in the series", not the indexes of the series. 14:34Series is the entity, the index isn't. 15:01Here as some ideas about an introductive documentation using this terminology: " 'the position value' is called the index of the series. " ... "in Red we have an absolute index which counts from the head of the series (position 1) and a relative one, which starts counting from the current position"... "When series is at position 22 it means at absolute position 22 and relative position 1"..."Red series have no 0 to traverse, moving backward you pass from 1 to -1"... "Some functions need to receive the value of the relative index to operate, likeAT and PICK while others receive the series at a position as COPY/PART"... "Absolute index is returned by index? and used in..." ..."offset is the distance between two index value".."paths use relative indexing too". hiiamboris 15:08-1 to this. How one is going to find this documentation? And who's reading docs anyway? 15:09This only complicates things and replaces the fun "play" aspect with the boring "decipher text" aspect of learning. GiuseppeChillemi 15:46They are ideas for a wiki page. Later or tomorrow I will make a table just for help strings. 16:19 > This only complicates things and replaces the fun "play" aspect with the boring "decipher text" aspect of learning. A personal note, this "funny way" has given me years of confusion. From Rebol: help index? "Returns the index number of the current position in the serie" 16:22help at Returns the series at the specified index. hiiamboris 16:25> years of confusion Are you now saying you were staring at at description for years and somehow misused it during all this time? GiuseppeChillemi 16:36I am saying that if you are unfortunate enough to learn some things from the wrong entry point, where signs are unclear, you can land in the reign of confusion. My experience on Rebol has been intermittent just because some concepts have blocked me, then I have stopped coding and restarted months later. Fog has now disappeared but I don't want other developers to drop Red at the same stopping point I have faced. cloutiy 16:57Could someone give an example of how to use load/trap? Im trying load/trap "hello, world; nice no meet you" but not doing what ? says it should. hiiamboris 17:12It was broken with fast-lexer merge. You should use [transcode/trace](https://w.red-lang.org/en/lexer/#transcode-trace) instead. 17:15What are you trying to do anyway? cloutiy 17:29Just experimenting. Trying diffferent things. Im doing a book application. Just loading everything would be great. But some chars are not allowed as red values. I could always search and replace all commas etc with something else before loading...just experimenting with other approaches. hiiamboris 17:41there's also this hack >> collect [parse to #{} "hello, world; nice no meet you" [any [thru copy w word! (keep transcode w)]]] == [world nice no meet you] 17:46 >> collect [parse to #{} "hello, world; nice no#$)$%%)#meet you" [any [p: copy w default! [if (all [attempt [keep transcode w] not empty? w]) | :p skip] | skip]]] == [hello world nice no #$ %% #meet you] cloutiy 17:52😳 hiiamboris 17:53hocus pocus ;) cloutiy 17:55Haha. Looking at this from my phone. Will get a better look when i get back home. Thanks👍 greggirwin 19:17@cloutiy here's an experiment I did for [load-trap](https://gist.github.com/greggirwin/91dc025b1c25b9efc24996af0207bde2 19:20I think we're overcomplicating the index discussion. Yes, some people may be confused, but for that we write (or find existing) docs. Index? calls out that it behaves differently, and it *must*. If it didn't work relative to the head of the series, it would always return 1. :^) 20:35Note that Carl spent an entire chapter on series in the [Rebol Core Guide](http://www.rebol.com/docs/core23/rebolcore-6.html). He also uses position widely, and the index? doc says "Returns the offset from the head of the series." The words offset and distance are also used. He doesn't choose words lightly, so the fact that he explicitly chose "position" for descriptive purposes, but index for the associated parameter name tells us something. To me it says that we are crossing a boundary between how people think, and the more strict computer aspect. Where he uses the term "relative" it's always given a subject, like "current position" or "head". He never uses the term absolute. None of this mean he's infallible, but my take is that there is no easy answer here. @rgchris wrote [this article](https://medium.com/@rgchris/understanding-rebol-series-d5d6f597a239) which has a nice diagram. It's not the one I was thinking of, but it's on track. What I would change about it is moving index to where pick is, and use position at the top, where index is now. Saturday 6th November, 2021 zentrog:matrix.org 21:17Yeah, the two words 'position' and 'index' are almost synonymous, but I think 'position' is slightly more abstract about where something is located, where 'index' is specifically a numeric representation of a 'position'. For the relative/absolute discussion, I think it's worth pointing out that there are two distinct concepts that are being discussed, which are kind of being lumped together under the same term. The underlying series, and references to that series, which have an implicit relative offset. My feeling is that if you are talking about the underlying series, then it helps to use the absolute/relative terminology, but if you are talking about a reference, then saying "relative to" seems redundant, because it's already implied. The language that will make the most sense depends on which concept you are linking to when you think of "series". Sunday 7th November, 2021 greggirwin 02:30Thanks for weighing in @zentrog:matrix.org. gchiu 05:59Is there a released Red windows version with support for ports? I need to do some CRUD stuff. Thanks. I downloaded 06Nov21 but when I try, I get an invalid scheme error with TCP://localhost greggirwin 06:03Ports come with full I/O, which is in a branch right now but sooooo close to merging. I hope this month. 06:03@rebolek has done quite a bit of work with them already, and has the most experience there. 06:04And it's nice to see you Graham. :^) pekr 06:46Hmm, apart from 1 commit few days ago, IO branch did not see any love for the last 5 months. Of course, maybe some other developments might be hidden from public, don't know .... rebolek 07:57@pekr I found a bug and let @qtxie know so he promptly fixed it, that’s the commit :) 07:59@gchiu Hi! If you want to use IO, currently you need to build the IO branch manually. As @greggirwin wrote, I did some work on ports already here’s an [overview](https://gitlab.com/rebolek/protocols/-/wikis/Red-networking-(layer-6-&-7)). Maybe there’s something you need, just let me know. 08:00sorry, this is the proper link - https://gitlab.com/rebolek/protocols/-/wikis/Red-networking-(layer-6-&-7) , parenthesis in URL are confusing Markdown. GiuseppeChillemi 08:28@rebolek was it the problem that was causing the server to crash after done tone running? 08:28*some time rebolek 11:42@GiuseppeChillemi no, that one is GC-related, not IO, and those are generally very hard to catch. But @qtxie was fixing some GC bugs recently, so it may be gone, I don’t know. hiiamboris 11:58he was fixing GC bug on master branch rebolek 12:14yes, so I just need to merge master to my local IO and can check it GiuseppeChillemi 14:11Lets see, web servers are like deamons and event loops: most their code is code is always running and repeatedly used, so if the functions used have bugs, they will become evident very soon. Monday 8th November, 2021 gltewalt:matrix.org 13:05libRed, odbc through excel GiuseppeChillemi 18:36@gltewalt:matrix.org I have not understood why you have written it but I am interested! 18:57Please pardon me but colors would transform our GitHub and MarkDown and documentation experience. Could you please write something to support the request in [this issue](https://github.com/github/markup/issues/1440)? 19:01Microsoft has noticed it and one project menagers has written in the issue comments. The summary is "we are analyzing it" : https://github.com/github/markup/issues/1440#issuecomment-940003646 gurzgri 19:29@GiuseppeChillemi I have (re)published my red-odbc experiments along with all its bugs, incompatibilities and misconceptions at https://github.com/gurzgri/red-odbc. GiuseppeChillemi 19:34@gurzgri I have seen it, thank you. I do not find any open issues but one. Do you have a list apart? I could help loading on GITHUB greggirwin 20:16Thanks @gurzgri! Nice to see you. :^) 20:29On colors in markdown, @GiuseppeChillemi has anyone proposed an actual syntax for it? Markdown is meant to be very light, readable as plain text, high S/N ratio. This is for both authors and readers. While it's true that authors only write it once, and readers read it many times, this puts more burden on authors in an already muddy and flexible format, and only the end readers benefit (until we have tools to hide all the details). Those who have to read the source now have more noise too. This is the curse of success for simple things. They keep getting extended until they encompass the functionality of the things they were designed to replace, at which point a new young gun shows up in town to start the cycle again. The main problem I see with this is that there is no thought beyond Colors!. Like, what are colors used for? Is there another way to provide more value, with less work? If you really just want to mark certain things with color, use another format. If we can identify semantics for where colors are applied, that's more overall information, and can be used to generate other end results. hiiamboris 20:33> If you really just want to mark certain things with color, use another format I second that ;) Use [AsciiDoc](https://docs.gitlab.com/ee/user/asciidoc.html#colors). GiuseppeChillemi 20:45They are also expressing the need to "keep it as simple as possible", a possibility is using themes. Having GitHub Wiki just in B&W does not help when you need to remark some text or use a color for a certain type of information. Yes, you could use AsciiDoc but that request is to give a way of coloring text on GitHub MD texts. greggirwin 20:46"keep it as simple as possible" is not a proposed syntax. :^) hiiamboris 20:50And one can do colors by inserting HTML into Markdown. And even write it's own anything-into-html converter for more readability. GiuseppeChillemi 21:00No concrete proposal, they are working on some hyphotesis but your +1 could speed up this. greggirwin 21:18Except that my vote would be -1. Should I still vote? GiuseppeChillemi 21:26Nooo, keep away from that issue, please! World needs colors! hiiamboris 21:28:D Tuesday 9th November, 2021 gltewalt:matrix.org 00:33I dont believe that inline html works for github flavored markdown 00:34Tried some a year or so ago and it was a disaster GiuseppeChillemi 06:04@gltewalt:matrix.org I remember having read the same thing. hiiamboris 18:13### [There's now a user guide for CLI library](https://gitlab.com/hiiamboris/red-cli), and [support for multi-command tools](https://gitlab.com/hiiamboris/red-cli/#commands) pekr 18:33Are those about to be part of the official distro? hiiamboris 18:33Unlikely greggirwin 18:53@pekr I absolutely want a CLI module standard in Red. What we need on this design is feedback. I think it's really cool, though it took some time to get used to because it's so different from what I had done in the past, and how I thought of it. If we can get half a dozen people to try it, create examples, make notes in a wiki page, then we can all weigh in more confidently about whether *this one* should be the standard. pekr 18:57I thought guys, that Red Team leads the architecture and development choices and that others develop to the given specs? 18:58Because - we've seen it for so many times in Rebol ecosystem - a dead lock - Carl let contractors / top users to work on some things. But then he was not sure he is about to include it into the Rebol default distro, found it eventually complicated, etc. And ppl refused to use it, because .... it was not part of the local distro .... hence a deadlock situation. greggirwin 19:06There is a lot of push and pull, even internally. If somebody *outside* the team wants something to be considered for inclusion, they should make proposals, or provide solid designs and docs. We don't want people wasting their time, but then no time is really wasted if someone can use it themselves. We do want to control what becomes standard, and will be working on a detailed, official spec next year. Wednesday 10th November, 2021 GalenIvanov 10:18Nice work, @hiiamboris ! GiuseppeChillemi 14:06@hiiamboris As usual, another member which our community should thank and be proud to have. hiiamboris 14:18thanks, guys ☻ JacobGood1 16:10 16:11mistell zentrog:matrix.org 18:02@hiiamboris, it looks really great! gchiu 18:46@rebolek I tried to compile the IO branch and got this 18:46Target: Windows Compiling to native code... *** Compilation Error: expected a non-empty block of code *** in file: %/D/red-IO/red-IO/runtime/platform/windows/tls.reds *** in function: red/tls/store-roots *** at line: 448 *** near: [[] CertFreeCertificateContext ctx rebolek 18:59@gchiu Interesting, reproduced. It happens only with Windows target, Linux target works fine. @qtxie can you look at it? gchiu 19:02Does the IO branch also have a GUI? Or does that need to be loaded on top of it? rebolek 19:10Yes, it has GUI, actually, the Windows console is GUI only I believe. greggirwin 19:20The sub-commands model looks really clean @hiiamboris. And the example is clear and concise. :+1: 19:37Thanks also for the extensive docs. Is there an example of supporting both a main func and sub commands? That is, you either need to process-into a func *or* a context, and there's no magic program-name default, for example, handled in the context. 19:41A small suggestion. Since the first example you point to is sing. Make it even simpler. Don't load is and use reflection on its spec. Just have all the code right there. 19:55I'd also like others to weigh in on POSIX vs Windows CLI syntax. i.e. -o/--option vs /option. I think I brought this up in early chat on it @hiiamboris, but don't remember any resolution. My thought here is *not* to make it more comfortable for Windows users, though consistency on platforms is a good thing for them. It's about slash syntax being more Red-like, and how we want to build systems composed of communicating parts. Not just CLI but dialected messages. Consistency for Red users and systems is the most important thing. This aligns with some approaches to apply, where refinements and their args can be spread through a call. This is a big-picture design issue, and quite important IMO. On the one hand, the more we constrain formats and standards the simpler our code is, and the more robust and secure we can make it. OTOH, messages are just data, dialects provide security, and we can't see how this will be used when we move beyond the confines of old-school CLI constraints. Thursday 11st November, 2021 qtxie 06:32@gchiu It can be compiled in debug mode only. 06:35Pushed a fix. pekr 08:10Well, am I the only one here, who feels lost with the threaded discussions? :-) Oldes 08:29No.. I don't like them too. rebolek 08:35The UI is confusing. Maybe it looks better in Element? zentrog:matrix.org 08:55I think the conversation threads are actually much more confusing in element planetsizecpu 11:11> Well, am I the only one here, who feels lost with the threaded discussions? :-) Me too hiiamboris 11:43Gitter on mobile is a joke. Threads only work on desktop. rebolek 11:47I believe their app is abandonware and you should use Element instead. hiiamboris 12:44Element however has the habit of sticking a non-removable bugged message on the bottom of the chat that will annoy you until you relogin. After which it will annoy you with cross device verifications. It's been like this for years and doesn't look like going to improve. The only changes in their clients so far seem to have been 10000% overall slowdown and loss of features. 12:46We need Red on mobile, that's the only way ☻ JacobGood1 13:14a lot of programmer communities are on discord or slack now, some still persist in irc 13:16I personally like discord, however, I miss the old thread/post model because it is easier to search and find information rebolek 15:29I am against moving to slack/discord for at least two reasons: 1) there is a lot of history on Gitter and even if the Gitter search sucks, they have an API and you can download every single chat message from the beginning and search over it in Red. 2) the UI may not be the best ever, however, Gitter and Matrix are open, unlike Slack and Discord. So it’s possible to write your own client and also you don’t have to worry about terms of usage. I don’t want be a hostage of a random company. JacobGood1 17:43yea, I was not suggesting to move over because, as you wrote, there is too much historic information here now BaronRK 19:14'Gitter on mobile is a joke. ' I'm deeply unimpressed with it here as well, but.... ok. 19:15'you can download every single chat message from the beginning and search over it in Red.' LOL, why is this not a default feature in all messaging systems? Friday 12nd November, 2021 gchiu 04:25@qtxie I downloaded the zip archive again and tried to compile. It compiles but when started prints endlessly to the console cnt: 1 ^/ err: 6 and I have to close it down. pekr 06:34I have just compiled GUI console from the IO branch and can confirm Graham's findings .... qtxie 07:05@gchiu Thanks. I use it on CLI console only. I'll give it a check. 07:10OK. There are some debugging output in the event loop which causes problem in release mode. Saturday 13th November, 2021 gchiu 03:32@qtxie latest build seems to have solved that now pekr 07:40Could we have Red/IO, or Red/Protocols, etc. room in the future? I have looked into an IO section, so will start raising some questions here .. 07:51With R2, I was used to open a port and immeditely wait on it. Once I did so on two sides, I was able to easily insertinto port and read from it via copy. I know, that Carl was a bit versed about async networking, as it was clear, that in some regard, it is going to be more complicated for the user. Now let me post the following code: server: open tcp://:8123 server/awake: func [event] [ if event/type = 'accept [new-client event/port] false ] For me, mentally, open means an immediate action of opening a tcp connnection (in above case). The only thing I would await would be waiton port. How comes, that the awake function comes later in the code? What if some events start flowing, before awake gets defined? Or does openreally don't mean opening a port here, and is mostly a make port!? Second - could we have a schemes / templates, so that we don't necessarily have to define awakemanually? Third - even if I define awake for the very simple server and insert into the connection from the other gui console, wait simply hangs the console. Is there any limitation to the waitin regards to the gui console, compared to the cli console for e.g.? rebolek 08:00> What if some events start flowing, before awake gets defined? Only if you wait on that port before defining awake function. pekr 08:03I am not sure. This is what I get from R2: >> client: open tcp://127.0.0.1:7999 ** Access Error: Cannot connect to 127.0.0.1 ** Near: client: open tcp://127.0.0.1:7999 And as I expected, what I get from Red is - it returns back to the console, like it would connect to the local server, even if there is not any. I am not sure I like that! rebolek 08:04yes, but R2 is not async. open just creates the port, but does not start the connection. So yes, it’s more like make port!. pekr 08:11That's what I was thinking. But - open means to open :-) Or you will have to extensively explain in the docs, why open does not in fact initiates the connection? giesse 19:24@pekr - no, there's a huge difference between make port! and open. If you only make the port, nothing happens (I assume this is the same for Red); if you open it, *it will start the connection* the next time the interpreter goes through the event loop. This is true for R2 async, R3 and Red, and any other language or library that implements async I/O. GiuseppeChillemi 19:34@giesse on R2, which library should I use for Async. Also, is there some good documentation for classic Rebol Syncronous ports? Sunday 14th November, 2021 gchiu 00:59Wasn't async removed from r2? Need an older version. Monday 15th November, 2021 rebolek 11:09Removed? I'm not sure it was ever there, but I may be wrong. gchiu 13:35http://www.rebol.net/docs/async-ports.html rebolek 15:12ah, alpha. I forgot about that, sorry. GiuseppeChillemi 17:50I have seen different version and never understood which is the right to use. giesse 19:24@GiuseppeChillemi async stuff on R2 is mostly black magic. Romano's atcp:// was the most advanced "library", if you really have to go there. gchiu 20:25http://www.rebol.it/giesse/async-protocol.r is no longer registered domain 20:25or just unreachable ne1uno 20:28@gchiu, found this meantime. https://pastebin.com/9UG1K1Nr dsunanda 20:32@gchiu There are some versions available on archive.org: https://web.archive.org/web/20050801000000*/http://www.rebol.it/giesse/async-protocol.r ne1uno 20:32or maybe you already have an earlier copy. https://github.com/gchiu/Rebol2/blob/master/Protocols/async-protocol.r GiuseppeChillemi 21:37@gchiu That's bad, @giesse Gabriele's page contains a lot of useful things like PDF-Maker2 and many more projects. 21:41@giesse I see you and Roman's are authors of this: https://github.com/gchiu/Rebol2/blob/master/Protocols/async-protocol.r . As you talk about "Romano's one" is there another version or is this the one to use? Tuesday 16th November, 2021 gchiu 00:08> @gchiu, found this meantime. https://pastebin.com/9UG1K1Nr Good spotting. On my own github archive! ne1uno 00:09>>bing 00:09good seo gchiu 00:10My memory should better! 00:10But I think that's the latest version which is why I have it there. dsunanda 10:09False positives by antivirus software has been a long time pain for Red and other small developers. I've spent the last two weeks playing email tennis with the Malawarebytes support team: -- I reported that they falsely identify downloads from https://www.red-lang.org/p/download.html as infected REPEAT [ -- They asked me to do the stuff here: https://support.malwarebytes.com/hc/en-us/articles/360039025553 -- I tell them that's too intrusive for me, and ask them what problems they see with the downloads from Red ] Today, they broke the loop and said "Yes I checked https://www.red-lang.org/p/download.html from my machine and there was not any Malwarebytes block." But I still have a dozen versions of Red that they want to quarantine. Can anyone else here using the latest Malawarebytes confirm that Red is finally accepted by them? greggirwin 16:20I don't, but thanks for working with them @dsunanda! giesse 19:14@gchiu I still have www.rebol.it, but it's not hosted anywhere right now. I moved some of the files that were there (very old stuff) here: http://www.colellachiara.com/soft/async-protocol.r http://www.colellachiara.com/soft/async-http.r 19:19@GiuseppeChillemi www.rebol.it only had really old stuff, that's why I never bothered to put that up again somewhere. Anything past 2005 is in http://www.colellachiara.com/soft/ On async:// - Maarten got some example code from Carl to use in Rugby (I think), I took that and created async://, then Romano contributed a number of changes and fixes. Later Romano wrote atcp:// which is more advanced. I don't know if that's still available somewhere, Google didn't help (but I could be misremembering the file name). 19:23For context: the async stuff in R2 was only a bunch of hacks written to make REBOL/IOS possible. A bunch of us later used it (starting from the examples Carl gave to Maarten IIRC), but it was never really meant to be a public feature. GiuseppeChillemi 21:22@giesse Grazie, Thank you, you have cleared all my confusion. Thursday 18th November, 2021 gchiu 22:17I found atcp-protocol.r on my old hard drive 22:17here it is https://github.com/gchiu/Rebol2/blob/master/Protocols/atcp-protocol.r greggirwin 22:31I haven't read this in detail yet, but it looks like we could learn from the recommendations in general: [Designing UIs for Static Analysis Tools](https://queue.acm.org/detail.cfm?id=3487026) Friday 19th November, 2021 pekr 14:29Giving interpreter event a try, tried to profile short code, but receiving error. Any advice upon the correct aproach? >> profile [repeat i 10 [site: read https://www.red-lang.org print [i ": " length? site]]] 1 : 184824 2 : 184824 *** Script Error: value out of range: 1 *** Where: either *** Stack: profile eval-set-path toomasv 14:45@pekr Add one pair of outer brackets to block. pekr 15:32I am not I undestand. When I remove print statement, I get this: >> profile [repeat i 10 [site: read https://www.red-lang.org]] #1 read | 10 | 0:00:04.19845 #2 repeat | 1 | 0:00:04.19945 15:33When I enclose the code block in another brackets, it does nothing :-) OK, I'll wait for some official examples :-) giesse 19:31@pekr profile takes a block of code samples to compare. each code sample can be a block, a word referring to a function, etc. Please note that profile will automatically run the code multiple times if needed, therefore the repeat in there is unnecessary (only makes you wait longer) eg. using your approach (which I do not recommend): >> profile/show [[repeat i 10 [site: read https://www.red-lang.org print [i ": " length? site]]]] 1 : 184524 2 : 184524 3 : 184524 4 : 184524 5 : 184524 6 : 184524 7 : 184524 8 : 184524 9 : 184524 10 : 184524 Time | Memory | Code 1.0x (0:00:05.615) | 562880 | [repeat i 10 [site: read https://www.red-lang.org print [i ": " length? site]]] (that's my version of profile, but it's compatible with Gregg's) pekr 19:35ok, thanks. I have to be using wrong version - just compiled interp-events branch.E.g. there is no /show refinement. giesse 19:35Generally you want to use it like this: >> profile/show [[1 + 1] [add 1 1] [(1 + 1)]] Time | Memory | Code 1.0x (117ns) | 328 | [1 + 1] 1.49x (175ns) | 172 | [(1 + 1)] 1.84x (216ns) | 404 | [add 1 1] BTW my version is here: https://gist.github.com/giesse/1232d7f71a15a3a8417ec6f091398811 pekr 19:35OK, I get the idea, thanks .... giesse 19:35@pekr what I have is pretty old. No idea what has been included. hiiamboris 19:37@giesse you're confusing it with interp-events branch (R/S profiling) giesse 19:39shouldn't the interface be the same though? *shrugs* hiiamboris 19:45That profile is of very limited use: only good if you have a few synthetic pure function alternatives. 19:45What we need it is non-invasive profiling of existing Red code. 19:46Like [this](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/profiling.red) but without slowing down the code, so it can cover much more of it. 19:47Ideally, if it can dive into scopes. greggirwin 19:52Instrumented interpreter docs and examples should come *very* soon. We haven't talked about the profile gists and their place in this new system. The new profile func collects internal data. The old gists may be better named measure or something more related to aggregate aspects. 19:56The new instrumented interpreter is meant to be a foundation on which to build other tools. GiuseppeChillemi 21:17@gchiu Great Work! 21:18@greggirwin What is an instrumented interpreter? greggirwin 21:21The new feature Nenad is working on, where the interpreter offers up events you can hook for building profilers, tracers, and debuggers. GiuseppeChillemi 21:22Thank you Oldes 21:38@greggirwin to be honest, I would not set feature like this as a priority (when I see how long Nenad is working on it already). Especially when Red is getting stuck on version 0.6.4 for years. But you probably know your goals better than me. greggirwin 21:39Thanks for the feedback @Oldes. pekr 22:24I am for finishing anything, that's just close to be finished, before we jump on some other stuff :-) And if I am watching correctly, it might be new Interpreter, followed by the merge of IO .... Saturday 20th November, 2021 Oldes 06:56I don't understand, why you don't work with the version number. It should be changed whenever there is a breaking change (like recent de/compress) at least. pekr 08:25Is the new profiler / debugger going to be part of a separate release, or become natural part of the (GUI)console? I hope for the latter :-) GaryMiller 12:14Looks like https://progress.red-lang.org/ got fixed for a few days around Nov 5th but then broke again after Nov 8th. Any chance of getting it fixed again? GiuseppeChillemi 12:14FYI: I have cancelled the 3000USD @viayuve bounty for the Telerik UI like DATAGRID functionality request he has added to my DATAGRID bounty. He seems not anymore in the Red world and I suppose he has lost interest. It remains just mine https://github.com/red/red/wiki/Bountieshttps://github.com/red/red/wiki/Bounties greggirwin 17:02@Oldes a new release process is very high on our priority list. @pekr some examples will be included in the release with interpreter events, and *may* become standard. @GaryMiller thanks for the status update. @x8x maintains that. Thanks for letting us know about that @GiuseppeChillemi. Monday 22nd November, 2021 rebolek 16:06I have a hexadecimal number in a string and I want to convert it to a character. Is there any easier way? >> to char! to integer! to issue! "32E1" == #"㋡" toomasv 16:22Yes: >> first "^(32E1)" == #"㋡" rebolek 16:23@toomasv no, my source doesn’t look like that. 16:23It’s exactly "32E1" toomasv 16:23Um.. rebolek 16:24It’s actually #x32E1 but anyway meijeru 18:38I tried to see if Red would allow a "functional programming" style. It provides functions as first class values, higher order functions, anonymous functions, but when trying to express "partially applied functions", like (add 1) I got stuck. A naive use of the macro preprocessor, like #macro papp: func [f a][func [x][f a x]] does not work, although I don't see why. This should convert papp add 1 into func [x][add 1 x], right? Who has a better idea? greggirwin 18:43@rebolek no easier ways, just other ways, like load rejoin which is a lot more overhead. 18:44@meijeru it's just a little tricky, but does not require macros. p-app: func [f a][func [x] reduce [:f :a 'x]] fn: p-app :add 1 ? fn fn 2 @hiiamboris may have other suggestions. gurzgri 18:55@meijeru There already were some advanced investigations re: currying functions way back in the old REBOL days, see for example https://www.mail-archive.com/search?l=list@rebol.com&q=subject:%22%5C%5BREBOL%5C%5D+Curried+functions+Re%5C%3A%5C%283%5C%29%22&o=newest&f=1 meijeru 18:57Thanks guys! hiiamboris 19:15> may have other suggestions. I had debase but it's not better 19:17or add h, transcode into integer and convert to char 19:24for partial application I don't have suggestions, didn't play with it in Red ;) 19:25played with tail-call optimization only a bit 19:26problem is, interpreter won't allow to apply that parially applied function right away 19:30so you need your own DSL that after getting a function from do/next tries do/next again, with that function ;) 19:39 p-app: func ['f a][func [x] reduce [get f :a 'x]] fp: function [c [block!] /local x] [ until [ set/any 'x do/next c 'c ;) eval next expr if p [remove p c: back c p: none] ;) remove previously inserted func if any-function? :x [insert p: c :x] ;) insert func tail? c ] :x ] >> p-app add 1 2 == 2 >> fp [p-app add 1 2] == 3 Tuesday 23th November, 2021 hiiamboris 06:25in the new instrumented interpreter it should be possible to let this dialect dive into blocks (control flow) and parens, and automatically find expressions that lack arguments (e.g. (add 1)) and convert them into partially applied functions (without explicit p-app) so some kind of FP emulator should be possible pekr 06:41watching interp-events and IO branches and can see some activities there. Wonder how far away are we from merge to Master? :-) GiuseppeChillemi 07:05 now that interpreter core is open, it would nice if closures are implemented rebolek 07:55it was open all the time GiuseppeChillemi 21:35I meant "Doc i focused on modifying the core" rather than other parts like I/O, but I may be wrong. Wednesday 24th November, 2021 GereyYves_twitter 07:18[please excuse the long message, meant for the forum --which is apparently down] Bonjour, Noob here! I'd like to port a lightweight language to a Z80-based computer older than you (the Amstrad CPC 6128), and to CP/M as well if there is interest. More context [here](https://www.pouet.net/topic.php?which=12155&page=1#c571455). Red is one the the most interesting in my book, I'm just afraid it might be a bit too big. My first questions are: - Is there already related work ?(my google-fu wasn't strong enough) - Is anyone interested to work on that with me? (I'm an outgoing introvert, according to my dog). Following Erdòs, I believe that programming is the perfect social activity for asocials (ok, just kidding, I don't mean to reinforce stereotypes). rebolek 07:23Hi @GereyYves_twitter you may be interested in https://language.metaproject.frl/ that runs on 8bit Atari GereyYves_twitter 07:35Yeah! Thanks for the pointer. As I understand it, it is only cross compiled. My main goal is to have the whole langage tool-chain on the native machine. 07:36Still I think there are ideas to still from the language itself. pekr 07:53AFAIK Red nor Red/System can't get down to 8 or 16 bit machines .... yet. There's a MicroPython though, which should work in under 128 KB RAM, or so I remember. GereyYves_twitter 07:54Is it possible to deactivate garbage collection for instance? rebolek 07:56yes, recycle/off GereyYves_twitter 08:32Nice, thanks! greggirwin 19:54Red/System is definitely the place to start, as Red is meant for modern machines and is very high level, with lots of overhead compared to Z80 ASM. :^) Thursday 25th November, 2021 dukereg:matrix.org 00:57Hello. Is Red going to target web browsers for client-side web applications, or is it focussed on native applications? hiiamboris 08:07closest thing to web client we have is [red.js](https://gitter.im/red/red.js) project ldci 10:34@GereyYves_twitter : Have a look here: http://sdcc.sourceforge.net GaryMiller 12:29@hiiamboris I'm still praying a lot for red.js Hard for me to judge how far along it is now though. Friday 26th November, 2021 ALANVF 02:58@GaryMiller it's going pretty well so far. I've mainly been focused on stability and maintainability, to avoid the mistakes I made in my original implementation 02:59once I implement more actions like form, mold and compare, I can probably make an online repl for it using replit like I did previously, since it'll actually be useable at that state GaryMiller 03:13That's great news! I'm really looking forward to it! Saturday 27th November, 2021 loziniak 22:09Hello! If anybody wanted, now you can easily serialize Rust data to Redbin: https://github.com/loziniak/redbin greggirwin 22:12:+1: ne1uno 22:13when github comes back 22:17^some services still work ok loziniak 22:18too bad, whole opensource is now dead :-P Monday 29th November, 2021 greggirwin 19:05Dear community, as you know we're working on formatting design and functions. This has led to the need for a basic L10N system. If anyone here can verify ar (Arabic) number formatting, including fully spelled denominations and plurals, let me know. Tuesday 30th November, 2021 GiuseppeChillemi 00:55I admit I highly appreciare the instrumented interpreter path taken. Since I have built a simple debugger that prints the function call stack, I can fix my code a lot faster than before. So, I think the momentary time loss, spent to build the instruments to implement a debugger, will be recovered in very short time. Then everything will be faster of all of us. greggirwin 04:03Good feedback. Thanks @GiuseppeChillemi. PeterWAWood 11:06@greggirwin I guess that when you wrote ar(Arabic) number formatting you were referring to the Hindi numbers commonly used in modern Arabic script rather than the Arabic numbers in common use in the Western World. 11:08That is "٠١٢٣٤٥٦٧٨٩" rather than "0123456789" 11:12This might help - https://industryarabic.com/numbers-in-arabic/ 11:17As far as I know, Arabic Hindi numbers only have a single form unlike Arabic letters which have different forms depending on their position in a word and whether they are combined with a long "vowel" . 11:18I believe @BaronRK is highly knowledgeable is such matters. hiiamboris 11:43there's also some left to right reordering going on by the OS in presence of parens for example 11:44and there's spelling of currencies PeterWAWood 12:34http://symbologic.info/currency.htm BaronRK 14:32Arabic is not my speciality ( I did study Phonecian, but for a diff purpose), and this is one of those topics where things get complex fast. Most of us here speak/understand more than one language, which helps a lot. So we know some things DON'T map from language to language, even counting. In Japanese for example there are shapes that go with the thing you are counting. In Semitic (Hebrew Arabic) you have gender in numbers too. In English you have Here and There, but in Spanish and Japanese (and many languages) you have the concept or Here (with me), there (with you), and way over there (away from the two of us). I mention this because I recall Arabic having the concept of 1, and 2, but 2 is not plural, but rather another single thing of 2 parts. This comes up in numbering things. So, summed up, complex. Not sure how much you can encode early on other than just western (Arabic) and Hindi representation of numbers to start. This all needs an API where you hand it the whole sentence or context and it gives you back the best it can do, is my guess. Also of note (since I was helping someone with Chinese recently) there are places where numbers get confusing since they don't have commas and periods. Solve? They switch to words. In English this might look strange where homophones can be used together with real numbers, like: 1thing2knowIWasBorn19SixT (not a perfect example, but gets the feeling), in Brazil I know they change the name of numbers to words sometimes) Wait, I know an example in English................. When saying numbers over a radio, you say 'Niner' (9) as opposed to Nine to avoid confusion (I suspect with Five, due to the Eye sound coming over). Bottom line, there is too much here to solve in the core system, it needs a massive library in my opinion. dsunanda 17:37@BaronRK There's significant variation in number dialects even in English: https://www.youtube.com/watch?v=YBbBbY4qvv4 BaronRK 18:15Exactly. (I find Americans, specifically, tend to assume things in English are simpler than they really are. Even subtle accents (like contract (doc) vs contract (to make smaller), reveal so much. Again, why I'm a fan of gathering ALL this crap into an API thing you just call and it pops out an answer. Everything needs to be in a black box (API) :) gchiu 19:05Chinese also pronounce one differently from the way it's written. One is normally pronounced as yi but when you have a string of ones together, eg. emergency dial in NZ is 111 it then sounds like yiyiyi or eee. So, instead it's pronounced as yah greggirwin 19:28In this case it's number formatting, and the specific issues @hiiamboris mentioned. Thursday 2nd December, 2021 pekr 15:28I can see some visual glitch in a GUI console on recent Master. When I go to settings and press Close button, I can see, for a fraction of a desond, some output in a console, being quickly cleared up. Can anyone else experience that? Maybe some debug left-over? toomasv 16:26[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/TBrX/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/TBrX/image.png) 16:27[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/I936/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/I936/image.png) 16:27[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/WXYd/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/WXYd/image.png) greggirwin 19:21No detectable artifact here. toomasv 20:48I see it in build from 1st Dec. My earlier one from Oct doesn't have it. greggirwin 21:23My build is 01-Dec as well. 21:46Formatting is coming to Red. @hiiamboris has built a playground app for the core mask-based number formatting that's in progress. I'm going to post it here, and have digitally signed it so it shouldn't trigger any A/V false positives. Let me know if it does. It's relatively self-explanatory, but post questions here. Most importantly, try it. Play around. Let us know what you discover by exploring, and also *especially* if you get unexpected results or what you think might be bugs. Let us know your background as well, to give your comments context. @btiffin is an old COBOL guy, for example, and @Dobeash is a heavy spreadsheet user. If you use another dev lang, that's OK. ;^) Let us know how this stacks up to what that lang offers. Share with others here, and let's see how much chat this can generate in the next few days. 21:46[playground-signed.exe](https://files.gitter.im/5565a1d415522ed4b3e10094/r8VT/playground-signed.exe) 21:46Thanks to @hiiamboris for all his work on this! 21:53You can share this with anyone. They don't have to be a Reducer or on Gitter. Just channel their feedback here, or have them email me with it. Friday 3th December, 2021 gltewalt 04:39*nix binary available? hiiamboris 06:39@gltewalt [of course](https://github.com/hiiamboris/red-formatting/raw/master/playground) greggirwin 18:47On the masked format playground, you do *not* need to be a Red programmer to try it. We need feedback from anyone and everyone here, or people you may know who format numbers in their work, whether it be programming, data science, finance, or something else. Saturday 4th December, 2021 hiiamboris 12:36Can anyone enlighten me? We have this /julian alias of /yearday for date! values, since Rebol it seems. I can't find any connection on the web between Julian-... anything really, and the year day (of a year expressed in Gregorian calendar). gurzgri 16:47@hiiamboris "The Roman calendar began the year on 1 January, and this remained the start of the year after the Julian reform. However, even after local calendars were aligned to the Julian calendar, they started the new year on different dates." [https://en.wikipedia.org/wiki/Julian_calendar] Always thought /julian was just meant to emphasize that counting yearday starts with 01.01. Just as /weekday emphasizes that count starts on mondays. hiiamboris 16:59Hmm. So it's the connection with January 1st... That must be it, thanks! Wednesday 8th December, 2021 pekr 07:44Hi. I did a very simple non-scientific test, as I have noticed Kaj mention overall Red slowness in his reasoning for his own Meta language. The difference between the R2 and Red is quite big - cca 0.5 vs 10 secs. I thought, that I might compile the code, but the result is identical. Am I right thinking, that it gets interpreted anyway in the end, so no place for the speedup, as with such a short code, code to interpret is quite short? start: now/time/precise file: read/binary %gui-console.exe loop 100 [parse file [some skip]] print now/time/precise - start hiiamboris 08:15what's there to compile? parse is already R/S code 08:32I suggest doing the following test in Rebol, so the naivete of "slowness" argument becomes obvious: dt [file: read/binary %gui-console.exe loop 100 [parse file [some [#"1" | skip]]]] pekr 08:33I know, that's what I point out in the end. So - where's the R/S code is generally 4x slower than the C compiled equivalent, where we can consider R2 being latter? hiiamboris 08:38From the above test I would say Red's parse is 10% slower than R2 parse, excluding some special cases. Not 4x. Oldes 17:36Just an idea.... currently there is: >> to-local-file %"/c/a b/" == "c:\a b\" What if the result would be {"c:\a b\"} instead? hiiamboris 17:40Quoting rules vary between all Windows programs. 17:49For example, if a file is named file%path%.txt, passing it simply in double quotes is a disaster recipe. You need an escaping function for a specific program you're passing it to. Thursday 9th December, 2021 Oldes 13:19And what if to-local-file would also resolve environmental variables? hiiamboris 13:22How does it know when to resolve it or when it's a part of the filename? Oldes 14:14It would always resolve? Ok... how do you validate file paths (before passing to call for example)? hiiamboris 14:50call does not expand anything: >> call/console "reddo probe [%path%]" [%"path%"] If your target program just uses the command line as a whole, like reddo does above, then no other action may be needed. If you want to pass something to command processor then it makes sense to quote filenames. Since file names do not contain double quote, it magically works. Percent and other special chars should however be escaped with ^. Libc-based programs AFAIK will also replace every \\ with \, and idk maybe even interpret some escape sequences. But they won't recognize ^ as an escape char, nor will expand the envvars. So, again, it totally depends on the program being called, on Windows. Because Windows passes whole command line to the process as a string, and that program may split it then into arguments. In contrast to Linux, where command line does not exist as a whole, and each process receives a set of arguments directly. So theoretically you do not need to do anything to pass them to a Linux process. But since we unify these details under the call umbrella, call just calls Bash and lets it split the command line into arguments. There you can at least rely on all shells having the same interpretation of it. Oldes 15:36Your example is not exactly what I was thinking about... you don't use to-local-file and I know that call does not expand... But there may be use cases, where you want to have the _file-path_ expanded and quoted. hiiamboris 15:38Sometimes yes. But also you can just add /shell and let it expand it itself. 15:40I'm just saying.. I feel like this will limit us and force to fight against the design. Because use cases are so different, and I'd like to-red-file to-local-file red-file to round trip. Oldes 15:40Hm... don't know... I don't have mental capacity to think about it now. 15:41I just wanted to simplify cases like rejoin [#"^"" to-local-file path-to-binary #"^""] hiiamboris 15:43call "(to-local-file path-to-binary)" is possible with [composite](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md) Sunday 12nd December, 2021 Oldes 11:45Quoting is not the best way to go as then one may hit problems when joining multiple quoted contents. But you are right that escaping on Windows is (as usually) problematic, because what works with CMD does not work in PowerShell:/ But I still think, that to-local-file could do the escaping by default using \ on posix and ^ on Windows with optional /no-escape refinement. 11:46Or any idea how to name a function which would handle also the escaping? hiiamboris 11:49escape-filename? 11:49escape-filename/cmd escape-filename/powershell 11:51/no-escape refinement looks so doomed btw :) Oldes 11:52Btw.. to-red-file already handle escaping: >> to-red-file "a^ b" == %"a b" hiiamboris 11:54 >> "a^ b" == "a b" Oldes 11:54ah.. silly me 11:55Anyway.. I'm not satisfied with these functions as they do just half of its job. 11:56escape-filename to-loca-file my-file is too long for me. 12:02On the other side, changing these functions now would be breaking change, because if someone depends on quoting now, with escaped chars it would not work anymore:/ hiiamboris 12:08I don't even think a general purpose language should provide filename escaping rules for a particular program. Only as a part of some module maybe. Monday 13th December, 2021 Moppy_gitlab 03:09Hi. I'm new. When I try compiling as instructed in getting started: red -c file.red, I get this error 03:09*** Access Error: cannot open: %-c *** Where: read *** Stack: 03:23okay, so it seems I had to use the compiler that's on the download page, which by default compiles the gui console, not the gui console itself. 05:30Yeah, compiling a program with "ask" doesn't work. I tried putting an include statement for the environment folder that's on the github, and it still doesn't work. gltewalt:matrix.org 05:37https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions---input,-ask Moppy_gitlab 05:58*** Compilation Error: include file not found: ../auto-complete.red 06:13I see auto-complete.red in the folder right above CLI, so I'm mystified why red can't find it. 06:24okay, so I THINK auto-complete.red is searched for above the red file that uses ask, not above input.red. It's strange that "note" says #include %environment/console/CLI/input.red then, because auto-complete is in environment/console. It still doesn't work though because "WINDOWS" is not a source file and without it I get a "Loading Error: file access error: %wcwidth.reds" error 06:37So after putting my red file in the same directory as input.red, the error goes away, but I get the error "undefined symbol: red/unicode/cp-to-utf16" 06:38oh, and I had to ignore the note's advice and instead write #include %input.red 06:47After using "red -r my-file.red", and leaving out "MSDOS", it works. hiiamboris 07:10Console undergone some structural changes recently, so instructions are out of date I think. Moppy_gitlab 07:10I did not know red had a terminal console. That's why I bothered to compile things. The getting started page should mention "red --cli" imo. hiiamboris 07:11Compiler's include directive is barely working at all unfortunately, so it's a huge lot of headache. Moppy_gitlab 07:13ask works just fine with the terminal console. That's nice. 10:45for some reason list/1 returns none in a script, but pick doesn't have that issue hiiamboris 10:55We have https://gitter.im/red/help room to help newcomers learn :) And please post small snippets of what you're doing there, otherwise list/1 can mean virtually anything. greggirwin 19:39@rebolek or @qtxie did either of you write the original console building instructions? If so, can you update it so it's correct again. Thanks for the report @Moppy_gitlab. rebolek 19:40@greggirwin I don’t think I had any substantial input in that. greggirwin 23:10[A couple weeks ago](https://gitter.im/red/red?at=61a93eac76e37917551972a0) I posted about format playground, but...anyone, anyone...? zentrog:matrix.org 23:17I looked at it, but I rarely need do any numeric formatting, so didn't think my opinion would be terribly valuable. I would probably only use formats like #.00. Overall it looks pretty handy greggirwin 23:24All input are valuable. Thanks. Tuesday 14th December, 2021 qtxie 03:25> @rebolek or @qtxie did either of you write the original console building instructions? If so, can you update it so it's correct again. It is the same as compiling normal code. 03:29If you want to compile the console from the source: https://github.com/red/red#running-red-from-the-sources-for-contributors 03:30 >> do/args %red.r "-r %environment/console/CLI/console.red" 03:32It's simpler if you use red.exedownloaded from https://www.red-lang.org/p/download.html. Use the CLI console instead of the GUI console. D:\> .\red-13dec21-14c642b2d.exe --cli 03:34To add ask in your own script. For example: test-ask.red Red [] #include %environment/console/CLI/input.red ask "name: " 03:35Compiling it: D:\> .\red-13dec21-14c642b2d.exe -r test-ask.red 03:37No need to download the red source code, just red.exe should work fine. 03:43@Moppy_gitlab Please check the docs on github. It's up to date. https://github.com/red/red#readme. Moppy_gitlab 03:51@qtxie I'm not sure what you're referring to. 03:52I read https://www.red-lang.org/p/getting-started.html Wednesday 15th December, 2021 badre_enam_twitter 19:04Hello new here. How do add a user agent to a read operation of URL. hiiamboris 19:40Hi @badre_enam_twitter and welcome. Try write/info [GET [User-Agent: "Your spoofed agent string"]] badre_enam_twitter 19:50@hiiamboris thank you. I was looking for setting up the user-agent for a read operation. The resource I am trying to download requires a regular browser user-agent. Does the write command perform a GET operation? hiiamboris 19:52Yeah. In this case it should be read as "write HTTP request" of type "GET" and a list of headers (of which I only added User-Agent). badre_enam_twitter 19:53Uhhh I see. How do you get the response in that case? hiiamboris 19:53It should return the same as read would. badre_enam_twitter 19:54That is so cool. completely different way of thinking... 19:54Need to learn a lot. hiiamboris 19:55Well, it's undocumented so it's probably a temporary solution. Proper IO branch is in the works for some time, maybe @rebolek can say how it's solved there. Or @qtxie. rebolek 20:10@hiiamboris there is no HTTP in the IO currently, I have an HTTP client in my castr repo (in a separate branch). AFAIK there was no discussion yet if it’s going to be included or not. I would say it’s almost complete, it misses redirection because of some bugs in the IO branch. Once they’re fixed, I can finish the client very quickly. badre_enam_twitter 20:15Thank you both. I am planning to make an web app for local deployment. Is there a code example for a small web framework? rebolek:matrix.org 20:20In the mentioned repo, there is also a webserver with my web framework (or at least with partial version of it - it was originally written for Rebol3 and I'm slowly rewriting it to Red). 20:22But writing a web framework is easy, you just run Red as CGI and print strings to stdout, that's all basically. badre_enam_twitter 20:24I see. I was thinking of more like server+framework in single executable. Almost like asp.net standalone app. rebolek:matrix.org 20:56Ah, it's basically that. Not a single executable that you can download, but just because I didn't compile it. But it's possible. Once I'm happy about the features I may provide precompiled executables. Saturday 18th December, 2021 gchiu 07:13@rebolek:matrix.org like Cheyenne? rebolek 07:44@gchiu yes loziniak 15:30Hello. What's the state of Red for Android? I have a desktop app ready written Red, and I want to write Android version. Instead of rewriting it in Kotlin, I'd rather burn these manhours on Red development. 15:32We'd need some mentoring though. rebolek 16:54As politicians say, this is a good question and I thank you for it. BaronRK 17:05@loziniak indeed. loziniak 19:31Hmm perhaps it's not so obvious from my statement, but I'd want it more to be an offer, than a question. I'm able to help with Android development full-time. Monday 20th December, 2021 greggirwin 00:50@qtxie can you coordinate with @dockimbel and see if there's anything @loziniak can do to facilitate syncing the Android branch? I know it's not prioritized on our roadmap-in-progress, but having someone who needs it, and can help, is a reason to start that conversaion. qtxie 01:38@greggirwin OK. We'll check it. gejihu 05:05[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/72CE/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/72CE/image.png) 05:05[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/5rv4/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/5rv4/image.png) ldci 10:16[![image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/3RBH/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/3RBH/image.png) 10:17Hello. Complete support of huge ravi infrared movies (> 4 Go) with Red associated to Ffmpeg. GalenIvanov 10:18:+1: pekr 10:24 Perfect :-) ldci 10:27@GalenIvanov @pekr Thanks :) Due to 32-bit Red limitation, a 100% pure Red code was impossible for large movies. This is why I'm using Ffmpeg to split the movie in 16-bit images. planetsizecpu 10:50@ldci Great job! ldci 11:12@planetsizecpu muchas gracias hiiamboris 11:48@x8x can you add red/discussions to the activity pane in gitter? Oldes 13:59Does anybody have any idea, how could ideally be made a package manager for Redbol like languages? hiiamboris 14:09Well, for interpreted code Bolek has a prototype already. Just needs some extension work. 14:12I'm interested in that too, but busy with other stuff atm. gejihu 16:53** How to post data with "write url"?** Code with python as bellow is ok. python : 'import requests payload = {'key1': 'value1', 'key2': 'value2'} r = requests.post("http://httpbin.org/post", params=payload) print(r.text)' But with red,all is error except t1. red: 'Red [needs: 'view] url: http://httpbin.org/get?key2=value2&key1=value1 url1: http://httpbin.org/get? url2: http://httpbin.org/post?key2=value2&key1=value1 url3: http://httpbin.org/post? dat: {'key1': 'value1', 'key2': 'value2'} do [t1: read/info url print t1 t2: write/info url1 [get [] dat] print t2 t3: write/info url1 [get [] {"key1": "value1", "key2": "value2"}] print t3 t4: write/info url1 [get [] [key1: "value1" key2: "'value2'"]] print t4 t5: read/info url2 print t5 t6: write/info url3 [post [] {"key1": "value1", "key2": "value2"}] print t6 ]' hiiamboris 16:58 >> probe write/info http://httpbin.org/post? [post [] {"key1": "value1", "key2": "value2"}] [200 #( Connection: "keep-alive" Date: "Mon, 20 Dec 2021 16:57:59 GMT" Content-Length: "485" Content-Type: "application/json" Server: "gunicorn/19.9.0" Access-Control-Allow-Origin: "*" Access-Control-Allow-Credentials: "true" ) {{^/ "args": {}, ^/ "data": "\"key1\": \"value1\", \"key2\": \"value2\"", ^/ "files": {}, ^/ "form": {}, ^/ "headers": {^/ "Accept": "*/*", ^/ "Content-Length": "34", ^/ "Content-Type": "text/plain; Charset=UTF-8", ^/ "Host": "httpbin.org", ^/ "User-Agent": "Mozilla/4.0 (compatible; Win32; WinHttp.WinHttpRequest.5)", ^/ "X-Amzn-Trace-Id": "Root=1-61c0b617-0df771fa342c2e3101a42fce"^/ }, ^/ "json": null, ^/ "origin": "176.59.74.168", ^/ "url": "http://httpbin.org/post"^/}^/}] 16:58Red 0.6.4 for Windows built 17-Dec-2021/23:20:59+03:00 commit #2b5d37a gejihu 17:15@hiiamboris ok! thinks. 17:38@hiiamboris **something diffent, one in args,one in data** ' >>> import requests >>> payload = {'key1': 'value1', 'key2': 'value2'} >>> r = requests.post("http://httpbin.org/post", params=payload) >>> print(r.text) { "args": { "key1": "value1", "key2": "value2" }, "data": "", "files": {}, "form": {}, "headers": { "Accept": "*/*", "Accept-Encoding": "gzip, deflate", "Cache-Control": "max-age=259200", "Content-Length": "0", "Host": "httpbin.org", "User-Agent": "python-requests/2.25.1", "X-Amzn-Trace-Id": "Root=1-61c0b2a7-432faae853ce517c1aff5063" }, "json": null, "origin": "10.0.0.168, 3.91.157.194", "url": "http://httpbin.org/post?key1=value1&key2=value2" }' loza:matrix.org 17:39@greggirwin @qtxie thanks! greggirwin 23:21@Oldes it's an important item, on my list for a long time. Need to consider the modern world, and avoid the worst mistakes of other systems. Simplicity is also key, providing the fundamentals, including security, while letting others build on top of that. Tuesday 21st December, 2021 rebolek 08:46@Oldes I’ve been working on something, trying to use my experience as a maintainer of the package system in TurrisOS, but it’s not high on my priority list. Oldes 10:54@greggirwin @rebolek is there any shareable output of your thoughts/activities in this field? 10:55@greggirwin can you be more specific, what are the worst mistakes? greggirwin 21:40@Oldes I really liked [this article](https://medium.com/@sdboyer/so-you-want-to-write-a-package-manager-4ae9c17d9527) for many aspects it touched on. I will send you some of my notes privately, as they aren't organized or fit for public consumption. Some of the worst mistakes we should avoid: - Not considering security as job one. See: SolarWinds - Complexity. See: Software - Versioning gone wrong. See: "Thinking SemVer solves all your problems" - SPoF. This applies to both the package system infrastructure, but also packages maintained by a single person or small team. See: Abandonware - Having a commercial entity "own" the main repo, which may contain FOSS packages. See: NPM (the corporation) - Ambiguity about whether a package can be modified or removed. See: LeftPad - The goodwill and efforts of FOSS contributors being unfairly exploited. See: The Internet - Chaos and sprawl. See: "Any package system with no guidelines for how to organize things." - Popularity as the standard metric of quality. See: Pop culture That's the short list anyway. :^) https://libraries.io/ is a very cool resource, as it shows not only how many packages each system has, but what package systems we can look at for ideas. Oldes 21:43Thanks. It's not easy to figure it out all. That is the reason why I asked here. greggirwin 21:48It's a huge topic, with a lot of moving parts, subjective design aspects, and a long-view design goal. hiiamboris 22:46Let's separate here the ultimate package manager for Red 2.0 and our immediate need *just to be able to deploy our own code*. gltewalt:matrix.org 22:59Any sufficiently complicated package manager contains an ad hoc, informally-specified, bug-ridden, slow implementation of CPAN zentrog:matrix.org 23:45Not a part of a package manager, but I've been thinking it would be interesting to treat external packages as untrusted, so they wouldn't be allowed to touch the filesystem, call external executables or libraries, read global application state, etc. unless explicitly granted permission by the application. It would make not only supply chain attacks, but also library vulnerabilities much harder to exploit. For instance the log4j fiasco. Are there other languages that have anything like that? Wednesday 22nd December, 2021 greggirwin 01:27@gltewalt:matrix.org nice spin on Greenspun. :^) 01:28@zentrog:matrix.org R2 had a secure dialect, which we want to do a version of for Red, and I'm also keen on capabilities as a model, which was pioneered in E. Any links on the log4j issue? I don't remember that one. pekr 02:30Once again we are talking a new stuff (package managers) noone imo needs right now, without having bare bones stuff like IO, concurrency model, modules, etc. sorted out and finished in specs ... well, at least as far as Red publicly known resources go ... I have recently found an R3/Ren-C thought about the async stuff as done in R3, the limitation of the aproach taken and reasoning for why the green threads might be the way to go as an interesting example, especially as I remember Andreas Bolka (top Rebol community member back at the time) stating, that R3 networking code is a total trash, suited well for a complete replacement. So I am just wondering, what model Red follows? https://forum.rebol.info/t/semantics-of-read-and-tcp-streams-past-and-future/1733/3 zentrog:matrix.org 02:30@greggirwin: It's shocking how little press there is about it. It might be the worst security vulnerability to date. Trivial remote code execution by inducing a Java-based app to log a crafted message when using the most popular Java logging library. Here's a quick article: https://security.googleblog.com/2021/12/understanding-impact-of-apache-log4j.html 02:32I heard about it on here: https://www.grc.com/securitynow.htm greggirwin 02:49Thanks @zentrog:matrix.org. Will read tomorrow. 02:50@pekr a package manager is not on our roadmap, but a lot of things simmer for a long while, and are good to keep in mind as we plan the big picture. Oldes 08:10@pekr it was me who started the pm debate.. because I really thought, “Y’know what? I don’t have enough misery and suffering in my life. I know what to do — I’ll write a language package manager!” hiiamboris 11:48@Oldes if you still long for more misery in your life :) I think what would be useful at current stage is: 1. Ability to fetch packages from the web, so end user would not have to figure out what to download and where to place it. Bolek's redquire has this but in my understanding his attempt was an adhoc helper for himself only, not meant for public use. It doesn't include for example any code that would handle failed download attempts (which happen quite often to me). 2. Ability to cache downloaded packages so subsequent runs are fast. This is quite an issue though. What if we want to ensure our package is up to date? Browsing commits of every package on every program startup will be a huge slowdown. We could probably create a central index of all packages and their versions and check that first, but still, on a mobile such connection attempt can take seconds to minutes occasionally. So I don't see how that can work in a single threaded environment. Best we can do IMO is to only check for updates *on demand*, and work with the cached version otherwise. 3. Ability to fetch packages from any local root. As a package developer I would like to work with the local version I'm developing first, and only when it's not available (e.g. I'm on another PC), then it should be downloaded. This is different from (2), because in (2) we hide our cache somewhere in the OS temp folders, but in (3) our files are somewhere they're easy for us to access. And usage of these two or more roots should be coordinated. 4. Packages should not be single files, but should have a nested structure. So one file in the package could import another file in the same or another package, and that file should also be able to import it's own requirements. I think path!s are a good fit for such *virtual* package tree. E.g. import locale would import all available locale files, while import locale/enGB would import only one. This is often a package user's choice, not author's. 5. No #include directives should be used in any package. These are so buggy in Red that [I rewrote them for the interpreter from scratch](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/include-once.red). To rewrite them for compiler will still take more time. 6. Single inclusion only. One of the biggest issues of #include is the same file included 50+ times over and over, which happens surprisingly often even in what would seem like very conservative inclusion strategy, leading to 30+ secs load time of the program. 7. Compileability of everything. We don't want our code to always be fetched from the web, obviously. Often we just want a single binary free of dependencies. So, run-time resolution of dependencies is already a bit too late. Importing function should be a macro, so the code is preprocessed before it's fed to the compiler. That means it should work in both Red and R2. To have less #include and do-related issues, such macro IMO should just inline all imported code into the script being loaded. In this context, we should be able to import code routines and compile it. Rest of the code should I think be wrapped into a do [] block, because relying on compiler's good behavior today will only bring a lot of frustration. Maybe each source file should declare if it's 100% compiler-friendly (e.g. consists of routines only), or if it's not. 8. How to deal with cyclical dependencies? E.g. my #assert directive executes expect func when assertion has been tested and failed. That function shows the evaluation trace of asserted expression so I can see where exactly it failed. But expect itself should include assertions that would verify it isn't regressed. That's just an example. We can just put good faith into our ability to structure our packages and bear the burden. Or we could separate loading stage from initialization stage at the file level, and make loading basically orderless, but initialization of each file may specify it's dependencies. 11:48- 9. I think it's too early to think of execution security, not having a secure dialect. Today we could sign the packages with a key that we only give to a few individuals we trust, and then check the signatures validity after download. But is it worth the trouble? I find it unlikely for example that someone would hack into my Gitlab account and insert some malignant code. Besides, we distribute our code in compiled form usually, so it's only vulnerable before it's compiled. I would not bother with security myself at this stage of development. - 10. Namespaces. Red doesn't have these, unfortunately, so we'll have to cleverly work around with make somehow. Point is that multiple files may contribute to the same namespace. E.g. one file may provide formatting/format-number and another file - formatting/format-date, and yet another file would use both. I have plenty of examples like this. And another consideration is that use may want to include the package into another namespace. E.g. to avoid collision with system/words or with other package. - 11. Ability to import *just data*. It may be a headerless Red script, or it may be some CSV or JSON that we want to compile in. It's all something doable today and useful today. Not one of the big conquer the world plans :) Oldes 11:56Hm... maybe I should just take a rest and play some long lasting RPG :-/ But Thanks for the list. I hope @greggirwin will add it into his already long notes. Thursday 23th December, 2021 btiffin 03:48@Oldes @greggirwin @hiiamboris I'd aim for RedSites, modeled on the legacy ViewTop, the load-thru local cache and add a command line. Perhaps add a versioning layer to self manage site dependencies. That'd be a pretty cool Package Manager, I think. hiiamboris 12:57Personally I never ever used Viewtop :) I only remember semi-automatically opening the options and turning it off once in a while when it pops up. What in your opinion makes it useful? @btiffin greggirwin 19:01Perhaps the idea that apps run from it could use the cache as a shared resource. Like a pre-configured environment. 19:20@zentrog:matrix.org that's a great read. Huge impact. Wow. > An attacker who can control log messages or log message parameters can execute arbitrary code loaded from LDAP servers when message lookup substitution is enabled. This certainly applies to us, as we look to add interpolation via composite or other mechanism. Also for template-based formatting. GiuseppeChillemi 23:34@ldci I don't remember having asked this: I would like to know when pasta is over a rolling carpet in a production line and when it isn't anymore. Is there a way to monitor this using RedCV? 23:35It would be good to monitor either the yellow density levels and also when it surpassed certain treshold, all with a IP camera. Friday 24th December, 2021 ldci 00:52@GiuseppeChillemi: That could be possible since redCV includes color thresholding (see /samples/image_thresholding/colorObject.red). For the IP camera, it depends on Red. Default camera on your computer and usb cameras are supported and I never tested IP camera. You can also used OpenCV. 01:03@GiuseppeChillemi : have a look here https://stackoverflow.com/questions/49978705/access-ip-camera-in-python-opencv GiuseppeChillemi 07:44Thank you, I will take a look at it. Also, which are the cheapest IP thermal cameras you could suggest for RedCV? I would like to try it on a production line. ldci 08:42@GiuseppeChillemi : https://www.dahuasecurity.com/products/All-Products/Network-Cameras Wednesday 29th December, 2021 planetsizecpu 07:35Do you like taco? 07:35[![Taco.png](https://files.gitter.im/5565a1d415522ed4b3e10094/btVs/thumb/Taco.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/btVs/Taco.png) 07:35well done François! ldci 07:38@planetsizecpu : Yes of course, and especially in Mallorca :) planetsizecpu 07:42Or in Paris @ldci but I thing both have another more appetizing meal, say steak parisienne or paella 😄 07:43Now look at the next nightmare I'm working this days: 07:43[![cavern.png](https://files.gitter.im/5565a1d415522ed4b3e10094/lBMq/thumb/cavern.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/lBMq/cavern.png) 07:44It is giving me some hours of work but... ldci 07:44Great :) planetsizecpu 08:08Ah I missed the gui-branch forum, my apologizes... ldci 08:24BTW: pictogram is slightly different for macOS and windows. greggirwin 20:54That level looks *really* hard @planetsizecpu. =8^@ gchiu 22:53@giesse What's the lastest version of the fsm.r ? Was it fsm2.r ? Can't seem to find the powerpack ... ne1uno 23:05https://giesse.github.io/rebol-power-mezz/ Thursday 30th December, 2021 gchiu 00:44Thanks, there's no date on that version but it is copyright Qtask 2009. But I wrote a pop3 protocol in 2017 using fsm2.r and wonder if the github version is the latest or not? ne1uno 00:46https://github.com/rgchris/Power-Mezz/ might be a newer version here? giesse 18:37@gchiu the one on my GitHub is *my* latest one. I don't recall a fsm2.r so I don't think that's mine. gchiu 18:40Ok. Strange. I wrote i got it from rebol.it giesse 18:41Maybe you renamed it? rebol.it stuff is even older (2004/2005 or so) gchiu 18:45You probably remember me say that i rewrote the r3 pop3 protocol using the fsm and it was a lot shorter. giesse 18:49on my machine here I have: - a fsm.r from Gregg, from 2002. - several versions of my fsm.r, from 2006, with a Version header from 1.4 to 1.7 - the one in Power Mezz, with a Version header of 2.1 gchiu 18:51https://github.com/gchiu/Rebol3/blob/master/protocols/prot-spop3.reb#L20 18:51I probably imagined it giesse 18:52http://www.rebol.it/power-mezz/dialects/fsm.html is exactly the same as https://giesse.github.io/rebol-power-mezz/dialects/fsm.html 18:55latest change to fsm.r was in 2009 https://github.com/giesse/rebol-power-mezz/commit/bb1ab2bf052b1dafdaf67f828e0297ac2e821b0a#diff-908553f21b3b935d7eb8035b0703749d0bab8e6c7c6741c6b08ef3518acceda8 rgchris 21:49> Thanks, there's no date on that version but it is copyright Qtask 2009. But I wrote a pop3 protocol in 2017 using fsm2.r and wonder if the github version is the latest or not? There's a mention of [fsm2.r](http://rebol.info/altme/211/r3-protocols/0351#msg0351) in this thread which it would seem is the same version gchiu 22:34I probably had an earlier version and when I downloaded the later version I renamed it according to the style in vogue at the time eg. makedoc2, pdf-maker2 etc :) Friday 31st December, 2021 greggirwin 20:24https://www.red-lang.org/2021/12/2021-winding-down.html cloutiy 20:47Great writeup @greggirwin . Also wanted to note about so much tools becoming saas. While great for the creators of these tools, monthly cost for the user grows depending on how many of these tools they want to use. I see red as playing a role to reduce the dependency on so many saas by provinding simple way to build tools ourselve with moderate programming experience. Even a rookie can build something useful with minimal effort and be a hero. greggirwin 21:17Yes, I also hope we see new models and options for users. e.g. DiaGrammar has a per-version license (old school), but will likely add SaaS options for collaborative features and such. hiiamboris 21:58@greggirwin :clap: Nice article! 22:00And I appreciate the complexity rant. Crisis is what builds awareness. And awareness is what ends crisis. Rants like this speed up the process :) greggirwin 22:03Thanks @hiiamboris. I tried standing on street corners with a sandwich board, to raise awareness, but everybody who walked by was looking at their phones. hiiamboris 22:10:D greggirwin 23:38Happy New Year! To our team, and our community, thank you for your presence, good nature, contributions, time, and energy. Here's wishing you all a wonderful 2022.``

# Archived messages from: https://app.gitter.im/#/room/#red_parse:gitter.im (https://app.gitter.im/#/room/!dgvJeYaEyPkbAtFkNB:gitter.im)

## 2-Dec-2020

[19:22:52](#Q3EKx9clGKmHt-JWdBccBtV6R6DV22tbWaFvXd7MbJE) <ldci (Fran√ßois Jouen)>:
@Oldes and @hiiamboris : Story is more complicated. I need to generate a json file compatible with labelMe (https://github.com/wkentaro/labelme). Any idea are welcome.


[19:38:55](#G57i2q1ONjX1kbwqOvcPPh_MAi6AmzM9MPcAh9Uc2nA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
What does it mean _json file compatible with labelMe_?

[19:39:34](#1gM8Lo9TLBtgFEp6HsumLuBGXaoi2AiT02gFL9e0kIY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* What does it mean _json file compatible with labelMe_? Any examples?

[19:46:41](#93cR5FPfrXvV1dlMR6n6mUldENGinWKPeZReXsT7UEM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It looks that Red does not use extension with urls... this works:
```
url: https://raw.githubusercontent.com/wkentaro/labelme/master/examples/bbox_detection/data_annotated/2011_000003.json
obj: load/as read url 'json
```

[20:04:25](#B-ZW_12lWDG6aMG1u7mZsi3yXzb4ux_mmmAPe4HUg0I) <rebolek (Boleslav B≈ôezovsk√Ω)>:
With URLs Red should use MIME type

[20:09:35](#HH3oABMbU8nwI9UGwuwER1IrRv7ArKYRvhX7Kcluy2g) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Yes.. above can be just:
```
obj: load/as url 'json
```

## 3-Dec-2020

[10:10:03](#4Pm-0AXkL1OpmmE-xuWX97eUV-3PMegUzFlPUTWR6K4) <GiuseppeChillemi (GiuseppeChillemi)>:
@ldci 
> @Oldes and @hiiamboris : Story is more complicated. I need to generate a json file compatible with labelMe (https://github.com/wkentaro/labelme). Any idea are welcome.

What a nice tool. I have been thinking in those days about a way to annotate visible things and it is nice! Are you doing research on this field?


[10:14:38](#5H2_EdLpI-ZbuzFPRIrHR4tiwBmYA9ho5hTPwgVE-Fo) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@ldci you want to create JSON file that has same structure as labelMe JSON output?

[18:07:43](#GUv6PQKmvTaU5HQ-vB6UUrduAAtZzxcu8InvxA9933g) <toomasv>:
@GalenIvanov How is it going?

[18:59:38](#qEpK3s0VtKNHpT-ZLDPvYm4hEf5wm02pj2f-LdKR-Ns) <greggirwin (Gregg Irwin)>:
Very cool indeed @ldci. @rebolek we'll sponsor some time (though I know you're slammed) to help @ldci with this. I love this feature in https://www.anthropics.com/landscapepro/photo_editing_software/.

[19:20:01](#26seEDL10Kump5tfP3MjxTXcIInX6MS7qWCL7wdsHYc) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I once used an ultimate keying sw, called Fluidmask. It allowed to split zones into smaller pieces. But it was quite complicated to use. Nowadays tools mix various aproaches - edge detection, color gradients and some AI to identify faces or shapes in general.

[19:51:46](#UlwK06kPhCMGJ9xPyNuRyu7TGfB6qJRqCGcqUilcmnc) <ldci (Fran√ßois Jouen)>:
@all. Thanks for your help. I'm currently linking redCV to neural networks for semantic classification (see PixelLib: https://pixellib.readthedocs.io/en/latest/ ) . Works fine. The idea is to improve the network using my own dataset. redCV code is able to export coordinates (polygons) of detected contours in image and the sole problem is to export these data in a JSON file compatible to labelMe. 

[20:06:33](#NrCTrATGrM7kfnhPoJYhA8kSYYOvbUyN9HK1zbB9b4U) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Sounds nice! :-)

[20:21:42](#30TnNdOVVC-Vy2RbMBedYPAsRPtf0_hmCyxD0zEpNQo) <ldci (Fran√ßois Jouen)>:
@pekr Very exciting !

[20:50:53](#OjEDGZla7W3QreF8JX_lkSHyg8fKnUg8gj31-EOSNGU) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@ldci thanks for explanation. I'll have a quick look at the lableMe file structure, if it's JSON it should be easy to match the structure in Red and export it as JSON.

[20:54:46](#aW9PQtCtGkIOM08ZQ1-ndAoqnlqdzYTzUk2GqsMd6Yw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@ldci so I took a quick look, the easiest thing to do is take one of their examples, load it into Red and try to output same data structure from your code.
Like this:
```
>> data: load/as https://raw.githubusercontent.com/wkentaro/labelme/master/examples/semantic_segmentation/data_annotated/2011_000003.json 'json
== #(
    version: "4.0.0"
    flags: #()
    shapes: [#(
        label: "person"
        points: [[250.8142292490119 106.96696468940974] [229.8142292490119 118.96696468940974] [22...
>> probe words-of data
[version flags shapes imagePath imageData imageHeight imageWidth]
```

[20:56:51](#uBqlgnrPUKUCft2EFYZJORtQVNpX6f4MD53Gv5JHUVE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`version` is easy, for `flags` I need to find another example, `shapes` is a block of maps, which I can easily probe:
```
>> data/shapes/1
== #(
    label: "person"
    points: [[250.8142292490119 106.96696468940974] [229.8142292490119 118.96696468940974] [221.8142292490119 134.96696468940974] [223.8142292490119 147.9...
>> probe words-of data/shapes/1
[label points group_id shape_type flags]
```
and so on

## 4-Dec-2020

[7:24:00](#3067D-1KDp1Tq9NnQQ189Ro4KQm2LgdlF9QlOptdQEk) <GalenIvanov (Galen Ivanov)>:
@toomasv I haven't started yet - I'm too busy at work/too lazy  at home :)

[7:50:55](#UjvSt7Xobv_Lim2MlVVZygHqYgqaQjxgVLqgxe_dc-k) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@ldci if you have any questios, just contact me privately so we don't polute this room

[9:49:37](#YQkGJEeum-myrN03Y4lI0iHyxkHRVq2tjHYNhxB0nr4) <ldci (Fran√ßois Jouen)>:
@rebolek OK

## 12-Dec-2020

[17:36:27](#LyFWhR8Xp9m2RI-dJgV8zLTKLbnbZ621kxh1SUHpLCo) <Numeross__twitter (Lop)>:
Hello :)
I have trouble to modify words in a nested block: from `[(x * 3) + y]` to `[(x/result * 3) + y/result]`

[17:38:13](#zRP2vWyFCmcQMlOmrX66ZoHO3dMrJ4VxVOZud_rxHzQ) <hiiamboris (NOT THIS ONE)>:
Hi (;
What exactly is the problem with it?

[18:18:41](#yjEOvu4DHZVtCOv9GGHbTZss2s3Y0khl3aWml8ILU7w) <toomasv>:
@Numeross__twitter Like this?
```
>> resultify [(x * 3) + y / z][x y]
== [(x/result * 3) + y/result / z]
>> resultify [(x * 3) + y / z][y z]
== [(x * 3) + y/result / z/result]
```

[18:21:52](#36DMb2tzD95iobJHz-EaRG87Nwy-evuu4q8bCRW05AY) <toomasv>:
* @Numeross__twitter Like this?
```
>> resultify [(x * 3) + y / z][x y]
== [(x/result * 3) + y/result / z]
>> resultify [(x * 3) + y / z][y z]
== [(x * 3) + y/result / z/result]
>> resultify/by [(x * 3) + y / z][y] 'my-path-to-result
== [(x * 3) + y/my-path-to-result / z]
```

[18:24:02](#2xuPG3KXcOoVrhqcAhopfqeflClmxrWmJMnPni8uTxI) <toomasv>:
* @Numeross__twitter Like this?
```
>> resultify [(x * 3) + y / z][x y]
== [(x/result * 3) + y/result / z]
>> resultify [(x * 3) + y / z][y z]
== [(x * 3) + y/result / z/result]
>> resultify/by [(x * 3) + y / z][y] 'my-path-to-result
== [(x * 3) + y/my-path-to-result / z]
>> resultify/by [(x * 3) + y / z][y] 'my/path/to/result
== [(x * 3) + y/my/path/to/result / z]
```

[18:57:36](#9A47nUCD3eqisnFhkA9Fhw10bBXX-rpq-NEk6UhqSEo) <Numeross__twitter (Lop)>:
That would work, but here's some more context :
```
x:  vector [100. 0.] ; vector makes a graph node, here x/result = [100. 0.]
y:  vector [0. -100.]

point1: vector [[( x * 3 ) + (y * 3)]     ;   * and + are custom, and I'd like to evaluate the result here
```

I made a function that can find what are the parents:
```
get-parents: func [expr[block!]] [unique collect [
    parse expr rule: [ 
        any [
            word: path! (if object! = type? get word/1/1 [keep word/1/1])
            | into rule
            | skip
        ]
    ]
]]
```

This `copy word word! keep (if object! = type? get word/1 [to-path [word/1 'result] ])` will give me none on words that don't refer to objects

And I don't know how  to keep what's not words


[19:02:02](#xu27w4DRDCNBkLQ1xPwsWagp4HkJhm8jAvIr8WqENAc) <Numeross__twitter (Lop)>:
For now I'll just put the /result myself

[19:27:07](#_Fv9ZGHGie3nZCDzh_DmGy3jKQY5lN83G9s0ggQGctQ) <hiiamboris (NOT THIS ONE)>:
Do you need `keep`? Use `change` instead

[19:32:42](#cxhgbqQEdXS-Kni6vbhFJz1lm3-IziS3sYRgMfpr86s) <Numeross__twitter (Lop)>:
oyoooo

[19:34:31](#lsNxlx5TCiiVPKAPVsnfKDMnXmtSuRazsbAxKs68eGA) <Numeross__twitter (Lop)>:
thanks x)

[19:53:14](#xI2Pv-abLoeaM_qo_VlJDGOqrDwzpp885f9g0NBhYNM) <toomasv>:
I played with so:
```
resultify: function [expr vars /by ref][
   ref: any [ref 'result] 
   o: clear [] 
   forall vars [
      append o to-lit-word vars/1 
      if not last? vars [append o '|]
   ] 
   parse expr rule: [any [
     ahead any-block! into rule 
   | ahead o change only set w word! (to-path append to-block w ref) 
   | skip
   ]] 
   expr
]
```

[19:53:24](#M8y3QWMYdHIM7bkttXByQj9BtaMCqWwpm_jYotpMm2U) <toomasv>:
* I played with it so:
```
resultify: function [expr vars /by ref][
   ref: any [ref 'result] 
   o: clear [] 
   forall vars [
      append o to-lit-word vars/1 
      if not last? vars [append o '|]
   ] 
   parse expr rule: [any [
     ahead any-block! into rule 
   | ahead o change only set w word! (to-path append to-block w ref) 
   | skip
   ]] 
   expr
]
```

[20:38:27](#3qFoqXGtiqPr-8KVs_ALMQcYYbreXbYTNhFt3WelH84) <toomasv>:
There should be `if (not empty? o)` before second alternative in `parse` Ì†ΩÌ∏≥ 

[20:39:02](#uz3ASkezh3YHMa-1lGjYJkj8PBZrEVfOHatlzHuUhpw) <toomasv>:
* There should be `if (not empty? o)` in beginning of the second alternative in `parse` :flushed: 

[21:00:18](#J7iFGp0bM-qk-6vrZDxJ7Siiw1cUwubo3rfQy-3BFGg) <Numeross__twitter (Lop)>:
Oh that's neat !

## 13-Dec-2020

[6:30:01](#JXDJrOiLO3Kpy9xnI-94ueDwFd7FQPkXiu9nA41kYlw) <toomasv>:
Simplify `append to-block w ref` into `reduce [w ref]`.

## 18-Dec-2020

[16:00:05](#oPdpwfcN6VXD9f7j9gWYfwVvnIohG5mWwJZxdupo0fA) <mikeyaunish>:
Given:
```
SRC is a string! value: "button1: button {TWO^/LINES} loose"

>> to-block src
== [button1: button 
    "TWO^/LINES" loose
]
>> 
```
load produces a similar result. 
Is there a way to convert the code into 
a block format without losing the curly brackets surrounding `TWO^/LINES` ?

[16:31:21](#2a9UZEtJ_xsNN-bbczrvGC8k3vzgPiaGs_0q7cT-zu4) <hiiamboris (NOT THIS ONE)>:
Code doesn't have curly brackets. Code has a `string!` value, which may be molded in this or that form depending on it's length.

[16:47:29](#Z2-H2iROVb80w3GKxRxNmX6_BXGxWgy1LUN2lo7FcD8) <mikeyaunish>:
@hiiamboris  The issue is I would like to find the actual code that has been typed in, so I need to search/parse for the original unmodified portion of text.

[16:50:41](#SmMAWP_0MUeT_z599IbZy25dnGdEwFrW25xzp1c250U) <hiiamboris (NOT THIS ONE)>:
Find - where?

[16:51:42](#C1ai4dDelABiJRsgNuVNixTB0g2VsxVBhVMQR6CzE04) <hiiamboris (NOT THIS ONE)>:
If it's a text file, why would you load the string first?

[16:51:42](#9Cw_yiSUmSjkfuvWVBgcTfKiAt8LhKw7mHau19M7Dlc) <mikeyaunish>:
From within the original source code - either from a text file or text from a Vid area.

[17:00:36](#mLi_-rJLBvmShP53xo7vIU8vyx2P7CKNxtE5_B60Yhc) <mikeyaunish>:
I am loading the source so that I can correctly identify, modify and write back the portion of code that I am interested in. 

[17:05:17](#_E-MXP8Wadn-vJaLfKqITIxdUjHCcQwOHeKFG1VHgdI) <mikeyaunish>:
This is part of the [direct-code](https://github.com/mikeyaunish/direct-code) project that I am working on.

[17:26:43](#fGb4S2sPK4oiUX8Z68zhBc9FePwK1lJDVCaZUEC7reU) <hiiamboris (NOT THIS ONE)>:
But you're searching for *text* within *text file* right?

[17:27:56](#2MDXPgUNJmz0eMcCfQgETyQFtuPm1NFSAOUcN7UrtLA) <hiiamboris (NOT THIS ONE)>:
If so, I don't understand why you would load code and mold it back. It's not a lossless operation, and quotation marks are only the first and easiest trouble on your way.

[19:45:22](#YbE9HskZcU8gF0F2yNOZYtq6FdB41CHy2Ds5GODDa2w) <mikeyaunish>:
Yes - I am searching for text in the text file.  My goal is to reflect changes to the VID object in the source code. Is there an existing code pattern that will help me with that? I think I can work around the quotation mark issue - what other issues can you see me running into?

[19:55:00](#zySrQRL5AJFkjBF6j6MOl5i0LJrKIlqX1yViaCtnH9Q) <greggirwin (Gregg Irwin)>:
@mikeyaunish once you load it `""` and `{}` are the same. It's only that long strings are molded with curly braces, and they allow you to write multiline strings without the literal chars for CRLF. So if you need to identify strings by curly braces, you'll have to do that without loading.

[19:58:49](#1EmBN_mvKMCQltLm8RaklPrl-rDWyqiDd71BtecJsuA) <greggirwin (Gregg Irwin)>:
As to your goal, VID is like a preprocessor. Once you have a face, it's part of a tree of objects and has no back reference to the VID code that may have generated it. Consider that you could add a face to that tree dynamically, which didn't exist in the original VID. Even if you use words to refer to faces, which is easy enough, then you need to understand VID as a dialect so you can find values that are applied to facets the way it does. 

It's not that this is impossible, just a lot of work and thinking. :^) 

[20:12:35](#OXZAt7iKoEcy3U7GuN-SEYqgPRJ7NFss8SC6P4_r2S4) <mikeyaunish>:
@greggirwin  Thanks for the heads up. I think I will continue with this experiment to see where it leads. At this point it seems to show some promise - but who knows how it will work out.

[20:15:49](#WDIcTs-tMcGhJP6fbkxDidlg9M5j2sUSqf6CYhqcqyc) <hiiamboris (NOT THIS ONE)>:
Well if you're only mapping static strings and pairs, you should be okay. Consider also using lexer's callback to build a table of offsets and strings (or other data), instead of searching for them.

[20:15:58](#k0H2omERGCavhsfiO7bfKc3qSwcFnl_jnmybSfIrwyY) <hiiamboris (NOT THIS ONE)>:
* Well if you're only mapping static strings and pairs, you should be okay. Consider also using [lexer's callback](https://github.com/red/docs/blob/master/en/lexer.adoc#52-transcodetrace) to build a table of offsets and strings (or other data), instead of searching for them.

[20:16:32](#6iuE-erz7tnfDiepa3_We4TJS4Dx-dnbak6rCjCjOZc) <hiiamboris (NOT THIS ONE)>:
* Well if you're only mapping static strings and pairs & tuples, you should be okay. Consider also using [lexer's callback](https://github.com/red/docs/blob/master/en/lexer.adoc#52-transcodetrace) to build a table of offsets and strings (or other data), instead of searching for them.

[20:17:36](#pCjA7b3o1ZZ83bbkrryXy9JTsec5-UOQzqvwfw6tNOc) <hiiamboris (NOT THIS ONE)>:
Otherwise, VID allows generic Red expressions inside it, and there's no chance your code can interpret those.

[20:18:16](#O-7l3oA0UhewEcvguEkoA6qFWp9Apae4qNcR1jlQ1xU) <hiiamboris (NOT THIS ONE)>:
* Otherwise, VID allows arbitrary Red expressions inside it, and there's no chance your code can interpret those.

[20:26:38](#hgHD71joKxgvEt4eMC_sjkoRVzXd8Iv1vABZgmoUL1A) <greggirwin (Gregg Irwin)>:
Another trick which may work, if the user can only change one thing at a time, e.g. no group select to drag a number of faces, is to find all the faces that *haven't* changed, and the one you don't find with matching facets is the one they *did* change.

[20:27:35](#vsfWF7D8QisLy7kgHhYmDN8dMOG9tQAULSy93KU1CgA) <greggirwin (Gregg Irwin)>:
Unless you're @hiiamboris and have a thousand faces in a dynamically generated layout, you should be fine performance wise. ;^)

[20:28:36](#TYkvYAz33AZptpSncz8yMCrSJTl8D4xscBIFbMI9kDg) <greggirwin (Gregg Irwin)>:
Keep us posted @mikeyaunish, as this type of feature is important in IDEs related to GUI design.

[20:29:10](#5b5JETv5cU5fC3eDKQoFB9k1h_D6fkeaqFD2YSwaU9M) <hiiamboris (NOT THIS ONE)>:
A man with a thousand faces Ì†ΩÌ∏É

[20:29:11](#gYrhpPzvtaN7xc28aYXKnAYfmShxFl_AoT7a1WkGVIw) <greggirwin (Gregg Irwin)>:
We're happy to learn from both success and...less success. :^)

## 19-Dec-2020

[0:58:41](#ijQCrxiM816HSnVU3tpGJrprkWFP_zw7mWzpqfk7jUk) <mikeyaunish>:
Thanks for you help @greggirwin  and @hiiamboris  with this. I am hoping to release something workable soon.

## 31-Dec-2020

[2:19:45](#PoYPD-dkXaR9588xwxCbIMGJw-EiYztnTaqWjlRSfj0) <mikeyaunish>:
Can't quite figure out what is happening here
```
>> parse {"" hi} [ some [ [ {""} | "" ]  " " "hi" ]]
== true 
>> parse {"" hi} [ some [ [ "" | {""} ]  " " "hi" ]]  
== false    
```
parse-trace shows that the second parse matches the double quotes but doesn't advance the input. I thought it would advance the input once a match occurs. What is it that I am missing?


[2:26:16](#PmQKyFUBFiZ6TgNOvb-ZD6bkq6zIPBMacPrGFi4yKto) <greggirwin (Gregg Irwin)>:
In the second example `""` rule matches an empty input, so `{""}` that matches two quotes is never used. Then it looks for `" "`, but you're still at the first quote in your input, because matching an empty input doesn't advance.
```
>> parse {""} [some "" {""}]
== true
```

[2:56:11](#ahW9XpIx_ks51_P8iRyoqnUuFuStjbWvk-42dRTLlr4) <mikeyaunish>:
Thanks @greggirwin  - too many strings on the brain.  Didn't recognize double quotes as 'empty input'.

[6:29:35](#ptkNILT02gr49cybdVnnkmheeBm0Wv2vpn0dneT0JzY) <greggirwin (Gregg Irwin)>:
Happens to all of us. Or at least me. :^)

## 11-Jan-2021

[7:46:53](#H4J4Ajm1U8mcM36pjdxRvWsE3fP6ZAe3PjNg9McHsZA) <gltewalt (Greg T)>:
Percy the Parse Ì†ΩÌ∞Å - finding his way `to end` of mazes 

[7:47:07](#Nm4zmFs_2Ed--Gx1-a0tXhHOrYHg3S6bYLpZmi5tnno) <gltewalt (Greg T)>:
Ì†ΩÌ∞≠ 

## 25-Jan-2021

[22:47:41](#h3a1WRD9CVxHIfQRz8XOgHTLpPMsyqHv_0E6YwXBfdA) <gltewalt (Greg T)>:
So getting back acquainted with parse (not that I was especially acquainted before), how to parse out all the words in a string that come before "=>" ?
Using `collect/into`

`"hello => some text..."`

[23:01:57](#0nCq7QEpKZWSRCDxuMGmjbcWd-ZHxEUM9K345yIeH9g) <gltewalt (Greg T)>:
Oh, probably just `[copy my-word to "=>"]` ?

[23:14:05](#Fr_hiR2CqsLXPXrJKTPPOXAo0UdWjyDE1g5-q7RTdfQ) <greggirwin (Gregg Irwin)>:
`to` works well in simple cases, but may skip things you didn't intend if your data isn't regular.

[23:38:25](#2baYbZfUcFGRJ0UZaIFujgpmvJXqngPpJ9Dkbk-Uygw) <gltewalt (Greg T)>:
given `txt: "Hello => some text... World => other text"`

[23:40:16](#soMvCf0Wp2ikDjXxcCasADY3wcmMCDxksONURh9OLaQ) <gltewalt (Greg T)>:
`parse txt [some [collect [keep to "=>"]]]`

Not quite

[23:41:38](#UQseu2PQohm6gY4rBsajkxkChNl_W-Sl6R1D8OdQOrQ) <gltewalt (Greg T)>:
looking for `["Hello" "World"]`

[23:44:04](#DsEDhzQrqRPsMhnoe5DcKRzuTMfnZeLIGwpY7cYerDc) <gltewalt (Greg T)>:
I'm sure I've got things out of order..

## 26-Jan-2021

[0:52:27](#PKDH0ecqQq7GeZ04Fd8nDvJiIs0lZqJIyTa2XjsUb3w) <gltewalt (Greg T)>:
Dag nab it...

[1:06:29](#PB97Zb3Vzz2P1nrbpD9ddumJZEg6wwcqqtmX2V5_XFU) <gltewalt (Greg T)>:
What I really need is `Between whitespace and =>`

[1:07:02](#NDUA5BT1z2dG2O9BlGIOWI2fOLzDq0q1Ue0E8TenFoc) <gltewalt (Greg T)>:
Sortof

[3:12:05](#zvgFwJ7bLKyRnqfX644LlJEsbM9OJ6MwJGI87TNpMNk) <gltewalt (Greg T)>:
```
>> words: copy []
== []
>> parse txt [any [collect into words [keep to "=>" thru lf]]]
== true
```

[3:12:12](#zIyhpJO4YEV7yP2m4a1oTPbLY2LQctryubRShyEOteA) <gltewalt (Greg T)>:
Like so?

[4:40:57](#knYWfLK5JOl-mR421Zpvs8eIOP7u0dIUQl3VjqAG990) <toomasv>:
```
>> parse txt [s: collect some [ahead " =>" Ì†ΩÌ∏ñ keep to " " 2 skip | #" " s: | skip]]
== ["Hello" "World"]
```

[4:41:25](#nTbgMwMSplxwG601t5Em8BH3tebd8bbiC13PVrmydTg) <toomasv>:
* ```
>> parse txt [s: collect any [ahead " =>" :s keep to " " 2 skip | #" " s: | skip]]
== ["Hello" "World"]
```

[4:42:38](#LhCkaWCPhbeC9VXxzpCy17YVnRn7fGm5dwYk5L4RtwQ) <toomasv>:
* ```
>> parse txt [s: collect any [ahead " =>" :s keep to #" " " =>" | #" " s: | skip]]
== ["Hello" "World"]
```

[4:45:25](#1JY9s4Z0fZmbnLQqNZ4fwoiZ30ZmRCGnqxj0jy4bEIE) <toomasv>:
* ```
>> parse txt [s: collect any [ahead [any #" " "=>"] :s keep to #" " any #" " "=>" | #" " s: | skip]]
== ["Hello" "World"]
```

[4:45:44](#PhDr3hXngeYTtfw1Pxm-ugMry-jkhG5n9M8m4gr2QnI) <toomasv>:
* ```
>> parse txt [s: collect any [ahead [some #" " "=>"] :s keep to #" " some #" " "=>" | #" " s: | skip]]
== ["Hello" "World"]
```

[4:53:07](#7Nv3V6ArPpL24FEMoe46VwL9kMjQW9FeBGhhA7EpyzQ) <gltewalt (Greg T)>:
Thanks but I cant make sense of that yet

[5:09:32](#636Embv7B-JzXqsX3SzPFF9Sbo1ulvD_RjE78mD9Kfo) <gltewalt (Greg T)>:
If you were collecting the word values from `help-string action!` it would be the same?

[5:12:42](#m-F2jWBohrPsSovgDuC_LwQl-DOGJkYi-LNAXUmUGkE) <greggirwin (Gregg Irwin)>:
```
parse txt [
	s: collect any [
		; look ahead, but don't move, to see if the next thing in 
		; the input is " =>". If so, set the input to the position
		; s from the next rule. Then collect text until you get
		; to the next space. Finally eat the " =>" marker.
		ahead [some #" " "=>"] Ì†ΩÌ∏ñ keep to #" " some #" " "=>"
		; Mark where you found a space.
		| #" " s:
		; Otherwise it's text and you can move forward.
		| skip
	]
]
```

[5:15:01](#pS3HlQXBfI7S1l6kP6Tsb-BH5qv1tXhxYt4i_T-LsJE) <greggirwin (Gregg Irwin)>:
* ```
parse txt [
	s: collect any [
		; 1) look ahead, but don't move, to see if the next thing in 
		; the input is " =>". If so, 2) set the input to the position
		; s from the next rule. Then 3) collect text until you get
		; to the next space. Finally 4) eat the " =>" marker.
		; 1                                              2   3                         4
		ahead [some #" " "=>"]  :s  keep to #" "   some #" " "=>"
		; Mark where you found a space.
		| #" " s:
		; Otherwise it's text and you can move forward.
		| skip
	]
]
```

[5:15:14](#WhdJD9JNaCR9QEp6iJOpnGTkf41kKqKteJ3PaBBM_u8) <greggirwin (Gregg Irwin)>:
* ```
parse txt [
	s: collect any [
		; 1) look ahead, but don't move, to see if the next thing in 
		; the input is " =>". If so, 2) set the input to the position
		; s from the next rule. Then 3) collect text until you get
		; to the next space. Finally 4) eat the " =>" marker.
		; 1                                  2   3                         4
		ahead [some #" " "=>"]  :s  keep to #" "   some #" " "=>"
		; Mark where you found a space.
		| #" " s:
		; Otherwise it's text and you can move forward.
		| skip
	]
]
```

[5:15:31](#I7jy6Jr-dAEgbJ8B1nO97iLh_gG8fbSnTEm93tmkDtk) <greggirwin (Gregg Irwin)>:
* ```
parse txt [
	s: collect any [
		; 1) look ahead, but don't move, to see if the next thing in 
		; the input is " =>". If so, 2) set the input to the position
		; s from the next rule. Then 3) collect text until you get
		; to the next space. Finally 4) eat the " =>" marker.
		; 1                      2   3             4
		ahead [some #" " "=>"]  :s  keep to #" "   some #" " "=>"
		; Mark where you found a space.
		| #" " s:
		; Otherwise it's text and you can move forward.
		| skip
	]
]
```

[5:15:45](#rdefti4KwJXFNrmthbs-BhQdiSwlqGY7SkP_t5KhqPI) <greggirwin (Gregg Irwin)>:
* ```
parse txt [
	s: collect any [
		; 1) look ahead, but don't move, to see if the next thing in 
		; the input is " =>". If so, 2) set the input to the position
		; s from the next rule. Then 3) collect text until you get
		; to the next space. Finally 4) eat the " =>" marker.
		; 1                      2   3               4
		ahead [some #" " "=>"]  :s  keep to #" "   some #" " "=>"
		; Mark where you found a space.
		| #" " s:
		; Otherwise it's text and you can move forward.
		| skip
	]
]
```

[5:15:59](#DaL6639uMdzbLa7hVrTD8rMTOAusbZn8eEarfsZPWBQ) <greggirwin (Gregg Irwin)>:
* ```
parse txt [
	s: collect any [
		; 1) look ahead, but don't move, to see if the next thing in 
		; the input is " =>". If so, 2) set the input to the position
		; s from the next rule. Then 3) collect text until you get
		; to the next space. Finally 4) eat the " =>" marker.
		; 1                      2   3              4
		ahead [some #" " "=>"]  :s  keep to #" "   some #" " "=>"
		; Mark where you found a space.
		| #" " s:
		; Otherwise it's text and you can move forward.
		| skip
	]
]
```

[5:16:19](#hPfqaMqkWAJZCZNRnarFJaskbjEjPsFLMR0JfA6CBNs) <greggirwin (Gregg Irwin)>:
Oh for a fixed pitch font in Gitter. I think I have those lined up OK now.

[5:18:31](#AVlOemO4YmKbH9RQti6So0IBLct_y3dfKgFGsDPZOjI) <greggirwin (Gregg Irwin)>:
The trick is that `s:` sets the position just past the last known space, and part 2 (`:s`) moves the input *backwards* to that position, so it can copy the last word before the `=>` marker.

[5:21:33](#3VTTnpqb23sMJMpoOERLY6hX8ZluVLR9uObCAnntakY) <toomasv>:
Thanks @greggirwin , I started explaining it too, and then changed the rule a bit, and here it is with explanation:
```
parse txt [s: collect any [some #" " "=>" e: Ì†ΩÌ∏ñ keep to #" " :e | #" " s: | skip]]
```
Explained:
```
[s:                    ; record start of the text for case the word we want is in the very beginning
collect any [          ; it doesn't really matter if it is `any` or `some`
                       ; Principal alternative:
  some #" " "=>"       ;   we hit some spaces and "=>" (let's call it "separator")
  e:                   ;   record position after separator
  Ì†ΩÌ∏ñ                   ;   go back to last recorded position ...
  keep to #" "         ;   ... and keep word between that position and next space
  :e                   ;   now jump to position after separator and continue from there
                       ; Second alternative:
| #" " s:              ;   we meet a space and record position after that, so we remember last position before we hit separator.
                       ;   Notice that this rule *has* to be after the first one, otherwise we'll hit spaces before "=>" first
					   ; Third alternative:
| skip                 ;   just skip everything else
]]
```

[5:22:45](#Vzqh2Z7gpO_GRK3QeJCphqXwDNs2YhqB2ufhsyz4ywo) <greggirwin (Gregg Irwin)>:
Great minds. :^)

[5:25:00](#-V4CfqdNt3Yb7dAV0LQtjk3b3IsM-3qZR_Vp2MgFwXY) <toomasv>:
* Thanks @greggirwin , I started explaining it too, and then changed the rule a bit, and here it is with explanation:
```
parse txt [s: collect any [some #" " "=>" e: :s keep to #" " :e | #" " s: | skip]]
```
Explained:
```
[s:                    ; record start of the text for case the word we want is in the very beginning
collect any [          ; it doesn't really matter if it is `any` or `some`
                       ; Principal alternative:
  some #" " "=>"       ;   we hit some spaces and "=>" (let's call it "separator")
  e:                   ;   record position after separator
  :s                   ;   go back to last recorded position before separator ...
  keep to #" "         ;   ... and keep word between that position and next space
  :e                   ;   now jump to position after separator and continue from there
                       ; Second alternative:
| #" " s:              ;   we meet a space and record position after that, so we remember last position before we hit separator.
                       ;   Notice that this rule *has* to be after the first one, otherwise we'll hit spaces before "=>" first
					   ; Third alternative:
| skip                 ;   just skip everything else
]]
```

[5:25:16](#E5HMI_nYt3IVOeF2ZFpSox-mpksjuZvCAoNm86W1oAE) <toomasv>:
Ì†ΩÌ∏∏ 

[5:48:28](#XDZKYEXNI2hbtsjiu3B2pDwsc5NvUI8sOiFkywW2cVY) <toomasv>:
But it is still too brittle. Suppose you have text where "=>" may have no spaces before it. Here is solution:
```
txt: "Hello  => some text... World=> other text ! =>"
form parse txt [s: collect any [ahead [any #" " "=>" e:] b: keep (copy/part s b) :e | #" " s: | skip]]
;== "Hello World !"
```

[5:54:35](#9_n1rqPDedzXTRkRW1oU3D-x_UubJ2E5coA3XM6Yx3E) <toomasv>:
‚òù [January 26, 2021 7:09 AM](https://gitter.im/red/parse?at=600fa40bdfdbc1437fb1cbfc)
```
>> txt: help-string find
== {USAGE:^/     FIND series value^/^/DESCRIPTION: ^/     Returns the series where a value is found, or ...
>> form parse txt [s: collect any [ahead [any #" " "=>" e:] b: keep (copy/part s b) :e | #" " s: | skip]]
== {/part /only /case /same /any /with /skip /last /reverse /tail /match}
```

[6:03:38](#PlmRD-UZd3BmHZhrI3EqYknu86mYHzOTYuDe6J7L8X8) <gltewalt (Greg T)>:
Thanks ghys.

[6:03:43](#MJqVf5x-T0eqtq6VMmyhGEFsUvRAC6CQf0JdKPREuUw) <gltewalt (Greg T)>:
Guys

[6:03:58](#WxWnmTElI5I_t-J7xl22SpJQLKy9hbsad5qKKOVZDMo) <toomasv>:
To make it even more robust, use `ws` instead of `#" "`.
```
ws: charset " ^-^/"
rule: [s: collect any [ahead [any ws "=>" e:] b: keep (copy/part s b) :e | ws s: | skip]]
print txt: "Hello => some text ...^/World=>other text^-!^/=>end"
;Hello => some text ...
;World=>other text	!
;=>end
form parse txt rule
;== "Hello World !"
```


[6:04:14](#0VUGgZrg8d0OGFMTjS7B0ccOYN86jUO4VbsfULd82KY) <gltewalt (Greg T)>:
Things to play with tomorrow 

[6:06:59](#CNloGJN4aFiMUheuNfRNdJCR5_9Am6BDkZ5BDalKnps) <gltewalt (Greg T)>:
`ws: charset reduce [space tab cr lf]`

[6:07:34](#GkhjUOn80NZIIR-SMedc841QUZDtYeZZkeqePROurkU) <toomasv>:
:)

## 4-Feb-2021

[10:06:36](#2aFXileSVljcrSO96cBWOMRPe5EVcgrqEX4ypiaAK4A) <GiuseppeChillemi (GiuseppeChillemi)>:
Could a code act as a rule? I want to create a function that does a custom check and then returns true or false. Parse would fail or have success accordingly.

[10:10:24](#HCx6cn7r9IR45aV7MZiJ09toSJH1X_AO9YL4bNiPm-s) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Yes, you can do something like `parse data [.... (result: my-custom-check) result]`.

[10:26:36](#UfzmZGB_1YCEir2LYVjne2LUZ05uO4dZpF36ZbmJQHY) <hiiamboris (NOT THIS ONE)>:
`[... if (code)...]` ?

[10:26:56](#z2C-vzKFKwDTm4wonD-8AZe3U67JgY2aSJsMBe0Davk) <rebolek (Boleslav B≈ôezovsk√Ω)>:
right, that's easier

## 5-Feb-2021

[1:31:25](#gTsHk2joXBxxAID1TfNqlET6LBd6F8Ikjdt_VHcbQTQ) <gltewalt (Greg T)>:
Are there examples somewhere for `parse/trace`?

[1:32:34](#4cTeoyPgbSBk_e5oZ4PYUQqfesUSzyQpHRBorQzoY-0) <gltewalt (Greg T)>:
I'm not sure how to use it.  `parse/trace "stuff" [some rule] func, but the func part is the part I'm not sure about.

[1:32:59](#a2kD0Rr0p1Rh4D-dKQxMLu9QTWnv8DDNoUsivRoXH_Q) <gltewalt (Greg T)>:
* I'm not sure how to use it.  `parse/trace "stuff" [some rule] func`, but the func part is the part I'm not sure about.

[5:03:56](#gwXI8jFXWHCz7UfF_Mgj9CyEkpwyZ7JRT8-TTIl7KV4) <zentrog>:
gltewalt (Greg T):  check out `parse-trace`, which has a built in callback method and might be all you need

[9:28:02](#797EXlKpuf4c5JWB80JhATlQxAUZ1d4kzLc1zGJwMzY) <toomasv>:
Yes, look at result of `parse-trace` and compare it to [this function](https://github.com/red/red/blob/master/environment/functions.red#L311) used to create the result.

[13:13:52](#CQSLqBayR2Rya8kTv4z77PCqArhiloig4MUwllAT1dg) <GalenIvanov (Galen Ivanov)>:
@toomasv Maybe this is too easy for you, but it could be a nice exercise for `parse`: [Evaluate left-or-right
](https://codegolf.stackexchange.com/questions/218618/evaluate-left-or-right/218649#218649)

[13:19:26](#oe_rXfr_DWjTgXq5-XkT5qCnhU_vXa5bj-G_3DRsBuo) <GalenIvanov (Galen Ivanov)>:
* @toomasv Maybe this is too easy for you, but it could be a nice exercise for `parse`: [Evaluate left-or-right
](https://codegolf.stackexchange.com/questions/218618/evaluate-left-or-right)

[14:42:51](#Eq8AeIyFahl1k5Ise9mdDsFq6ICsiR2sPDBTMGlbEhU) <toomasv>:
@GalenIvanov Interesting exercise, thanks! And nice solution.

[14:45:18](#rAza5JbPEKilJKU-SCRMWfjvhXdLYt5TDd9OzT7j-k0) <GalenIvanov (Galen Ivanov)>:
@toomasv Thank you, it's iteresting indeed.

[15:23:43](#kCwSUx_5OSxU7_RvUOgKXYlkz5lvUg-APCs7ce6KM80) <toomasv>:
@GalenIvanov Working on your solution I got it 15 chars shorter Ì†ΩÌ∏Ñ
```
func[s][a: charset"<>"until[parse s[any[t: change[a"<"a](t/1)| change[a">"a](t/3)| change["("a")"](t/2)| skip]]2 > length? s]probe s]
```

[15:23:49](#WI_yz-GOQdtMsO4rvwl-xpgXdK-y9H3bRK7ovpcbphc) <toomasv>:
* @GalenIvanov Working on your solution I got it 15 chars shorter :smile:
```
func[s][a: charset"<>"until[parse s[any[t: change[a"<"a](t/1)| change[a">"a](t/3)| change["("a")"](t/2)| skip]]2 > length? s]s]
```

[15:29:13](#1LtI6bYfJiPbTD34gXKX8vuHk5m1TLNs4HnK_g-IKdA) <toomasv>:
But for given patterns the shortest possible is just `<`.

[17:08:17](#mUhbxr1tBr-qmQkyv_nBKimObdKoNVPbMZhNc12FPkU) <GalenIvanov (Galen Ivanov)>:
But for given patterns the shortest possible is just `<`.

[17:15:30](#mnCVyBsGW-YAYteWG_ifbzbc-CX6N4Y_OMV53yd1O48) <GalenIvanov (Galen Ivanov)>:
@toomasv  That's very nice! Btw, the question allows for the input to be entirely enlosed in parens `><>` -> '(><>)`. This way your solution can be even shorter:

[17:15:44](#aw6NUvs2AutzAMN1rSIGmqlDgCMlGBKYK7nRVBU3Jvg) <GalenIvanov (Galen Ivanov)>:
```
func[s][a: charset"<>"until[parse s[any[t: change["("a"<"a")"](t/2)| change["("a">"a")"](t/4)| skip]]2 > length? s]s]
```

[17:35:39](#YNcWbDrLv--TJVHMeye_NK8dkEdZCATCsbQepzR1i3U) <hiiamboris (NOT THIS ONE)>:
`func[s][r:["<"|">"]until[not parse s[to change[opt"("[x: r"<"r | r">"x: r]opt")"](x/1)to end]]]`

[17:35:50](#cxUmIuS-kJJKF5k5DG3YHqxWD0Z-W7PqJ6oEKUWHoP0) <hiiamboris (NOT THIS ONE)>:
as far as obfuscation goes.. 95b

[17:37:45](#ZiUaYCLybZX3trt3lKb6W8mvcr7UWPkQB21Vf8v71R4) <hiiamboris (NOT THIS ONE)>:
* `func[s][r:["<"|">"]until[not parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]]]`

[17:37:50](#v62bSRmjSH9TjS2TIXRX_0G3vpP8j56pD3_3RktlvjE) <hiiamboris (NOT THIS ONE)>:
* as far as obfuscation goes.. 94b

[17:38:01](#hfg7GFHMSp30GB8agiNDDGWKF148x3lzj89rkQGCrRE) <hiiamboris (NOT THIS ONE)>:
who needs spaces anyway

[17:50:17](#_8Piq2QTxP4AQ0OwCs98r8uB46ne9_pCT9lAY5a68lA) <toomasv>:
@hiiamboris Wohoo! Still 22 shorter than @GalenIvanov 's latest! Ì†ΩÌ±è 

[19:05:33](#ySr2j6ef4dSmxgd8eYU0t-JzzPUtoTuXFz_wqIsr9C8) <GalenIvanov (Galen Ivanov)>:
@hiiamboris Wow! That's great!  After seeing yours and @toomasv solutions, they look obvious - too bad I didn't find something similar by myself. Thank you for your lessons!

[19:13:42](#g3FyNSOguVd-519yyRM3s2MRkPRF5qeA53ku67Q39VE) <hiiamboris (NOT THIS ONE)>:
we can probably cut 2 more bytes by using `while`: 
`func[s][r:["<"|">"]while[parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]]][]`
Ì†ΩÌ∏É

[19:16:26](#4bkNKItAIVNlYIJKSU4ez7jphx8tyPbDB1tMnUgtVuY) <GalenIvanov (Galen Ivanov)>:
:+1: 

## 6-Feb-2021

[8:22:52](#beQgcKIXmxANoocCSrVqvNHcmPtXmDQMW1EdEtVYnrU) <GalenIvanov (Galen Ivanov)>:
@hiiamboris Can I use your code in Stack Exchange's Code Golf & Coding Challenges (with credits)?

[9:12:26](#RLZCVbFmtR4hylRJbKPEQGV5NSvYgJSYa6t8XTIzeG0) <toomasv>:
@hiiamboris You probebly meant?
`func[s][r:["<"|">"]while[parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]][]] `


[9:12:33](#MoGg2lyhDhn_hPicwRIejTD9VyRLTIxtp9HSgPhlWUo) <toomasv>:
* @hiiamboris You probably meant?
`func[s][r:["<"|">"]while[parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]][]] `


[9:15:41](#5MhTPo4srw8Y0mGDj3ry8n3-W7F3GSe6sUqmf2a0Erk) <toomasv>:
* @hiiamboris You probably meant: 
`func[s][r:["<"|">"]while[parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]][]] `
(Typo in the end?)


[9:15:44](#t-MKzm9kmqZ69gf770mYlY63mGWt78qpyCFzPQiNahQ) <toomasv>:
* @hiiamboris You probably meant: 
`func[s][r:["<"|">"]while[parse s[to change[opt"("x:[r"<"r | r">"x: r]opt")"](x/1)to end]][]] `
Typo in the end?


[9:16:53](#1Sp6DVKoDh0Vl6ju_XF6sy2Mk73KGAREianbsyA8S8k) <GalenIvanov (Galen Ivanov)>:
 I observed the misplaced `]` too

[9:18:15](#REhxXsTe9CSvcztljklMFiZ3LHdNYJAP6ZHSRhbV4H4) <GalenIvanov (Galen Ivanov)>:
and using the clarigication of the rules, `opt`s are not necessary, just plain "(" / ")"

[9:18:23](#qP1nrRLvdsirDc9-7l4v4piR-tHPg_RSQxxiOo_Jx1U) <GalenIvanov (Galen Ivanov)>:
* and using the clarification of the rules, `opt`s are not necessary, just plain "(" / ")"

[9:22:51](#aCkTuxaK_tLnlJQYmSR5b_ynNBslereoWfzZbzBymBY) <toomasv>:
Indeed!

[9:40:22](#-XuFMcNKEMoIQOh1WE9-ri0tgWqHW9TkHQUIo3rCauQ) <hiiamboris (NOT THIS ONE)>:
Yep!

[9:45:29](#oUoQ289hr1rIR3nRpQ_MrPXGukbNq0QY4FizBeuk_7A) <GalenIvanov (Galen Ivanov)>:
@hiiamboris  Thank you!

[9:56:41](#jlpuh6UMSeX4hJYk1rCGiqS9iXeI_jFryTfGVDxiB38) <hiiamboris (NOT THIS ONE)>:
`func[s][r:["<"|">"]while[parse s[to change[opt"("x: r["<"r |">"x: r]opt")"](x/1)to end]][]]` 91b

[10:00:23](#3rxm-lnsBIs7K6cuizQiHr6XD0JEfraotlZXqYNLeT0) <GalenIvanov (Galen Ivanov)>:
@hiiamboris Great - a new improvement!

[10:02:15](#EWU-l3Zmwz-pUIM6ywXM3JpK5AKUL3xdPKRyD_p-ISw) <toomasv>:
Without `opt`'s 85.

[10:02:27](#IcvmtNiwRAMJv1wMfH5J8yAWyHZweCMpTWZqfJeZKZ0) <toomasv>:
* Without `opt`'s 85 ;)

[10:05:08](#kPSJs_emC8XBZyGMN43OINZkYj7vR2FmU9veEVcoZhU) <GalenIvanov (Galen Ivanov)>:
[86 bytes](https://tio.run/##ZVLLbsMgELz3KxAnOFW9Wqv5iF4RhyjGTarUiXCq5tB/d/eB7Vj1YWXYYR4LtfTze@lTfhm6efgej2nKqXbJk//18PnndL6UdDvUqbgp3a/ueDqMHyX54B@dq4KrTpCyyj76HB6vb5GBZexzTnnK83Ct5XA8uckl9@L48wB5@yMKBIptFQDEtRe4R4hcKEZadwMYRpEb4O4OT9wjpmB80C4XRQrFel4W0lMa09cFn1tRrGEMaoBbDd42@dzGJxpWxC5XQ0J5yULELZPBLeoiDLFDFuzJBQvvXKMpaKpNH2qTGgZPGWDDkzCE/75hltFsUjOPJxTIgDAamPHYpoZNLbR5tnvRYryGJ@yVaR2NRNc/MlrseWm9IqXCMmwsw9YE@2kIk56SG1uyyZ2qstxGTu5Wz@Pdpa/rpee36bvOu8HV8nk9j/K@ZY/fc3Z5/gM ) - I add a `s` to make it work iin TIO

[10:07:13](#PxV4ktxHo0s5qoDP2yU6cXPlZiuK07CTPoBhyFEycqY) <toomasv>:
[86 bytes](https://tio.run/##ZVLLbsMgELz3KxAnOFW9Wqv5iF4RhyjGTarUiXCq5tB/d/eB7Vj1YWXYYR4LtfTze@lTfhm6efgej2nKqXbJk//18PnndL6UdDvUqbgp3a/ueDqMHyX54B@dq4KrTpCyyj76HB6vb5GBZexzTnnK83Ct5XA8uckl9@L48wB5@yMKBIptFQDEtRe4R4hcKEZadwMYRpEb4O4OT9wjpmB80C4XRQrFel4W0lMa09cFn1tRrGEMaoBbDd42@dzGJxpWxC5XQ0J5yULELZPBLeoiDLFDFuzJBQvvXKMpaKpNH2qTGgZPGWDDkzCE/75hltFsUjOPJxTIgDAamPHYpoZNLbR5tnvRYryGJ@yVaR2NRNc/MlrseWm9IqXCMmwsw9YE@2kIk56SG1uyyZ2qstxGTu5Wz@Pdpa/rpee36bvOu8HV8nk9j/K@ZY/fc3Z5/gM ) - I add a `s` to make it work iin TIO

[10:07:21](#zU482GFDehBR00OCEcIBI0Prea4va7C81xKd2LJWVkk) <toomasv>:
* But, sorry, `opt` seems necessary after all. Second block of patterns doesn't solve without it.

## 8-Feb-2021

[3:47:40](#_LHe1MuFnng611SpZysT-C0MX0OX7XJsH75p7QuXSVw) <qtxie>:
Why this parse rule works in Rebol but not in Red?
https://gist.github.com/qtxie/e321ac4d1c737fc6e5d843f67cbb7de4

[5:07:27](#rGVApBplnW0_QV64VBBNz8DqpGQDClQNo9fwiFMSgls) <toomasv>:
Why this parse rule works in Rebol but not in Red?
https://gist.github.com/qtxie/e321ac4d1c737fc6e5d843f67cbb7de4

[5:59:25](#oonSTSedJgJzTCABMaf6aKerhAha9u-u-Ar2ZK-X6Is) <toomasv>:
Why this parse rule works in Rebol but not in Red?
https://gist.github.com/qtxie/e321ac4d1c737fc6e5d843f67cbb7de4

[5:59:44](#Sp3_37RE4duq5iSmToTXnMcfKz2gWjpDmEjkNDMci7A) <toomasv>:
* @qtxie  There seem to be two problems for Red:
1) Second level directives are not expanded -- `expand-directives` needs to be inserted after `src:`
2) Someting wrong with `halt` -- with `halt` commented out it works
With these changes (on W10):
```
>> do %parse-test.r
LIBREDRT-file : "libRedRT.dll"
src: [
    print "libRedRT.dll"
]
```

[7:57:19](#PK-yR_vT0ZTfjth2iUC70MowAksjt5sB6CYl9G5yxqI) <toomasv>:
Strange indeed! For some reason it stops parsing after `#switch` is alternative, exiting parser with `false`. If forced (insert `(parse s rule-blk)` in the end of line 60) then it works. Also, Red doesn't like `halt` in the end. And there is undefined `blk` on line 62. Should be `rule-blk`?
With said insertion, `halt` replaced by `()` and `blk` changed, both REBOL and Red produce this:
```
>> do %parse-test.r
LIBREDRT-file : "libRedRT.dll"
src: [
    print "libRedRT.dll"
]
```

[7:57:37](#HKQbLGlw50kmTp9bLDR6E96N0zpuE9Wz24gUPby7f_w) <toomasv>:
* Strange indeed! For some reason it stops parsing after `#switch` alternative, exiting parser with `false`. If forced (insert `(parse s rule-blk)` in the end of line 60) then it works. Also, Red doesn't like `halt` in the end. And there is undefined `blk` on line 62. Should be `rule-blk`?
With said insertion, `halt` replaced by `()` and `blk` changed, both REBOL and Red produce this:
```
>> do %parse-test.r
LIBREDRT-file : "libRedRT.dll"
src: [
    print "libRedRT.dll"
]
```

[8:03:06](#FW7wL-1J1c2vvtyrVRT_pcfajkE6a19fElgN1tu8Dlo) <toomasv>:
Although `blk` seems not to affect the result.

[22:57:39](#ucbV-OnLBaPBuaNFCvi8rhBp7f1L1tcfGym3u8QBkSs) <gltewalt (Greg T)>:
I have severa rules, and I get the result i want by doing multiple passes - `parse input [rule]`, repeat, but i dont get the results i want if i try to do one pass.

[22:58:36](#7tMKHtWRnJk5umqSoYLCXR4Q4vg1-jB_C9qV3bxdyjQ) <gltewalt (Greg T)>:
Do i need to add in the backtrack? `[rule | rule2]` etc?

[22:59:35](#uW6RSKQA52GvSTxL2VIFuSAFDVpMdutbqpiYpMad9Ko) <gltewalt (Greg T)>:
Does order matter?

## 9-Feb-2021

[0:30:53](#Nllp8lp4zuqoXRjoWqZfFo_5X1waOF6KZDTWySYnrPE) <greggirwin (Gregg Irwin)>:
Have to see the rules to know. Do you have a `some` or `any` to repeat over the rule?

[0:58:36](#Nw9n6rvOxbLztkuC_sHezF9wFUVnW67ro2DC5Xy1PWE) <gltewalt (Greg T)>:
Yep

[1:04:57](#rN0QLdXOPXeyCBfPrcAYVfpGIH6D_PpPjdHMgzaCXM8) <greggirwin (Gregg Irwin)>:
Order does matter. You need to put the longest matching rules first.

[1:06:25](#n9JkSF69_iJHuP7GyRtZm9M7hilUi3UygXVWrUCOd_s) <gltewalt (Greg T)>:
This is `very` deliberate and basic, down to the simplest I can make it while  I stumble through it - so... don;t make fun of me Ì†ΩÌ∏é 

https://gist.github.com/gltewalt/4bdba9588bec79d111bb4056fc209e41

[1:06:41](#Px1ynAooYFOjmxbhVeU7BwEuaUzPXIaanOMEM809MXk) <gltewalt (Greg T)>:
* This is `very` deliberate and basic, down to the simplest I can make it while  I stumble through it - so... don't make fun of me :sunglasses: 

https://gist.github.com/gltewalt/4bdba9588bec79d111bb4056fc209e41

[1:18:14](#ZY5zY-uLWyKMcOYJFlvWbqH0bDk-Ij8IUC8go-0yseA) <greggirwin (Gregg Irwin)>:
Will have to wait for time to dig in, but a key thing to remember is that `to` can skip over a lot of things to get to its match, so tends to be less useful when the format is less strict.

[1:20:11](#cmhfPsl_blcO5DF3oFjvN-7N_EhC7KEzxLU3GTqNc3U) <gltewalt (Greg T)>:
What should i use in place of `to`?

[1:20:22](#KlgXRXR_omKns3wpV-xFJ6Ca22WxSmrXD1n7KcaMY78) <greggirwin (Gregg Irwin)>:
To handle all your rules in this case, you would need `|`, but then you'll run up against `to` skipping over things, based on the order your check your rules in.

[1:21:15](#IhSRZUbmsA01miw9rWFl-dkSk73UzIsrwpleOJpk_BQ) <gltewalt (Greg T)>:
Most of these are reated patterns, but... little steps

[1:21:24](#fZINPyi9v0smFm22xCaFl-d8Uxp5dpQaBRLdWs08t-k) <greggirwin (Gregg Irwin)>:
`| skip`. So you check your known values to match, then skip one char if none of them do.

[1:21:27](#vszQjl86G1F5oY4TzSJMlSHwS8M-Y-gFKI4U666C7uo) <gltewalt (Greg T)>:
Related patterns 

[1:28:24](#DX3XDp-Ocv0bmmnMW-gJtB-AKBgWf8vUmzP7PKtOVXc) <greggirwin (Gregg Irwin)>:
e.g. 
```
Red []

level-3-rule: [change "====" {<a href="#Lnk">} to "^/" insert "</a><p>"]
level-2-rule: [change "===" "<h3>" to "^/" insert "</h3><p>"]
level-1-rule: [change "==" "<h2>" to "^/" insert "</h2><p>"]
level-0-rule: [change "=" "<h1>" to "^/"  insert "</h1>"]
main-rule: [
    some [
        level-3-rule
        | level-2-rule
        | level-1-rule
        | level-0-rule
        ;...
        | skip
    ]
]

s: {
= Parse dialect

== Overview

Parse dialect is an embedded domain-specific language (DSL) of Red that allows concise processing of _input_ series with grammar _rules_. Parse's common use-cases are:

* *Search:* locate specific patterns;
* *Validation*: check the conformity of input to some specification;

=== Usage

Parse is invoked through the `parse` function using a simple default syntax (see <<Extra functions>> section for more details):

----
parse <input> <rules>

<input> : any series! value except for image! and vector!
<rules> : a block! value with valid Parse dialect content (top-level rule)
----
}

parse ss: copy s main-rule
print ss
```

[1:30:27](#uvhdx7k7JSG1mA4SAX3mWB00wIcczahHdj58o82Kruc) <gltewalt (Greg T)>:
Dont need the anys?

[1:33:10](#mq1IZv9VaSEzBbZMnVD4rFgqs_Tp7T9-nCWiMKi62xI) <greggirwin (Gregg Irwin)>:
The outer `some` could be `any` instead, which will handle all the sub rules.

[2:12:39](#el23jgO-9_IaUJ7_abz6FnCQu4Y4bFLJhiXMpr5yV40) <qtxie>:
@toomasv Thanks. So maybe a bug in parse?

[4:38:46](#WCtsHLX3WsdFPZMdbElxmimG-A8jqz4MPCFGmKXN5nI) <toomasv>:
I thought so too.

[4:39:10](#nP66ZMYDKbgbfvWeHuqW7s54XHfndb71uUnbRtZSXrw) <toomasv>:
* @qtxie Yes, I thought so too. 

[8:53:17](#NOooviMPzrqP_Vv_ywCwhrWfk0uBfo2sHZj1RAxUhOQ) <toomasv>:
@gltewalt On from @greggirwin :
```
level-0-rule: [change "= " "<h1>" to newline insert "</h1>" newline]
level-1-rule: [change "== " "<h2>" to newline insert "</h2><p>" newline]
level-2-rule: [change "=== " "<h3>" to newline insert "</h3><p>" newline]
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline]
list-item: [if (not in-bold?) change "* " "<li>" (in-list-item?: yes)]
end-list-item: [if (in-list-item?) ahead newline insert "</li>" (in-list-item?: no) newline]
escape-input-tag: [change "<" "&lt;" | change ">" "&gt;"]
code-rule: [ahead ["----" | "`"] [
	if (in-pre?)  change "----" "</pre>" (in-pre?: false) 
	| 			  change "----" "<pre>" (in-pre?: true)
|	if (in-code?) change "`"    "</code>" (in-code?: false) 
	| 			  change "`"    "<code>" (in-code?: true)
	]
]
italics-rule: [ahead "_" [
	if (in-italics?) change "_" "</i>" (in-italics?: no)
	|				 change "_" "<i>" (in-italics?: yes)
	]
]
bold-rule: [ahead "*" [
	if (in-bold?) change "*" "</b>" (in-bold?: no)
	|			  change "*" "<b>" (in-bold?: yes)
	]
]

in-pre?: in-code?: in-italics?: in-bold?: in-list-item?: no
parse r [
	any [
		level-0-rule
	|	level-1-rule
	|	level-2-rule
	| 	level-3-rule
	|	list-item
	|	end-list-item
	|	code-rule
	|	escape-input-tag
	|	italics-rule
	|	bold-rule
	| 	skip
	]
]
```

[8:54:15](#2uxaCP5ZPOTPyTDic77uG7j_pNlzTpHvAgO9gEEt82U) <toomasv>:
* @gltewalt On from @greggirwin :
```
level-0-rule: [change "= " "<h1>" to newline insert "</h1>" newline]
level-1-rule: [change "== " "<h2>" to newline insert "</h2><p>" newline]
level-2-rule: [change "=== " "<h3>" to newline insert "</h3><p>" newline]
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline]
list-item: [if (not in-bold?) change "* " "<li>" (in-list-item?: yes)]
end-list-item: [if (in-list-item?) ahead newline insert "</li>" (in-list-item?: no) newline]
escape-input-tag: [change "<" "&lt;" | change ">" "&gt;"]
code-rule: [ahead ["----" | "`"] [
	if (in-pre?)  change "----" "</pre>" (in-pre?: false) 
	| 			  change "----" "<pre>" (in-pre?: true)
|	if (in-code?) change "`"    "</code>" (in-code?: false) 
	| 			  change "`"    "<code>" (in-code?: true)
	]
]
italics-rule: [ahead "_" [
	if (in-italics?) change "_" "</i>" (in-italics?: no)
	|				 change "_" "<i>" (in-italics?: yes)
	]
]
bold-rule: [ahead "*" [
	if (in-bold?) change "*" "</b>" (in-bold?: no)
	|			  change "*" "<b>" (in-bold?: yes)
	]
]

in-pre?: in-code?: in-italics?: in-bold?: in-list-item?: no
parse r [
	any [
		level-0-rule
	|	level-1-rule
	|	level-2-rule
	| 	level-3-rule
	|	list-item
	|	end-list-item
	|	code-rule
	|	escape-input-tag
	|	italics-rule
	|	bold-rule
	| 	skip
	]
]
```

But I am not sure it works for all funcs.

[8:54:39](#Jf9XeNVL1gNOqk03fHega59D2Oqv27PcCgfgzZtGZQQ) <toomasv>:
* @gltewalt On from @greggirwin :
```
level-0-rule: [change "= " "<h1>" to newline insert "</h1>" newline]
level-1-rule: [change "== " "<h2>" to newline insert "</h2><p>" newline]
level-2-rule: [change "=== " "<h3>" to newline insert "</h3><p>" newline]
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline]
list-item: [if (not in-bold?) change "* " "<li>" (in-list-item?: yes)]
end-list-item: [if (in-list-item?) ahead newline insert "</li>" (in-list-item?: no) newline]
escape-input-tag: [change "<" "&lt;" | change ">" "&gt;"]
code-rule: [ahead ["----" | "`"] [
	if (in-pre?)  change "----" "</pre>" (in-pre?: false) 
	| 			  change "----" "<pre>" (in-pre?: true)
|	if (in-code?) change "`"    "</code>" (in-code?: false) 
	| 			  change "`"    "<code>" (in-code?: true)
	]
]
italics-rule: [ahead "_" [
	if (in-italics?) change "_" "</i>" (in-italics?: no)
	|				 change "_" "<i>" (in-italics?: yes)
	]
]
bold-rule: [ahead "*" [
	if (in-bold?) change "*" "</b>" (in-bold?: no)
	|			  change "*" "<b>" (in-bold?: yes)
	]
]

in-pre?: in-code?: in-italics?: in-bold?: in-list-item?: no
parse r [
	any [
		level-0-rule
	|	level-1-rule
	|	level-2-rule
	|	level-3-rule
	|	list-item
	|	end-list-item
	|	code-rule
	|	escape-input-tag
	|	italics-rule
	|	bold-rule
	|	skip
	]
]
```

But I am not sure it works for all funcs.

[8:55:16](#qWFmGIXkG5jPJM_OYgzxWbok7nMctVUjapb6ctUTyC8) <toomasv>:
* @gltewalt On from @greggirwin :
```
level-0-rule: [change "= " "<h1>" to newline insert "</h1>" newline]
level-1-rule: [change "== " "<h2>" to newline insert "</h2><p>" newline]
level-2-rule: [change "=== " "<h3>" to newline insert "</h3><p>" newline]
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline]
list-item: [if (not in-bold?) change "* " "<li>" (in-list-item?: yes)]
end-list-item: [if (in-list-item?) ahead newline insert "</li>" (in-list-item?: no) newline]
escape-input-tag: [change "<" "&lt;" | change ">" "&gt;"]
code-rule: [ahead ["----" | "`"] [
	if (in-pre?)  change "----" "</pre>" (in-pre?: false) 
	| 			change "----" "<pre>" (in-pre?: true)
|	if (in-code?) change "`"    "</code>" (in-code?: false) 
	| 			 change "`"    "<code>" (in-code?: true)
	]
]
italics-rule: [ahead "_" [
	if (in-italics?) change "_" "</i>" (in-italics?: no)
	|				change "_" "<i>" (in-italics?: yes)
	]
]
bold-rule: [ahead "*" [
	if (in-bold?) change "*" "</b>" (in-bold?: no)
	|			 change "*" "<b>" (in-bold?: yes)
	]
]

in-pre?: in-code?: in-italics?: in-bold?: in-list-item?: no
parse r [
	any [
		level-0-rule
	|	level-1-rule
	|	level-2-rule
	|	level-3-rule
	|	list-item
	|	end-list-item
	|	code-rule
	|	escape-input-tag
	|	italics-rule
	|	bold-rule
	|	skip
	]
]
```

But I am not sure it works for all funcs.

[8:57:10](#gQJ3b3qUtkAP7pMHjwzlj0gS2F9kD5vwuP9_Y_X6q34) <toomasv>:
* @gltewalt On from @greggirwin :
```
level-0-rule: [change "= " "<h1>" to newline insert "</h1>" newline]
level-1-rule: [change "== " "<h2>" to newline insert "</h2><p>" newline]
level-2-rule: [change "=== " "<h3>" to newline insert "</h3><p>" newline]
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline]
list-item: [if (not in-bold?) change "* " "<li>" (in-list-item?: yes)]
end-list-item: [if (in-list-item?) ahead newline insert "</li>" (in-list-item?: no) newline]
escape-input-tag: [change "<" "&lt;" | change ">" "&gt;"]
code-rule: [ahead ["----" | "`"] [
	if (in-pre?)  change "----" "</pre>" (in-pre?: false) 
	| 			change "----" "<pre>" (in-pre?: true)
|	if (in-code?) change "`"    "</code>" (in-code?: false) 
	| 			 change "`"    "<code>" (in-code?: true)
	]
]
italics-rule: [ahead "_" [
	if (in-italics?) change "_" "</i>" (in-italics?: false)
	|				change "_" "<i>" (in-italics?: true)
	]
]
bold-rule: [ahead "*" [
	if (in-bold?) change "*" "</b>" (in-bold?: false)
	|			 change "*" "<b>" (in-bold?: true)
	]
]

in-pre?: in-code?: in-italics?: in-bold?: in-list-item?: false
parse r [
	any [
		level-0-rule
	|	level-1-rule
	|	level-2-rule
	|	level-3-rule
	|	list-item
	|	end-list-item
	|	code-rule
	|	escape-input-tag
	|	italics-rule
	|	bold-rule
	|	skip
	]
]
```

But I am not sure it works for all funcs.

[8:57:37](#h1PmPFVvZtRbAPx5cgXMvaQX4s1t1v2VIhIf_FgzF0U) <toomasv>:
* @gltewalt On from @greggirwin :
```
level-0-rule: [change "= " "<h1>" to newline insert "</h1>" newline]
level-1-rule: [change "== " "<h2>" to newline insert "</h2><p>" newline]
level-2-rule: [change "=== " "<h3>" to newline insert "</h3><p>" newline]
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline]
list-item: [if (not in-bold?) change "* " "<li>" (in-list-item?: yes)]
end-list-item: [if (in-list-item?) ahead newline insert "</li>" (in-list-item?: no) newline]
escape-input-tag: [change "<" "&lt;" | change ">" "&gt;"]
code-rule: [ahead ["----" | "`"] [
	if (in-pre?)  change "----" "</pre>" (in-pre?: false) 
	| 			change "----" "<pre>" (in-pre?: true)
|	if (in-code?) change "`"    "</code>" (in-code?: false) 
	| 			 change "`"    "<code>" (in-code?: true)
	]
]
italics-rule: [ahead "_" [
	if (in-italics?) change "_" "</i>" (in-italics?: false)
	|				change "_" "<i>" (in-italics?: true)
	]
]
bold-rule: [ahead "*" [
	if (in-bold?) change "*" "</b>" (in-bold?: false)
	|			 change "*" "<b>" (in-bold?: true)
	]
]

in-pre?: in-code?: in-italics?: in-bold?: in-list-item?: false
parse r [
	any [
		 level-0-rule
	|	level-1-rule
	|	level-2-rule
	|	level-3-rule
	|	list-item
	|	end-list-item
	|	code-rule
	|	escape-input-tag
	|	italics-rule
	|	bold-rule
	|	skip
	]
]
```

But I am not sure it works for all funcs.

[17:52:16](#P8h_DyW8LRLcM0emHFRKewIX4y1Cn_MtsRfc8aEsskE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Currently there is:
```red
>> parse "a" [#a]
== false
>> parse "#a" [#a]
== false
```
Should not be there an error instead as it looks that `issue!` is not supported.

[17:57:46](#nQlYkfl-JD34ReUTj4rdgLaTRADmpTdflrcnRSVB2Ts) <toomasv>:
Datatypes and typed data in general are not supported in string-parsing.

[17:59:48](#eqvarFE_f-DKFpcpfnE4M2ZWm9YCvX-demwQlvr0HIo) <toomasv>:
* Datatypes and typed data in general are not supported in string-parsing.


[18:00:14](#F-qg1GRZ7xUbbGRfjLwy3qIa2MB-pNOm-pUZmsQQmjs) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Really?
```red
>> parse "http://aaa b c@d" [http://aaa sp "b" sp c@d]
== true
```

[18:00:48](#P_lZKVhtvuNbV6VLoYG-7feVElNl-WsZvZ9HSaBzcb4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Really?
```red
>> parse "http://aaa b c@d <e>" [http://aaa sp "b" sp c@d sp <e>]
== true
```

[18:02:46](#ar5KL670ALGSBzIJ9iJ8Wh7BlsDRrhGUl6R0JSTzJH8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Also:
```red
>> parse "a" [%a]
== true
```
But I'm not sure if I like this result... but it's compatible with Rebol.

[18:09:17](#iEGde1MJhSp466Hec4W4UWT2XraQf-Ra4y85wid6q1E) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It is consistent with:
```red
>> parse "oldes" [@oldes]
== true
```
But I have a feeling that it would be more useful if it would count also the `@` char... having `true = parse "@oldes" [@oldes]`

[18:49:33](#XHV50-v1muR5vpItbAcHgVjB2JrWuyNdMv6ZddRSi5I) <gltewalt (Greg T)>:
Do I have to use that copy trick and moving around the index for this?
```
; capture word after "==== " replace Lnk with word, lowercase. Example: "==== Usage"   {<a href="#usage>"}
level-3-rule: [change "==== " {<a href="#Lnk">} to newline insert "</a><p>" newline] 
```

[18:50:22](#LMpfnjCcnkUZMkoIVkDQx_oNHzQ1Xs7tB1OIikTtRFg) <gltewalt (Greg T)>:
> Thanks @greggirwin , I started explaining it too, and then changed the rule a bit, and here it is with explanation:
> ```
> parse txt [s: collect any [some #" " "=>" e: Ì†ΩÌ∏ñ keep to #" " :e | #" " s: | skip]]
> ```
> Explained:
> ```
> [s:                    ; record start of the text for case the word we want is in the very beginning
> collect any [          ; it doesn't really matter if it is `any` or `some`
>                        ; Principal alternative:
>   some #" " "=>"       ;   we hit some spaces and "=>" (let's call it "separator")
>   e:                   ;   record position after separator
>   Ì†ΩÌ∏ñ                   ;   go back to last recorded position before separator ...
>   keep to #" "         ;   ... and keep word between that position and next space
>   :e                   ;   now jump to position after separator and continue from there
>                        ; Second alternative:
> | #" " s:              ;   we meet a space and record position after that, so we remember last position before we hit separator.
>                        ;   Notice that this rule *has* to be after the first one, otherwise we'll hit spaces before "=>" first
> 					   ; Third alternative:
> | skip                 ;   just skip everything else
> ]]
> ```

Similar to that

[19:19:45](#yuT6veWEWRiNJP6Qhjk3VPRnhsB6DQzpYRCgsx-1dEA) <toomasv>:
@gltewalt These are all `any-string!` types (string! file! url! tag! email! ref!), but `issue!` does not belong to these.

[19:55:34](#3jaENCH98xbdtLXDq2DJwq0CZpsKlfA8RGMkJ7uIcFQ) <gltewalt (Greg T)>:
Its just another string if you split it, get the value, then rejoin 

[20:02:11](#a5BXQaKweu-pcwXTeROKFWCA4DTXPcPQMbYouB4eMPA) <greggirwin (Gregg Irwin)>:
@Oldes there is limited support for typed parsing from strings. We should consider it experimental, and maybe not as useful now with `transcode/trace` available. I believe it helps to think in terms of text, which may be anything, versus Red data. 

[20:04:53](#yT5n0t356gvH0iqfvHyf63cMayAs0Wq-xHMn9Jkp6Vc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@toomasv I know that `issue!` is not a `any-string!`... I was asking if there should not be error like in Rebol instead of silently ignoring it.

[20:05:17](#0LA_NbH6JdNo7PhF_5tr6a63Mzk5-axvNn_V5fEW-A0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @toomasv I know that `issue!` is not in `any-string!`... I was asking if there should not be error like in Rebol instead of silently ignoring it.

[20:06:39](#YC1KZ0-Dk8t6NWlF_jCFmIDBmaVTP1opg2RPN3KdlzM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
On the other side.. there are no errors for unsupported types... like:
```red
>> parse "aa" [%1]
== false
```

[20:58:40](#n0UR6BAW2VI6tiLaCAAl4jArWKShJYzvxdzTcrbmIwM) <gltewalt (Greg T)>:
I swear there was an error on my linux version - cant check until after work, now

## 10-Feb-2021

[6:00:38](#dwMe26U5bdBE2NVWK7q1iBIevm5pxAh0O_W7v8YYE0k) <toomasv>:
@Oldes It is just the same as you showed before:
```
>> parse "aa" [%aa]
== true
>> parse "1" [%1]
== true
```
As it belongs to `any-string!` typset it is supported. Just not matching.


[6:24:13](#ILHF_4FPMcxMlz0QaxHiQCUHuWX_3PjCIgeqctJ1Vtc) <toomasv>:
@Oldes It is just the same as you showed before:
```
>> parse "aa" [%aa]
== true
>> parse "1" [%1]
== true
```
As it belongs to `any-string!` typset it is supported. Just not matching.


[6:30:00](#xFHiOqAmBhQrVRUDwRIIJh2sXEU0eD-rIM8PCsr8vhU) <toomasv>:
@Oldes It is just the same as you showed before:
```
>> parse "aa" [%aa]
== true
>> parse "1" [%1]
== true
```
As it belongs to `any-string!` typset it is supported. Just not matching.


[6:30:32](#TO_sbgg9R7f_4mRvJzMitnMD6Up_jAeWle_UgUw12Ws) <toomasv>:
* Alternatively:
```
>> level-3-rule': [change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all lnk #" " #"-") insert {">} lnk insert "</a><p>" newline]
== [change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all lnk #...
>> parse str: "==== Usage example^/" level-3-rule' str
== {<a href="#usage-example">Usage example^/}
```

[6:31:26](#KepLyABi9KPcyIAg195RUUtYvuoQF1OJQs0_8ARWJFs) <toomasv>:
* Alternatively, without jumping back:
```
>> level-3-rule': [change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all lnk #" " #"-") insert {">} lnk insert "</a><p>" newline]
== [change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all lnk #...
>> parse str: "==== Usage example^/" level-3-rule' str
== {<a href="#usage-example">Usage example^/}
```

[6:41:09](#vpm9FMi97NJ4YYCpGrOlOMqYkl3DH67E9WQWHyzGEFI) <toomasv>:
@gltewalt Yes, copy and juggle indexes:
```
>> level-3-rule: [s: change "==== " {<a href="#Lnk">} copy lnk to newline Ì†ΩÌ∏ñ thru "#" change "Lnk" (lowercase replace/all copy lnk #" " #"-") to newline insert "</a><p>" newline]
== [s: change "==== " {<a href="#Lnk">} copy lnk to newline Ì†ΩÌ∏ñ thru "#" change "Lnk" (lowercase re...
>> parse str: "==== Usage^/" level-3-rule str
== {<a href="#usage">Usage</a><p>^/}
>> parse str: "==== Usage example^/" level-3-rule str
== {<a href="#usage-example">Usage example</a><p>^/}
```

[6:42:28](#xan7T9gbJL1sz8cINBBgx1hlg19MmL6DZj5KGQtuBoA) <toomasv>:
Alternatively, without jumping around:
```
>> level-3-rule': [s: change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all copy lnk #" " #"-") insert {">} lnk insert "</a><p>" newline]
== [s: change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all copy ...
>> parse str: "==== Usage example^/" level-3-rule' str
== {<a href="#usage-example">Usage example</a><p>^/}
```

[6:43:14](#LuBJr7SPy8Qvxr5fX4K1Lqw16i7Oy8TNV46P0jJuBpk) <toomasv>:
* Alternatively, without jumping around:
```
>> level-3-rule': [change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all copy lnk #" " #"-") insert {">} lnk insert "</a><p>" newline]
== [change "==== " {<a href="#} ahead [copy lnk to newline] insert (lowercase replace/all copy ...
>> parse str: "==== Usage example^/" level-3-rule' str
== {<a href="#usage-example">Usage example</a><p>^/}
```

[9:37:11](#vMbA3767qM2ynLgiMhpWf_07EXHsTTFUW6VfteeAjIY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@toomasv ah... my fault... I wanted to write:
```red
>> parse "aa" [1%]
== false ;<-- no error when used `percent!` datatype as a rule.
```

[9:38:02](#Qo9BDMAjVZxgrk60s_NX-pd1yrPSRginwxLREFe95GU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @toomasv ah... my fault... I wanted to write:
```red
>> parse "1" [1%]
== false ;<-- no error when used `percent!` datatype as a rule.
```

[9:38:23](#_t24GGN3mn99JLNw1tPgisAgUbRiLxrteHQHakO3TSk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @toomasv ah... my fault... I wanted to write:
```red
>> parse "1" [1%]
== false ;<-- no error when used `percent!` datatype as a rule.
>> parse "1%" [1%]
== false
```

[9:38:55](#vivi5vUjTvcb1UiSdiXuIaqKYvEsWAf9Wl5HUyvsqp4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @toomasv ah... my fault... I wanted to write:
```red
>> parse "1" [1%]
== false ;<-- no error when used `percent!` (or any other unhandled) datatype as a rule.
>> parse "1%" [1%]
== false
```

[9:39:09](#b7Z4ntcn4TZqzSr2RRcDwFK_fcd83ihJPgAhnPMU2SA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @toomasv ah... my fault... I wanted to write:
```red
>> parse "1" [1%]
== false ;<-- no error when used `percent!` (or any other unsupported) datatype as a rule.
>> parse "1%" [1%]
== false
```

[9:41:35](#g3MEqf7sPg5RQhRpgPL2pay2eUxzlIYTgNUYubCkLEA) <toomasv>:
I agree that error would probably be useful if trying to match non-any-string rules on any-string input.

[9:42:35](#yr_Q7B55c1-oapeXa1WvaupfJRtbTskr5ZbzzarhU1E) <toomasv>:
* I agree that error would probably be useful if trying to match non-any-string rules on any-string input. Like:
```
>> parse "1" [integer!]
*** Script Error: PARSE - matching by datatype not supported for any-string! input
```

[9:43:46](#9gFY1O4lyJ2RpB5NrwSHEBoRsCetIcJfQGPEM46AWNk) <toomasv>:
* I agree that error would be useful if trying to match non-any-string rules on any-string input. Like:
```
>> parse "1" [integer!]
*** Script Error: PARSE - matching by datatype not supported for any-string! input
```

[9:45:18](#sKCjVfjS8UcOXnmQnw6Xh7hfHGTm-b5qfTjwr6n3NNk) <toomasv>:
* I agree that error would be useful if trying to match non-any-string rules on any-string input. Like:
```
>> parse "1" [integer!]
*** Script Error: PARSE - matching by datatype not supported for any-string! input
```
Or even
```
>> parse "1" [string!]
*** Script Error: PARSE - matching by datatype not supported for any-string! input
```

[12:52:26](#Yfx3RKbadSJ0kLSYwFF077lOhEHuwcIiCjRBQiCz01w) <hiiamboris (NOT THIS ONE)>:
That's strange considering:
```
>> parse to #{} "1" [integer!]
== true
```

[12:52:30](#eeoklxawfWx4YBQLNdP1RaY5Z4T71d6suxY9d_NACdY) <hiiamboris (NOT THIS ONE)>:
I think it's a bug

[13:01:48](#yx-VcLkD8hDfmGI1vF2UDmQs-8_StoDvU0CTB0BPwY4) <hiiamboris (NOT THIS ONE)>:
OK crash is a different issue, I'll report it myself

[18:18:39](#MdbPQtG4Kn0ZUJzmTC-DIPyh-lf1MN3laRAtorumDPc) <gltewalt (Greg T)>:
@toomasv I had this before you responded

```
level-3-rule: [change "==== " {<li><a href="#_} copy s to newline insert {">} insert (rejoin [ s {</a></li>}])] ```

[19:18:27](#RsmhKYzS6Fr6sF-RgfS7OzdOmCXkl9Q3NttFDa2yMrs) <toomasv>:
If there are single words only in headings and lowercase doesn't matter, then why not.

[19:25:31](#M6DSIirTgG_Y-Q-kJHtAh1sHTf8IgU1KvVcT1j9sx7k) <gltewalt (Greg T)>:
Yeah

## 11-Feb-2021

[3:48:58](#69z4IdIVdWX5vFCgD_NQUiB0xS3AptJGfZS33Fwc8DQ) <gltewalt (Greg T)>:
The doc says you can match by datatype for utf-8 encoded values if you use `to binary!`

[3:53:03](#C6OHCeuFETYD1UDrzrnuxXK4_RvxEeNyaBRoXRAeySA) <gltewalt (Greg T)>:
`parse to binary! "1" [integer!]` == true

[3:55:05](#lJiLl2XrthuIuT3jwssLzd5UhuVkrw656iHCGe5iSYg) <gltewalt (Greg T)>:
https://imgur.com/a/Jod9rmB

## 12-Feb-2021

[0:31:04](#VErwS7Mt884uBMXzBPy0KD_ZewFb4_jqjF7u8NTapZ0) <gltewalt (Greg T)>:
Can you copy more than one thing?

[0:32:00](#PzSnJBDFjjchwViTie9UK1XqdSFeEJOnPyZzc1XEA4Y) <gltewalt (Greg T)>:
```
s: "CAUTION: Ensure that..."

hmmm: [change [| "CAUTION:" | "WARNING:" | "IMPORTANT:"] (rejoin [
    {<table><tr><td class="icon"><div class="title">} x {</div></td><td class="content">ALL OF S GOES HERE</td></tr></table>}]
    ) copy x to ":"]
```


[0:34:07](#TiIZOGUsEwD0gB2WR-Ihm4jVoHFeda5ExnGCxzWXeFM) <gltewalt (Greg T)>:
The whole string should go in between `td class="content">` and `</td>`. No text after `</table>`

[0:36:49](#aPZprekDs9kIrvEX1N_mmRKP9t-KLE0hnHFOcgtQilU) <gltewalt (Greg T)>:
Tried this but `y` has no value.

```
hmmm: [change [| "CAUTION:" | "WARNING:" | "IMPORTANT:"] (rejoin [
    {<table><tr><td class="icon"><div class="title">} x {</div></td><td class="content">} y {</td></tr></table>}]
    ) copy x to ":" skip copy y to newline]
```

[0:37:01](#ImTPCApafXewIZp-LTIGx9pErJJzmOBNkz9EIicnXTE) <gltewalt (Greg T)>:
I swear ... I'm never going to learn this

[2:01:26](#cSwR4s1thobiNphwG8IhGkGoixvP9bYVDvorEIlC9kU) <gltewalt (Greg T)>:
Close, but need the text after `</table>` gone.

```
s: copy "CAUTION: Ensure that..."

hmmm: [s: change [| "CAUTION:" | "WARNING:" | "IMPORTANT:"] (rejoin [
    {<table><tr><td class="icon"><div class="title">} x {</div></td><td class="content">} s {</td></tr></table>}]
    ) copy x to ":"]
```

[2:21:18](#FFWW0JHKRV621LSZmp7XrvqQAC-WqA-ytZjn7mUbQso) <gltewalt (Greg T)>:
Oh well 

[8:25:02](#ngVqYkR-TWLhIBNKmYwlZyCvyTbq-_1ybDSCye3h2T8) <toomasv>:
@gltewalt Several things about latest:
* `s` is used for original string but reused inside rule
* `change` rule starts with empty option - it will never check further alternatives
* `x` is referred before it has got value

Here is one possibility, assuming there is no more text (which there probably would be):
```
str: copy "CAUTION: Ensure that..."
hmmm: [ahead [copy x ["CAUTION" | "WARNING" | "IMPORTANT"] #":"] insert (rejoin [
    {<table><tr><td class="icon"><div class="title">} x {</div></td><td class="content">}]) to end insert ({</td></tr></table>})
]

parse str hmmm probe str
{<table><tr><td class="icon"><div class="title">CAUTION</div></td><td class="content">CAUTION: Ensure that...</td></tr></table>}
```

[15:52:21](#F7On3_JdNP1a4vc6Cyg3HRkgB48kklJUGW2zOcAOOBQ) <gltewalt (Greg T)>:
Empty option was typo

[18:36:04](#nPaAz--Ped1gIoVYtbcElqg6m1GlAg67xkIKIlSFEks) <greggirwin (Gregg Irwin)>:
R2
```
parse [1] [any [1 1 1]]
;== true
val: 1
;== 1
parse [1] [any [1 1 val]]
;== true
```
Red:
```
parse [1] [any [1 1 1]]
;*** Script Error: PARSE - invalid rule or usage of rule: 1
;*** Where: parse
;*** Stack:  

parse [1] [any [1 1 quote 1]]
;== true

val: 1
;== 1
parse [1] [any [1 1 quote val]]
;== false
parse [1] [any [1 1 val]]
;*** Script Error: PARSE - invalid rule or usage of rule: 1
;*** Where: parse
;*** Stack:  
```

Do others agree this is a bug?

[18:43:51](#PguYacvQQNDlwIpIN6YbzJK1qCBoLl7Z-SoOUget3GQ) <toomasv>:
But in Red you can do this:
```
>> parse [1] [any [1 1 1 1 1 1 quote 1]]
== true
```
Not in R2:
```
>> parse [1] [any [1 1 1 1 1 1 quote 1]]
== false
```
Not that is useful   Ì†ΩÌ∏ï

[18:46:05](#GWWmZk6Yn7LgJzDyXGQAn7h2LDRwHr9-VNsaBYPv95U) <toomasv>:
Plain integer is *always* a rule in Red
```
>> val: [quote 1] parse [1] [any [1 1 val]]
== true
```

[18:46:20](#fz7elZySf86PD8z4HZ3-ylBv6W7mmfrsr5Lr0o5VMVk) <toomasv>:
* Plain integer is **always** a rule in Red
```
>> val: [quote 1] parse [1] [any [1 1 val]]
== true
```

[18:50:03](#Nsd1Ib-Ivl4oqyCoEh1v2MD3jHOX8MqbYxcV7m6Ol2s) <hiiamboris (NOT THIS ONE)>:
I agree, a bug.

[18:50:33](#_c0n7EyZ0oQnh-c1-U231hJhxBFuL6U0lX04eSFg9jc) <toomasv>:
* But in Red you can do this:
```
>> parse [1] [any [1 1 1 1 1 1 quote 1]]
== true
```
Not in R2:
```
>> parse [1] [any [1 1 1 1 1 1 quote 1]]
== false
```
Not that it is useful   :confused:

[19:05:57](#AB3_y_uSoh7d3t5z7c_5HGQi2i0DIZhfaZvi-wH9xKQ) <greggirwin (Gregg Irwin)>:
How `to/thru` handle ints is another wrinkle. Today they don't. But R2 didn't either.

[19:07:54](#48IFjSMp1-GDUKea-9rbkq7zAKakPfsBQL3nszLayDs) <greggirwin (Gregg Irwin)>:
`parse [1] [any [1 1 1 1 1 1 quote 1]]` melted my brain.

[19:13:53](#81Kt0yzef8jzDakjyxG-Oo0VR9MXuuIYDgEcyhpGm_Y) <greggirwin (Gregg Irwin)>:
I can use the `val: [quote 1]` trick (thanks @toomasv) for my experiment.

[19:33:46](#sCEg4o_BoT53uwJeLqSY-2bu3MzIpJsy9R0hmJdL2Ds) <toomasv>:
But there *may* be situations where this matters, e.g. Red:
```
outer-min: 1
outer-max: 2
inner-min: 2
inner-max: 3
parse [1 2 3 4 5 6][outer-min outer-max inner-min inner-max integer!]
== true
```
R2:
```
outer-min: 1
outer-max: 2
inner-min: 2
inner-max: 3
parse [1 2 3 4 5 6][outer-min outer-max inner-min inner-max integer!]
== false
```

[19:35:53](#nkCze9ZNah7LuI5pvMMCAOy8JPfsoFd7Y7SjoxAtWBo) <hiiamboris (NOT THIS ONE)>:
oh wow

[19:43:46](#lw7CJiQaWbG6NtCW1JFhZul8JkaD7WSpBdPdIpWVknk) <greggirwin (Gregg Irwin)>:
Naming things helps sooo much. :^)  Saved my melted brain from leaking out entirely.

[19:45:15](#CRKhxFtCjdkvnrWFelyjpt35mKcco6A993OYhXgTgFY) <toomasv>:
‚òù [February 12, 2021 9:05 PM](https://gitter.im/red/parse?at=6026d19532e01b4f71904f32) What about `to/thru`? Seems it treats integers as expected:
```
>> parse [a 1 2 b]['a thru 2 3 [quote 1 | quote 2 | quote 3] 'b]
== true
```

[19:50:48](#OSSF_MeHX40dGhZQh2QjAUi3gQpmdK-9BaDfqK9qwOQ) <greggirwin (Gregg Irwin)>:
Indeed. I mixed something up somewhere. Thanks for the sanity check.

[19:54:13](#fukNiaZgt299OO5LLkx8HgeUF5Xn0ETc8_pHOhdRgNw) <greggirwin (Gregg Irwin)>:
The nested range "feature" will surely help us win code obfuscation contests. One of those things that makes logical sense when teased apart, but was totally opaque to me with the unnamed `1` example.

[19:55:13](#xB7LpccMmT5RD6qvFih4SUpMzB_Y3Q97PZBIOwvp2y0) <greggirwin (Gregg Irwin)>:
I bet @toomasv cheated and used DiaGrammar. ;^)

[19:55:55](#mKjMizsC44mGdJu5Mz76e6VsEzZ1OYO0hKlCcjCM4iI) <greggirwin (Gregg Irwin)>:
[![image.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/WFBw/thumb/image.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/WFBw/image.png)

[20:03:47](#t9ZMIVxGCy_nEeVw72Jc6nTejl3LJoITjHjqkAv8iBQ) <toomasv>:
Ì†ΩÌ∏Ñ I'd like to have had that idea!

## 24-Feb-2021

[20:14:11](#qNw31kJ5uG5TX2mBuueMQ9hxWqV90VctkJudPS6d06Q) <gltewalt (Greg T)>:
How come the index of the next position to match is one beyond the match with strings, but is at the match with blocks?  Or is it not supposed to be that way?

[20:16:58](#ap0l4EfBseziptC1hORy4OnF1e8BFeJN1H20UKyGgV4) <gltewalt (Greg T)>:
https://imgur.com/a/PoWNrAx

[20:20:09](#x-obwclaT51Lrer5nl3-mfneKxEYj1fVDDUpS45XcYo) <hiiamboris (NOT THIS ONE)>:
both look identical to me

[20:20:22](#7ol9oCZn08w9WpnUL1FgGrF_6VmPA9HVJ0l0du9EV10) <hiiamboris (NOT THIS ONE)>:
2 = after '7'

[20:25:02](#7TQUTBFu5W5UzdcvTAgMqy92F39kFUlGGej4NA48zK4) <gltewalt (Greg T)>:
Am I just roasted tired?
https://imgur.com/a/IWRIYEa

[20:31:46](#4SegRFXi-EcpRHRCrLWZSzFinser_mFoTAbPpJlwBlI) <hiiamboris (NOT THIS ONE)>:
OK here it looks weird

[20:32:11](#Qhy6w2IXupbfmLLhq9J8vzQXsia8sUOy1mnZ_5Qmi3M) <hiiamboris (NOT THIS ONE)>:
Is this a bug in `parse/trace` or `parse-trace`?

[20:33:05](#PHZJ6FiyxFNkoqKGA2EJAF5yeiMzj8JJ2rcKuQwKR-w) <gltewalt (Greg T)>:
Might be

[20:33:53](#tVakryDGQCRoouBrLNlYNEgVWb1i7t0SQqUVGLSuTZw) <gltewalt (Greg T)>:
Im running to the other job right now so i cant try to check

[20:34:29](#c5ATQkqFoYm3NEXjwtq6ZYCmGOS_Pw5PcR6sjqaIz7A) <hiiamboris (NOT THIS ONE)>:
You'll hunt it down eventually Ì†ΩÌ∏â

[20:37:29](#DF7Fx4ugpGXL7fecbvETC_g4L49wCAq_NTNCJnw1Ngg) <gltewalt (Greg T)>:
Pulling from on-parse-event

## 25-Feb-2021

[0:58:48](#IWcU9PNh_MfAZ6zvlCEsjj9N1seS4UQw7H1pNajxuOc) <gltewalt (Greg T)>:
longer example
https://imgur.com/a/qIGWrVg

## 26-Feb-2021

[5:59:02](#d-rycV1yFHRAhg9Qq8v3lbWIjdL-VvtYUnAjoqSV_70) <gltewalt (Greg T)>:
Fixed it. Not an issue with on-parse-events. I was the issue.

## 1-Mar-2021

[23:00:29](#dadI4ewJjvJbr4sLwQd1KghnjnLrYofjbO5zakOpqek) <GiuseppeChillemi (GiuseppeChillemi)>:
How could I trigger 2 opposite actions on a rule, one if it succeeds and one if it does not succeeds? For example: if the element I have found is a string I want to set a word and do some code, if it is not a string I want to write "expected a string"

[23:15:51](#ZP9af84knEgxyOxpwL2isU6eQL6vz_6uWI_B71sdGHw) <greggirwin (Gregg Irwin)>:
```
blk: ["Yay!" #boo "Yay!" #{0B00}]
parse blk [
	some [
		set s string! (print 'do-do-do) 
		| set v any-type! (print ["Expected a string, but saw a(n)" type? :v])
	]
]
```

[23:25:33](#j_lcNvGz-Jo_I3kVLFvsgQ-jH5MSDCYtZEgG0zvfNh0) <GiuseppeChillemi (GiuseppeChillemi)>:
I can't actually test, is ` | set v not any-type!` possible?

[23:25:49](#ouly1RLwaHP539r8nvNb6TdSEdoejRoMVztUP04UleY) <GiuseppeChillemi (GiuseppeChillemi)>:
* I can't actually test, is ` | set v not string!` possible?

[23:38:59](#5c29yFeHQ4HnnsolnjYJRjlQVTdJuuLl7jZbkYzWGdk) <greggirwin (Gregg Irwin)>:
`Not` is great, but can be trickier to think about. You have to remember that it never advances the input. Docs also have a note that says `set` sets the word to `none` if the rule doesn't advance the input, so you can't chain `set v not ...` together and get the *next* thing. You can do it other ways, like so:
```
blk: ["Yay!" #boo "Yay!" #{0B00}]
parse blk [
    some [
        set s string! (print 'do-do-do) 
        | ahead not string! set v skip (print ["Expected a string, but saw a(n)" type? :v])
    ]
]
```
But then you have to ask if that's clearer. You could also create a custom typeset, and match against that. e.g.
```
not-string!: exclude any-type! make typeset! [string!]
blk: ["Yay!" #boo "Yay!" #{0B00}]
parse blk [
    some [
        set s string! (print 'do-do-do) 
        | set v not-string! (print ["Expected a string, but saw a(n)" type? :v])
    ]
]
```

[23:50:05](#lcUC2nZljaUS__uFukZtyRU6Sw6mFQk59lkfGRloMxc) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you, I will work on it. It is a technique which I thought it could be useful in situations like function's argument type checking, so you exactly know that has gone wrong and where.

[23:50:32](#9r95cvelreb3J9tcgYFOgjrDN2TpyeJwSJqdT9NIwYs) <GiuseppeChillemi (GiuseppeChillemi)>:
* Thank you, I will work on it. It is a technique that I thought could be useful in situations like function's argument type checking, so you exactly know that has gone wrong and where.

[23:53:32](#sgk8IOOsHX-5FLN-RJm2YhisnMyxnVkerp06v8MQEgo) <greggirwin (Gregg Irwin)>:
That's an interesting idea. Datatypes for func specs have always been seen as inclusive (what you want) rather than exclusive (what you don't want). The latter may be more informative in some cases, and also more automatically extensible (pros and cons there). Puts a new twist on how you think about testing too.

## 2-Mar-2021

[0:07:10](#gP2HnXBLtrJou4kparsjsvnt8-xokeH2jsEXo-CVH1s) <GiuseppeChillemi (GiuseppeChillemi)>:
Until now we have given meaningfulness to the domain of what is matched, but when something has not matched, another parallel domain arises and it is the domain of errors. Think when you parse a communication protocol and its rule fails, you want your code either to process the successful event but also do something like storing the position and content, for unmatched one, or collect all unmatching elements of multiple rules in a block... 

[0:07:30](#ZNY6K-a6PFTRd58x2sXQqMfyf9S3nvEJhxmg8qo_3DU) <GiuseppeChillemi (GiuseppeChillemi)>:
* Until now we have given meaningfulness to the domain of what is matched, but when something has not matched, another parallel domain arises and it is the domain of errors. Think when you parse a communication protocol and its rule fails: you want your code either to process the successful event but also do something like storing the position and content, for unmatched one, or collect all unmatching elements of multiple rules in a block... 

[0:08:06](#ye_3yj2KYPDkqCO-K3oDt2lWx-DbVnNNMR6_GPDnsW4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Until now we have given meaningfulness to the domain of what is matched, but when something has not matched, another parallel domain arises and it is the domain of errors. Think when you parse a communication protocol and its rule fails: you want your code either to process the successful event but also do something like storing the position and content, for unmatched one; also, for other rules, you may want to collect all unmatching elements in a block... 

[0:12:30](#ym3B-DYOmTG4QuVxPI1WuyImciAs72CGhOB-RFeT8kw) <greggirwin (Gregg Irwin)>:
Yes, you'll see more of my thoughts on this in the near future.

[0:13:51](#6q-5kQvJaIEsk_0xxr0Hauboj1eEpDYsEzMxG1N8IyE) <GiuseppeChillemi (GiuseppeChillemi)>:
Waiting to read all your thoughts! Goodnight!

[0:43:30](#9QCIJPne3w0XGqHU4Slb6hfHgLFQI6vYBeEdzib1JUU) <GiuseppeChillemi (GiuseppeChillemi)>:
Can't sleep:

Its simpler that we think: 

```
blk: ["Yay!" #boo "Yay!" #{0B00}]
parse blk [
    some [
        set s string! (print 'do-do-do) 
        | set v any-type! (print ["Expected a string, but saw a(n)" type? :v]) 
    ]
]
```

Expressed linearly the alternate rule matches everything which has not been matched in the first rule. 

[0:44:20](#-083yxoYTjPiTtUlQVrGAgRiZForYAosRq4Awr3jCpo) <greggirwin (Gregg Irwin)>:
Ummm, isn't that what I posted originally? ;^)

[0:45:29](#XauYo1-Cf6TkWGU46TDPaILMa7owOXE5ERamQpp6iaA) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, we just miss: `not-string!: exclude any-type! make typeset! [string!]`

[0:46:25](#EiDCpeiePC4AV8bIqYyGsa95BFSk9-OsgDCNvf3W084) <greggirwin (Gregg Irwin)>:
‚òù [here](https://gitter.im/red/parse?at=603d75a695e23446e4074b3c)

[0:46:26](#mnEF1dXkh4f7gYqwowxZbVvt8gbXLxkXqIUzDFQsxqs) <GiuseppeChillemi (GiuseppeChillemi)>:
And please, I feel ashamed to ask this simple thing but why you check the type with get notation? `type? :v`

[0:47:00](#4bSqDnFprm5aBrTkjCh0XQCEwspvMNznIqGrT8QLSfs) <GiuseppeChillemi (GiuseppeChillemi)>:
> ‚òù [here](https://gitter.im/red/parse?at=603d75a695e23446e4074b3c)

Ok, I NEED to sleep! Bye!

[0:47:11](#P8HB40vLab072tQfnNei4ZyAQG8w27-le5dUdQUDIx8) <greggirwin (Gregg Irwin)>:
Since it's a block it could contain "active" values like functions, which we don't want to evaluate in this context.

[0:47:18](#BmV6MG0DPSSOf950qPorLD-SP68K70iIyQop_RrEi5k) <greggirwin (Gregg Irwin)>:
* Since it's a block it could contain "active" values like functions, which we don't want to evaluate in this scenario.

[9:07:34](#1FZA0wNqBd3XRSMBRiS59bh39ffAAXrGsF8nrTw8iXM) <toomasv>:
It's even simpler:
```
    some [
        set s string! (print 'do-do-do) 
        | v: (print ["Expected a string, but saw a(n)" type? :v/1])
    ]
```

[9:09:23](#-GQlpiDV1PVh_JqEGpsMugUzvuALlSdQP-WGbhKlGak) <toomasv>:
BTW in `ahead not` `ahead ` is superfluous. Use just `not` if you need negative lookahead.

[9:15:42](#GAULPxJUpYNrWBXYavh7segX3UYt6SLNn5KUnp9CCiM) <toomasv>:
> why you check the type with get notation?

You might have a function in input, e.g.:
```
>> parse reduce [func [a][print a]] [set v skip (print type? :v)]
function
== true
>> parse reduce [func [a][print a]] [set v skip (print type? v)]
*** Script Error: v is missing its a argument
*** Where: v
*** Stack: v  
```

[9:16:09](#1DNLw8UJumB_gkmdRYNtm15HLcj1qenkRu9sU64RJUg) <toomasv>:
* > why you check the type with get notation?

You might have a function in input, e.g.:
```
>> parse reduce [func [a][print a]] [set v skip (print type? :v)]
function
== true
>> parse reduce [func [a][print a]] [set v skip (print type? v)]
*** Script Error: v is missing its a argument
```

[10:26:24](#NxtvVVOV7MJ4_M8t0ZJR3j0yQFzkyFeqf_l5e7hZynQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Thanks you, I make this error often because of a phenomenon of expansion of the concepts I was using to the other elements: I was thinking about inactive values that get reduced, then I also see the functions as inactive values that get reduced, forgetting they are active ones. I have learned that's part of the way I work, so I ask for an explanation because I know that simple thing could block me and I should not be ashamed to ask.   O:-) 

[10:27:15](#uiZzEZcz8tVNZyZJ4QcNl_IEuYtyXGdy6u77MwJgyFo) <GiuseppeChillemi (GiuseppeChillemi)>:
* Thanks you, I make this error often because of a phenomenon of expansion of the concepts I was using to the other elements: I was thinking about inactive values that get reduced, then I also see the functions as inactive values that get reduced, forgetting they are active ones. I have learned that's part of the way I work, so I ask for an explanation because I know that simple thing sometime could block mind and I should not be ashamed to ask.   O:-) 

[10:27:34](#pnClwkKIZpWfsEtV625hvqmlVUE3--InvgIW6xiMJOQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* Thanks you, I make this error often because of a phenomenon of expansion of the concepts I was using to the other elements: I was thinking about inactive values that get reduced, then I also see the functions as inactive values that get reduced, forgetting they are active ones. I have learned that's part of the way I work, so I ask for an explanation because I know that simple thing sometime could block me and I should not be ashamed to ask.   O:-) 

[16:25:11](#wxdOXCNA2KBdoveJYLMh73WKuccbx9CRcNfNJNu4li0) <greggirwin (Gregg Irwin)>:
Thanks for the addenda and errata @toomasv. :+1:

[16:25:45](#-paoyr0wielGj1-kikA5-oiQhzxjYtv1zqLtQzn-VFY) <greggirwin (Gregg Irwin)>:
Never be ashamed. :^)

[16:29:09](#AAJv7i8xp-aTln7yeYWP2VSwkNd6vnvRg-aJIiAAO2g) <toomasv>:
Ì†ΩÌ∏≥ 

[17:24:44](#fZ6Na6HyXxfY4v2t8355pX7oAS9FtINasAbYEgOYo8g) <GiuseppeChillemi (GiuseppeChillemi)>:
> Never be ashamed. :^)

Never, ever!

[18:05:29](#Ts6pAsAcmap1CC5CxGsyPLuqWiUfT0_BIwCWuWzkKuk) <gltewalt (Greg T)>:
I'm frequently ashamed :-)

[19:15:00](#7nnwo3ZoXul96v0E7lI7dVTvSyjC6x3DuTrK-kutQUk) <GiuseppeChillemi (GiuseppeChillemi)>:
Programmers are often sensitive people because higher intelligence is associated with higher perception and reaction, but we are not so good at managing them!

[19:15:14](#ate0VH5AY5m7LC56W_V7I-z09S11uI3FfPIo4PxPRcw) <GiuseppeChillemi (GiuseppeChillemi)>:
* Programmers are often sensitive people because higher intelligence is associated with higher perceptions and reactions, but we are not so good at managing them!

## 3-Mar-2021

[0:19:48](#aGxn9NNprFf5VGjV4jpssb2Sohhsn1_UAW7kZQcsZ7U) <gltewalt (Greg T)>:
I dont consider myself a "real" programmer 

[2:02:04](#rByFFMR8EcwFGHH7cX6GNKTNzibeZNhDfl-RqcW1oGI) <gltewalt (Greg T)>:
I think this is ready for others to test out . If you're willing, I'd be happy to get the feedback.
https://github.com/gltewalt/parse-caddy

[5:06:04](#ccraxTJb0bY5lbMAGMgYPBHTIdirrUib3mWr_2MXPdg) <toomasv>:
@gltewalt Nice work, congratulations!

[5:48:46](#m3RyFiuasjZMn8ZLf_IWMxGJawfJY_2Poa9ZFfEerKk) <greggirwin (Gregg Irwin)>:
Thanks for posting @gltewalt ! Nice mascot. :^) I will check it out soon.

[6:05:55](#zxt91eQWG3emJEHlRobja0G5z9vmqVx864QXzZ9mW0Y) <gltewalt (Greg T)>:
Ì†ΩÌ∏ä  I hope it's ok for completed v1 

[9:20:02](#FjbbMShvtJZmgIO8co9mLfNkSfhOt4N1-c6R7kF1SPM) <hiiamboris (NOT THIS ONE)>:
I'd like such tool to remember start and end of every match. Then when I select one char/value or more, it would highlight in green parts of the rule that matched this whole selection, and in red - parts that tried to match it but failed. Or smth like that :)

[18:16:23](#4eKW3yjvSKzM9DD09o4lTA0c7q6PzyoMOymyRM6Xgao) <gltewalt (Greg T)>:
like, copy the selected input and pass it to parse/trace?

[18:19:52](#hNp6oHnFMNbuLwTqE_X2pyBO5pvS0t9d7y40atp67rg) <gltewalt (Greg T)>:
I need to learn rich-text .  Right now the highlight color when text is selected isn't showing itself, for some reason

[18:58:09](#hBDMzUQ6y-LI2MZ2PTEQnylTe3bzFvsKQYoWCCXPXdg) <ne1uno (ne1uno)>:
a log area might be nice, push results and traces

[23:01:45](#dpMglOCygDCzKL5aekNKroGw_LOIrOUNyqatocWwwEs) <gltewalt (Greg T)>:
Log files, or just text to a panel?

[23:25:47](#92J8Llmo3L1cOgUsNpUsS3JoE_WUHW3yGLkZQxHypOg) <ne1uno (ne1uno)>:
just to an area that could be copied from.  I usually add a limiter so the log does't keep growing

[23:25:47](#FdhcLScaK9S4WgLR5MV4O1JNyebyPx2luwbxVFcfHzs) <ne1uno (ne1uno)>:
`log-area/text:  copy/part rejoin [form count etc other-f/text "**" newline  log-area/text] 28000`

## 5-Mar-2021

[9:44:35](#w0NnXo283Hi18_xga5EwTpqkeF7c8iM4_7qELoyye_0) <bubnenkoff (Dmitry Bubnenkov)>:
I have got next data structure:
```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [name: "bananas"]
	]
]
```

I need to make every child know `id` of it's parent. So result should be like:
```
data: [
	id: 123
	lots: [
		id: 123
		lot: [id: 123 name: "apple"]
		lot: [id: 123 name: "bananas"]
	]
]
```

At first step I want to learn how to collect root `id`. But I can't understand how to take it's value with parse. I tried:
```
parse data rule: [some [ set b if (b = quote id:) ahead set c integer! | ahead block! into rule | skip]] 
```

But it's seems that `ahead`  not suitable for. Also I tried to do some magic with checking value `skip`ing it and reasigning `b`:
```
parse data rule: [some [ set b if (b = quote id:) skip set b integer! | ahead block! into rule | skip]]
```

But it's also not working.

[9:54:10](#_j7dbXWz1A90eFtNddw7yBNkpOevTPttXmqyDu_OMLQ) <bubnenkoff (Dmitry Bubnenkov)>:
Wow! This rule is working:
```
parse data rule: [some [ set b quote id: ahead [ set b integer! ] | ahead block! into rule | skip]] 
```
Am I right understand that ahead with subrule do collect value?

[9:59:35](#AtsvOOv3jNEX_07VIJgy2zY_0QrzYpWh3z3feyap9P0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`ahead` checks the rule and rewinds. `set`, `copy` and `keep` work as usual. You can argue that they shouldn‚Äôt and I probably would agree with you.

[10:00:12](#5An71PuJzp8DDLwfOvssCh6pAjswJix51b4HnHG74fs) <rebolek (Boleslav B≈ôezovsk√Ω)>:
OTOH I can imagine situation where it makes sense.

[10:01:57](#bTNvrid95EkNMysbsHA0Gamx4kDlNOkqeACAxqTEjDU) <bubnenkoff (Dmitry Bubnenkov)>:
Is it's good idea to use `skip` (`set b skip `):
```
parse data rule: [some [ set b quote id: ahead [ set b skip ] | ahead block! into rule | skip]] 
```
if it's does not matter what type I should collect?

[10:02:56](#vTeq_sYHjY2t7FCEJHJ0O_qWR1WRKxfl_Kgdv4m-q64) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Yes, I don‚Äôt see a problem there. If you know what to expect there and don‚Äôt need to check for validity, then `skip` is good enough (and faster).

[10:38:13](#46GXLdPbWNUV2WnvOMAeXj2yp8ctACfYCjWMI_Pzee0) <bubnenkoff (Dmitry Bubnenkov)>:
How to insert value in block?
```
>> b: []
== []
>> parse [b] [insert 44 block!]
```

I am expecting to get `b: [44]`



[10:53:11](#i-XI9YiAwq7B99KaJ_QPn4VIlDBsMCtNWNBxzD_Qh6s) <rebolek (Boleslav B≈ôezovsk√Ω)>:
```
>> parse reduce [b] [into [p: insert (44)]]
== true
>> b
== [44]
```

[10:55:10](#5BQ3OOUjoj6dRBT0ORTwKXUALhd-4ybxHGk_X5zrIv0) <bubnenkoff (Dmitry Bubnenkov)>:
is it possible to do without reduce? I will need to mix insert with code above....

[10:56:01](#dibqhdOlyytENkkN1arJKdY0iS1fD4nsOe4twiNoRFk) <toomasv>:
This
```
parse [b] [ahead word! s: (if block? s': get/any s/1 [insert s' 44])]
```
or this
```
parse [b] [ahead word! s: skip (if block? s': get/any s/1 [insert s' 44])]
```

[10:56:31](#TI0CWHcivli-g7pAHtMCI7xugy02Wg3BTLi5o2nNl5M) <toomasv>:
* This
```
parse [b] [set s word! (if block? s: get/any s [insert s 44])]
```
or this
```
parse [b] [ahead word! s: skip (if block? s': get/any s/1 [insert s' 44])]
```

[10:56:36](#0rmQB7qvgJRYsJVJwdX6OnSfh3N6ubi_ZHr5mSuSzXw) <bubnenkoff (Dmitry Bubnenkov)>:
oh thank!

[10:58:59](#8A8D8SEEtiawnvlg_p-XLbCRDY3vg7QMR9sn66CuDxQ) <toomasv>:
better 
```
parse [b] [set s word! (if block? s: attempt [get s] [insert s 44])]
```

[10:59:41](#qKVpim6vhuIZJsGNzbPPU5JmJxCKJeoAz7Yy10zTtXI) <bubnenkoff (Dmitry Bubnenkov)>:
but if I am sure that it's block I can drop checking? 

[11:01:11](#faszIsgen8GyY8mrsdya3JpUTsQKNBuU8t-uQU97kOQ) <toomasv>:
Then you can do even
```
parse [b] [set s word! (insert get s 44)]
```

[11:01:55](#jRbPjFCAaCU76pNL4tsS6ru2eNs-c9MDU38P6Ub2-To) <bubnenkoff (Dmitry Bubnenkov)>:
cool! thanks!

[11:01:58](#1qJDimgsLzLSVx1nytDEe3N_6vzBWSGtI-6QH_Dt1G8) <toomasv>:
or 
```
parse [b] [s: skip (insert get s/1 44)]
```

[11:13:14](#OoUAM20eQyIJ09Q1nZz4X9XOXkWmnLvogZZdWYLbGUc) <bubnenkoff (Dmitry Bubnenkov)>:
@toomasv  I tried to mixed all code together but it do not work:
```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [name: "bananas"]
	]
]		
		
parse data rule: [
		some 
			[ set b quote id: ahead [ set b skip ] | ahead block! s: skip (insert get s/1 44)  into rule | skip]
		] 	

probe data
```

I expected that it will insert 44 in every new block, but iit does not

[11:13:59](#uyGPmQTkwZ9fSgzdC8QqNY90sgCS3buumjsoL0PVebI) <toomasv>:
```
parse data [
	quote id: set id skip (probe id)
	quote lots: into [some [quote lot: s: skip (insert s/1 compose [id: (id)])]]
]
```
or 
```
parse data [
	any [
		quote id: set id skip
	|	set-word! ahead block! into [
			any [set-word! set block block! (insert block compose [id: (id)])]
		] 	
	]
]
```

[11:15:02](#VIS2neFOt_eRnbA8aBIPiuvvqLohqkSUQVutRwQVYQ8) <bubnenkoff (Dmitry Bubnenkov)>:
wow!!! Thanks!!!

[11:15:47](#AiitcLx2tg_UzdQIpspNGuuVtqZ_jw5Cbw6NNwTz6vw) <toomasv>:
Ì†ΩÌ∏Ñ

[11:17:42](#HE53JH7HVCAhH-K87mS4QjsK5ngnv1Yt9xyP6CW5dhU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Now I will study the above few lines of code for one week and hope I get a clue, what it does :-)

[11:20:32](#vryxFR8EZorRyt6DJV7z7PANUIDxYbqbT7rX27dqTjE) <bubnenkoff (Dmitry Bubnenkov)>:
Yeah!! I mixed Toomas solution with my (I understand my code better):
```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [name: "bananas"]
	]
]		
		
parse data rule: [
		some 
			[ set b quote id: ahead [ set b skip ] | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip]
		] 	

probe data

>> probe data
[
    id: 123 
    lots: [id: 123 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123 name: "bananas"]
    ]
]
```

[11:21:30](#ZKzA1crSp98SkF1HV5dnLAhrx9JU8yREfHkSfGM5BzQ) <bubnenkoff (Dmitry Bubnenkov)>:
It's interesting that adding `skip` insert `id` only in first level of child:
```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [name: "bananas"]
	]
]		
		
parse data rule: [
		some 
			[ set b quote id: ahead [ set b skip ] | ahead block! s: skip (insert s/1 compose [id: (b)]) into rule | skip]
		] 	

probe data
```

[11:35:19](#XH5Jw75dLg04wv876tBEgl6t-6S50-fS0o4DSWCB-NI) <bubnenkoff (Dmitry Bubnenkov)>:
@toomasv could you explain what are you doing with this:
```
set-word! set block block! 
```

[11:40:21](#5FfdyeXKAlRSuplyoM0XHvFf8cxCvxIcKqfM6e2_CTQ) <toomasv>:
After a set-word! it sets a word `block` to the following `block!` value.
Ok, here's another
```
parse data rule: [
    some [s: 
	  quote id: set b skip 
	| if (head? s) insert (quote id:) insert (b) 
	| ahead block! into rule 
	| skip
	]
]     
```

[11:40:56](#yN-9xS8i1XP4TRvQOQaowk7qITzrBfUsFSSrB5jnYPY) <toomasv>:
* After a `set-word!` it sets a word `block` to the following `block!` value.
Ok, here's another
```
parse data rule: [
    some [s: 
	  quote id: set b skip 
	| if (head? s) insert (quote id:) insert (b) 
	| ahead block! into rule 
	| skip
	]
]     
```

[11:51:16](#YwOG-QnJ66hlUA1TSrJ2xwVRIOvLZZui_xPD6YCzTkI) <bubnenkoff (Dmitry Bubnenkov)>:
thanks! Could you also explain why with `skip` it's process only first level child and do not go deeper (code above)

[11:51:35](#36DodnO2v68RyP0c_IbFD6BP0ACg22hWByJvguz2LQo) <toomasv>:
In your rule above:
```
set b quote id:         ; `set b` is unnecessary here
ahead [ set b skip ] ; `ahead` is unnecessary here
| ahead block! s: 
  skip (insert s/1 compose [id: (b)]) ; here you skip over block and fail to enter it
  into rule 
| skip
```
So sthe following rule does it without unnecessary clutter:
```
quote id: set b skip | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip
```

[11:52:55](#7mrfSakM_NDaGvGzWONwBOUcDgkRs-LZugOUoWE5pcE) <toomasv>:
* In your rule above:
```
set b quote id:                               ; `set b` is unnecessary here
ahead [ set b skip ]                      ; `ahead` is unnecessary here
| ahead block! s: 
  skip (insert s/1 compose [id: (b)]) ; here you skip over block and fail to enter it
  into rule 
| skip
```
So sthe following rule does it without unnecessary clutter:
```
quote id: set b skip | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip
```

[11:53:07](#qaxrZ8aqvaUHtKQOpuOLdPZ5BFzW6CfuBDiJxjAN4gg) <bubnenkoff (Dmitry Bubnenkov)>:
> After a `set-word!` it sets a word `block` to the following `block!` value.
> Ok, here's another
> ```
> parse data rule: [
>     some [s: 
> 	  quote id: set b skip 
> 	| if (head? s) insert (quote id:) insert (b) 
> 	| ahead block! into rule 
> 	| skip
> 	]
> ]     
> ```

this look very cool!

[11:53:09](#AICaTRjUOOFmwrJZ_qveAL3T-eDTOHaSA1UYLL4hHR8) <toomasv>:
* In your rule above:
```
set b quote id:                         ; `set b` is unnecessary here
ahead [ set b skip ]                  ; `ahead` is unnecessary here
| ahead block! s: 
  skip (insert s/1 compose [id: (b)]) ; here you skip over block and fail to enter it
  into rule 
| skip
```
So sthe following rule does it without unnecessary clutter:
```
quote id: set b skip | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip
```

[11:53:18](#x6-JNnE-2UHqHaofRojAZog1cO16iwBeQQs0C4lcDt8) <toomasv>:
* In your rule above:
```
set b quote id:                       ; `set b` is unnecessary here
ahead [ set b skip ]                  ; `ahead` is unnecessary here
| ahead block! s: 
  skip (insert s/1 compose [id: (b)]) ; here you skip over block and fail to enter it
  into rule 
| skip
```
So sthe following rule does it without unnecessary clutter:
```
quote id: set b skip | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip
```

[11:54:31](#NbuLIFFqCKJPX0WqBKyJFlD2Dyt4E9DVax0f3FNzdNA) <toomasv>:
* In your rule above:
```
set b quote id:                       ; `set b` is unnecessary here
ahead [ set b skip ]                  ; `ahead` is unnecessary here
| ahead block! s: 
  skip (insert s/1 compose [id: (b)]) ; here you skip over block and fail to enter it
  into rule 
| skip
```
So the following rule does it without unnecessary clutter:
```
quote id: set b skip | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip
```

[11:54:43](#wXMiqCUmKGiX2SYZL6U9GLh2PlCVwyFVo4HZMse4z0w) <toomasv>:
* In your rule above:
```
set b quote id:                       ; `set b` is unnecessary here
ahead [ set b skip ]                  ; `ahead` is unnecessary here
| ahead block! s: 
  skip (insert s/1 compose [id: (b)]) ; here you skip over block and fail to enter it
  into rule 
| skip
```
So, following rule does it without unnecessary clutter:
```
quote id: set b skip | ahead block! s: (insert s/1 compose [id: (b)]) into rule | skip
```

[18:27:19](#Tpt9eBGzeDF-aTMZR1J83vvkEyR_Ww3e92RK8WZEDfs) <bubnenkoff (Dmitry Bubnenkov)>:
Why `Hello` never don't printing?
```
parse data rule: [
    some [s: 
		quote id: set b skip 
		| if (head? s) insert (quote id:) insert (b) (print "Hello")
		| ahead block! into rule 
		| skip
    ]
]
```

[18:29:50](#aTxe4nZgd-btnLRXGblCpYtLdmc9yI9jhFIQDrKU1qc) <hiiamboris (NOT THIS ONE)>:
It does for me

[18:33:00](#BAA3p6O7XCYrBVvSa3BqVQAXIuHk3Hn49MKdsEaow1Q) <bubnenkoff (Dmitry Bubnenkov)>:
Oh, sorry, strange. One moment I will check  in fresh console

[18:33:56](#qD0CjF8IlHk2de5KYLv1DYZMbXH2RoWf9c9ORgDA8eg) <bubnenkoff (Dmitry Bubnenkov)>:
yes, sorry! I did not understand the reason I got this issue

[18:41:37](#VuyB2owd2bAU9ofCGTjVrT2CZlBmkfBW4dMTK7p3IGI) <bubnenkoff (Dmitry Bubnenkov)>:
```
data: [
    id: 123 
    lots: [id: 123 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123 
            name: "bananas"
        ]
    ]
]
```

with this data it's not printing:
```
parse data rule: [
    some [s: 
		quote id: set b skip 
		| if (head? s) insert (quote id:) insert (b)  (print "Hello")
		| ahead block! into rule 
		| skip
    ]
]
```


[18:42:49](#fVKVmourOG78gIIlm5Lyob-32p-2aETozvBB3Qo0W0M) <bubnenkoff (Dmitry Bubnenkov)>:
* ```
data: [
    id: 123 
    lots: [id: 123 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123  name: "bananas"    ]
    ]
]
```

with this data it's not printing:
```
parse data rule: [
    some [s: 
		quote id: set b skip 
		| if (head? s) insert (quote id:) insert (b)  (print "Hello")
		| ahead block! into rule 
		| skip
    ]
]
```


[18:42:56](#APTKkLdNp5RDzzsxrohCd7iChVvmgD5qDaDO84mKYS0) <bubnenkoff (Dmitry Bubnenkov)>:
* ```
data: [
    id: 123 
    lots: [id: 123 
        lot: [id: 123 name: "apple"] 
        lot: [id: 123  name: "bananas" ]
    ]
]
```

with this data it's not printing:
```
parse data rule: [
    some [s: 
		quote id: set b skip 
		| if (head? s) insert (quote id:) insert (b)  (print "Hello")
		| ahead block! into rule 
		| skip
    ]
]
```


[18:49:42](#To43SZQQGTS38Vo1ZCC2EKdf82gvbm1bxtSxNiQ6hR0) <toomasv>:
It doesn't print "Hello" because you neve happen to be in head of block with these data.

[18:49:49](#ouBEMrN412zkU6rQKzPYRdg0_YVdRvk7xKK0LD8UzUw) <toomasv>:
* It doesn't print "Hello" because you never happen to be in head of block with these data.

[18:50:24](#Cd59cPufVIYRKG3zbBtXQmvjm4Jn4gttMmv3AW8mgII) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@bubnenkoff because you have skip in the first rule
```
parse data rule: [
    some [(print "will set s") s: 
        quote id: set b skip (print "RULE1")
        | if (head? s) insert (quote id:) insert (b)  (print "RULE2")
        | ahead block! into rule (print "RULE3")
        | skip (print "RULE4")
    ]
]
```

[18:51:02](#Ekv5WhYDn2hjCdd1q1z_wJpwOFnAuJniRKIKbj4fWdA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @bubnenkoff because you have skip in the first rule
```
parse data rule: [
    some [(print "will set s") s: 
        quote id: set b skip (print "RULE1 DONE")
        | if (head? s) insert (quote id:) insert (b)  (print "RULE2 NEVER DONE")
        | ahead block! into rule (print "RULE3 DONE")
        | skip (print "RULE4 DONE")
    ]
]
```

[18:51:16](#NcGXwLYHegg3FzEGQrakh_AWt_xmaFrsjG9TvFmGjb4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @bubnenkoff because you have skip in the first rule
```
parse data rule: [
    some [(print "will set s") s:   quote id: set b skip (print "RULE1 DONE")
        | if (head? s) insert (quote id:) insert (b)  (print "RULE2 NEVER DONE")
        | ahead block! into rule (print "RULE3 DONE")
        | skip (print "RULE4 DONE")
    ]
]
```

[18:51:34](#BxCz24qJceQvcwC4oDnZkKuxOP3x7o8uAUwXQKpSUa4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @bubnenkoff because you have skip in the first rule
```
parse data rule: [
    some [
        (print "will set s") s:   quote id: set b skip (print "RULE1 DONE")
        | if (head? s) insert (quote id:) insert (b)  (print "RULE2 NEVER DONE")
        | ahead block! into rule (print "RULE3 DONE")
        | skip (print "RULE4 DONE")
    ]
]
```

[18:51:49](#K_vpRQrfc9Rhk4VcEiL_TY20Xx0EsG_HO6m5G51_cjU) <greggirwin (Gregg Irwin)>:
@gltewalt nice work on Parse Caddy. It's very close to what I'm working on now, as an interactive approach. I do get this error when clicking Parse Block Values:
```
*** Script Error: reset-field has no value
*** Where: act
*** Stack: context view do-events do-actor do-safe 
```
Should it consider success that any rule matches, or based on `parse`'s result? e.g. with "a,b,c" as input `to #","` passes but `some [thru #","]` doesn't.

[18:51:57](#dlEdUr9cWIRQCnVb22flna4GXfAAxPvxDQfnkqFHOTM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @bubnenkoff because you have skip in the first rule
```
parse data rule: [
    some [
        (print "will set s") s: quote id: set b skip (print "RULE1 DONE")
        | if (head? s) insert (quote id:) insert (b)  (print "RULE2 NEVER DONE")
        | ahead block! into rule (print "RULE3 DONE")
        | skip (print "RULE4 DONE")
    ]
]
```

[18:54:06](#qF2DM6rztMxlTjJUeB6eQpKOx5pWx37-qYckDySPE6Y) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@bubnenkoff is there any reason why you don't have the hello out of the `some` block?
```
parse data rule: [
	insert (quote id:) insert (b)  (print "HELLO")
    some [
        (print "will set s") s: quote id: set b skip (print "RULE1 DONE")
        | ahead block! into rule (print "RULE3 DONE")
        | skip (print "RULE4 DONE")
    ]
]
```

[18:54:26](#DdM9UpUn0R9a_zwapVm8juPRsMnG6iDI-OmRvvRdyWY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* 

[18:56:16](#EjsMkpooYhkXs0b-NCM9_L2MD6BF7Y8b6U_aFi8QQas) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@bubnenkoff why you want to do something like that? If it would be processed, you would get into infinite loop!

[18:57:09](#C1ANdqFdu1aNMtFKQh7ezkv5QnluY6EzywBBryJ-vIw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @bubnenkoff why you want to do something like that? If it would be processed, you would get into infinite loop!
You may try replacing `(head? s)` with `(2 = length? s)`

[18:57:36](#BIhAG3x6F70TiI0gEkibz3cv5DnAl__vz3grwqRrzbo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @bubnenkoff why you want to do something like that? If it would be processed, you would get into infinite loop!
You may try it by replacing `(head? s)` with `(2 = length? s)`. But you will have to kill the console!!!

[19:01:02](#N-hvUzgWE8Edqndj8M5gR_pyMkHf_Jw5bDTNvNzY0Co) <bubnenkoff (Dmitry Bubnenkov)>:
Oh! Infinity loop! I am just experimented! 

[20:39:36](#MeNhThkrF2HK_FR4rn7WZCE_V4vO-YMyb__7SSqwTSk) <gltewalt (Greg T)>:
@greggirwin  ill  look at it this evening.  As far as tirn green on a match vs green on parse returning true... im not sure.

[20:54:47](#cRpCvRrs1yibhRpqMQ5tZ7JLcXLa0ZfF4YQUYeRkvew) <gltewalt (Greg T)>:
Turning green

## 6-Mar-2021

[0:22:41](#GWhJvObtn0qiro5s1izbvcV-OrVohT3XqlnMKCyz5yo) <gltewalt (Greg T)>:
@greggirwin  that's weird, because `some [thru #","] does match. It jsut doesn't turn green. `some [to #","]` does turn green.

[0:22:53](#m2pPJhtvfE6B_erf7ONyUqxLUHlmjpvrmvsaDo8kcuM) <gltewalt (Greg T)>:
* @greggirwin  that's weird, because `some [thru #","] does match. It just doesn't turn green. `some [to #","]` does turn green.

[0:41:06](#5CFuk-QrDp6u0yaAfU7-dG25ba_KVpiZy19QaUgMbGU) <greggirwin (Gregg Irwin)>:
Right. 

[0:57:40](#4Jxxh7nMXVa7RlF9UfVV2H1A8v1i8H2uyixQqbOYy1Y) <gltewalt (Greg T)>:
Oh, I see why

[1:35:22](#you4R7ykKIe4cxJdcQaAm-HdT-t4kzGALeVdImRCraY) <gltewalt (Greg T)>:
Could do it this way
https://imgur.com/a/NKn2qoc

[1:44:20](#p8MPShqgM-P0UPs0KxRliLaH2SPg4lP7QNPSnp2PRLA) <gltewalt (Greg T)>:
Or highlight the match position in the Input field, and turn color in the rule field.

[1:45:51](#M4OiAq1tvuop8FAAE6Of9MR708BxeGwOtCdWHTu7_pg) <gltewalt (Greg T)>:
Speaking for myself as a parse novice - I'm more interested in seeing if something matches and then doing something with that match, than I am interested in whether parse reaches the end of the input or not

[3:42:35](#07urBsYctAjr9lxHoWvgW-lDAm3VZnnh6glY_EYcjMQ) <gltewalt (Greg T)>:
One known issue is that if you use insert, it inserts until `match?` is false - which means the whole time you're hitting backspace, for instance

[3:44:55](#faZXpT-2uGt3zjIN3Pnco-WpUZn0iQjF6_7enkxsu_8) <gltewalt (Greg T)>:
* One known issue is that if you use insert, it inserts until `match?` is false - which means the whole time you're hitting space or typing the next part of the rule

[3:47:48](#ikXzOdVbKTj4p-LacYVXLieXw9h8K32qyHXca5ilnlw) <gltewalt (Greg T)>:
https://imgur.com/a/GhpkEvM

[3:48:16](#1y8b8Ll3Ysq2kKn5fpJRLmYF1BMViadex2IsmfNYNfI) <gltewalt (Greg T)>:
Not sure how to fix that, but I fixed the other stuff

[8:47:51](#Tlwjh-HGpYwcJy-cCno3TsY4CTzrYQCb17nAyXFV2LM) <hiiamboris (NOT THIS ONE)>:
One more thing. Parse is often expressed as a set of named rules. Such tool should be able to help trace in which rule the match stuck or never succeeded.

[15:53:26](#twMv0Lm87hGEftODAvK3IG-SI1e1RXfmOKJ7wwmD21M) <gltewalt (Greg T)>:
My intent was to have a tool that helps you see what is going on for "a" parse rule.  

[15:54:09](#S_bd_8lK1yqOd8jDglrZOFCpvjypJyMqv4NtHuM96gU) <gltewalt (Greg T)>:
Beginners in mind. 

[15:57:19](#Gd8j0hBt-56ZLnTkfNQyLfC9JBQVbiJKgj1WANb0Vw4) <gltewalt (Greg T)>:
Something for me to think about, though

## 8-Mar-2021

[2:34:11](#doPqEFi78wV0urjTBsZ7h7XHVJZNaqUkzWO9z-DwC58) <gltewalt (Greg T)>:
Not exactly safe input, but making a little more progress.
https://imgur.com/a/x10MYK7

[2:52:29](#9Cs-mdbVvDCBiAHsPhBdSQkIAswF4LK7AY9hZxu5zuk) <gltewalt (Greg T)>:
https://imgur.com/a/gF1VXZy

## 9-Mar-2021

[11:49:51](#-vRtmskfIgd9a4uheS5LFCRcfQOtmM4iHeJBeJDU0XY) <bubnenkoff (Dmitry Bubnenkov)>:
@toomasv is there any nice way to measure nesting level? 
```
data: [
	id: 123
	lots: [
		lot: [name: "apple"]
		lot: [
			name: "bananas"
			obj: [ price: 44 ]
			]
	]
]		
		
; count: 0		
parse data rule: [
    some [s: 
		quote id: set b skip 
		| if (head? s) insert (quote id:) insert (b) 
		| ahead block! into rule 
		| skip
    ]
]

```
For example I want to add id only on third level. But common task is measuring of levels 

[12:39:07](#CslEqEj74kwUqUOKzkRLOhzOsLxRrJiObX6QvfA4Y4I) <toomasv>:
@bubnenkoff E.g.:
```
level: 1
id-level: [2 3] ; or just int

parse data rule: [
    some [s: 
        quote id: set b skip 
        | if (all [find id-levels level head? s]) insert (quote id:) insert (b) 
        | ahead block! (level: level + 1) into rule (level: level - 1)
        | skip
    ]
]
```
If you don't need to insert into several levels, use just `level = 3` or `level = id-level`. 
If you need ranges of levels, then you need to adjust comparison.

[12:39:29](#VJWO-sbSG01PezaWfQ_N7czZ8FNDENzY-SgzIAR5JHY) <toomasv>:
* @bubnenkoff E.g.:
```
level: 1
id-level: [2 3] ; or just <int>

parse data rule: [
    some [s: 
        quote id: set b skip 
        | if (all [find id-level level head? s]) insert (quote id:) insert (b) 
        | ahead block! (level: level + 1) into rule (level: level - 1)
        | skip
    ]
]
```
If you don't need to insert into several levels, use just `level = 3` or `level = id-level`. 
If you need ranges of levels, then you need to adjust comparison.

[12:43:57](#DhlB5bgj20IaDx56ENFt-wzWW6E_9K6zDxuMnTHCn5U) <toomasv>:
* @bubnenkoff E.g.:
```
level: 1
id-level: [2 3] ; or just <int>

parse data rule: [
    some [s: 
        quote id: set b skip 
        | if (all [find id-level level head? s]) insert (quote id:) insert (b) 
        | ahead block! (level: level + 1) into rule (level: level - 1)
        | skip
    ]
]
```
If you don't need to insert into single level, use just `level = 3` or `level = id-level`. 
If you need ranges of levels, then you need to adjust comparison.

[12:55:22](#meuVxArBbnT_rOoHwF5FK3Nk7H7pYS7cgXR5BB3WTVs) <bubnenkoff (Dmitry Bubnenkov)>:
thank!

[12:57:52](#DDDq2x7WI75axW7JKJJRHShL7rbLJmEWwIjyCOrnBN4) <bubnenkoff (Dmitry Bubnenkov)>:
I was quite near! But stuck with this line:
```
ahead block! (level: level + 1) into rule (level: level - 1)
```
I did not expect that code after `into rule` will work, because I thought it will make jump exactly in this moment

[12:59:25](#xie_alqB_cVHHwlRWUdDpHkF84GVUwEmhk0RvB-Y5IE) <toomasv>:
Ys, it continues after exiting from `rule`, i.e. after `into rule`.

[12:59:29](#RFiL_3_2VFootkw0pOKn3Nu6jsOU6VZ3YA9Ee9kw2X8) <toomasv>:
* Yes, it continues after exiting from `rule`, i.e. after `into rule`.

[13:08:22](#GV6v2T7rLjPsw1pJQgAubgcwItxeXuA3fUdYI86vSeQ) <bubnenkoff (Dmitry Bubnenkov)>:
* Yes, it continues after exiting from `rule`, i.e. after `into rule`.

[13:14:21](#MnFBNGyJZ6kOyEikyYgkJ9Zu8cIuM7Eu1MOw1bxZSq8) <bubnenkoff (Dmitry Bubnenkov)>:
Oh! I understood!

[13:17:10](#3Te4PIUp0f5PipxMQWnOwOf-9JiZQo9KyFbweZxuOy8) <bubnenkoff (Dmitry Bubnenkov)>:
So we we do `into rule ` and after it do decrement, right? 

[13:17:33](#HOWilE7Xe-9KIpMswXPxmZjVfKGLpGjzTT69f6ApqX0) <toomasv>:
Yes

[13:17:35](#TFDPr-MJ0Rpw4N8eZ1dYCtYzMDwRWsK-EIVp8ju9aAE) <bubnenkoff (Dmitry Bubnenkov)>:
* So we do `into rule ` and after it do decrement, right? 

[18:55:13](#gn1E0XVC_Yr3o3i1l9YG8_lJ6X4syF4X_CbBjAaKlyw) <bubnenkoff (Dmitry Bubnenkov)>:
Why exclamation mark is printing only once?
```
parse [11 aa 11 bb cc] [some [ahead word! | skip (print "!") | 'cc]]
>!
```

[18:59:32](#JIVD7vVdrJmWP5t7jPU-r5bbGnNKJ0iFxwernlzq1ZI) <toomasv>:
Think it through:
```
>> parse [11 aa 11 bb cc] [some [s: (probe s) ahead word! | skip (print "!") | 'cc]]
[11 aa 11 bb cc]
!
[aa 11 bb cc]
== false
```

[19:05:18](#xgs_e90oAiJhUo9BOpSxVfivPiLm8plmPrV9EDEKrXE) <toomasv>:
* Think it through:
```
>> parse [11 aa 11 bb cc] [some [s: (probe s) ahead word! | skip (print "!") | 'cc]]
[11 aa 11 bb cc]
!
[aa 11 bb cc]
== false
```
Remember, that `ahead` does not advance.

[19:09:13](#lhgO2sqBobzzy-9v9dAqPBVeiHfCDWb--STqPHYSW2o) <bubnenkoff (Dmitry Bubnenkov)>:
At first step we are checking it `word!` is ahead, than we are doing `skip`ing. 
No we have: `[aa 11 bb cc]` 
And first rule is success but input do not advice? Right?

[19:14:49](#Cjoyzcx9bZp6cZNR7b7PmLkrLW1KVg-FfQUxuQEMLAE) <toomasv>:
Yes, on `11` first subrule fails, second subrule advances and prints `!`, in next round, parsing stops at `aa`, because subrule succeeds but doe not advance. If it would not stop it would be in infinite loop.

[19:15:14](#kLXg6Vx0G-ZLSSs5N99FucP7iBnAK3lSwJtc9CmNZn4) <toomasv>:
* Yes, on `11` first subrule fails, second subrule advances and prints `!`; in next round, parsing stops at `aa`, because subrule succeeds but doe not advance. If it would not stop it would be in infinite loop.

[19:15:28](#OXO81oKMliYjXear9O1Z08B0FcJlIXzKdXGvFdbXGpo) <toomasv>:
* Yes, on `11` first subrule fails, second subrule advances and prints `!`; in next round, parsing stops at `aa`, because subrule succeeds but does not advance. If it would not stop it would be in infinite loop.

## 10-Mar-2021

[10:33:53](#md1ECsBH9GB4GoeM9LMs6KohqWMpZcsJF4WUaQr-qlY) <bubnenkoff (Dmitry Bubnenkov)>:
Here I am trying to collect all set-words
```
 parse [a: 1 b: [name: "Mike"] c: 3] [ ahead [set-word!] set w set-word! (probe w) fail | skip  ]
```
And I can't understand why it's do not work.
`ahead `-- look ahead
`set w set-word!` set `w` to next value (next value is set-word)
`fail` should advance input to next rule.

Where I am wrong?




[10:34:06](#GtgZ_0nwolZqNZd6cnV9zg2FfzokTrv6frQPSj3_Ycc) <bubnenkoff (Dmitry Bubnenkov)>:
* Here I am trying to collect/print all set-words
```
 parse [a: 1 b: [name: "Mike"] c: 3] [ ahead [set-word!] set w set-word! (probe w) fail | skip  ]
```
And I can't understand why it's do not work.
`ahead `-- look ahead
`set w set-word!` set `w` to next value (next value is set-word)
`fail` should advance input to next rule.

Where I am wrong?




[10:39:48](#H9Em5KbELw56FQ6py7_ei5IyNlKYIxkk5HpcfDvnto0) <bubnenkoff (Dmitry Bubnenkov)>:
* Here I am trying to collect/print all set-words
```
 parse [a: 1 b: name: "Mike" c: 3] [ ahead [set-word!] set w set-word! (probe w) fail | skip  ]
```
And I can't understand why it's do not work.
`ahead `-- look ahead
`set w set-word!` set `w` to next value (next value is set-word)
`fail` should advance input to next rule.

Where I am wrong?




[10:41:17](#jCB6jb9UtpyhIPpt4ZDsPbYoTeJL_oGogeX6dijuT9c) <bubnenkoff (Dmitry Bubnenkov)>:
* Here I am trying to collect/print all set-words
```
 parse [a: 1 b: 2 name: "Mike" c: 3] [ ahead [set-word!] set w set-word! (probe w) fail | skip  ]
```
And I can't understand why it's do not work.
`ahead `-- look ahead
`set w set-word!` set `w` to next value (next value is set-word)
`fail` should advance input to next rule.

Where I am wrong?




[10:45:13](#OKZmn65qSONUqOjva0LCW4pqqzMtnu5WuijnzJnRWXs) <hiiamboris (NOT THIS ONE)>:
aren't you forgetting a loop?

[10:45:26](#x-EqEA2VAqZgDsYqZnudHU_WZOiz8VEqYIGpE6xUB_Q) <bubnenkoff (Dmitry Bubnenkov)>:
ohhh! 

[10:48:37](#KXXMNVcgDIdlE8Mki_l4l7iDqSSVpJMJoHAdLPeYRGc) <bubnenkoff (Dmitry Bubnenkov)>:
still stop at first set-word:
```
>> parse [a: 1 b: 2 name: "Mike" c: 3] [some [ ahead [set-word!] set w set-word! (probe w) fail | skip  ] ]
a:
```

[10:55:28](#hk-89_HXMEqYgc6yFolEqGSNk0uAFwGlmX-WbQvPP5A) <bubnenkoff (Dmitry Bubnenkov)>:
I dropped `fail` and it's begin to work. Could you explain why? `fail` interrup `some`?

```
 parse [a: 1 b: 2 name: "Mike" c: 3] [some [ ahead [set-word!] set w set-word! (probe w) | skip  ] ]
```

[11:06:20](#5nP8WVYLW4FGHPHHiF191xrP6N2MPOGIBUOhWIn7htA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Yes: `fail	: force current rule to fail and backtrack.`

[11:12:29](#terM1fPOPO_F-bsSqvB_5Rt0stwLFKc2xslgps0g5NA) <hiiamboris (NOT THIS ONE)>:
@bubnenkoff `[fail]` might work in place of `fail`. 
Put simply, `fail` and `reject` are a dubious design and best avoided.

[11:42:14](#GSeeC2Y3ks9zaYHN58g8SqzWeUoSDBevMPKT1NDDfb0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@hiiamboris do you have a better design idea?

[11:50:00](#EAGvt5aic-A_MDlbmCKx7FtJTa-I9Kc9N9aCGT0DN5Q) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/issues/3478#issuecomment-406884362

[11:54:36](#ZyfWCHxh2WriRN9A2BIJX6_iCN9h9Q9x8ydZZPLFqvY) <hiiamboris (NOT THIS ONE)>:
specifically for `fail`: equivalence with `not none` or `end skip` is proposed

[12:04:41](#gJPHWBp8hgn7WzVSXDYI5LeP8etrX7FnKZklzKyZmog) <hiiamboris (NOT THIS ONE)>:
like here https://en.wikibooks.org/wiki/Rebol_Programming/Language_Features/Parse/Parse_expressions#Parse_idioms

[12:19:17](#6jm8IADWsS1TBXvk9BPhrxVmAQ6Ia76jSPGo9PXABJ4) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Thanks, I take a look. I‚Äôm not using `fail` or `reject` very much but `break` is extremely important.

[13:51:48](#MG_zff1JS7AAPmKCGNABBZz0rri7gAm-kOQOUpIBtJQ) <toomasv>:
@bubnenkoff `ahead` is not needed here:
```
[some [ set w set-word! (probe w) | skip ] ]
```

[13:52:04](#7UnXNQHQYLTichdR9imWNAwe58M-MRczBuJwov1PW1U) <toomasv>:
* @bubnenkoff Neither is `ahead` needed here:
```
[some [ set w set-word! (probe w) | skip ] ]
```

[14:08:43](#7-bh8rC5ax8Dq96JQzoP5trylCYP8gvKuqfdJBEHgeE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@hiiamboris I just FAILed reading the 3478 issue, because my brain REJECTed to understand all of mentioned cases and I must take a BREAK now Ì†ΩÌ∏â

[14:09:04](#h8P0uxkOxx_dxpTvzbuE_N382S35q9bGgRn2zPxOwJY) <hiiamboris (NOT THIS ONE)>:
lol

[14:10:41](#PWz5YJukosU8zp4DPHyQ8M7p9w3OOXkb19eJ2qsb6GU) <toomasv>:
@bubnenkoff  `fail` works ok in some situations, e.g. let's say you want to probe set-words except `b:` 
```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ set w set-word! [if (w = quote b:) fail | (probe w) ] | skip ] ]
```
Same could be achieved in different ways:
```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ not quote b: set w set-word! (probe w) | skip ] ]
``` 
or
```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ s: skip opt [if (all [set-word? s/1 s/1 <> quote b: ]) (probe s/1)]]]
```


[14:13:30](#065dTdWaBFXrUVy9Try8E6zu1YYZyml0UXx76-wqtlA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
or:
```
parse [a: 1 b: 2 name: "Mike" c: 3] [some [ quote b: | set w set-word! (probe w) | skip ] ]
```

[14:20:58](#LoLPB7FPnpaAWgbmTGI8koM0IVPmeMDIl9D4e5mjX7k) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@hiiamboris what took my attention is yours note:
> `parse haystack [to needle to end]` But assume that there's no end (maybe we're parsing continuous stream of data).

It makes me think, if there is any way how to exit from parse with success in such a case without use of the `to end`? Because I must say that I use it very often.

[14:24:55](#eo2XSbJYkhcUcJrCYXN7NB55pjwc7KCeSBvgGFW8Igw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
In R3 it could be:
```
>> parse "ab" ["a" return (true)]
== true
```

[14:25:29](#Tj4OhY5oK4Rrdlc5znm61MZzVaj9MyrJ9WtCkmbJ9u8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
BTW, just now I‚Äôve updated my [HTML parser](https://gitlab.com/rebolek/castr/-/blob/master/html.red) so now it can handle even more buggy HTML than before. Stuff like `<b>start<a href="/">inner</p><p.</a>end</b>` and other monstrosities can be parsed without a problem.

[14:26:23](#lgvHA8EuiHg0QBB_GQqRWtOz5sE-J4AgA0K93zZGDKU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
But `return (true)` is in R3 14x slower than `to end` and longerÌ†ΩÌ∏ï

[14:27:08](#bpq_uZk7G5ajEvcUjPkeUAVFM03j0OoBnaQP4dFSmkE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
14x slower? wow

[14:29:56](#4CVoyebnVNlQ3N5qZQueoUCK6JEk9p0h1LF_4_frwq0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the #3478 to make it even more complicated:)

[14:30:28](#pXJkL-8pKzSNXkpovDbTUgHlh4pytKfDsZytdh07r7U) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the red#3478 to make it even more complicated:)

[14:30:35](#MDM5H2AG-0JpmfIDLpy5NjFJHawbzbyVV-Ufes4g0iY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the 3478 to make it even more complicated:)

[14:31:15](#1AuZwGAO-NlgjsJGTxu-jhaav2ittz6IVH0aORAwO98) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the red-red#3478 to make it even more complicated:)

[14:31:23](#ilusGstA_jyftByV_1trO4VBFite8d2OL1DgCbpECEY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the red/red#3478 to make it even more complicated:)

[14:43:45](#WsVkVTebmntKpAU3n7J6K7g7iygQ3X924JMNSRMu6gQ) <bubnenkoff (Dmitry Bubnenkov)>:
Am I wrong or the was discussion about `then` should be remove from parser? 

[14:45:36](#OXsIof2mz-x9IbzPcOAMoC1xamJhQn7oD_AUTOpegPI) <hiiamboris (NOT THIS ONE)>:
There's no `then` in Red as far as I know

[14:49:01](#kreaoKOqlJbWNDMvPxsArbsYVEyLUmCQhqOaT_acCi0) <bubnenkoff (Dmitry Bubnenkov)>:
https://ungaretti.gitbooks.io/red-language-notebook/content/parse.html

"` then` Regardless of failure or success of what follows, skip the next alternate rule."

[14:49:29](#HuD0TZolNhBSt9oEhzKzsxn7wCjci7CG8YPd0SlaFjE) <hiiamboris (NOT THIS ONE)>:
maybe it was there 2-3 years ago but was removeed

[14:49:31](#2q1GWyXEswNmuj9FS09XzmXo0pPl8g-Lnke3tzuJMHo) <hiiamboris (NOT THIS ONE)>:
* maybe it was there 2-3 years ago but was removed

[14:53:10](#qG80EcKg3FaHjmOLea8Z7_nwcqe0dTMlqV82rOy5YV0) <hiiamboris (NOT THIS ONE)>:
> It makes me think, if there is any way how to exit from parse with success in such a case without use of the `to end`? Because I must say that I use it very often.

> Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the red/red#3478 to make it even more complicated:)

That's an interesting consideration, but probably should be left for a separate REP? Ì†ΩÌ∏â
We don't have infinite data, but to exit parse asap, I recall I used `exit` at least once. Otherwise I could write `loop 1 [parse ... [ .. (break)..]]`. But that's a workaround alright.



[14:53:56](#9o1obi_dbJzDq0OJx-jYuLV4nhk18ZiltYl8kzUAyfM) <hiiamboris (NOT THIS ONE)>:
* > It makes me think, if there is any way how to exit from parse with success in such a case without use of the `to end`? Because I must say that I use it very often.

> Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the red/red#3478 to make it even more complicated:)

That's an interesting consideration, but probably should be left to a separate REP? ;)
We don't have infinite data, but to exit parse asap, I recall I used `exit` at least once. Otherwise I could write `loop 1 [parse ... [ .. (break)..]]`. But that's a workaround alright.



[14:54:06](#moOhq_fgzBrRW9ejcf3aGrP2tmif-CdmPtZsa7Scad8) <hiiamboris (NOT THIS ONE)>:
* > It makes me think, if there is any way how to exit from parse with success in such a case without use of the `to end`? Because I must say that I use it very often.

> Maybe `parse "ab" ["a" accept]` should return `true` instead of `false` in (R3).. there is no `accept` in Red. It could be added into the red/red#3478 to make it even more complicated:)

That's an interesting consideration, but probably should be left to a separate REP? ;)
We don't have infinite data (yet), but to exit parse asap, I recall I used `exit` at least once. Otherwise I could write `loop 1 [parse ... [ .. (break)..]]`. But that's a workaround alright.



[15:46:45](#f2MIFsvDQRVQRt8sr0q1XTBLssz-cBi8GSHTDLr02rQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I'm used to `to end` for now, but it is right, that if we would have streaming parse one day, there could be some other way how to end and report a success. But hard to say how to implement the streaming parse.. it would require more thoughs.

[16:49:29](#e_T72OoHS0F-UrEc4qurvV_d83iUyWO_7nCTsph80cg) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`then` was extremely confusing, no one could figure out how to use it properly and I believe it was buggy anyway.

[18:26:53](#Vw2_LG8CA9xImScYWJcPdFkvWm7XEB1xZKQkZheO4kU) <bubnenkoff (Dmitry Bubnenkov)>:
@toomasv I did it! Thanks for examples! I will learn them. You was totally right that I do not need `ahead`
```
data: [
    foo: 33
    bar: 66
	id: 123
	lots: [
		lot: [name: "blackberry"]
		lot: [name: "apple"]
		lot: [
			name: "bananas"
            number: 43
			obj: [ price: 44 ]
			obj: [ price: 23 ]
			]
	]
]		
		
parse data rule: [
    some [
           set w set-word! (probe w) | not block! skip
        |  ahead block! into rule     
    ]
]
```

This code will print all set-words 

[18:27:55](#a3418XPlcdBlHNLiD0Tg06uaw35IrTSZ0Wrnqf8-ucc) <bubnenkoff (Dmitry Bubnenkov)>:
* @toomasv I did it! Thanks for examples! I will learn them. You was totally right that I do not need `ahead` before  `set`
```
data: [
    foo: 33
    bar: 66
	id: 123
	lots: [
		lot: [name: "blackberry"]
		lot: [name: "apple"]
		lot: [
			name: "bananas"
            number: 43
			obj: [ price: 44 ]
			obj: [ price: 23 ]
			]
	]
]		
		
parse data rule: [
    some [
           set w set-word! (probe w) | not block! skip
        |  ahead block! into rule     
    ]
]
```

This code will print all set-words 

[18:31:44](#0urotydp-p5-ly9kNjYLdmxSxJomK8sJGbfi0nSk0iE) <greggirwin (Gregg Irwin)>:
If someone would like to track this chat and pull useful topics and examples into https://github.com/red/red/wiki/Parse-Cookbook, that would be fantastic. Such great information, but it will fade as chat continues. Of course, I'm selfish and this is also to keep me from having to ask the same questions later. :^) @bubnenkoff would you be up for that? 

[18:33:43](#3t1UV7TlspqXRYzZiAVYDWDwhWtzzQfdmusAbjDvEHk) <bubnenkoff (Dmitry Bubnenkov)>:
I will to add examples later, I am doing small collections of good solutions

[18:35:15](#l7oiy19iWhbwNpnE6l2QMpkMh9efQTlY2oQsBI9njEo) <toomasv>:
@bubnenkoff :+1: 

[18:38:26](#9TvTiCcrML-lknmZz8imqGEFP9YoBDdd1h8PRVxLXqI) <hiiamboris (NOT THIS ONE)>:
@bubnenkoff FYI there's another way to do the same task: https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/collect-set-words.red#L9
In Red there's always another way Ì†ΩÌ∏É

[18:44:56](#K6lNg__75EaF0Kgw5D4NpxZcMGuiFqgrL-CGKZwXGVA) <bubnenkoff (Dmitry Bubnenkov)>:
@hiiamboris hah! Funny!

[18:49:17](#_ev4yM79UYEIV4rLXgdzq609YomFYXFAT5WTnqzxRFY) <greggirwin (Gregg Irwin)>:
@hiiamboris the `loop+break` trick is neat, but yes it's a workaround, as is `accept: [to end]`.  As noted, the latter won't work for streaming cases.

[18:50:27](#nUENmjflhTxXWNUenC_SfuVOxzPqeUbH6iU8HB-6mOQ) <greggirwin (Gregg Irwin)>:
Thanks @bubnenkoff ! You've been doing a lot of `parse` work.

[18:53:36](#b4uRA8j8XV4sR0VVWaiuN_KvI1jhioef8yEKPPeBu3c) <greggirwin (Gregg Irwin)>:
@hiiamboris your set-word collector is "sufficiently advanced technology", as Mr. Clarke would say. :^)

[19:03:23](#7rEVJ6HGaHgfAWWhLK0NYBSY2GjdVKgGGlc4DJTtjrM) <greggirwin (Gregg Irwin)>:
Very clever leverage of `function`.

[19:06:10](#00nGsHiFaj_PDDkJSHgn4S333C7N_n5wc2yVvwqRn10) <hiiamboris (NOT THIS ONE)>:
Had to google it Ì†ΩÌ∏É Turns out it's one of the guys who wrote `2001`

[19:16:34](#1g3qkOT98gyDfPypCPFhB2KnDiwqyyGJIlc0HVlTIO8) <hiiamboris (NOT THIS ONE)>:
You know I was staring at a microSD card the other day and thinking.. how could such 1cm thing fit 1TB of data? And what would an *uninformed* person do with it? Chew it? Try to make some tea? Ì†ΩÌ∏â

[19:31:00](#3mSE0Zad89q_MGDljaKtTLAEr-1hrn0x0esM9P9otYY) <toomasv>:
Yes, @hiiamboris , funny func! :)

[19:32:35](#-fI8Zwt8VhIWt7O2DC_C_I30EEBf_KgxrTKQrGzF1S8) <hiiamboris (NOT THIS ONE)>:
Thanks (:

[20:12:19](#sbXzcBaEdEqMXV1p9SVG5o6L1Urqbq9msYOt1eB8Kn0) <Respectech (Respectech)>:
Fun fact: The DNA in one human cell contains the equivalent of ~1.5GB of data and there are approximately 37.2 trillion cells in the average adult male human body. Therefore, average human males contain somewhere in the neighborhood of 55 billion TB (55 Zettabytes) of data in each of our bodies. And DNA only accounts for ~2.6 kg of the average adult male's body weight. :-)

(Reference: Bianconi, E., Piovesan, A., Facchin, F., Beraudi, A., Casadei, R., Frabetti, F., Vitale, L., Pelleri, M. C., Tassani, S., Piva, F., Perez-amodio, S., Strippoli, P. and Canaider, S. 2013. An estimator of the number of cells in a human body. Annals of Human Biology, 40 (6), pp 463-471)

[20:16:39](#16ugh6FnPHXcy5VUea04R5RyvS51fCSfmSX5VxBLuXY) <hiiamboris (NOT THIS ONE)>:
Haha great

[20:21:36](#825KEi8N4NuJCtTFefXdBx4iK4EZdMcIwOhQjWCaTNo) <greggirwin (Gregg Irwin)>:
But how much of that is redundant information? And how much of an atom is empty space. If we were to PKZIP and UPX a human, what would they look like? We might fit on a thumb drive.

[20:22:58](#ryFtQHOpuIOUsPIHdaTCLfLM-C8l3nV9IzRXZYTK3eY) <greggirwin (Gregg Irwin)>:
Maybe run us through a dehydrator as well.

[20:25:09](#hfjxvJopACOTbFyEjIYR3o-gPEnTNWeq4uD51Uu-Z4o) <hiiamboris (NOT THIS ONE)>:
Good luck looking for volunteers Ì†ΩÌ∏â

[20:27:16](#Xi13IREjphZ_NG2Sl5AHeRygOo-7R7a5XyeORm_mO4E) <greggirwin (Gregg Irwin)>:
I volunteer...well, not you because we need you. I'd do it myself, but somebody has to clean up the mess after it's done.

[20:53:35](#Pz49Y_UPBs4ZWKpGLdPmwocBvYY1trT9_Gw5NK4VoFs) <toomasv>:
I wanted to compare your wichtcraft with a more traditional method:
```
collect-setwords: function [block [any-list!]][
    setwords: [any [keep set-word! | ahead any-list! into setwords | skip]] 
    unique parse block [collect setwords]
]
```
and tried both on %red-object-browser.red:
```
>> length? c1: collect-setwords rob
== 42
>> length? c2: collect-set-words rob
== 46
```
Hey, you gather more words!
```
>> exclude c2 c1
== [i: item: w: ctl:]
```
Ha, these are `foreach` words probably, i.e. you gather some words that are not set-words! *per se*. 
But your performance is much better:
```
>> profile/show/count [[collect-setwords rob][collect-set-words rob]] 1000
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.148  | 0:00:00      |    20184284 | [collect-set-words rob]
0:00:00.279  | 0:00:00      |     2020596 | [collect-setwords rob]
```

[20:53:55](#xhC08FMMYCpcV1WrXOYFbe-zN3B6Icrp3uvoBTpaaTQ) <toomasv>:
* @hiiamboris, I wanted to compare your wichtcraft with a more traditional method:
```
collect-setwords: function [block [any-list!]][
    setwords: [any [keep set-word! | ahead any-list! into setwords | skip]] 
    unique parse block [collect setwords]
]
```
and tried both on %red-object-browser.red:
```
>> length? c1: collect-setwords rob
== 42
>> length? c2: collect-set-words rob
== 46
```
Hey, you gather more words!
```
>> exclude c2 c1
== [i: item: w: ctl:]
```
Ha, these are `foreach` words probably, i.e. you gather some words that are not set-words! *per se*. 
But your performance is much better:
```
>> profile/show/count [[collect-setwords rob][collect-set-words rob]] 1000
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.148  | 0:00:00      |    20184284 | [collect-set-words rob]
0:00:00.279  | 0:00:00      |     2020596 | [collect-setwords rob]
```

[20:54:42](#oiWQ4Fo9HXMpCBxbu758RjWvOaKbfPmKr0Tav8AvzPc) <toomasv>:
* @hiiamboris, I wanted to compare your wichtcraft with a more traditional method:
```
collect-setwords: function [block [any-list!]][
    setwords: [any [keep set-word! | ahead any-list! into setwords | skip]] 
    unique parse block [collect setwords]
]
```
and tried both on %red-object-browser.red:
```
>> rob: load %red-object-browser.red
>> length? c1: collect-setwords rob
== 42
>> length? c2: collect-set-words rob
== 46
```
Hey, you gather more words!
```
>> exclude c2 c1
== [i: item: w: ctl:]
```
Ha, these are `foreach` words probably, i.e. you gather some words that are not set-words! *per se*. 
But your performance is much better:
```
>> profile/show/count [[collect-setwords rob][collect-set-words rob]] 1000
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.148  | 0:00:00      |    20184284 | [collect-set-words rob]
0:00:00.279  | 0:00:00      |     2020596 | [collect-setwords rob]
```

[20:56:55](#NflIzdEmoR67rzybeRHWVngH5Xx8sZVM5OkKnCiWL2c) <hiiamboris (NOT THIS ONE)>:
Good catch on foreach!

[20:58:20](#rxzUSPe4E3JVUFe5xCgG_eC_kXWc6dt8kv17P-BKXUY) <toomasv>:
* @hiiamboris, I wanted to compare your witchcraft with a more traditional method:
```
collect-setwords: function [block [any-list!]][
    setwords: [any [keep set-word! | ahead any-list! into setwords | skip]] 
    unique parse block [collect setwords]
]
```
and tried both on %red-object-browser.red:
```
>> rob: load %red-object-browser.red
>> length? c1: collect-setwords rob
== 42
>> length? c2: collect-set-words rob
== 46
```
Hey, you gather more words!
```
>> exclude c2 c1
== [i: item: w: ctl:]
```
Ha, these are `foreach` words probably, i.e. you gather some words that are not set-words! *per se*. 
But your performance is much better:
```
>> profile/show/count [[collect-setwords rob][collect-set-words rob]] 1000
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.148  | 0:00:00      |    20184284 | [collect-set-words rob]
0:00:00.279  | 0:00:00      |     2020596 | [collect-setwords rob]
```

[21:00:12](#9cjOjaiTL0Z-Bh4Jfr2pya60fu0aqpbFplL2lrfO9ic) <hiiamboris (NOT THIS ONE)>:
I'll note this in the header

[21:00:26](#EmS9b4qmSPS9hj3vOEV5yRA2Ui4qCvpkZKOlkphEPew) <toomasv>:
:+1: 

[21:01:25](#7FGWq_SGreYK7lR4nMfHH5UbsvmbxhO4iEn9D7SgucQ) <greggirwin (Gregg Irwin)>:
Hey @rebolek, when we revisit Gritter at some point, it could be really cool to find messages with code.

[21:26:42](#Z0gUgVIG947R9KB6fJk8i0Pk403t0xATnJH-QKXr3Ho) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@greggirwin I believe there‚Äôs a function for it in Gritter, I need to take a look.

[21:27:33](#aTnmUYwNGgz3BjhFKvyu7YX1RrshOYf2i9Pyq9anxO0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Yup, there is: https://github.com/rebolek/gritter/blob/master/gitter-tools.red#L209

[22:29:08](#S-3urHST_XWD7T5hKUHOf2Ld9pck7uMe4hdJLBX6URI) <greggirwin (Gregg Irwin)>:
Nice!

## 11-Mar-2021

[8:38:13](#JhvUIt7ByJldrjsYcj2wcK47TyGGjL52MqGHOw8G1kk) <bubnenkoff (Dmitry Bubnenkov)>:
How to change type during `set`?
```
parse [foo:] [set x set-word!]
```
now `x` become `set-word!` but I want to make it simply `word!`

[8:39:52](#mnPnPwWzN7GiTCIh_xV5ZaI4Pl1m69OQLtHCenuvBc4) <bubnenkoff (Dmitry Bubnenkov)>:
is it good:
```
parse [foo:] [set x set-word!  (x: to word! x) ]
```
?

[8:49:15](#B81CnElzIODL4AsYp-1a69KvnQ-6DBHStSkbyR5iJFo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Yes... that is good.

[8:51:42](#UtzgplvpBSspubofV-7_e36xroGW-Bh5vrehMcy5YKQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Yes... that is good. Question is, it you need to convert it.

[8:52:52](#TmXruImbiSPqf6u_J0OhVgVSQWzTbAPaqVchsT0klRo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Do you know, that you may use `any-word!` and `any-word?`?

[8:53:03](#jUSg1tFdhiUF0O9_FbVk4k7LpcCgmm1xmeUF3eje8ro) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Do you know, that you may use `any-word!` and `any-word?` in many situations?

[8:55:08](#saLHmTOqos6oITurud3P41fz83QGxh4SbLJWF_WEl9o) <bubnenkoff (Dmitry Bubnenkov)>:
Thanks for tips! I did not know about them!

[10:35:38](#x3fjAhfzdTvZLAHozhetgnEDOJSS5CD24iCcqmnRqwg) <bubnenkoff (Dmitry Bubnenkov)>:
With great help I mixed all examples and wrote interesting code. It can advance value to nested blocks. It check it parent name and insert value if it in list. The only problem I can't find issue why it do not process top level item: `lots` (but perfect work with `lot`) :
```
data: [
	id: 123
    foo: 33
    bar: 66
	lots: [ lot: [name: "blackberry"]
		lot: [name: "apple"]
		lot: [
			name: "bananas"
            number: 43
			obj: [ price: 44 ]
			obj: [ price: 44 some: [ age: 20 bar: []  ] ]
			]
	]
]		
		
tags: [lots obj bar]

parse data rule: [
    some [
           s: ahead [set-word! block!] set set-word-name set-word! (set-word-name: to word! set-word-name) (probe set-word-name) 
           | quote id: set b skip
           | if (not unset? set-word-name) if (find tags set-word-name) if (head? s) insert (quote id:) insert (b)
           | not block! skip
           | ahead block! into rule     
    ]
]

probe data
```

[10:58:50](#wYGTxzouoKV9CoK8NJH8pLDqIWFH7FCzEzfoYPXreXw) <bubnenkoff (Dmitry Bubnenkov)>:
fix: `if (not unset? set-word-name)` --> `if (value? 'set-word-name) `

[12:50:39](#5_cF_yeA9fEL1bXr1czLsfpqzXZzHe8dapuukfvrOR4) <toomasv>:
@bubnenkoff Good work, congratulations!
Here is a bit reorganized rule that works for `lots` too
```
set-word-name: none

parse data rule: [
    some [
           s: quote id: set b skip
           | if (all [set-word-name find tags set-word-name head? s]) insert (compose [id: (b)])
		   | ahead [set-word! block!] set set-word-name set-word! into rule (set-word-name: none)
           | skip
    ]
]
```

[12:51:50](#K-zY_R-EWdbHQXdY_9JhG7D94Bh3W7vT-86FLrXCvlk) <toomasv>:
* @bubnenkoff Good work, congratulations!
Here is a bit reorganized rule that works for `lots` too
```
set-word-name: none

parse data rule: [
    some [
           s: quote id: set b skip
           | if (all [find tags set-word-name head? s]) insert (compose [id: (b)])
		   | ahead [set-word! block!] set set-word-name set-word! into rule (set-word-name: none)
           | skip
    ]
]
```

[12:53:48](#ptw-7GCGXAlHKfKDUIYsy8Tl4lzSEYxsqBl25H--SAo) <toomasv>:
* @bubnenkoff Good work, congratulations!
Here is a bit reorganized rule that works for `lots` too
```
set-word-name: none

parse data rule: [
    some [
           s: quote id: set b skip
           | if (all [find tags set-word-name head? s]) insert (compose [id: (b)])
		   | ahead [set-word! block!] set set-word-name set-word! into rule (set-word-name: none)
           | skip
    ]
]
```
Con you point out now why your rule didn't work for `lots`?

[12:56:55](#I5V3VRaqsRHzNzYk4HwDcYkoZ_MXRLD-qIpsD4hsAn4) <toomasv>:
* @bubnenkoff Good work, congratulations!
Here is a bit reorganized rule that works for `lots` too
```
set-word-name: none

parse data rule: [
    some [
           s: quote id: set b skip
           | if (all [find tags set-word-name head? s]) insert (compose [id: (b)])
		   | ahead [set-word! block!] set set-word-name set-word! into rule 
           | skip
    ]
]
```
Con you point out now why your rule didn't work for `lots`?

[13:17:09](#-n_YiKAJ4HUt3OnYOof7CGuqr3CHzmvCDCMLMYMdoMg) <bubnenkoff (Dmitry Bubnenkov)>:
thanks! That's very funny that my last version is very similar with your (I dropped a lot of `ahead`s), but my did not worked because few small but important difference!) Thanks!

[18:39:19](#ABUd-xYu83bWrvsjni8CIyDLilpaTvv9KG6pfc0Oylg) <bubnenkoff (Dmitry Bubnenkov)>:
I want to do something like this. It should be possible, but I do not understand what I am doing wrong:
```
needle: 'id
parse [id: 1] compose [(to-set-word needle) integer!]
```

[18:40:24](#J4heVHXlVodAIRharMS1GDQmVmEbOGo5KNlHAgPV2L4) <hiiamboris (NOT THIS ONE)>:
use `probe` to find out 

[18:42:33](#QATgI6v-JmyPoAt7X4VIVydst6lR3UOKDgYthm_sop8) <bubnenkoff (Dmitry Bubnenkov)>:
Probe show that `needle` was right evalauted, but result of parsing is `false`

[18:44:59](#Ho2Cf8N9FfEZ9XI3FwGA-8pxh3DfvJFMkyMqrGPXU1I) <hiiamboris (NOT THIS ONE)>:
what do you think `id:` means for parse?

[18:45:36](#HecRGZ8ZeCLEwlSVInfDvSMHyl4WhrFKCqOdTdDnrJ4) <bubnenkoff (Dmitry Bubnenkov)>:
Oh, it seems that `quote` should be used: `parse [id: 1] compose [quote (to-set-word needle) integer!]`

[18:45:39](#CsvCsvoFfS4jvX0v-4i-8Q80L-3hlrXR5Q9UzqqFgOw) <hiiamboris (NOT THIS ONE)>:
* what do you think `id:` means for parse in it's rule?

[18:45:51](#7zPleCWr0VFji-b3U6PQrRpGf9UQekVWHaggflmAV6Y) <hiiamboris (NOT THIS ONE)>:
exactly :+1:

## 12-Mar-2021

[9:18:49](#FXf1qIzTzql39OtCJw0ZST9ZXbDKlCFmZJdeB-ikFJM) <bubnenkoff (Dmitry Bubnenkov)>:
Why Insert do not insert noting in follow code:
```
a: [foo: 123]
parse [a] compose [quote (needle) set x to integer! insert [id: (x)] ]
a
```

[9:20:13](#hPXn2z_rSPaZUMH56CF_7BUv7wIA8BrtYKHp7c0C2nQ) <bubnenkoff (Dmitry Bubnenkov)>:
* Why Insert do not insert noting in follow code:
```
a: [foo: 123]
parse [a] compose [quote (needle) set x integer! insert [id: (x)] ]
a
```

[9:24:52](#mqyVkSrt0ZmgNTN23spvnGKq9VIZyt4bnYA6Z9cPwA0) <hiiamboris (NOT THIS ONE)>:
`[a]`?

[9:41:48](#LbL_F1xhj6ooDQ0YYMPO4TX_lJVS-LHGyrVE8-zpZmI) <bubnenkoff (Dmitry Bubnenkov)>:
Yes, `[a]`, what's wrong?

[9:55:26](#q07w0hlasyPZOTDkkW15SqLTjYMX82KyO7jjA_kNv9k) <hiiamboris (NOT THIS ONE)>:
that's a block with one `word!`

[9:57:47](#jMpV13NvNBah8_8Vtz6dXxOzJbrTg8a1FX4g24-SVDE) <bubnenkoff (Dmitry Bubnenkov)>:
"with word and value" right?

[9:59:32](#Wyz0H7xWCZtst_6931progILTlECW7ZmJN735IWrc3M) <hiiamboris (NOT THIS ONE)>:
nope

[10:01:18](#DvIIej68BEBPu6C9pgUAslKIHuJUJIb60tWfTVcSImI) <bubnenkoff (Dmitry Bubnenkov)>:
oh my bad! Brakets!

[10:01:32](#eBkP1gjzvmoPzukfiew5qj9Uiz_ocyfZxF6ceho7vFc) <bubnenkoff (Dmitry Bubnenkov)>:
* oh my bad! Brackets!

[10:47:18](#CtTJgaIDPBSqNe1mhvE9MosdIeo97UZjKkk7M9Vb3nM) <bubnenkoff (Dmitry Bubnenkov)>:
This code is working:
```
needle: 'id
a: [id: 123]
parse a compose/deep [ quote (to-set-word needle) set x skip ]
x
>> 123
```

But here I am getting `x has no value`. It's seems that `compose` try to evaluate all before last `x` will get value. How to solve it?
```
needle: 'id
a: [id: 123]
parse a compose/deep [ quote (to-set-word needle) set x skip (print x) insert [(to-set-word needle) (x)] ]
>> x has no value
```


[10:57:42](#obFHrcvgw98MYx-LGDDE_Glfyl77CQnU3S2UcQ5oJhg) <hiiamboris (NOT THIS ONE)>:
`([(print x)])`

[10:58:18](#2WoKdhD7Ux4He9jCpxlhNVLOSeXw3O2qjdnPjvRVgqo) <hiiamboris (NOT THIS ONE)>:
etc

[10:59:42](#UJDf1N5gMVV6IGALwwoyW2C2u5u1Xp4aK35oHde2xvg) <hiiamboris (NOT THIS ONE)>:
or use https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md better suited for that

[11:02:39](#Gzvtk7-T5TTphzzDjEuyOeW_L6_lSbgfbClcxtA7lsU) <toomasv>:
Or try to wrap your head around this convoluted example:
```
parse a compose [ 
    quote (n: to-set-word needle) 
    set x skip (quote (print x)) 
    insert (to-paren reduce ['compose reduce [n 'x]])
]
```

[11:04:53](#GRj4worXF8REPISOUn_9gstXkWzDM659bRcDthHbrfI) <bubnenkoff (Dmitry Bubnenkov)>:
Oh magic! I do not know how I would read it after few weeks after writing)))

[11:08:00](#hTRyTv66Go0wKxZ3vzHMMw5MIjGeE4bpGDG3DJ07tzA) <toomasv>:
* Or try to wrap your head around this convoluted example:
```
parse a compose [ 
    quote (n: to-set-word needle) 
    set x skip (quote (print x)) 
    insert (to-paren reduce ['compose reduce [n quote (x)]])
]
```

[11:08:31](#-9LrscM2Phl0hf7UfF8NzqfsMQmumx82dN_kiV8Izr0) <toomasv>:
(Corrected example: `quote (x)` in the end)

[11:09:08](#4S78Qvr4sF4krUxvZwkRlywCjUheSIv07pFtopqT6yg) <bubnenkoff (Dmitry Bubnenkov)>:
this work for me:
```
needle: 'id
a: [id: 123]
parse a compose/deep [ quote (to-set-word needle) set x skip insert [(to-set-word needle) (reduce [(x)] ) ] ]

>> a
== [id: 123 id: 123]
```

[11:11:37](#AG1ODMn4EQyZVwxnQblfKJMj6X3ZENyQ6g45y1FjsEw) <toomasv>:
Did you try it in fresh console? Ì†ΩÌ∏â

[11:17:42](#hFd3ykHhI-qb0CAe4Xttygo9kspGN__3DFsML56M904) <bubnenkoff (Dmitry Bubnenkov)>:
hah! In fresh do not work)

[11:20:13](#DiFy0GUA92UAFn9wYZo7aboCMod493K2ajDKrLJuXbw) <toomasv>:
What do you think `compose/deep [[(reduce [(x)])]]` would do?

[11:25:26](#COIoDd8tLW9qPaW33G5Zr6-s6WJgwyg2-ef-8GiwreM) <bubnenkoff (Dmitry Bubnenkov)>:
at result it will try to evaluate `x` 

[11:26:04](#JvZPp_B3G-_CkEIz3XG-nyo1-5HeWAJj4axQSwgEpGA) <bubnenkoff (Dmitry Bubnenkov)>:
I checked and it will print: `[[1]]` is `x` is setted

[11:29:56](#6az6Hy3SmH2A5VAPZS_Zon6oEmumPFYi1k4WuESHyqs) <toomasv>:
But you need not to evaluate `x` at compose-time, only at parse-time...

[12:47:04](#gBNXV6mtoHZS2DEm5NX5Hq2j_793mhxYT10MPf0t0_0) <bubnenkoff (Dmitry Bubnenkov)>:
Still hard to realize this magic.
So:
```
needle: 'id
a: [id: 123]
parse a compose/deep [ quote (to-set-word needle) set x skip insert [ (to-set-word needle) ([(x)])  ] ]
```
output:
```
[id: 123 id: (x)]
```
so I need compose it's once again to get result, right?


[12:50:51](#kHM4jqa7CnfzSPkKWbDgQwQMZmmz-r5m4n2t3iNYX4A) <bubnenkoff (Dmitry Bubnenkov)>:
But honestly I am not understanding why: `([(x)])` is evaluate to `(x)`. it should be: `[x]`

[12:53:20](#hB5EkxCUU5EWQYN6MdAHnOWd3cx--DkR_Swd2sdkSS8) <hiiamboris (NOT THIS ONE)>:
```
>> append [1 2] ([(x)])
== [1 2 (x)]
```

[12:59:34](#3UyUGk7W2vGBY8OYdRypqs3YyiP1fCCMC3fK7WXusQg) <toomasv>:
> I am not understanding...

Imagine it this way that `compose/deep` stops going deeper if it meets block after (some consequtive) parens
```
>> compose/deep [((([((x))])))]
== [((x))]
```
Bot there is another probelem in your rule - `insert <block>` will not evaluate block, but you need composition there to evaluate `(x)`.

[13:00:10](#P5EXslvIYuwE26AOCUXwDo93g6onBFo8K8rjAtuK5Y4) <toomasv>:
* > I am not understanding...

Imagine it this way that `compose/deep` stops going deeper if it meets block after (some consequtive) parens
```
>> compose/deep [((([((x))])))]
== [((x))]
```
But there is another probelem in your rule - `insert <block>` will not evaluate block, but you need composition there to evaluate `(x)`.

[13:00:47](#Avnc6ghquZkOvAHxU17WpS9x5iNqVeudJqC-lGIGAgU) <toomasv>:
* > I am not understanding...

Imagine it this way that `compose/deep` stops going deeper if it meets block after (some consequtive) parens
```
>> compose/deep [((([((x))])))]
== [((x))]
```
But there is another probelem in your rule - `insert <block>` will not evaluate block, but you need to evaluate `(x)`.

[13:01:47](#2s2qFwmqxl5iSF8hQ0mLBtvmSNw2cpplhYekDzQyBRo) <toomasv>:
* > I am not understanding...

Imagine it this way that `compose/deep` stops going deeper if it meets block after (some consequtive) parens
```
>> compose/deep [((([((x))])))]
== [((x))]
```
But there is another problem in your rule - `insert <block>` will not evaluate block, but you need to evaluate `(x)`.

[13:08:03](#777WHU4TtEi0TNU4U5fiqYkGsNFX-UO9zo351doUE4o) <toomasv>:
* > I am not understanding...

Imagine it this way that `compose/deep` stops going deeper if it meets block after (some consecutive) parens
```
>> compose/deep [((([((x))])))]
== [((x))]
```
But there is another problem in your rule - `insert <block>` will not evaluate block, but you need to evaluate `(x)`.

[13:15:50](#S4akkw_6X7EVMv-huGam55NbLbwYejKVQnbcHN1nxYQ) <bubnenkoff (Dmitry Bubnenkov)>:
So `insert` and `append` evaluate block that inserting/appending?

[13:16:26](#hknQ1HqFNdhfl8ZT3xUnifL5k6ScAELcdmQTPPidUGg) <toomasv>:
No

[13:16:31](#LYIxCfOA9mRyDrh4PObx5EFSsbt9HsqNFLQo3QEKDFY) <bubnenkoff (Dmitry Bubnenkov)>:
* So `insert` and `append` evaluate block that inserting/appending? Because this:
```
>> append [1 2] ([(x)])
== [1 2 (x)]
```

[13:17:13](#wWQCJP-mBZum4LwywprZpwAt2gJZ04Kdo0RPdDuw7zo) <bubnenkoff (Dmitry Bubnenkov)>:
then where `[]` ?

[13:18:00](#d-7WZagdC9tr-TJqjoGwzbcgv4pahU19bGgbdSscAaA) <hiiamboris (NOT THIS ONE)>:
```
>> append [1 2] [3 4]
== [1 2 3 4]
>> append [1 2] ((([3 4])))
== [1 2 3 4]
>> ((([3 4])))
== [3 4]
```

[13:18:30](#ykfA9mRNCHVYWaayjw0RxFecLrJTLyeqALJ7OlV0fY0) <toomasv>:
```
>> append [1 2] [3 4]
== [1 2 3 4]
>> append [1 2] ((([3 4])))
== [1 2 3 4]
>> ((([3 4])))
== [3 4]
```

[13:18:40](#3gLuVWSBIfixFXrj1SzhqcDMcEhiVyQTBIG4IXBagfI) <toomasv>:
* `([(x)])` is same as `[(x)]`.  Add as many parens as you wish outside :)

[13:26:34](#shhGeewqhB5hTsWkcdWquYqG5vxDztLXKxBY3FGS_AI) <bubnenkoff (Dmitry Bubnenkov)>:
I used not correct word. Not evaluate, but "right part is value or block content"

[13:26:38](#HXV_nYDQ6tSFt21Ehj56alN39GDhQU6gr6m_b9N-6Lo) <bubnenkoff (Dmitry Bubnenkov)>:
* I used not correct word. Not evaluate, but "right part is value or block content". Right?

[13:27:15](#d54gjGLsj4TUq2z7xg4mnLQDCm_Wuxiunerw38zhrWg) <hiiamboris (NOT THIS ONE)>:
more or less

[13:29:47](#RSLzr2z3WRuO8lLeJp6-5tkppX7PBUQA20cC5wZhlwc) <toomasv>:
I would add "or a result of evaluation" 
```
>> append [a b](1 2 3 'c)
== [a b c]
```

[13:30:17](#UqDDIh-UsYx7pgv66Itz48DDkAh5dELDsiweEhDCaXg) <toomasv>:
* I would add "or a result of evaluation" 
```
>> append [a b](1 2 3 'c)
== [a b c]
```
Which is some kind of value of course

[14:42:07](#d2wWhdCFzL3l7pv-4drL3tJEJGQh4t2ehw6XIHdTFwk) <bubnenkoff (Dmitry Bubnenkov)>:
@hiiamboris "This mezz was made to counter the limitations of COMPOSE." so is there any plans to improve compose? I look at your code too, but it look like black magic for me. How to say in human words what limitation is? Something like: "ability to not evaluate impty values"?

[14:54:36](#jeDeyaUgYe0uISNMDf0bNIlSn8vMdCox8ofHJzeTDbM) <hiiamboris (NOT THIS ONE)>:
you've just encountered that limitation yourself

[14:58:47](#S_-4i7PbvnXWWiork5ELMsnefx4v0bE2ayqoJKxyHoY) <bubnenkoff (Dmitry Bubnenkov)>:
So in theory there is should be something like `compose/lazy ` that do not try to evaluate value if it's not present?

[14:59:47](#c4UvW7Hc96FwozzXRr6eGgqNZ2I3F7TCh4cbH6Brb3Q) <bubnenkoff (Dmitry Bubnenkov)>:
* So in theory there is should be something like `compose/lazy ` that do not try to evaluate value if it has no value?

[15:04:44](#wYxlZ_sBO2fNL5MlverH9ARjv6y6jrMAdnn10GccOBA) <hiiamboris (NOT THIS ONE)>:
https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md#an-overview-of-the-previous-designs first part is dedicated to the limitations of `compose`
second point is about your problem:
> It \[compose\] uses parens, so if one wants to also use parens in the code, code gets uglified.

You want some parens to be ignored by `compose` above, otherwise you uglify your code with `([(..)])` thing

[15:06:51](#wWhCQmAbUQVPBYJD598YKX16WkoczLdkvm6dbTl2K34) <hiiamboris (NOT THIS ONE)>:
reshape ignores `()` and only processes `@()` and `!()`, thus helping you

[15:08:52](#rNvDOVQiH7XGWQyjX77EOFNwK0UawuWTPxxvmPcSNPg) <hiiamboris (NOT THIS ONE)>:
but your last `x` is of course available only after parse, so you'll have to resort to `compose` again there

## 14-Mar-2021

[11:53:22](#Pvrfm2ycyCwmgFBpqvp3r_LeVbEU3cbpz7lGfdRCTrw) <bubnenkoff (Dmitry Bubnenkov)>:
Hot to check if `1` is next to set word? 
```
>> parse [a:] [set-word!]
== true
>> parse [a:1] [set-word! 1]
== false
```

[11:55:09](#BfYg2UaVd7p5t_0Z3SII6LWpqCSthoGoJl_i3a8TtxE) <hiiamboris (NOT THIS ONE)>:
`quote` it

[11:55:34](#uL8RCXB0whHsM-gJ9zukdcLIEAMISCu9TmxCLPUZmvU) <hiiamboris (NOT THIS ONE)>:
`a:1` is not a set-word though

[11:57:53](#mV2Zkc1WQi0zUYISRo7rIKydgKBTb8e1-9BheK_mcQY) <bubnenkoff (Dmitry Bubnenkov)>:
Thank! I got it!

## 18-Mar-2021

[9:28:25](#kBTZ1KouSbO1iqN3dhQF_NXQkMRR2IPI5g3eNBCVUM0) <bubnenkoff (Dmitry Bubnenkov)>:
word in my case can be:
```
none
integer!
string!
```

Is the any common type for them?


[9:33:30](#AL7qUO1xH0tcn1K4aNoHjU2VWWs4OLGXJfDDq5xl5z8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
No, but you can make a typeset:
```
>> whatiwant!: make typeset! [integer! none! string!]
== make typeset! [none! string! integer!]
>> parse [1] [whatiwant!]
== true
>> parse ["a"] [whatiwant!]
== true
>> parse [#[none]] [whatiwant!]
== true
```

[9:33:42](#i-Jj2oicEDgh_-4SnhbbDuzfOh-gkhOA0719G6KX2Zk) <hiiamboris (NOT THIS ONE)>:
until evaluated, it's just words though

[9:44:49](#fb8Uj_LDdlpVc983yRJFqGbT913_bYhAjeQ1F8x1lP8) <bubnenkoff (Dmitry Bubnenkov)>:
Why false?
```
>> parse [a: none] [ set-word! [string! | integer! | none! ] ]
== false
```

[9:45:07](#9l5FzFgNIdZChrpOkpawz8wKYi6x77m_VnMtEjiAA7E) <bubnenkoff (Dmitry Bubnenkov)>:
```
>> parse [a: 1] [ set-word! [string! | integer! | none! ] ]
== true
```

[9:53:46](#Wjh8ztzgB_Nbsskl1bxKiRoW70DMbVCvqQhFKQaGi5o) <bubnenkoff (Dmitry Bubnenkov)>:
though evaluation `x` as `'none` is working:
```
>>  parse [a: none] [ set-word! 'none ]
== true
```

[11:04:04](#0a5wjv2F_cObdzS7Sb771r6kcobAC0bAfYcWmhMICnE) <toomasv>:
How many nones are in your input? None.

[19:01:39](#zBx0CLjyk0HijPFnK_5kd3HcPWtFqHV6tTVthj_aX1o) <greggirwin (Gregg Irwin)>:
@bubnenkoff sometimes it can help to use other funcs to explore your data. e.g. `foreach ... print type? ...]` or a general `parse` rule that accepts any value and dumps info about it.

## 19-Mar-2021

[12:41:18](#Pi6x74KIMPrcchtRncRFk5REsSEw1-B1vxJyn2RYJ2I) <bubnenkoff (Dmitry Bubnenkov)>:
@bubnenkoff sometimes it can help to use other funcs to explore your data. e.g. `foreach ... print type? ...]` or a general `parse` rule that accepts any value and dumps info about it.

[12:43:13](#rUBNAstIjpRfse8C4qGmGZCeNZdP7SL_FDMtsZc-pR0) <bubnenkoff (Dmitry Bubnenkov)>:
* Could anybody show me how should look like rule that at first step process all set-words that have value int or string and at second step enter in words that have block as value:
```
parse [a: "hello" b: [ foo: 123 ] c: "world" ] rule: [   ]
```
I know about recursion, but it's not my case. I should to process first level and only than to enter in block. 

[12:49:25](#34vI2sSFWz-uSV-id9lK3Gi_449puFzXdg1bRH7VwrE) <bubnenkoff (Dmitry Bubnenkov)>:
How to split parsing in two step. On first to process words that have values as value. And on second to process only words with block.
I know about recursion, but I am not sure that it should be used here
```
parse [a: "Hello" b: [ foo: 123 bar: [ x: "name" ]] c: "world" ] rule: [  ]
```



[12:50:33](#UvBaRjdZX2VDa-UntUI2_3iulbcaQmjvtTc4njnwfbM) <bubnenkoff (Dmitry Bubnenkov)>:
I want to process first level, that to move to second and then move to third

[13:03:30](#JVjtQLfi8Y7SlUfYGgT8mQdD-KfyjLlIKkEfaWkLsMs) <hiiamboris (NOT THIS ONE)>:
why separate?

[13:15:42](#js1moltxG6pkQkHjArX0aMO-El44ViBGSjF5GJ13Zh4) <bubnenkoff (Dmitry Bubnenkov)>:
I want to make from mext structure:

````
data: [
    purchaseNumber: 848838383
    region: none
    lots: [
        objects: [
            object: [
                    OKPD_code: "25.22.11" 
                    OKPD_name: {aaaaaaaaaa} 
                    quantity: "1.00" 
                    isMedicalProduct: none 
                ]
            some: "Test message"
            ]
        ]
    tag: "is_lots"
]
```
Something like this:
```
 [
	[parent-name: "mainTable" key: [purchaseNumber region tag] value: [[848838383 none "is_lots"]] ]
	[parent-name: "objects" key: [some] value: [ ["Test message"] ]]
	[parent-name: "object" key: [OKPD_code OKPD_name quantity isMedicalProduct] value: [ ["25.22.11" {aaaaaaaaaa} "1.00" none ] ]]
 ]
```

I started with follow code:


```
root?: true
root-name: "mainTable"
block-name: none
inside-parent?: true

result: copy []
key-value: copy/deep [parent-name: none key: [] value: []]

parse data rule: [

    some [
        ( if root? [ key-value/parent-name: root-name ] ) 
        ahead [set-word! [string! | integer! | 'none ] ] set set-word-name set-word! set set-word-value [string! | integer! | 'none ]  
        (append key-value/key to-word set-word-name append/only key-value/value set-word-value)
        (root?: false) 
         | skip

    ] 

]

print block-name
probe key-value
probe result
```

But when I am going into recursion I am loosing child/parent name 
 

[13:17:13](#XssFyswxegML_-_qxyMtCze3__qpoG-JySrHrDqsydM) <bubnenkoff (Dmitry Bubnenkov)>:
* I want to make from mext structure:

````
data: [
    purchaseNumber: 848838383
    region: none
    lots: [
        objects: [
            object: [
                    OKPD_code: "25.22.11" 
                    OKPD_name: {aaaaaaaaaa} 
                    quantity: "1.00" 
                    isMedicalProduct: none 
                ]

            object: [
                    OKPD_code: "83.44.66" 
                    OKPD_name: {bbbbbbbbb} 
                    quantity: "2.00" 
                    isMedicalProduct: none 
                ]
				
            some: "Test message"
            ]
        ]
    tag: "is_lots"
]
```
Something like this:
```
 [
	[parent-name: "mainTable" key: [purchaseNumber region tag] value: [[848838383 none "is_lots"]] ]
	[parent-name: "objects" key: [some] value: [ ["Test message"] ]]
	[parent-name: "object" key: [OKPD_code OKPD_name quantity isMedicalProduct] value: [ ["25.22.11" {aaaaaaaaaa} "1.00" none ] ["83.44.66" {bbbbbbbbb} "2.00" none ]  ]]
 ]
```

I started with follow code:


```
root?: true
root-name: "mainTable"
block-name: none
inside-parent?: true

result: copy []
key-value: copy/deep [parent-name: none key: [] value: []]

parse data rule: [

    some [
        ( if root? [ key-value/parent-name: root-name ] ) 
        ahead [set-word! [string! | integer! | 'none ] ] set set-word-name set-word! set set-word-value [string! | integer! | 'none ]  
        (append key-value/key to-word set-word-name append/only key-value/value set-word-value)
        (root?: false) 
         | skip

    ] 

]

print block-name
probe key-value
probe result
```

But when I am going into recursion I am loosing child/parent name 




[13:18:09](#kK0cEvjf_0nqWDjik5q9oJzPyP5KJiEmosu0XVpR4SY) <hiiamboris (NOT THIS ONE)>:
make a function with arguments: child-name and parent-name, and recurse into it

## 21-Mar-2021

[21:33:26](#PP5CNc6mX6tn9oZGQjySJUFMOuhaX0ktU76N1iVyaFM) <rseger (rseger)>:
am I understanding `to rule` correctly: even if `rule` advances the input considerably before it ultimately fails, `to` will dutifully continue from where it began testing (and not where the input was left when things failed)?

[21:35:07](#iHx0uqfQ8_4oIflZYbkUXM9GQ6B9NvtrFuBUncHuf5I) <hiiamboris (NOT THIS ONE)>:
Exactly. This is called backtracking.

[21:35:52](#5KUTKrrxW0jGpKj8jsVy08I-tfU9ZwsJQfYQ3UoOXb4) <hiiamboris (NOT THIS ONE)>:
Exactly. This is called backtracking.

[21:38:13](#HH_mNJUbAUNVbbKU5B6Vf0aR_C8qPBXJxDU3GgRoIHk) <rseger (rseger)>:
excellent, makes sense. Love it when that happens :)

[21:39:04](#YSXnDZREr8SywyMpn4aN27VIUigKkxdLzRpCJ5AFD-U) <hiiamboris (NOT THIS ONE)>:
you can hack it to work your way :)

[21:39:35](#H_0kQJcC3hr0VGb51Edgzm2V3pe_BRmj0zpbibHPRbs) <hiiamboris (NOT THIS ONE)>:
read this? https://www.red-lang.org/2013/11/041-introducing-parse.html

[21:40:55](#ZPs2DSEV8n0rXuK3lf5JwMrLC64rRAHI_KURC9ISNBA) <hiiamboris (NOT THIS ONE)>:
there's `word:` an `:word` things in there of particular interest Ì†ΩÌ∏â

[21:41:16](#CudcIl4OnIHcIbTrbVsLQ8YSAo4Qn0RzIrKfTbMPEIs) <hiiamboris (NOT THIS ONE)>:
but I don't recommend hacking `to` 

[21:41:40](#TChbUHe7Cjl2OHgcabLFkNmI7a8vURSJlxNZ5wEHYXQ) <hiiamboris (NOT THIS ONE)>:
well.. if only to later discover how you were making your life harder

[21:42:00](#KLg6vBV7BlpB-sW9az-fTBlUaeTIfj_T_8EnlQdKB8k) <rseger (rseger)>:
constantly :)
most of the examples seem to assume transparent data. Meaning you can know what's before and after the nugget you're trying to parse. I'm having a hard time translating things for opaque data

[21:42:15](#y9QT0g0hWUfnjvDsjmH-y7aFQH3iGIWB5Q6U81duZuE) <rseger (rseger)>:
learning a ton, but struggling mightily for it :)

[21:46:30](#G8o9V-xYUC8kdrhUR6plmXAUUqaPSR88_NBjP9-w71A) <gltewalt (Greg T)>:
I struggle too

[21:46:54](#devI_G1VKJ7huFAHeDJMFZLTywYnILDBuw9F20XE-ic) <hiiamboris (NOT THIS ONE)>:
@rseger when stuck, parse your code snippet here, someone will offer an advice Ì†ΩÌ∏â

[21:47:15](#Q-4mcK0qhm2iVCCbFWBmJibgcBrufeXW6e05deUajB4) <hiiamboris (NOT THIS ONE)>:
* @rseger when stuck, post your code snippet here, someone will offer an advice ;)

[21:51:47](#3Pik0ZrrsZhNPH_4YIfxWK035gmFsuh3JseRw9H8CaM) <rseger (rseger)>:
sanitizing data isn't so wildly out of parse's use case that I'm running at a dead end, right? I have a semi-functioning horrific version working with regexes that I can no longer maintain because I can no longer read the gd regexes. Parse is like a goldmine for readability and I'm really hoping I can figure out how to use it this way without losing that

[21:58:08](#oXuiEN6OqD-LXAjo1QEJFhr-_ev5_KGjm16wYos2CmE) <hiiamboris (NOT THIS ONE)>:
you'll learn it Ì†ΩÌ∏â

[21:58:35](#-UohmYgE2OO2aAA5Eqgq5CqERRHFZ04xDdIuYiHmvQk) <hiiamboris (NOT THIS ONE)>:
sanitizing works just as well as anything else really

[22:07:12](#lbD14oP8Tz8-ip6eQeMTncGh3YB-lRhqlNZZp3RxBy0) <greggirwin (Gregg Irwin)>:
Almost anything can be done with `parse`, though it's not *always* the best choice. Sanitizing data is a perfect use case for it though. How complicated things get all depends on your data, and how well specified the rules are. You can use the free version of DiaGrammar (link at the bottom of https://www.redlake-tech.com/products/diagrammar-for-windows/) to see if visualizations help you think through it. 

As @hiiamboris if you post sample data and goals, you'll often get help here.

[22:13:24](#xdn3ry1OqtvoP13bpInlTn9vAAejVIBarqVCYnvRUgM) <rseger (rseger)>:
it has to work against intentionally degenerate data, unfortunately. Both the nugget and the surrounding opaque data are available to the attacker to manipulate in any way they like before it all gets passed through my engine. The data has to come out squeaky clean without destroying the good stuff in the process

[23:10:43](#6Y2oWP3XkOiCWkHKbAdNt7fMq19Y9MCW3ob7ZlFjyis) <rseger (rseger)>:
bah, my `to` hack works but it is painfully slow Ì†ΩÌ∏≠ why you gotta be right @hiiamboris? 

[23:15:42](#L-SdZ2lRxdYVhSlPplOqanlgq4kZ6FajKsAvc-8XOVw) <rseger (rseger)>:
I gotta take a break for a bit but if anyone is bored and interested in a concrete example, this works save being painfully slow
```
xor: [to [ to "$" begin-xor: copy first-var to [whitespace | "="]		; find the first var assignment where,
		ahead [to [{^^} any whitespace first-var]]						; that variable is ever ^ed (xor)
		to "$" copy second-var to [whitespace | "="]					; and the next variable
		thru [to "$" copy third-var to [whitespace | "="]				; is called, with the results assigned
				any whitespace "=" any whitespace second-var "("]
		thru [third-var "();"] end-xor:									; to a third variable, itself called
		(change/part begin-xor "" end-xor)] any skip]					; remove all the bad
```

## 22-Mar-2021

[8:05:06](#e6dJrfDpP2WSu32xNRaLdGdZEEkDcSSSGC_-DTL7T40) <hiiamboris (NOT THIS ONE)>:
Haha. I wonder if this code has O(n^4) complexity or near that (:

[9:14:56](#3Q_ocp7_E_JYsTcpmltVee56DTypyVpnC_rNfx1knos) <toomasv>:
@rseger Maybe post a small sample of your input and state what you want as an output, so we can hopefully offer some advice how to to go about it with `parse`?

[9:15:10](#Ikqv6RHXIcSSXo-vMDjK1H1l1rs5YxYPxb41n0cK6Lc) <toomasv>:
* @rseger Maybe post a small sample of your input and state what you want as an output, so we can hopefully offer some advice how to go about it with `parse`?

[14:56:21](#zPU0xFm_DY060ptWSJdHUJe-fr64z7Of4NHs4EF20fQ) <rseger (rseger)>:
I don't have a problem sharing it buuut, it's malware. It's inert, in that you would have to copy it into a php file and then have the php engine run it before it was at all harmful, but I can see how it would make a lot of people nervous.

[14:57:33](#CC5vjIWuR-JPzLiVqbo6OfhlOmiUsqgBK_oIaDXrOj8) <rseger (rseger)>:
had some ideas in twilight while I was drifting to sleep last night - love it when that happens and hopefully can get that knocked down from O(n^4) (It's definitely somewhere around there)

[15:53:16](#vOoEPNeACSQejycgCtG57x4b2_y__D5VxTYtmj_oPzw) <toomasv>:
No need for actual code, just something that would satisfy your constraints, e.g. following:
```
whatever 
$x = $y 
$a = 123 
$b = xyz
$c = $b(blah-blah)
$c();
gnah 
^ $a 
whatever
``` 
Should this be sanitized into:
```
whatever 
$x = $y 
gnah 
^ $a 
whatever
```

## 24-Mar-2021

[15:24:30](#kVelNAym62GBsev3_4SGpaMbS9VfnrvSveW-UKmDm0A) <hiiamboris (NOT THIS ONE)>:
@perk I've implemented your idea of a [parse tool](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/parse) (how I imagined it) so check it out Ì†ΩÌ∏â 
Can we improve it?

[15:24:43](#zOhg4wnM3A6lBcBIo4ubFUnE5YVRmUJRk-2ynwbn5c0) <hiiamboris (NOT THIS ONE)>:
* @pekr I've implemented your idea of a [parse tool](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/parse) (how I imagined it) so check it out ;) 
Can we improve it?

[15:32:02](#VxrREJhvjKGOQs9edATamYjGU9dKgdFHGL1NpNQoOcI) <hiiamboris (NOT THIS ONE)>:
I'm also interested in real world use cases if you guys have any

[15:51:14](#qKXZU7P512hybDyp-s9IYF-AmqK-rcoyZqFFUeUErug) <toomasv>:
@hiiamboris Seems really nice! :+1: 

[16:20:03](#yDC80vGQHu__FHQXvzHMLTwaSWGp7qog2kZBwghZN74) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
wut? In just two days? How's that? :-)

[16:20:36](#DUkuAEM1cUjmp8QqT67O5Gi1oCkxJHE_sf3yTqAkhpo) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I will try to run the examples, thanks for that!

[16:22:44](#PZu6WH1e2eDVs773j0Bpw9aVZxi7XIQOg3O5t0ODG04) <hiiamboris (NOT THIS ONE)>:
in 4 hrs Ì†ΩÌ∏â

[16:23:34](#rByjPmwTJ9dN84JvsyMwjUapic00JtOTbXH383bcw1E) <greggirwin (Gregg Irwin)>:
Look at how little code it takes @pekr, and everyone please say what you think of his CLI approach. We've had that waiting in the wings for quite some time.

Nice work @hiiamboris. :+1:

As far as real world use, making `parse` an option in our own future AWK-like tool would be a superpower.

[16:59:45](#8D_ocucGwa-_YPXjt4gN7Ond5SD8BAm5H2iRxSlyYmI) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
The only thing I might be concerned about, is the Red's parse speed. I do remember my R2 old days comparison to the CA-Visual objects lang, which compiled down to the native language. Rebol was faster and everybody was like - how could that be? It's just an interpreter. I do remember some examples with Red, which was lot slower, than in R2, but it is an old story, so I will have to re-try.

[17:00:27](#3p4_A23JX9ogYKqilq7d0btP9pDV2jPBcn8uFoKx3bU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@greggirwin I do remember some blog post, talking about the CLI. What was that? Is that some concept, like to create some CLI apps using Red and @hiiamboris just used that?

[17:28:06](#rwCtjj067Z5eSYP_tUJjc8bA_38Qa6d-vos4f3TNEC0) <greggirwin (Gregg Irwin)>:
We can profile it @pekr, what's your worst case scenario? But then, to be fair, we have to show solutions in the faster lang or tool, e.g. the consecutive vowel or mixed case examples. :^)

@hiiamboris wrote this CLI dialect. It's quite different from what I originally proposed, and I admit it's still different enough that until you use it a few times it may seem strange. If you look at the [parse tool code](https://gitlab.com/hiiamboris/red-cli/-/blob/master/mockups/parse/parse.red), you'll see a func called `parse-tool`, and then a [line](https://gitlab.com/hiiamboris/red-cli/-/blob/master/mockups/parse/parse.red#L73) that processes the CLI. The rest is magic.

Look again at the `parse-tool` func. Look at its spec. Look at the `--help` output for the app.

[17:29:30](#0r5Nju6_wx8f-iF_RfHmQ7J1ehLD5_EB_IRgQzHYCus) <greggirwin (Gregg Irwin)>:
The details for it are [here](https://gitlab.com/hiiamboris/red-cli).

## 26-Mar-2021

[19:43:01](#L8ooXSaw4e3Albmibh_Mr5WfWUQmyVCzXZ5kfB8OnQI) <rseger (rseger)>:
I've been trying to learn to incorporate `remove` into my parsers but I'm having a hard time solving for conditional removal. Meaning I want to remove something starting from the beginning of the parse rule but only if the whole rule ultimately matches. To complicate that, I need to scan through the whole file to find if the rule matches anywhere.

`remove to [bigger rule]`does the opposite in that it effectively destroys everything I want to keep.
`to remove [bigger rule]` isn't valid syntax. And thus far all of my efforts to embed remove into that bigger rule have resulted in partial removals

[19:43:14](#ClZhI9Sw4W2HYCtH0TYGh8lutQwAQY4DUEPkvDfFIYo) <rseger (rseger)>:
anyone able to point me in the right direction?

[20:18:42](#Pyd6DtSIwo5bdNQqGV-VHTWddx2DW9mFnL2DougxXFw) <hiiamboris (NOT THIS ONE)>:
like this?
```
>> parse s: "abcdef" [p: 4 skip remove p] s
== "ef"
```

[20:21:11](#rt16YTam2yFeSZtMoXe9VfwrxZPzGbnyOFOPJUrdb7w) <hiiamboris (NOT THIS ONE)>:
tried `to [remove [bigger rule]]`?

[20:22:39](#Qs413hYKy8p69ie1W3OgIGlpZuQ_KlPaSPs09IZBk2k) <rseger (rseger)>:
remove here is removing everything from `p:` to the current index when it's called?

[20:23:30](#uf26UNX8wZW4uZULEQwlWSPFr7OuIRhQh8U9_sKN6gc) <rseger (rseger)>:
and you can change that current index with `:other-spot` (assuming it's set, of course), right?

[20:25:08](#nRDQnXaDFq8W0EfvK_AIkMxoZnTyt45hCKpuJ7kqI1A) <hiiamboris (NOT THIS ONE)>:
yep

[20:25:35](#1FL7QXoGgAErXhTJ6uMMyqO7wxXt9u05gAxf3yBaDIk) <hiiamboris (NOT THIS ONE)>:
be careful though that all your indexes after start of remove will move too

[20:25:57](#n8kFgGsAOk7BdQF8tRt48yt9P-HRTdPeWiEkE08cwIc) <hiiamboris (NOT THIS ONE)>:
* be careful though that all your indexes after start of remove will move too (relative to the content that's left I mean)

[20:26:03](#X1ehEWuEn8MsbtTnBt5onZ9eqbI9FCSLUKOsM5Fx12o) <rseger (rseger)>:
good to know

[20:27:09](#Rj2ZEHZ57HWAhCisbLbsEjca5mfbSCTIR70iXWTgTwI) <rseger (rseger)>:
(and thank you - that is exactly what I was hoping to learn!)

[20:27:10](#rcRPzqsg_SIYblrzIPU1W5vVIOTQ6X0byGGYUQZ24kk) <hiiamboris (NOT THIS ONE)>:
I added `--write` to the Parse tool to batch edit files Ì†ΩÌ∏â

[20:27:23](#_RFnnZsi1guebJnvHgBYtCIm0qGlolL-CXGldLPe9jc) <hiiamboris (NOT THIS ONE)>:
With ports it will kill `sed` Ì†ΩÌ∏â

[21:30:24](#23qwYjGJBDsbbtJy6-wGyuAR4vpSPCV4qjz7zZI1dwM) <GiuseppeChillemi (GiuseppeChillemi)>:
Wow

[21:44:48](#dZ6wVlzXHIlXBIT3OIhpDqGK2y0Z62wf0dZTnibJ8OY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Can anybody explain what's goin on in this piece of Rebol2 parse code?
```rebol
defs: [<nothing>]

line-rule: [
	s: #L set line integer! e: (
		s: remove/part s 2
		new-line s yes
	) Ì†ΩÌ∏ñ
]

src: [
	R/S [
	  #L 2 T: "R/S"
	  #L 3 A: "o"
	  #L 4
	]
] 

parse src blk: [
	some [
	 line-rule
	| p: [path! | set-path!] Ì†ΩÌ∏õ into [some [defs | skip]]	;-- process macros in paths
	| s: 
	  [into blk | block! | paren!]			;-- black magic...
	  s: (print "END?" ? src halt)
	| skip
	]
]
```

[21:45:23](#kAmyQySNHMCuLSx9Fd0heTwIuJzM6JWc9IapFLQ-4sg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It works in R2, but not in Red (matching by datatype not supported) nor in R3.

[21:46:54](#9lNHrs1081NSYpaMtFngL13dZ0C50xDm4VXJbLutAdw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It's trimmed from [this Red's compiler function](https://github.com/red/red/blob/master/system/loader.r#L222).

[22:02:48](#2ekH_QaHwHun2WJGHY2OfRNm_dq7FfkGxycBMTIqz68) <hiiamboris (NOT THIS ONE)>:
what do you mean by "matching by datatype not supported"?

[22:05:07](#nZwevVMd39CitIRCyPMgoBgET8m2xUDPPB-iVpaVICk) <hiiamboris (NOT THIS ONE)>:
ah I see

[22:05:48](#4up4jAE0_BS0j7GoK1aeSPhty8mV-Vce2M-qECpUlhA) <hiiamboris (NOT THIS ONE)>:
try changing `into ..` smth with `ahead any-block! into ..`?

[22:06:55](#I0lH3gzJEM_lSnVoLlv8T-taSGY63r7iTqSjuHJb5dA) <hiiamboris (NOT THIS ONE)>:
* try changing `into blk` with `ahead any-block! into blk`?

[22:08:42](#6svAeGbYpPZVc3djFGPG4Ol_mrcnSsVdLYQaVeJpGpA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
This is the problematic part: `into [some [defs | skip]]`

[22:09:36](#otAO9hfo3mcvX_-B2zTzhaH4jexBCBGmjGidwguv0HI) <hiiamboris (NOT THIS ONE)>:
I don't see a problem there

[22:10:52](#xgBuqyn4DYAQSZK5xKeOE43bSaovkt9nUuOun6HP2yk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It's the combination of `into` and `skip`

[22:11:10](#uPgiMll5-gsIorA6V6QPHdZ8e51A3DCSlqai6jXG0T0) <hiiamboris (NOT THIS ONE)>:
So?

[22:11:32](#cLzq99ohknweLjsFqKzVBajfxdvxAkmRqhUfagKCzLs) <hiiamboris (NOT THIS ONE)>:
`into` applies the following rule to the path

[22:11:53](#2j1mlcV4h9SYqWyhjaCk6pJeAGx2PWNHYIObMDRQZ78) <hiiamboris (NOT THIS ONE)>:
* `into` applies the following rule `some [defs | skip]` to the path

[22:13:55](#Tay_5YX1SyAILQES4rW290ihjSBYxqfHpmjFQm0aptc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Where happens the:
```
*** Script Error: PARSE - matching by datatype not supported for any-string! input
```

[22:14:02](#QEw_Y4u1n5uVLdT3de5mGn8QB-GHT-5_EUzV49SborM) <9214 (Vladimir Vasilyev)>:
@Oldes try this in R2, R3, and Red. 
```
parse [""][into [none!]]
```

[22:15:03](#y5k-t5ohdi3FomhAU1RvwP_DPQB-cmO0YAPcBEPSWWs) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@Oldes try this in R2, R3, and Red. 
```
parse [""][into [none!]]
```

[22:16:23](#hVkoqPHNFLKgmwGWQVUYgoV1NLao5-LRuzjPm700J7Y) <9214 (Vladimir Vasilyev)>:
@Oldes try this in R2, R3, and Red. 
```
parse [""][into [none!]]
```

[22:16:34](#g8N4OZGb5EAsug-x7x7NYLtE0Z632_c1C-tjUlW0JTI) <9214 (Vladimir Vasilyev)>:
* `into blk` tries to match `"R/S"` because it's a series. The other `into` does some pre-checking (poor man's `ahead`) for paths and avoids that.

[22:17:23](#ucJkvfvK7UXt-i38NneaEiICDWZuJl2BeEjb8G6C1ok) <9214 (Vladimir Vasilyev)>:
* @Oldes try this in R2, R3, and Red. 
```
parse [""][into [none!]]
```
`into blk` tries to match `"R/S"` because it's a series. The other into does some pre-checking (poor man's `ahead`) for paths and avoids that.

[22:17:39](#5iXrDXPFulA4Evs3qpzBGpJoCL4tfQUywoVlIo0Y1KE) <9214 (Vladimir Vasilyev)>:
* @Oldes try this in R2, R3, and Red. 
```
parse [""][into [none!]]
```
`into blk` tries to match `"R/S"` because it's a series. The other `into` does some pre-checking (poor man's `ahead`) for paths and avoids that.

[22:22:12](#C0eXEnbRNF05k7YCkhr3TDw3zng9wKOkZiR35XRH7FA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
AH.. so this is the magic.. `parse ["R/S"] [into blk]` is `false` in R2, but error in R3 and Red.

## 28-Mar-2021

[2:05:48](#SkmD-9jRYp3onwTQLJYVdbcyObLttADtcgekA-F42-s) <rseger (rseger)>:
is there a clean/concise way to tell parse "if you've gone past here, fail"? Using markers, changing them to index integers, and comparing those works it's just not very elegant

[2:09:08](#dvYfKEKo3RDE2GXXQh_Os1q5fBeTgVwtmfFYJrHadHI) <9214 (Vladimir Vasilyev)>:
```text
>> parse [forbidden zone]['forbidden 'zone [fail] | (print 'fallback!)]
fallback!
== false
```

[2:10:45](#QoPrW9xTZCT0W-LX3uFdy555oHsGXriWwozxy4B2k4o) <rseger (rseger)>:
I was thinking more "if you've gone past the next newline, bail"

[3:10:13](#FLqqMlUdk4jk_jeiK2ZrZRNF7OFqizCEfEPFNhi1A5Y) <rseger (rseger)>:
am I right that `[0 1234 skip "a"]`would be more efficient than `thru "a"` when there is no "a" in the input, and the input is longer than 1234 characters?

[3:19:16](#20xOgKK9ahquFcMeMNV2kJq0SC_xpXjYQlCKoNi1sHc) <rseger (rseger)>:
nm - skip is super greedy so it won't work for what I was thinking anyway

[8:28:24](#kSrxgi6OG_wiWOpSnC_LmWP1Fs2MAhmMWmU7DC_cuSc) <hiiamboris (NOT THIS ONE)>:
not "greedy" :) `skip` just means accept any token. Parse rules do not look ahead.

[8:28:43](#l1toXukfI1fQ1WabTobMQIJH-fp0U2A1F7AYbqLUjtY) <hiiamboris (NOT THIS ONE)>:
* not "greedy" :) `skip` just means accept any token. Parse rules do not look ahead to see what rule is next.

[17:08:46](#2TYzL5i3aDDyofktnHhetp9-xjJESLCy_BX5s_sA3qg) <rseger (rseger)>:
fair, still stuck in regex land a bit Ì†ΩÌ∏≥ 

[17:14:18](#tQjd00QsQRuMKXmA4YOSGC5ecWV9sMDSWjBFiEOEB04) <rseger (rseger)>:
I just went through a chunk of my code from a week ago. Two things became apparent: I have actually learned a lot, my original cut.. Ì†ΩÌ∏≠ 

[18:15:36](#cBVYFMDd2YT0URdiLd_E1r7Gz_6Jq3MR66Pmwz0XkN8) <hiiamboris (NOT THIS ONE)>:
maybe you can start a "Parse for Regex users" wiki entry Ì†ΩÌ∏â

[19:03:00](#cQiNZVpWNEGwwPEZIUW-_0Iek45OfKaAS_W-O101Oq0) <rseger (rseger)>:
lol. I feel like maybe I should figure that out a little first :)

[19:19:44](#w0c6QRkq_VJTxLajzmRlMJnVVeYucGIjAnq99yE7V3s) <greggirwin (Gregg Irwin)>:
@rseger look at how much you've done in a short time, even with a few stumbles. Progress indeed.

Even thinking about how we use terms, or are used to their use in use cases where you hadn't had a case to use them, can be confusing. Is `skip` greedy in the sense that it matches any value, or is repetition greedy because it will consume all it can up to a point? Is `to end` the ultimate in terms of greed? 

I'm still amazed at how easy `parse` is to use for many things, given how powerful it is. That makes these clarifications important because it's easy to wade into dangerous territory without realizing it. Suddenly you're lost and the urge to run will not serve you well. :^)

[20:50:04](#tIJR_Yvftzex81H_szrkaUroB4HuwkEP7gxuVvp1-kc) <rseger (rseger)>:
heh, I've fought that urge a few times "I could just do XYZ with a regex and this would work". Problem is, regexes at this level of complexity are absolutely unreadable (if you can get them to work at all). Like it or not they are simply not an option - I need something more powerful. Parse is that, with an ice cold bucket of new perspective on the side :)

[20:58:22](#S8lCCjg3HLj1gjqDqDwwUqzSPAZ4DJGsUqwC8pNLDAI) <rseger (rseger)>:
lol, right into an ice bucket
```
>> parse "abc" [to "b" break]
== false
```
but the intro to parse page is saying `break	: break out of a matching loop, returning success.`
Is there a new command for that or am I totally misunderstanding again?

[21:07:14](#ZGVkDJNVP9gvKO0aDJqhjmv9DeIAd1NJQvWCqhZl-r0) <greggirwin (Gregg Irwin)>:
> an ice cold bucket of new perspective

Fair warning. I'm going to steal that line. :^)

[21:08:25](#bT0IwTMH7pfpsGVybkcp4ibWw00_2rPFjJ4OhUNKUxE) <greggirwin (Gregg Irwin)>:
https://github.com/red/docs/blob/master/en/parse.adoc#break is a better reference. Intro to parse was written a long time ago, and is likely stale in some descriptions.

[21:08:38](#mW_6-86shlGm5hdqVcD_8ix-AofGPWx91sg2BdZoVzU) <hiiamboris (NOT THIS ONE)>:
@rseger I suggest raising an issue about that. `break`, `fail` and `reject` designs are fundamentally flawed IMO. There was a discussion about them previously in https://github.com/red/red/issues/3478 , but unfortunately I don't know if Nenad saw it.

A more in-depth material https://w.red-lang.org/en/parse/ says that for Parse to return `true` it requires 
> Full match of top-level rule and input exhaustion

But to me it looks like a special case where one shouldn't be.

[21:09:16](#eqP-a7M8EgmNnKWIpbY9q9z4lcivJbJckHku07sq3uQ) <hiiamboris (NOT THIS ONE)>:
* @rseger I suggest raising an issue about that. `break`, `fail` and `reject` designs are fundamentally flawed IMO. There was a discussion about them previously in https://github.com/red/red/issues/3478 , but unfortunately I don't know if Nenad saw it.

A more in-depth material https://w.red-lang.org/en/parse/ says that for Parse to return `true` it requires 
> Full match of top-level rule and input exhaustion

"Input exhaustion" is what missing. But to me it looks like a special case where one shouldn't be.

[21:09:54](#ZqAjxmtpCsjje10B5_4tRobYsnCt5TgLFCcgcB3BBE4) <hiiamboris (NOT THIS ONE)>:
In any case it's worth careful consideration and documenting.

[21:10:44](#BdwI7xKlIiIV5r6mFu-8M5ZooOPkEzqQtgTim8p1TfE) <hiiamboris (NOT THIS ONE)>:
* @rseger I suggest raising an issue about that. `break`, `fail` and `reject` designs are fundamentally flawed IMO. There was a discussion about them previously in https://github.com/red/red/issues/3478 , but unfortunately I don't know if Nenad saw it.

A more in-depth material https://w.red-lang.org/en/parse/ says that for Parse to return `true` it requires 
> Full match of top-level rule and input exhaustion

"Input exhaustion" is what's missing. But to me it looks like a special case where one shouldn't be.

[21:11:12](#BWXw0HOOBUMKCz2K4Jhtm7uhEAYjk44y2czv2UIyZDc) <greggirwin (Gregg Irwin)>:
Docs say "Forces enclosing block! rule to instantly succeed. " but only repetition based examples are used. I agree that this needs to be clarified. 

The great thing about new people is that they don't know what to tiptoe around, reminding us of traps we automatically avoid. 

[21:11:37](#CqfHihsbfQxH2MwK87ET1BCkRNSZxtNaG2MUAfx6xVQ) <hiiamboris (NOT THIS ONE)>:
True Ì†ΩÌ∏â

[21:13:09](#sSS23SQhdLIHA4zSYDbUbtOz_Rdf7AantaDuvtv21rY) <hiiamboris (NOT THIS ONE)>:
* @rseger I suggest [raising an issue](https://github.com/red/red/issues/new?template=bug_report.md) about that. `break`, `fail` and `reject` designs are fundamentally flawed IMO. There was a discussion about them previously in https://github.com/red/red/issues/3478 , but unfortunately I don't know if Nenad saw it.

A more in-depth material https://w.red-lang.org/en/parse/ says that for Parse to return `true` it requires 
> Full match of top-level rule and input exhaustion

"Input exhaustion" is what's missing. But to me it looks like a special case where one shouldn't be.

[21:29:18](#GO8DifDocHp3NuzllaUPVPlFj75jP1-NsGHLRhc5Mpg) <rseger (rseger)>:
Ì†ΩÌ≤• <- my true skillset Ì†ΩÌ∏â

[21:32:21](#MrJQ9CdJw1XgkLAQSQF-JIoV22inBIRKTJbJ9pqntNY) <hiiamboris (NOT THIS ONE)>:
Dangerous! Ì†ΩÌ∏É

[21:35:24](#DRtnxt7tqfc1kAO3houa_3U--2BdO-itG6eAtr5Xmio) <greggirwin (Gregg Irwin)>:
Save that codepoint for function name annotations. We can blow Hungarian Notation out of the water, almost literally.

[21:35:47](#9sJHo-LeyC_FA716LJipk1n8lV186V2FiwNu0lW0zIs) <rseger (rseger)>:
`to end` works, similar to `any skip` - I was just looking for a more efficient "you're good buddy, thank you"

[21:38:34](#9CDaKaRPTHGQ52EBex2Oj0JzWwoGj9o4EAbgEkWOAbE) <greggirwin (Gregg Irwin)>:
*Finally* someone who is kind to their constructs. :^)

## 29-Mar-2021

[2:17:46](#moER7jgnC0zAFijoB5sh05QhfcCWDbfSZTYUKD-ydAI) <9214 (Vladimir Vasilyev)>:
@rseger, `break` forces enclosing block to succeed, but also breaks looping constructs (i.e. `any`, `some`, `while` and integer repetition), if any. Control-flow keywords in Parse are bugged though, see https://github.com/red/red/issues/4193 for potential pitfalls.

[2:19:10](#6-4Rr8hFvn_5KUcXD3NfTIMeNcQ8K6igQJOXXdKf9to) <9214 (Vladimir Vasilyev)>:
* @rseger, `break` forces enclosing block to succeed, but also breaks looping constructs (i.e. `any`, `some`, `while` and integer repetition), if any. Control-flow keywords in Parse are bugged though, see https://github.com/red/red/issues/4193 for potential pitfalls. Your example is a bit of a special case: `break` "breaks" top-level rule, so it should return `true`, but then it did not actually exhaust the input, so it's `false`.

[2:43:13](#LkhQrLRWbwi6wFHWW4bMjxvJeGsK2w25QO1bK1SSh68) <gltewalt (Greg T)>:
Why did they decide on returning `true` when input is exhausted? Seems to me that people are primarily concerned with whether something matches or otherwise succeeds along the way to the end of the input.

[2:45:14](#EYP9i2zmi3SsT0CZkit9CSVeZNZ18PPxqhJQWktqAHg) <gltewalt (Greg T)>:
I know it's an expression based language, and has to return something

[2:46:19](#WUO5L-6Cirikkzzy1Bf7sWNuqDEkUm0fkvpLiLjEFCI) <rseger (rseger)>:
I appreciate the heads up!

[2:48:11](#S-TopcNyiWNCgBvcU8n9fG3nspfM2DUCCbFryyTO_ds) <rseger (rseger)>:
I don't know that it makes sense beyond my use case but a word which halted everything and returned true, just the opposite of how I assume `fail` is implemented, would be cool.

[2:49:08](#XaA9vCgYod03Fyi1xn-QHoQA74tYxyxZXQXlItTbl1s) <rseger (rseger)>:
* I don't know that it makes sense beyond my use case but a word which halted everything and returned true, just the opposite value but how I assume `fail` returns, would be cool.

[2:49:26](#3VnojRF5WZQ42TxXf84rrxOVX8G0Ko0yJSfYrLfR5jw) <greggirwin (Gregg Irwin)>:
How can it know when *you* think it's done? If you don't care after finding a match, just add `to end`, which also makes your code more self-documenting. But also consider that you may be collecting data or executing commands in a dialect. If you want to scan an input without actions, you can still tell if it's valid. Another use case might be a dispatcher that takes inputs, scans them fast without actions, and sends them on to handlers based on the match. If you only do partial matches, you may not be able to distinguish two inputs that start the same, which comes back again to how does it know what you want?

[2:49:37](#96CUqFy2eeE0yl-x3dcWcXrmQOssdCicSdyT0WZWrPc) <greggirwin (Gregg Irwin)>:
* @gletewalt, how can it know when *you* think it's done? If you don't care after finding a match, just add `to end`, which also makes your code more self-documenting. But also consider that you may be collecting data or executing commands in a dialect. If you want to scan an input without actions, you can still tell if it's valid. Another use case might be a dispatcher that takes inputs, scans them fast without actions, and sends them on to handlers based on the match. If you only do partial matches, you may not be able to distinguish two inputs that start the same, which comes back again to how does it know what you want?

[2:50:12](#Kl7QVLtpCSz2T9GpjjEI8t6bjmjW2FG6nfkfJPPFuGY) <gltewalt (Greg T)>:
It knows by Stern Scowl

[2:50:18](#3i2DvibUV4B9_fBeuWNgURowYuxMC-SuYofoPi-w2cE) <rseger (rseger)>:
lol

[2:50:46](#xsP5z-6df-1YBA68wawIDC38LgY-Kz_NE0xzNNrDn3U) <9214 (Vladimir Vasilyev)>:
@rseger that depends on what you mean by "halted everything and returned true". Do you mean stop parsing and force `parse to return `true`?

[2:50:53](#B7YLH_t_ypJAbInOSdbs3gYWokOrHubkGgfpQNPj_EU) <9214 (Vladimir Vasilyev)>:
* @rseger that depends on what you mean by "halted everything and returned true". Do you mean stop parsing and force `parse` to return `true`?

[2:50:58](#C8C30oXwkFce6Ft9rSIliR0MAVqNQrVzQ56zSdoIAUI) <rseger (rseger)>:
yep :)

[2:51:45](#itnNWotvYa19Ou6nZTULxZjtIyYhkx3Dy_z1u7kHEhk) <9214 (Vladimir Vasilyev)>:
Well, the only way to do so is to consume all the input, so I think you know the answer.

[2:53:29](#S8NaPo948sqN_EjMnvFg-zqVaakqzUETjk_6oj3E0OI) <rseger (rseger)>:
right now, yeah. It's not super efficient when I've got MBs of input left but I already found the thing I wanted

[2:54:15](#zJfbVjYLEarSgImxkXqa8hZ-jtgT9eFfSLzeDkZSz94) <9214 (Vladimir Vasilyev)>:
@rseger you can mark the tail of the input in advance and then simply use `:mark`, for example.

[2:54:44](#XQILoTIOEEYtIlp20A0ThTdvlpX1S6nDsffp1p5Xu_8) <9214 (Vladimir Vasilyev)>:
* @rseger you can mark the tail of the input in advance and then simply use `:mark`, for example. Should be marginally faster than combing thru megabytes of data with `to` or `thru`.

[2:58:05](#LkEUAlKQTuu93pxm_ar2S_Fzq-pqjvwICWpTmAJ1HJ8) <9214 (Vladimir Vasilyev)>:
Or you can rephrase the problem: why do you need `parse` to return `true`? You can signal that the thing you wanted is found the other way, e.g. `[thing (found?: yes)]`.

[2:58:08](#SO3kMtjKXPRMXgbRXbT54x6pQ823ibzBrOCkgy2mVzM) <greggirwin (Gregg Irwin)>:
@9214, what's your view on using `throw` for that case?
```
accept: [(throw true)]
catch [parse [a b c]['a accept]]
```

[2:58:08](#ljfHfecDfCOcDHv8gilOZsvCB6S4yvJHyaGZlMkEIuI) <rseger (rseger)>:
I really like the sound of that. How do you get the input to the end in order to set the `mark:`?

[2:59:01](#Nhm-KoBCv6C1lTFpkuHVgrv1oSGWoD49JpL0V0UcCjw) <9214 (Vladimir Vasilyev)>:
@rseger `mark: tail input`?

[2:59:12](#jm3BVoeLYUcp7pglkbR8K0Ko9GPiexSWKfP-SqANMrw) <9214 (Vladimir Vasilyev)>:
* @rseger `mark: tail input`? In pure Red, that is.

[2:59:30](#1ZhZ4mC0AYQmTe0M0sv7C-jNP3Aw-78fTPlL7Hl41tQ) <9214 (Vladimir Vasilyev)>:
* @rseger `mark: tail input`? In pure Red, that is. IIRC Parse docs have some examples that show that approach.

[2:59:50](#b3U9B2R6ZYPiXoCSxj4m9kHWZza-kplzvPLB4LVHhfo) <rseger (rseger)>:
that's true. Right now I have a really slick little `foreach` loop running through all of my parses. Each one of them is executed in a `while` loop. So, while they are finding things they get sent back out to keep trying. As soon as they are unable to find what they are looking for, the next parser is called in

[3:01:24](#93Xu5KywJ-YMb0NBY3q7RoEk1YlWow3vDIwLL2NZmJc) <rseger (rseger)>:
looking to an external variable for success/failure could certainly work, and I may need to go that route if that turns out to be a considerable efficiency gain, but using parse's return value directly is really nice

[3:03:52](#wcT7Ay-iK5um4HmuLvDeaIFHRIHPIYDiVb7aAEGFjHs) <rseger (rseger)>:
forgive the newbie question but you can set marks in/on input outside of parse?

[3:04:21](#59k2WgqjfTPR3gF7BSxPXhcn0k0OA3MLEZBfzYJDN3M) <rseger (rseger)>:
or is `tail` a special word in parse?

[3:05:41](#dBLYkus1yHOXB1deNM2buE3ag8UuNcTF8YMX_UQckSY) <9214 (Vladimir Vasilyev)>:
@rseger no, `tail` is a Red native that sets series' index to a, well, tail. Just like `head` sets it to a head. Are you familiar with how series work in Red though?

[3:07:29](#o1haTgzsUpbodsgcLnKXBjQ7zZ79FiSDRyA5nh0Uxt4) <9214 (Vladimir Vasilyev)>:
Does that make sense?
```text
>> block: [a b c d e]
== [a b c d e]
>> c: find block 'c
== [c d e]
>> e: find block 'e
== [e]
>> parse block ['a 'b 'nope | :c mark: (probe mark) :e mark: (probe mark) skip] 
[c d e]
[e]
== true
```

[3:07:48](#EscTka52lvl-qMmm9QvzIOOYDUVwrlYP586nB2xMYoE) <rseger (rseger)>:
well, I thought I was :)
evidently there are some subtleties there I'm missing.

[3:07:59](#ArrPmkPypDi30jpMF6UpGWWXG_4PEIhoN8ZdcsGjdDU) <rseger (rseger)>:
let me noodle on that a sec :)

[3:13:44](#E9As1eE7dCLGDAHZJaoomMRKBLC7jt8CdY5bp1vynJM) <rseger (rseger)>:
find is returning a pointer into that series, effectively?
`:c` is inserting that pointer as the current parse index. Then `e` is doing the same.
the final skip is eating that last 'e'.

[3:13:50](#in6yIGoDXewFaEPdtr-S1J-UyzAF4dL4OuT_l1Idiv0) <rseger (rseger)>:
am I reading that right?

[3:14:26](#W68RGgqzdO4ycFB68w7UjCrZ8AkOyr9FFWyTEWyx0QY) <rseger (rseger)>:
* find is returning a pointer into that series, effectively?
`:c` is inserting that pointer as the current parse index. Then `:e` is doing the same.
the final skip is eating that last 'e'.

[3:15:49](#qzj1e2tgwehp0ll6jyXHZCfgM3LpMsExr9rrv-L5-yg) <9214 (Vladimir Vasilyev)>:
@rseger yes, conceptually that's correct. Series is a homogenous array with boundary checking + an offset (or rather a 1-based index, but internally it's a 0-based offset). Kind like Go's slices, except that the length cannot be modified.

[3:17:45](#cRPlwjHJaP0yjO8BhETYMRnRsjRr5C1TAdRkyO_Gvdk) <9214 (Vladimir Vasilyev)>:
So, in the example above, there's a single array (aka data buffer) `a b c d e` and two indices into it, `c` and `e`.

[3:18:18](#VkeWNEzwSzNHkz_IEstxxLyjGLt0SyLylJV3Qev13gU) <rseger (rseger)>:
wow. Evidently I understood almost nothing about how marks/find, all of it, really works. This is incredibly helpful, thank you!

[3:19:26](#C-RbfH-dye2M4cphXMtBYrNRtB-7OMEqmlIdlsjZonM) <9214 (Vladimir Vasilyev)>:
@rseger [Rebol/Core](http://www.rebol.com/docs/core23/rebolcore-6.html) user guide has some pretty pictures that might help you.

[3:19:52](#kNYiWaLgNWBIcC1DhRVVlpndOLMa_cfOQlru9pKoM0k) <9214 (Vladimir Vasilyev)>:
* @rseger yes, conceptually that's correct. Series is a heterogenous array with boundary checking + an offset (or rather a 1-based index, but internally it's a 0-based offset). Kind like Go's slices, except that the length cannot be modified.

[3:20:21](#8A3_l9qtZB2h_JvC3gdp3vuFhvldkDyV5-OnMn4DG20) <9214 (Vladimir Vasilyev)>:
* @rseger yes, conceptually that's correct. Series is a heterogenous (i.e. it can contain any value regardless of its type) array with boundary checking + an offset (or rather a 1-based index, but internally it's a 0-based offset). Kind like Go's slices, except that the length cannot be modified.

[3:20:39](#4RymHqKNcHUhNniMNuzhBbbjyIKQ8QUjfXhtcV-0pBY) <rseger (rseger)>:
yeah, those were helpful. What I didn't put together was their relationship with parse. I thought the two were entirely independent ways of working with series

[3:21:32](#OTFBVw3lRLcwzdwGGtpxPsatuxnrBVtnlmK0r5_-UII) <rseger (rseger)>:
seems I can do some pre-processing on the series before entering parse and (conceptually) pull that information in during processing. Amazing.

[3:22:39](#75HpZxo_fT5oIu_AnECkhNrZeyNIfs5JGREkPGMXTLA) <rseger (rseger)>:
is there a way to have parse process the series in reverse?

[3:23:33](#XsMAemhl1d6IXj0ZbujJn2HoxW0meQZfGspfOlTjWCY) <rseger (rseger)>:
conceptually that might be hard for me to wrangle right now but it would be incredibly useful for my use case

[3:25:18](#lTzqIv4doa1CJxonNUHgn0rVqNFCjJkQkYCIRWBJgRQ) <9214 (Vladimir Vasilyev)>:
Well, you'll have to either `reverse` the input and write all the rules in Da Vinci's mirror writing, or do a lot of scaffolding.

[3:26:27](#pXd0x1QTTGFR1n-T4OU531-Sf45iJo3EppfliW8ik8Q) <9214 (Vladimir Vasilyev)>:
There was some talk in the past about adding extra modes to Parse (reverse, Packrat, etc), but no one knows when it will happen, or happen at all.

[6:16:19](#jRyvm67JvJp81XRHIDssrPs_SPCyG7-EqbI0DL9M1FM) <toomasv>:
@rseger I use backward parsing a lot. Here is main logic of it:
```
>> block: tail [a b c d e f g]
== []
>> parse block [[any [s: if (head? s) break | (probe s s: back s) Ì†ΩÌ∏ñ]] :block]
[]
[g]
[f g]
[e f g]
[d e f g]
[c d e f g]
[b c d e f g]
== true
```

[6:17:36](#zTyzUcUuZ7qZ4cw-2VIX3T9SAlJblMRLsOar5v47mNY) <toomasv>:
* @rseger I use backward parsing a lot. Here is main logic of it:
```
>> block: tail [a b c d e f g]
== []
>> parse block [[any [s: (probe s) if (head? s) break | (s: back s) :s]] :block]
[]
[g]
[f g]
[e f g]
[d e f g]
[c d e f g]
[b c d e f g]
[a b c d e f g]
== true
```

[8:03:24](#sVFkOspI7EQiTq9pEAiwyACIpEbh__-olipBDCDkLuI) <toomasv>:
Here is a bit more involved example of finding needle in possibly nested block by backward parsing:
```
block: [a b c [d a g f e] g h]
needle: 'a 
parse block rule: [
    (mark: none) 
    s: opt [if (head? s) (done: tail s) Ì†ΩÌ∏Éone] 
    [
        any [
            s: (done: tail s) ahead needle mark: Ì†ΩÌ∏Éone 
        |   ahead block! into rule s: [
                if (mark) thru end 
            |   (s: back s) fail
            ] 
        |   if (head? s) [
                if (s = block) fail 
            |   Ì†ΩÌ∏Éone
            ] 
        |   (s: back s) Ì†ΩÌ∏ñ
]]] 
mark
== [a g f e]
needle: ['g 'f]   parse block rule   mark
== [g f e]
needle: 'g   parse block rule   mark
== [g h]
```

[8:12:08](#uIE3O5QoX-VEl4S-_d82Jw0cH3kL5tzQyZupHBl3z24) <toomasv>:
* Here is a bit more involved example of finding needle in possibly nested block by backward parsing:
```
block: [a b c [d a g f e] g h]
needle: 'a 
parse block rule: [
    (mark: none) 
    s: (s: tail s) :s 
    [
        any [
            s: (done: tail s) ahead needle mark: :done 
        |   ahead block! into rule s: [
                if (mark) thru end 
            |   (s: back s) fail
            ] 
        |   if (head? s) [
                if (s = block) fail 
            |   :done
            ] 
        |   (s: back s) :s
]]] 
mark
== [a g f e]
needle: ['g 'f]   parse block rule   mark
== [g f e]
needle: 'g   parse block rule   mark
== [g h]
```

[8:13:12](#bhxkhFhD_sLXy9nwgyEXnBiWQcr91BpwA_E9SQOPpD8) <toomasv>:
* Here is a bit more involved example of finding needle in possibly nested block by backward parsing:
```
block: [a b c [d a g f e] g h]
needle: 'a 
parse block rule: [
    (mark: none) 
    s: (s: tail s) :s 
    [any [
            s: (done: tail s) ahead needle mark: :done 
        |   ahead block! into rule s: [
                if (mark) thru end 
            |   (s: back s) fail
            ] 
        |   if (head? s) [
                if (s = block) fail 
            |   :done
            ] 
        |   (s: back s) :s
    ]]
] 
mark
== [a g f e]
needle: ['g 'f]   parse block rule   mark
== [g f e]
needle: 'g   parse block rule   mark
== [g h]
```

[8:46:54](#Gh4uP8pt5QRBkTndX-dzmezuqGiTgnLqahaXxaOhP3E) <hiiamboris (NOT THIS ONE)>:
this is highly inefficient though, you would be better of with find/reverse

[8:46:59](#uDXahSOY7ZHdWiQkwg7pNM19TJOX5nGCu7KLxycqGXA) <hiiamboris (NOT THIS ONE)>:
* this is highly inefficient though, you would be better off with find/reverse

[8:47:42](#WJkq7pzlmnwyJGNNxMMN366byoCVpDCGv_JnZl8SxAw) <toomasv>:
* this is highly inefficient though, you would be better off with find/reverse

[9:36:05](#fMoPz_Wgbq4px1ugTu-P9FncdGqEsad9t_-JdvPHIKs) <hiiamboris (NOT THIS ONE)>:
@toomasv for the record, what's your use case?

[9:36:17](#GCSuWiYp21Ibhg-gJ98Cu_3AjKF6DiDmR9rjXzVcIqQ) <hiiamboris (NOT THIS ONE)>:
* @toomasv for the record, what's your use case(s)?

[9:39:06](#nvZFk5PQ3XZh2_Dxzky6c52Fe2RXRlo-GkZSRTACfZA) <toomasv>:
I use backward parsing with draw blocks (which can be deeply nested) to to match and extract or edit latest (i.e. visually upmost) shapes or transformations.

[9:39:16](#G2pkeN9VIcJZ1H2eR8fPUdP3oUDBoRevxY6hK3tJkAM) <toomasv>:
* I use backward parsing with draw blocks (which can be deeply nested) to match and extract or edit latest (i.e. visually upmost) shapes or transformations.

[9:39:56](#hmMwRmF4k3ARFXq30PKuXqNTJhgNM-lQBgEwsvlyS_4) <toomasv>:
* I use backward parsing with draw blocks (which can be deeply nested) to match and extract or edit latest (i.e. visually front) shapes or transformations.

[9:42:19](#sY1ltBVYLCgSJRMmkRSpNTOTwMyKLBuip8_UBrVu4ys) <toomasv>:
* I use backward parsing with draw blocks (which can be deeply nested) to match and extract or edit latest (i.e. visually front) shapes or transformations. 
The above snipped was just made up. I don't think I've used exactly same form before.

[9:42:27](#_7dWbLGAGaF9EO6lNhOl0nkUeSI6l7tw6zzuGFeH1uk) <toomasv>:
* I use backward parsing with draw blocks (which can be deeply nested) to match and extract or edit latest (i.e. visually front) shapes or transformations. 
The above snippet was just made up. I don't think I've used exactly same form before.

[9:45:45](#vXBvXsSAaAgL6kmbxL4BaK3bT0RcupdXISuSe5dq7lU) <toomasv>:
* I use backward parsing with draw blocks (which can be deeply nested) to match and extract or edit latest (i.e. visually front) shapes or transformations, often identified by mouse offset only. 
The above snippet was just made up. I don't think I've used exactly same form before.

[14:45:18](#C1kR2Ph3z-85QK5lTZKtYX5liT40UrCQ6B0-IN7toCc) <rseger (rseger)>:
`back`? I didn't know about that at all. Is there a way to go backward in larger chunks? Say I wanted to back up by 1K bytes?

more importantly, thank you!

[15:08:48](#eFTrZZk3oXX9x_Q3XnZPZFhDDgVuBXxQtgTnHUjHhZc) <toomasv>:
look at `? skip` 

[15:12:17](#DbIgIa-M09642rO2Uj0Q5f5egxVn3YjO8AzO1Yl7pyg) <toomasv>:
```
>> str: tail append/dup "" #"0" 1000
== ""
>> head? skip str -1000
== true
```

[15:13:10](#PuJ_YmRzm2pKoPk2KVxb2yNjHDkvTONRueUejn-Vzzk) <toomasv>:
* @rseger look at `? skip`

[15:15:51](#QrPhQtzfyIZHq8XnZ3feduz8utHsByz1oxe-uWKp2dA) <toomasv>:
* ```
>> bin: tail append/dup #{} #{00} 1000
== #{}
>> head? skip bin -1000
== true
```

[15:17:43](#rsZLC0qHCDx2GYY3pfDWQXkCOzTaIgD4XCkop6sCOYs) <rseger (rseger)>:
you can skip negative numbers?!

[15:17:51](#XFdHtF-5pp1nupAL_H76oW0_udIoxK11dWdZkzK6GqQ) <toomasv>:
Sure

[15:17:52](#Xc35mo-dOb7cpHVIMApJD4greucrpR_Km2NdZPj9_9s) <rseger (rseger)>:
so much love

[15:18:54](#zljoHvj8K4kbfpCNKg5Xn6N68qSfRRMnfCWSNtm_Ijk) <hiiamboris (NOT THIS ONE)>:
It looks like some people come here not because of Red, but because of Parse alone Ì†ΩÌ∏â
@rseger how did you find out about Parse?

[15:20:54](#6zLxs82kzbipdbeqO1ocJWmGSJ5nkGGUDC6lhPpK7GU) <rseger (rseger)>:
somewhat, kind of - yeah, very guilty. Happy coincidence is that I'm really digging Red as well. I realized the other day that I very rarely have syntax errors while coding Red and that's quite unusual for me, particularly when learning a new language.

[15:22:30](#7jONBVhmfM9XO9hw87oxbNtx_WeQjNn1D4RYUuvEbS8) <hiiamboris (NOT THIS ONE)>:
So you've been digging Red a bit and realized Parse is what you need and started digging it instead?

[15:22:38](#IpKZ5mTn93swQqk4Z1IxW6_rv7h1RzQuptex5kHc6FE) <rseger (rseger)>:
I ran into the limits of regex, thought about creating my own one-off solution, and remembered that there's no way in the world I'm the first person to have this problem. Took some aggressive googling but I did finally find an alternative. Originally my goal was effectively just a subset of regex with great readability. I found a superset, just need to totally upend the way I look at the problem, lol

[15:23:47](#xbJJQP2IKOCWID7V93lSq5Ed1ZiKosQxNOv9dJ5Hxq0) <hiiamboris (NOT THIS ONE)>:
I see. Do you happen to recall what webpage told you that there's Parse? Ì†ΩÌ∏â

[15:24:35](#_NzQGypcidhaNcknGZsMdEZR15p_mrwtK9A7QuMWsnA) <hiiamboris (NOT THIS ONE)>:
I'm just curious because like you say I imagine it'll require some really aggressive googling to find it..

[15:24:58](#Ndqe1w2dwsoFMrZJ5SYpnn1f7FgtNJC0eGSJA1myJQQ) <rseger (rseger)>:
I solved 50% of this problem (it was 100% then, the problem is ever-evolving) about 6mo ago with pure regex. When I returned to pick up that extra 50% I realized I was going to have to re-write the original regexes because I couldn't read them anymore (and I'm fairly experienced with regexes)

[15:25:47](#Xf0CgNGfJRT01iyp8wf25NJae8a7jz1y4ql-0vS6WxM) <rseger (rseger)>:
let me see if I can't recreate the searches real quick

[15:25:58](#-Ge35UNdMAMZXGLWIyckNe6HfNfk8LSsP8lZpHEvTH8) <rseger (rseger)>:
it definitely wasn't a "oh, here's your perfect answer" situation :)

[15:31:53](#CAm-ZwxrHLDu_qdIUYm7BGjgsXpEWy34qKof3aqICpg) <hiiamboris (NOT THIS ONE)>:
Ì†ΩÌ∏É

[15:39:13](#6XMmRc8sy58FM7vsv6yzvP0b514nFrYUrD-WAMQahNw) <rseger (rseger)>:
alright, here's the high level. I'm not sure whether google's algorithm is lying to me now or not. I recall digging through 10s of pages of results for the last step and now it's only the fourth down but ultimately, here's the ark
search "alternatives to regex" -> "regex is the best, you're just dumb" and "somebody made an ABNF parse in javascript".

search "BNF parser" -> 100's of effectively specialized solutions similar to what I was considering making.

search "alternatives to regex" -> chase the results. This sounds quick but I read through a lot of garbage to finally get to this nugget `You may want to look at the RebolLanguage. It has parsing built into the language, using a syntax that looks like the one you described` in a message thread on `wiki.c2.com`. Rebol gets you to Red pretty quickly  :)

[15:44:12](#WjFH-nQNF_NFenwrNd8NiXFCb6wDakAGLB8---MTWq8) <hiiamboris (NOT THIS ONE)>:
Thanks! That's quite a lot to skip thru to finally find what's you're looking for..
I imagine Parse being useful on it's own should have more active advocacy agenda (something for @greggirwin to consider).

[15:44:40](#CrW2KlsTErffc8r-2qmBvK_MNB9lqsblKc3kYH5RBSo) <hiiamboris (NOT THIS ONE)>:
@bubnenkoff should you come around, please tell us how did you discover Parse? Ì†ΩÌ∏â

[15:46:26](#FG3Z23SUezijZ3qQ19HWoN7rb0peHwQKTImUxrtvP_w) <hiiamboris (NOT THIS ONE)>:
* Thanks! That's quite a lot to skip thru to finally find what's you're looking for..
I imagine Parse being useful on it's own should have more active advocacy agenda (something for @greggirwin to consider).
Kinda speaks though, of a power of a language at whole, if just one small dialect of it draws so much attention.

[15:47:40](#Q_sX75ssJPmUCLx_dNU4v_54eofE8PDG4U41DvErnJc) <rseger (rseger)>:
Every new language is always looking for its "killer app", most of them don't really have anything except novel syntax and making XYZ for the specific problem(s) they were designed around easier. Since those problems technically can be solved in any other language, the new language basically just languishes at the fringes. I love them because they represent new ways of thinking about problems but that's as far as I get with most.

Red has the "killer app" already, parse is ridiculous. Just needs some marketing :)

[15:57:10](#igE9urrjoShFBoIrwt-u0ngfnfAleGhB8KLt_v6sEeU) <hiiamboris (NOT THIS ONE)>:
That's what @pekr says too. And what the experiment of [Parse tool](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/parse) is all about. But I guess we need to gather some real world use cases to make the tool solid. I don't really have anything myself except occasional `type file | find "string"`.

[15:57:17](#-W_QgjcjY0yK63FYUs35C0Yn3gSdQzRcfTWztBJCbD0) <hiiamboris (NOT THIS ONE)>:
* That's what @pekr says too. And what the experiment of [Parse tool](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/parse) is all about. But I guess we need to gather some real world use cases to make the tool solid. I don't really have anything myself except occasional `type file | find "string"` filter.

[16:00:30](#gPglpxPX7D0kvMQ33UIi8p46lVF3_tGuTnuWyLzE4Jk) <greggirwin (Gregg Irwin)>:
Thanks for the info @rseger. Helpful indeed. And yes, @hiiamboris, we need more `parse` advocacy, which is one of the goals of https://www.redlake-tech.com/products/diagrammar-for-windows/. 

[16:59:13](#6pcZReZZTjucTpdhzwoNjdmgGV0N4TK6viYsfpOYqEI) <rseger (rseger)>:
the other thing that would be really helpful, something I hope to help with, is a more robust set of string-centric examples. A lot of the more robust examples are very focused on block parsing. It's certainly possible to do the translation but much harder when coming from a regex background.

[17:00:03](#MmYqDZQUwhrivxNqy87IwKpaSRg7VJgSeG76OGeySFM) <greggirwin (Gregg Irwin)>:
Agreed.

[17:02:56](#hMvyEqZcguvJ-IZob28epD-blzE8NpdJ8bZJq50Caq0) <hiiamboris (NOT THIS ONE)>:
FWIW these pages have some potential for highlighting Parse and Red :
https://rosettacode.org/wiki/Category:Text_processing
https://rosettacode.org/wiki/Parsing
And others there... Red is often missing or contains solutions without wow-effect.

[17:05:37](#UjDRcJGZnxE3wnLoLfKDF2yNsQcpJS1jzZPeQvkEvbE) <greggirwin (Gregg Irwin)>:
We could make notes specifically for that on https://github.com/red/red/wiki/Advocacy.

[17:06:13](#-XhVt0YFdaQKRxswQ5MNp5nbRcJ-sJlEBP_nY0Den6U) <greggirwin (Gregg Irwin)>:
And put things here too: https://github.com/red/red/wiki/Parse-Cookbook

[18:36:42](#iaVJ7ij29jmD0Z4yWDXuQCO1WmMK49bBhPfdhm9gqWo) <bubnenkoff (Dmitry Bubnenkov)>:
Is the re
> @bubnenkoff should you come around, please tell us how did you discover Parse? Ì†ΩÌ∏â

I will answer tomorrow. 


[18:37:31](#-X8-0T4gTBxM7LtfMBslkUNDSuaCM-KQiTyVy4Mo8B4) <hiiamboris (NOT THIS ONE)>:
:+1:

[18:38:48](#HqmxclLPaRX0pylerpcbyYmzyo3u2EplSOSfPK4LIWc) <bubnenkoff (Dmitry Bubnenkov)>:
I need to check if any values are not block. I wrote next code and not sure that it's optimal (it's working):
```
if value? 'at-least-one-integer [ unset 'at-least-one-integer ]
parse [aa: [] cc: 1 bb: []] [ 
			
			some [ set at-least-one-integer integer! | skip ] 
			 if (value? 'at-least-one-integer) to end | [fail]
		]
````

On: `[aa: [] cc: [] bb: []]` answer should be false.

Is there any ideas how to do it in better way?

[18:38:56](#MNNcO0JI8nD1AhM-UxmSJg1W52EA_PeR1nVPUpc3klU) <bubnenkoff (Dmitry Bubnenkov)>:
* I need to check if any values are not block. I wrote next code and not sure that it's optimal (it's working):
```
if value? 'at-least-one-integer [ unset 'at-least-one-integer ]
parse [aa: [] cc: 1 bb: []] [ 
			some [ set at-least-one-integer integer! | skip ] 
			 if (value? 'at-least-one-integer) to end | [fail]
		]
````

On: `[aa: [] cc: [] bb: []]` answer should be false.

Is there any ideas how to do it in better way?

[18:40:52](#c5xnbe-0qLR_49q_NdvmDPVYIuJ4mG3YEWpgWO1Pulo) <bubnenkoff (Dmitry Bubnenkov)>:
* I need to check if data have some values that are not blocks. For simplification I check `integer` only.  I wrote next code and not sure that it's optimal (it's working):
```
if value? 'at-least-one-integer [ unset 'at-least-one-integer ]
parse [aa: [] cc: 1 bb: []] [ 
			some [ set at-least-one-integer integer! | skip ] 
			 if (value? 'at-least-one-integer) to end | [fail]
		]
````

On: `[aa: [] cc: [] bb: []]` answer should be false.

Is there any ideas how to do it in better way?

[18:41:09](#YHITToFb7LOYuV0tKi_J9a_BVlXn5UlHJjxYPrSRUe8) <hiiamboris (NOT THIS ONE)>:
why not just `parse [aa: [] cc: 1 bb: []] [to integer! to end]`?

[18:45:10](#Cp5O7IkuTNWGhcac_OO14qCt09dmhJQRxrnMGBIMOn8) <hiiamboris (NOT THIS ONE)>:
or `find [aa: [] cc: 1 bb: []] integer!`

## 30-Mar-2021

[8:12:28](#bOTVHGW7G94bi8xd6Q_Px2DsFMlE1MR18TB8LKxcHpc) <bubnenkoff (Dmitry Bubnenkov)>:
> @bubnenkoff should you come around, please tell us how did you discover Parse? Ì†ΩÌ∏â

Be honestly I knew somthing about Rebol from Kaj de Vos who was co-developer of Syllable. I take part in it's community, but at that time I was not programmer. After long time I become programmer, and re-discovered Red. For few years I have not time\task for it. And I started from Parse. It's take around 2-3 month to getting *minimal* experience. With incredible help from community. And it take for me around one year before I was able to write some more o less working. It took a long time, but algorithms have never been my strong suit. So only every day practice.  

[8:13:03](#-TEi2QU2MEr2OH5r8x5N7wFld6s_U1zuwMf_1jwgyrQ) <bubnenkoff (Dmitry Bubnenkov)>:
* > @bubnenkoff should you come around, please tell us how did you discover Parse? ;)

Be honestly I knew somthing about Rebol from Kaj de Vos who was co-developer of Syllable. I take part in it's community, but at that time I was not programmer. After long time I become programmer, and re-discovered Red. For few years I have not time\task for it. And I started from Parse. It's take around 2-3 months to getting *minimal* experience. With incredible help from community. And it take for me around one year before I was able to write some more o less working. It took a long time, but algorithms have never been my strong suit. So only every day practice.  

[8:38:11](#_dI-PU7db_HdijsYlSoRrlMLaw9w1-KsUPtylQwS2Ic) <hiiamboris (NOT THIS ONE)>:
Aha. Thanks.

[8:58:09](#xRe9RZtJyAQVdoRZ9eMdmqjKlo74qB_Pi_E_FhFZqDI) <GalenIvanov (Galen Ivanov)>:
Speaking of alternatives regex, has someone tried [Bracmat](https://github.com/BartJongejan/Bracmat). It's about pattern matching in general, not only in text :  

[8:58:14](#QZTA2krccjPb1Pxc0iL4DNgG_5017opGZTgH3JAfEMk) <GalenIvanov (Galen Ivanov)>:
> Bracmat is a computer programming language designed for analysis and manipulation of complex data, be it evaluation of algebraic expressions, parsing natural language, validation of HTML or automatic chaining multi-facetted webservices into a workflow. In several projects, Bracmat has been combined with other programming languages to take care of high level activities that otherwise would be very time consuming to implement.

[8:58:30](#r5L4kFxe9sREosLpSC1AYBKrIB01tPYPkBlaHtG5OtE) <GalenIvanov (Galen Ivanov)>:
* Speaking of alternatives regex, has someone tried [Bracmat](https://github.com/BartJongejan/Bracmat)? It's about pattern matching in general, not only in text :  

[9:02:13](#9eK7FCV7Ezu-M7QgNAuq7tNseunGGj6eNgnRGP8h-Tg) <GalenIvanov (Galen Ivanov)>:
I spent some time reading the docs, but the terse symbolic notation turned out to be beyond my grasp and my array languages experience.

[9:03:17](#mV2PbzEWJTow7GZAY4gq6yGx-kdz-U63fR9vp5K8ZoU) <GalenIvanov (Galen Ivanov)>:
* Speaking of alternatives of regex, has someone tried [Bracmat](https://github.com/BartJongejan/Bracmat)? It's about pattern matching in general, not only in text :  

[15:45:37](#1Jx23HGgXbOnUHNEGLpuCzBNylzj4TvI2GLwlcA9I2o) <rseger (rseger)>:
this quote `beats Perl in terms of line noise` was what turned me off it. Line noise is the wrong sin, in my oh so humble opinion, to be focused on with perl. And you can see the results in the syntax they've chosen. They seem to be under the inaccurate impression that optimizing character count is somehow a good thing. Those days have long since passed. The correct optimization is for the maintainer of a codebase. You can certainly swing too verbose but the last thing I think when reading perl is "there's too much information in this line of code"

that said, I was saddened to see it. Their goals and ideas seem to be very solid. I just wish they were in a more maintainable package.

[16:28:57](#uRaCqAiaSIsMtWhsrtprMktDmBbn8aKGiqPuiPWoQRk) <hiiamboris (NOT THIS ONE)>:
Perl is [one of the best](http://99-bottles-of-beer.net/language-perl-737.html). I wonder if such code is possible in Bracmat.

[17:19:07](#PK7q78rkhcKNBxfXRBFOpCTOtUT7F4FAeOqG3w-y3Xc) <rseger (rseger)>:
it truly is a marvel

[17:49:49](#12ReyOgKKI89vnActa9bL0H09w7pOjJkijhLQHYE98U) <GalenIvanov (Galen Ivanov)>:
@rseger Yes, I agree!

[17:51:45](#ZcelXuZfj_lcVkw0it4UjSD2aP46jIxJyjBG_Cr2FgQ) <GalenIvanov (Galen Ivanov)>:
@hiiamboris I don't know Perl, but I think Raku (formerly Perl 6) have taken steps in the right direction - at least the (golfed) code I have seen in Code Golf & Coding Challenges on StackExchange looks much better than Perl.

[18:10:39](#SxlRogR1RIV5xo3hFC-aF6zjewDUy4zEga8efGtYIq4) <greggirwin (Gregg Irwin)>:
That Perl stuff is astounding. True artistry. Bracmat is an interesting find. Skimming the docs, it brings to my mind how important foundational principles are. His are quite specific and lead to design choices and a user experience that make it interesting (e.g. no subtraction, no named fields). If it empowers people, that's what DSLs are for, but it isn't clicking for me at a glance.

There's an informal grammar in the PDF, but I can't copy it out to see how hard it might be to normalize. Not worth downloading and trying locally in PDFElement right now. If @GalenIvanov wants to reach out and see if the author can use the free version of DG to make a diagram for it, we'll render him one without watermarks.

[18:26:57](#LytYDpAUH6GmPS2D0Jksl80yQBAYkfPlZivvlN0Z-bg) <GalenIvanov (Galen Ivanov)>:
@greggirwin That's an interesting idea - yes, I'll try to contact him with your suggestion.

[18:44:39](#Luw0FlIq6uZcoIv7N2DALn9mAmJKVeH6-xZWooiiqYQ) <greggirwin (Gregg Irwin)>:
:+1:

[19:51:54](#rLR-hyARa-zLbTGxzswR7qrQNuJOQiv8Tadzctgk_QA) <toomasv>:
bracmat grammar (for visualisation only):
```
input: [opt expression opt [";" input]]
expression:   [
 white-space expression white-space
 | opt prefixes "(" expression ")"
 | leaf
 | expression binop expression
]
leaf: [opt prefixes atom-or-nil]
atom-or-nil: [atom | nil]
atom: [{"} string {"} | string]
string: [character opt string]
character: compose [(charset [not #"\" #"^""]) | spec]
spec: compose ["\" (charset {abtnvfr"\})]
nil: [none]
binop: compose [(charset "=.,|&:+*^'$_") | white-space | "\L" | "\D"] 
prefixes: [prefix opt prefixes]
prefix: compose [(charset "[~/#<>%@`?!") | "!!"]
white-space: charset " ^-^/^L" 
```

[19:55:01](#2b-4eaxrvqG92eB-9FPP5NRHMWzwYxnKV0mJ36fwsg4) <greggirwin (Gregg Irwin)>:
Thanks @toomasv !

[19:57:14](#_TbxLKEipAaVuU8Iw8Z9tNxLUv4LSskZy59zRMXn5aQ) <toomasv>:
:)

[19:58:45](#PlRqDC83Cr86DLDuMtrOZ34p5tjcj4B-01TKohhxtuc) <toomasv>:
* Bracmat grammar (for visualisation only):
```
input: [opt expression opt [";" input]]
expression:   [
 white-space expression white-space
 | opt prefixes "(" expression ")"
 | leaf
 | expression binop expression
]
leaf: [opt prefixes atom-or-nil]
atom-or-nil: [atom | nil]
atom: [{"} string {"} | string]
string: [character opt string]
character: compose [(charset [not #"\" #"^""]) | spec]
spec: compose ["\" (charset {abtnvfr"\})]
nil: [none]
binop: compose [(charset "=.,|&:+*^'$_") | white-space | "\L" | "\D"] 
prefixes: [prefix opt prefixes]
prefix: compose [(charset "[~/#<>%@`?!") | "!!"]
white-space: charset " ^-^/^L" 
```

[19:59:02](#3FGQ0VfxhEzHCGHp0q0gRN0ekoqlcnJpuKdsSYGD1VI) <greggirwin (Gregg Irwin)>:
[![bracmat.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/JfTY/thumb/bracmat.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/JfTY/bracmat.png)

[20:00:20](#oR9NsRC9Y_x6v8vPtUGzcCVw1L_UmOZ90XqLNFgFciI) <greggirwin (Gregg Irwin)>:
@GalenIvanov feel free to pass that along to the author. If they want to use it, ask if they'll give us credit and point to https://www.redlake-tech.com/products/diagrammar-for-windows/. You can send them the working grammar from @toomasv as well.

[20:31:45](#mQ0DC2VncsfzHctyzO5Ys2eTKWbBSccB_6IEQhbGpGg) <hiiamboris (NOT THIS ONE)>:
the image doesn't zoom for me (files.gitter.im inaccessible) Ì†ΩÌ∏ï

[20:32:14](#uy6d5DMoxnY0k6E2hPB1fjykapxpGHs2xzrmWsqq3hA) <hiiamboris (NOT THIS ONE)>:
* the image doesn't zoom for me (says files.gitter.im inaccessible, but ping works) :/

[23:10:16](#ionPSM2rNC6lnZ1EF9wXIRkYyfBWvZzgDk8bCj6B4U0) <greggirwin (Gregg Irwin)>:
Technology is hard it seems. :^\

## 31-Mar-2021

[14:46:38](#kT5mE7e2FJSnknKNliHAC3lNDDmAkvp0wz1qoZelg_w) <cloutiy (yc)>:
Is diagrammar available for linux?

[17:40:49](#yLWbD93_2suwceXgCoPAZTZqPPqnTGPeI1tcDwAmvbE) <greggirwin (Gregg Irwin)>:
Not at this time.

## 1-Apr-2021

[18:38:03](#MYu0OnozCSlT-4QgBsVrjrmo7NTcz5BJuCErzswGYMM) <bubnenkoff (Dmitry Bubnenkov)>:
Could anybody help me to adopt this code to output result in single quotes: like: `'`.
I tied to write big hack with `replace "{"` but it produce a lot of errors.
```
block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {company "Microsoft" test } "1.00" none] 
```

The result should look like as SQL insert VALUES. They are single quoted.

[18:38:50](#PsVD_-KA61U1qEpSMkoDwymPFPCi2awWJrwUhzBvM-k) <bubnenkoff (Dmitry Bubnenkov)>:
* Could anybody help me to adopt this code to output result in single quotes: like: `'`.
I tied to write big hack with `replace "{"` but it produce a lot of errors.
```
block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {company "Microsoft", "Apple" and Foo } "1.00" none] 
```

The result should look like as SQL insert VALUES. They are single quoted.

[18:39:02](#5NTE1L_PJgmkIq2J7S2ikH8q9hBToRyMbKFDUMHXN2Q) <bubnenkoff (Dmitry Bubnenkov)>:
* Could anybody help me to adopt this code to output result in single quotes: like: `'`.
I tied to write big hack with `replace "{"` but it produce a lot of errors.
```
block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {company "Microsoft", "Apple" and HP } "1.00" none] 
```

The result should look like as SQL insert VALUES. They are single quoted.

[18:39:15](#84Oq87TdkTEgFEHW8n8YuvUdFuP7iGRa37vZUKxaynU) <bubnenkoff (Dmitry Bubnenkov)>:
* Could anybody help me to adopt this code to output result in single quotes: like: `'`.
I tied to write big hack with `replace "{"` but it produce a lot of errors.
```
block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {company "Microsoft", "Apple" and HP} "1.00" none] 
```

The result should look like as SQL insert VALUES. They are single quoted.

[18:39:31](#taGBvuEamynPpnfAGGy0mndYpH3-boyp9CnlAh5YjvE) <bubnenkoff (Dmitry Bubnenkov)>:
* Could anybody help me to adopt this code to output result in single quotes: like: `'`.
I tied to write big hack with `replace "{"` but it produce a lot of errors.
```
block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {company "Microsoft", "Apple" and "HP"} "1.00" none] 
```

The result should look like as SQL insert VALUES. They are single quoted.

[18:40:07](#Y0yS8bOpUjTmXYUPB2ULM0379mHJw6Cdty3g7My672E) <bubnenkoff (Dmitry Bubnenkov)>:
* Could anybody help me to adopt this code to output result in single quotes: like: `'`.
I tied to write big hack with `replace "{"` but it produce a lot of errors.
```
block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [s: skip keep (mold s/1) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none] 
```

The result should look like as SQL insert VALUES. They are single quoted.

[18:43:04](#XxWvZ7rUvgV9Cc2gu9Ay62dc1FEBGr1hhlF8GIGYDwU) <greggirwin (Gregg Irwin)>:
You should just be able to add the single quotes at the head and tail of each string.

[18:44:40](#q4vPiRHd20NNy9y0z5I3v-MkaO2LifBv14IP-16EcVE) <bubnenkoff (Dmitry Bubnenkov)>:
Do not understand moment where it should be added(

[18:48:04](#xBpwNrHBpAKyeXs95i7hyH-MzTZvvpdpiymDjkz3U1Q) <greggirwin (Gregg Irwin)>:
I don't remember SQL rules for embedded quotes. What should the "some string..." look like when done?

[18:48:45](#R9KOj2AXYoBOJtuhYUno4nxbDZiPiho8h7CN1MWkoD8) <bubnenkoff (Dmitry Bubnenkov)>:
VALUES(1 'aa', 'some "name"', 123)

[18:49:23](#w4L4UqCRknrxwdkj_hbIFnpi2OMbHGMdyyFFrYRBCTA) <bubnenkoff (Dmitry Bubnenkov)>:
* `VALUES(1 'aa', 'some "name"', 123)`
One moment I need to check quotes inside

[18:51:37](#Nc9pmoHFNiq6txJOZOxhw3P1QkWxhLXrL9ivknxTCc0) <bubnenkoff (Dmitry Bubnenkov)>:
* `VALUES(1 'aa', 'some "name"', 123)`
the quotes should look like this

[18:52:01](#kplkl-usjSkCCtjm-xlIELSf2OTGOB8EHKbuQSVqWXU) <bubnenkoff (Dmitry Bubnenkov)>:
* `VALUES(1 'aa', 'some "name"', 123, NULL)`
the quotes should look like this

[18:52:12](#X6IfWZGdRm9uNVquNSUzPxSQRbmmvGnyisVwJrQx5aw) <greggirwin (Gregg Irwin)>:
If just enclosing each string works, this should do it:
```
enclose: func [
	"Returns a string with leading and trailing values added."
	str [any-string!]   "(modified)"
	val [char! series!] "A single value can be used in the series"
][
	rejoin either char? val [ [val str val] ][
		[form first val  str  last val]
	]
]
;enbrace:   func [s] [enclose s "{}"]
;enbracket: func [s] [enclose s "[]"]
;enparen:   func [s] [enclose s "()"]
;enquote:   func [s] [enclose s {"}]
;entag:     func [s] [enclose s "<>"]

block-to-comma-list: function[str-blk] [
    str: none
    rule: [collect any [set s string! keep (enclose s {'}) [end | keep (", ")]]]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]
```

[18:53:06](#zBQqR2qWMOSGmOUMn1BpBOHXuYDn329IDb-exIR6Bls) <bubnenkoff (Dmitry Bubnenkov)>:
Wow! Thanks! I need to check it on real data!

[19:00:17](#hDqO6K9tO2C1xn324g4WQRejiursuGiMhwvXTq0foeo) <bubnenkoff (Dmitry Bubnenkov)>:
```
block-to-comma-list ["25.22.11" "aa aaa aaaaa" "1.00" none]

== "('25.22.11', 'aa aaa aaaaa', '1.00', )"
```

it loosing none (that should be renamed to NULL)


[19:02:29](#wvfBd14R5PPj9gcJeMOxFP73V9T7L3uc7g1NruvdNAY) <greggirwin (Gregg Irwin)>:
So you'll need to add a rule for `| none!` as an alternate. I missed that when changing to the `string!` check.

[19:02:53](#RFLhHaq0xrKUPmtVMU16P4gRhe2VNGAuGjBPAVU3u6Q) <greggirwin (Gregg Irwin)>:
Then you can remove your last `replace` call.

[19:04:54](#CC7DL39nFNXwEwF2UTpngjw7wMbBmrJGp39wU2oEVPU) <bubnenkoff (Dmitry Bubnenkov)>:
I put `none!` in  wrong place?
```
rule: [collect any [set s string! keep (enclose s {'}) [end | keep (", ") | none!]]]
```

[19:05:38](#Cp3zPOq1FRM_zswzjZE1YaClZ_86pLZngizJRh0XBYk) <bubnenkoff (Dmitry Bubnenkov)>:
After one year this string is look magic for me(

[19:07:10](#hBdlUCRI42ZoOQrU9xUifeolR-3suIwb1lV_HaE8MtE) <greggirwin (Gregg Irwin)>:
Well, you're not doing anything when you see the none. You want to keep NULL in that case, right?

[19:09:06](#CujUfGltJA9iEMR-MDi3JV9Fmj3zY-vC_NyKEiDnKIA) <bubnenkoff (Dmitry Bubnenkov)>:
yes 

[19:09:41](#nzqBROQljA2zg9GAx0nXx2MIVdc3wi1hZLR1id_vLz8) <bubnenkoff (Dmitry Bubnenkov)>:
To get:
```
== "('25.22.11', 'aa aaa aaaaa', '1.00',  NULL)"
```

[19:14:08](#wO3KitjcqdkSB7dnYbKDI68nVQ43r4pLY8OupY6q9lo) <greggirwin (Gregg Irwin)>:
So what do you think you need to do when you hit the `none!` rule? (hint: look at the `string!` rule)

[19:19:50](#Wr-ok4Ag0riHNEJV2bMkmBOR8jR8iKOf01RUZn7XShs) <bubnenkoff (Dmitry Bubnenkov)>:
I tried different combination of `keep none!` and `keep 'none` do not work. Rule hard for me

[19:29:18](#FuP1um7-3X7cOeaXXdkyqEgjLwqr36uKcuMmay4x8e8) <greggirwin (Gregg Irwin)>:
```
enclose: func [
	"Returns a string with leading and trailing values added."
	str [any-string!]   "(modified)"
	val [char! series!] "A single value can be used in the series"
][
	rejoin either char? val [ [val str val] ][
		[form first val  str  last val]
	]
]
;enbrace:   func [s] [enclose s "{}"]
;enbracket: func [s] [enclose s "[]"]
;enparen:   func [s] [enclose s "()"]
;enquote:   func [s] [enclose s {"}]
;entag:     func [s] [enclose s "<>"]

block-to-comma-list: function[str-blk] [
    str: none
    rule: [
        collect any [
            set s string! keep (enclose s {'})
            | 'none keep (" NULL")   ; change to none! if it's a real none! value
            [end | keep (", ")]
        ]
    ]
    str: head insert next copy "()" rejoin parse str-blk rule
    str: replace/all str "none" "NULL"

    print "-------"
    probe str
]

block-to-comma-list ["25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]
```

[19:36:28](#1ztE62mxMpERiM4j7IySqiwkf7jLlRj3tr3yCV4SlXA) <bubnenkoff (Dmitry Bubnenkov)>:
It do not add `,` before last NULL, if to make it `(", NULL") ` it would issue on first none 
block-to-comma-list [none "25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]

[19:36:39](#oWaqTF-DpZC0pXVpDb9V-zMLRn8k2tUbrwf6ieKI5ns) <bubnenkoff (Dmitry Bubnenkov)>:
* It do not add `,` before last NULL, if to make it `(", NULL") ` it would issue on first none 
`block-to-comma-list [none "25.22.11" "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]`

[19:38:14](#Fpqe2flYdwfTaG7NM6OBiYHfl5_iusZLVlqR98dNWxs) <greggirwin (Gregg Irwin)>:
I leave the details to you. :^) 

[19:38:51](#BCdjuYBVke2LaP96NJ7zWeFSYhi2cNiqgOERY4EOdgo) <bubnenkoff (Dmitry Bubnenkov)>:
Ok! Thanks!

## 2-Apr-2021

[8:16:04](#o8Onz061S-lxRHpeTqEe5C_jvwxkr3xESpeGGqUFY9Q) <bubnenkoff (Dmitry Bubnenkov)>:
@greggirwin It's seems that I did it. The yesterday rule was to hard for me and I was not able to fix it. So I did next:
```
enclose: func [
    "Returns a string with leading and trailing values added."
    str [any-string!]   "(modified)"
    val [char! series!] "A single value can be used in the series"
][
    rejoin either char? val [ [val str val] ][
        [form first val  str  last val]
    ]
]

data: [none "25.22.11" 44 "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]

result: ""

count: 0
foreach el data [
      count: count + 1
      if (string? el) [el: enclose el [{'}] "," ]
      if (el = 'none) [el: "NULL"]
      append result el

      if (count < length? data) [ ; prevent adding at end
      append result ", " 
      ]
]
insert result "("
append result ")"
```

[8:16:33](#rdnXOFUGo3vAVIv7MWx63dXi5CyTqxNqwJraAyhyXOA) <bubnenkoff (Dmitry Bubnenkov)>:
* @greggirwin It's seems that I did it. The yesterday rule was to hard for me and I was not able to fix it. So I did next:
```
enclose: func [
    "Returns a string with leading and trailing values added."
    str [any-string!]   "(modified)"
    val [char! series!] "A single value can be used in the series"
][
    rejoin either char? val [ [val str val] ][
        [form first val  str  last val]
    ]
]

data: [none "25.22.11" 44 "aa aaa aaaaa" {some string with quotes "Microsoft", "Apple", "HP"} "1.00" none]

result: ""

count: 0
foreach el data [
      count: count + 1
      if (string? el) [el: enclose el [{'}] "," ]
      if (el = 'none) [el: "NULL"]
      append result el

      if (count < length? data) [ ; prevent adding at end
      append result ", " 
      ]
]
insert result "("
append result ")"
```
output:
```
== {(NULL, '25.22.11', 44, 'aa aaa aaaaa', 'some string with quotes "Microsoft", "Apple", "HP"', '1.00', NULL)}
```

[8:52:36](#hgVfIl7PQrIEmjhxfm2Ag-Ih51cChcgd84pzS3VCdsE) <toomasv>:
@bubnenkoff 
```
SQLify: func [data][
    head insert next copy "()" rejoin parse data [
        collect [
            any [[
                  ['none | none!] keep ("NULL") 
                | ahead string! keep ("'") keep skip keep ("'") 
                | keep skip] 
                [end | keep (", ")]
]]]]
>> SQLify data
== {(NULL, '25.22.11', 44, 'aa aaa aaaaa', 'some string with quotes "Microsoft", "Apple", "HP"', '1.00', NULL)}
```


[8:54:43](#aAL7qZLs3DKXpmO0r4vqeNPK34NYTCEVUBnu4iSQxJ4) <GalenIvanov (Galen Ivanov)>:
@toomasv I was wondering isn't it possible to change `head insert next copy "()"` with `mold to-paren`?

[8:56:14](#UPi8scW6vkGeHgaOK-6kB3yUE-RISzj80vxhM3Xzkx4) <GalenIvanov (Galen Ivanov)>:
Apparently not in this particular case Ì†ΩÌ∏Ñ 

[8:58:28](#sRGiD6-uvfS1h3lNV13HMk-MJh2I1m1miCwDusCHDx4) <toomasv>:
As `to-paren` loads string, so yes, i.e. no.

[8:58:43](#NTvy3u5B1lZ4yp3OeOuM6pQg0ZeC86lVKhgWL4-ymnQ) <GalenIvanov (Galen Ivanov)>:
:+1: 

[9:03:50](#U72X0c-RPQpTilWU_C9F0ZtnrwrtZnNSjUptf6qwTN4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@toomasv your solution will fail once there will be some string like `"it's fail"` 

[9:06:36](#WyQuaCtVtmDRyZ_xubUDOP4FvV8DKk99YoWZePNgqfk) <toomasv>:
@Oldes I'm only giving pointers, not trying to develop THE solution :)

[20:00:33](#6AoOfsP7aGtBse_-inYZg6xrLJxNzj4et6LAL_gHCYI) <greggirwin (Gregg Irwin)>:
@bubnenkoff *not* using `parse` is a great option at times. 

## 29-May-2021

[17:11:49](#xM1LqrDbEQ2ygtCGP2gwXRmxDT5vYjNm7tyrltGWPjo) <ldci (Fran√ßois Jouen)>:
Hello everybody: looking for a parse rule for deleting punctuation marks in a text in order to keep only words.

[17:38:41](#WiqX56uhoTc1R2FPryn-a05I9hc5ZR4oo6wdx_YfPrU) <GalenIvanov (Galen Ivanov)>:
@ldci Here is some simple rule (you can add another punctuation marks to `punct`): 

[17:39:22](#r8jbXhxec5RRlJOCKPvDYRLYuVprwr8tSL6ItAdu2KE) <GalenIvanov (Galen Ivanov)>:
```
punct: charset ".,;!?"
remove-punct: [any [remove punct | skip]]
text: "This, that? No! Some ... "
parse text remove-punct
text
== "This that No Some  "
```

[17:49:27](#YAoMUJtdZPZm8BC_Uz0-zSRk4fqsLqII3aNuVCCunxI) <ldci (Fran√ßois Jouen)>:
@GalenIvanov Thanks a lot!

[17:51:00](#Dm2kw4sUUq8Zx6O-Jt7L9R5QQZ7_mQ5y0l1NJND5nSk) <GalenIvanov (Galen Ivanov)>:
@ldci You're welcome! Don't forget that it changes the source string on place.

[17:51:07](#_6oBjZOJknDpSlWxWWGSZq1oZDjQCJIysgoD6cl5elE) <GalenIvanov (Galen Ivanov)>:
* @ldci You're welcome! Don't forget that it changes the source string in place.

[17:51:56](#CJTcsQ77T8s2aHsvKCq27MY3-qPXWdnv8ghiDz-osbE) <ldci (Fran√ßois Jouen)>:
@GalenIvanov Better. than using trim/with. Perfect:)

[17:52:27](#nt3_zjzB_rHTeQfQJf59muXiAKCt27Y3TE3kvJ7aD6U) <GalenIvanov (Galen Ivanov)>:
:+1: 

[17:59:50](#WP2THumL0tVBcHBVR3b4HmN9A1ZxfAGV3VKvIlsSMgo) <ldci (Fran√ßois Jouen)>:
[![image.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/REQ1/thumb/image.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/REQ1/image.png)

[18:04:22](#LchHeGTDdu3wh0DdnNoAXrooaOwCDESDNT3_jLGSfiA) <GalenIvanov (Galen Ivanov)>:
@ldci Nice! Is this part of a bigger project?

[18:07:31](#l5sbfqR3k68cU6goxlzhc7GO4SYpJmM5raZDktTLNMQ) <ldci (Fran√ßois Jouen)>:
@GalenIvanov Nope. Just testing Red. BTW I really appreciate your contribution for L-System and graphics stuff:)

[18:09:20](#9tFrIGeM_QAgACqZpKmFqd9aHBXApTSNI_2t_VxTE20) <GalenIvanov (Galen Ivanov)>:
Thank you! I hope there will be more to come Ì†ΩÌ∏Ñ 

[18:10:27](#IJ5nwBiziDAgjgmNppj74HwnU3rgjSU1KOE6L87xPLc) <ldci (Fran√ßois Jouen)>:
@GalenIvanov We have to connect your work and redCV. :)

[18:14:36](#BIQSfd_Fdneiak2JDBLJOEJ1Drp2Ndn3tPFvUa1nGMs) <GalenIvanov (Galen Ivanov)>:
Yes, I need to get familiar with redCV and stop reinventing things Ì†ΩÌ∏Ñ 

[18:17:46](#QAMzY3a2n3W34gAopwrmaSpTi1vtDMS8w57koboxuYI) <ldci (Fran√ßois Jouen)>:
@GalenIvanov Please feel free to contribute. You‚Äôre welcome. 

[18:24:27](#iYvCiE9yXriqYPJoyHk7j6e6GgDWFNvSt44JfuDSw6U) <GalenIvanov (Galen Ivanov)>:
@ldci Thanks, I'll be glad to contribute!

## 30-May-2021

[6:46:58](#dN03upfD-csjCKtVuRrBRZLax3qcE5Ha86GBnK28TRc) <ldci (Fran√ßois Jouen)>:
@GalenIvanov Solution with trim is 2x faster than with parse. Probably because  with parse this is char by char.

[6:55:02](#5omFZWINS1x-iNFC6e-ce6yG8bzFbdGCtTSUpO5lwKo) <GalenIvanov (Galen Ivanov)>:
@ldci I don't know why - I'm not aware of the implementation details. Btw, have you tried `emove-each`? 

[6:55:09](#SVIDVD7eTfh3MWxLPkWcb6eX0LNZp4M5LIuz5IGTY7g) <GalenIvanov (Galen Ivanov)>:
@ldci I don't know why - I'm not aware of the implementation details. Btw, have you tried `emove-each`? 

[6:56:06](#KGtyAVwiQ3o_Ts895AJmsTIbFypscPeZ8EUQ4cSf96E) <GalenIvanov (Galen Ivanov)>:
* @ldci I don't know why - I'm not aware of the implementation details. Btw, have you tried `remove-each`? 

[6:57:18](#s_bAC-YfICa_SLh4Qtol8JBfyeS6OZF82pQxwNP-Twk) <GalenIvanov (Galen Ivanov)>:
```
>> remove-each c text[find ".,;!?" c]
>> text
== "This that No Some  "
```

[6:58:49](#r76I-wA23cGr3uZ2GZpivLcQyzvNub4wo7JB_0cMNWY) <ldci (Fran√ßois Jouen)>:
@GalenIvanov I‚Äôll test :)

[8:24:51](#hqBRaiZNmcI2FtpV6zObbOYwOfPr4Ke5nfoMpFS7kn0) <ldci (Fran√ßois Jouen)>:
@GalenIvanov  3 methods tested: trim, remove-each and parse.  They are equivalent: less than 150 ms to count 2615 words in classical Cinderella text.

[9:14:09](#n3rFFOyFHxuvvSZlQIF8pOLSLmMPU0Pb_KIJ7uSZwCA) <GalenIvanov (Galen Ivanov)>:
@ldci Thanks!

[19:31:25](#ylt3CB3AkUXPaRtTnCtQSl-_43ojNtTHXeqzsi809MU) <greggirwin (Gregg Irwin)>:
`Trim` is low-level R/S code, which can spin through strings as characters very quickly. You trade speed for flexibility. 

[19:51:25](#TtO30npTXIW-9blVgXtWvKlIepyo657q4xOxL7mDIaQ) <dsunanda (dsunanda)>:
@ldci Stupid trick possible with TRIM - specify only the characters you want to keep. Everything else gets removed:
```
good-chars: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ -"
text: "This! is (,not,).... a [good] example hyphen-ated"
trim/with text trim/with copy text good-chars
== "This is not a good example hyphen-ated"
```

[23:49:10](#s6Y_o-KUJerFfuThzzQWrbvIW2vtvOnJfB30-yLiglM) <ldci (Fran√ßois Jouen)>:
@dsunanda Very elegant!

## 31-May-2021

[0:34:19](#W9ZhfRDU2qP1GJKJWDQpETn4D6OxoZooKahd2ROqtNU) <ldci (Fran√ßois Jouen)>:
I‚Äôm really impressed about string processing with Red: powerful and elegant
`trim/with aTxt rejoin [",.;:!?-(){}'" form #"^¬†¬ª¬†¬ª]`


[0:34:58](#l98AO0HbPWBZZO4i51jZgKvOqyoJ4-ffCDhH2DoQkms) <ldci (Fran√ßois Jouen)>:
Fabulous

[14:39:49](#MWSJaLGfq1aAiNoONEL3giqltuN5m04kXQ1mb1Qqx8M) <abdllhygt (Abdullah Yiƒüiterol)>:
hi!
which one is logic?
```
a: complement charset "<>"
b: ["<" copy a to ">"]
```

[14:40:06](#eTmV7tsQZ__o86ei6j3mcctOv5_isLPX1aXj5dkwYbA) <abdllhygt (Abdullah Yiƒüiterol)>:
```
a: complement charset "<>"
b: ["<" copy a ">"]
```

[15:19:16](#fFmp_SdMBSWepswpCcinOsc3ba-WumSnIq0M6nQPRuE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
second one. if you have charset, you don‚Äôt need `to`. But it would be `copy some a`.

[15:31:24](#cpNFlEDYFeRVBssBjnFbQRDQUvi8CfH3L2nTir-sHB0) <abdllhygt (Abdullah Yiƒüiterol)>:
@rebolek thank you!

[21:21:07](#_HYp4iLdZjqFoMdiBF33xcmjDlEpD1Lv0_y_aCWGXuY) <abdllhygt (Abdullah Yiƒüiterol)>:
```
any [
            | !satƒ±r
            | !i≈üaret
            | !i≈ülev
            | !an
        ] ;any
```
is this enough to make loop?

[21:21:43](#EwRdD8vLkSaWCE39gQ04vkBrRI2Uic21JW6CwyZVVbo) <abdllhygt (Abdullah Yiƒüiterol)>:
or, do i have to add this:
```
script: any [
            "x" (quit)
            | !satƒ±r
            | !i≈üaret
            | !i≈ülev
            | !an
            | script
        ] ;any
```

[21:22:20](#qupDu-A5z_SlfAbBLpCmvlS890_DyzPF2sCxS8QJk9s) <abdllhygt (Abdullah Yiƒüiterol)>:
* or, do i have to add this:
```
script: any [
             !satƒ±r
            | !i≈üaret
            | !i≈ülev
            | !an
            | script
        ] ;any
```

[21:22:34](#vXFVCvjn6pnP2uCLB3xwpsJLoZ5BfVaLN-B6FsHDn4A) <abdllhygt (Abdullah Yiƒüiterol)>:
* ```
any [
            !satƒ±r
            | !i≈üaret
            | !i≈ülev
            | !an] ;any
```
is this enough to make loop?

[21:22:43](#g8QPGV6vbgXPAkLsIzTPeN1M9Y5VTQO3LoNhy6KYudg) <abdllhygt (Abdullah Yiƒüiterol)>:
* ```
any [
            !satƒ±r
            | !i≈üaret
            | !i≈ülev
            | !an
] ;any
```
is this enough to make loop?

[21:23:01](#N-QMtTGxTu85SO9wkc8Yz2merzGwG3WPAgd9_fdUud8) <abdllhygt (Abdullah Yiƒüiterol)>:
* or, do i have to add this:
```
script: any [
             !satƒ±r
            | !i≈üaret
            | !i≈ülev
            | !an
            | script
] ;any
```

[22:28:26](#BNpRaFOcITydidWXWBJQUJIMUeaqyRenNNB90939VJk) <greggirwin (Gregg Irwin)>:
You don't have to name rules unless you want to reference them by name, e.g. from multiple locations.

[22:33:20](#QruqzbLeTGMgQaL6luRHPYiLULaII2zNBGPLi8e1QFg) <abdllhygt (Abdullah Yiƒüiterol)>:
i didn't understand, can you give me an example?

[22:47:24](#HQTtsmKId--ntr5-knmGAonGvaOCgzqgKEPQVcfmPUs) <greggirwin (Gregg Irwin)>:
`parse series [any ['a | 'b | ['satir | 'an]]]` vs
```
my-rule: ['satir | 'an]
parse series [any ['a | 'b | my-rule]]
```

[22:53:33](#Byr9OGkI1yXhYx9mWdzh9LE45BdcrrI0QvfMJibqucg) <abdllhygt (Abdullah Yiƒüiterol)>:
i see, but i was talking about putting a block into itself

[22:54:54](#oWZ33D9gzeb4vccaaKmcf9OmdfWMlj3ynWbxW33-ax4) <abdllhygt (Abdullah Yiƒüiterol)>:
```
blok: [1 | 2 | 3 | 4 | block]
```
like a loop
i was asking that do we still need this if we use `any`. but now i know the answer, thank you! @greggirwin 


[22:55:08](#1v15_L5qU3pKvvPKX6n_uR9GgIJFqjqaTIltiOGTZYY) <abdllhygt (Abdullah Yiƒüiterol)>:
* ```
blok: [1 | 2 | 3 | 4 | blok]
```
like a loop
i was asking that do we still need this if we use `any`. but now i know the answer, thank you! @greggirwin 


[23:03:41](#OS0jHjcziVKBQ323kSSgAV1AO1YVb_d6jstRwdbFmc4) <greggirwin (Gregg Irwin)>:
Yes, if you want to use a rule recursively you have to name it.

## 3-Jun-2021

[20:58:58](#Ag6Z7yTxzoK-JVpVRPSAflji9Y6XDOWQuEnSUjHd-gY) <abdllhygt (Abdullah Yiƒüiterol)>:
hello!

[20:59:34](#sMlCNLU-lVR8f_sG-Cd1NP-yEXsYMPOXL3QjuySr838) <abdllhygt (Abdullah Yiƒüiterol)>:
how to use parse/trace? i was using it before, but i couldn't use now.

[20:59:46](#KxRG5dKk0nC2WiOc46sIKJJnEMWd1SUdOhrmfcV_oG0) <abdllhygt (Abdullah Yiƒüiterol)>:
* how to use `parse/trace`? i was using it before, but i couldn't use now.

[21:02:17](#-CGZRUnzOW0hMGZ1ntSXn_gKI_mpVqTK528VcDvfK7w) <abdllhygt (Abdullah Yiƒüiterol)>:
ah it is `parse-trace`, i really forgot. long time i don't write ` Red`.

[21:06:24](#FJG6K-rvTvWXXUL5dO9ykHcDE78Vql11KCSH19OlOL4) <abdllhygt (Abdullah Yiƒüiterol)>:
ah it is `parse-trace`, i really forgot. long time i don't write ` Red`.

[21:08:42](#LeF5jKKAlHmp-R4Gbxg-EvBpVihXU7BNxuGXmbCt-MQ) <abdllhygt (Abdullah Yiƒüiterol)>:
is there a better method for reading result of `parse-trace`?

## 18-Jun-2021

[21:17:15](#ePrpqviXGqZpZ1h_jUQ3x8EmL7Kr21GKABbdNAYwaO8) <gltewalt (Greg T)>:
`parse-trace` is a wrapper for `parse/trace`, you can view the source and craft your own - `source parse-trace`, or modify parse/trace itself. 
Depends on what you mean by a better method for reading result

[21:30:14](#ghOwp4mPphRhk5Gs9f7-TqRrJesljmqnDf7i5wZlSMc) <gltewalt (Greg T)>:
You can play with this, but I haven't touched it in weeks. Use a nightly build for your Red version.

https://github.com/gltewalt/parse-caddy

[23:55:01](#a9NygY4z7GJ1-4UntJ7_skkfGqyhLD55BwoLD8bNqis) <gtzip (gtzip)>:
If parse-trace output is too long, there is a /part refinement that may be all you need to play with

## 20-Jun-2021

[18:10:20](#CPxCidYPiZdGUZ9z8e43JQs3FDeHmoP4BzjlJoONq3o) <abdllhygt (Abdullah Yiƒüiterol)>:
thank you

## 9-Jul-2021

[9:54:33](#-OoLTru6Q6IJrPe1G6ZKg-y-xFZmoTQuHxArpyjjQ9w) <giesse (Gabriele Santilli)>:
Bug?
```
parse ['keep/only] ['keep/only]
```

[9:54:43](#rgNvCzoxKb5wp2wOydcrVeW75mokbZjNb2k-Jjr2lM4) <giesse (Gabriele Santilli)>:
(returns true)

[9:55:00](#lucbxT7XU8UFbfZUAnEsitYe-FZfVtSa0GmDkVXD3yc) <giesse (Gabriele Santilli)>:
(there used to be the same bug for lit-words)

[13:26:12](#3suPYxEhtlB4eECOeci7nb0oom6_-3tyeAP0tOYPY98) <hiiamboris (NOT THIS ONE)>:
The bug was never fixed, so it likely affects paths too.

[13:27:10](#svkuL4tz_kOF_xtaI9ThG7qfXMiwRUkq1uI-3Ei1zyM) <hiiamboris (NOT THIS ONE)>:
If you wish to leave a comment: https://github.com/red/red/issues/3029 https://github.com/red/red/issues/3554

## 10-Jul-2021

[21:54:54](#PmdwNy0sK8AWsH2K1zCAc_eO8VoKJzYcB8LLG-mJjfU) <GiuseppeChillemi (GiuseppeChillemi)>:
Could `Parse` in Block catch carriage returns?

[22:31:54](#u6HvBnYe-iCKJrNd3xZaqdGQtGwBEAu_6PMNrD3-rzE) <GiuseppeChillemi (GiuseppeChillemi)>:
*Parse for Blocks

[22:34:28](#YnBageCtAvihcSgSxJ9dW-2eavkIflUy-q1aZlrRA6U) <greggirwin (Gregg Irwin)>:
Yes.
```
blk: [a b 
c d
e f]
parse blk [
	some [
		mark: (if new-line? mark [print mold mark])
		skip
	]
]
```

[22:37:31](#GAwPH1XOduGvgPQypWnl5rzRka_mhe4Gj-sIk9UFEwM) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, it is needed for rows ending with `new-line`, thank you.

[22:37:39](#2dLv8SYRDtivHPqi5YmfElaTHfvjNnrc5HuG2OMRSSY) <GiuseppeChillemi (GiuseppeChillemi)>:
* Ok, it is needed for data rows ending with `new-line`, thank you.

## 16-Aug-2021

[21:54:18](#vukyNJJ0eK6-KmYnuUv_kjkBR_JWjiIDipY4XPSaL9g) <ne1uno (ne1uno)>:
.gse python for

[21:54:53](#aM_vZKfmsOSvocAD5dta2Np1VwPrCzY-mqnlKXL7hZg) <ne1uno (ne1uno)>:
^H^H^H

## 9-Sep-2021

[22:07:49](#pXKfHT_yUPtGtzd4B8mcHSwT_wmYFncPSlcKzzJRZ6I) <greggirwin (Gregg Irwin)>:
For reference, on binary parser work: https://project-everest.github.io/everparse/

## 25-Sep-2021

[20:34:11](#67BChR5i-IOIQHbgasHY28e7MT6qe_yPWafnr4v_Rns) <XANOZOID (X.A.N.O.Z.O.I.D.)>:
> not rule	: invert the result of the sub-rule.

By result, does it mean it makes a "true" match reject??

[20:34:44](#YqbZyBMT_OLSyxyryaYK8Mu_bvzWAG1t4a-2nEo4Bws) <XANOZOID (X.A.N.O.Z.O.I.D.)>:
I was expecting something like `parse blok [ any [not word!]]` to succeed on any block that has no words

[20:34:47](#bEGBYGTg7O9AFh1rRK9ROBleMXkD726kIP_D4nBTl2U) <XANOZOID (X.A.N.O.Z.O.I.D.)>:
But it just fails

[20:36:43](#1KFdF5lC2Qh0G4O1Gf3h1i-cBUKEFKSmuq71Lmn5YaA) <XANOZOID (X.A.N.O.Z.O.I.D.)>:
[![image.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/8Ymk/thumb/image.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/8Ymk/image.png)

[20:37:19](#YWDht-Tqq3wF-SS8GlYz1a1-l9WF_JjlnrIWvKqf_Fc) <XANOZOID (X.A.N.O.Z.O.I.D.)>:
the one that passes clearly shows there's only numbers and spaces . . . so why not pass when there's anything that isn't a word?

[20:38:02](#eXYRurxwLiOUvEFeA59rpZYOABWG4srFczzrvhnO1YU) <hiiamboris (NOT THIS ONE)>:
https://w.red-lang.org/en/parse/#not

[20:40:32](#AxUb36paY8JG7p4gfzSHx1Wr7VVsj4IY1PHDZpoi6L4) <XANOZOID (X.A.N.O.Z.O.I.D.)>:
Okay so based on that, this should pass as true 
`parse [1 2 3 4] [any [not word! | skip]] `
But it does not

[20:40:52](#nh7zCcI_jVPnLVSroBdis15eTiuQ4p8gcp6LESyFi1A) <hiiamboris (NOT THIS ONE)>:
`not word!` succeeds

[20:41:10](#92gvZ58cYqElrHtEddAiMQxNXipmng7-MurY2Jszqw0) <hiiamboris (NOT THIS ONE)>:
`any` stops because it doesn't advance

[20:41:28](#Y1uEN_Fy5hFo4SLIIaDuAuhBmSwGaupI0pFgUWqPyKQ) <hiiamboris (NOT THIS ONE)>:
end of parse block, input is not exhausted

[20:41:31](#G2eyu_ZFm58ORneDvpojCXkDOwFGc5zwAUfgki-AT00) <hiiamboris (NOT THIS ONE)>:
=> false

[20:42:20](#8wuGV-k2y0vXZbbIp5WKcJLdB9Uh2SsxVMT83tyHMYE) <hiiamboris (NOT THIS ONE)>:
https://w.red-lang.org/en/parse/#any

[20:42:39](#JyEgOKJnSAmQCrInGMxT-pcWXmpL3izNXIw8Z2VruBM) <greggirwin (Gregg Irwin)>:
The key being that `not` (or `ahead`) never advance. Think of them as peeking ahead.

[20:46:06](#R2mYSn-_YEVGVZYtWONl1dgwOE5E5l6NoXH9xdcCxPY) <XANOZOID (X.A.N.O.Z.O.I.D.)>:
Thanks guys! Also nice to see there's a docs page now; I've just been referring to the blog post.  I guess I was thinking a "true with no pass" would attempt to use the other rules but that wouldn't make sense - this helps! 

## 14-Oct-2021

[1:26:16](#TsWUnVMbVfCxavTfGiTQuOMyTftp0dZq2fMBo2cdRwo) <lylgithub2021 (lylgithub2021)>:
Thanks guys! Also nice to see there's a docs page now; I've just been referring to the blog post.  I guess I was thinking a "true with no pass" would attempt to use the other rules but that wouldn't make sense - this helps! 

[1:27:19](#XVlYK3f2HGk-8vOEf0XZoHoY8XlR7lDznVK3U-H4MSA) <lylgithub2021 (lylgithub2021)>:
I want to convert "%abc.txt.def.txt" to "%abc.txt.def" ‚Äî that is to say, only keep the part before the last dot. How can I achieve 

it by `parse`? Or in common, how to get part of content before the last given symbol(here is dot in this exampleÔºâÔºü


[1:46:24](#rUTwnj6PmV5mirWwytcEM9TG1hrkyOWSLlRMF_gEVO4) <dsunanda (dsunanda)>:
@lylgithub2021 Here's one way:
```
str: "%abc.txt.def.txt"
copy/part str find/last str "."
== "%abc.txt.def"
```

[1:54:21](#tE_pimW5p_2bFqHg5ndxILHtCwKqnkx4WakqB4tJYQg) <lylgithub2021 (lylgithub2021)>:
@dsunanda Many thanks. According to your code `find/last str "."` which gives ".txt", then `copy/part str ".txt" gives wrong message, why?

[2:00:42](#pVSN8suhza7rAj65KwUSKaJ_8J3OlAD3lWUfvzIrFio) <dsunanda (dsunanda)>:
@lylgithub2021 
```
copy/part str ".txt"  ; is not the same as:
copy/part str find/last str "."
; my code is the equivalent of
copy/part str 13 
```

[2:06:30](#Adf680jpR32g8HlotsaMaQiUrVFXPMv9RLhls57Bn-o) <lylgithub2021 (lylgithub2021)>:
How does 13 comes since `find/last str "."` only returns ".txt"?

[2:14:23](#QEBV1OYTb4sFoQ5NQLlt5vhh2NiwBgvXRQCDKlGSisk) <dsunanda (dsunanda)>:
find/last str "." returns the 'str series at the 13th position (ie at the last period). That happens to look like ".txt" but is subtly different - it's effectively 'str offset by 13.
 Series can take a while to get the hang of.
Red's daddy - Rebol - probably still has the better documentation for explaining it -- see 7.5 here, for example:
http://www.rebol.com/docs/core23/rebolcore-6.html

[2:15:04](#fYxJb6uRo88ddSw3bX0_NpYxd7hEM8ReQ180P_R742Q) <dsunanda (dsunanda)>:
* find/last str "." returns the `str series at the 13th position (ie at the last period). That happens to look like ".txt" but is subtly different - it's effectively `str offset by 13.
 Series can take a while to get the hang of.
Red's daddy - Rebol - probably still has the better documentation for explaining it -- see 7.5 here, for example:
http://www.rebol.com/docs/core23/rebolcore-6.html

[2:15:45](#sTvaPx-ArGcEtEen4gvoWo2HhLa97vuswhZ-TsL3jdU) <dsunanda (dsunanda)>:
* `find/last str "."` returns the `str` series at the 13th position (ie at the last period). That happens to look like ".txt" but is subtly different - it's effectively `str` offset by 13.
 Series can take a while to get the hang of.
Red's daddy - Rebol - probably still has the better documentation for explaining it -- see 7.5 here, for example:
http://www.rebol.com/docs/core23/rebolcore-6.html

[2:27:12](#E2YavJjD-2Od3s-C9GX1NT1UxaCeuhfbKZp6rpwP6Yo) <lylgithub2021 (lylgithub2021)>:
The above reference seems not explain why the result of `find` can be regarded as length that can be used as argument of other function(i.e. `copy`).

[2:36:26](#n6BGPWxgq3A7dQIoIXj80F7a6XBMnYxTwMaXOqcwk1U) <dsunanda (dsunanda)>:
It may help to realize that `str: "%abc.txt.def.txt"` and `xxx: ".txt"` are completely separate series.

So `copy/part str xxx` is meaningless in this instance, while `copy/part str find/last str ".txt"` means copy `str` up to the position found within `str`
```
str: "%abc.txt.def.txt"
 xxx: ".txt"
 index? find/last str "."
== 13
index? xxx
== 1
```

[2:46:20](#Kioo5mTRvj4kZmwLAaOLw620vq_rkmbpUyduVqy4okA) <lylgithub2021 (lylgithub2021)>:
It may help to realize that `str: "%abc.txt.def.txt"` and `xxx: ".txt"` are completely separate series.

So `copy/part str xxx` is meaningless in this instance, while `copy/part str find/last str ".txt"` means copy `str` up to the position found within `str`
```
str: "%abc.txt.def.txt"
 xxx: ".txt"
 index? find/last str "."
== 13
index? xxx
== 1
```

[2:52:14](#eU_qJnADSPD8FFJuiYPZ3jzQWBjkO2b_-ASAtE_Jn-8) <lylgithub2021 (lylgithub2021)>:
But `copy/part str find/last str "."` gives "abc.txt.def", and `copy/part str 13` gives "abc.txt.def.". I am confused. Why does the former have not the last dot,but the latter have?

[2:54:45](#KbXjsgtoNHIGDcbqbhcDzl08RhVy43tubvkqq_26Mps) <dsunanda (dsunanda)>:
I'd agree that's confusing - it's behavior copied over from Rebol, and it may take a deeper expert to explain why it is the best, rather than a mistake..... Might want to ask again in the Help room -- we're off topic for `parse`.

[3:06:42](#7YOa8Lk7ACqSGtnmTj0GG5ZpaCsqwQnqNje8g_bBPps) <lylgithub2021 (lylgithub2021)>:
Many thanks again!! Then, is there a way to achieve it by `parse`?

[3:21:23](#FtdnU5XpmZcOsS-kPcC5-V2e7yhs_9YSdBSfux3QQUc) <gltewalt (Greg T)>:
Because `find/last` returns `.` through the end of the string.  Effectively takes it, or "chops it off"

[3:23:01](#vL4nAnWW5B5jmXpzcbI-2UopSYE2906Nn1IxuxKYfww) <gltewalt (Greg T)>:
```
>> str
== "%abc.txt.def.txt"
>> find/last str "."
== ".txt"
```


[3:24:58](#rd_Xo0yh7CMISRPtDWuog_y7CdwAMGtsBbMlk9v2kxw) <gltewalt (Greg T)>:
`>> copy/part str index? find/last str "."` is telling it to copy up to ".txt"

[3:25:12](#JgHQBmljottKQiVqMwqztYz1qGTwWUhXj_muMpByxzw) <gltewalt (Greg T)>:
* `>> copy/part str  find/last str "."` is telling it to copy up to ".txt"

[3:28:55](#hhAz13gIRLAcc7dDC67HM5MkpTAYzRQP0Ag7EPrLYo0) <gltewalt (Greg T)>:
Including index will give the latter result.
` copy/part str index? find/last str "."`


[3:29:45](#8MMzZmxCe2oBLYX14MNh5egnu45Xo6PlbYhDLUmDnnA) <gltewalt (Greg T)>:
* Including index? will give the latter result.
` copy/part str index? find/last str "."`


[4:25:39](#2GotkVsK3qf29Uy5qGLG5s34-O4B3nj6k5e4Sb4ZqdM) <lylgithub2021 (lylgithub2021)>:
`index?` is more readable, thanks. And I am still confused why the result of `find` can be used as length argument of `copy/part`. I don't find any explanation from help of `Rebol` or `Red`.

[4:37:49](#9tQsyGnFhZdmxD29WlnMasZDuNSGI69Wj7pn7_dwrpQ) <toomasv>:
If you give a number, it is interpreted as offset (i.e. length to be copied), but result of find (i.e. same series with different index position) is interpreted as target position until which to copy.

[5:32:04](#1DYO_u43v8WGP7r4FM9zExWOgmqEwXI86uAqzBwGkXk) <greggirwin (Gregg Irwin)>:
The doc string for `/part` was shortened from R2, which was "Limits the search to a given length or position." so it's confusing as it is. If we change "length" to "extent" that helps, but the R2 doc string might be best. We can also add details to the `length` arg, and keep the `/part` doc-string short. The fact that the arg is called `length` makes it a bit confusing too. And just reiterating the types in a doc string isn't much more informative.
```
/part        => Limit the extent of the search.
    length       [number! series!] "Length or series position"
```


[7:04:21](#Wui5zMQlL1OkJFOaQ5kKjDQjGFTaA5dtA2cxsVgIM_M) <lylgithub2021 (lylgithub2021)>:
 I see. Thank you @all


[7:13:16](#N2GGwexaGBg5rAD9sLtotlFIO92cclN38IpMQf--ymA) <lylgithub2021 (lylgithub2021)>:
So, here, how to achieve it by `parse`?

[7:17:54](#W0-FdnXE2cIcHzWi-d0JwnpTEjOEFmSjkv5Jk1cZ8GE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@lylgithub2021 for example:
```
file: %abc.txt.def.txt
rejoin parse file [collect some [keep to #"." ahead [skip to #"."] keep skip]]
```

[7:20:49](#QJT9Y3-oJb2ze7gUFdEi_C4RoIPuXriT5TwS0tk9ufw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
If you don‚Äôt want to use rejoin, `collect`directly into `string!`:
```
out: ""
parse file [collect into out some [keep to #"." ahead [skip to #"."] keep skip]]
```

[8:30:18](#jT04kq5UQvbwHGHcqFr1a8r8sZ20rZP2cDrvOm0or9M) <toomasv>:
Some more:
```
; Simplest
>> first parse "%abc.txt.def.txt" [collect keep copy _ to [".txt" end]]
== "%abc.txt.def"
; If you know the structure ahead
>> first parse "%abc.txt.def.txt" [collect keep copy _ [2 thru dot to dot]]
== "%abc.txt.def"
; Interesting :)
>> first parse tail "%abc.txt.def.txt" [collect any [dot keep (copy/part head s s) reject | s: (s: back s) Ì†ΩÌ∏ñ]]
== "%abc.txt.def"
```


[8:31:35](#YVgiIMe9y48FkC_pcb2opA72FYHHWGemzfz_PLK_wTU) <toomasv>:
* Some more:
```
; Simplest
>> first parse "%abc.txt.def.txt" [collect keep copy _ to [".txt" end]]
== "%abc.txt.def"
; If you know the structure ahead
>> first parse "%abc.txt.def.txt" [collect keep copy _ [2 thru dot to dot]]
== "%abc.txt.def"
; Interesting :)
>> first parse tail "%abc.txt.def.txt" [collect any [dot keep (copy/part head s s) fail | s: (s: back s) :s]]
== "%abc.txt.def"
```


[8:34:58](#D-3HXiwX-183GoFfTBmkx7riBDuFLgARAAgAhejsp-U) <toomasv>:
* Some more:
```
; Simplest
>> first parse "%abc.txt.def.txt" [collect keep to [".txt" end]]
== "%abc.txt.def"
; If you know the structure ahead
>> first parse "%abc.txt.def.txt" [collect keep copy _ [2 thru dot to dot]]
== "%abc.txt.def"
; Interesting :)
>> first parse tail "%abc.txt.def.txt" [collect any [dot keep (copy/part head s s) fail | s: (s: back s) :s]]
== "%abc.txt.def"
```


[8:35:22](#jPA9xFKxjdyLUcW-Fjr4vofuDbn5Y9UPkg6kvrP-37g) <toomasv>:
* Some more:
```
; Simplest
>> first parse "%abc.txt.def.txt" [collect keep to [".txt" end]]
== "%abc.txt.def"
; If you know the structure ahead
>> first parse "%abc.txt.def.txt" [collect keep [2 thru dot to dot]]
== "%abc.txt.def"
; Interesting :)
>> first parse tail "%abc.txt.def.txt" [collect any [dot keep (copy/part head s s) fail | s: (s: back s) :s]]
== "%abc.txt.def"
```


[12:26:45](#0hR3APtyuG2-Y4jLu3K-4MOLC85_V1rO2KKuxyuTIXY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
```
file: %abc.txt.def.txt           
ext: find/last file #"."  ;== %.txt
copy/part file ext  ;== %abc.txt.def
rejoin [copy/part file ext ext]  ;== %abc.txt.def.txt
clear ext  ;== %""
file  ;== %abc.txt.def
```

[12:30:05](#q6Oz9qkFpJMKXur_KBw8bQDCu9Qlqg8Wqjwc5thf8tY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@lylgithub2021 when the series is used for the _part_, than it is zero-based index and it makes sense. You want `s: "abc" copy/part s s` to be `""` and not `"a"`.

## 15-Oct-2021

[0:49:35](#tD3Otxo4ajH8zi_RQW_0Vq8uyubCxeJwULT8rjN8oOM) <lylgithub2021 (lylgithub2021)>:
@lylgithub2021 when the series is used for the _part_, than it is zero-based index and it makes sense. You want `s: "abc" copy/part s s` to be `""` and not `"a"`.

[0:50:29](#LDXIy827FUc638_6cBEde5bZuArMDkDh4b8_eHfnID8) <lylgithub2021 (lylgithub2021)>:
Thank you all. I'm learning them.

[2:46:20](#Lzvsm1FL0hAPWyZK8xAzvjGPcPXkhT18C52nEdscyJg) <gltewalt (Greg T)>:
lol
```
>> reverse remove/part reverse str 4 
== "%abc.txt.def"
```

[6:35:53](#O3hdyczd854J2NfNhF3dJO_BqnYCRect4vEkR5RmIWo) <lylgithub2021 (lylgithub2021)>:
lol
```
>> reverse remove/part reverse str 4 
== "%abc.txt.def"
```

[6:39:23](#LhGTYxAvDNXpj8P-AmBkYOmadUs_dG2rkmGfs6vlhcU) <lylgithub2021 (lylgithub2021)>:
Why do codes with `parse` fail to complie? I have a red script named "fortestparse.red" which only contains: 
```
Red []
parse "abc.def.ghi.jkl" [copy aa thru "." to "."]
probe aa
```
When I compiled this script by `red -r -t MSDOS fortestparse.red`, it faild with wrong message: `undefined word aa`. Why and how to deal with it?

[6:40:37](#9hIRZ39t7MA2Ix6wJLJWW2niA2nqF78BUsBT7BP7n2s) <rebolek (Boleslav B≈ôezovsk√Ω)>:
insert a line `aa: none` before the parse. Compiler can't determine words from  parse, they need to be initialized manually. Interpreter is smarter in this case.

[6:41:27](#sO_DGCLZIs0QexfXeodmY5b3apAFA0rKeZUmKX8QRNk) <lylgithub2021 (lylgithub2021)>:
Is it a bug of compiler?

[6:42:08](#wKXFczGRNfopnRlzbKZrNFtRneYSlw9kGSGHIf4uUcQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I won't say "bug". Maybe a missing feature?

[6:43:01](#ZcpUAA9JMux3RmOXqOCZjtLbBBYwc8KoZL2KjDUWqnA) <lylgithub2021 (lylgithub2021)>:
Does that mean all word used in `parse` has to be preclaimed when compiling needed?

[6:46:06](#tPrZV8oLzxN_vc-OyMEzpUk_mDJyepb9pRXQpIbg8ZA) <lylgithub2021 (lylgithub2021)>:
Any help Doc mention this?

[6:47:59](#hd5HGvLK8bU4PwKkR8FOAmXTT6BI1Bh5-GDDIsrmLBQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Yes, you need to define all used words. There may be a list of compiler limitations in the docs, I'll take a look.

## 27-Oct-2021

[16:17:57](#CSWctKIP5s04dV0a5tYPnx4RCUKvJ15EDephcUupb6c) <hiiamboris (NOT THIS ONE)>:
More targeted repost from red/red:

Hi! If you feel like expanding mental horizons, here's an experiment I'd love feedback on.

# [MORPH DSL - A dialect for efficient local series conversion](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/morph.md)

A few teaser examples (more on that page):
```
>> morph [1 2 3 4] ['x 'y ...] ['y 'x ...]
== [2 1 4 3]

>> morph/auto [1 2 3 4] ['x ? even? x | skip ...] ['x ...]
== [2 4]

>> morph/auto/into [1 2 3 4] ['x ...] ['x (not 'x | " ") ...] ""
== "1 2 3 4"
```

[16:18:08](#r_nR9vOiAoRuUa2RLgOfQCFP5pPyB09SHwGYURYrCuw) <hiiamboris (NOT THIS ONE)>:
* More targeted repost from red/red:

Hi! If you feel like expanding mental horizons, here's an experiment I'd love feedback on.

## [MORPH DSL - A dialect for efficient local series conversion](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/morph.md)

A few teaser examples (more on that page):
```
>> morph [1 2 3 4] ['x 'y ...] ['y 'x ...]
== [2 1 4 3]

>> morph/auto [1 2 3 4] ['x ? even? x | skip ...] ['x ...]
== [2 4]

>> morph/auto/into [1 2 3 4] ['x ...] ['x (not 'x | " ") ...] ""
== "1 2 3 4"
```

## 28-Oct-2021

[5:54:45](#blM42y02LbWMHNZKUilqDQYRfMXninJJmy3Wd3ake-Q) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Nice :)

## 13-Nov-2021

[16:03:04](#eQ2fZ1QJCYTWgGOEVshfYc1hqJ0x3-BCWbrWfZ8aeWE) <justinthesmith (Justin the Smith)>:
Hey folks, I've run into a problem with unexpected case sensitivity with `parse` in Red 0.6.4:
```parse [a] ['A]```
This returns `true` in Rebol 2, Rebol 3, and older versions of Red (0.6.3). But Red 0.6.4 returns `false'.

This is problematic as it's preventing construction of a case insensitive but case preservative dialect using block parsing mode. I've not enabled case-sensitive mode with the `/case` refinement. Any idea what's up?

[16:03:28](#r68wjMITgR-Ye0myQr9p35HtatlvCCxTpfx6wSsSlHs) <justinthesmith (Justin the Smith)>:
* Hey folks, I've run into a problem with unexpected case sensitivity with `parse` in Red 0.6.4:
```parse [a] ['A]```
This returns `true` in Rebol 2, Rebol 3, and older versions of Red (0.6.3). But Red 0.6.4 returns `false`.

This is problematic as it's preventing construction of a case insensitive but case preservative dialect using block parsing mode. I've not enabled case-sensitive mode with the `/case` refinement. Any idea what's up?

[16:25:34](#sjtXwAptOilJtnvgxeYfrU8VkJ3zkcwASgSAHI3fdv8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@justinthesmith sounds like a bug

[20:44:11](#CBPqqX2IEGoHFbyPJRjMGzkKmWHX3e5ziKBxinZljoU) <ne1uno (ne1uno)>:
@justinthesmith try with latest, 064 is old

[22:53:48](#W5TBt0QR40WfkOeaW0epaVy4Oawwr1_ZwpohUTnWNtU) <justinthesmith (Justin the Smith)>:
I get the same unexpected case-senstivity with latest, Red 0.6.4 for Windows built 13-Nov-2021/2:17:19-08:00  commit #5f09829
Where do I file a bug report?

## 14-Nov-2021

[16:14:23](#tQWHly0koOW7pt5A433w08nNhn8A0VM-ckUa_V0nb0g) <greggirwin (Gregg Irwin)>:
https://github.com/red/red/issues

[16:17:57](#dfl9AqUpw69J8_PNLPEMlFQN7z6nWz4TNtLaVDnAnYA) <greggirwin (Gregg Irwin)>:
See also: https://github.com/red/red/issues/3554 and https://github.com/red/red/issues/3029

[17:09:44](#92VhAUgq5K63yay1ghOQQ720CCW1NG24pB_I6GbJdG4) <justinthesmith (Justin the Smith)>:
Thanks! Will file an issue.

One interesting thing that's arisen looking back, is that the /case refinement in Rebol's parse doesn't seem to apply in block parsing mode. For example, this is what I would expect:
```
>> parse/case [a]['A]
== false
```
This returns `false` in Red latest as I expected, but this is `true` in Rebol.  Is Red's behavior here a bug? Should /case apply to word values in block parsing mode?

## 15-Nov-2021

[7:38:14](#63wZJ_qhIOIkU_i9V__iLsSIS6a3HbdjFWXvw257h_c) <hiiamboris (NOT THIS ONE)>:
Of course it should.

[17:47:39](#XmGkKujr21pjiaGKNNzouHYj2B8wYSJP5ex9GK6ubhg) <justinthesmith (Justin the Smith)>:
Thanks for the comment on the ticket, @hiiamboris . I was hoping Red could solve problem with a dialect, but I'm not sure my vision is possible with this bug.

[17:59:11](#x16qjn0iRR8L6oPo7VFhdSLRCuyr8S-iFjeE4MXH1Sg) <hiiamboris (NOT THIS ONE)>:
Haven't I provided you with a workaround?

[18:00:21](#8pG-iaP8ERn-E8T4RDBQFzPow4lrW1JMogBHv4uVqfg) <hiiamboris (NOT THIS ONE)>:
I don't see how that can impair your dialect Ì†ΩÌ∏â

[18:00:34](#apqFKxQSMSxIPMvo4Y1Lqb5w0QANbRWUmQW2oLvRr1U) <hiiamboris (NOT THIS ONE)>:
Just produce the rules that work.

[19:55:14](#YWOrdQARdPX1VgsWH7rovGhdIqkIXNQHL7g1UC6Dlbs) <justinthesmith (Justin the Smith)>:
The goal is to produce a dialect that's human readable, human writable, and human maintainable. "Just produce the rules that work" is easier said than done--and seems to stand in sharp contrast with the philosophy of building the the language to suit the problem.

Consider this dialect example:
```
test1: {sell 100 shares acme now}
test2: {Sell 100 Shares Acme Now}
test3: {Sell  100 Shares Acme  20-Nov-2021/11:45:00-08:00}

rule: [
	set order ['buy | 'sell]
	set amount integer!
	opt 'shares
	set ticker word!
	['now (set 'when now) | set when date!]
]

parse load test1 rule
parse load test2 rule
parse load test3 rule
```
All three tests are `true` in Rebol, but test2 and test3 return `false` in Red with the case sensitivity bug in parse.

Rewriting the rule with your tip:
```
rule: [
	set order [set w word! if (w = 'buy) | set w word! if (w = 'sell)]
	set amount integer!
	opt set w word! if (w = 'shares)
	set ticker word!
	[set w word! if (w = 'now) (set 'when now) | set when date!]
]
```
Now all three tests are `true` in Red (but all are `false` in Rebol). But the added complexity is the problem. Going to be very difficult to scale to a more complex dialect--especially if I expect people who haven't been using parse for decades to be able to write rules as well. I can't present a solution like this to my manager, let alone others who don't know me as well.

To me, this bug is a critical issue as it severely hinders one of the key features of the language.


[19:58:42](#5uAE8gIbugk3exJRjGK3fRoDc_hvR7KmT-AHnAMyFDk) <hiiamboris (NOT THIS ONE)>:
Ah, so them others would need to modify your dialect then. I see.

[19:59:25](#dOUwxR4bs3YYDi3FMuYIAsHSCsUZzGzC28kG_MI4DjA) <hiiamboris (NOT THIS ONE)>:
Well, you can fix the bug and PR the solution then Ì†ΩÌ∏â

[20:06:26](#AvKIeaEvIiuUKhmL11zIvZFH_uvuckXEKnOes3YC8HE) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/issues/3029#issuecomment-436438710 here it was reported as a regression

[20:07:26](#5eeE235qNqTLVJJg4oZ4wvu6B8Yvjxik4NX2xrlNMIA) <hiiamboris (NOT THIS ONE)>:
here's commit that caused it https://github.com/red/red/blame/5f09829edc80342c70b65f69defc4d05c2d081b8/runtime/parse.reds#L190

[20:08:46](#hMnDWQ4IvTp1wQpEfw3lSlB-F9yM6-i2WeNTBJatc1w) <hiiamboris (NOT THIS ONE)>:
And there's a better workaround for you: `quote buy | qoute sell`

[20:09:02](#_-VidHsytxnZOMtRbKmad3Ohiiw9OdVdASh_sEy1zXg) <justinthesmith (Justin the Smith)>:
Thanks for finding that! I'll take a look

[20:09:25](#lN73qe44abjlElO0AeBThFJJkYihdFRawuuwbJkKuQs) <greggirwin (Gregg Irwin)>:
Words should not be treated case sensitively by default. That's the main bug. Whether `/case` should apply to them is separate. It is supported elsewhere.

[20:18:06](#xEwKwncCbIDxTvwn06QQJ-6S2qhbYIVu3cVy6JbV1HI) <justinthesmith (Justin the Smith)>:
Makes sense to me, Gregg.

I have a few old builds saved locally prior and confirm things worked as expected prior to that commit @hiiamboris referenced. I don't have any experience with Red/system but please let me know if there's anything else I can do to help address this bug.

[20:26:59](#ZCzhtX7CBbOUpxnoCds-Mev20za5ZxnVVAFoWq-4i7g) <greggirwin (Gregg Irwin)>:
:+1: This is probably one we want the core team to tackle.

## 6-Dec-2021

[10:17:54](#hd0PwpRPZyIXEF3eZVs-84VktP-dwwvrR8Tt2kUWktc) <bubnenkoff (Dmitry Bubnenkov)>:
I need to extract letter from string if digits. I tried to use `char!` datatype to determinate symbol, but it's seems that every element in string is `char!` so the code do not work:
```
>> parse ["81128A24826"] [ to char! s: (print s) ]
== false
```

[10:19:09](#LNxheIWNLcYQ7v279MEboRhdBS78CiDSkn5aSeL2HvE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
First, you are parsing a string, so it doesn‚Äôt make sense to put it into block, just use string parsing.

[10:19:50](#UkaBptpDOAChqpLcjijvAMWYAh0yp5XrGdUfg1YAkxE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Then it‚Äôs pretty straightforward.

[10:21:01](#8ypZRB6fgM0DNc9h7SLfM4PE9lBd1dVz5TWgzVXySRo) <rebolek (Boleslav B≈ôezovsk√Ω)>:
```
>> numbers: charset "0123456789"
== make bitset! #{000000000000FFC0}
>> parse "81128A24826" [collect some [keep numbers | skip]]
== [#"8" #"1" #"1" #"2" #"8" #"2" #"4" #"8" #"2" #"6"]
```

[10:24:05](#S_TJT0lXWfghNwGukY9ywQuYLShBbXIJP3_K6rTdTpw) <bubnenkoff (Dmitry Bubnenkov)>:
So I should do something like:
```
>> parse "81128A24826" [collect some [ numbers | set x skip ]]
== []
>> x
== #"A"
```
To extract letter

[10:24:46](#JzxfGZ5mUg4-EZPKd2UlRYrTcNJDBb50x0i5SAPPMdw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
either that or you can turn it around and define letters charset

[10:26:02](#SnXynhS9Z2oeIFvsLSDAdX7ShbfhsYX0fqnVl8sHGoo) <dsunanda (dsunanda)>:
Just for variety, a non-parse way:
```
trim/with "81128A24826" "0123456789"
== "A"
```

[10:26:43](#ye3Y65Sl-6zqP0_IUHqTjzBlJsHabnZ5Sq4_Jv9G1Xw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
:+1:

[10:38:12](#1W6Rc4nW19v4_LcKvz4Sy3PS9u52LkhvIhVYl6rPEW8) <bubnenkoff (Dmitry Bubnenkov)>:
hah! Cool!

## 13-Dec-2021

[2:43:54](#o8vLGJXGnBSgh7WA6ZE1993M8WuzXPua_wSNE2m67RU) <lylgithub2021 (lylgithub2021)>:
hah! Cool!

[2:45:27](#aek415yK_UBwNLBrGfzyWRyDJsJj107D-YtGtoaM4Zg) <lylgithub2021 (lylgithub2021)>:
A string like this: "a.b.c.d.e.f.g"(the number of "." and the content of string are both unknown in advance). How to get "a.b.c.d.e.f" by parse? That is to say, all things before the last dot.

[4:42:00](#Xw40mbkqi3LyBzatht5l1f3gPUzrmeXEBynyTbg1RRk) <toomasv>:
If it should always get string just before the last dot, then e.g.:
```
head clear find/last copy "a.b.c.d.e.f.g" dot
== "a.b.c.d.e.f"
```
If it is rather everything until 6th dot, then maybe:
```
count: 0 string: copy "a.b.c.d.e.f.g" until [string: next string if dot = first string [count: count + 1] all [count > 5 string: head clear string]]
== "a.b.c.d.e.f"
```
Or with parse:
```
count: 0 parse string: copy "a.b.c.d.e.f.g" [any [s: dot if (5 < count: count + 1) (clear s) | skip]] string
== "a.b.c.d.e.f"
```

[4:42:19](#aXnj0SFY3-D1-znYnL5CAQcFVrtmXNB3hUCZTMMO9Dw) <toomasv>:
* If it should always get string just before the last dot, then e.g.:
```
head clear find/last copy "a.b.c.d.e.f.g" dot
== "a.b.c.d.e.f"
```
If it is rather everything until 6th dot, then maybe:
```
count: 0 string: copy "a.b.c.d.e.f.g" 
until [string: next string if dot = first string [count: count + 1] all [count > 5 string: head clear string]]
== "a.b.c.d.e.f"
```
Or with parse:
```
count: 0 
parse string: copy "a.b.c.d.e.f.g" [any [s: dot if (5 < count: count + 1) (clear s) | skip]] string
== "a.b.c.d.e.f"
```

[4:44:45](#5TyDqdGuBtkPh46PScemqOPbpbpxeRcq5wg0iFa9cNA) <toomasv>:
* If it should always get string just before the last dot, then e.g.:
```
head clear find/last copy "a.b.c.d.e.f.g" dot
== "a.b.c.d.e.f"
```
If it is rather everything until 6th dot, then maybe:
```
count: 0 string: copy "a.b.c.d.e.f.g.h.i" 
until [string: next string if dot = first string [count: count + 1] all [count > 5 string: head clear string]]
== "a.b.c.d.e.f"
```
Or with parse:
```
count: 0 
parse string: copy "a.b.c.d.e.f.g.h.i" [any [s: dot if (5 < count: count + 1) (clear s) | skip]] string
== "a.b.c.d.e.f"
```

[5:19:16](#JSmfuaugWgMuBseFgLjEEn4WX9fLQNAntLQAz8aulPE) <toomasv>:
With hypothetical new `split`it might be 
```
first split "a.b.c.d.e.f.g" [last dot]
== "a.b.c.d.e.f"
```
Or maybe
```
first split/last "a.b.c.d.e.f.g" dot
== "a.b.c.d.e.f"
```
Which would you prefer?

[5:49:03](#Pm8sqZ73dWaQXhugeUSW0kMTqOYccZ8CCf5puydsiLo) <lylgithub2021 (lylgithub2021)>:
Many thank! @toomasv ! THe version of ypothetical new split is more readable. When is it usable in Red?

[7:20:10](#aG3ddNYgszrly8MlEfWG0m2TM4itA-OWJryjmq4U3WQ) <lylgithub2021 (lylgithub2021)>:
I think `find/last copy "a.b.c.d.e.f.g" dot` returns a pointer which is used by `head clear`. If I need to store the returned value in a variable which will not be affected by the further movement of the pointer, what shall I do?

[7:41:23](#DvvvmjwnalW7TtfQ5uo_9xrIb3YQ-LT5y2y1v3grMcA) <toomasv>:
You are welcome!

> If I need to store the returned value... what shall I do?

Use set-word. You can record both tail of your string and head of it, e.g.
```
head-of string: head tail-of string: clear find/last copy "a.b.c.d.e.f.g" dot
```
Or, if you don't need it at once, but later, you might set a word to it at once when copying:
```
clear find/last str: copy "a.b.c.d.e.f.g" dot 
...
str
== "a.b.c.d.e.f"
```

[7:41:52](#1UU5Bw_LZWHipj67ZOFureFdfVR-53CL7M6pu4YVYX8) <toomasv>:
* You are welcome!

> If I need to store the returned value... what shall I do?

Use set-word. You can record both tail of your string and head of it, e.g.
```
head-of-string: head tail-of-string: clear find/last copy "a.b.c.d.e.f.g" dot
```
Or, if you don't need it at once, but later, you might set a word to it at once when copying:
```
clear find/last str: copy "a.b.c.d.e.f.g" dot 
...
str
== "a.b.c.d.e.f"
```

## 24-Dec-2021

[13:06:15](#U7l7QudcKIW8-ur4789q5EUIGzdp4q_JZeQFEV5rySY) <lylgithub2021 (lylgithub2021)>:
I have a string whch contains some numbers. How can I get all numbers from the string(and all strings in the string). For example, `str: " 1.5yuan ^/ 3 yuan ^- -2.3dollar"`

[13:16:29](#ZTqzGiQSyVcbSSBitEjNY3TICVH7Y1bn4ZC-gk5ecL8) <hiiamboris (NOT THIS ONE)>:
use [Parse](https://www.red-lang.org/2013/11/041-introducing-parse.html)

[13:17:29](#xbRZbI1X6DJ8oU29p3xmQ8-k7-k4sPf-VUqu2Bezrmk) <toomasv>:
```
digit: charset "0123456789.-" parse trim/all str [collect any [copy num some digit keep (load num) | keep to [digit | end]]]
== [1.5 "yuan" 3 "yuan" -2.3 "dollar"]
```

[13:20:24](#ZaiKlqqfTxuahruKd_Thcwnze70WAZHE6dBEDmYrFHw) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
```
str: " 1.5yuan ^/ 3 yuan ^- -2.3dollar"

number: charset "0123456789."
string: charset complement number

parse str [
    any [
         copy num some number (print ["Number: " num])
        | 
         copy str some string (print ["String:" str])
   ]
]
```
My code is surely complicated and not efficient in comparisong to parse gurus here :-)

[13:29:59](#3xn-Zbjc88MnbUZSFTIQwDO1AofDKsGfv8msS2oAEbE) <toomasv>:
Also
```
parse str [any [digit not digit insert space | skip]] new-line/all load str no
== [1.5 yuan 3 yuan -2.3 dollar]
```

## 26-Dec-2021

[2:22:58](#p5x2HMyPqlxti84jSWS2Ds6biu5N7SS-6eHKGBHESJE) <lylgithub2021 (lylgithub2021)>:
Good solutions! Thank you all.

[2:44:35](#M5NqJDI1FVEs-XTadX6W1wU0F-VGL4RCCdeguL6gz9o) <lylgithub2021 (lylgithub2021)>:
Good solutions! Thank you all.

[2:54:11](#dL0TigMRy-ecoGkC4lNNYuUhWBNXSfpj_ir2bYYaOYM) <lylgithub2021 (lylgithub2021)>:
Good solutions! Thank you all.

[3:03:59](#ScF_HFPz9_p-39mpBFGf5vzWj4xAxzY1uaaFc2jrYAM) <lylgithub2021 (lylgithub2021)>:
Good solutions! Thank you all.

[3:06:46](#vSlthxcNumqS_GimAGapLDEBtIFjB2KTdYtS7hySKCs) <lylgithub2021 (lylgithub2021)>:
Good solutions! Thank you all.

[3:07:16](#WuhD0CiNvhtYpvU6jqoL7MsfM-mKCO-ZMmRY8qi4as8) <lylgithub2021 (lylgithub2021)>:
Good solutions! Thank you all.

[3:07:46](#Szpne8VLHOrSH8pBpSFV-07tiU6Nx9VYjWnKSm9Jatg) <lylgithub2021 (lylgithub2021)>:
@toomasv I modified your first method with this:
```
>> parse trim/all str [collect any [keep some digit | keep to [digit | end]]]
== ["1.5" "yuan" #"3" "yuan" "-2.3" "dollar"]
```
Then I tried to change `#"3"` into `3` by `load #"3"` as you did in parse but failed. I also tried with `do #"3"`, and get #"3". So how to change a digit char to number? And why does it work by `load` in `parse` but fail outside `parse`?

[5:56:50](#uZke_cK3qQhlQYBGYpg4QxwvYHqT_2vPBi3FMojyXnk) <toomasv>:
@lylgithub2021 No, I did not load a char, bc it cannot be loaded. You can load strings.

[7:28:37](#DjDV_7MXk1tANdJXHJPOZD0Pbliv7c2U1ay0nRQAl5Q) <toomasv>:
That's why I used `copy`.

[7:34:26](#McC_Ahh5qxsgRtP-tQ3K2Up8FWPISxoJJyJYI4yYjp4) <toomasv>:
* That's why I used `copy`. If you have char, then you can do e.g.`load to-string #"3"` or `to-integer to-string #"3"`.

[7:37:42](#r_vw40KSBFkIt2QZQNvDeEHs0C_g_1995zuqccwY0sw) <toomasv>:
* That's why I used `copy`. If you have char, then you can do e.g.`load to-string #"3"` or `to-integer to-string #"3"`. (Or `(to integer! #"3") - 48`:)

[7:42:32](#dmYGcQts818aJ-OTF3u77FSdL2t5IXwrffQGLknRs8o) <toomasv>:
You can use `keep copy _ some digit` in your rule to get all elements as strings.

[13:49:26](#9YhX6fz1EyyTb9LOmRamTxlWJFWtJboRRZeR_hGHg64) <lylgithub2021 (lylgithub2021)>:
Thank you @toomasv so much! 

[15:33:06](#CKVYksIfs8MF4LNdH6SF3XX5lOehjSaUAgqXYUZAW_A) <toomasv>:
You are welcome!

## 27-Dec-2021

[5:42:13](#EHUriWGislBl6LVyASWdZX0BkEVKko5LPTg4-d5Wrng) <lylgithub2021 (lylgithub2021)>:
You are welcome!

## 13-Jan-2022

[20:04:27](#jWmal90j_NAF9j1WFf_6hyAyYvOoKnkOKB0smUgGWas) <cloutiy (yc)>:
Is it possible to see how `parse` is implemented? Where can one see the implementation on github?

[20:57:46](#YVMbVsKfUzTJIs6-q86aotrOPsbQdA6e66DtxKNYkpM) <greggirwin (Gregg Irwin)>:
https://github.com/red/red/blob/master/runtime/parse.reds

[20:59:24](#JUGA24_-i8iGbDu6XZVQZ8xxLTo2uEXZC0Bwq-fGmNE) <GiuseppeChillemi (GiuseppeChillemi)>:
You can also Read This: http://www.codeconscious.com/rebol/parse-tutorial.html#Introduction

[22:28:41](#ehK0OeTb7atfV-msVd64yjPdzvrFeDzFNYH9xmU5wr0) <cloutiy (yc)>:
@greggirwin thanks for the link gregg this is what i was looking for...

## 18-Jan-2022

[7:34:17](#WBgNGxJJ4NKZsBBQh4YeKbSA_hWSOVW7wskxDrXK5Qs) <bubnenkoff (Dmitry Bubnenkov)>:
Hi! I need a way to remove quotermark from string only if it's exists at start and it's end.
I decided that parse is best for it.
For example:
```
{"Hello World"}
```
Should become:
```
{Hello World}
```

But: 
```
{Company name "Hello World"}
```
Should stay:
```
{Company name: "Hello World"}
```

I tried to write next code:
```
str: {"Hello World"}

parse str [remove {"} to end  ]

probe str
```
But how to deal with last quote mark? 

[7:52:43](#BsrVNlr0X5TfnJxRtHA6xadV1tII509B7zE5rMa7o08) <GalenIvanov (Galen Ivanov)>:
@bubnenkoff Something like that?

[7:52:49](#i772WH5OR8AY2AUDrjacpORw7LUZJw4Cnl0IWETtuto) <GalenIvanov (Galen Ivanov)>:
```
remove-quotes: function [str][
    parse dst: copy str [
		p-st: opt dbl-quote
		some [not dbl-quote skip]
		p-end: dbl-quote end
		(if p-st/1 = dbl-quote [remove p-end remove p-st])
	]
	dst
]
```

[7:54:14](#bNgR7TzGdvgOIoGzc4kJBIhc74UB_h-vKXBy9TJPx7I) <GalenIvanov (Galen Ivanov)>:
```
>> remove-quotes {"Hello World"}
== "Hello World"
>> remove-quotes {Company name "Hello World"}
== {Company name "Hello World"}
>> remove-quotes {"Hello World" Company name}
== {"Hello World" Company name}
```

[8:27:18](#1TaZuLC2o88lkbolH-eng9mzC7w4TbuDE3Tg7JtLkas) <bubnenkoff (Dmitry Bubnenkov)>:
yeah! Big thanks!

[8:38:24](#Ve2kezEDJtM9TEu6dcUKG9IfT3EIJ57fDFSUR9iZAls) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
```
>> parse str: {"aa"bb"} [any [to #"^"" remove some #"^""]] str
== "aabb"
```

[8:39:59](#FIvu3K1sNOwmo7gMLpNjsS2Emw81UBpXTE-jvUypEDE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Ah... sorry... it's not what you want... I should first read it:)

[8:42:05](#HnYvGnO77v2WEv57d3uUSUsxudeDsuZn-HJ5UMmz8uU) <toomasv>:
`parse` really not needed there:
```
rem: function [str][if all [#"^"" = first str   (index? find next str {"}) = length? str][replace/all str {"} ""] str]
rem {"Hello World"}
;== "Hello World"
rem {"Hello World" company}
;== {"Hello World" company}
rem {Company name "Hello World"}
;== {Company name "Hello World"}
```

[8:42:54](#g89dIikHewn0Mv2YNB51OEx9m_JS_HmLZd1D9p4rne4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
>> str: {"hello"} if all [#"^"" = first str #"^"" = last str][remove back tail remove str] str
== "hello"

[8:43:02](#WWQRJ3OfteDBmnBsMw_kRL3_csjPY-htKoWbDtFCpHw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* ```>> str: {"hello"} if all [#"^"" = first str #"^"" = last str][remove back tail remove str] str
== "hello"

[8:43:08](#PTP0e7ef-fReVs6Q98g_zAad-r17m9yea45Q1o-gquA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* ```
>> str: {"hello"} if all [#"^"" = first str #"^"" = last str][remove back tail remove str] str
== "hello"
```

[8:44:53](#io272KvvAxgzxC2aKZyqhToaM5GLFTUBXcnH7AAHAxI) <toomasv>:
```
str: {"hello" wrong "world"} if all [#"^"" = first str #"^"" = last str][remove back tail remove str] str
== {hello" wrong "world}
```

[8:45:19](#w-CV_1NqzjxV5CM26bqg6DAftf_9PFlGl5lSq1G-xgQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
hm:)

[8:46:34](#h3oRElrs3EONMuQyYFjSLkVzZKBtD4VaV-AHMKIgj00) <toomasv>:
But `[remove back tail remove str]` is better, yes.

[8:55:18](#mpLInPgny1XMYTQd-ePyjZmj-jISqkZaRy-kqjEmMI4) <GalenIvanov (Galen Ivanov)>:
Yes, `parse` is not needed here :)

[11:16:12](#mbf08TrBtmXzP5573YtXimwX0QuuC1pDZaZyCckoaiI) <bubnenkoff (Dmitry Bubnenkov)>:
Thanks!

[11:39:41](#mFxafCw-5knilzBE07EtF05TIA4O2vzgj8eApKBnj1M) <hiiamboris (NOT THIS ONE)>:
```
>> parse s: {"hello" wrong "world"} [remove {"} to [{"} end] remove {"}] s
== {hello" wrong "world}
```
but parse will be much slower

[11:43:42](#Sb-TYj7lj-QmviAVXVvjKdWObCbwTqqBbEt3zsbGJgY) <hiiamboris (NOT THIS ONE)>:
* ```
>> parse s: {"hello" wrong "world"} [remove {"} to [{"} end] remove {"}] s
== {hello" wrong "world}
>> parse s: {"hello" wrong "world"} [remove {"} to [remove [{"} end]]] s
== {hello" wrong "world}
```
but parse will be much slower

[15:55:32](#9Oo1VcATpEIcFJA6iEE_JZXYa2msmUoenidMYoVx2PM) <toomasv>:
Huh?

[16:05:16](#R89P-vX02PG5H_kgbk2idZWHkEqI6YWxVNdHvqlvfPE) <hiiamboris (NOT THIS ONE)>:
much slower than `remove` :)

[18:13:45](#pxDMH60etrJ-6DLDY05cy127hlL5YJqIOYf9VE_5Fyk) <gltewalt (Greg T)>:
How can I account for parens with this?
```
Red ["24 Game"]

numbers: copy []
collect/into [loop 4 [keep random 9]] numbers
op: charset "*/+-"
valid-number: charset form numbers
valid-expression: [valid-number op valid-number op valid-number op valid-number]

explode: func [val /local c][
    c: copy []
    forall val [collect/into [keep val/1] c]
]

; allow spaces or no spaces in the expression with trim/all,
; but since Red throws invalid integer error without spaces, break the string
; back apart with explode, and then form it into a string with spaces.
; load that and feed it to math.
check-expression: does [
    either parse trim/all e: ask "Enter expression: " valid-expression [
        either 24 = math load form explode e ["You got it!"]["Not quite correct"]
    ][
        "Invalid expression"
    ]
]

print ["Using the following numbers, enter an expression that equals 24:" numbers]
check-expression
```

[18:30:08](#2exfwWKexrGip2v1UxbMPuxMFC3X8GS7BIIFJUYhcHg) <toomasv>:
Hmm...
```
Using the following numbers, enter an expression that equals 24: 7 2 7 2
>> check-expression
Enter expression: 7-2+7*2
== "Not quite correct"
```
Hey!
```
>> 7 - 2 + 7 * 2
== 24
```

[18:30:44](#gqruD3sAo3cMUk8XoaezLXFncIxHZm2rasG4AinjlAo) <toomasv>:
* Hmm...
```
Using the following numbers, enter an expression that equals 24: 7 2 7 2
Enter expression: 7-2+7*2
== "Not quite correct"
```
Hey!
```
>> 7 - 2 + 7 * 2
== 24
```

[18:49:58](#AMsftexd6aMUUgzjZrS5WB9YvD3HoERWKqxj6h7xOHM) <hiiamboris (NOT THIS ONE)>:
why are you using collect/into?

[18:51:32](#xAUw31M4b8ZPc2-XBq-T4pJ3TCyTzpnW6GBTpX06ams) <gltewalt (Greg T)>:
It's using `math` so follow order of operaations toomas

[18:52:19](#tsqybm0eIxzbhv9cKWsmAOQViD5tKMd2KkTDjkFq6eU) <gltewalt (Greg T)>:
Why not collect/into?  `append [] ...` better?

[18:52:33](#mox2mRvODCYb9Z_GAWVVj33faGaQEfii-iqARf8HNpg) <hiiamboris (NOT THIS ONE)>:
why not just `collect`? it does the copy for you

[18:52:53](#-HQ0svn-s7wKc3lCmwlOMygVrGLuRhppBWhbLaWORm4) <hiiamboris (NOT THIS ONE)>:
and you like no I don't need your copy I'll do that myself :)

[18:53:08](#WAlItVhqMDleEgUUcoFGc53fQ2pG5VUNnFICjtL4kSo) <hiiamboris (NOT THIS ONE)>:
also 
```
>> extract/into "1+2/3" 1 []
== [#"1" #"+" #"2" #"/" #"3"]
```

[18:53:42](#5BWzDrsgL0tYGh0eMbSQgBHtoufC5slS4Jqw2lDyAR0) <gltewalt (Greg T)>:
Are you sure? I swear I did normal collect and it grew

[19:04:03](#NkqiPItDOiHqhzVGPydHUdhVneczvsl-msi1aeYuePs) <gltewalt (Greg T)>:
Oh, no, this is why I went to `/into`

[19:04:12](#jkHsUoBkUSf2uKfSqI-oi8cvAoTTn_Ga3bpBu8fkcg4) <gltewalt (Greg T)>:
```
>> x: "2*3/9-3"
== "2*3/9-3"
>> forall x [collect [keep x/1]]
== [#"3"]

```

[19:04:43](#vcBIbChjRe44wjXa-dpQlQXNjMfZNp6xT1O-YotJcZI) <gltewalt (Greg T)>:
Because I iz smort

[19:08:05](#BaEKIiYexZ88CizE-1heBSoCjBndd7Ue-qU3OZvmrKs) <gltewalt (Greg T)>:
There
```
op: charset "*/+-"
valid-expression: [valid-number op valid-number op valid-number op valid-number]

explode: func [val][
    extract/into val 1 c: copy []
]

check-expression: does [
    if "q" = e: ask "Enter expression: " [halt]
    either parse trim/all e valid-expression [
        either 24 = math load form explode e [print "You got it!"][print "Not quite correct"]
    ][
        print "Invalid expression"
    ]
]

main: does [
    numbers: collect [loop 4 [keep random 9]]
    valid-number: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24:" numbers]
    check-expression
]

forever [main]
```

[19:12:14](#qAOYPKEgXUW77PkEvuIUWPVetDIFCVxI0SFFBOxF2hc) <gltewalt (Greg T)>:
Now for the parens, which I assume `math` obeys

[19:21:25](#FRg45g31aAplBi8Z3P2w1G44-OPNuDObr36e5CBOeXc) <toomasv>:
OK, this follows Red order, but parens can be added:
```
numbers: collect [loop 4 [keep random 9]]
op: charset "*/+-"
n: charset form numbers
num: [keep n]
exp: [num some [op num]]
term: ["(" exp ")" | num]
formula: [collect [term any [op term]]]
explode: func [val /local c][
    c: copy []
    forall val [collect/into [keep val/1] c]
]
check-expression: does [
    either attempt [(sort numbers) = (sort load form parse trim/all e: ask "Enter expression: " formula)] [
        either 24 = do load form explode e ["You got it!"]["Not quite correct"]
    ][
        "Invalid expression"
    ]
]
print ["Using the following numbers, enter an expression that equals 24:" numbers]
check-expression
```
```
Using the following numbers, enter an expression that equals 24: 8 7 4 6
>> check-expression
Enter expression: 8-7*4*6
== "You got it!"
>> check-expression
Enter expression: 8-7*(4*6)
== "You got it!"
>> check-expression
Enter expression: 4*6
== "Invalid expression"
>> check-expression
Enter expression: 2*2*2*3
== "Invalid expression"
```

[19:25:19](#JIiQu7wO0cH56_g0Jc9sJY8H3MFJBvgu62HF-PSUBjA) <toomasv>:
* OK, this follows Red order, but parens can be added:
```
numbers: collect [loop 4 [keep random 9]]
op: charset "*/+-"
n: charset form numbers
num: [keep n]
exp: [num some [op num]]
term: ["(" exp ")" | num]
formula: [collect [term any [op term]]]
explode: func [val][collect [forall val [keep val/1]]]
check-expression: does [
    either attempt [(sort numbers) = (sort load form parse trim/all e: ask "Enter expression: " formula)] [
        either 24 = do load form explode e ["You got it!"]["Not quite correct"]
    ][
        "Invalid expression"
    ]
]
print ["Using the following numbers, enter an expression that equals 24:" numbers]
check-expression
```
```
Using the following numbers, enter an expression that equals 24: 8 7 4 6
>> check-expression
Enter expression: 8-7*4*6
== "You got it!"
>> check-expression
Enter expression: 8-7*(4*6)
== "You got it!"
>> check-expression
Enter expression: 4*6
== "Invalid expression"
>> check-expression
Enter expression: 2*2*2*3
== "Invalid expression"
```

[19:27:54](#fTuqWOiIvC6avKYKi4AtiLCwt3mo8cnJDOX0H854sYI) <toomasv>:
* OK, this follows Red order, but parens can be added:
```
numbers: collect [loop 4 [keep random 9]]
op: charset "*/+-"
n: charset form numbers
num: [keep n]
exp: [num some [op num]]
term: ["(" exp ")" | num]
formula: [collect [term any [op term]]]
explode: func [val][collect [forall val [keep val/1]]]
check-expression: does [
    either attempt [(sort numbers) = (sort load form parse trim/all e: ask "Enter expression: " formula)] [
        either 24 = do load form explode e ["You got it!"]["Not quite correct"]
    ][
        "Invalid expression"
    ]
]
print ["Using the following numbers, enter an expression that equals 24:" numbers]
check-expression
```
```
Using the following numbers, enter an expression that equals 24: 8 7 4 6
>> check-expression
Enter expression: 8-7*4*6
== "You got it!"
>> check-expression
Enter expression: (8-7)*4*6
== "You got it!"
>> check-expression
Enter expression: 4*6
== "Invalid expression"
>> check-expression
Enter expression: 2*2*2*3
== "Invalid expression"
```

[19:55:47](#GqBZ72232PRjqr99YIW6Y0VLc3hpu6Cptqe0N31CNYM) <gltewalt (Greg T)>:
@toomasv "enter an arithmetic expression using just those, and all of those four digits, used exactly once each"

[20:13:24](#oqY4StBbgO9wVLFb1f1TLJlqLWdeSZN5YpDNKjAZl0E) <gltewalt (Greg T)>:
Yeah, I guess that's it.
```
op: charset "*/+-"
num: [keep n]
exp: [num some [op num]]
term: ["(" exp ")" | num]
formula: [collect [term any [op term]]]

explode: func [val][
    extract/into val 1 c: copy []
]

check-expression: does [
    if "q" = e: ask "Enter expression: " [halt]
    either parse trim/all e formula [
        either 24 = math load form explode e [print "You got it!"][print "Not quite correct"]
    ][
        print "Invalid expression"
    ]
]

main: does [
    numbers: collect [loop 4 [keep random 9]]
    n: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24 (pdmas):" numbers]
    check-expression
]

forever [main]
```

[20:15:36](#AvlRaEDput3LdeFenuNiWeIyd_QLPja_Pfhkl7VSOvU) <gltewalt (Greg T)>:
Contrast with an entry that is already on rosetta.
https://rosettacode.org/wiki/24_game#Red

[20:17:57](#S27LN8cn5PVCDvikDRYzBs9X4pSs8XrPmecY6oBZVlM) <gltewalt (Greg T)>:
Is there an "Easier  to read to the non Red user" grammar for handling parens?

[20:22:00](#nYj2cyqCzk2gU25CgWJPKVfGlAnYDaHNF_pzfJkuMHw) <gltewalt (Greg T)>:
Example without parens: [num op num op num op num] should be understandable to anybody 

## 19-Jan-2022

[1:37:56](#7e-psLDJd55R9O-ZMO86iWBK_yqlt-gncNkr89eKMpU) <gltewalt (Greg T)>:
@toomasv  If collect is used, then an entry like "goodbye" will error.  parse returns empty block if collect fails, instead of false

[3:00:55](#58mHB7qBH_tJVYDsZDlb8I29AffFwiahnAjPJ1dmNKw) <gltewalt (Greg T)>:
Can I just ignore any "()"?

[6:01:05](#eXpnezjPlpeVl0W1TFfDIGzz1tbv089_scbBXu3Tx3I) <toomasv>:
@gltewalt That's why I used `attempt`; and comparison - to ensure each number is used and only those numbers are used.

[15:30:33](#vYHU0xskG-6I8WpQOiBfXAVRCL4-MpDvIiCkW_WJQhg) <toomasv>:
Hmm.. actually to guarantee this `n` should be `charset "123456789"`.

[19:10:40](#zgeaq-yw_D7TzMyO9YNY3U4HaXODmUYGrNP5R3FRS2I) <gltewalt (Greg T)>:
To be bone-headedly declarative, this works.
```
numbers: collect [loop 4 [keep random 9]]
num: charset form numbers
op: charset "*/+-"
expr: [num some [op num] | num]
term: ["(" expr ")" | num]
p1: [term op term op term op term]  ; (7)*3+1-2
p2: [term op term op term]          ; (7*3)+1-2
p3: [term op term]                  ; 7*(3+1-2)
p4: [term]                          ; (7*3+1-2)

valid-expression: [p1 | p2 | p3 | p4]
```

[19:11:34](#XXQYcArAmh_FsrJHUfBap-hud72ya7eOoc7g9DDgY8k) <gltewalt (Greg T)>:
or could call it `level1`, `level2`, etc

[19:11:47](#o_3Qij7GUjhr3Fj5t3i2OP8PrimJit6ht7vJ7FC-kEg) <gltewalt (Greg T)>:
Not sure on the naming

[19:12:12](#Yr2ikNYfAV7P5BclNGsu-HcW1jNA_laExCF2L5n23nw) <gltewalt (Greg T)>:
```
>> numbers
== [7 2 7 2]

>> parse "7272" valid-expression
== false
>> parse "7+2+7+2" valid-expression
== true
>> parse "(7*2)+7+2" valid-expression
== true
>> parse "7*(2)+7+2" valid-expression
== true
>> parse "7*(2+7)+2" valid-expression
== true
>> parse "7*(2+7/2)" valid-expression
== true
>> parse "hello" valid-expression
== false
```

[19:31:14](#FpIgjv-iqeBIhtiPnHR19FO9u4oLYQ14B9Tz4nvmWws) <toomasv>:
```
>> valid-expression: [p1 | p2 | p3 | p4]
== [p1 | p2 | p3 | p4]
>> parse "7+2+7+2" valid-expression
== true
>> parse "7+7+7+2" valid-expression
== true
>> parse "2+2+2+2" valid-expression
== true
```

[19:31:27](#uYiz9no6-M7JlPIn1LYDeumMc1iPLt13a-KTq4YF77o) <toomasv>:
* ```
>> parse "7+2+7+2" valid-expression
== true
>> parse "7+7+7+2" valid-expression
== true
>> parse "2+2+2+2" valid-expression
== true
```

[19:35:28](#xvno0Z0fxz-QMFWq2pkG0mQL35CXnsQ7v9LZQ0TYK5Q) <toomasv>:
* ```
>> parse "7+2+7+2" valid-expression
== true
>> parse "7+7+7+2" valid-expression
== true
>> parse "2+2+2+2" valid-expression
== true
>> parse "2+2" valid-expression
== true
>> parse "2" valid-expression
== true
>> parse "7" valid-expression
== true
>> parse "(7)" valid-expression
== true
```

[19:45:32](#8nM7UErZMW3ItUSrwI1TZJgxsXw-M3lyzYoGcCE_uXw) <greggirwin (Gregg Irwin)>:
Bone-headedly declarative sounds like just my style. :^)

[20:10:48](#olGeh5aLyvgT_3JOBqM1utkXVQBjOMxUNpHG05WDBCM) <gltewalt (Greg T)>:
Curses

[20:14:18](#lxAbExO5gEiWhBV2l_3WvKMu2O4pMdPekdmQflwZKQk) <gltewalt (Greg T)>:
Wait.. no, it works when you generate the numbers. With my script:
```
Red [
    Title: "24 Game"
    Note: "Math precedence rules, PMDAS"
]

op: charset "*/+-"
expr: [num some [op num] | num]
term: ["(" expr ")" | num]

; naming? or recursive way?
p1: [term op term op term op term]  ; (7)*3+1-2
p2: [term op term op term]          ; (7*3)+1-2
p3: [term op term]                  ; 7*(3+1-2)
p4: [term]                          ; (7*3+1-2)
valid-expression: [p1 | p2 | p3 | p4]

explode: func [val][
    extract/into val 1 c: copy []
]

check-expression: does [
    if "q" = e: ask "Enter expression: " [halt]
    either parse trim/all e valid-expression [
        either 24 = math load form explode e [print "You got it!"][print "Not quite correct"]
    ][
        print "Invalid expression"
    ]
]

main: does [
    numbers: collect [loop 4 [keep random 9]]
    num: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24: (pmdas)" numbers]
    check-expression
]

forever [main]
```


[20:18:41](#lbNAIG22cB_EhO8XaGCVJtnGI-9tTY_-m6LBQR2TfVI) <gltewalt (Greg T)>:
The `; (7)*3+1-2` comments are just examples if the numbers generated were 7 3 1 2

[20:54:50](#UpFfN3vh5u-YNn5csxjchtbOS3tf1NB2uffXSRWkhkg) <gltewalt (Greg T)>:
I swear "works on my machine!"

## 20-Jan-2022

[4:10:14](#HFKkwKk_RAWy7RotsAIFT-s9r6krGJRFFHFDpvNl7sM) <gltewalt (Greg T)>:
Ok. This, as near as I can tell.


[4:10:25](#3ZAymN_BCymqwjhlXqOMxRQhaDstR2pR2r_1mIvYrPs) <gltewalt (Greg T)>:
```
op: charset "*/+-"
expr: [num some [op num] | num]
term: [num | "(" expr ")"]

p1: [term op term op term op term]  
p2: [term op term op term]          
p3: [term op term]                 
valid-expression: [p1 | p2 | p3]

explode: func [val][
    extract/into val 1 c: copy []
]

check-expression: does [
    if "q" = e: ask "Enter expression: " [halt]
    either parse trim/all e valid-expression [
        either 24 = m: math to-block form explode e [
            print ["You got it!" m]
        ][
            print ["Not quite correct. That's" m]]
    ][
        print "Invalid expression"
    ]
]

main: does [
    numbers: collect [loop 4 [keep random 9]]
    num: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24: (pmdas)" numbers]
    check-expression
]

forever [main]
```


[4:11:29](#wHRltbjM6B4tYmIhXzCg_cygbgFZg-_gSnUruM2-udk) <gltewalt (Greg T)>:
Bug with `math` and `load form explode `, so switched to `to-block`

[4:13:37](#8-VX5gUjPUBeXTWU4eslxfLq-N8ueDVIzx9j5doanRo) <gltewalt (Greg T)>:
My flaw /bug.  

[6:17:28](#NoiH-o6gH4qoRO_oxb8dsQGILa9cu0XPCiQJ8dow5SE) <toomasv>:
But it accepts formulas with 2 and 3 nums too:
```
Using the following numbers, enter an expression that equals 24: (pmdas) 8 7 4 6
Enter expression: 4*6
You got it! 24
```

[6:18:07](#4GqupZ8leT_1PDDL8gtF4Jm8d2tpCs1Yxvq66h5K8y4) <toomasv>:
* But it accepts formulas with 2 and 3 numbers too:
```
Using the following numbers, enter an expression that equals 24: (pmdas) 8 7 4 6
Enter expression: 4*6
You got it! 24
```

[7:07:14](#ws0V6tJST0pVOq7JPHguKF4L9QNHPkGR05tXORM9b88) <gltewalt (Greg T)>:
Yep

[7:14:26](#KoP73YKS8iw_LJ-3k4Q3x0KJiKTW2tLlJfzLcVBcapk) <gltewalt (Greg T)>:
What I really want is:
 `[num op num op num op num]`, and "ignore any balanced paren along the way". 
`math` will take care of obeying the parens.

[9:00:14](#gX9r-5AXK3bqIUN5Bx5d-ko5cMdLGwHnUa3BgtDBeeA) <toomasv>:
Then probably the easiest you can do is, well, to ignore the parens in formula, e.g.:
```
term: [opt "(" num opt ")"]
valid-expression: [term op term op term op term]
```

[10:12:38](#IaOKl5tzB5S_ZYH5sU_pT3-3n5NMcIlBWGlEcxbOzH8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
But it will allow unbalanced parens.

[10:29:23](#ZHuuuJuo1RWbpE754C6ZsUO3r84rqybOQys6fd9UFGc) <toomasv>:
Yes, unbalanced parens will generate error.

[10:29:53](#PkNAUSUxNGDSOJkZRwilIn_dxYYD0xMJHAtf3sKZPa8) <toomasv>:
* Yes, and unbalanced parens will generate error.

[10:31:30](#F8gK6xEnBYsSmar4SD2YL7xAwMyLg8MQ8i2qgzgGv2o) <toomasv>:
* Yes, and unbalanced parens will generate error. (Personally I would prefer to collect numbers from balaced expressions as shown above)

[18:37:08](#zf_vIEmguAgB5qFakAGeaYvFczlE35sJb9xu9uWsvKQ) <gltewalt (Greg T)>:
I dontt want to. And im a stubborn jerk

## 21-Jan-2022

[18:40:21](#YxRm4ih7ZKYp_VsIfxS7v_PI8c-h6bVDgrEESaV2Wuo) <gltewalt (Greg T)>:
Error on unbalanced paren can be handled when calling `check-expression`

[18:40:42](#8Z0u6EQ0-UDA2atcAEygIppDncW4OfKYdqoYg7hNSA4) <gltewalt (Greg T)>:
```
main: does [
    numbers: collect [loop 4 [keep random 9]]
    num: charset form numbers
    print [newline "Using the following numbers, enter an expression that equals 24: (pmdas)" numbers]
    if none? attempt [check-expression][print "Invalid expression"]
]
```


## 8-Feb-2022

[22:38:39](#vIzs6W85ot7AyqpWhG_fevOa3oKqpGACvbMlYL3CUmg) <mikeyaunish>:

I don't know why this only works with the parens "()" 
in the middle of the parse. The result I am looking 
for is: ```[btn: button]``` which the parse gives 
correctly. Just don't like leaving the parens as a loose
end.
 
```
res: parse [style btn: button "hello" 120x24] [
    collect any [
        'style 
            some [
                some [ ahead () keep set-word! ] | ;-- needs () to work??
                some [ ahead keep word! ]
            ]
        | skip 
    ]
]
? res
RES is a block! value.  length: 2  [btn: button]
```

[22:42:37](#hENKS5HiU4ioejt0InMQBeh9n6nypNBZdwBadLNg_Ps) <greggirwin (Gregg Irwin)>:
Will this work for you @mikeyaunish?
```
res: parse [style btn: button "hello" 120x24] [
    collect any [
        'style 
;            some [
                keep some set-word! 
		| keep some word!
;            ]
        | skip 
    ]
]
? res
```

[22:44:15](#VVaViSgVjJKQhuJLzvbhXnDAD5QCSpcw4Ca7XtBvkD8) <greggirwin (Gregg Irwin)>:
* Will this work for you @mikeyaunish?
```
res: parse [style btn: button "hello" 120x24] [
	collect any [
		'style 
;		some [
		keep some set-word! 
		| keep some word!
;		]
		| skip 
	]
]
? res

```

[22:44:33](#3AGeURwzmt9OqUP8JMLNF0Ceo68kiTKWJa2Xn6Xd4Cs) <greggirwin (Gregg Irwin)>:
Bah, gitter formatting. :^\

[22:45:01](#qOZrwNm4CXwobcCpICSggu5LyOGQGfIa4f4DE2iBN54) <hiiamboris (NOT THIS ONE)>:
I don't see any difference with or without `ahead ()`

[22:46:07](#Bo50MwxaeGcAWRSdp2ALyyy0vHmEYVI9GkAphuHw62I) <greggirwin (Gregg Irwin)>:
Nor I.

[23:02:12](#BKrdv55WCXz-76BCvWQSs2ZJUkEE30BMq-TTuDBYCbI) <mikeyaunish>:
@greggirwin  Thanks - can't seem to get the 'some idea clear in my head.

[23:17:21](#GukK--CCeOBIKra81rdVDLucodeEZG_XeCUh4zV7-xM) <mikeyaunish>:
@greggirwin  Thanks - can't seem to get the 'some idea clear in my head.

[23:19:19](#vzuPSml_uBxudo4SZEZRK_caE7KXf92YwcwdQxWVKIY) <mikeyaunish>:
* Gregg gave me a full solution. But just for clarity of problem  without parens the  ```res```  doesn't  include ```button```  like this: 
```res: parse [style btn: button "hello" 120x24] [
    collect any [
        'style 
            some [
                some [ ahead keep set-word! ] | ;-- needs () to work??
                some [ ahead keep word! ]
            ]
        | skip 
    ]
]
>> ? res
RES is a block! value.  length: 1  [btn:]```

## 9-Feb-2022

[4:11:01](#1FsIaSiQMLK2UZ1lgDmE9ruYDSDkH0wOweoC87ZUup8) <gltewalt (Greg T)>:
?
```
blk: [style b1: button "hello" 120x24 b2: button]
res: parse blk [collect [some [to set-word! keep thru word!]]]
```

[7:33:24](#UDdhzZsxX-T5hTqF5ubwPkgD_RXo3Azbj1jCZVQ7mWU) <toomasv>:
Rather:
```
res: parse blk [collect [any ['style [keep set-word! keep word!] | skip]]]
```

[7:34:15](#eF4Eb2CoDUaUPM5Q6LNW3ntrIUYyJc8m50Ypkmvqm3U) <toomasv>:
* Rather:
```
res: parse blk [collect [any ['style keep set-word! keep word! | skip]]]
```

[15:40:14](#a9r7DEzjd1mJEjK0HTzEkQ6Z_aNWrqDi_0_MnusSM18) <mikeyaunish>:
@toomasv  Yes - that is what I was looking for. I like it. Much simpler. Thanks

[15:56:43](#bfuz8ycV86yyaAy7loVVAJw6GsZxz-5cN8ALfnIV5RQ) <toomasv>:
@mikeyaunish You are welcome!

[20:14:55](#dDUw-ENcPMbkE8DydzPCZUhcVe1XfTw1EijqNLyMVEA) <greggirwin (Gregg Irwin)>:
That's where I didn't know if you wanted to collect multiple, potential set-words and words, so I erred on the side of closest to your original @mikeyaunish. 

Thanks @toomasv. Sometimes showing the simplest thing is best.

[20:19:07](#lfcj4nwEeUsYaHtJPmxBVN386TmLQfhyCQ6OAnzAuXs) <toomasv>:
:)

[21:38:20](#vRi1xK5tV4pdPhfl4UQ9PyQfzJcORyjAbCcIci4wnKQ) <gltewalt (Greg T)>:
Yeah, that will only grab one `btn: button` if that's what you wanted. 

[21:38:41](#jQdwOlx7Q5y6fei1SEdnnKHhrrpRcAoKSlph-8OcpHk) <gltewalt (Greg T)>:
Is `skip` needed when `any` or `some` is used?

[21:40:07](#_TmWbSAi3lqwkRrjdF8kguoAlTL6kMTQYaI2SRUlHLY) <gltewalt (Greg T)>:
And if there is always going to be a `sw: button`, then should it be `some`?

## 10-Feb-2022

[5:42:37](#blJih3YNoWd1omiX0ryc70Hm-gBNEhSM6yyO6gfrqWU) <toomasv>:
Intention seems to be to collect all new style words together with original styles. 

Yes, `skip` is needed, otherwise it may never reach `style` (in general case), or reach next `style` somewhere later.

Not much difference between `any` and `some` in this case.

## 12-Feb-2022

[23:44:39](#m64RFjOIClnYf-1Alt08QQs0ty4YZ6mmQjd45AbJBXM) <GiuseppeChillemi (GiuseppeChillemi)>:
I definitively need `SET-IN obj 'word` in parse... this would save me lot of code in parens and also using temporary words.

[23:45:07](#k_ssdKciPoyOWcsGlE_H5MOJLux4BTjWnqr6Py6drvM) <GiuseppeChillemi (GiuseppeChillemi)>:
* I definitively need `SET-IN obj 'word` in parse to write values in objects... this would save me lot of code in parens and also using temporary words.

## 13-Feb-2022

[8:41:32](#3LQ0YIsD9B7s-GuiIEZasIgid2ogCWsmkw0r792pThI) <hiiamboris (NOT THIS ONE)>:
Write your parse preprocessor macro. Turn set-paths into parens.

[10:29:51](#a-yNcM52zEJ_fP95pmvWuHWMzGFVQn048iavptSYQnM) <GiuseppeChillemi (GiuseppeChillemi)>:
Good but I think it should be included in the language as `SET-IN`, it is an important feature when you work initializing objects with parse.

[10:44:28](#1w83P1QxkyLv4aAlH6MlsAF0Fkc95JSh9OQtMDkxlDc) <hiiamboris (NOT THIS ONE)>:
Make a REP.

[12:13:32](#JkknWKR_M3P2u448AswORbZk4oPJtc9vz0rNdyhVHYE) <hiiamboris (NOT THIS ONE)>:
You reduce your chances IMO by opening it in the wrong place

[14:08:47](#aJMMTikrnf_wLG7pNaR1KfygMiAdsJoBupql6MD7tBk) <GiuseppeChillemi (GiuseppeChillemi)>:
Where is the right place?

[14:33:50](#g3vj92WTicEEwpCjNYbPaUoK76j7WsMw4IpLkQj1680) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/REP/issues

[14:52:53](#wST7NDuO6KnHu1KmWLnki0Zdecg5avA_FIbp4_tHQ34) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you, I always forget about this

## 17-Mar-2022

[23:05:20](#uV0C454kr_X-lOhGHfv1O13T95JvEmx0alygofdaFj4) <GiuseppeChillemi (GiuseppeChillemi)>:
Hi, I have a binary file and I need to parse it in search of multiple `0x01` + `KEYWORD` sequences ending with `0x17`. In the middle there is a string I want to change.

Here is an example:

```
BINARY-DATA
0X01 "NAME:" "<PRODUCT-NAME>" 0x17
0X01 "BATCH:" "<BATCH STRING NUMBER>" 0x17
0X01 "EXPIRE:" "<EXPIRE STRING DATE >" 0x17
BINARY-DATA
```

In the first string, the word "NAME:" should be deleted and only "<PRODUCT-NAME>" will remain and be changed with the target string.

How could I parse this binary file and write it back?

## 18-Mar-2022

[1:52:17](#pZnqsvmn9yySh6xY2H6lESwsGXnPJVDPolGBOZwzmhs) <cloutiy (yc)>:
Are the words BINARY-DATA part of the text to parse, or you simply included to specify what follows is binary data?

[10:50:28](#w1cS339bpotnCpin6XzP791Oes2Ejdgh7SQah9avNKI) <GiuseppeChillemi (GiuseppeChillemi)>:
I have included them to specify that what is before and what is after text is binary data 

[10:52:51](#5bgoetZP2PLW5TL7rIpoEhiG6LeFqbSYrQkitpdnPsY) <GiuseppeChillemi (GiuseppeChillemi)>:
I have also separated strings but they are joined

[22:11:57](#15hd87IVCPPb_l1OKQgOsL40Wn2fSH8IBG_b1IgYVAo) <hiiamboris (NOT THIS ONE)>:
parse works on binary!, so what's stopping you exactly?

[23:35:39](#ZECPkuxsQcfNwh2fs6Sy61lHMryY7wX-J8CBsiPwNe4) <GiuseppeChillemi (GiuseppeChillemi)>:
@hiiamboris How could I match a string like "Hello" on binary?

## 19-Mar-2022

[4:20:04](#7_p98wOyK94JXCyfun-RJaaW3IJTjGLKvupfxJBVYXo) <toomasv>:
@GiuseppeChillemi 
```
parse to-binary "Hello Giuseppe!" reduce ['thru to-binary "Hello" space quote s:] to-string s
== "Giuseppe!"
```

[4:21:24](#xvcOBib_-0czNK0odqLECyeki4iT-w0VEcdJig_ibxU) <toomasv>:
* @GiuseppeChillemi 
```
>> binary: to-binary "Hello Giuseppe!" 
== #{48656C6C6F20476975736570706521}
>> parse binary reduce ['thru to-binary "Hello" space quote s:] to-string s
== "Giuseppe!"
```

[4:22:41](#t-UoyyO_C-2h8GkPSJQ38nfFk7987K9JRJIfTtQjE00) <toomasv>:
* @GiuseppeChillemi 
```
>> binary: to-binary "Hello Giuseppe!" 
== #{48656C6C6F20476975736570706521}
>> parse binary reduce [to-binary "Hello" space quote s:] to-string s
== "Giuseppe!"
```

[4:27:14](#QUpXSGVr3uT_9jnyYUdPN1kZRK-IE0EcvyM4-X7aee0) <toomasv>:
* @GiuseppeChillemi 
```
>> binary: to-binary "Hello Giuseppe!" 
== #{48656C6C6F20476975736570706521}
>> parse binary reduce [to-binary "Hello" space quote s:] to-string s
== "Giuseppe!"
```

[4:38:43](#-cvm1-ffWMkXbDgOCnHoODKJfUEM2iInMJodSczJajc) <toomasv>:
But also:
```
>> parse binary ["Hello" space s:] to-string s
== "Giuseppe!"
```

[14:05:43](#TXefMxcqfoUv9AzJ5cjBpqK361djlwCsEYyMi0KcR1k) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you, so parsing a binary searching for a string, you have implicit conversion.

[14:05:58](#5r_PVQFeBEhlTYS9uyeOdVzi1B_7bHOqXTmBcucsfrc) <GiuseppeChillemi (GiuseppeChillemi)>:
* Thank you, so parsing a binary searching for a string, you have implicit conversion of the string to binary.

## 24-Mar-2022

[6:36:37](#5TfUYCCodZ2L3jaUs91uiJ-fLJ8z4sIcYS8RJ7_bdrI) <GiuseppeChillemi (GiuseppeChillemi)>:
How could I match a datatype word?  I mean: how could I match `string!`

[6:37:24](#V4LhTpA2uIdoTzuwzwW7huQFdqri8gu5eyosrN-fmCk) <GiuseppeChillemi (GiuseppeChillemi)>:
* How could I match one or some datatype words?  I mean: how could I match `string!` or `string!` and `block!`

[7:15:48](#0Xm_3IVJgru0Evvr2VU4n9ZQaLozLAQBvwwpabX9yx8) <GiuseppeChillemi (GiuseppeChillemi)>:
Another question: why this fails?
 parse [integer! string!] [some datatype! end]

[7:15:59](#oXKVdLQofM6ztKVS8xuHIPzTPCHQ8AxZ-sHPZKSVWWY) <GiuseppeChillemi (GiuseppeChillemi)>:
* Another question: why this fails?
 `parse [integer! string!] [some datatype! end]`

[7:21:01](#7trIZKam1ksvoHWVSEOf9BRoj0c9zggyVUFNrKJZn3c) <rebolek (Boleslav B≈ôezovsk√Ω)>:
because they are words

[7:21:53](#X0YbHdV6DZUHMFiJRiUjRpdBrdgpTPCslTHgeqqpbMc) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`parse reduce [integer! string!] [some datatype! end]`

[10:59:19](#Yf37EkpWtpiN9AK07nY4BQ8CRVhfs_6P_mnflMPNuUg) <hiiamboris (NOT THIS ONE)>:
if you want datatype words, you should `get` them and check for datatype or typeset value

## 18-Apr-2022

[16:36:48](#mdQTZJ-YzQM7ergYCzSxCfR660Sgz5J3CQNhjJGP6fw) <bubnenkoff (Dmitry Bubnenkov)>:
How to measure speed of parsing file of follow code:
```
parse file-content [ 
   some [ 
         tag (save-parent tag-name) | ahead chars copy tag-value to "<" ( do-operation-on-tags-tree-with-value tag-value ) | to  "<" 
      ] 
   ]
]
```
It's seems that code slow down on big file

[16:52:34](#2lVpX-XSyfg12IocKg6QYbKMcvbkkbsQgZxGO-WWXww) <hiiamboris (NOT THIS ONE)>:
Don't use `to`, use `skip`

[16:55:22](#OcHvZX2OIij0F2yVs4x1c2IeX-zfYSHH_CvVKKlqBec) <hiiamboris (NOT THIS ONE)>:
If you want to profile it, you will have to do it manually. E.g. measure time of each `some` iteration and see if there's something suspicious.

[16:57:25](#0R1QDkZES8Od07cr8OO2sZDs6szJOo7P7Xj25m37ZlI) <bubnenkoff (Dmitry Bubnenkov)>:
> Don't use `to`, use `skip`

Why? Because I can jump in wrong place?

[16:58:13](#NFouOblGgxvFFkSXLdC0irV-AZB2WCjHey3QMU9inhQ) <hiiamboris (NOT THIS ONE)>:
`to` backtracks if it fails, which in worst case leads to time complexity ~ file-size^2

[16:58:39](#-PO7DiZiaM2IMtqep1NBdzh2x7o6igslEk0DIwKmaGY) <hiiamboris (NOT THIS ONE)>:
I'm not sure if this is what happens as I don't see your rules, but it's something to be careful with.

[16:58:49](#Bw_BNiur26p5aDltGWH197ivHbvUUspYpH3uWSJ45LM) <bubnenkoff (Dmitry Bubnenkov)>:
> If you want to profile it, you will have to do it manually. E.g. measure time of each `some` iteration and see if there's something suspicious.

How to do it? I remember about `time-it`, but how to wrap `some` with it?

[16:59:49](#HFbt6y1qa95T47r11PoQSPi89aO010koP9JGrz5xmcg) <hiiamboris (NOT THIS ONE)>:
You can't wrap a parse rule. Just use `now/precise` when you enter `some` to get the time and subtract from the previous result.

[16:59:58](#gpNDa9YBoeg1bNiiLEhiCFlVffBoXZq7022b_BRX_Fg) <hiiamboris (NOT THIS ONE)>:
* You can't wrap a parse rule. Just use `now/precise` when you enter `some` to get the time and subtract the previous result from it.

[17:01:36](#T0JboF-Xi1cOpkfFGzKFxeMIGN_6qAOlKOKNMqOSwR4) <hiiamboris (NOT THIS ONE)>:
If you suspect it's not the parse but your functions that are slow, I have a handy profiler here: https://codeberg.org/hiiamboris/red-common/src/branch/master/profiling.red

[17:02:36](#_vpFJH7KGnYcznMM5cN59Ap4-H4YzrgK5j2qVZlpN9E) <bubnenkoff (Dmitry Bubnenkov)>:
I looked at this chat but did not found examples of time subtraction

[17:03:04](#6TigMRYIwaz1N0ADjgjvnJpxV9HLVk9laitV0h1iZIE) <hiiamboris (NOT THIS ONE)>:
* If you suspect it's not the parse but your functions that are slow, I have a handy profiler here: https://codeberg.org/hiiamboris/red-common/src/branch/master/profiling.red

Picture here: ![](https://user-content.gitter-static.net/0160e0439d234733f5fd1e9100ccc49d1642bd5e/68747470733a2f2f692e6779617a6f2e636f6d2f37303630356564393636616234663564646237323031396235623830633066372e676966)

[17:03:16](#QNceNOZU7THwen4nMarT050QY7FLAsZZ7j0nfbn-s78) <hiiamboris (NOT THIS ONE)>:
* If you suspect it's not the parse but your functions that are slow, I have a handy profiler here: https://codeberg.org/hiiamboris/red-common/src/branch/master/profiling.red

Picture [here](https://user-content.gitter-static.net/0160e0439d234733f5fd1e9100ccc49d1642bd5e/68747470733a2f2f692e6779617a6f2e636f6d2f37303630356564393636616234663564646237323031396235623830633066372e676966)

[17:03:21](#QrwkT2mExxuoaY7ig4jOQyrI3ysbMXGJYZL5Wqr5tz8) <bubnenkoff (Dmitry Bubnenkov)>:
```
>> t1: now/precise
== 18-Apr-2022/20:02:50.7804+03:00
>> 
>> 
>> t2: now/precise
== 18-Apr-2022/20:02:54.1006+03:00
>> 
>> t1 - t2 
== 0
>> 
>> t2 - t1
== 0
```


[17:03:56](#v6799tcZrnvwgpyHzp9-8d3FWLD7pGPfwGzko_MUPdc) <hiiamboris (NOT THIS ONE)>:
```
>> s: now/precise/utc
== 18-Apr-2022/17:05:34.037
>> e: now/precise/utc
== 18-Apr-2022/17:05:35.7549
>> difference e s
== 0:00:01.71785
```

[17:04:11](#EOGV15Lqia4vyRAW_B1KLyFQFN93zJuZsR7i-KALz-0) <bubnenkoff (Dmitry Bubnenkov)>:
oh! thanks!

[17:04:45](#BtuJnTnY-zVvDOtG-Uymq7QzJSOQzuqNXaBAaw5wt9E) <hiiamboris (NOT THIS ONE)>:
`-` just returns number of days, which is handy for calendar stuff only

[17:04:59](#nXVmons5wYpCAYiHlpS1_ie_FnFtu3JHWIBK402b0CI) <hiiamboris (NOT THIS ONE)>:
even that is buggy

[17:20:30](#umc3GtaWqwK19MjxH09JIajza054c3uiHrxt_8Cf7pg) <bubnenkoff (Dmitry Bubnenkov)>:
Is it correct measuring?
```
some [ (s: now/precise) <my parsing rules>   (e: now/precise)] 
```
I am asking because I am measured all other functions with `time-it`, and they works fast, but result file is parsing slowly

[17:28:31](#IGavm-wRVIGQhgawzrXT9AIAg_i45lkXkmo9MxUOhH4) <hiiamboris (NOT THIS ONE)>:
it should be correct if you wrap `<my parsing rules>` in a block

## 2-Jun-2022

[12:29:03](#jI4ASVlRXoEICuSKKw7QTg3gTxYGjogdkDEEojt_G5Q) <bubnenkoff (Dmitry Bubnenkov)>:
it should be correct if you wrap `<my parsing rules>` in a block

[12:30:42](#EqV9oL4deBpTpauPaFUMvFji9Uuv-pnOQqaR0sblk0w) <bubnenkoff (Dmitry Bubnenkov)>:
* I am stuck with extracting of attrs:
```
inner-items: copy []
parse  {ABC="2120280 502912" date="2012-09-26"} [ ; or can be: {ABC="2120280 502912" date=123}
		; some [ copy inner-item thru [{" } | sp | end ] (append inner-items trim inner-item)  ]
		some [ copy inner-item to {" } {" } (probe inner-item)  ] 
	]

probe inner-item	
```
How to create rule that will ignore spaces in single attribute?

[12:35:54](#RPdsiyBY67vO3bsbkXwl02lO2oE3s_z_mChW25rac1o) <bubnenkoff (Dmitry Bubnenkov)>:
* I am stuck with extracting of attrs:
```
inner-items: copy []
parse  {ABC="2120280 502912" date="2012-09-26"} [ ; or can be: {ABC="2120280 502912" date=123}
		; some [ copy inner-item thru [{" } | sp | end ] (append inner-items trim inner-item)  ]
                 some [ copy inner-item to ahead {" } {"}  (probe inner-item)  ]  ; look like ahead is good here
	]

probe inner-item	
```
How to create rule that will ignore spaces in single attribute?

[12:40:01](#aZkQg6NR5hXWIdKMhpwOLKxEXpsmsuJgf6_gGa2CXi8) <bubnenkoff (Dmitry Bubnenkov)>:
* I am stuck with extracting of attrs:
```
inner-items: copy []
parse  {ABC="2120280 502912" date="2012-09-26"} [ ; or can be: {ABC="2120280 502912" date=123}
		; some [ copy inner-item thru [{" } | sp | end ] (append inner-items trim inner-item)  ]
                 some [ copy inner-item to ahead {" } {"}  (probe inner-item)  ]  ; look like ahead is good here
	]

probe inner-item	
```
How to create rule that will ignore spaces in single attribute?

## 10-Jun-2022

[10:03:04](#3Dgd6E4k72ZsSf8UzPGIF3bE6HRSeXfFAkQId9OX3lw) <bubnenkoff (Dmitry Bubnenkov)>:
I need to remove namespaces from tag. I wrote rule, but it's stuck on last tag that have `:` inside attribute:
```
list: [ 
	{<ns1:foo bar="123" baz="2002-02-26" region="En">} 
	{<ns1:foo bar="123" baz="2002-02-26" region="En"/>} 
	{<foo bar="123" baz="2002-02-26" region="En"/>} 
	{<ns1:foo>} 
	{<foo x=1>} 
	{<foo x=2/>} 
	{<ns1:foo/>} 
	{<ns1:foo bar="123" baz="2002-02-26" region="En" baz="66:77">} 
	{<foo bar="123" baz="2002-02-26" region="En" baz="66:77">} 

]

foreach tag-name list [
	only-tag-name: rejoin parse tag-name [ collect [ keep "<"  opt [thru ":"] keep to end ]  ]
	probe only-tag-name
]
```


[14:30:03](#rXUbbPr5Kze4BiZJmk_qa1NwfVrDhLCC8Q1lwGat9W0) <toomasv>:
I sthat good enough?:
```
foreach tag-name list [
    	starting?: yes
        only-tag-name: rejoin parse tag-name [ collect [keep "<" s: any [sp (starting?: no) Ì†ΩÌ∏ñ keep to end | if (starting?) ":" keep to end | skip]]]
        probe only-tag-name
]
{<foo bar="123" baz="2002-02-26" region="En">}
{<foo bar="123" baz="2002-02-26" region="En"/>}
{<foo bar="123" baz="2002-02-26" region="En"/>}
"<foo>"
"<foo x=1>"
"<foo x=2/>"
"<foo/>"
{<foo bar="123" baz="2002-02-26" region="En" baz="66:77">}
{<foo bar="123" baz="2002-02-26" region="En" baz="66:77">}
```

[14:31:36](#5N_vzCT0Xau5jUx1uhHXBzTY99bV08YOWL-4uqP_CMk) <toomasv>:
* Is that good enough?:
```
foreach tag-name list [
    	starting?: yes
        only-tag-name: rejoin parse tag-name [ collect [keep "<" s: any [sp (starting?: no) :s keep to end | if (starting?) ":" keep to end | skip]]]
        probe only-tag-name
]
{<foo bar="123" baz="2002-02-26" region="En">}
{<foo bar="123" baz="2002-02-26" region="En"/>}
{<foo bar="123" baz="2002-02-26" region="En"/>}
"<foo>"
"<foo x=1>"
"<foo x=2/>"
"<foo/>"
{<foo bar="123" baz="2002-02-26" region="En" baz="66:77">}
{<foo bar="123" baz="2002-02-26" region="En" baz="66:77">}
```

[15:12:45](#3j-r3SQtuSVkm-7PWZr8BLc9X32tCgRtgKixCkAQ8xg) <bubnenkoff (Dmitry Bubnenkov)>:
Yes! Thanks! Perfect!

[16:48:46](#An7_l7qOuhzck-0oR4Mw9d4-VIorheTJhvyw14RI7NE) <toomasv>:
:+1: 

## 23-Jun-2022

[21:45:39](#0_mxlx43wZgkNVfN-IuBZCGBpdPNtUCANWta2y1MF8Y) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Is there any reason, why not to allow `parse "a" [any [| #"a"]]` return `true` as it does for `parse "a" [any [#"a"]]`?

[21:46:37](#KpKtMbBwJzcdn7GSMor-XizNVH7OAS9SQrCWxM8NhnY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
My request is simply from esthetical reasons to be able have code like:
```
parse "a" [
	any [
	| #"a"
	| #"b"
	]
]
```

[21:47:00](#kB9zog55Yz9WKSPrcGcWunMXV6iuxar3I3bF15dUbmk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Now I must have:
```
parse "a" [
	any [
	  #"a"
	| #"b"
	]
]
```

[21:51:23](#bd45gHgLDDZZqWvJ1ZfO0fcmeIqdM-VyBpwRlVi02bI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Possible reason is, that there would have to be another condition in the code, so it would slow down evaluation Ì†ΩÌ∏ï

[21:59:24](#RbTOAifL9QqhwKv5hpZr_HRA-rpnIJAVOicnHj_MnVg) <hiiamboris (NOT THIS ONE)>:
Alan wants this too

[23:14:08](#6jl8yNu_K8Rzlo2LZK4FMI1L9po9XHFG7j_K5b9hv8c) <greggirwin (Gregg Irwin)>:
I've certainly had plenty of OCD formatting moments with rules through the years, especially with Red favoring tabs for indentation. But if you look at your first, single-line example: `parse "a" [any [| #"a"]]` to me that looks like something is missing. I think the other chat might be in red/bugs, but my thought in this moment is that it will lead to rules that are harder to reason about.

[23:19:29](#a1u5UIy-FhagKacRM2rYBK6HQp0pJjFjQuRrn0lwUYs) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Yes.. I think it is better how it is now.

## 24-Jun-2022

[0:03:08](#VGa45NEYA6lh45VimCc0wjWnwcWRu4uXijvWCd2I2Bg) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, I see something missing too.

## 28-Jun-2022

[16:24:28](#LNyaW_KXpL4ZHL99jcCofj73Ca19fQpe6XrLF--h9Xk) <henrikmk (Henrik Mikael Kristensen)>:
I have always done this:

```
parse "a" [
    any [
      #"a"
      | #"b"
    ]
]
```

## 21-Jul-2022

[14:34:51](#4V1Pj-xCqkNNLnvX5kuM0pLOP5MIJ9jA1DDMAIy3dLQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I'm really not sure, if I like this:
```
>> parse [1] [collect any [keep some integer! | skip]]
== [1]
>> parse [1 1] [collect any [keep any integer! | skip]]
== [[1 1]]
```

[14:35:10](#LF1LXUk2wG3rNfwbpiua6qWB0AqE1dlC5Tvo5XPg7IE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* I'm really not sure, if I like this:
```
>> parse [1] [collect any [keep some integer! | skip]]
== [1]
>> parse [1 1] [collect any [keep any integer! | skip]]
== [[1 1]] ;=== why not just [1 1]?
```

[14:36:45](#VGrXmqMmqVzKIqQgPyFBoSqOLTDhXpUjyXpIcNLliow) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And just use `collect collect` to have `[[1 1]]`?

[14:40:13](#JYKcXodCRrzNVDGgklFvBcgYcg2MxSyieLBYtorALLE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Hm.. ok... it must be block... to support:
```
>> parse [1 "a" 2 2 "b" 3] [collect any [keep some integer! | skip]]
== [1 [2 2] 3]
```

[14:46:39](#kWvll37PPrB4gyEl8OtuDDbZ1i7e3n0wSRS6LylQGcg) <toomasv>:
```
>> parse [1 1] [collect any [keep pick any integer! | skip]]
== [1 1]
```

[14:48:08](#Xga2WAP3p8g6tocE0Znr2dniiMXkTLwj607UW2ZnjlI) <toomasv>:
```
>> parse [1 "a" 2 2 "b" 3] [collect any [keep pick some integer! | skip]]
== [1 2 2 3]
```

[14:48:41](#E4xmykYmz7loBCyxyRgtB2ce2OQXKYW0XAj3FnEz-xo) <toomasv>:
* @Oldes
```
>> parse [1 1] [collect any [keep pick any integer! | skip]]
== [1 1]
```

[15:05:03](#OaQARPlit1wpNNEOum9liYLfKdLXT6aCZ3ZcraIgrQ8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Ah... good. I was not aware about `pick`.  Is it supposed to work only with `keep`? If so, should not be this an error:
```
>> parse [1 1] [any [pick | skip]]
== true
```

[15:14:21](#ieTEaCCS-xTocScOetfuwkJWWBXzclqvLrktBahraA0) <toomasv>:
It probably should, yes. `pick` is mentioned in [docs](https://github.com/red/docs/blob/master/en/parse.adoc#393-collect).

[16:30:02](#MUB2dGTl96wuINcLdHe0vfl-g6xbltbZpccL1BBuKfI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
But this is strange:
```
>> parse [1 2 3][collect keep integer! collect keep integer! collect keep integer!]
== [1 [2] [3]]
```

[16:31:04](#uQ3-yxN7F7PiRwne-lshIlsvCGIIFJzXgFqP1o43P3w) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* But this is strange:
```
>> parse [1 2 3][collect keep integer! collect keep integer! collect keep integer!]
== [1 [2] [3]] ;<-- it would be more logical to have it [[1] [2] [3]]
```

[16:35:22](#Z9BBMVmzs1EonF-bJec6iMpG4VLMxzxsaZOFskSMhKA) <hiiamboris (NOT THIS ONE)>:
you're missing the outer `collect`

[16:36:22](#9Y5NwXYR2h281HwZzoasN8VA7crVXJogexwGn0f4kLg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I know, but should it be handled by error, or silently adding the outer block?

[16:36:35](#C75-zuGUZXnFpuiiT04zBb7JbB5k5VBxiVzMv2FsoDk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* I know, but should not it be handled by error, or silently adding the outer block?

[16:37:08](#dvhU9rosSodiPOC7__sWKqXDMzyxOtoS3_mZiLmFGq8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* I know, but should not it be handled by error, or silently by adding the outer block, instead of using the first collect's block for the rest?

[16:37:16](#PP8tIBA9pBEclJTwSMrq__BfufeOrSo6fkJL3YWiISI) <hiiamboris (NOT THIS ONE)>:
I would prefer an error

[16:37:26](#yzTdg-57Kb_ZdIePN7s6-4UkJXt0-S9ChBbMfcgdMmM) <hiiamboris (NOT THIS ONE)>:
asked this question myself some years ago

[16:40:22](#OOcelNAi6oxBEewVS-ftja7ARqkqzmZzuAi4eukLCII) <hiiamboris (NOT THIS ONE)>:
would you like to open an issue for team's review? I don't think one exists

## 22-Jul-2022

[6:02:24](#ZU61Fm_dSfAfJWi-Xt8GNnQ4YK_HOzlkM7vke927CJY) <toomasv>:
I don't understand, why it should be error! If first `collect` creates collection block, then it is only logical for all the rest to fall into this block. If you write it up with explicit block it is very clear:
```
parse [1 2 3][collect [keep integer! collect keep integer! collect keep integer!]]
```
If you want first integer to be in separate block too, add another `collect`
```
>> parse [1 2 3][collect [collect keep integer! collect keep integer! collect keep integer!]]
== [[1] [2] [3]]
```
or use `copy`:
```
>> parse [1 2 3][collect [keep copy _ integer! keep copy _ integer! keep copy _ integer!]]
== [[1] [2] [3]]
```

[6:05:50](#-iT_LGyx0id9JaBWYuwJy00ns7yyR8nxuCAL958uwLk) <toomasv>:
* I don't understand, why it should be error! If first `collect` creates collection block, then it is only logical for all the rest to fall into this block. If you write it up with explicit block it is very clear:
```
parse [1 2 3][collect [keep integer! collect keep integer! collect keep integer!]]
```
If you want first integer to be in separate block too, add another `collect`
```
>> parse [1 2 3][collect [collect keep integer! collect keep integer! collect keep integer!]]
== [[1] [2] [3]]
```
or use `copy`:
```
>> parse [1 2 3][collect [3 keep copy _ integer!]]
== [[1] [2] [3]]
```

[6:06:48](#nOlLHndQY5-wPgfMwsTIMAdKwhQ-pcAsKVX9irDiGd8) <toomasv>:
* I don't understand, why it should be error! If first `collect` creates collection block, then it is only logical for all the rest to fall into this block. If you write it up with explicit block it is very clear:
```
parse [1 2 3][collect [keep integer! collect keep integer! collect keep integer!]]
```
If you want first integer to be in separate block too, add another `collect`
```
>> parse [1 2 3][collect [3 collect keep integer!]]
== [[1] [2] [3]]
```
or use `copy`:
```
>> parse [1 2 3][collect [3 keep copy _ integer!]]
== [[1] [2] [3]]
```

[6:07:56](#JwtAtiq8Rd397wuxCOgwTLjriKc8Yzj4Mo6vzJpsqNY) <toomasv>:
* I don't understand, why it should be error! If first `collect` creates collection block, then it is only logical for all the rest to fall into this block. If you write it up with explicit block it is very clear:
```
parse [1 2 3][collect [keep integer! collect keep integer! collect keep integer!]]
```
If you want first integer to be in separate block too, add another `collect`
```
>> parse [1 2 3][collect [collect keep integer! collect keep integer! collect keep integer!]]
== [[1] [2] [3]]
```
or rather
```
>> parse [1 2 3][collect [3 collect keep integer!]]
== [[1] [2] [3]]
```
or use `copy`:
```
>> parse [1 2 3][collect [3 keep copy _ integer!]]
== [[1] [2] [3]]
```

[6:12:37](#Os5pC7TpXAjd0joyBPQI-sCLVumfBadU6AM80N8Dn-o) <toomasv>:
Or  you can drill deeper
```
>> parse [1 2 3][collect [keep integer! collect [keep integer! collect keep integer!]]]
== [1 [2 [3]]]
```

[7:38:03](#GymmBv3kPBZW52-w8k4ueefbEkcinZGe7sFwjgiUSjg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Feel free to add your opinion here: https://github.com/red/red/issues/5167

[7:41:25](#nf_c3bYAoO_UmRCBch6lOwhOicyCc3olHW4QInIQCso) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I must admit, that `collect`/`keep` in parse is much more complex than I initially thought and have many edge cases.

[8:02:37](#9MnnYP9LmcQqEdJhrNYssoWPL2nDAJ50IQr0295YgLE) <hiiamboris (NOT THIS ONE)>:
@toomasv error IMO is much better than nonsensical results that break the symmetry of how rules are written vs what results they produce.

[8:04:21](#Rdbu95wJub6D504KXNW1Ie_nvg9yjQMdsulcTGmWuuo) <hiiamboris (NOT THIS ONE)>:
If one has written `collect ... collect ...` it's most likely one has forgotten to add the outer collect, hence the error would remind.

[8:52:19](#SZSRWbJOA3IgZP5T5Jml5aluVZQoCxtV6w_ZCtJID0Y) <toomasv>:
But it could perfectly be intentional, as in:
```
>> parse [1 2 3][collect keep integer! collect [keep integer! collect keep integer!]]
== [1 [2 [3]]]
```
Why should this rise error?

[8:54:11](#1RgCVHisLAviKAC9dprtZ8rmZqDUCn3-GEkbTdsYrK0) <hiiamboris (NOT THIS ONE)>:
Because you have an *implicit* outer block which does not appear in the rules and by looking at the rules, it's hard to infer the result.

[8:54:41](#qYxKxH3teW53A-HpKSMarz5Bh7XvMLTNjWYWdfzkU70) <hiiamboris (NOT THIS ONE)>:
write it explicitly `[collect [collect keep integer! collect [keep integer! collect keep integer!]]]`


[8:56:18](#WxJLul_0dY7KpFr8cNAhIwOvHl7d2In2l4Qysgw10jo) <hiiamboris (NOT THIS ONE)>:
* write it explicitly `[collect [keep integer! collect [keep integer! collect keep integer!]]]`


[15:29:17](#w9t-gVRjQWFPgsUi7GgUtvEm3Tf8IedP0nxkKqQ5o0c) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* write it explicitly `[collect [keep integer! collect [keep integer! collect keep integer!]]]`


[15:29:30](#7bFF-jjNLSK4al8JPcNP-_QVOROC3CnB1J_QwtEAW7Y) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* And what about this (from  the unit tests):
```
>> parse [1] [collect set a [keep skip]]
== true
>> a
== [1]
```
but without collect:
```
>> parse [1] [set a [skip]]
== true
>> a
== 1
``

[15:29:35](#63f9v0taAdRK_xEHjr2qQco00w8xqtxZgTfi7TKa2Io) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* And what about this (from  the unit tests):
```
>> parse [1] [collect set a [keep skip]]
== true
>> a
== [1]
```
but without collect:
```
>> parse [1] [set a [skip]]
== true
>> a
== 1
```

[15:29:54](#ikhg0NnfeX0hNabWrEyKhua5xmvCuiusEO2pIO4WbGE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* And what about this (from  the unit tests):
```
>> parse [1] [collect set a [keep skip]]
== true
>> a
== [1] ;<--- block!
```
but without collect:
```
>> parse [1] [set a [skip]]
== true
>> a
== 1 ;<--- integer!
```

[15:31:24](#36exGMVv_8QtAlD-lkF85NmNW0heguMQztVuOKfXsk8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* And what about this (from  the unit tests):
```
>> parse [1] [collect set a [keep skip]]
== true ;<--- logic! and not the block! with result
>> a
== [1] ;<--- block!
```
but without collect:
```
>> parse [1] [set a [skip]]
== true
>> a
== 1 ;<--- integer!
```

[20:42:30](#psv6w8AYtnbFW1UveWSd-LH9-9iYxIcMqSGEbY9xYKM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Is there any example what `keep pick <expression>` (mentioned in the doc) should do? Because I don't see any difference:
```
>> parse "ab" [collect [keep ("ab")]]
== ["ab"]
>> parse "ab" [collect [keep pick ("ab")]]
== ["ab"]
>> parse [] [collect [keep ([1])]]
== [[1]]
>> parse [] [collect [keep pick ([1])]]
== [[1]]
```

[20:58:21](#Kskg90zlLkl3wwlB2BEWpVlwdeJvLuWWogPeefl74Qw) <hiiamboris (NOT THIS ONE)>:
it's supposed to explode a *match*

[20:58:33](#UUVyLIkoiC0L-hoQzEP5uHA3IeWLIkMxz-ZWJR-2YTw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I expected, that the last one would return just `[1]`.

[20:58:46](#0kpc5uxjZQEB7uhs4TjPgWYo2nTphdpbrPNU6H-Gt8k) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* I expected, that the last one would be just `[1]`.

[20:59:32](#JEkgzZ3gjTbm0GhsmzjLtsbjgWxvXLQu_Fa1SPwrGPI) <hiiamboris (NOT THIS ONE)>:
how?

[21:00:00](#QAeRdQ4SXGM2BzAxZiuvA0sQodC6JamW-eFRnntyhXQ) <hiiamboris (NOT THIS ONE)>:
if anything, it does the opposite: ensures a series

[21:00:57](#qx0jL1vBUzXWYMYFb4AVG5NAg3t4ZF8IiMtqTynJ7MY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
When there is:
```
>> parse [1 2][collect [keep 2 integer!]]
== [[1 2]]
>> parse [1 2][collect [keep pick 2 integer!]]
== [1 2]
```

[21:02:02](#_FfK9anmzxY38nV544w7mrmFleQMJx9U7VQpqN6u6b8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Maybe if I would see some example of the `keep pick <expression>`.. but there are no unit tests for it.

[21:08:08](#UgMA3ztt31XnxDb8cQoCNekXTzerLnT59HQQEcGmmYQ) <hiiamboris (NOT THIS ONE)>:
is it not clear what the docs say?
> If rule matched multiple values, they are grouped into a series of the same type as input; with pick option, values are not grouped but kept one-by-one.

[21:09:16](#ncGcLcKoUJl2jpBQqCuWsDp2rJDfOqlyHS9ZyvDrrjM) <hiiamboris (NOT THIS ONE)>:
```
>> parse "abc" [collect keep pick to end]
== [#"a" #"b" #"c"]
```

[21:10:31](#VLj22cZXyyx53IpfCS1_ZMJTaOJtuRx6beWmgsc39WU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
There is difference between expressions and rules. `to end` is a rule!

[21:11:02](#tELH9tPxMCY7QC9nLImvpY9qsvzGLtBSZ9pnBWB-YLA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
[![image.png](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/2i7W/thumb/image.png)](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/2i7W/image.png)

[21:12:06](#O_L4uEMWmAsbfzsWfeATkNNEUtb-PrObBYKGkviDE4M) <hiiamboris (NOT THIS ONE)>:
ah, I see what you mean

[21:13:24](#y7uuSLy1X18PbAlJHGLonNSs5j62QXDiAvogjFiqYJI) <hiiamboris (NOT THIS ONE)>:
I think it's a deficiency in the docs
`keep pick <expression>` is there only to outline that it's a valid combo
but it is the same thing as `keep <expression>`

[21:13:33](#qsfDmzBUZzThs8SyCaG3ggopY4P67GY6So7qWamWR7w) <hiiamboris (NOT THIS ONE)>:
* I think it's a deficiency in the docs
`keep pick <expression>` is there only to outline that it's a valid combo
but it is the same thing as `keep <expression>` (which is not said there)

[21:17:40](#ymh2TjSxOmc2kR9LSD5rkUk5FgGluH_EfQotzGeMWmg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And I think, that it is probably not implemented, because this would be better:
```
>> parse [1][collect [keep pick ([x: 1 +]) keep integer!]]
== [x: 1 + 1] ;== instead of current: [[x: 1 +] 1]
```

[21:18:52](#S9pUdaOJ50b--3Uo34V6pORuzBzV9qqDo_8CeN7E74U) <hiiamboris (NOT THIS ONE)>:
is this a real use case though?

[21:19:59](#q-ro1cx_M9Ce-WMd-z8AdlDfjy4p8-gXOhQFf3LE8IM) <hiiamboris (NOT THIS ONE)>:
I'm not sure it's worth exploding arbitrary data

[21:20:33](#Fzcy-pVhMOY3fhYwL6wiC2W030_5T2Xy8cDm-TOLNhY) <hiiamboris (NOT THIS ONE)>:
though I agree, semantically that would be the expected thing to do

## 23-Jul-2022

[3:58:33](#xZ7-Arey6RiKrfBt1luTj6fXBbwkzAIdSFODp0ylR2Q) <toomasv>:
As doc says:

> If keep is used with paren! expression, result of its evaluation is kept as-is.

[3:59:28](#DJJDGJ3nigUNo3E4qwCYTtmacW3ebLrZbY6uJWt0sRA) <toomasv>:
But yes, I have wanted it to pick from paren-expressions too.

[8:54:39](#QOEWKha2OfZxHGMZqGjQdXjrhUBANYaOa7EACXtZhj4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Should the `collect set` in the inner `collect` be excluded from the upper result?
```
>> parse [1 2][collect [collect keep skip]]
== [[1]]
>> parse [1 2][collect [collect set x keep skip]]
== []
```

[10:18:37](#-AcLGd1vM7vWHkHeIjeaEJCeyIJDPD_kpjSLVOhGd4A) <hiiamboris (NOT THIS ONE)>:
```
>> parse [1 2][collect [collect [set x keep skip]]]
== [[1]]
>> parse [1 2][collect [collect set x keep skip]]
== []
```

[10:18:58](#VUo-5IAkNY2V1xyDTLIj4Hk1xZ3G87Oj6bRPPanMq18) <hiiamboris (NOT THIS ONE)>:
it's one of those bugs that require an explicit block

[10:25:40](#Hf_UwOQQ7z9zhNnkStFzTNOm4XITTUw1MoItjf8gZmQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I don't think so, I think it is another issue and it should work like:
```
>> parse [1 2][collect [collect set x keep skip]]
== [[1]]
>> x
== [1]
```

[10:26:51](#u8mWvnA3ztFPgZGFsfgKjzgw-XDoqPgBo28v5xUsKbo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And there should not be difference between `collect [set x keep skip]` and `collect set x keep x`.

[10:27:02](#FTFSc2nUsspiAPe1obUijLcTn4LVfxsPpN1jj3Wdv8U) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* And there should not be difference between `collect [set x keep skip]` and `collect set x keep skip`.

[10:31:45](#TutB6dOIemEL3j9HO8kO5F68pOiS2lowcOCt8XwoI6A) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
(I mean complete result... because `x` is different)
```
>> parse [1 2][collect [collect set x keep skip]]
== [[1]]
>> x
== [1]

>> parse [1 2][collect [collect [set x keep skip]]]
== [[1]]
>> x
== 1
```

[10:32:03](#LbrVPQA4amU8v5u6fpA2dlgyYm9famyzDIZmLF8BuDk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* (I mean complete result... because `x` is different) So this I expect:
```
>> parse [1 2][collect [collect set x keep skip]]
== [[1]]
>> x
== [1]

>> parse [1 2][collect [collect [set x keep skip]]]
== [[1]]
>> x
== 1
```

[10:32:16](#5nP_NuybcaOMVzzWX6rnvUvJjStcwGAX1L2giMLkEkg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* (I mean complete result... because `x` is different) So I expect this :
```
>> parse [1 2][collect [collect set x keep skip]]
== [[1]]
>> x
== [1]

>> parse [1 2][collect [collect [set x keep skip]]]
== [[1]]
>> x
== 1
```

[10:32:20](#frVSpUcgjMx3h5j31nnArAR8fhcV9GjlUGk-TStE4ns) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* (I mean complete result... because `x` is different) So I expect this:
```
>> parse [1 2][collect [collect set x keep skip]]
== [[1]]
>> x
== [1]

>> parse [1 2][collect [collect [set x keep skip]]]
== [[1]]
>> x
== 1
```

[10:33:55](#xF-Uy31N_zAy1neqwDnt66Rg0vjEOWiB4bbFmu6bL94) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* (I mean the complete result... because `x` is different) So I expect this:
```
>> parse [1 2][collect [collect set x keep skip]]
== [[1]]
>> x
== [1]

>> parse [1 2][collect [collect [set x keep skip]]]
== [[1]]
>> x
== 1
```

[10:36:59](#0LjbA0zread2q8rVzD0DT0w2IKdxYfg9KHUHXT6gOQc) <hiiamboris (NOT THIS ONE)>:
I don't follow. Why should `x` be different?

[10:37:41](#9BNSXd4ozM4aJRYqsEAQ9WfI2nh3kzIO32Foqz4V1qg) <hiiamboris (NOT THIS ONE)>:
oh I get it

[10:38:01](#zGS1q1hXLaLUe4DuUCkuP6C5S37MZZnjCJr2mki8jo4) <hiiamboris (NOT THIS ONE)>:
`collect set` comes in conflict with `collect` + `set`

[10:39:45](#yXY8NrLHoOf1Q4m3izpfShV0f7NcFB2yIbAh_SHY8D8) <hiiamboris (NOT THIS ONE)>:
so, good question if it should or not be included

[10:42:04](#J_47D38142FLyQuhNq6TNYLxcvKS8hKupteNEkCd8sI) <hiiamboris (NOT THIS ONE)>:
we can think of it as of *diverting* the collection into a new series, or as just as *marking* a word with the collection result

[10:42:49](#Ls-RFj0Pc6Bv71Wz2g0lZeWFZo0bHcxVz1fZPLMuy5Y) <hiiamboris (NOT THIS ONE)>:
since you can do your thing with:
```
>> parse [1 2][collect [set x collect keep skip]]
== [[1]]
```
then diverting is by design

[11:06:15](#N-SHmzMFHcJApVOfa5-y2FQUdWEm2-wvicS_27FI7Kw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Just to make it clear. I'm not looking _how to do **my thing**_. I'm looking for extreme cases and their results.

[11:06:33](#GcRTEvL5zEzGSmsdQfCJ6rkmS_NI-cbgPNW5d7-lRvA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Just to make it clear. I'm not searching _how to do **my thing**_. I'm looking for extreme cases and their results.

[11:08:09](#TaCGcb2X8XaCUEdaofbD_LCwBaIgt99cx3jEs_7hF1I) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Just to make it clear. I'm not looking for _how to do **my thing**_. I'm looking for extreme cases and their results.

[11:13:03](#RIf85gbYhKkrzHszdsi2zf0HfQBxpruSR63bVmzppEc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
But it is true, that I confused myself when I made the `set` not related to `collect`.

[11:18:16](#F3IizhJn03OS85GGyMujF1h5zUJIn3pxo1fUIzs3qEI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Actually it looks, that the inner set is just not included in the upper level, so it still may be by design.
```red
>> parse [1 2][collect [keep integer! collect set x keep skip]]
== [1]
>> x
== [2]
```

[11:19:45](#8zz-dcTtKIosa8W6nLuCRsfoz9kNCq1UCrxCkRBMjXE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@toomasv is above good or not?

[15:50:01](#9BmeeZ65oMjV3JoS2EW1wjGS2FR2QafLs1Mzz2pEfA4) <hiiamboris (NOT THIS ONE)>:
btw https://github.com/red/red/issues/4198

[15:51:09](#FrhwlrJjKDbq56MusBulB3_OJLM3r7GzWAxO7iTdVoE) <hiiamboris (NOT THIS ONE)>:
so it was indeed by design not splitting expressions

[16:46:00](#E_aO0zdHYWe3FRf5gJ5kMzZq04Ug8VvKP03qVbuvsco) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
When thinking about it a little bit more, it probably makes sense that the named collects are excluded from the unnamed parents. It would be more useful in real use scenarios.

[16:46:17](#xn9nSZTZ6QC0Str9XUFMRBmpV0MDuU42Odhzud9Lcsc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* When thinking about it a little bit more, it probably makes sense that the _named collects_ are excluded from the _unnamed parents_. It would be more useful in real use scenarios.

## 24-Jul-2022

[3:28:00](#ZLdskfizkW7eZUTeWP068TBzQhYqxFzcXKbKp39HW0w) <toomasv>:
@Oldes Something seems wrong with it, yes. Giving `set`-rule to `collect` seems to ignore `collect`. And setting `x` seems also weird. Compare these 
```
>> parse [1][collect set x keep skip]
== true
>> x
== [1]
>> parse [1][collect copy x keep skip]
== [1]
>> x
== [1]
```
These are correct
```
>> parse [1][collect keep set x skip]
== [1]
>> x
== 1
>> parse [1][collect keep copy x skip]
== [[1]]
>> x
== [1]
```

[3:29:42](#m9qfR0dFJmhO7wKmmoKL2UGNawjoKlWtu9ZfIzuREho) <toomasv>:
* @Oldes Something seems wrong with it, yes. Giving `set`-rule to `collect` seems to ignore `collect`. And setting `x` seems also weird. Compare these 
```
>> parse [1][collect set x keep skip]
== true
>> x
== [1]
>> parse [1][collect copy x keep skip]
== [1]
>> x
== [1]
```
These are correct
```
>> parse [1][collect keep set x skip]
== [1]
>> x
== 1
>> parse [1][collect keep copy x skip]
== [[1]]
>> x
== [1]
```
With your example above
```
>> parse [1 2][collect [keep integer! collect keep set x skip]]
== [1 [2]]
>> parse [1 2][collect [keep integer! collect keep copy x skip]]
== [1 [[2]]]
```

[7:45:46](#JWoommf27yP3a4iKhma-mHVrY9e2MJM15GPZZvicwZk) <hiiamboris (NOT THIS ONE)>:
@toomasv `collect set` has a special meaning, like `collect into`

## 25-Jul-2022

[14:22:27](#2JGlL9xlStSGHerEDYkaojeP3EUORYdfax0YR7YPDjw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Is this useful?
```
>> a: ""  parse to-binary "ah" [collect into a keep 2 skip] a
== "#{6168}"
>> a: ""  parse to-binary "≈°o" [collect into a keep 2 skip] a
== "#{C5A1}"
```
Should not it be error like in this case?
```
>> a: #{} parse "1" [collect into a keep skip]
*** Script Error: PARSE - COLLECT INTO/AFTER expects a series! of compatible datatype
```

[14:27:16](#pQuReJQ1EsXWbhOgkuGf1g-dVraVs8dtXYLFkiAIsZY) <toomasv>:
@hiiamboris 

> collect set has a special meaning, like collect into

Ah, yes, thanks!

[14:29:10](#pjcb7QuVPv0-VkOwgas7IsKjXVPNfOtyxe9rpgSpJUE) <hiiamboris (NOT THIS ONE)>:
@Oldes I agree

[15:34:18](#EuqL3S2OswXHHnEFsfghdA2sk8mILwfIS0JIL2GHZsw) <greggirwin (Gregg Irwin)>:
I agree as wel @Oldes.

[16:57:53](#3DTx-I-2o8xmKoqInYR5dw2mkm4ztbNsdb5douX8gLA) <toomasv>:
But then (enforced compatibility) you would not be able to do this either
```
>> a: []  parse to-binary "ahhaa!" [collect into a [some keep skip]] a
== [97 104 104 97 97 33]
```


[17:15:38](#CAq6FqGzv9j1e8a2hyWU2ohhsdUZ98h-oDnJfVY6LYg) <hiiamboris (NOT THIS ONE)>:
interesting trick

[17:27:34](#0gm5vADJ9gGBIWh8vYAffIq2sksODNlqWYgSLwP-Qwk) <greggirwin (Gregg Irwin)>:
So the char! into binary! case should *not* error? We do love our tricks and flexibility. Easier to make stricter on top.

[20:30:26](#h4R-hCP3vIaO72oB8BUmjfkESdKx42BGFJ0JGKeHuzI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It is not same.. there is difference having `a` as block and or string!

[20:31:49](#l4H13X979eyfCdoegojQ1mquT34D_QcY1WLpj1aSLuE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And of course.. the main issue is with the unicode char of course

## 26-Jul-2022

[12:24:40](#IV6J7ppWTD-F5sn2_YdxahENqsCZ623KCVJKAnoH5S4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And which result makes more sense in this case?
```
x: 0  parse [][ 2 [(x: x + 1)] ]  x
```
Is it `1` or `2`?


[12:51:38](#nK-ireVX-btIOttSyCo-IT4IPYywoc0JhVQGC_vNGsM) <hiiamboris (NOT THIS ONE)>:
`1`

[12:53:23](#hKpjAjwa8Bc-bDovHqxUXO26hL3FYWDor0QERmVgd4A) <hiiamboris (NOT THIS ONE)>:
* `1` if we know loops are stopped when they don't advance
`2` if we make loops dumber

[12:54:37](#BJKV8pitADTXV9PGCUBbBqMxbjtOwKt4mxMcHWFRfZQ) <hiiamboris (NOT THIS ONE)>:
`2 rule` <=> `2 2 rule` is a special case of `N M rule`, which we could require to evaluate `N` times unconditionally

[12:54:56](#J5wuTb_fGbu4G82L-Zxl0wDY5HQOAV4eCODK2VRaOb8) <hiiamboris (NOT THIS ONE)>:
* `2 rule` <=> `2 2 rule` is a special case of `N M rule`, which we could require to evaluate `N` times unconditionally, and then depending on advancement

[12:55:20](#whzoB7aHlhM9G4FojMKFA-dAvZKYcnVSgyz5tSDL-0E) <hiiamboris (NOT THIS ONE)>:
can't see any drawbacks atm

[12:55:54](#z6mykeDNeA39RS6xCJ9Ar0EY7engreL2bov7UhZhVJ8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
In Rebol it is even without the block:
```
>> x: 0  parse [][ 2 (x: x + 1) ]  x
== 2
```

[12:56:13](#n7nyo2jhwjWlAhdzKcL0w5Akb55dIMALU32rp0LTnxw) <hiiamboris (NOT THIS ONE)>:
then it's a good argument for the change

[12:56:56](#8HoXj-Vnct4eGoyc8ZrOaj2i9HZF_U-uLv2rqUKlo3g) <hiiamboris (NOT THIS ONE)>:
on the other hand, 
`x: 0  parse [][ 2 3 [(x: x + 1)] ]  x` in R2 returns 3

[12:57:13](#sZrBv9ZFQooiI1BhTV1qfJjs2ro1d4RWD8zGNCksU9Q) <hiiamboris (NOT THIS ONE)>:
so it doesn't even check for advancement?

[12:57:13](#G_3-xRcj0Fwe3jSZt9KbTg1enn0ySqku2eh6aWgqpUY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Personally I don't think anybody is using this _feature_.

[12:57:59](#9QS0QKWjuseOFFWtdXxVYiXe5RccdCs-wZ13FKy1liU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
3 make sense.. in  the above example:)

[12:58:52](#SreaQUW-rhcG7w-pV_090oiI-xngOTiwSgsbQJ82hn8) <hiiamboris (NOT THIS ONE)>:
ok maybe so

## 13-Aug-2022

[13:35:48](#cGz-I0UZhPAawMQ_H-MmUIteTRalYYXdy5OmyBtJo2s) <snotbubble (Craig Brown)>:
is there an equivalent of the Regex `(^)` in Parse?  
having trouble detecting the a character at the start of a string while also skipping past an escape character, eg:
```
d: complement charset "\"
a: "+xx+ x\+y +yy+"
parse a [ 
  some [ 
    to [ d #"+" ] skip remove thru #"+" insert ("<s>") 
    to [ d #"+" ] skip remove thru #"+" insert ("</s>") 
  ] 
]
probe a
== "+xx<s> x\+y </s>yy<s>"
```
while if the beginning of the string `(^)` was in the bitset, it could return:  
`== "<s>xx</s> x\+y <s>yy</s>"`

[14:01:37](#hhlni2L8iRhsG54iF9rysA-wepwKsDVR7ldFNFbkte0) <gurzgri>:
is there an equivalent of the Regex `(^)` in Parse?  
having trouble detecting the a character at the start of a string while also skipping past an escape character, eg:
```
d: complement charset "\"
a: "+xx+ x\+y +yy+"
parse a [ 
  some [ 
    to [ d #"+" ] skip remove thru #"+" insert ("<s>") 
    to [ d #"+" ] skip remove thru #"+" insert ("</s>") 
  ] 
]
probe a
== "+xx<s> x\+y </s>yy<s>"
```
while if the beginning of the string `(^)` was in the bitset, it could return:  
`== "<s>xx</s> x\+y <s>yy</s>"`

[14:02:04](#Mt-8lQfVIu29We6BFEHSj11P_1kt_oF4kvWV1oj0EHM) <gurzgri>:
* No, "start of string" is not a character which can be part of a charset.

```Red
>> a: "+xx+ x\+y +yy+"
>> parse a [any ["\+" | change "+" "<s>" to [not "\+" "+"] change thru "+" "</s>" | skip]] a
== "<s>xx</s> x\+y <s>yy</s>
```

[14:03:55](#sh8_XxPyWF2Q2Gj_Uh1W037xoOPTcXuLiQkQXj74iwo) <gurzgri>:
* No, "start of string" is not a character which can be part of a charset.

```Red
>> a: "+xx+ x\+y +yy+"
>> parse a [any ["\+" | change "+" "<s>" to [not "\+" "+"] change thru "+" "</s>" | skip]] a
== "<s>xx</s> x\+y <s>yy</s>
```

[14:04:33](#N7OcYlaabgDN5zXhK0VRS-QOepOD-qgKHcvE6vQ09Gk) <gurzgri>:
* You can test for `head?` with `parse` with e.g. `[... pos: if (head? pos) ...]` though. A rule will fail unless `pos` is at it's head.

[14:16:59](#ddlHmOA9BcSx_PFmTi1G4Nc6_jNRmi5WiihWFn4B8nI) <gurzgri>:
* You can test for `head?` with `parse` with e.g. `[... pos: if (head? pos) ...]` though. A rule will fail unless `pos` is at it's head.

[14:17:09](#T4bAwPDts64Zp2cdm7mPIk1QSs8X_66o1r9M4KxmIlg) <gurzgri>:
* No, "start of string" is not a character which can be part of a charset.

```Red
>> a: "+xx+ x\+y +yy+"
>> parse a [any ["\+" | change "+" "<s>" any ["\+" | not "+" skip] change "+" "</s>"] | skip] a
== "<s>xx</s> x\+y <s>yy</s>
```
You can test for `head?` with `parse` with e.g. `[... pos: if (head? pos) ...]` though. A rule will fail unless `pos` is at it's head.

[14:17:19](#kJ3LYGOo-hRu5QCOFJVGzxKq-MYne985Kexf8YCIFzY) <gurzgri>:
* No, "start of string" is not a character which can be part of a charset.

```Red
>> a: "+xx+ x\+y +yy+"
>> parse a [any ["\+" | change "+" "<s>" any ["\+" | not "+" skip] change "+" "</s>"] | skip] a
== "<s>xx</s> x\+y <s>yy</s>
```

[14:17:38](#MO9mRRifxHYGi5iLiNAK6Gq-fmfuoYSEt7_BIuV-nh8) <gurzgri>:
* No, "start of string" is not a character which can be part of a charset.

```Red
>> a: "+xx+ x\+y +yy+"
>> parse a [any ["\+" | change "+" "<s>" any ["\+" | not "+" skip] change "+" "</s>"] | skip] a
== "<s>xx</s> x\+y <s>yy</s>
```

You can test for head? with parse with e.g. [... pos: if (head? pos) ...] though. A rule will fail unless pos is at it's head.

[14:17:49](#k8hYNTaoRbhF7-NDqwCO0kBMYk18PWaKlBR-muYetWc) <gurzgri>:
* No, "start of string" is not a character which can be part of a charset.

```Red
>> a: "+xx+ x\+y +yy+"
>> parse a [any ["\+" | change "+" "<s>" any ["\+" | not "+" skip] change "+" "</s>"] | skip] a
== "<s>xx</s> x\+y <s>yy</s>
```

You can test for head? with parse with e.g. `[... pos: if (head? pos) ...]` though. A rule will fail unless pos is at it's head.

[15:05:05](#8zGVTaxLuov7rH1QQC1v2eZ9R7slZIr6Ns5WkWsprkA) <gurzgri>:
No, "start of string" is not a character which can be part of a charset.

```Red
>> a: "+xx+ x\+y +yy+"
>> parse a [any ["\+" | change "+" "<s>" any ["\+" | not "+" skip] change "+" "</s>" | skip]] a
== "<s>xx</s> x\+y <s>yy</s>
```

You can test for head? with parse with e.g. `[... pos: if (head? pos) ...]` though. A rule will fail unless pos is at it's head.

[15:05:40](#DGcc1rtr9eQ9xsbdiUq3gJGfXXFQtqNBRq6Y11sSaNI) <gurzgri>:
edited because of typo

## 15-Aug-2022

[3:29:07](#BIH4dGbQOWqSFT_woAs6OCfPXhD5U_NdQMvOmrgdgpQ) <snotbubble (Craig Brown)>:
@gurzgri understood thanks... out of curiosity is there a benefit to using parse with nested loops vs vanilla Red in this case?

[5:33:34](#GktDOVmvX-T0hsKg2jhy5VAN5UPFPYKTMdoLRRRFsZ0) <gurzgri>:
The rule of thumb is: the `parse` solution is usually faster.

[7:16:58](#ErFtl8rUmXPF_G_7SvHj3ah-o9M5mqx2lycHOhsv6Ck) <hiiamboris (NOT THIS ONE)>:
when interpreted

[8:47:05](#0Ro4NQND7k-auOJpgMQGq30qzdcoF2q51AN8rUFWbo4) <GiuseppeChillemi (GiuseppeChillemi)>:
@hiiamboris how much is the difference between compiled and interpreted?

[8:49:01](#kUyNO3sxW9WqL2L5J2UtQM76tPbu2SmYOAvp-b5yu7Y) <hiiamboris (NOT THIS ONE)>:
depends on your code

[8:50:33](#W_pxAKnUema5xy_mOiYaOHEYHRmSckA7-gmKgDBq6Vc) <GiuseppeChillemi (GiuseppeChillemi)>:
I have zero experience in parse, I have not material to test it.

## 18-Aug-2022

[15:50:59](#NmN3z_btE1oSn5q3n8oxtqrKrsKR0V7qVcidGTCFw-g) <GiuseppeChillemi (GiuseppeChillemi)>:
I am doing my first experiment with Parse.
I would like to validate a specs block but I don't know how to check for datatype instead of a word in a subrule:

```
parse-ctx: context [
	datatypes: [any word!];<<<<--- need [any datatype!]
	specs: [word! ahead block! into datatypes]

]
spec: [x [word!] y [integer!]]
probe parse  spec bind [
	any specs
] parse-ctx
```


[15:51:20](#eWQbOKZr2rcl1SnxdMT_B0C_f1nDNXw0Et4Y4qg3ulo) <GiuseppeChillemi (GiuseppeChillemi)>:
* I am doing my first experiment with Parse.
I would like to validate a specs block but I don't know how to check for datatype instead of a word in a subrule:

```
parse-ctx: context [
	datatypes: [any word!];<<<<--- need [any datatype!]
	specs: [word! ahead block! into datatypes]

]
spec: [x [word!] y [integer!]]
probe parse spec bind [
	any specs
] parse-ctx
```


[16:10:14](#A28C8XvNR-oVAx0dyuB3D9B40toPODgwpEiNtbauMUw) <greggirwin (Gregg Irwin)>:
Looks can be deceiving:
```
>> type? first [integer!]
== word!
>> type? first reduce [integer!]
== datatype!
```

[16:49:24](#SJg6jtaoo6ACT_tWz2vt3Qyvuy5zAzQhkoJGmENp7pA) <GiuseppeChillemi (GiuseppeChillemi)>:
Gregg,  I have learned this topic but I don't know to let parse `get` the word at check for it as datatype

[16:49:35](#U-kbN4J7ZqMCZNdvwIez7Nmh8X6vCF7Z3R0swuOm5UM) <GiuseppeChillemi (GiuseppeChillemi)>:
* and check

[16:55:04](#3wOe5wdB8CEzskfDbCgotgyyBDrgEGpufE5xc0UN20M) <greggirwin (Gregg Irwin)>:
You can look at `help`'s source (specifically `parse-func-spec`), which `reduce`s the type part of the spec (the block).

## 7-Sep-2022

[21:16:07](#64HmZ3Zl4ZCaoUwGs3nulA9_Ouj_IT8frE7b6BqmqwE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
If we would like to swap `map!` and the construction syntax.. we can use something like:
```
swap-map-cons: function[src [string!]][
	bl: complement charset "[]"
	pb: complement charset "()#"
	cr:  [#"[" any bl opt cr #"]"]
	crn: [     any bl opt cr #"]"]
	mr:  [#"(" any pb opt tr #")"]
	mrn: [     any pb opt tr #")"]

	tr: [ any pb [
		#"#" s: [
		  #"[" (s/1: #"(") crn s: (s/-1: #")")
		| #"(" (s/1: #"[") mrn s: (s/-1: #"]")
		| tr
		]

	]]
	parse src [any tr]
	src
]

print swap-map-cons {
	#[none] #[f32! [1 3 4]] #[string! "aaa" 2]
	#(x: 1 y: #(a: 2 b: #[true]))
	#issue #{01}
	#[integer!]
}
```

[21:17:04](#SB2CkFNu34w-acH-6eurRtdrQuoLFu6EEZZ2fEUlip4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It would do the change also inside strings, but that should not be big problem.

[21:18:57](#YbGH8gC45tDGbrgaLkhfylo_Q6a70ILxRyZ2lADPJlg) <hiiamboris (NOT THIS ONE)>:
https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/mapconv

[21:20:48](#sjUrvga5BmMmE7hjZtSi3ZO9dfspxHrOS6c6jlwkAOY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Hm.. my version looks shorter:)

[21:21:51](#qPhNL0i4SzzjDBFU0eKpGoYWSDlkekAeVM2dQXl0KTQ) <hiiamboris (NOT THIS ONE)>:
:)

[21:24:50](#RwTlhvx9uyJDqYWO0VS2kDd9ARCeg_gd9zuw7TWr3fY) <hiiamboris (NOT THIS ONE)>:
My doesn't break strings & comments! ‚òª

[21:29:09](#qSzIRZvxP_F3zzP4COJhlwnmzc5DFJ53gjq7x7G2jnA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It would not be hard to handle it... but I will rather go sleep... it would be an use-and-delete utility anyway.

[21:36:05](#l2oawDuo4El--Rp3S1BOFW0JcBKQ2F2Ckag4YNbph6c) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Btw.. I think the utility should change also strings and comments. Because if there is `#[..]` or `#(..)` in comments/strings, than it is the most probably commented out code, which also need conversion. I don't think I would find a comment inside my construction value.

[21:45:02](#O65Pzn3fjlrEl-1en4hAOcfe7jZdOSeL9QGv2_tqbAU) <hiiamboris (NOT THIS ONE)>:
Actually, nested strings are quite hard...

[21:46:03](#jyXtLbjaICvlVCCoTCtyaHk8Eko226QWmCa2lq_V024) <hiiamboris (NOT THIS ONE)>:
I agree there are cases for that. But also e.g. `charset "#(){}"` you don't wanna mess things like that.

[21:46:39](#xECbJTZmTo3O01RfMmqrTrAieOnSR_8XGaBLDjXdwdU) <hiiamboris (NOT THIS ONE)>:
* Actually, nested strings are quite hard... (besides no one knows real lexing rules ;)

[21:52:04](#9y8CRanRsnQr2u7xZUo8ChK5vyUoTRlf3siOZNHNLjc) <hiiamboris (NOT THIS ONE)>:
`gen-delims:  charset ":/?#[]@"` from red codebase

[21:52:44](#IMq540NOg-CrB-918lrNg2r2zhUGVQl5jej2wyoUNU8) <hiiamboris (NOT THIS ONE)>:
Perhaps adding an option for comments is worth it though. I see a lot of single line comments with `#[none]` in my tests.

[22:14:51](#izP_hw044BG6eGBW-Xb4wKgGb2XMMWn9uz8oirnfm9M) <greggirwin (Gregg Irwin)>:
Do the easy thing first, which gives the most value. Then analyze to see what's left.

## 16-Sep-2022

[22:13:16](#AvWNN9s42BZTfK8GMTHhPJ_yV7ibZKePoF2iRvpaQhk) <GiuseppeChillemi (GiuseppeChillemi)>:
How do I express: scan the whole block for THIS rule but if you it twice, fail.

[22:13:55](#uPiol_cE0Hsp6bHtTFEWtoVFc2mj9KZ1QOg1Gqq1b68) <GiuseppeChillemi (GiuseppeChillemi)>:
I mean "if you have more than one match, fail".

[22:22:32](#6pPwZtHXynLFN4HPBbWRwl83cDT0MxJSuZjcYJwB8hI) <GiuseppeChillemi (GiuseppeChillemi)>:
* How do I express: scan the whole block for THIS rule but if you find it twice, fail.

[22:26:40](#LZks782tRJEsSAtxOBjt6Rnh87c8v_-4ht71d2fMbXc) <hiiamboris (NOT THIS ONE)>:
`rule opt [rule reject]`?

[22:27:09](#8tPUej7DQrF7v2Q5nO2ZW11lLd0Hxg4tTjSVwwER5a8) <hiiamboris (NOT THIS ONE)>:
or `rule not rule`?

[22:41:07](#FZ3sBe_JZzfseWwhFVohegsWx_1pJIulKgvtOxW-pVQ) <GiuseppeChillemi (GiuseppeChillemi)>:
```
>> rule: ['a integer!]
== ['a integer!]
>> parse [a 22 x x x x x b ] [rule opt [rule reject | skip]]
== false
>> parse [a 22 x x x x x a 33] [rule opt [rule reject | skip]]
== false
>> 
```
The second should be true

The third should fail



[22:42:42](#FiLWvOaaO7j7V_AOPjB00zSz_F8BLqKIrF6-nj2nPjw) <GiuseppeChillemi (GiuseppeChillemi)>:
Usage: I need to check if a key present more than one time

[22:42:50](#AzA6N_DvvhWsLwofhoSTF5YuhhFhl13yYadY9ipc5ko) <GiuseppeChillemi (GiuseppeChillemi)>:
And also its value

[22:43:03](#Mqpn3AuP_ewMN7vwJCrm20lxlbN9Vca72AOQlNu-kf4) <GiuseppeChillemi (GiuseppeChillemi)>:
* And also its next value

[22:43:51](#XUpqOmlYEPIlO26l0rvcs-V7RlWu_sh-n7IZNfVDSFE) <GiuseppeChillemi (GiuseppeChillemi)>:
As bonus, I whould like to check if the total of data keys are EVEN

## 17-Sep-2022

[3:41:45](#J-4SQ_fd3ViSmRJeq5fE8dbNjozUX_ZkLk0UT8sgylE) <toomasv>:
@GiuseppeChillemi 
```
b1: [a 1 x x] b2: [a 1 x x a 2] b3: [x a 1 x x b 2 z] b4: [a b x a 1 a c a a 2 x]
f: func [b] [parse b [any [check any [check (return false) | skip] | skip]] true]
```
```
>> f b1
== true
>> f b2
== false
>> f b3
== true
>> f b4
== false
>> b4: [a b x a 1 a c a a 2.5 x]
== [a b x a 1 a c a a 2.5 x]
>> f b4
== true
>> even? length? b4
== false
>> even? length? b1
== true
```

[7:17:15](#zX3g97tnEznZNn58cSKUdpl7Vqw4Q6TsECI5B6Og1Qc) <toomasv>:
```
check: ['a integer!]
```

[8:17:44](#B6gbV42OU-tmBMPT5119HnFCkKA8Sm1pin-7Nxf1wfU) <hiiamboris (NOT THIS ONE)>:
maybe you should read parse docs to understand what value `parse` returns or how to combine rules then

[8:17:46](#cgpn5PrU1QTWteISOT1eUe29hqGvhLRdORid7cMLeBU) <hiiamboris (NOT THIS ONE)>:
```
>> parse [a 22 x x x x x b ] [rule not rule to end]
== true
>> parse [a 22 x x x x x a 33] [rule not rule to end]
== false
```

[8:18:03](#kLUQb6P9znytqXoLBeITjBSsxCeokqktWjQ7kXFXQt8) <hiiamboris (NOT THIS ONE)>:
* ```
>> rule: [thru ['a integer!]]
>> parse [a 22 x x x x x b ] [rule not rule to end]
== true
>> parse [a 22 x x x x x a 33] [rule not rule to end]
== false
```

[8:22:28](#ib2hNR6YNUPkr7bUX2jY16Fz8KUBY-Jbn1xTxjUQpeg) <GiuseppeChillemi (GiuseppeChillemi)>:
Parse is one of my last beasts. I have started to conquer VID, then will come a full work on parse.

[8:23:20](#-Iy4c6YYO8K62S1DW-CB9F2Xvqh9SPWagiToPVfL3ko) <hiiamboris (NOT THIS ONE)>:
push hard Ì†ΩÌ∏â

[8:24:26](#tEKxPkl1KEoFs8y2PPsyNNTax2fP2OHGrl2_M05SO98) <GiuseppeChillemi (GiuseppeChillemi)>:
However, `thru` approach is dangerous for me:

[8:27:13](#LKz0cRBUf-mwcomngGKXKoRbtrKDey_haev29AaQw_w) <GiuseppeChillemi (GiuseppeChillemi)>:
`[a 2 b c 2] ` must fail as I want to process values by couples, where the first is always a word and skip by 2.

[16:39:23](#53P0GtLX25v_pAQ-l4jnAylipUlmXzzkUao5p_UNNDk) <GiuseppeChillemi (GiuseppeChillemi)>:
@toomasv @hiiamboris I forgot to thank you.

[23:16:37](#SJM11JStRMg-4VifqZVyPdzEnm69WcAC-PvQ4fJrGEo) <GiuseppeChillemi (GiuseppeChillemi)>:
@toomasv 

I was studying it your version but it has one problem:
```
check: ['a integer!]
f: func [b] [parse b [any [check any [check (return false) | skip] | skip]] true]

>> f [a b]
== true
```
It should return false.

[23:17:54](#0LLYzflBmPF0t1OhRxnKg8ZhvD6IsgUqn35duUaSkg8) <GiuseppeChillemi (GiuseppeChillemi)>:
@toomasv 

I was studying it your version but it has one problem:
```
check: ['a integer!]
f: func [b] [parse b [any [check any [check (return false) | skip] | skip]] true]

>> f [a b]
== true
```
It should return false.

[23:18:08](#L8GGm7Gs74f3KLoh5yUJK2G3hm1fVGBn5eWeXg2XwjU) <GiuseppeChillemi (GiuseppeChillemi)>:
* I see a forced `TRUE` return at the end of the function but even removing it, I receive `TRUE` in such case.

[23:35:19](#yMlgBZtW3anUjvuTaqOEmLcJa8B5-OP4RgkSW4nqtqY) <GiuseppeChillemi (GiuseppeChillemi)>:
I have tried this:
```
>> f: func [b] [parse b [1 [check any [check (return false) | skip skip] | skip skip]]]
```
But it fails on:

```
 f [a x b x a 2]
 f [a x a 2 b x]
```
While it 

[23:37:00](#y8kR9kb-bpAezS8Hva5FTpuZoDn7OXpqo0iyMB9xd3g) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have tried this:
```
>> f: func [b] [parse b [1 [check any [check (return false) | skip skip] | skip skip]]]
```
It works on:
```
f [a x]
== false
```
But it fails on:

```
 f [a x b x a 2]
== false
 f [a x a 2 b x]
== false
```
Which should be true

[23:37:56](#sqdeATFzJDnCLQpU5_PIkUa_kYRnEtf09LweS3Ikjgw) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have tried this:
```
>> f: func [b] [parse b [1 [check any [check (return false) | skip skip] | skip skip]]]
```
It works on:
```
>> f [a 2 b 2]
== true
f [a x]
== false
```
But it fails on:

```
 f [a x b x a 2]
== false
 f [a x a 2 b x]
== false
```
Which should be true

## 18-Sep-2022

[6:27:52](#6neou2l6Cn4zmKBu4Cg3T1yAo8LbOX1t3sYO9X-ljMQ) <toomasv>:
@GiuseppeChillemi So single `['a integer!]` should always be present, on any position? Maybe this:
```
f: function [b] [out: false parse b [some [check (if out [return false] out: true) | 2 skip | (out: false)]] out]
```

[6:31:01](#EUk6dGalYmgmMjeRoYOurQ4XGL6ORvHlvabBS4lDTqg) <toomasv>:
What about `[x a 1 x]`? Should it succeed?

[6:33:56](#iNb-JpNdc6j4TuOfe0UtaOAmlMNkC5rxLnYnGz8RsME) <GiuseppeChillemi (GiuseppeChillemi)>:
No, this should not succeed

[6:37:25](#zljJ2JjEy-2gYb04-xGpPb4FUkL3YaqgsYfOiwnF2O4) <GiuseppeChillemi (GiuseppeChillemi)>:
As for `['a integer! ] ` it must always be there 1 time and no more

[9:37:39](#QLvfQZLuW_yuF1Rb7mI6_EKgYIJTxBVHcQLpK6Rjd1A) <toomasv>:
So, how does the latest `f` perform?

[11:06:03](#IUhPEes7hTk88uBHvR3l6AD3x7GTB2LoSxxWNO9mucM) <GiuseppeChillemi (GiuseppeChillemi)>:
I confess I am still in my bed surfing internet, I will try soon!

[11:24:36](#ZmjlrmvTvZvHHD3rpjsJ3juLdK_DVvnDU-NUeNr3fAk) <toomasv>:
Ì†ΩÌ∏Ç 

[12:26:48](#-q7Ppsu1jox5aCkJi5e46sKS0nUFHoQFhwX-bt4ONjQ) <GiuseppeChillemi (GiuseppeChillemi)>:
@toomasv Ok, now I am out of my bed!

It works and I am continuing my experiments. I was trying to check split key/values using a parse block.

```
split-words: func [
	word [word! object!]
	/local
	out-data
] [
	out-data: copy []
	if object? word [
		word: words-of word
		forall word [append out-data reduce [word/1 get word/1]]
	]
	if word? word [
		append out-data reduce [word get word] 
	]
	out-data
]
check-key: func [
	data [word! object! block!]
	check [block!]
] [
	either any [word? data object? data] [
		f split-words data check
	] [
		f data check
	]
	
]
```
This is the result on objects and blocks.
```
>> data: make object! [x: 22 c: 33 d: [a b c]] 
>> check-key data ['x integer!]
== true
>> check-key [a 88 x 22 d 33] ['x integer!]
== true
```


[12:27:17](#Bc8U45PLvYWwAysgCLLxugRPxh66dKziQuKHtU-oF0g) <GiuseppeChillemi (GiuseppeChillemi)>:
* @toomasv Ok, now I am out of my bed!

It works and I am continuing my experiments. I was trying to check split key/values passing a parse validation block.

```
split-words: func [
	word [word! object!]
	/local
	out-data
] [
	out-data: copy []
	if object? word [
		word: words-of word
		forall word [append out-data reduce [word/1 get word/1]]
	]
	if word? word [
		append out-data reduce [word get word] 
	]
	out-data
]
check-key: func [
	data [word! object! block!]
	check [block!]
] [
	either any [word? data object? data] [
		f split-words data check
	] [
		f data check
	]
	
]
```
This is the result on objects and blocks.
```
>> data: make object! [x: 22 c: 33 d: [a b c]] 
>> check-key data ['x integer!]
== true
>> check-key [a 88 x 22 d 33] ['x integer!]
== true
```


[17:34:12](#g2VnvG24g9CnfWMkemkouclsUFVMdABrlD3X3te48bM) <toomasv>:
:+1: 

## 21-Sep-2022

[23:55:25](#c0fXFe02eQW1lBBuK2wMSObZgtLuNRd973-1wjIY5YM) <GiuseppeChillemi (GiuseppeChillemi)>:
How could append an additional button to panel `p`, below the `x` button?

```
view [
	p: panel 300x150 [
	x: button "hello" [append p/pane layout/only [button "world"]]
	]
]
```


## 22-Sep-2022

[7:26:31](#3dn_zRVXzwVSMAwImo1m3LoKn0W4sR83ku8ez3lUNgU) <toomasv>:
@GiuseppeChillemi You *do* append it, just on top of `x` :) Give it a different place.

[7:26:57](#qI9DWISTrRMxbBBBWaAHuViGeILAW22kiVghg-Stc8s) <toomasv>:
* @GiuseppeChillemi You *do* append it, just on top of `x` ;). Give it a different place.

[7:30:45](#g2_Csehr_lwnpezjz9ltooi642Rq1PVyciK4qO9tKeY) <toomasv>:
* @GiuseppeChillemi You *do* append it, just on top of `x` ;). Give it a different offset.

[20:41:27](#MDEhZoGCjqO9twUrc6vc-gQwqWb2Aektp4WSxpz9CC8) <GiuseppeChillemi (GiuseppeChillemi)>:
Ops, this is the reason why I was not finding it! I have sent to the wrong group! 

## 21-Dec-2022

[8:11:37](#2yb_sAVvw2b5AWBbp0TN3Dixf34RZWjLhG6VF4fj2v4) <bubnenkoff (Dmitry Bubnenkov)>:
Ops, this is the reason why I was not finding it! I have sent to the wrong group! 

[8:31:54](#6ttxtbe5oJbUngfiP9k99hrXEcP4B_z_FggYr_NigpY) <bubnenkoff (Dmitry Bubnenkov)>:
Ops, this is the reason why I was not finding it! I have sent to the wrong group! 

[8:34:53](#OZL7rv1mzclkaINGmaYReZBWf3fgN86GM2V13TqpEKY) <bubnenkoff (Dmitry Bubnenkov)>:
```
flag: true
parse "foo" [ 
	some [
		"fo"
		(print "test")
		if (flag) break 	
		(print "here")

		]  
	]
```
is it good solution?


[8:35:15](#HVbu8P-4-9tzrhTfPArxyMNVLGEMpGvxWIACHC89T_c) <bubnenkoff (Dmitry Bubnenkov)>:
I want to stop parsing at getting some flag. What is the correct way to exit from it?

[8:35:33](#luMeR7bInPLgGLygZNEJdh8uD-Ow-cIb0VUO82r2Xn4) <bubnenkoff (Dmitry Bubnenkov)>:
* I want to stop parsing at getting some flag. is it good solution?

[8:35:42](#LHHaaQWT7GA0MYca0i9S7WG2QUWvC8-yRG_vWm_ecAU) <bubnenkoff (Dmitry Bubnenkov)>:
* ```
flag: true
parse "foo" [ 
	some [
		"fo"
		(print "test")
		if (flag) break 	
		(print "here")

		]  
	]
```



[9:12:42](#a-YH9XegaA6FGr_P0dq4TpIjttysM7CCkdzEYosxZOo) <bubnenkoff (Dmitry Bubnenkov)>:
strange that even with `flag: false` same behavior: 
```
flag: false
parse "foo" [ 
    some [
        "fo"
        (print "test")
        if (flag) break     
        (print "here") ; not printing

        ]  
    ]
```

[16:25:14](#3EgCYnTk0n9aVRnlYRSEDEZo_vqFqgecmG3T7wIHwuc) <hiiamboris (NOT THIS ONE)>:
Do you want to stop `some` loop or terminate all parsing?

[16:25:51](#M3z7gP0kRVg-cZobNgU7qbD_7KkHv3xg81eOxTa-PQA) <hiiamboris (NOT THIS ONE)>:
If latter, the only solution is either `return` from a function or `break` from the loop or `throw` into catch.

[16:27:08](#iC1Rp7CY60IbTjgvR6Ztbej0_j-H5FQjjKzW3tGUd0A) <hiiamboris (NOT THIS ONE)>:
```
loop 1 [
	parse "foo" [ 
	    some [
	        "fo"
	        (print "test")
	    	(if flag [break])     
	        (print "here") ; not printing
	
	        ]  
    ]
]
```

## 25-Dec-2022

[3:52:10](#fqq1yJ2H_OMDBuAyqYwZG_dgwzDzAM7Z4S0u2u9cbIQ) <WayneCui (WayneCui)>:
Hello guys, some binary! data, 6-7 (0022) is the length of bytes I need to get to get a string, how can I do it in PARSE?
the result is `com.caucho.hessian.test.TestObject`, corresponding `#{636F6D2E63617563686F2E6865737369616E2E746573742E546573744F626A656374} `


[3:52:53](#SLy_ZUE5kDvDt9f6GChIVKYmhW3I3H-LQAVdcuZVFT0) <WayneCui (WayneCui)>:
```
;4D = 'M'
;74 = 't'
;7A = 'z'
data: #{7201004D740022636F6D2E63617563686F2E6865737369616E2E746573742E546573744F626A6563745300065F76616C756549000000007A7A}
 
probe collect [
    probe parse data [
        thru #{720100} thru "M"
        opt [
            thru "t" [
                ; copy len skip 4 (keep to integer! len)
            ]
        ]
        to end
    ]
]
```


[3:56:32](#JfYizx4VJ3R2FB78NqbfCgHadUdkCNsztPQzzUO5zQ4) <WayneCui (WayneCui)>:
How can express copy or set 2 bytes to a word! ?

[3:56:55](#SJVkNdCNXhQSo6l-jPAHCfaMEIIrk_RjJ_ww15i1yKc) <WayneCui (WayneCui)>:
* How can I express copy or set 2 bytes to a word! ?

[3:58:11](#3ctmiJakjMrM9DfxH_GKNHk3kNd6WL8RuEKWVe4h8YY) <WayneCui (WayneCui)>:
* Hello guys, some binary! data, 6-7 (0022) is the length of bytes (length is two bytes) I need to get to get a string, how can I do it in PARSE?
the result is `com.caucho.hessian.test.TestObject`, corresponding `#{636F6D2E63617563686F2E6865737369616E2E746573742E546573744F626A656374} `


[4:11:48](#ioiLLw-JLZQmg6XDcMPwlni101MEy8x8902h5ka5LJ8) <WayneCui (WayneCui)>:
Make it! Just  `2 skip` instead of `skip 2`

[4:11:59](#PVM0KJaYmgjsos9rQ0TtNlf7Q22XU_HxFVr2r_a-xrQ) <WayneCui (WayneCui)>:
```
data: #{7201004D740022636F6D2E63617563686F2E6865737369616E2E746573742E546573744F626A6563745300065F76616C756549000000007A7A}
 
probe parse data [
    thru #{720100} thru "M"
        opt [
            thru "t" [
                copy len 2 skip (n: to-integer len) copy class-name n skip (probe to-string class-name)
            ]
        ]   
]
```


[4:37:34](#gCY9CJ9T6ZGV2JGbe63sgZ0_CO0I1mHZi9n1AI3FBk8) <greggirwin (Gregg Irwin)>:
:+1:

## 26-Feb-2023

[18:12:53](#fFV4i2NrdW9Cbxw3bRzW3XS4skUMBfF_nyShkOkkktk) <bubnenkoff (Dmitry Bubnenkov)>:
```
>> rejoin parse {<ns2:foo>} [ collect [ keep "<" keep opt to sp to keep [{/>} | #">"]  ] ]
== "<>"
```
old behavior: 
```
>> rejoin parse {<ns2:foo>} [ collect [ keep "<" keep opt to sp to keep [{/>} | #">"]  ] ]
== "<ns2:foo>"
````
it seems that last commit had change behavior of parsing and the old one is seems for me more correct 

[18:16:33](#kGIRdYSGYCMzCCBX_t_yf1OYDe4xS4G9OoU9SljBkXc) <gurzgri>:
Just fix your parse rule: 
```Red
>> rejoin parse {<ns2:foo>} [ collect [ keep "<" keep opt to sp keep thru [{/>} | #">"]  ] ]
== "<ns2:foo>"
```

[18:19:13](#9WvUzFIrfTBsTYIW100KPr5gSxvxD28k2GZ8k3eqSlc) <bubnenkoff (Dmitry Bubnenkov)>:
thanks!

[18:23:08](#sT5gvu--HstEZU9b7fsu79w5HISPjmp-UHZTqCCwoMk) <bubnenkoff (Dmitry Bubnenkov)>:
yes, now it's works!

[18:47:28](#qvRc8qqQj-GsoYqEr1uKJraxcPUSXrmzFpQFcHAFX5E) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Do you want to keep only the element name without any attributes? Then the following is probably more suited:
```Red
>> rejoin parse {<ns2:foo test="a">} [ collect [ keep "<" keep some [not sp skip] to keep [{/>} | #">"]  ] ]
== "<ns2:foo>"
>> rejoin parse {<ns2:foo>} [ collect [ keep "<" keep some [not sp skip] to keep [{/>} | #">"]  ] ]
== "<ns2:foo>"
``` 

## 27-Feb-2023

[7:45:12](#rf2r5ODOIs36P5fOgYPaaCp5nc89qh2l5TwxWRqfCSE) <bubnenkoff (Dmitry Bubnenkov)>:
thanks!

## 3-Mar-2023

[11:06:36](#C9HXaf2mQFzLD9edaeqE5YL2al2TRCeGGz5s1FlGFTg) <bubnenkoff (Dmitry Bubnenkov)>:
I need to extract zip code. It have 5 digits.
How to check if number if digits ahead?
```
parse "1501 Page Mill Road Palo Alto, CA 94304 Framingham, USA" 
```

[11:32:05](#07EBOE1KWs42vje9T2_i8QFTJ322-DmTKoo8uGB53l8) <bubnenkoff (Dmitry Bubnenkov)>:
I have only one idea:
```
digit: charset "0123456789"
parse "1501 Page Mill Road Palo Alto, CA 94304 Framingham, USA" [ 
    collect [ to digit keep copy _ some digit if ( (length? _) <= 5 _ = none) | skip  ] 
    ]
```
But it's do not work...

[11:36:06](#pWguie5Dfig-hTYNr3GTSGIJcCBVJMu1-g_mwwFVN3Q) <rebolek (Boleslav B≈ôezovsk√Ω)>:
```
>> number: charset "0123456789"
== make bitset! #{000000000000FFC0}
>> parse "1501 Page Mill Road Palo Alto, CA 94304 Framingham, USA" [some [copy zip 5 number | skip]]
== true
>> zip
== "94304"
```

[11:48:38](#O6z1n4qbCMG5SC_0aw0upfVJ3X9Lqwxz5kPHp6C5YP0) <bubnenkoff (Dmitry Bubnenkov)>:
Perfect! Thanks!

## 7-Mar-2023

[13:45:18](#6WlvE8D48CR4LYUveXQAYv2DxehQCcnhjuPbUZE6Css) <hiiamboris>:
I'm trying to match an integer found in one block, in another block:
```
parse [3] [set n integer!]
parse [3] [set n2 integer! if (n = n2)]
```
Is this ugly way the only way?

[14:18:30](#BBvgXgoScrsms0K0CLi3upQviGCISzgELlXM0XkyJ1Y) <gurzgri>:
Being on mobile, thinking out loud: can you build reduce/compose a new rule match `reduce [1 1 n]`

[14:32:16](#2VYgaPVZR7W00bczbavFkvqVOlkJy2d3d80M482X60k) <hiiamboris>:
nope ):
```
>> parse [3] [1 1 n]
*** Script Error: PARSE - invalid rule or usage of rule: 3
*** Where: parse
*** Near : parse [3] [1 1 n]
*** Stack:  

>> parse [3] [1 1 3]
*** Script Error: PARSE - invalid rule or usage of rule: 3
*** Where: parse
*** Near : parse [3] [1 1 3]
*** Stack:  
```

[14:32:59](#XflYG3uPbkNxDabXpy7lMht3lDyg7i0EWXH12J9eouE) <hiiamboris>:
ok I can compose it as `[quote (n)]`

[14:33:59](#FgaYWGbK7d70sSzSJj2GMS0AyKgRSd4erUOmBYWAUiE) <hiiamboris>:
thanks

[16:22:28](#DpJagP6weSgAM2UExeSI3VQC6BAg5pKV0IcKXCgz550) <hiiamboris>:
same happens to
```
parse [abc] [set word word!]
parse [abc] compose [quote (word)]
```
parse really makes it hard to match any literal data in blocks

[16:58:55](#j1Zo-h7lcyHG_FFaQrcA0hOzjLGxTdza8bieFTFYwFo) <gurzgri>:
Indeed. And in the evolutions `parse` has seen from R2 over R3 to Red, I'm constantly struggling with unlearning obsolete knowledge of older `parse` in order to free some mental capacity for learning the new tricks.
Btw, what I had in mind more like building the dynamic rule on the fly in the first `parse` run and then use this rule in the second run (instead of building the rules after the first run): 
```Red
parse [abc] [copy rule word! (insert rule 'quote)]
parse [abc] rule
```
But hey, I guess your's is just a minimal example.

[17:10:54](#KSdSK2rbzQoI0CN2VQvltlHHa2Sb-iryAaAcMgUhtoE) <hiiamboris>:
Yeah, but in my case it was even simpler to compose it afterwards.

[17:19:54](#Ej-C4jdNMwGgTGcCI9xBkybaonBYyJ9ayBlJ9EbYYTg) <greggirwin (Gregg Irwin)>:
`Quote` makes all the difference. I have old helpers for matching literal numbers in R2, and it had to use the `1 1 <n>]` trick.

## 13-Mar-2023

[13:45:30](#DCSPfSIdNjwxeHu3v91OJ6BolufI4FHHsUzH7QvCIls) <hiiamboris>:
the moment when excess of smarts in parse is getting ridiculous :)
```
>> parse [a 1 2 a 3] [to set w word! any [w | not word! skip]]
*** Script Error: PARSE - invalid rule or usage of rule: a
*** Where: parse
*** Near : parse [a 1 2 a 3] [to set w word! any [w ]]
*** Stack:  

>> parse [a 1 2 a 3] [to set w word! (w: compose [quote (w)]) any [w | not word! skip]]
== true
```

[13:46:32](#4WTNoWb1Yr8U4GPuklO1Fmn7OUYo18nUR4QAts1HS2Q) <hiiamboris>:
(I just need to ensure that block contains no mixed commands)

[13:47:19](#bZwhqxu2UMBkwJtsrZXWxX6PEvDDsuhzpUBRCKJmt48) <hiiamboris>:
* the moment when excess of smarts in parse is getting ridiculous :)
```
;) how I wrote it initially
>> parse [a 1 2 a 3] [to set w word! any [w | not word! skip]]
*** Script Error: PARSE - invalid rule or usage of rule: a
*** Where: parse
*** Near : parse [a 1 2 a 3] [to set w word! any [w ]]
*** Stack:  

;) how I had to write it correctly
>> parse [a 1 2 a 3] [to set w word! (w: compose [quote (w)]) any [w | not word! skip]]
== true
>> parse [a 1 2 a 3 b] [to set w word! (w: compose [quote (w)]) any [w | not word! skip]]
== false
```

[14:42:12](#ilH0t2Enow-yNqFBclFW5UcHyIXR_N4-RcQ6cLjgaJQ) <toomasv>:
Could also use `(w: to lit-word! w)`

[15:03:22](#2SqIraSIOKuMM0iQJnAGgIIltFNoTv5uh36Vuzk1OUM) <hiiamboris>:
agreed, in this particular case would be simpler

## 14-Mar-2023

[8:33:59](#gwoDnrtwjwFh-X0EjROs8wee8z-jOuciLTebA3Ovecs) <rebolek (Boleslav B≈ôezovsk√Ω)>:
> <@toomasv-58e74c67d73408ce4f56bd1f:gitter.im> Could also use `(w: to lit-word! w)`

that's the proper way

## 30-Mar-2023

[9:58:25](#5t799JBFH00x6-Uwhbine_R2AwR55ZrZzyJkW9hIbvE) <bubnenkoff (Dmitry Bubnenkov)>:
Could anybody help me with rule? I need to remove namespaces from tag.
The rule had work with basic cases but had stuck with comples:
```
remove-ns-from-tag: function [tag-name] [
	only-tag-name: rejoin parse tag-name [ collect [ keep "<" opt keep "/"  opt [thru ":"] keep to end ] ] 
	return only-tag-name
]


remove-ns-from-tag {<ns2:registrationKO">}

remove-ns-from-tag {<registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
```
`xsi:` and `xmlns:` should be removed 

[9:58:33](#5YWWi8TfO3rz24FAjEsTpUDTMC8mOQyTBhIuJVXFTUs) <bubnenkoff (Dmitry Bubnenkov)>:
 * Could anybody help me with rule? I need to remove namespaces from tag.
The rule had work with basic cases but had stuck with comples:

```
remove-ns-from-tag: function [tag-name] [
	only-tag-name: rejoin parse tag-name [ collect [ keep "<" opt keep "/"  opt [thru ":"] keep to end ] ] 
	return only-tag-name
]

remove-ns-from-tag {<ns2:registrationKO">}

remove-ns-from-tag {<registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
```

`xsi:` and `xmlns:` should be removed

[10:14:36](#bmRHsbypeLceANTORBIExfmEiLjBAa-hCQHYDzkdLMU) <hiiamboris>:
use `remove` Parse keyword

[10:20:31](#0_DSO9tS88xPbKGNLrINi60df_CFYlEYnkyJGUgzSP0) <bubnenkoff (Dmitry Bubnenkov)>:
```
data: {<registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
parse data [some [thru sp remove thru ":"] ]
data
```

But how to handle?
```
data: {<ns2:registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
parse data [some [thru sp remove thru ":"] ]
data
```

[10:21:00](#gNxqpn7BRCXrkhCIjVipkg0YAsC1EfC47lKO2RuFdqI) <bubnenkoff (Dmitry Bubnenkov)>:
 * ```
data: {<registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
parse data [some [thru sp remove thru ":"] ]
data
{<registrationKO type="zfcs_organizationInfoType" xsi="http://www.w3.org/2001/XMLSchema-instance">}
```

But how to handle?

```
data: {<ns2:registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
parse data [some [thru sp remove thru ":"] ]
data
```

[10:21:15](#KKRtO6VFTy-Z3D_HkthfcdG8IVaU2c7UJ3NlxoxDzGg) <bubnenkoff (Dmitry Bubnenkov)>:
 * ```
data: {<registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
parse data [some [thru sp remove thru ":"] ]
data
{<registrationKO type="zfcs_organizationInfoType" xsi="http://www.w3.org/2001/XMLSchema-instance">}
```

But how to handle next case?

```
data: {<ns2:registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
parse data [some [thru sp remove thru ":"] ]
data
```

[10:27:35](#6c5jq5439eX3t5QrtblkfLnOVK9PAXJ8Lq_cZQAZq5M) <hiiamboris>:
with `any`

[10:29:14](#qVuRC8J3DkGufJKX49QAn4GU2olv1TnVgruVth8a1k4) <hiiamboris>:
* with `any` or `some` like you're doing, just figure out what should be removed and what shouldn't

[10:31:14](#aNxTBB00nhhOpycFFuDdZu7zL_JqO6nfGjYj67rgXPk) <hiiamboris>:
do you want to get rid only of `ns2:` `xsi:` and `xmlns:` or there's more junk to expect?

[10:33:57](#wRp9e-A0O4DBBXb2qpmf7iilAxWLSNMQ9GrK6jxGLgg) <bubnenkoff (Dmitry Bubnenkov)>:
> <@hiiamboris:tchncs.de> do you want to get rid only of `ns2:` `xsi:` and `xmlns:` or there's more junk to expect?

At current step just them

[10:46:44](#JV5dGL7V42nybw_aqW3EzFX-YK5xFBqhdg8v9wM7Uho) <bubnenkoff (Dmitry Bubnenkov)>:
hm...
```

data: {<ns2:registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
rejoin parse data  [collect [ keep "<" some [ thru ":" keep to [sp | ">" | "/>"] ] ] ]
```
output is almost like what I need. Just issue with spaces....:
```
{<registrationKOtype="zfcs_organizationInfoType"xsi="http://www.w3.org/2001/XMLSchema-instance"}
```

[10:49:41](#YpdLEUHCt7UO4LG9tTGJEk8sDEZ3M0m7E2NS9dRiOV4) <bubnenkoff (Dmitry Bubnenkov)>:
Bingo?
```
data: {<ns2:registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
rejoin parse data  [collect [ keep "<" some [ thru ":" keep thru [sp | ">" | "/>"] ] ] ]
== {<registrationKO type="zfcs_organizationInfoType" xsi="http://www.w3.org/2001/XMLSchema-instance">}
```


[11:00:42](#utx4MgxlFu-RGKiQuglZn2JIZzGFql44pF_ctzcgmGk) <bubnenkoff (Dmitry Bubnenkov)>:
hah... now work if no first `ns`:
```
data: {<registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
rejoin parse data  [collect [ keep "<" some [ thru ":" keep thru [sp | ">" | "/>"] ] ] ]
== {<type="zfcs_organizationInfoType" xsi="http://www.w3.org/2001/XMLSchema-instance">}
```

[11:06:28](#viKIravgwiBeY5_ikzjgcEd5ElIAMYp-ga1sEfuKBZM) <bubnenkoff (Dmitry Bubnenkov)>:
 * hah... not work if no first `ns`:

```
data: {<registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
rejoin parse data  [collect [ keep "<" some [ thru ":" keep thru [sp | ">" | "/>"] ] ] ]
== {<type="zfcs_organizationInfoType" xsi="http://www.w3.org/2001/XMLSchema-instance">}
```

[11:29:19](#7THuPqn1u3b4KeeHoeyjNGOb7jVbQTZwF1k87RZbHAo) <hiiamboris>:
then I would simply `remove` `"xsi:"` and other variants I don't need

[11:29:32](#QKNchmc0y-kb8i5FycIL_OydR7SqMJkGqsW6cZLKl2A) <hiiamboris>:
it can even be done with `replace` or `remove find`

[11:31:59](#frjE8zIf5CUqkxsfrf6Zmg2o6kmuA_pU8a4q0Ykr9qk) <bubnenkoff (Dmitry Bubnenkov)>:
I need univesal solution...

[11:39:38](#wQceSPPpl63ZMS3leM8yjw988aKRUTzLpJsi6qAG1Qk) <hiiamboris>:
skip the name if it has no colon

[11:51:41](#53rZCI46P7pwF0LALDR6KtyekKfM5A07yKXld8XqKdA) <bubnenkoff (Dmitry Bubnenkov)>:
It seems that I need help from toomasv 
I can't write working rule...

[12:09:37](#-3gvjBdRYxBYlRpUx6u4SMxFiPlrlDBz0Z3YdIrhnws) <hiiamboris>:
can you write a rule just for skipping the tag name?

[12:20:56](#sKXyDzs-nKRn2WdmKV4IyEV4aAPhZMpVGI8jm7H45AI) <toomasv>:
bubnenkoff (Dmitry Bubnenkov): :)
Does this work generally?
```
data: {<ns2:registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
;== {<ns2:registrationKO xsi:type="zfcs_organizationInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">}
parse d: copy data [any [thru start s: some [not skp skip] #":" :s remove thru #":"]] d
;== {<registrationKO type="zfcs_organizationInfoType" xsi="http://www.w3.org/2001/XMLSchema-instance">}
```

[12:21:54](#5vjsSbU6Y1lIJ1iNdYprpSqE2w0qkSrFPKZYBSJ7zWk) <toomasv>:
```
start: charset "< "
start: charset "< "
```

[12:22:21](#H3GtdDapunwdMYUtaOAvVGMKw74bpoJJHuTN3FfIc8Y) <toomasv>:
 * ```
start: charset "< "
skp: charset { "=:}
```

[12:28:45](#oMriOFw6StroP-CA5UmvkGrB-HHiSnpmS0WcPP0Ia7I) <bubnenkoff (Dmitry Bubnenkov)>:
toomasv: thanks!! I need some time for testing but it seems that it work

[12:29:02](#zu31GPeso8ahCgP4crpMMgJBo-IJ_fQrRz0NqOZnJ5A) <toomasv>:
Ì†ΩÌ±çÔ∏è

[12:59:44](#Gjz-myhS-IIJow8zd2x-T1E_CgUaXLUey9qXyTYwh3g) <bubnenkoff (Dmitry Bubnenkov)>:
toomasv: how to save slash here?
```
start: charset "< "
skp: charset { "=:}
data: {</ns2:registrationKO>}
parse data2: copy data [any [thru start s: some [not skp skip] #":" :s remove thru #":"]] 
data2

```

[13:00:11](#fptD7_yZbREXocsNwBJiC_ASUW6ELXDwVY5qClbjw0c) <bubnenkoff (Dmitry Bubnenkov)>:
 * toomasv: how to save slash here?

```
start: charset "< "
skp: charset { "=:}
data: {</ns2:registrationKO>}
parse data2: copy data [any [thru start s: some [not skp skip] #":" :s remove thru #":"]] 
data2
```

out: `"<registrationKO>"`

[13:09:47](#HrDboeJBriMqv8QsQC3uAKvHV_yuNKgUZccEgOu5YV4) <bubnenkoff (Dmitry Bubnenkov)>:
and I can't understand why is space at the end here:
```
start: charset "< "
```

[13:44:27](#5AcKuAS6YVxcA3_fddM8pJpFiTrEP_zGYIRYPnqEJY0) <toomasv>:
bubnenkoff (Dmitry Bubnenkov): add `/` to `start`. Why do you think space might be there?

[13:45:55](#RRnGtgBrNZUkA3v2wYPTnCP-B9KAXaJB-afOwq2Dg9Q) <toomasv>:
Ah, you mean why is it in the end not in the beginning? Order is not important.

[13:46:39](#aEdNr4_vDQCrwx9FBnlupLHxj6E5DBnrSEozMUqNLkY) <toomasv>:
 * Ah, you mean why is it in the end not in the beginning? Order is not important. 

[13:49:49](#IXytiBY0fnyJBzurVPqkiPEPF-aJvh-S3sRoloJ0DWI) <bubnenkoff (Dmitry Bubnenkov)>:
```

start: charset "</"
skp: charset { "=:}
data: {</ns2:registrationKO>}
parse data2: copy data [any [thru [start | start2] s: some [not skp skip] #":" :s remove thru #":"]] 
data2

```

Not working...

[13:50:09](#GrbYvLxJDswWFvpXzAl-wS7aFZubolraEDndIUKQ_uY) <toomasv>:
Yes, wait a second...

[13:50:11](#rm_E8CgIWYQ1IAPXQUSq-IF_Izshhkab-uzKyXGO2jc) <bubnenkoff (Dmitry Bubnenkov)>:
```
"<registrationKO>"
```
should be:
```
"</registrationKO>"
```

[13:51:46](#ZBmllIWg9F2oCVEdAMWH8zaPXVjX0gPYjOb3jMGfMX4) <toomasv>:
```
"<registrationKO>"
```
should be:
```
"</registrationKO>"
```

[13:58:36](#48lD_S9TZpr81vLv_dYKWn8QrE4uveJbHju1hTkDFZ8) <toomasv>:
Hm, this should do?
```
start: ["</" | { } | "<"]
skp: skp: charset { "=:}
```

[13:58:55](#Mf-gmAiXFHSfClKdWRzjc_XbY2k0J00YvFlRn7F_RNE) <toomasv>:
 * Hm, this should do?

```
start: ["</" | { } | "<"]
skp: charset { "=:}
```

[14:02:04](#ztgqWKKovv-257UfwC7odsAhsWnDSPj7ILxJIufuywE) <hiiamboris>:
why not use XML codec?

[14:34:16](#jGoF8TKmzwoa3FRaaSjxD9hIpkUz-09oyEHvwTKNXKg) <bubnenkoff (Dmitry Bubnenkov)>:
It's too late to start with it... I have solurion that need bug fix

[16:12:48](#ulIraSnUbtbCQStBhgSUugOPBasNWYzRF_7f7AOPFSA) <hiiamboris>:
your solution will work until you get strings that contain space or colon

[16:13:16](#Yn6DC1uJL9Mpk0Ak0_q8Sza8_9NpLNIzUajgvjvUOO8) <hiiamboris>:
* your solution will work until you get strings (inside the tag) that contain space or colon

[17:40:42](#7a8yBXPCiCYbulmiirA7UJGYozdLbBgeFSpIoe2htF4) <bubnenkoff (Dmitry Bubnenkov)>:
> your solution will work until you get strings (inside the tag) that contain space or colon

Could you show an example

[17:57:36](#ooWKF3tMASe-WJkoayfRvb4cfifjEEYkXfTWd9rbq0g) <hiiamboris>:
e.g. `{<tag name="a b:c" ns2:registrationKO xsi:type="zfcs_organizationInfoType">}`

[18:32:32](#dfWoi08BtiTyR9_GXB0KrhbsoIGOezS9RUWKnmXHwBQ) <hiiamboris>:
* e.g. `{<tag name="a b:c" xsi:type="zfcs_organizationInfoType">}`

[19:31:53](#A16-U3JufXud2-ik6ZYF1RoZhpqXzg-2E5r3KQ07nJI) <toomasv>:
I'm sure there are many more caveats, although this one is easy.
```
parse d: copy data [any [start s: some [not skp skip] #":" :s remove thru #":" | {"} thru {"} | skip]] d
```


[19:51:46](#x_Kp7_B51cw3u39-dikElHyTYnZmQY918Q3Iqqn-VeA) <hiiamboris>:
and then single quotes and then escaped quotes ... ;)

[19:53:33](#sBJugo2Bk0sf61CXU4MgUab_33AB7v8xLjy88AyRdGQ) <hiiamboris>:
you can use offsets with `remove` btw:
```
>> parse s: "abcd" [skip p: 2 skip remove p] s
== "ad"
```

## 31-Mar-2023

[3:10:01](#P4tAnKbbpYlg46tw-dTHPcd4rCYJb8L2hIs6jL9qmq0) <toomasv>:
Yeah, I guess it depends whether you are developing a general library that should cope with any imaginable data thrown at it or you are writing a one-off solution for specific problem and data at hand.

[3:15:49](#Bb1M-plJD5dAySzDBXatgzFfhHBKfnna3hT5ZOg7WR8) <toomasv>:
Good to know about the `remove <offset>`, thanks!

[11:09:16](#9buydl5zIu9t9IToCdyfpFl6XsjC7OT1uWbrlcUfnno) <Oldes (@oldes.h:matrix.org)>:
Interesting... but it is not working correctly with a forward index:
```red
>> parse s: "abcd" [skip (p: tail s) remove p]
== true ;== reports that it is handled
>> s
== "abcd" ;== but the result should be just "a"
```

[11:33:47](#0Gva3or3prcLd-b-h25Y5-evuyvo_PUevRbuXNQAg-8) <hiiamboris>:
known bug

[11:34:55](#WC5GXeqbPWFbnE0k_fqy75NbtYolXevMFPMa5_RqTjk) <hiiamboris>:
https://github.com/red/red/issues/4199

## 3-Jun-2023

[18:40:01](#lW-S8z5AuW258vk-nRXi9SrTRH14B5jR74JMQVPYsqg) <GiuseppeChillemi (GiuseppeChillemi)>:
Hi,
  I am experimenting with a way to have specs for fields of records.

I am attempting to use parse to get field name and records and return the last end-of-record position but I am not able to get the block positioned at it:

```
proto-record: [
	col1: copy "" [datatype: string!]
	col2: 0 [datatype: integer!]
	col3: copy "Hello" [datatype: string!]
]

columns: context [
	name: specs: none
]

get-specs: function [
	proto [block!]
	/local
	col-name
	col-specs
	last-pos
] [
	parse proto [some [set col-name set-word! break | skip] some [set col-specs block! break | skip]  ]
	probe reduce [col-name col-specs]
	probe last-pos
]

get-specs proto-record
```

last-pos should be after the first block but I don't understant why it isn't



[18:40:14](#g9tmjvtiS1DxzQbbz2YYKGBVRPq8gl0MbF_hbSXmIw0) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Hi,
I am experimenting with a way to have specs for fields of records.

I am attempting to use parse to get field name and records and return the last end-of-record position but I am not able to get the block positioned at it:

```
proto-record: [
	col1: copy "" [datatype: string!]
	col2: 0 [datatype: integer!]
	col3: copy "Hello" [datatype: string!]
]

get-specs: function [
	proto [block!]
	/local
	col-name
	col-specs
	last-pos
] [
	parse proto [some [set col-name set-word! break | skip] some [set col-specs block! break | skip]  ]
	probe reduce [col-name col-specs]
	probe last-pos
]

get-specs proto-record
```

last-pos should be after the first block but I don't understant why it isn't

[18:40:55](#Brdgp9I6yScK784e8ZYtvp4H9WTDYG92urvBWhsTLmY) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Hi,
I am experimenting with a way to have specs for fields of records.

I am attempting to use parse to get field name and records and return the last end-of-record position but I am not able to get the block positioned at it:

```
proto-record: [
	col1: copy "" [datatype: string!]
	col2: 0 [datatype: integer!]
	col3: copy "Hello" [datatype: string!]
]

get-specs: func [
	proto [block!]
	/local
	col-name
	col-specs
	last-pos
] [
	parse proto [some [set col-name set-word! break | skip] some [set col-specs block! break | skip]  ]
	probe reduce [col-name col-specs]
	probe last-pos
]

get-specs proto-record
```

last-pos should be after the first block but I don't understant why it isn't

[18:42:56](#Is_dSft0uGmNyA1eBGVzeeMaTyD2ciVu5sUYT5gzUDo) <GiuseppeChillemi (GiuseppeChillemi)>:
The result is:

```
[col1: [datatype: string!]]
none
```
I expect last-pos to be `col2: 0 [datatype: integer!]....` instead of `none` 

[18:43:43](#2d6XA7xR1Zd3niS8c0Upp03GXKO-IPvYHigxyTjuIUc) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Well

[18:44:04](#8ZX8CgTqSR01Tv9wS0C27DjKNUwan2euBLUyStVoRW0) <GiuseppeChillemi (GiuseppeChillemi)>:
On e moment, I have forgotten `last-pos`

[18:44:10](#QQxgkobMWiLlFrbIcOFsFP-gNvmvRxlx1HqbOGClXQo) <rebolek (Boleslav B≈ôezovsk√Ω)>:
yes

[18:44:35](#UsCWXkMw1ikcVDoGUYkF4WyAjuJjoKFpYvEzPxbmaeA) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Hi,
I am experimenting with a way to have specs for fields of records.

I am attempting to use parse to get field name and records and return the last end-of-record position but I am not able to get the block positioned at it:

```
proto-record: [
	col1: copy "" [datatype: string!]
	col2: 0 [datatype: integer!]
	col3: copy "Hello" [datatype: string!]
]

get-specs: func [
	proto [block!]
	/local
	col-name
	col-specs
	last-pos
] [
	parse proto [some [set col-name set-word! break | skip] some [set col-specs block! break | skip] last-pos: ]
	probe reduce [col-name col-specs]
	probe last-pos
]

get-specs proto-record
```

last-pos should be after the first block but I don't understant why it isn't

[18:44:45](#GXmsa75HXl0qfySj3W3C_q-QpYIYmo-Q1KQYJrs31Vo) <GiuseppeChillemi (GiuseppeChillemi)>:
Added it.

[18:44:55](#IKsKd0hF28oKkvSZY-OD1FddZ9LFynv9uEbDY98TwV4) <GiuseppeChillemi (GiuseppeChillemi)>:
In this way, it does not work

[18:47:44](#5Gq6HI6OBZ2L_cYWSiJqH1C95ecvUx95LUrhApUAYKk) <GiuseppeChillemi (GiuseppeChillemi)>:
 * One moment, I have forgotten `last-pos`

[18:52:31](#kWXIzgkgLg_qPrKfLWjgvgvxbHNUx60pNlGGxVxXUjo) <hiiamboris>:
works fine for me

[18:53:13](#tg_n702j0hpSP2_DihWe83DQaLMjSWRS0LdQuKPZVGg) <rebolek (Boleslav B≈ôezovsk√Ω)>:
This code works fine, unedited code had a problem

[19:25:50](#-KZuDQkJLV4ATj5HrSpPQY-7rL3vjOEjM6EJV1Ezgz8) <GiuseppeChillemi (GiuseppeChillemi)>:
Until a moment ago it didn't work. I should have ghosts somewhere.

## 10-Jun-2023

[21:09:30](#nyznOMtGjhPPO7SQC47hwGmBjynaum2P2asPV86aXeo) <GiuseppeChillemi (GiuseppeChillemi)>:
Is there a way to use parse to return the last block position without using any `set-word`?

[21:09:49](#XZ0JsJVSTB9QctbEaA-czpyvaiQpk3SMaHpvCGd9OvU) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Is there a way to use `parse` to return the last block position without using any `set-word`?

[21:10:07](#Q8T7rxh2R53Ro3h_hBDzvz0voK1htC-f5jyEmMAuijg) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Is there a way to use `parse` to return the last matched block position without using any `set-word`?

[21:10:13](#8rMBR3QaLMh6YzKWaQR5X4wwVyUuxDpT8qjSiBMojS8) <hiiamboris>:
no, but what's wrong with set-word?

[21:10:49](#x8Ggguzs8YtBT9eEViZ9pQMPhefahvvpgPUTS6vibgI) <GiuseppeChillemi (GiuseppeChillemi)>:
What happen if you use a set word which is also a keyword in the block?

[21:11:02](#-ol282s1H5c7h1HYu2Gb8q9kFTSow1xvkqVzl5at4Lo) <GiuseppeChillemi (GiuseppeChillemi)>:
 * What happen if you use a `set-word` which is also a keyword in the block?

[21:11:27](#sCJkfxrEt0KJCUBt2nJ44ZHkksqjuv46Rj4Ql2iurCY) <hiiamboris>:
doesn't matter, set-words are not matched against it

[21:11:56](#qgbEleKoQLcEd3XCF5LUHth1pXioVEnrqHzuh0TmTms) <GiuseppeChillemi (GiuseppeChillemi)>:
So, there is no interference?

[21:12:00](#qqAvgXcV_JooIlKY4zI_Lz8iC5fQ5FkZSI2Qm1CIiv4) <hiiamboris>:
no

[21:12:11](#cfoZFiu65IhoHB7TVVY5AyG15AIngzkbrbUsuK7P0fA) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you, very precious answer

[21:12:45](#EvgKLWNoYUG9ZHf-9SrETStXRROtAKBHUibOuOKcJr4) <hiiamboris>:
you need `quote set-word:` to perform a match instead, or match it by datatype

[21:14:37](#RxmxnChLsPEyj-rqz0v2gWco28rlP9WM3JeR8q5s2Zo) <GiuseppeChillemi (GiuseppeChillemi)>:
I would like to interrogate parse to have the last matched position without using set words but it also ok having them if there is no interference. It just complicates things a litte but gives also advantages

[21:14:46](#nx0t72Dq-CKF613zHKHPNlOYLIP2JcRiznvWuUYoh2Y) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I would like to interrogate `parse` to have the last matched position without using set words but it also ok having them if there is no interference. It just complicates things a litte but gives also advantages

[21:15:00](#w7qpERQ_YT3W_S8Qd0WfHbdq_ochywNpIynFAQ1Gsy8) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I would like to interrogate `parse` to have the last matched position without using `set-words` but it also ok having them if there is no interference. It just complicates things a litte but gives also advantages

[21:16:14](#h6HSNPiqxNfzKkP8ZR0noLc4P6oVGVxqNq45Q-gj7s4) <hiiamboris>:
I would note that "last matched position" is a tricky matter if you consider backtracking: some rule could even reach the end, then meet a rule that it can't match, and backtrack all the way back

[21:16:46](#83vRj8cSk7pCDedaXlZbqzCGwK8VEidDvf9zm2sjTys) <GiuseppeChillemi (GiuseppeChillemi)>:
The last successful match could be better.

[21:17:46](#pNCNOWbdhoZu253lcJaT7l4FhoLDTFctvahynfwVoNs) <GiuseppeChillemi (GiuseppeChillemi)>:
Then when parse breaks, it will return it or make it accessible in some way

[21:37:46](#w6gWp4mGDXlV7FQjnnNrn_FChe5iHvyPzXJc6yqNQak) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, the ideas is simple: use `parse` instead of mutiple find an `at skip` for linear positioning:

[21:38:45](#5rON7bTIC6Rlo1EnkUAF4YmuENKX4faCDNxpp3ALDTg) <GiuseppeChillemi (GiuseppeChillemi)>:
```
parse [a b c x [f g c s f e] z] [to block! into [to 'g  2 skip pos:]]
probe pos

= [s f e]
```


[21:39:32](#Clj4eVCmCkK995AEgBd3eBwIPiUX_VoLA7k7B3Es6Ak) <GiuseppeChillemi (GiuseppeChillemi)>:
`Parse` is a positioning system on steroids.

[21:40:23](#DKWvbs8uBFK_9kP2jyl53vzAtXQrnNHeObFctj57Q8w) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Ok, the ideas is simple: use `parse` instead of mutiple `find` and `at` `skip` for linear positioning:

[21:40:33](#Ji-FR1ISEO5HYmdNZhIfsvS8jG2mwJXx4spfn8Dz0iA) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Ok, the idea is simple: use `parse` instead of mutiple `find` and `at` `skip` for linear positioning:

[21:41:04](#a3f6jUXRv7ep-CaWaYwsMETM77zSUTs4peK8hNnqQzY) <GiuseppeChillemi (GiuseppeChillemi)>:
 * ```
parse [a b c x [f g c s f e] z] [to block! into [to 'g skip pos:]]
probe pos

= [s f e]
```

[21:41:39](#TAa59Ka5Ki8tJmS_kggriD9RWGKM5eTR4XK8jcaadxc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * ```
parse [a b c x [f g c s f e] z] [to block! into [to 'g 2 skip pos:]]
probe pos

= [s f e]
```

[21:45:15](#Xvcd440xg20smUUpBRq0izveaHEoWkL36172jBVOh8s) <GiuseppeChillemi (GiuseppeChillemi)>:
 * ```
parse [a b c x [f g c s f e] z] [to block! into [to 'g 2 skip pos:]]
probe pos

= [s f e]
```

It replaces: 

```
skip find pick find b block! 1 'g 2
```

And it is far more readable.

[21:45:30](#Z8kcWksmX29NtcSXG7hCxbyMmQkXD2M68YN02MgLbAw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * ```
parse [a b c x [f g c s f e] z] [to block! into [to 'g 2 skip pos:]]
probe pos

= [s f e]
```

It replaces:

```
skip find pick find b block! 1 'g 2
```

And the former is far more readable.

[21:46:29](#oZQBUl60r9HYzqcD-b9tIgFYtPEga6aQh1BspD5Dfdo) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Ok, the idea is simple: use `parse` instead of mutiple `find` and `at` `skip` `pick` for linear positioning:

[21:48:11](#EQ6g0pJDPPMq9GPCXRmmRUzB-bmQLajeF53I_X8dIKI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * ```
data: [a b c x [f g c s f e] z]
parse data [to block! into [to 'g 2 skip pos:]]
probe pos

= [s f e]
```

It replaces:

```
skip find pick find data block! 1 'g 2
```

And the former is far more readable.

[23:30:23](#29fKUZs6A3zrV5ncl-Gs5jH66g89aM0FB-eEJrfPUZg) <GiuseppeChillemi (GiuseppeChillemi)>:
If parse has a way to return the series at position without using a set word, it could replace `find`

[23:30:36](#FzDXvQHSuCmuMSiB_zqnaxGiOJa_LgYVnB0HVhH8Z0s) <GiuseppeChillemi (GiuseppeChillemi)>:
 * If parse would have a way to return the series at position without using a set word, it could replace `find`

[23:30:50](#z6v2cwHmpTkcQNOVv3qmRX5ufNwMy9daorVlXjH_amA) <GiuseppeChillemi (GiuseppeChillemi)>:
 * If parse would have a way to return the series at position without using a `set-word`, it could replace `find`

[23:31:48](#p2PzmmBdSCLo3T326ZGr0mhCApnCiGLkF4Oiw78lEYI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * If parse would have a way to return the series at position without using a `set-word`, it could replace `find` and everything else

[23:35:06](#B7iKZhb2BYEjdyJ0H4aef9ufpkmE8SzN0G-MWsWabjk) <GiuseppeChillemi (GiuseppeChillemi)>:
`parse/pos` and have it return a `series!` or `none`

[23:35:36](#DMWFlRB5CJO77KXt_AKZHmVKxjzef6FK2VO4hDCEegc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I am thinking about a `parse/pos` and have it return a `series!` or `none`

[23:35:48](#s4UwAe__zlrRwlWLdhVonaNjHOV_EbP2w7OmIj00i1M) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I am thinking about a `parse/pos` and have it return a `series!` at position or `none`

[23:36:32](#PxbjZh60zr8C5BMV43FrX4QVVtrOON8A9cgaFLOmEkM) <GiuseppeChillemi (GiuseppeChillemi)>:
greggirwin (Gregg Irwin): What about this?

[23:50:33](#6LKADISpPMaWRfWVOLdqmeiPzHZ_VJHeIkN347Cz6L0) <GiuseppeChillemi (GiuseppeChillemi)>:
 * If `parse` would have a way to return the series at position without using a `set-word`, it could replace `find` and everything else

## 11-Jun-2023

[8:32:18](#sXNzdHt9mYR7JzE3dho3rzBAZF2_UeSOGq-jpu2lg20) <hiiamboris>:
It's a one liner mezz to write

[10:41:16](#FWb6s0DSBxZ7acvaLDJiAflJPoR5TQ5jFTxDdn-OarY) <GiuseppeChillemi (GiuseppeChillemi)>:
 It could also be implemented as keyword like `return-pos`

[10:41:27](#PKFDuwsUIaY4ZVw_pjcDBiNc0LlzMSpUFdn1WzoszoA) <GiuseppeChillemi (GiuseppeChillemi)>:
 * It could also be implemented as a keyword like `return-pos`

[10:41:52](#MoqO8KxGMzzUyDP0A1ROjRjZpgL0k3jqqz6wzVpiXQk) <GiuseppeChillemi (GiuseppeChillemi)>:
 * It could also be implemented a keyword like `return-pos`

[16:50:22](#afaufDYxWNjpwUiZcKTVB7qon1zJiv9F7jdnh7eYwF0) <greggirwin (Gregg Irwin)>:
Write up a design spec, as I'm not clear on how it should work. Maybe Boris will write up his one liner. As he noted earlier, backtracking makes this tricky. Experiment with `parse/trace` and see if you can use that to design the behavior you want.

[17:49:21](#Lj_UE4Aic-sZhPGeboE0cejoYuLEks2O1lVc4az6hy4) <hiiamboris>:
one liner is `parse [opt rule pos:]` but I can only define it unambiguously for this simple case

[17:54:23](#vTxpkwGD_tjX-6Yui9FyxfQ9e_4xOC2AMYHEnJylcd4) <greggirwin (Gregg Irwin)>:
Right.

[17:57:07](#LYsi6WbNWRtNtoF1jDxzLpxPR2heo46nCqYmfQKYBr0) <greggirwin (Gregg Irwin)>:
That's basically what the JSON codec does.

[17:57:37](#X-qv8Fw2YireuksxiKCEdGdhU4JOjHdQbjnqYVUxWYM) <greggirwin (Gregg Irwin)>:
```
	json-value: [
		ws*
		[
			"true"    (emit true)  mark:			; Literals must be lowercase
			| "false" (emit false) mark:
			| "null"  (emit none)  mark:
			| json-object          mark:
			| json-array           mark:
			| string-literal (emit _str) mark:
			| copy _str numeric-literal (emit load _str) mark:	; Number
		]
		ws*
	]
```

[18:00:21](#F5ZLhiszBpOL6kJh0Cg4IGwXImcKn8PKurYUVd4lH18) <GiuseppeChillemi (GiuseppeChillemi)>:
There are 2 modes you can return a position: by searching, by moving.
By searching, you have multiple possibilities and you can backtrack. 
By moving: matching literal elements, moving from left to right and from top to bottom with `into`.




[18:00:32](#eot6tvwllTFaF25gv8wuHXROzyf1DHXGtEOk3HXQqEc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * There are 2 modes you can return a position: by searching, by moving.
By searching, you have multiple possibilities and you can backtrack.
By moving and matching literal elements, moving from left to right and from top to bottom with `into`.

[18:04:40](#emNNqlPDK9cpE-PFZZQ8LNNTCCkdljA7OuH4HYfQhEI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * There are 2 modes you can return a position: by searching, by moving and direct matching.
By searching, you have multiple possibilities and you can backtrack.
By moving and matching literal elements , moving from left to right and from top to bottom with `into`.

[18:05:17](#_HaPvaxzjH4eTTxXdILaHE1-4auYs5gXry2K_46FF3o) <GiuseppeChillemi (GiuseppeChillemi)>:
 * There are 2 modes you can return a position: by searching, by moving and direct matching.
1) By searching, you have multiple possibilities and you can backtrack.
2) By moving and matching literal elements and types, you move from left to right and from top to bottom with `into`.

[18:05:30](#_bftsZVSpSHPXmby1NL68ODp6A6qyuKXCQU-L4Fj_1o) <GiuseppeChillemi (GiuseppeChillemi)>:
(modified)

[18:16:16](#wKZnCM3pUu8tG-JeCpc5IwJt2sw7InTRQk_ctqjS5g4) <GiuseppeChillemi (GiuseppeChillemi)>:
With the second one, I suppose you do not backtrack. So if any backtracking corresponds to the end of input or isn't there a match it is a failure.


[18:17:02](#qHQiLwFN8qsu1cv-pIzbwIBR6Qdu8GquYnYPiO12y08) <GiuseppeChillemi (GiuseppeChillemi)>:
 * With the second one, I suppose you do not backtrack. So if any backtracking happens after a successfult match and vefore the end of input or isn't there a match it is a failure.


[18:17:16](#hB2N-pRg5QttIhT7vGOFQVC5SEirIjqsvc2S5sazp44) <GiuseppeChillemi (GiuseppeChillemi)>:
 * With the second one, I suppose you do not backtrack. So if any backtracking happens after a successfult match and before the end of input or isn't there a match it is a failure.


[18:20:07](#RDdnDspYZmDpAwiz0wcm3pJIpbvXYhfEsiPhCQ6iDnw) <GiuseppeChillemi (GiuseppeChillemi)>:
To implement the first one too, I see a `return-position` as the only possibility, if you do not find it you must have a return `none`

[18:21:48](#xA5DkpOCWrLJtOs05yiE-bHtBlQxAfR46WABMw0jI_A) <GiuseppeChillemi (GiuseppeChillemi)>:
 * To implement the first one too, I see a `return-position` as the only possibility, if you do not find it you must have a`return none`

[18:24:53](#YaIDuROKhyUJyseVCZSrx1BTbaUAs_NhmkyUcBEVw8g) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, now I have a better idea:

`parse/find` will return `none` on failure or the series is `return-position` is found.

[18:25:01](#3QXQjjTGWKxD9lkV4YcLaTzToZbSqF4stCw5KefRdNo) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Ok, now I have a better idea:

`parse/find` will return `none` on failure or the series if `return-position` is found.

[18:25:27](#AA9guiT0vOO_l7kMwTvfjNtqNQbl0Qf4Y0W6SF7gf7s) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Ok, now I have a better idea:

`parse/find` will return `none` on failure or the series if `return-position` keyword is encountered.

[18:26:27](#23rgYipweyULtVFsQQK5KAYZ8eFoUa5TJ6G11F6i4LE) <hiiamboris>:
maybe smth like this to measure parse's reach:
```
tracer: func [e m r i s /local p] [
	either p: find/same/only/skip reach head i 2 [
		if positive? offset? p/2 i [p/2: i] 
	][
		repend reach [head i i]
	]
	yes
]
reach: []
parse/trace [1 2 3 [4 5 6] 7 [8 [9]]] rule: [some [into rule | not [quote 8] skip]] :tracer
probe new-line/skip reach on 2
```
output:
```
[
    [1 2 3 [4 5 6] 7 [8 [9]]] [] 
    [4 5 6] [] 
    [8 [9]] [[9]]
]
```
but it's tricky too, since rule negation first matches then backtracks: 
```
>> parse/trace "aaaaabc" [not some "a"] func [e m r i s] [print mold reduce [e m r i]]
[push true [not some "a"] "aaaaabc"]
[fetch true [not some "a"] "aaaaabc"]
[push true [some "a"] "aaaaabc"]
[push true ["a"] "aaaaabc"]
[match true ["a"] "bc"]
[pop true ["a"] "bc"]
[pop false ["a"] "bc"]
[pop false ["a"] "aaaaabc"]
[end false ["a"] "aaaaabc"]
```

[18:27:11](#hVbLK-rGXKw9DYYdUVk7H6LosBbwXdmrkK6b3hZ7JyM) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> Ok, now I have a better idea:
> 
> `parse/find` will return `none` on failure or the series if `return-position` keyword is encountered.

hiiamboris: Have you considered this?

[18:27:17](#t7SNG08eXGJjvHwLYTvSAHAMiAOjjEiQ0FzZ6hiVfAU) <hiiamboris>:
* maybe smth like this to measure parse's reach:
```
tracer: func [e m r i s /local p] [
	either p: find/same/only/skip reach head i 2 [
		if positive? offset? p/2 i [p/2: i] 
	][
		repend reach [head i i]
	]
	yes
]
reach: []
parse/trace [1 2 3 [4 5 6] 7 [8 [9]]] rule: [some [into rule | not [quote 8] skip]] :tracer
probe new-line/skip reach on 2
```
output (pairs source + offset):
```
[
    [1 2 3 [4 5 6] 7 [8 [9]]] [] 
    [4 5 6] [] 
    [8 [9]] [[9]]
]
```
but it's tricky too, since rule negation first matches then backtracks: 
```
>> parse/trace "aaaaabc" [not some "a"] func [e m r i s] [print mold reduce [e m r i]]
[push true [not some "a"] "aaaaabc"]
[fetch true [not some "a"] "aaaaabc"]
[push true [some "a"] "aaaaabc"]
[push true ["a"] "aaaaabc"]
[match true ["a"] "bc"]
[pop true ["a"] "bc"]
[pop false ["a"] "bc"]
[pop false ["a"] "aaaaabc"]
[end false ["a"] "aaaaabc"]
```

[18:27:52](#4UOHJCMAr6Dan64iAkntali0WkDuPebEIRio3-mR98A) <hiiamboris>:
no

[18:28:10](#lmMYoZ54uTZCaRpSJvbCfoeQGaKNw07rLat7qqVxD-E) <GiuseppeChillemi (GiuseppeChillemi)>:
I think this is the simplest and most viable solution.

[18:28:20](#23tP4HabvcuIVTVOYslzAaQZZwYeluDBgo0-8MCM494) <hiiamboris>:
go for it then

[18:28:39](#py7ogGPa1aJG1oDTyM88upgZuV0orI7v-GVKH5b4qnY) <GiuseppeChillemi (GiuseppeChillemi)>:
Do you agree?

[18:28:51](#x3iNXk5mm3Zn3-c-xYea0sfRIyNZqIMNCFGEhiweWhU) <hiiamboris>:
no I don't

[18:28:57](#akzns3IZ_S2PHfRmEg5RgTb-u5JsXAEV27cx-o_OTuM) <GiuseppeChillemi (GiuseppeChillemi)>:
I love you!

[18:29:07](#Upwdho7tCUspzqZc0haDtP47HUY5TtDmSyJYTi54AdY) <hiiamboris>:
(:

[18:31:37](#abb4hUJoe8W6PCrlBEsU13fYSWkg7qitF0I2O5vLtaw) <GiuseppeChillemi (GiuseppeChillemi)>:
You can even remove `/pos` refinement using a wrapper for parse. Just implement `return-position`

[18:31:55](#G4QpmkaDzd59OrSHEJztB-RtvNRj6W2WIxH4AJ8l4Mc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * You can even remove `/pos` refinement using a wrapper for parse. Just `return-position` is needed to be implemented

[18:33:35](#alruZzu9QxnkxfnvXFdXywkcrTBL3YvMHubnbGVHZLs) <GiuseppeChillemi (GiuseppeChillemi)>:
or.. `return-at` as `position` let me think of indexes

[18:35:13](#-vRYRAZapKVoEENsFxxZKQXCXDEyH0qu8WtiiDSkdX0) <hiiamboris>:
like this?
```
>> detect: ['d] parse/trace [a b [c d e] f] rule: [some [into rule | detect bust | skip]] func [e m r i s] [p: i :r/1 <> 'bust] ? p
P is a block! value.  length: 1 index: 3 [e]
```

[18:39:52](#Ei4toeXnadiY3AEy60qyEUhoGh-0OGyctkZ2vBxvY4Y) <hiiamboris>:
```
>> busting-parse: function [input rule] [parse/trace p: input rule func [e m r i s] [p: i :r/1 <> 'bust] p]
>> detect: ['d] busting-parse [a b [c d e] f] rule: [some [into rule | detect bust | skip]]
== [e]
```

[18:41:40](#WomeTH1z8waGb-b40m4hWBJt77YyWlQsZXlPZwYwkjo) <GiuseppeChillemi (GiuseppeChillemi)>:
`return-position` is simpler for non gods

[18:41:52](#F-0TZdYSSjQMkj2kSjvw34I0aHWQA425zg9iKuH54Lw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * `return-at` is simpler for non gods

[18:43:09](#-7Ry5KyGRTovMHUafHFJjlC_JYmFupXqs-k5edJ5VIg) <GiuseppeChillemi (GiuseppeChillemi)>:
`return-input`?

[18:43:40](#90bNVZQox_h8acmNgKcAxeGlG8-8fRGowh0JokdAHYA) <hiiamboris>:
I also considered naming the token `'Giuseppe` :)

[18:44:07](#tg_Wjr4QWIpTmAqkvX5PNgOEyvqdCU4UZUxyqVZsvsc) <GiuseppeChillemi (GiuseppeChillemi)>:
`return-giuseppe`

[18:44:14](#K2wjcQxYKbt5iEBva_0nXZadIlnBp3Pmfj-1X9uFQbk) <hiiamboris>:
yes!

[18:44:42](#kbTHhJJ1evtqL6L-YEtNxzGHt11BkcFD0JuWXU9fkgc) <hiiamboris>:
hey at least you won't forget its name

[19:18:07](#MXoHgUvRXSEqh8lVhqeZRobEEyhhoUp-9G8Gtx-RjtA) <GiuseppeChillemi (GiuseppeChillemi)>:
Maybe I have found a simple trick to implement the keyword:

```
parse-to: func [
	"Returns a series at matched position. Use RETURN-AT set-word for the match"
	series
	rules
	/local
	ctx-return
] [
	ctx-return: context [return-at: to-set-word 'return-at]
	parse series bind rules ctx-return 
	ctx-return/return-at
]

probe parse-to [a b c [d e f g h] i] [to block! into [to 'e 2 skip return-at]]

>> [g h]

```


[19:19:47](#LDs8gVWvzWV_-ApTS1MdgRlhAINVqCgj3rIk-oNg8sc) <GiuseppeChillemi (GiuseppeChillemi)>:
Do you see any possible dangers of side effects?

[19:24:46](#-IG_t0N3uB0BdXWlX9dUz0u9yBrdXWd6RgamkTrFYPw) <hiiamboris>:
- `self` will be rebound in the rule
- `return/exit` in rule will be trapped

[19:25:28](#Tgkvoox4XmEyByZo7qa8XGD3kt8Jj5vUVJG9zort5p0) <hiiamboris>:
* - `self` will be rebound in the rule
- `return/exit` in the rule will be trapped

[19:53:44](#74475SYis804NelRzJmtrnu4SGyzLssfBLTKOPprio0) <GiuseppeChillemi (GiuseppeChillemi)>:
I do not understand both, could you explain?

[19:55:38](#8B2yRs9F5kwUsAkJh-UwasZUK_o4ObHOxatRigr5HQY) <hiiamboris>:
```
>> context [a: 1 b: 2 c: parse-to [q w e] [(? self) (return 420)]]
SELF is an object! with the following words and values:
     return-at  set-word!     return-at:

== make object! [
    a: 1
    b: 2
    c: 420
]
>> context [a: 1 b: 2 c: parse [q w e] [(? self) (return 420)]]
SELF is an object! with the following words and values:
     a  integer!      1
     b  integer!      2
     c  unset!        

== 420
```

[20:17:25](#khvy6-CQE0K4s1Le8hoQGqG24gcZHsRqATgStpmQjuQ) <GiuseppeChillemi (GiuseppeChillemi)>:
I can see `self` being rebound from my bind, but I don't understand how return is being trapped.  

[20:17:55](#W1vvaph38A3x4eLIMU0QD6yACgsm1vwP-C509ftEXlo) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I can see `self` being rebound from my `bind`, but I don't understand how return is being trapped.

[20:18:22](#ztrn8V7y0u-7hl0LyOwSFF5aGyd2BSCNBqJQhZkYXng) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I can see `self` being rebound from my `bind`, but I don't understand how `return` is being trapped.

[20:21:38](#KDswaHyfGc32KvRbY8dw9jdjV0BwfsTLxAa-jRYilbs) <GiuseppeChillemi (GiuseppeChillemi)>:
The only function which has `return` visible as bindable word is `parse` when `rule` is reduced.

[20:22:47](#cfD4_-k1Vo205vM1Xwmf1VRnykL_t9UBN_ulcKt_1gw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * The only function which has `return` visible as bindable word is `parse` when `rule` is reduced but it seems it is being catched from the `parse-to` context

[21:39:15](#4rcMd1OxX1h0JTd16vtyO8P7yjte8pkbYMDdlChZp0Y) <hiiamboris>:
it's a function so it catches return/exit

[21:43:34](#sCLuDq1n9wfNerwym5jRy0Z5sJkTuMuM11CRuNs7x4M) <GiuseppeChillemi (GiuseppeChillemi)>:
You are telling me it is not the context but the interpreter which catches the `return` when you are inside a function?

[21:43:45](#m6AOrBJvwm6jI4XFXMb_nO3jLbyaQTEza_lHP62-2jE) <GiuseppeChillemi (GiuseppeChillemi)>:
 * You are telling me it is not the context but the interpreter which catches the `return` word when you are inside a function?

[21:44:41](#nApS-YsKqwoaaXdOU59od1l58ywNYVQKT_9e_ezSLpw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * You are telling me it is not the context binding but the interpreter which catches the `return` word when you are inside a function?

[21:46:36](#yQLnH_9nPRaxwXpOH6GewvJQ5IToG4DCs3CO5wRQ5Lw) <hiiamboris>:
yes

[21:54:17](#bSJnIkoMdYn6sb9moGGnxBDZZn_MshiOUpHz8iYl4Zc) <GiuseppeChillemi (GiuseppeChillemi)>:
I didn't know about it and I don't like how this works. This complicates things a lot when you are managing blocks inside functions like vid panels. It will have a working when inside functions and another when outside in case of the presence the `return` word. 

[21:54:53](#mD5OlpqwgeP8vSmo854Isi47CtmBCu2congjek_GRAk) <GiuseppeChillemi (GiuseppeChillemi)>:
I could live with it, now that i know this, but isn't there a way to avoid hits interference?

[21:59:12](#ggr1uNGZAqGPAx8uQlUcgtmdXbSoxJp3SIgTx-t5gBo) <GiuseppeChillemi (GiuseppeChillemi)>:
I mean, either a way to disable `return/exit` inside functions and/or another way build the function without activating the `return/exit` mechanism

[22:00:26](#FqWRuksBKIWgw-iqc5G1RUe5OgtERDA7IaXbx1AuaPc) <hiiamboris>:
no

[22:02:10](#gr5-1_O0O-yzxT8qchL7rBNEFTUbj4kip2c-I1ohN3U) <GiuseppeChillemi (GiuseppeChillemi)>:
do `catch`/`throw` have the same problem?

## 12-Jun-2023

[7:43:43](#mbOYCeUwCVjzJ3RHcRU_C0TioEMP2Ydf-AxLMwl8s4Y) <hiiamboris>:
not same, similar https://github.com/red/red/issues/4416#issuecomment-811786089

## 26-Aug-2023

[22:48:45](#nZNVQIaohZ-KhjbGrFQlNgezatB4-x8N1F9Z1rX8ba0) <GiuseppeChillemi (GiuseppeChillemi)>:
What is wrong here?

```
validate-proto: func [
	proto [block!]
] [
	parse proto [ahead block! set c (probe c) into [some [string! paren!]] end]
]

probe validate-proto [["a" (22 + 33) "b" ("a" + 55 + 66)]]
```

I get a "c has no value"

[23:41:05](#AX0KA66Wl-YB1rmHRG7phNQP2dJDI09SwlR9vlKS6hI) <greggirwin (Gregg Irwin)>:
`set` wants a value to set `c` to, but you haven't gotten there by the time you probe it.
```
validate-proto: func [
	proto [block!]
] [
	parse proto [ahead block! set c into [some [string! paren!]] (probe c) end]
]

probe validate-proto [["a" (22 + 33) "b" ("a" + 55 + 66)]]
```

## 27-Aug-2023

[15:34:14](#u9G5n77j7ibzEyp1s8sY1arUBk6uXeMf0Hk2Mb6ijwM) <GiuseppeChillemi (GiuseppeChillemi)>:
I would like to extra the comments inside a script. I am starting some parse experiments but parse is still my beast and not my best.

```
script: {Print "something"
;First test comment
me: 22
Here: [44]
;another comment
probe here
f: function [a b] [print ["a: " a "b: " b] ;Shifted comment
another-unuseful-thing: ["-------" ";you whould not see me"] ;you should seee me
;last comment

return
}

parse script [any  [any [";"  line-start: | skip] any [line-end: cr lf  | line-end: end  | skip ] (print copy/part line-start line-end)] ]
```

Why here I see just a couple of lines and not every line?



[15:34:36](#WH34Ezy85i9-80VhlY45EvovnRCuK2qQtVHrQrAKpvc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I would like to extra the comments inside a script. I am starting some parse experiments but parse is still my beast and not my best.

```
script: {Print "something"
;First test comment
me: 22
Here: [44]
;another comment
probe here
f: function [a b] [print ["a: " a "b: " b] ;Shifted comment
another-unuseful-thing: ["-------" ";you whould not see me"] ;you should seee me once completed
;last comment

return
}

parse script [any  [any [";"  line-start: | skip] any [line-end: cr lf  | line-end: end  | skip ] (print copy/part line-start line-end)] ]
```

Why here I see just a couple of lines and not every line?

[15:42:32](#_xUZnIEAWfJmec2bnsRohd2K2lQFBajQbN7S4CftPjc) <GiuseppeChillemi (GiuseppeChillemi)>:
I still do not understand the logic that rules when something is set and when a code in block is executed:

which is the difference between

`something: any [rule]` and `any something:  [rule]`
`set something any [rule]` and `any set something  [rule]`
`copy something any [rule]` and `any copy something  [rule]`



[15:49:04](#zzv4h9cVEpPihfVHOqqRn0ecfcsJIpC1odUOlFx9fck) <GiuseppeChillemi (GiuseppeChillemi)>:
In the above code:

```
parse script [any  [any [";"  line-start: (PAREN-1) | skip] (PAREN-2) any [line-end: cr lf  | line-end: end  | skip ] (PARENT-A)] PAREN-B]
```

Which is the difference between the varius paren positions? When paren-1/-2 are exectued and paren-a/paren-b?


[15:49:47](#O-Wu8i3gYG8VaYire760OIDGViNO1Bw0rbM3YJHYyo8) <hiiamboris>:
Use the [lexer](https://github.com/red/docs/blob/master/en/lexer.adoc#instrumenting-the-lexer) instead:
```
>> transcode-trace {ab "c;d" ;ef}
PRESCAN  word!        1x3          1    { "c;d" ;ef}
SCAN     word!        1x3          1    { "c;d" ;ef}
LOAD     word!        ab           1    { "c;d" ;ef}
PRESCAN  string!      4x8          1    {" ;ef}
SCAN     string!      4x9          1    " ;ef"
LOAD     string!      "c;d"        1    " ;ef"
PRESCAN  comment      10x13        1    ";ef"
SCAN     comment      10x13        1    ""
== [ab "c;d"]
```

[15:50:25](#p5t7ZDZgJbk9QbVRemWtWCXkOy2sHlfIlAnTYyvWB4s) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, but the above questions remains.

[15:50:30](#kDS9xe_lL0lcGiBxiwfqOTk50O_IOJvAvayyOlZZX7o) <hiiamboris>:
Otherwise you'll end up writing your own crippled lexer anyway.

[15:51:47](#EcIbyLHbuiUCbUwfMcanDOdS94NYG--mELerzM2SJSc) <hiiamboris>:
For parens just insert `print` into them, you'll see when they're evaluated.

[15:52:44](#jISqx-mxMnbV0GVzDFPvHLbh_Vktn0NkXQd3Ib_eTso) <hiiamboris>:
`any something:` is a complete construct (loop + rule), so it won't do what you think it will.

[15:53:40](#isEb9kC1t39zHHWOGbo8YUTuW5vwss_mXDuzHz84z7s) <hiiamboris>:
`any set word rule` will (if it even works) set word every time `rule` succeeds.

[15:53:51](#Qa3mkw1RnUPm1Z-dGyADAMEM_3XCPRTj631iD-8a9xY) <hiiamboris>:
same for copy

[15:54:00](#K4lsFHol1yFrxzPsleLzd5s00C6gUJwXQbzpBWYZTZc) <hiiamboris>:
read it as `any [set word rule]`

[15:54:27](#NLIO8-A4WRfFbWNYGhBOYTG4tHVcSuEjgAVSvoMZy2k) <GiuseppeChillemi (GiuseppeChillemi)>:
I would like to extract comments in other languages too, so I will definitely end up writing some kind of crippled lexer 

[15:55:16](#aP5NdeZlQT2GUOqm8Sqd7mrjJaY4viDHdZimoqgNyoY) <GiuseppeChillemi (GiuseppeChillemi)>:
But as now, it is ok for me to work using the lexer

[15:55:22](#gqrZ6e-s9l-NIVb0kLf4K906XKjg7TpmaY8kXpVeoGE) <GiuseppeChillemi (GiuseppeChillemi)>:
It is easier to start with it

[15:56:50](#-sjsaQ-wDYOhWhd7EjKUP6qv4qyLAYSHzlflv31xcd8) <hiiamboris>:
The twist here is that we don't know lexical rules of Red ;)

[15:58:47](#yE4j9z-0OsR_56zxO9IXMtm3wnV5MDiF_yM3hPMdL9M) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> `any set word rule` will (if it even works) set word every time `rule` succeeds.

Which is the difference between paren1 and paren2?

`any [any [rule | altrule | skip] (paren1)] (paren2)`

[15:59:47](#KftlUh1Xkh-jeqwABMgqhp8ulCKpcq0eVkMbZCZA4L0) <hiiamboris>:
In this your example the only difference is the order in which they are evaluated.

[16:00:00](#IYlRHJCDorGqQo-SvH4-GFLxU1SJjvLsc9WY93sYErI) <GiuseppeChillemi (GiuseppeChillemi)>:
Same output?

[16:00:16](#g_qQg_z2OZKwULJwhVj8T6PAOc2AEuSaTDPW5aMw0D0) <hiiamboris>:
Try it.

[16:00:21](#obB5hOGet9hUa8m6W3rXeuQnlUXJgUUlApbpJRUJCk0) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Same output if both have the same code?

[16:03:21](#hiN5FzTBE0hOaPnXdkFW8dKl4gj7dZpKHru4L80qlz0) <hiiamboris>:
Notice also that paren1 is in the loop, so you may see it iterate.

[16:03:53](#NAzu6awyRNLJk9szy852xaRy1GZ6pZWFuwa-JXC9CWU) <hiiamboris>:
* Notice also that paren1 is in the loop, so you may see it iterate. But in this example you won't because your inner loop consumes all the input.

[16:27:24](#VRq_CcddonHzc1MdhRggCKumQj4-rOA-AlnQsKj9d4c) <GiuseppeChillemi (GiuseppeChillemi)>:
I am testing:

```
parse script [any copy line [any  [ ";" | skip ] any [ lf | end | skip]   ] (print line)  ]
```

I expected it to work at each of the first any iteration but it failed

[16:32:21](#S1ExiQ6KlGp5pOWV_Q0KlrRFxM2p7QNs5rbGQtkDP3A) <GiuseppeChillemi (GiuseppeChillemi)>:
This prints every line regardless of the success of the last any:

```
parse script [any [copy line any  [ ";" | skip ] any [ lf | end | skip] (print line)  ]   ]
```


[16:42:19](#4cHfyYHmp1uwt4GX6A0i838okZ-ghgD3kGO4uaHZfl8) <GiuseppeChillemi (GiuseppeChillemi)>:
I have changed approach:

```
parse script [any [any  [";" any copy line [ cr | end | skip] (print line) | skip ]]]
```
Another failure here, I have thought it would have worked...

[16:46:02](#Swf6UGXZKxZYwEsOOisbvqwTpkNZIt7abBjGgOBS8ps) <GiuseppeChillemi (GiuseppeChillemi)>:
Last attempt:

```
parse script [any [";" any copy line [ cr (print line) | end (print line ) | skip ] | skip ]]
```

I surrender

[17:12:23](#jgBhrC-sD347fJsNEpXgdrMs3DAWgGd8nRzr92fmQEM) <gurzgri>:
GiuseppeChillemi (GiuseppeChillemi) Think of `any` as a loop construct. `any copy line [...] (probe line)` will only probe the value `line` is set to in the last iteration. `any copy line [... (probe line)]` can't do what you expect it to do, because you're again trying to evaluate `line` before `copy` can set to the data matched by the rule following it. `any [copy line [...] (copy line)]`.
See the difference `parse ["a" "b" "c" d] [any copy val string! (? val) 'b]` and `parse ["a" "b" "c" d] [any [copy val string! (? val)] 'b]` or even `parse ["a" "b" "c" d] [collect any keep string! 'b]` for startes.   

[17:13:05](#iC953N8Iu0X49kcTp0DuB_BVFZWGUeKzcbq_UmuZ1nc) <gurzgri>:
 * GiuseppeChillemi (GiuseppeChillemi) Think of `any` as a loop construct. `any copy line [...] (probe line)` will only probe the value `line` is set to in the last iteration. `any copy line [... (probe line)]` can't do what you expect it to do, because you're again trying to evaluate `line` before `copy` can set to the data matched by the rule following it. `any [copy line [...] (copy line)]`.
See the difference `parse ["a" "b" "c" d] [any copy val string! (? val) 'b]` and `parse ["a" "b" "c" d] [any [copy val string! (? val)] 'b]` or even `parse ["a" "b" "c" d] [collect any keep string! 'b]` for starters.

[22:07:01](#-Ed-EIjwXmuciiAiQjmXYHbSZ6KnsJTq-VYwFTlEn50) <GiuseppeChillemi (GiuseppeChillemi)>:
I have managed to let it work, apart the one with comment in the middle:

```
parse script [any [any [";" break | skip] st: any [ahead lf break | ahead end break | skip] en: (print copy/part st en) ]] 

```

[23:02:02](#MUWJfkvRw_cmKe-uIzcyPX_R7dTa9D-o9m9yIdxViw8) <GiuseppeChillemi (GiuseppeChillemi)>:
No, it didn't work well, I have discovered 2 LF at the end which should not be there:

```
"First test comment"
"another comment"
"Shifted comment"
{you whould not see me"] ;you should seee me}
"last comment"
""
""
```
I discovered this when using the following variation of parse rules with `PROBE` and `COPY`

```
script: {Print "something"
;First test comment
me: 22
Here: [44]
;another comment
probe here
f: function [a b] [print ["a: " a "b: " b] ;Shifted comment
another-unuseful-thing: ["-------" ";you whould not see me"] ;you should seee me
;last comment

return}

parse script [
	any  [any [";" break | skip] copy line any [lf break | end break | skip] (probe line)]
] 
```

So I have had to change it in this way:

```
parse script [
	any  [any [";" (m: true) break | end (m: false) | skip (m: false) ] if (m) copy line any [lf break | end break | skip] (probe line)]
] 
```

Using and `if` condition.  Well, is there a less convoluted way using just `ANY`, `COPY` and `BREAK` , `FAIL`. I feel there should be simpler one but I can't find it.

[23:12:48](#Zl4WSZe8MF63wHVkBwYduiaD3GQl0R2lgbbN7mcMXok) <GiuseppeChillemi (GiuseppeChillemi)>:
 * No, it didn't work well, I have discovered 2 LF at the end which should not be there:

```
"First test comment"
"another comment"
"Shifted comment"
{you whould not see me"] ;you should seee me}
"last comment"
""
""
```

I discovered this when using the following variation of parse rules with `PROBE` and `COPY`

```
script: {Print "something"
;First test comment
me: 22
Here: [44]
;another comment
probe here
f: function [a b] [print ["a: " a "b: " b] ;Shifted comment
another-unuseful-thing: ["-------" ";you whould not see me"] ;you should seee me
;last comment

return}

parse script [
	any  [any [";" break | skip] copy line any [lf break | end break | skip] (probe line)]
] 
```

So I have had to change it in this way:

```
parse script [
	any  [any [";" (m: true) break | end (m: false) | skip (m: false) ] if (m) copy line any [lf ahead break | ahead end break | skip] (probe line)]
] 
```

Using and `if` condition.  Well, is there a less convoluted way using simple commands like `ANY`, `COPY` and `BREAK` , AHEAD`, `FAIL` and no `TO/THRU` . I feel there should be simpler one but I can't find it a way to make it so.

[23:19:52](#zGG1DdG0-6XgE_iYbK1ijbBa32-LHSqIR-xGxVdbK5U) <GiuseppeChillemi (GiuseppeChillemi)>:
 * No, it didn't work well, I have discovered 2 LF at the end which should not be there and also a LF at the end of each line:

```
"First test comment"
"another comment"
"Shifted comment"
{you whould not see me"] ;you should seee me}
"last comment"
""
""
```

I discovered this when using the following variation of parse rules with `PROBE` and `COPY`

```
script: {Print "something"
;First test comment
me: 22
Here: [44]
;another comment
probe here
f: function [a b] [print ["a: " a "b: " b] ;Shifted comment
another-unuseful-thing: ["-------" ";you whould not see me"] ;you should seee me
;last comment

return}

parse script [
	any  [any [";" break | skip] copy line any [lf break | end break | skip] (probe line)]
] 
```

So I have had to change it in this way:

```
parse script [
	any  [any [";" (m: true) break | end (m: false) | skip (m: false) ] if (m) copy line any [lf ahead break | ahead end break | skip] (probe line)]
] 
```

Using and `if` condition.  Well, is there a less convoluted way using simple commands like `ANY`, `COPY` and `BREAK` , AHEAD`, `FAIL`and no`TO/THRU\` . I feel there should be simpler one but I can't find it a way to make it so.

[23:27:09](#miNALpyTaNpqMXyb6mzSTjwBZJTtxEvh4zQFfIIHvEk) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, I have found it by myself:

```
copy-line: [copy line any [ahead lf break | ahead end break | skip] (probe line)]
parse script [
	any  [
		any [";" copy-line | skip]
	]
] 
```

This has been a intense evening facing parse.

## 28-Aug-2023

[7:55:37](#YkqcKCvoSYmRvVF1jmYZJ9-O6mugOQ-0toM8ag8uJDQ) <hiiamboris>:
You just reinvented `to` rule.

[8:09:05](#zG0yLhO8IwGKyQOWEvKv1SKEa0kLaA50F2oCDcY9ivw) <GiuseppeChillemi (GiuseppeChillemi)>:
I have not used It on purpose. 

[8:10:56](#VLjzKmruriILwwpexE72XxkQ6whLnADmt4Jhv27eFnQ) <GiuseppeChillemi (GiuseppeChillemi)>:
I had already a working version with It but if you want to learn working with ANY and loops you must force yourself to not use it

## 29-Aug-2023

[2:03:39](#Cl0tEiuYG85-e8hlVwPw_D7ss6XirAFLFsIhKMUMMVc) <lylgithub2021 (lylgithub2021)>:
Why does `parse a: ["a" "b" "c"] [(length? a) string!]` not give `true`? And how to make it work as expected?

[7:14:03](#QIrm9Tnn5Iq0hFdKEFnZT5o7dWQ_RJGspBL4Rk5NS-I) <hiiamboris>:
Because result of paren evaluation is not reused as a new rule. Assign it to a word, then use explicitly.

[13:40:21](#gYhK9DN4p-eDpt0yBkweGYNkz14ln8fVdz5jqVJpAtI) <Oldes (@oldes.h:matrix.org)>:
lylgithub2021 (lylgithub2021): why not just`parse a: ["a" "b" "c"] [any string!]`?

[13:41:29](#ulcx0AmmWB39TYhrjt85OlJWpeG-hA2fXSjg6M8bXhs) <Oldes (@oldes.h:matrix.org)>:
Else use: `parse a: ["a" "b" "c"] [(n: length? a) n string!]`

[15:16:32](#cM54JoyIxdDjIp8YsV-ho4jPrOEo9Z36WX35uPU2tws) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Or my favourite: `parse a: ["a" "b" "c"][(rule: reduce [length? a 'string!]) rule]`

[15:17:04](#XhyqlTRa6rQEDOJKChmWwveuoPJsnPQqvI25a7GioP8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
It's longer but it's a general way to make dynamic rules.

[15:19:15](#_TzSouJ57qbMX50RnZJKo7YgpeyQa1v0D_lcNTJMYgc) <rebolek (Boleslav B≈ôezovsk√Ω)>:
And you can also get the position dynamically: `parse ["a" "b" "c"][mark: (rule: reduce [length? mark 'string!]) rule]`

[18:34:41](#UJKkrf1gTs-kK_2zw1CykaRyd-sSCsbYQjd_Z5wvFsI) <endo64>:
Or `parse a: ["a" "b" "c"] compose [(length? a) string!]` in your (simple) case.

[18:56:38](#tTJOLHIYWAZd1YW1dBVYQH2BzDy5ppRryw8UxpJJizc) <greggirwin (Gregg Irwin)>:
`any <datatype!>` is the cleanest here, IMO. Because it eliminates `length?` entirely, which you don't care about. It's just a distraction and may trick the reader into thinking it's important.

## 30-Aug-2023

[3:50:14](#DF2aloixdQpcti-J_zs7pC4RRK8G6nXE4kwdZoUWzLk) <lylgithub2021 (lylgithub2021)>:
rebolek (Boleslav B≈ôezovsk√Ω): I don't quite understand what the word `mark` is used for, so how to understand your second solution? Thank you!!

[3:52:22](#cGykhRDLRIplgZRfEVavIWvoaVjUt7fYwsX2UDkrezQ) <lylgithub2021 (lylgithub2021)>:
Oldes: greggirwin (Gregg Irwin) I think `any` means "zero or more", why does the rule `any string!` give the result "false" for `["a" "b" 3]`

[4:04:13](#uKcuFe91LejNlnc47zZzoBFTzgLUL4CxXWPbFXb7fQM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
> <@lylgithub2021-606ac7e76da0373984794a36:gitter.im> rebolek (Boleslav B≈ôezovsk√Ω): I don't quite understand what the word `mark` is used for, so how to understand your second solution? Thank you!!

`set-word!` sets the position in block. See:
```
>> parse [a b c] [pos1: 'a pos2: 'b to end (probe reduce [pos1 pos2])]
[[a b c] [b c]]
```

[7:15:26](#8znzm4SIqLCCjJt61hS95TZfKF8T565dZfNuVQ3oMvA) <lylgithub2021 (lylgithub2021)>:
And another question: how to parse `[1 2 3 4]` do determine if all elements in the block is less than `5`?

[7:32:42](#vpF8xw2TemPTHesX0fdBzdZ4ZqU6kwDgMUez8jc0nNc) <lylgithub2021 (lylgithub2021)>:
 * And another question: how to parse `[1 2 3 4]` do determine if all elements in the block are less than `5`?

[7:33:05](#5mTIlPIuFFhYdYaHtaEQ16RXNQliIzPCVCKGSXwpIsA) <lylgithub2021 (lylgithub2021)>:
 * And another question: how to parse `[1 2 3 4]` to determine if all elements in the block are less than `5`?

[7:50:55](#dbd3fNmvIJ4pq0bDfLULbY5jV3qgJ8YSD0XI2z_GRiE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
```
>> parse [1 2 3 4 5][some [set value integer! if (value < 5)]]
== false
>> parse [1 2 3 4][some [set value integer! if (value < 5)]]
== true
```

[7:51:31](#doJn_ZjOCRyrGA1A08jO9AuNFSeji2mJJf3JnxLQl7k) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`if` rule takes condition and continues if the condition is TRUE. If it's FALSE, the rule fails.

[17:22:04](#mZKxqb9UyPvXK6PwaXQM3NS0D4RG4JD0IJXqk2wb8KY) <gurzgri>:
`parse [1 2 3 4] [any [set value integer! if (value < 5)]]`

[17:24:26](#HzEOHCTvmPgTBAA29ZxXL3KQnGTdq2IPXImQo5JJFBw) <gurzgri>:
* parse [1 2 3 4] [any [copy value integer! if (value < 5)]]

[17:53:40](#kyJ8W6q1yirhuMtqoCIeDgLZR86Vmsk2JnVovuB0BIE) <greggirwin (Gregg Irwin)>:
> why does the rule any string! give the result "false" for `["a" "b" 3]`

Because that block doesn't contain *only* zero or more strings. It also contains an integer.
```
>> parse ["a" "b" 3] [any string!]
== false
>> parse ["a" "b" 3] [any string! integer!]
== true
```

[17:54:32](#-2acdgrEnriyEf0Ky5xRT0AQ-8WGRII2nDdXn_yq-M0) <greggirwin (Gregg Irwin)>:
Also, for anyone who uses `parse`: https://github.com/red/docs/blob/master/en/parse.adoc

[17:59:36](#65NsTKtvhQ2jqlnavEEUD3cV2nEACNRfqwh55wU0Q8E) <greggirwin (Gregg Irwin)>:
If the goal is to test values, i.e. with a predicate function that returns true/false, `parse` is not the best choice. Do something that makes the intent clear and the code more obvious.

[18:01:26](#QT6oxsSTQJ8moN4aw1kTcNRThEKu796eGx9YDEj_2V0) <greggirwin (Gregg Irwin)>:
While this example uses `parse` internally, it generalizes it to leverage that for pattern/type matching, while using a functional approach for predicate tests.

[18:01:59](#oPt-XAKn7UNkR5hlTJNDV2ldzeLdMsBfI3LosKGXUMk) <greggirwin (Gregg Irwin)>:
Will post in the room, rather than the thread.

[18:02:29](#lu9a0z51sxaYJGbi9zKv9zvF-gAncMorvN-1HV3L4p4) <greggirwin (Gregg Irwin)>:
Coming back from the thread on `parse+if`

[18:03:19](#ai0MtHPwzk1zjZ0lU_M4jQiT4oQTed4dzXEbOVHLreM) <greggirwin (Gregg Irwin)>:
```
all-are?: func [    ; every? all-are? ;; each? is-each? each-is? are-all? all-of?
	"Returns true if all items in the series match a test"
	series	[series!]
	test	"Test to perform against each value; must take one arg if a function"
][
	either any-function? :test [
		foreach value series [if not test :value [return false]]
		true
	][
		if word? test [test: to lit-word! form test]
		either integer? test [
			parse series compose [some quote (test)]
		][
			parse series [some test]
		]
	]
]
```
>> all-are? [1 2 3] integer!
== true
>> all-are? [1 2 3] func [v][v < 5]
== true
```

```

[18:03:50](#uJ6tiJLTKepOZdCrUA8Yt0SV6U4EGcJvTajKtb1JDcU) <greggirwin (Gregg Irwin)>:
 * ```
all-are?: func [    ; every? all-are? ;; each? is-each? each-is? are-all? all-of?
	"Returns true if all items in the series match a test"
	series	[series!]
	test	"Test to perform against each value; must take one arg if a function"
][
	either any-function? :test [
		foreach value series [if not test :value [return false]]
		true
	][
		if word? test [test: to lit-word! form test]
		either integer? test [
			parse series compose [some quote (test)]
		][
			parse series [some test]
		]
	]
]
```

>> all-are? \[1 2 3\] integer!
>> == true
>> all-are? \[1 2 3\] func \[v\]\[v \< 5\]
>> == true
```


[18:04:39](#i6eLUN34DrkrTx_KcN2wG5rmPDwCxOarvyLfIu0n52Y) <greggirwin (Gregg Irwin)>:
 * ```
all-are?: func [    ; every? all-are? ;; each? is-each? each-is? are-all? all-of?
	"Returns true if all items in the series match a test"
	series	[series!]
	test	"Test to perform against each value; must take one arg if a function"
][
	either any-function? :test [
		foreach value series [if not test :value [return false]]
		true
	][
		if word? test [test: to lit-word! form test]
		either integer? test [
			parse series compose [some quote (test)]
		][
			parse series [some test]
		]
	]
]

[18:05:11](#EhkpTIDu9OEMLIUSiMNqlmdqS3yUatTOkiFElNtSg8Y) <greggirwin (Gregg Irwin)>:
```
all-are? [1 2 3] integer!
;== true
all-are? [1 2 3] func [v][v < 5]
;== true
```

[18:06:39](#OU602ufkcM6ZFO4xvw7-NWo67YhclJhmPsYXcrC2VQQ) <gurzgri>:
greggirwin (Gregg Irwin): In that minimal example, `parse` of course isn‚Äòt the best choice, but that doesn‚Äòt imply that in a set of more complex rules at some point the need to test values with `if` at some point. I deliberately shyed away from unsuggesting `parse`, the question was not for the best, but for the `parse`-solution.

[18:09:01](#fLr-yugvl6QD2DZA4syoZJ_KERXrMNR6HUWB_s5v6lA) <gurzgri>:
* greggirwin (Gregg Irwin): In that minimal example, parse of course isn‚Äòt the best choice, but that doesn‚Äòt imply that in a set of more complex rules at some point the need to test values with if may arise at some point. I deliberately shyed away from unsuggesting parse, the question was not for the best, but for the parse-solution.

[18:09:15](#tD9NBRJK1xmgFEXMBeQmcO8XpxVjetvFLB_7tqZwO0o) <greggirwin (Gregg Irwin)>:
And I'm not saying to never suggest `if` or advanced features. But sometimes people don't know what to ask for. Then we all chime in and create a discussion. :^)

[18:10:50](#gJHvde-n00RrAXMCdZfP58bexYne-zKpRXBD5gKYImM) <greggirwin (Gregg Irwin)>:
And both of our answers do use `parse`. Mine may even be seen as more advanced and harder to understand because it parameterizes it.

[18:11:36](#nozAzGwHjsdZlnP5jSBuUim00ghgGaoo9SANlNUbi4I) <greggirwin (Gregg Irwin)>:
I also tried to be clear by saying "If the goal is to test values..."

[18:14:52](#Q_h7aEkhVxbOc9S55vOMztzohhgBT2tPtZ-wlFy8d9Q) <rebolek (Boleslav B≈ôezovsk√Ω)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> parse [1 2 3 4] [any [copy value integer! if (value < 5)]]

`set` and `copy` work same in this case but `set` is more proper when getting one value, `copy` is more appropriate when getting more values/whole rule.

[18:19:35](#wq4nwMzUQTujq9N5Ag_b6OF8hhL7kt6q5TSEOkYAjXw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
greggirwin (Gregg Irwin): I don't think that `parse` is not a best choice here. I think that `parse` is best choice whenever dealing with a block. It clearly separates matching a value and dealing with it. All other approaches are basically reinventing `parse` step by step, slowly and painfully.

[18:37:02](#3KJX_LvTlAGQIWYwoWMQ0XUmogCX2BIcZFOR5BbdpiQ) <greggirwin (Gregg Irwin)>:
Those of us who are familiar with `parse` may feel that way, but it's a foreign concept to many people, and also a flamethrower where you may just need a weed trimmer. It's hard to get into an endless loop with `foreach`, but easy enough with `parse`. Someday someone may write a "Parse Considered Harmful" paper. ;^)

## 31-Aug-2023

[2:37:17](#CBk-zCRr3WKVbSqMgrLSkUP8UmYTI-o_9B0gfPq2UKQ) <lylgithub2021 (lylgithub2021)>:
rebolek (Boleslav B≈ôezovsk√Ω): greggirwin (Gregg Irwin) Many thanks for your proposal!!

[18:20:14](#9zfSyG3Ig4Fzl9hcu4-zsWygWzhAWUSgNZcNwTSIqBA) <gurzgri>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> `set` and `copy` work same in this case but `set` is more proper when getting one value, `copy` is more appropriate when getting more values/whole rule.

Indeed, I've edited to the bad.

## 12-Sep-2023

[1:38:18](#VcvKE7cmj_EhD-e5vCc3Qw_bzJnovwGU621eILDdm8M) <GiuseppeChillemi (GiuseppeChillemi)>:
I have gone crazy debugging some parse rules, just to discover a microscopic error:

`rule: [a | b | c |]`

It is not so easy to catch it but `parse-trace` helped.

As there is no element expressed after `|`, why this does not give any error and which is the "unwritten value" `parse` is serching for? 




[1:38:35](#upw7yg08zHDOw8z_RN6NiCf8TtnpGctvgqTQ8rKIY6A) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I have gone crazy debugging some parse rules, just to discover a microscopic error:

`rule: [a | b | c |]`

It is not so easy to catch it but `parse-trace` helped.

As there is no element expressed after `|`, why this does not give any error and which is the "unwritten value" `parse` is searching for?

[5:17:58](#atcl3hjok_VdieldrUiq1cPoIvphrXOSk8SnFqfyGlY) <greggirwin (Gregg Irwin)>:
An empty rule matches no value and doesn't advance, as if the rule was `[]`.

[7:19:59](#J5NEVWIkDXShyLioI19cuyONOrEKSOLj1I3xkHk7zW4) <rebolek (Boleslav B≈ôezovsk√Ω)>:
It doesn't give any error because it's not an error.

[7:56:36](#nL6BnDsnongX5s2zVdSADzPfugTSqe2V0lvMe-tP99g) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, so Red does not consider It a missing parameter but and empty one. 

[7:56:55](#xzZLpUwnSE3ZrqJu654PAvnuw83zMyV7YCAeSBggKDk) <rebolek (Boleslav B≈ôezovsk√Ω)>:
yup

[7:58:15](#0prKow3deAN8oVwbVou9mzISHvi8-piQ2YfwwkwVDko) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> It doesn't give any error because it's not an error.

The right question should have been: "why it has been designed to not give an error?"

[8:00:33](#hCJXrS43xvRgnDHuAqjCZFlTCA72SIVVsp4U7LH5NcU) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Actually the right question is "why should it give an error?"

[8:10:03](#fOGMiR7ERvgZLhBmq7vlUg08CeW442BszABEq33Gzyg) <hiiamboris>:
the problem is not in the rule, the problem is in the lack of any serious parse debugging tool, which I have design for but no time to tinker yet

[9:26:34](#WtKEkntN9Q4SjlJA-1cw95Wt6OlL5cLlljqz1WYyDUs) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> Actually the right question is "why should it give an error?"

Because if you think as with function parameters, It is a missing one. If you  use another logic, It Is not.

[9:28:27](#TRi0qwGOfv16PZJhkECCfM0tGsfyKhkVgl8VNkqYgz4) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> the problem is not in the rule, the problem is in the lack of any serious parse debugging tool, which I have design for but no time to tinker yet

Wow, I will wait for the day you will creare It! 

[9:32:35](#kjpx8E5s7pJi6NXxkKXpFpGJe-iOaXP4ZyNgEfUtouM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> Because if you think as with function parameters, It is a missing one. If you  use another logic, It Is not.

That's a wrong abstraction, parse rules are not func args.

[9:56:24](#Fu1ZiTz16jU4dRF4UYtjRgxFJVkdQYvlJr8Ati27Qwo) <Oldes (@oldes.h:matrix.org)>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> Because if you think as with function parameters, It is a missing one. If you  use another logic, It Is not.

That's a wrong abstraction, parse rules are not func args.

[10:27:41](#CWXYV41Am-z9uzAJzCnELNbNAYsCHqm5I82xTIlGbq4) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> That's a wrong abstraction, parse rules are not func args.

Now I know but It was the first available model which matches what I have seen. Arguments are everywhere in Red and when you see a missing value you think of a missing argument. On sunday I have talked about Rebol and Red, and guess... when I have talked about assigning values to words, they have immediately thought about variables. 

[10:27:56](#5Ah2z8MhF2bBA3ca1rtVKzts44Ye77_B3VXATirB5T4) <GiuseppeChillemi (GiuseppeChillemi)>:
* In reply to @rebolek-5565a4bf15522ed4b3e100bc:gitter.im
That's a wrong abstraction, parse rules are not func args.

Now I know but It was the first available model which matched what I have seen. Arguments are everywhere in Red and when you see a missing value you think of a missing argument. On sunday I have talked about Rebol and Red, and guess... when I have talked about assigning values to words, they have immediately thought about variables.

[11:08:05](#tJIgsNO6sLHYAeZzP_M7844LgjDzVgIxJfRnbbEiTG8) <Oldes (@oldes.h:matrix.org)>:
I don't know how it is exactly implemented in Red, but to throw an error in your case would complicate the code too much. It is not worth the additional code, which would slow parse evaluation. Not to mention, that there is quite a lot other things to do.

[11:10:31](#SKiBn7onwnj6ICUZJoNfjKcm0UecMhxZpmjDVPphblU) <Oldes (@oldes.h:matrix.org)>:
 * I don't know how it is exactly implemented in Red, but to throw an error (in Rebol) to help in your case would complicate the code too much. It is not worth the additional code, which would slow parse evaluation. Not to mention, that there is quite a lot other things to do.

[12:02:37](#R7OKiz8T-OZx9iey6TQqagMwoUZKyKxbOQAGctjqccM) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> I don't know how it is exactly implemented in Red, but to throw an error (in Rebol) to help in your case would complicate the code too much. It is not worth the additional code, which would slow parse evaluation. Not to mention, that there is quite a lot other things to do.

Mine was just an observation. We should only annotate this in doc and nothing more. You have answered to the originale question with "It would slow down parse a lot".

[12:05:34](#lFbpeyy09nLUvu2eoO5Kk-Veq1WnJKaEyiEUMzh-GFU) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> I don't know how it is exactly implemented in Red, but to throw an error (in Rebol) to help in your case would complicate the code too much. It is not worth the additional code, which would slow parse evaluation. Not to mention, that there is quite a lot other things to do.

 * Mine was just an observation. We should only annotate this in doc and nothing more. You have answered to the original question with "It would slow down parse a lot".

[13:33:25](#yQwUEBx855M0Tm0KsEqTpJzW7piPo1l9eVEban-cTYc) <greggirwin (Gregg Irwin)>:
I see both sides here. In simple cases, it clearly looks like you forgot the content of a rule, as GiuseppeChillemi (GiuseppeChillemi) describes. But as you look at abstracted rule sets, optional rules, etc. the current design makes sense. 

[13:39:12](#32E4xm4PTzHFT1lD7ase8-LJIVEkn1ZLvRAQHy_sAp4) <GiuseppeChillemi (GiuseppeChillemi)>:
Today I have made a good rule, so good that I have thought It was wrong but instead It was right about a pattern It has recognized where I have not... I was parsing ansi chars...

## 13-Oct-2023

[10:52:14](#CWBr2hK9PrNSbOziEDBZ8VGhTi4mpnJzc7x_5h2WFzM) <dsunanda (dsunanda)>:
I am having trouble understanding a bug / subtle change between PARSE in R2 and Red. The code below (by Romano) compacts a block of ascending integers into PAIR!s that represent run lengths of consecutive integers. Any thoughts? Thanks!

```
compact: func [
    blk [block!]
    /local out x n
][
out: copy []
parse blk [
    any [
        set x skip (n: x + 1) [
            some [1 1 n (n: n + 1)] (
                insert tail out add 1x0 * x n - x * 0x1
            )
            | (insert tail out x)
        ]
    ]
]
out
]
```
Running R2 (Result as expected):
```
compact [10 11 12 20 21 99 100 101 102]
== [10x3 20x2 99x4]
```
Running Red
```
compact [10 11 12 20 21 99 100 101 102]
== [10 11 12 20 21 99 100 101 102]
```

[12:21:15](#tkVwPTW-7F7qSVTb9A3U7vubRabDpaZfHIM_zKCcMgA) <hiiamboris>:
I think it's `n`:
```
>> parse [4] [1 1 4 end]
== false
>> parse [4] [1 1 quote 4 end]
== true
```

[12:22:25](#1DNY62GosAwmvkaamBGRzcKOfHrw9-W0tF9QganJ6FI) <hiiamboris>:
Red requires either `quote` or `set i integer! if (i = n)` workarounds

[12:22:52](#KS9eNDXg6tGXKWUWGf8y9BB07CNJyUi4ruL49_WTs_8) <hiiamboris>:
Otherwise it reads `1 1 n (code)` as `1 1 [n n (code)]` - nested loop.

[19:12:42](#VIJ9nQt9XCc01Vu8eJkASMc08vZRMnekffyUxiuS36U) <dsunanda (dsunanda)>:
Thanks!

I've decided to keep compatibility between R2 and Red versions of the function, by replacing it entirely :)

Fortunately for me, this code emerged as part of a 2004 competition between Rebol gurus, and the runners up still work - and are R2/Red compatible. So I have severat to choose from :)

## 16-Oct-2023

[6:39:29](#1lBm2NwcKfsPxIEY8puCQ4vDdXMAV7LbNjGpPcQl4yA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I've encountered an interesting problem. I'm rewriting Lest so the same code can run in both Red and R3.

One of main features of Lest is template expansion. You can define templates and when they are met later, the are expanded and proper HTML is generated. It looks like this:

```
>> lest/generate [my-div: [div #my-div] my-div "hello"]
; data is changed to [div #my-div "hello"] and then processed
== {<div id="my-div">hello</div>}
```

Now see the code that handles it: https://github.com/rebolek/makedoc/blob/emit-lest/lest.reb#L148

In R3, I call `match-cmds` rule and it works as expected. However, in Red, I need to add `[end | rules]` to make sure that parsing continues. The rule succeeds and returns to `some` loop, so I expect it to process further without explicitly telling it to.
I've tried to isolate it, but in simpler examples Red works as expected, only in this more complicated case the bug happens.
Does anyone has any idea what's going wrong on the Red side?

[8:30:06](#NWZifaAzrg1O5ADWBs5mBg7Cw09Bs5-oltL6-mgP5TA) <hiiamboris>:
why not use `any` instead of recursion? Parse has limited stack depth

[8:36:24](#NfgxCgX2t7RQayOUHbjC8EQsSixJdSYUq899eGYkvf8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I'm certainly not hitting stack depth with this example and I introduced recursion only because Red's not able to handle `some` loop (OK, maybe `any` loop would be better to prevent some edge cases, but that's not the point). My question is, why I *need* to use recursion in case of Red, when R3 runs fine without it?

[8:46:11](#QBuht_9U7w9_mcl4BDu-AGJc7aWBz5bwmiFV45mowuY) <hiiamboris>:
could be that some iterations of your `main-rules` do not advance the input?

[8:56:42](#_aOT3g8ngX7bvdEuLXOelC28bfZw2t70zGj2qKYgSPE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I've had some debug there to find out where it's going wrong. `match-cmds` succeeds and returns back to `rules`. Now `rules` are in `some` loop and should continue because the `end` wasn't reached yet. In R3 parsing continues, in Red it does not. Why?

[8:58:26](#yMqf7K_Sa9AsoLBt_8TLdUuSU-OTFov5WCHopOS9iHc) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I think it might have something to do with modifying the input data, maybe Red is more fragile here, but when I tried to isolate it, all the simple examples passed. Or maybe it's something else.

[9:05:02](#Cy1Amiew0LTd-feEZvspoQidoWZcpBeSlbwTFaAHIOI) <hiiamboris>:
in Red to defend from deadlocks `some` and `any` loops stop if input doesn't advance or length doesn't decrease

[9:07:06](#QRo-cq_GM5W5WANleQS-70atgCtm3qyfF6fPFasHDUQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
OK, input doesn't advance, as it's handled by `ahead` and length doesn't decrease because it actually increases. Maybe Red should check for this possibility too.

[9:07:29](#__f869SHIpG386JzI_gkh2aKXg1QKXfrDbeWDvNJW20) <hiiamboris>:
but that's a guaranteed deadlock hehe

[9:07:37](#DznjQ0RM--ZZ5nXFyklvGHyYnT7aVuFg-6w2FaXi_Nc) <hiiamboris>:
use `while`?

[9:09:06](#UGLdkjSHbPZftVl8RIYecFAjkxn_S3O8ZFn_jspCZks) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Hm, that could solve it, I'll try it. Thanks!

## 26-Oct-2023

[8:44:54](#Km-ME_22CHJeHd6GZCg5S_qbjOV7J3vPuWNP8Ol3gSM) <lylgithub2021 (lylgithub2021)>:
I have a string like this: `{one^-"some^/some^/some"^-"other^/other"^/two^-many^-another^/}`. There are two types of "new line" symbol(`^/`) in it -- ^/ inside a pair of quotes(like `"some^/some^/some"`, `"other^/other"`), and ^/ outside a pair of quotes(like `^/two`, `another^/`).
My question is how to replace all `^/` inside a pair of quotes with another string such like "|||" ,meanwhile keep all `^/` outside a pair of quotes by `parse`. In this example, I'd like an output of`{one^-"some|||some|||some"^-"other|||other"^/two^-many^-another^/}`

[8:53:06](#hVJqiFBwMIvw-qFBbgDYGgEnhEuXnP81Q-kfhMRg1mE) <hiiamboris>:
what have you tried so far?

[10:03:00](#WiHudwvBMeaBouberrfReTWSIk2gi7JrEDMA_yavr3Q) <lylgithub2021 (lylgithub2021)>:
```
>> a: {one^-"some^/some^/some"^-"other^/other"^/two^-many^-another^/} 
== {one^-"some^/some^/some"^-"other^/other"^/two^-many^-another^/}
>> parse a [some [to {"} some[to "^/" change "^/" "|||"]  to {"}] to end]
== false
>> a
== {one^-"some|||some|||some"^-"other|||other"|||two^-many^-another|||}
>> 
```

[10:52:37](#Zp52Sv5h4reGJNCjef5DTe7hMv8BQwfQOMigIgEoijY) <hiiamboris>:
I happen to have just the tool for you: https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-tool-red

[11:06:27](#8ibi6SzenmJ-keBzh-gtWRQW8S_wPV9aimiYcwXjCCQ) <hiiamboris>:
![https://tchncs.de/_matrix/media/v3/download/tchncs.de/e10c8bf37524cff549a41e590c54db4f116470e0](https://tchncs.de/_matrix/media/v3/download/tchncs.de/eb457687121c4caa457d107387d07945f8361756)

[11:07:20](#0JgSfBC59iYtZOrb-3C9D6QLdDReG6U4puyk5WrzPo8) <hiiamboris>:
It does not support the display of input changes yet. However it clearly shows how your rule works and where it's stuck (the number one question always).

[11:08:53](#jStIY1eEFWicpIh2fJkbEaZ9784OVsEUwKb9xy4YewU) <hiiamboris>:
* It does not support the display of input changes yet. However it clearly shows how your rule works and where it's stuck (the number one question always), and how did it come to that, so you as a human may see where the input is not what the rule expected next.

[11:09:05](#0wSM7RRYwNsdaQRj6arFLdjbYNLQQ83in6_ZXBndRiQ) <hiiamboris>:
* It does not support the display of input changes yet. However it clearly shows how your rule works and where it's stuck (the number one question always), and how did it come to that, so you may see where the input is not what the rule expected next.

## 28-Dec-2023

[7:43:20](#PfFfXg8LxIq9NOXIVBSCIq1pkjM9_SK31Vk3O3Ce_N4) <toomasv>:
> <@lylgithub2021-606ac7e76da0373984794a36:gitter.im> I have a string like this: `{one^-"some^/some^/some"^-"other^/other"^/two^-many^-another^/}`. There are two types of "new line" symbol(`^/`) in it -- ^/ inside a pair of quotes(like `"some^/some^/some"`, `"other^/other"`), and ^/ outside a pair of quotes(like `^/two`, `another^/`).
> My question is how to replace all `^/` inside a pair of quotes with another string such like "|||" ,meanwhile keep all `^/` outside a pair of quotes by `parse`. In this example, I'd like an output of`{one^-"some|||some|||some"^-"other|||other"^/two^-many^-another^/}`

Hi @lylgithub2021, here is one possibility:
```
str: {one^-"some^/some^/some"^-"other^/other"^/two^-many^-another^/}
in-quotes: false 
parse str [some [{"} (in-quotes: not in-quotes) | if (in-quotes) change {^/} {|||} | skip]] 
str
;== {one^-"some|||some|||some"^-"other|||other"^/two^-many^-another^/}
```

[8:04:35](#WHUjg_JAYPgczxM5ukPv5qFxPseRtBUTPjTbFtpmRUg) <toomasv>:
And another:
```
str: {one^-"some^/some^/some"^-"other^/other"^/two^-many^-another^/}
parse str [some [{"} any [not {"} [change {^/} {|||} | skip]] {"} | skip]] 
str
;== {one^-"some|||some|||some"^-"other|||other"^/two^-many^-another^/}
```

## 29-Dec-2023

[11:21:53](#Tvco7xy96DJQ8Qm_k2dnxuv2K1g3t0Bpo21aIUH4cuo) <GiuseppeChillemi (GiuseppeChillemi)>:
toomasv: Nice to read you!

[13:31:56](#PXy4hNWLaMTlejIo1LdVhrLjDIIgLpWc7Zot6SHMnjQ) <toomasv>:
Hi, Giuseppe! :)

## 2-Jan-2024

[21:01:07](#bquAUG7NszcPC9_6kWxvZhibTpsi4BoJuhRWpMSBqKc) <SkySpiral7>:
I'm trying to learn `parse`. So far I have:

```red
fileText: to string! parse/case fileText [
   collect [
      any [
         keep [
            change [
               "test-"
               copy testName [to ": func [] [^/"]
               thru ": func [] [^/"
               copy testBody [to "^/   ]"]
               thru "^/   ]"
            ] (
               to string! reduce ["(^/" testBody "^/   ) ^"" testName "^""]
            )
            | skip
         ]
      ]
   ]
]
```

. testBody has the correct lines but I'd like to modify the contents of it further. How can I do that? I can't just put `change` after the `copy testBody` line since `change` operates on the parsed input (not a given word). I can't use `into` since this is a big string (not a block). Yes I know I could `load` the text first but I figured keeping it as text would be easier for what I'm doing.

[21:01:37](#HfYLDfOvO-Lr54nf8FBlMZ_GYmxgDKtsdH_xuwlSHUw) <hiiamboris>:
can you give an example of input and desired output?

[21:07:58](#uRmoG_-hIBBMweZ5ZTdtX8R7PtQ6MtJrL8o0UR8bPQY) <SkySpiral7>:
Example input:
```red
   test-hasNext?: func [] [
      ;001 0 0000 remaining unchanged aka done
      deltaItr: make deltaIterator [deltaStream: 2#{00100000}]

      redunit/assert-equals true deltaItr/hasNext?
      redunit/assert-equals none catch [deltaItr/parseNext none]
      redunit/assert-equals false deltaItr/hasNext?
   ]

   test-parseNext-throws-givenOpSizeSize0: func [] [
      ;001 1 0000 unchanged 0 bytes op size size
      deltaItr: make deltaIterator [deltaStream: 2#{00110000}]
      expected: "Invalid: op size size can't be 0"

      actual: catch [deltaItr/parseNext none]

      redunit/assert-equals expected actual
   ]
```

Eventual Output:
```red
   (
      ;001 0 0000 remaining unchanged aka done
      deltaItr: make deltaIterator [deltaStream: 2#{00100000}]

      (true == deltaItr/hasNext?) and
      (none == catch [deltaItr/parseNext none]) and
      (false == deltaItr/hasNext?)
   ) "hasNext?"

   (
      ;001 1 0000 unchanged 0 bytes op size size
      deltaItr: make deltaIterator [deltaStream: 2#{00110000}]
      expected: "Invalid: op size size can't be 0"

      actual: catch [deltaItr/parseNext none]

      expected == actual
   ) "parseNext-throws-givenOpSizeSize0"
```

It's a script to convert my red tests from RedUnit to `#assert` so I can see if there's a performance difference (and so I can learn `parse`).

I'd need to edit the `assert-equals` lines. I can figure stuff out myself but I don't know how be recursive.

[21:16:49](#4n_nAdV_OY4Kqg284HV-TerHVnfYKwXalBYKkSrFkz0) <hiiamboris>:
I don't think you need `change` at all here, just `keep`

[21:18:21](#ccQqalyjfUuRUu7nULlpHyM9czF1wvsTZytIq1SJfuI) <hiiamboris>:
also I should point that:
1. `and` and `or` idiomatically become `all` and `any` in Red
2. `#assert []` supports any number of test expressions in its block, without the need for `and`

[21:21:16](#-alQgEKgpwdoLblmZmmW6-CunTDMOIoteDwObLLt2NY) <hiiamboris>:
* I don't think you need `change` at all here, just `keep`
you use `change` when you want to modify the original string

[21:31:34](#dPJp89Fd7NPEQ90q71YBN8fdUsSoTTRQEP-f8Pw1u8Q) <SkySpiral7>:
That didn't answer my questions. I am changing the value since I'm moving the test name down (and removing "test-" and "func") and am keeping every line that isn't a test. I don't know what your first point is about (doesn't seem to change anything). However your second point is partially wrong: Each line of `#assert []` is checked for truth however most of my tests aren't single line so I wrap everything in `()` in which case only the final line of that is actually asserted so I have to `and` (or `all`) them together

[21:37:22](#Qula4lJmXOUOWd136m_8U4tMQz3japaO3pOVKAhzcVE) <SkySpiral7>:
Another example converted:
```red
   test-applyDelta-doesReplace-givenReversibleReplace: func [] [
      beforeStream: 2#{00000000}
      ;110 0 0000 reversible replace remaining bytes
      ;old: 00000000, new: 11111111
      deltaStream: 2#{110000000000000011111111}
      expected: 2#{11111111}

      actual: catch [main/applyDelta beforeStream deltaStream]

      redunit/assert-equals expected actual
   ]

; becomes:

   (
      beforeStream: 2#{00000000}
      ;110 0 0000 reversible replace remaining bytes
      ;old: 00000000, new: 11111111
      deltaStream: 2#{110000000000000011111111}
      expected: 2#{11111111}

      actual: catch [main/applyDelta beforeStream deltaStream]

      expected == actual
   ) "applyDelta-doesReplace-givenReversibleReplace"
```

Each test uses variables that shouldn't bleed into other tests.

[21:44:26](#6SgHdRJL6yY152IArRmDUlzSlaGE6VpsOGpG5hOGyQM) <hiiamboris>:
but they will bleed into other tests, since `()` cannot prevent that

[21:45:48](#GKENbDKvr_KAT1yS-4mWlMTXdvsIhFoY16eVdEo0bZg) <hiiamboris>:
you don't need to write 
```
#assert [
      (true == deltaItr/hasNext?) and
      (none == catch [deltaItr/parseNext none]) and
      (false == deltaItr/hasNext?)
]
```
instead just write
```
#assert [
      true == deltaItr/hasNext?
      none == catch [deltaItr/parseNext none]
      false == deltaItr/hasNext?
]
```

[21:47:10](#hzLg6m9QRhyGqYswQU02PI152yL-WHeMLBZ6suiGVTI) <hiiamboris>:
> That didn't answer my questions

you want to change the result, not the source, and for that `keep` is enough
you hitting a wall you've created yourself by using change there (in fact this is the first time I see keep and change used together)

[21:49:21](#8Cc0oVMBgJUSHRpDr4qTKK-avTKMN98oz_E2_2mFuBA) <hiiamboris>:
* you don't need to write 
```
#assert [
      (true == deltaItr/hasNext?) and
      (none == catch [deltaItr/parseNext none]) and
      (false == deltaItr/hasNext?)
]
```
instead just write
```
#assert [
      true == deltaItr/hasNext?
      none == catch [deltaItr/parseNext none]
      false == deltaItr/hasNext?
]
```
or you can even write it as
```
#assert [
      true 
      == 
      deltaItr/hasNext?

      none 
      == 
      catch 
      [deltaItr/parseNext none]

      false 
      == 
      deltaItr/hasNext?
]
```
(if you just fancy newlines ;)

[21:55:42](#JA2fHzgqWB1yW2cfsq1hQzCs5XMDFSrlfAYoT8qo4jU) <hiiamboris>:
```
>> parse "ab" [collect [copy a skip copy b skip keep (b) keep (a)]]
== ["b" "a"]
```

## 3-Jan-2024

[0:05:39](#RST1kXaH5U9_bYs0vdWaSfR3seL5w5XKh9WyVgt33pQ) <SkySpiral7>:
Bleed: ah that's true, I'd have to wrap them in `context`. That's an easy enough change although also not a big deal (the main reason for parens is the next point).

`and`: I know each line is asserted but the reason these need be to `and`ed together is that it's a single test. When
```red
#assert [
   (
      (a == b) and
      (c == d)
   ) "test name"
]
```
fails from either compare it will print out the single "test name". Yes I could remove the `()` and give each compare "test name part 1" and "test name part 2" however it's bad practice to have arbitrary code at the top level of `#assert`, it should only have things actually being asserted. Example of issue:
```red
#assert [
   expected: none  ; oops this causes a failure!
   actual == expected  ; even though this would pass
]
```
(there's also the issue your read me points out about making sure each asserted line is idempotent)

`keep`: that's a helpful tip but I'm not sure it actually addresses my issue. I would need a finite state machine since it needs to behave differently inside vs outside a test func. I think that's doable with parse but I'll have to play around with the syntax some more.

## 13-Jan-2024

[20:35:24](#kf_k1qrcVfUae_IwsMa3hqcAomo8uMsYJo-uxlWwRPk) <GiuseppeChillemi (GiuseppeChillemi)>:
Could parse break and return a value or series at position?

[20:36:00](#Az3n8Lp6I3vx_a2_HZg9NZsuzQlJF9vbLCPh18H5gao) <GiuseppeChillemi (GiuseppeChillemi)>:
I mean, do we have a command to RETURN a value?

[20:49:20](#hcp6ARKsqiCurs6gVV0dT5NrV3SziIZbv4N9xtGtIas) <hiiamboris>:
```
>> myparse: func [series spec] [parse series spec]
   myparse [1 2 3] [copy x to end (return x)]
== [1 2 3]
```

## 14-Jan-2024

[3:33:23](#I4nhwhA0g411TOxN8LXPzyczcOYML_diIZ4pcJ4-d1U) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> ```
> >> myparse: func [series spec] [parse series spec]
>    myparse [1 2 3] [copy x to end (return x)]
> == [1 2 3]
> ```

So return quits parse. I did not know I could do this. 

[3:33:42](#RkWZcMZKP99IuuVYha4FI61FKDw6PFVfMf7dXQhlML8) <GiuseppeChillemi (GiuseppeChillemi)>:
Any problem or side effect?

[8:36:48](#Y5HVOwquK0WLvz5ikZHRSM6pQg4kJcjm-YBJbYqKkHs) <hiiamboris>:
well, won't be able to return from real function

[11:32:01](#qHS1sycqdN3eNqnj6I5PaYvHvLOmh6R9pF5qHNr1gxs) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> well, won't be able to return from real function

What you mean, isn't this a real function? 

[11:33:08](#9svQVlIUKtzMGXHr_A_dZ0pBwkyK1ToYI_6dnzs-__g) <hiiamboris>:
from the function where you're using `myparse`

[11:46:37](#4i0VPllQzwQvoOD48WUOoG4ZiF0HCLXjnacXa94XJPs) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> from the function where you're using `myparse`

I remember one ticket from you about this 

[13:12:30](#jqhwRPaU0rROl1sqkvmtTXH3owkszljz3Y2D0_gHoNU) <Oldes (@oldes.h:matrix.org)>:
In Revol3 there is `parse`'s `return` keyword implemented like:
```rebol
parse "aaa<bbbb>ccc" [to "<" return thru ">"]
```

[13:12:47](#IOGSj4LJyCoiDaJSzhf8FZjY4-jL687WJWFrTeXrt5Q) <Oldes (@oldes.h:matrix.org)>:
 * In Revol3 there is `parse`'s `return` keyword implemented like:

```rebol
parse "aaa<bbbb>ccc" [to "<" return thru ">"] ;== "<bbbb>"
```

[13:13:04](#JPV_w0YKVXxDIR4lo80h0QEfFEpntq5s5FFDuz_IyqE) <Oldes (@oldes.h:matrix.org)>:
 * In Rebol3 there is `parse`'s `return` keyword implemented like:

```rebol
parse "aaa<bbbb>ccc" [to "<" return thru ">"] ;== "<bbbb>"
```

[13:14:00](#5Xva86RWydN7z85pmXZGpgKgE3vTH7DxQR-x-Lew7JI) <Oldes (@oldes.h:matrix.org)>:
also:
```rebol
parse "aaa<bbbb>ccc" [to "<" return (2)] ;== 2
```

[13:56:55](#1Vl7KKWvFHJdhXP9r3g-jrBgyAgkq6XqTNRo80mcadk) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> In Rebol3 there is `parse`'s `return` keyword implemented like:
> 
> ```rebol
> parse "aaa<bbbb>ccc" [to "<" return thru ">"] ;== "<bbbb>"
> ```

So in the first case Is like copy, in the second it returns a value. 

[14:41:08](#gTlCPIw31mEhA0JKf7zUu1NrynZ6TbbG8EAHpr0-M1M) <Oldes (@oldes.h:matrix.org)>:
This may be useful.. https://web.archive.org/web/20150118073254/http://www.rebol.net:80/wiki/Parse_Project

[17:28:17](#LZR38RDM6z4bAWJONf4k2cDYac2QQDNwkkzgDBc2g2A) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> This may be useful.. https://web.archive.org/web/20150118073254/http://www.rebol.net:80/wiki/Parse_Project

Thank you for the link, veri interesting!

[17:28:30](#IVxGb0TAd2EFFx7nUft_fdAsoK8Gola7xIL8jPn8_ig) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> This may be useful.. https://web.archive.org/web/20150118073254/http://www.rebol.net:80/wiki/Parse_Project

 * Thank you for the link, very interesting!

[17:29:06](#tFqNlclkjsNvDGZKJwibhM6ULIizUXE2ayomsfSQNjc) <GiuseppeChillemi (GiuseppeChillemi)>:
I definitely think Red parse should have a RETURN clause.

[18:14:23](#nChaNpAmC6V9cpY6BvUzwf4OHDg7KZJHsGG_KLPHtwg) <Oldes (@oldes.h:matrix.org)>:
Honestly I don't remember if I ever used it in Rebol.

[18:17:27](#mDuXMYTTlFeG0N8iYp9Ooa_jVObQ4945X66-2phHung) <Oldes (@oldes.h:matrix.org)>:
```
Running 2 code blocks 10 times.
-------------------------------------------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (2Œºs)         | 6      | 0      | 0      | 0           | [parse "aaa<bbbb>ccc" [to "<" set x thru ">"]]
4.87x (7Œºs)        | 6      | 1      | 0      | 8           | [x: parse "aaa<bbbb>ccc" [to "<" return thru ">"]]
-------------------------------------------------------------------------------------------------------------------
```

[18:18:56](#-Cx5UsIZjoEn8jDL4bJyiVNCq1VtebvOfp6PzcX82jY) <Oldes (@oldes.h:matrix.org)>:
Also usually one don't want to use parse for case like above, but to collect more result using just one call.

[18:24:24](#BhU6s4ICQR0g5xG6FHIF43TG8NThg1M0WgS_UIEuGyI) <Oldes (@oldes.h:matrix.org)>:
 * ```
Running 3 code blocks 100 times.
------------------------------------------------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (610ns)       | 6      | 0      | 0      | 0           | [parse "aaa<bbbb>ccc" [to "<" set x thru ">"]]
1.0x (610ns)       | 9      | 2      | 0      | 104         | [parse "aaa<bbbb>ccc" [collect [to "<" keep thru ">"]]]
4.02x (2Œºs)        | 6      | 1      | 0      | 8           | [x: parse "aaa<bbbb>ccc" [to "<" return thru ">"]]
------------------------------------------------------------------------------------------------------------------------
```

[20:23:55](#DvXvQV93DhlU5c_ZQXLhhKX79Pm-iuP8Nd5CaHBXsGg) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> Also usually one don't want to use parse for case like above, but to collect more result using just one call.

I need It to position on the next recognized element and return the start/end position as pair or current container.  The target use Is an object with next/back/get/set/at methods for navigating. NEXT Will use parse that will return the next position.

[21:56:49](#K04M_QbyF1LgYCY_mrzo49NVOUus6u1zWiqqV6eX0-8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> Also usually one don't want to use parse for case like above, but to collect more result using just one call.

 * The target use Is an object with next/back/get/set/at methods for navigating. NEXT Will use parse that will return the next position. I need It to position on the next recognized element and return the start/end position as pair or current container.  

## 15-Jan-2024

[13:22:28](#gQcwndGTCDYzRcEXtvVqrUCufOMDnOes4ApQkxhpHws) <Oldes (@oldes.h:matrix.org)>:
I cannot imagine your use case:-(

[13:34:03](#b-2UoI70ScFOwlk9J2A7RhPRNpZx754t1jd83N_o0JQ) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> I cannot imagine your use case:-(

Imagine when you READ/LINES a text and the you move next/back. Then Imagine instead of managing It as lines, you use parse and you don't load the text, but you navigate it using parse. Put the text inside an object with NEXT/BACK methods that call parse. Then It will return you the position of the next line and with GET method you obtain the line. Now think about doing this with any kind of data you have virtual series. 

[14:26:58](#aJxqhLBYQWN_YUGr4G9t0pfn3Da29hIqBj7jQbcJy5Q) <Oldes (@oldes.h:matrix.org)>:
Sorry... no light.

## 16-Jan-2024

[2:33:14](#cq-Z18nfBPp9X84HGepxhQkvonw1eKb4zEkx6VhC9lU) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> Sorry... no light.

This is a very rough example:

```
iterator: make object! [
	data: {Hi
this is
a text split
in lines
}
	s: system/words
	_start_pos: data
	_end_pos: find data lf
	next: func [] [
		_start_pos: find/tail _start_pos lf
		_end_pos: find _start_pos lf  

		get 
		
	]
	back: func [] [
		data: system/words/back data
	]
	get: func [/local val] [
		copy/part _start_pos _end_pos
		;val: system/words/pick data 1		
	]
	tail?: func [] [system/words/tail? data]
	set-filter: func [] []
	filter: none
	status: none
	get-status: func [] [status]
]

print iterator/get
iterator/next
print iterator/get
```
Result:
```
Hi
this is
```

[2:36:15](#RemwRIzYEQg9m0swKIyDb5On8wrri__xaTaEZAhEXU8) <GiuseppeChillemi (GiuseppeChillemi)>:
This is an object which split the data at LF.
Only NEXT and GET are implemented.
As you can see, at each GET you have the next line and data position changes. 
I want to use parse to implement any kind of data format and have the start/end position returned. Then I can give parse again the data and have another frame of data. 


[2:38:18](#vBLCg83Ei4tAcyzX6lqu_mDAoIs_zrWe1gFLkAVxQAE) <GiuseppeChillemi (GiuseppeChillemi)>:
In the final version LENGTH and other actions can be implemented and in the final idea, standard Red action could dispatch the request to the datatype and have the result, so extending Red type with a custom series build on any data structure

[2:38:35](#PT26k1FYL7WSutj0nvUh14joZDeW3Jc-rqxZccCalu8) <GiuseppeChillemi (GiuseppeChillemi)>:
 * In the final version LENGTH and other actions can be implemented and in the final idea, standard Red action could dispatch the request to the datatype and have the result, so extending Red types with a custom series build on any data structure

[2:52:15](#QVg4LK2pTbrGp9Tvpw-60rlom9UzPYopU7j5_LnrjOw) <GiuseppeChillemi (GiuseppeChillemi)>:
I have not studied Rebol3 modules but I think it would be better suited than Red as you can hide all the working behind a module.

[7:04:11](#TjLYWnZXbk4o4F0JpgVOsd7HROcj4OYKCjEcVyvZ7CY) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
Red is going to have modules too, so ....

[9:15:28](#IwTLdxjUnSdRgNO8smze9QAkv2fNjavfGIQ4mMDi354) <Oldes (@oldes.h:matrix.org)>:
Still don't understand the reason for something like this... except that it almost looks like a Rebol port/scheme.

[12:37:29](#iP2i1_q69YorXD1noJOJhVih6n0UMma7Jv4lg9-G2GA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> Still don't understand the reason for something like this... except that it almost looks like a Rebol port/scheme.

Virtual series and custom DT.

## 28-Jan-2024

[0:22:30](#LeBGKGVCXec-9wT9bysygRj2suzAwz18Kiwt5TL1hOc) <mikeyaunish>:
Can't figure out how to make the parse fail if mandatory is missing? 
```
Ôªøp-result: parse [ opt1 mandatory opt2 ]  [
	any [
		'opt1 (print "opt1 found")
		| 'opt2 (print "opt2 found")
		| some ['mandatory (print "mandatory found")]
		| skip
	]
]
? p-result
```

[4:11:45](#xKd_j-a50uC8fVmxRB0SX9DDaK4AhIiB3lmtPiuHkfk) <GiuseppeChillemi (GiuseppeChillemi)>:
I am trying to extract all the function names of a file. This is my attempt but I get only one:

```
page: load https://codeberg.org/hiiamboris/red-spaces/raw/branch/master/programs/red-inspector.red


ctx: context [

	a-function: [set t set-word! 'function block! (probe t)]
	b-function: ['set set t lit-word! 'function block! (probe t)]
	
	in-block: [ahead block! into in-block]
	

	do-parse: func [] [
		parse page [
			any [in-block | a-function | b-function | skip]
			end
		]
	]	

]

probe ctx/do-parse
```



[4:12:01](#dgqjQRkTwYjWvOmB8rRnt4c6xYwhiGSo8Vg9yGBX5I8) <GiuseppeChillemi (GiuseppeChillemi)>:
hiiamboris: 

[4:13:17](#R521xE-hb1EZDoQ1x9ttYNZ3F04U4ClKlA4-spM6u6w) <GiuseppeChillemi (GiuseppeChillemi)>:
```
red-inspector:
true
```

[4:16:17](#4C-4cobn8tASHSoKBFjIgg8TV-lYjJqOE3GOHyGG66c) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I am trying to extract all the function names of a file. This is my attempt but I get only one:

```
page: load https://codeberg.org/hiiamboris/red-spaces/raw/branch/master/programs/red-inspector.red


ctx: context [
	;--manages aname: function []
	;
	a-function: [set t set-word! 'function block! (probe t)]

	;--manages set 'aname function []
	;
	b-function: ['set set t lit-word! 'function block! (probe t)]

	;-- Enter a block if ahead
	;
	in-block: [ahead block! into in-block]
	

	do-parse: func [] [
		parse page [
			any [in-block | a-function | b-function | skip]
			end
		]
	]	

]

probe ctx/do-parse
```

[4:17:13](#jBvLrGmsfY6qCd2HIukQN0-6dVSY5rPoUAA_aFbqF4k) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I am trying to extract all the function names of a file. This is my attempt to have the basic working (I'll extend to FUNC and other) but I get only one:

```
page: load https://codeberg.org/hiiamboris/red-spaces/raw/branch/master/programs/red-inspector.red


ctx: context [
	;--manages aname: function []
	;
	a-function: [set t set-word! 'function block! (probe t)]

	;--manages set 'aname function []
	;
	b-function: ['set set t lit-word! 'function block! (probe t)]

	;-- Enter a block if ahead
	;
	in-block: [ahead block! into in-block]
	

	do-parse: func [] [
		parse page [
			any [in-block | a-function | b-function | skip]
			end
		]
	]	

]

probe ctx/do-parse
```

[8:51:09](#CRFIX22OdNaUTtauG9_LimU9evFuHgjZQ-vVgWLy8rU) <hiiamboris>:
test for a flag? `if (mandatory-found)` after `any`

[8:53:59](#d5jlOOqUL0wqEHsTNpdbN4zfjBOc0F-yQCuZSbKBNHY) <hiiamboris>:
https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-red

[10:01:05](#gTbPjGCkSGWBGIYo_roBHFkwgxDFRcd7702bF_4avzU) <gurzgri>:
GiuseppeChillemi (GiuseppeChillemi) Maybe read about `into` and do little experiments with it first. Your current `in-block` does nothing but entering a first block in a first block in a first block in a first block in a first block ... without doing anything useful _inside_ such a block.  
```
>> block: [ahead block! into block]   parse [[inside]] [any [block | 'inside]] ;== false
```

[13:44:50](#gRKLIuLFQ3B-jhHc7FokhcCvgOolKpa-4pvkNCf0fRM) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-red

Lets see with parsee

[13:55:37](#9MjUgtCBc-yRwwaUhVuaXtLqXJAOK4vOXmnl7QGteNI) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> GiuseppeChillemi (GiuseppeChillemi) Maybe read about `into` and do little experiments with it first. Your current `in-block` does nothing but entering a first block in a first block in a first block in a first block in a first block ... without doing anything useful _inside_ such a block.  
> ```
> >> block: [ahead block! into block]   parse [[inside]] [any [block | 'inside]] ;== false
> ```

I have supposed It changes the current series positions and continues with other rules. 

[14:40:27](#ruVRqqrLO6-NRsjypsQQmOgmMtEconU8KvF_AI3pJ-U) <gurzgri>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> I have supposed It changes the current series positions and continues with other rules.

See how that assumption cannot work out? Entering another block from the block which is currently parsed is not "changing series position", it's continuing with parsing _another_ series - a completely different story. Hence you have to tell `parse` what to expect from the block you've just entered with `into`. And note that your `ahead block!` isn't required to just `into` in it if a block is what is to be found at the current parse position. It is however preventing you from `into`ing into `paren!`s, with the chance being that inside such a paren a function is defined which you are going to miss. 

Anyways, you just can't statically parse Red code and have hopes to find anything other than the most trivial function declarations at the same time: 
```
challenge-giuseppe: apply get pick [func function] odd? now/weekday [[] ["go find that!"]]
``` 
Ì†ΩÌ∏ú

[14:56:24](#M8tAEOBrO516ICwY2A0yYyJoa5b8QdeTlfXkHsxypxQ) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> See how that assumption cannot work out? Entering another block from the block which is currently parsed is not "changing series position", it's continuing with parsing _another_ series - a completely different story. Hence you have to tell `parse` what to expect from the block you've just entered with `into`. And note that your `ahead block!` isn't required to just `into` in it if a block is what is to be found at the current parse position. It is however preventing you from `into`ing into `paren!`s, with the chance being that inside such a paren a function is defined which you are going to miss. 
> Anyways, you just can't statically parse Red code and have hopes to find anything other than the most trivial function declarations at the same time: 
> ```
> challenge-giuseppe: apply get pick [func function] odd? now/weekday [[] ["go find that!"]]
> ``` 
> Ì†ΩÌ∏ú

I know, I just want to list the simple declaration. For other kind of code It is really impossible. You must be at runtime.

[15:04:06](#DkF9HQ4EPHKDwfiu06PXtQVJ8Bgt1wTxfx0woATogwY) <GiuseppeChillemi (GiuseppeChillemi)>:
Also I am not INTOing into parens because I want to start simple, then add complexity. Otherwhise it full be impossible to understand for me.

[15:04:26](#8sTFkU_7XX1o3mJjLVUVahv5juLbEb-zyFbm3jwr8I0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also I am not INTOing into parens because I want to start simple, then add complexity. Otherwhise it will be impossible to understand for me.

[15:29:31](#eGNuqxOX1qKsRHGZwwh40RhtKuf7LJ_-qFg7ypOwwfU) <mikeyaunish>:
Thanks. 

[18:54:41](#fKNN2rmw8JvH5-SAy5i8mSv288k0Q5q_y7QfK1Nu3UQ) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-red

No luck, it chrashes rend and closes the console.

[18:54:49](#HbJXiA01qixxK4tSOmM09SIl44kq5Fh3IXawbB9VhrM) <GiuseppeChillemi (GiuseppeChillemi)>:
I start it and red quits

[18:58:32](#WakMiVN5_ysBg66Mz3HVazKyeOlzpi4AEOgPQg9wVY8) <hiiamboris>:
why doesn't it crash for me?

[19:00:16](#LJrXVwqIeTsp1yMc3Y0zhVTDVVdjeSJpYxgOZI2ctmg) <hiiamboris>:
nonetheless there is a typo (just fixed)

[19:04:23](#y9ig3XG-mFtoT5YUjOquRzsEs5vFZ6WXKZYFh13H_Zs) <hiiamboris>:
![](https://tchncs.de/_matrix/media/v3/download/tchncs.de/76abd59bfa3434c392fa7b8d97ab76964cc44bd8)

[19:04:38](#SyKRYR95wmnIPurxEzXBrpFkjab_m2-vIWBq94nRrT8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> sent an image.

I am downloading the new version

[19:05:43](#IPEWQYsWJOC5XPwm8IA0sH-zT7Eoh4hyBH16gi3BGGg) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> why doesn't it crash for me?

Because it fears you can destroit it, as you are the creator, so it works even if it has a typo!

[19:08:25](#lGMhdZPaz0VlmmtC9m8wNF3unMffokzoqeoHyXonIfo) <hiiamboris>:
yeah that must be so

[19:08:56](#BG4ukJr9Ikp9OY0sPZ489hmq8smr3DDnIrblgTkFRl4) <GiuseppeChillemi (GiuseppeChillemi)>:
Have you published the version without the typo?

[19:09:03](#NJC2a6CUs3XFpnsfdRQADP8iPzmZmkTkyOD6BtSb1wo) <hiiamboris>:
yes

[19:09:09](#5fs1nDeKu-8rzelDltgScI4DIFe3I0SYeF9w3WqzLNI) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-red

 * No luck, it chrashes Red and closes the console.

[19:12:10](#Mk33K4DiRXfEG97RujEIm6w5KWP248cAXUpqAwLIoWM) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-red

 * No luck, it chrashes Red and closes the console.

[19:12:57](#z6YU9yLImEfH7iJKVqZRgI9O-ETSwt49vZtp91h5p_8) <GiuseppeChillemi (GiuseppeChillemi)>:
Sorry but I don't see any commit:

[19:12:58](#kjoHenDC1-kxcQ60HxlhyvGyqD5B8ieg12DEN_JHb9A) <GiuseppeChillemi (GiuseppeChillemi)>:
https://codeberg.org/hiiamboris/red-spaces/commits/branch/master/programs/parsee.red

[19:17:59](#Z-naqYjh38pBGDp_kceVqfzJNH1yBvquu-bCVVcXpws) <hiiamboris>:
typo was in the frontend

[19:20:07](#v_BQ9DjktqE7iaqpZtR4MfQkEIT8zTUSEzuYNAqcVlE) <hiiamboris>:
* typo was in the backend

[19:23:18](#bZvjvvufNmVRfUkT1a_pQvsYzGssy5dqiVl26JW9ZUI) <hiiamboris>:
I'm kind of 99% sure though that you didn't bother reading the instructions and just improvised

[19:31:17](#JpkRURaYjp7fiI18yOr2lEtHQ98lnhnjig_oz8xWcSg) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> I'm kind of 99% sure though that you didn't bother reading the instructions and just improvised

Yes but it was useful to let you find the typo!

[19:31:49](#JKH7_k4rOoypmn0IMj_IaBfoVxQ6jx_SsQsg-tHYhBo) <GiuseppeChillemi (GiuseppeChillemi)>:
Often I have errors in my code and I fix them and then I realize I was fixing buh in another part of the code! :D

[19:31:59](#OqNq1zdYcQFrUXBfXTJFelhpU_CeRd7i-ob0-1jNUAU) <GiuseppeChillemi (GiuseppeChillemi)>:
Did this happen to you too?

[19:49:28](#DJCwFehqWDUwA-Nzqr3W9qi3_8Ntqlv6oi2-d55-L3U) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Often I have errors in my code and I fix them and then I realize I was fixing another part of the code that has errors too! :D

[19:57:33](#X0A5E7rO7Wc4_j9F1VGZ2K6h2fVONFXkAB_R-MDwtCY) <hiiamboris>:
no, I don't think so

[20:04:28](#nLgCkF6xgWo_OjAxS1nL5xNo0A5yIbIZ0ggSAZHjBEE) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> no, I don't think so

I have read the DOC. I have run this:

```
>> do %common/parsee.red
== make object! [
    skip?: func [s [series!]][-1 + index? s]
    unsupported!: make typeset! [native! action! op! routine! handle! event!]
    c...
>> parse [a b c d] [any [word!]]
== true
>> do %red-spaces/programs/parsee.red
```

[20:04:55](#DiWBLyAPjcZozNPDzJrE1gyducvo-E2_V35rtqSzOro) <GiuseppeChillemi (GiuseppeChillemi)>:
It crashes too. Are there any mistake?

[20:06:09](#QO7XVQVX0u8zCnXaf_HaBGh8KSw3IdLLzRQXkqfNJNY) <GiuseppeChillemi (GiuseppeChillemi)>:
It happens with `parse-standalone.red` too

[20:12:17](#NZ5yUW9rM-YUqjA_T9-syTl5t_3Szgk9R4jBFsYLPMs) <GiuseppeChillemi (GiuseppeChillemi)>:
 * It crashes too. Are there any mistake?
(YES: There where an error, other files must be included by hand....)

[20:12:28](#InfSgH7rMdZv3u3IqVdVQyXNkcKkauDvp07uJMq9OCI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * But.... It happens with `parse-standalone.red` too

[20:20:46](#nYmaChtLIZ5ybGf_-UBxh9kL_pLy4PXclQLgqBJX-bQ) <hiiamboris>:
![](https://tchncs.de/_matrix/media/v3/download/tchncs.de/5065dc9106a58552428c1d393994d961cb70cf8c)

[20:21:04](#kpnEL9HfVyGJcNgOtL6Be79LrStfKrx46t2wfVvQwK4) <GiuseppeChillemi (GiuseppeChillemi)>:
Lets windup

[20:21:05](#hvJCFiYlyjYOHw3cxiGZhAK9qwuw5WMTvOhNCSo-vVU) <hiiamboris>:
I've no idea what method you are using to read :)

[20:21:22](#vHninsI43EN2zFf5n6giLNlmgjmiUK-J_XMJ8myfelg) <GiuseppeChillemi (GiuseppeChillemi)>:
I have reread everything 

[20:22:31](#YboOM48MxpN5qTYJkzvMWm_XVyD19ofUjQ3_hIowKbE) <GiuseppeChillemi (GiuseppeChillemi)>:
Here is the problem:

1) I run `%common/parsee-standalone.red ` and everything is fine.

[20:24:05](#hUAeiJ9UDUlUn8XbSp_jynrbUh23iVfsZumr-R0aBbE) <GiuseppeChillemi (GiuseppeChillemi)>:
2) I run `%red-spaces/programs/parsee.red` and everything crashes.

[20:24:23](#d4mKV28qblQklSQnUqmo8SleFx37FCHm4EOjwesoUXc) <GiuseppeChillemi (GiuseppeChillemi)>:
If I run the compiled frontend it works

[20:25:51](#TKy8cUR_FVRqMajr8u7c0pDCWMQkrSyTX_mGDnLtICI) <GiuseppeChillemi (GiuseppeChillemi)>:
Question: is the frontend meant to be run is source form instead of the executable version?

[20:27:29](#d0D7-4g2uFbcSpG1avs7pc7NxyEWHYLOtniZHlG0bBE) <GiuseppeChillemi (GiuseppeChillemi)>:
Note:

[20:27:34](#LopAXB4id6dcp-Ja9je5n46OTVlSi14gjP9skzbTNSM) <GiuseppeChillemi (GiuseppeChillemi)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/552f78dd03c984a64e9e893695dd9318ef5674f51751703584132562944)

[20:28:33](#GzJXtZMmpuNigOr_24ucDBtS4VMbduSJbq8iO9GSCDI) <GiuseppeChillemi (GiuseppeChillemi)>:
The undescored line led me think that I should PARSE and than run PARSEE.

[20:29:20](#LYGYQpShXw_D0tyKGQqxK0UyZ8-tGAe4xrxqO_KHBCY) <GiuseppeChillemi (GiuseppeChillemi)>:
I suggest simply changing to: 
`during a Parsee run (which is a parse modified version to output .DUMP file)

[20:29:29](#gbcX8KkKY0mOtkuFE75cBwHJtgY8TsQ5xJIJih8sKcc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I suggest simply changing to: 
\`during a Parsee run (which is a parse modified version to output .DUMP file)`

[20:29:36](#UNfQy6Nr00Win8doPO6dQ7RnNbCNXdwL1ObARK0o964) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I suggest simply changing to:
`during a Parsee run (which is a parse modified version to output .DUMP file)\`

[20:29:50](#jYjcLhqwKqBRu1IDfUJ7Dcqqz88poaPkY6XO5e4ZP_o) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I suggest simply changing to:
`during a Parsee run (which is a parse modified version that outputs .DUMP file)\`

[20:30:28](#xivJvZ_oqyNTcjU1NTSRSNa3ZsPT5zv3nhIC5b3p0YE) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I suggest simply changing to:
`during a Parsee run (which is a parse modified version that outputs .DUMP file)`

[20:37:24](#_b9Iu4NzuAattTKpz3c4etwktcfrkstMoBQcL9E2et8) <hiiamboris>:
it's not "crashes" it's a CLI program that prints a message and exits when you give it no arguments

[20:37:50](#TKf73WhCRsRl-2zOErrd-cnlThwX_wLR0Js0T037CJ0) <hiiamboris>:
anyway what you're doing is not in the instruction

[20:38:28](#LT4CXh4BQvut4qn0EC4qL6QwgOBojRpn2l7v4eRH0Tg) <hiiamboris>:
the wording is correct

[20:39:04](#zcISNHKp5rFS-Jx7foIa6W6MxVW0nT61_tPH3BZbVso) <hiiamboris>:
* the wording is correct and explains what's the backend doing

[20:40:30](#7xh2-3V9rI22zpQKa6c4t2uNRvKR8_9FffVfyMqzvz0) <hiiamboris>:
Parse is a dialect and a state machine, whatever function you are using to invoke it it's not mentioned

[20:41:57](#cXdGYUQf_eqKGGA5mmFK7cQqhM3tev-zsaPBg7hzkNg) <hiiamboris>:
no, it would be too complex for most people, esp. if they can't follow a 3-clause guide :)

[20:51:04](#QMOSlUvAz9E_e35bqUrhOTw7UD25XEPDgqzmanprbF8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> no, it would be too complex for most people, esp. if they can't follow a 3-clause guide :)

Remember that you are the author and both we start from a different mindset: one is the creator and another is the new user.
It means that I answer different question than you when reading the documentation. The first importan thing is "what I should run to execute parsee?"
You answer to this question with this:

```
 ... collects info during a Parse run
```
So you end thinking that you must run the backend and then Parse. Which ends up absolutely nowhere. 
Start writing "it must be used in place of PARSE" and half of the confusion reading the doc will end.


[20:51:20](#3sHfqx1PIMpj8b-vVzqYSiJRON-5ITqLbycjA_OJAjo) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> no, it would be too complex for most people, esp. if they can't follow a 3-clause guide :)

 * Remember that you are the author and we both start from a different mindset: one is the creator and another is the new user.
It means that I answer different question than you when reading the documentation. The first importan thing is "what I should run to execute parsee?"
You answer to this question with this:

```
 ... collects info during a Parse run
```

So you end thinking that you must run the backend and then Parse. Which ends up absolutely nowhere.
Start writing "it must be used in place of PARSE" and half of the confusion reading the doc will end.

[20:51:38](#aVguOAgZ-Ap8KZGXG_5V4LjdGDCbe1RaHlMvhtmgZlk) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Remember that you are the author and we both start from a different mindset: one is the creator and another is the new user.
It means that I answer different question than you when reading the documentation. The first important thing is "what I should run to execute parsee?"
You answer to this question with this:

```
 ... collects info during a Parse run
```

So you end thinking that you must run the backend and then Parse. Which ends up absolutely nowhere.
Start writing "it must be used in place of PARSE" and half of the confusion reading the doc will end.

[20:56:39](#ej0T6tUKYmp8agUDU-5brj8lt-BAgCeSXwMy2asIMK4) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> no, it would be too complex for most people, esp. if they can't follow a 3-clause guide :)

I have seen Parsee inside SPACE, so as other tools you first thing that it is the final one, as many other tools you have created. This is the first and most important reason I have tought it was a 1 script function. Also, in other tools you have either the executable version and the source version an both are usable. So, if you don't read a giant DON'T USE THE SCRIPT you think it is exactly like all your other productions.  

[20:58:12](#JsidgP60Q8AiD8PBGZHpz0Fq4B4v9ZSTb_tJI32i7bE) <GiuseppeChillemi (GiuseppeChillemi)>:
The problem is that I follow you so I expect things that works as most of the other works. This is the "prior knowledge" I very often writes but that seems difficult to understand.

[20:58:24](#JvsEpthLzcWbJIBNO-tEezrRIpEAx9tLVABUteiFJeQ) <GiuseppeChillemi (GiuseppeChillemi)>:
 * The problem is that I follow you so I expect things that works as most of the other works. This is the "prior knowledge" I very often writes of but that seems difficult to understand.

[20:59:17](#L9S2uePzXDIaiMe2r6wpYXhbzSC4MgpTJ4Kgqh57Wc4) <GiuseppeChillemi (GiuseppeChillemi)>:
However, nice it is now working, so I can write here I have not uderstood parse even using PARSEE!

[20:59:26](#VVTVs4CJQX4Vtt41Lfc5_ur5QuoyUUfhyWtkLOaHaCU) <GiuseppeChillemi (GiuseppeChillemi)>:
 * However, nice it is now working, so I can write here I have not understood parse even using PARSEE!

[21:03:22](#GVZT0Piv1Wpkkus2XmY2ywbWc9cG8pLHEM_KAelVbto) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> no, it would be too complex for most people, esp. if they can't follow a 3-clause guide :)

 * I have seen Parsee inside SPACE, so as other tools you first think that it is the final one, as many other tools you have created. This is the first and most important reason I have tought it was a 1 script function. Also, in other tools you have either the executable version and the source version an both are usable. So, if you don't read a giant DON'T USE THE SCRIPT you think it is exactly like all your other productions.

[21:03:46](#vuNIu8NTTJ1Lzum8jaRKqDkU-x7WEAd41rXW83OR9zo) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I have seen Parsee inside SPACE, so as other tools you first think that it is the final one, as many other you have created. This is the first and most important reason I have tought it was a 1 script function. Also, in other tools you have either the executable version and the source version an both are usable. So, if you don't read a giant DON'T USE THE SCRIPT you think it is exactly like all your other productions.

[21:04:11](#64M-Vgri_dvD3kDRwJEzvzPc2d4rZroQHByHXNbbhhU) <hiiamboris>:
> Start writing "it must be used in place of PARSE"

[21:04:14](#h7vmVI8pFEFf96ojWRJx26PLc0l1HuY-JO51WdMIixE) <hiiamboris>:
![](https://tchncs.de/_matrix/media/v3/download/tchncs.de/ed57c733fde90ad835d04edd15510f432f447dcc)

[21:04:17](#69kwFtFf1F9fveoh1Oz96pUlWbXyqgK5OX8LIx3zrJg) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I have seen Parsee inside SPACE, so as other tools you first think that it is the final one, as many other you have created. This is the first and most important reason I have tought it was a 1 script function. Also, in other tools you have either the executable version and the source version and both are usable. So, if you don't read a giant DON'T USE THE SCRIPT you think it is exactly like all your other productions.

[21:06:32](#eGVDhXoGbKAoSqCLS4uOF9pY7Zo6FFUtAhXR9qySwR8) <hiiamboris>:
> This is the first and most important reason I have tought it was a 1 script function.

[21:06:47](#-VgVsVYFRIOHezOfauiIAIZb77fMifseDzZ9ljnOFpg) <hiiamboris>:
![](https://tchncs.de/_matrix/media/v3/download/tchncs.de/56b0abeae173ac1ce612b3ab7146a6e8ce5ecef5)

[21:07:23](#gxhwjodGJjFaSJXLnW084sOOKhzfN4AB5kOt7tOZ1hE) <hiiamboris>:
(note the bold emphasis and 2 points telling you it's not)

[21:07:32](#ldhZzkj39pqUchoUsTs6VzMB97Yq8YmzGjTnZtxG03c) <GiuseppeChillemi (GiuseppeChillemi)>:
This is the first page of your documentation:

[21:07:38](#BWaaLFNqgIp-EHAGEguSMbEUrbDlEH6S5t8WQUhZsIs) <GiuseppeChillemi (GiuseppeChillemi)>:
![https://gitter.ems.host/_matrix/media/v3/download/gitter.im/e72efcaa8b42893ee470afed60316334ed6dfd111751713662638227456](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/a4f765304cf1187981720f5111a8e1e4a505eca11751713666824142848)

[21:07:55](#Nf3Nsu9Gaf5Wt2ViY5UWhCGubZfmGP0VGHBiznoeXuI) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> 

Do you see this here?

[21:08:13](#oE7aUGizwVqi1BncZWEtpCli5S-nAeYz3B4n9AYe8fE) <GiuseppeChillemi (GiuseppeChillemi)>:
Because it is the MOST IMPORTANT piece of information

[21:08:36](#w2bnAePJy_f4NVC3r0QEAnmHP_MurAO8SliQzG3lc4E) <hiiamboris>:
sorry, I don't think I should bother, because with you - every instruction - always - fails

[21:08:56](#QoXA096tLVIo_BJdnVbAQAtyMMI1MKRnLib94_fB0F8) <GiuseppeChillemi (GiuseppeChillemi)>:
It must be read in the first 3 or 4 lines, and not near the end.

[21:09:28](#FFPOkZh00fdZWWbgKrYtlD5PDseFNx0oPOt5h-B_wIM) <hiiamboris>:
okay I'll dupe just this for the special ones

[21:11:20](#umB4vW7_0UalIFep_x3ZJ9E2zRx2RH7ZJ4DyWDmucEo) <GiuseppeChillemi (GiuseppeChillemi)>:
I have already show you the resons I had difficulties when I faced SPACE paths for the first time. Just remember the starting mindset: you are the creator, the other are newcomers to the universe you have created.

[21:11:56](#FLNJ-Ryk_xO97uhbU0g8ujmAGRWg1j3pG_FyO9J5qnQ) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> okay I'll dupe just this for the special ones

Thank from everyone.

[21:12:01](#Vkx74D-Zqtx739aJcPXFUb4sKChsMi_8zX8tE2Q_qz8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> okay I'll dupe just this for the special ones

 * Thanks from everyone.

[21:12:22](#KeocLRPzK-7VbfB00LYW9BMQf-UDDOM31hMf2fdCP24) <hiiamboris>:
no, your mindset as I see it is to ignore instructions and drone waste as much time arguing as possible

[21:12:32](#bDW4cgmFr9PzDUjPUHf2QJyPrRwhpHu94K9vVxugDFw) <hiiamboris>:
* no, your mindset as I see it is to ignore instructions and waste as much time arguing as possible

[21:15:18](#NvcmOKQT5u_ZnGncrQJKsBUZMaeYd9f3XIE5mOeY20s) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> no, your mindset as I see it is to ignore instructions and waste as much time arguing as possible

There is a science that regulates the perception and comprehension. I do not argue, I explain how neurons and mind works while facing things. 

[21:25:32](#dlxQxJ4s2Q4lI-jEUoz6deT3EOfP1LPMXg3Y3JDSiEA) <hiiamboris>:
your personal science, okay :)

[21:30:27](#0uMlRkyKbRZlZB-NGKiZ15UKHBLlwN0te9U_TPsZ5Vk) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> your personal science, okay :)

https://www.ncbi.nlm.nih.gov/books/NBK234148/
https://www.mpg.de/20170692/how-the-brain-decides-what-we-perceive
https://neurosciencenews.com/perception-reality-19586/
https://www.frontiersin.org/articles/10.3389/fnhum.2014.00566/full

Yes, my own.

[21:30:43](#tcUXDsPbstiirYO7c7NxsLIzYz68D1Z8dO3AiPuI10s) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> your personal science, okay :)

 * https://www.ncbi.nlm.nih.gov/books/NBK234148/
https://www.mpg.de/20170692/how-the-brain-decides-what-we-perceive
https://neurosciencenews.com/perception-reality-19586/
https://www.frontiersin.org/articles/10.3389/fnhum.2014.00566/full

Yes, my own ;-)

[21:34:58](#34tgUe00Ccxv4oNqGh74tVw_uc6SI14RB7zxTFt7boE) <hiiamboris>:
that doesn't seem to have any relation at all to the role you assume every time you're in the learning situation

[21:40:29](#el7bZursUCFPGiQij9DSEZJh6ZfDm_Cj5g4j85U3cHo) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> that doesn't seem to have any relation at all to the role you assume every time you're in the learning situation

The science of perception starts there. This is my knowledge, part of the things I know as from my studies in psychology and marketing. Each time I explain why I fall in error and I receive the answer that sounds "you are the problem". Until the things will work this way, I can't show anyone where the problem is and why Redbol language and tools have so few people adopting them. I will keep doing it. It is your choice asking why someone find a problem you your cration or complaining against him.

[21:42:12](#ov4Y7TqvkMWPtuDk2tlkR57f1JgKMvdfxmX1Q6OlyY8) <hiiamboris>:
what you keep ignoring is that you're the only one who keeps getting into trouble while doing simplest things

[21:42:48](#zjED1Sg5_fXlShH-6Dc-3EEJX3mCXAhw6qVGuzJbT24) <hiiamboris>:
so indeed "you are the problem" here, and to fix it you need to address the psychology behind your choice of the role

[21:43:22](#7jZW2acCpHcTCmaIJ_vbUh-2-Jo3hkqgo6MuatpG5-0) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> what you keep ignoring is that you're the only one who keeps getting into trouble while doing simplest things

I repeat: this is the "you are the problem" attitude that helps no one, your products expecially.

[21:44:07](#uIRxp67hrRnweZ4-CUImkfMMHNbac6gUU3QPssGrCh8) <hiiamboris>:
okay, pointless

[21:45:40](#SM1FsIiKsWHpjvtWiDy_OMh7LIeE8pCkGneVR15RErc) <GiuseppeChillemi (GiuseppeChillemi)>:
We end up nowehere. You don't have an user base to have a good number of answers from. As the whole Red project. So until a good number of people will say "I have not understood", I will always be the problem. Only time can give answers.

[21:45:58](#Hdew44PrkzHeWVieqZShPooNGjpHYBtbSLw41XqRImk) <GiuseppeChillemi (GiuseppeChillemi)>:
 * We end up nowehere. You don't have an user base to have a good number of answers from (As the whole Red project) So until a good number of people will say "I have not understood", I will always be the problem. Only time can give answers.

[21:46:11](#paRTFHgpW9xJLeK4xG7qbVqG_ffAszkW1YAACRib9wk) <GiuseppeChillemi (GiuseppeChillemi)>:
 * We end up nowehere. You don't have an user base to have a good number of answers from (As the whole Red project) So until a good number of people will say "I have not understood", I will always be the problem. Only time can give answers (ad doubts)

[21:46:16](#f7jcdPvWiE5JQnRdyl5qjWAd9VnI3WHFayTVTlMwmRw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * We end up nowehere. You don't have an user base to have a good number of answers from (As the whole Red project) So until a good number of people will say "I have not understood", I will always be the problem. Only time can give answers (and doubts)

[21:46:59](#gQzZArD602F5LO_2NBRhTbQtgHESwuyJGXZ9gSvmYJw) <hiiamboris>:
exactly, to claim anything you need metrics, and one person that never follows instructions is not a metric

[21:47:37](#OtkXOl8ibuczY_q56lISOJugYVuuM2v2LG9M_FqtsyI) <GiuseppeChillemi (GiuseppeChillemi)>:
I remember when I told to another person "put a signal there or something will happen". Well and entire truck has falle were I have said. Someone needs words, someone needs experience.

[21:47:45](#VDzk1RwooL8PMl66hJ8DV13ylBIilJKmuuMZaxNUz80) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I remember when I told to another person "put a signal there or something will happen". Well an entire truck has falle were I have said. Someone needs words, someone needs experience.

[21:47:51](#fUQyeBvwLKRSi-U89bBq1J5Mpem7vYQfGG0nIKWXEak) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I remember when I told to another person "put a signal there or something will happen". Well an entire truck has fallen were I have said. Someone needs words, someone needs experience.

[21:48:31](#u2j6ik4i7g4OG3FNNGx9o8p8aD6ziWttpUL7WvDQ8OE) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I remember when I told to another person "put a signal there or something will happen". Well an entire truck has fallen were I have said. Someone needs words, someone else needs experience.

[21:48:51](#BG6fbeWCizT2FSYxOluYihn0hDap5H1UWc-rfnMmNC8) <GiuseppeChillemi (GiuseppeChillemi)>:
Now let's go back to Parsee...

[21:50:24](#pioOKJOXeuGM_A9D0--LOtTGZuqdaWX0710tLz3V774) <GiuseppeChillemi (GiuseppeChillemi)>:
Well, not that I was able to let Parsee work. What means the orange color when moving the slider on the right, then returns to green after that?

[21:50:25](#pADYBatuAhemBMzyBlNQsGy0pXjgajlEd6h0AELRpKI) <hiiamboris>:
* exactly, to claim anything you need metrics, and one person that never follows instructions is not a metric, it's dissidency

[21:57:09](#T_LyKVPgUMy8BxXk_Yu2a76BJtjA0iRCvUJ4jZVmTfo) <GiuseppeChillemi (GiuseppeChillemi)>:
OK, I have encounterd it in a rule that has not advanced. It is the state of failure of the rule that than becomes green. The rule not advancing was a problem of the rule. 

[22:00:14](#3ii7_1d-Y_XJ4UKbrmln8cTwlccXfVmJ-72XLxfllDQ) <GiuseppeChillemi (GiuseppeChillemi)>:
hiiamboris: I have this problem interpreting PARSEE output:



[22:00:21](#PrdclWRDNvKl_IPfLU7J3ew_39L9WaqKW8jwi5AacCE) <GiuseppeChillemi (GiuseppeChillemi)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/c5d561a55955cbcc41ea03275a9397c3f5b263ef1751726934271721472)

[22:01:17](#kxGFq7vIErF1UhJp5jJ0yM36cqqfVL9aHJ3VejsIfhU) <GiuseppeChillemi (GiuseppeChillemi)>:
```
page: [a1 [b2 c2 [c3 [b4]]] x y [x1 [z1]] ]
linear: [set position block! (probe position) | skip] 

parsee page [any linear]
```


[22:02:01](#lWijmk5yPpvNL0N4iIx3SOkyTyxOHP_Whc6IXWVR3-4) <GiuseppeChillemi (GiuseppeChillemi)>:
`SKIP` is never outlined with a green color or orange. But I think it should. 

[22:02:26](#7UzBjKJn8dmWxN2SzdNp5TF1d7VJ7Wg1zRL33qIDRDw) <GiuseppeChillemi (GiuseppeChillemi)>:
So it is parsee not outlining it SKIP is really never executed?

[22:02:37](#q9HrrAQAzUFh7om7a-kx_TyYdHvTvFfZuPInv8DcM9Q) <GiuseppeChillemi (GiuseppeChillemi)>:
 * So it is parsee not outlining it or SKIP is really never executed?

[22:03:53](#kN74Dsrwgzdcn7T9T1zRRZJXh1zs0LBIlNreJfCvUwU) <hiiamboris>:
I can only show what `parse/trace` tells me

[22:04:22](#kuO5vgbCA0B7KoEqp2lLUd2cL2XBdrEQR1UC2JCTwpc) <hiiamboris>:
I agree in theory I'd like that too

[22:07:03](#BxnI01UdncRQwzy9jSRH7ng-MoJ6Qd1qL-aMqOnvgIA) <hiiamboris>:
by the way, I already go at quite some lengths to interpret it's low level output into something meaningful

[22:07:12](#LA7IQOKuKtJxe4AaV5UEvuz8yozAQJLS6Z-WgRd4F3w) <hiiamboris>:
* by the way, I already go at quite some lengths to interpret its low level output into something meaningful

[22:08:35](#WWejUJeLvqm0TU_ofR-cb4jMaHYy0XtQiYWlJqqZs2c) <hiiamboris>:
* by the way, I already go at quite some lengths to interpret its low level output into something meaningful: 
https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/parsee.red#L309-L507

[22:09:36](#EC3MFh69UKy-6Kk2tpBs2bDWjEqbRaM6BHtXOLbp46c) <hiiamboris>:
but some things I just don't know how to achieve

[22:11:15](#f2SnDpRSfBMBit_ylsStfj1atyI_ciE59Zz5zE3jNqM) <hiiamboris>:
maybe I could detect that the rule exited then insert a fake event at the end of the alternative it was last one, but not worth the complication to me

[22:11:27](#p8DMA-2Fqwn8SQFA1sYx9cCGZh-5D7KY7gnWT9DXPlA) <hiiamboris>:
* maybe I could detect that the rule exited then insert a fake event at the end of the alternative it was last on, but not worth the complication to me

[22:12:25](#kk6FGgWNDLBgvNVrzePD244kkKevvfSQ8zK6mxwB0Rk) <hiiamboris>:
I'd rather wait for an upsteam fix than add more kludges

[22:17:42](#MABXr1rJ2yunmLWLKJkwzdTXsSsLmYKJultUtZkOfcA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> I'd rather wait for an upsteam fix than add more kludges

I would wait too. You have created a lot of fixes that needs to be addressed from the Red team.

[22:18:26](#39wFK4TzezXIlKM29M6qmCr1vstFJk52HAM-3yeNAOk) <GiuseppeChillemi (GiuseppeChillemi)>:
I'll write to you some notes at the end of my experiments. I am using both `parsee` and `parse-trace`

[23:01:44](#KpMegoK6Grm1NWyl_HDOUzc6MM7Cw8u4zCK7eaqdww0) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> See how that assumption cannot work out? Entering another block from the block which is currently parsed is not "changing series position", it's continuing with parsing _another_ series - a completely different story. Hence you have to tell `parse` what to expect from the block you've just entered with `into`. And note that your `ahead block!` isn't required to just `into` in it if a block is what is to be found at the current parse position. It is however preventing you from `into`ing into `paren!`s, with the chance being that inside such a paren a function is defined which you are going to miss. 
> 
> Anyways, you just can't statically parse Red code and have hopes to find anything other than the most trivial function declarations at the same time: 
> ```
> challenge-giuseppe: apply get pick [func function] odd? now/weekday [[] ["go find that!"]]
> ``` 
> Ì†ΩÌ∏ú

I have found one source of problems: what is AHEAD: the position in front of the current one or the current position?

```
parse-trace [a [b]] [ahead block!]
```



[23:02:20](#54UxVLfu3xwI776MkZ8biO3Tw3v2NMgTz5XnG-ZImqA) <GiuseppeChillemi (GiuseppeChillemi)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/3803f3121638241ed3a97fd8fefa60f29bf7a4441751742531898441728)

[23:05:38](#MVSd0rJv15GbwT8mDTh9-lm07TpMLFLXCnxMncnINlc) <GiuseppeChillemi (GiuseppeChillemi)>:
In parse, the concept of NEXT (AHEAD of current position) seems not the same as in RED. 

[23:06:34](#bVTGQpcsHrpkl415sNFGUU9gNOhcwzmonm50E1lvXts) <GiuseppeChillemi (GiuseppeChillemi)>:
 * In parse, the concept of NEXT (AHEAD of current position) seems not the same as in RED. It seems the AHEAD to MATCH on the current position.

[23:06:55](#z3QV2Dvbs_kAaHs4i63_Ip12P8-4uzdz6EREGCjPxFM) <GiuseppeChillemi (GiuseppeChillemi)>:
 * In parse, the concept of NEXT (AHEAD of current position) seems not the same as in RED. It  "AHEAD to MATCH on the current position".

[23:08:34](#rzSPwaPhC2euZMoCGenvk8WxdkippPh4N954rdEM8Jw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * In parse, the concept of NEXT (AHEAD of current position) seems not the same as in RED. It seems "AHEAD to MATCH on the current position".

[23:26:04](#8LdsM_G6iPqmY9B10KsGlDaMUQJBOZZcdsn8bl8bu9w) <GiuseppeChillemi (GiuseppeChillemi)>:
This part amazes me:

```
page: [a1 [b2 c2 [c3 [b4]]] x y [x1 [z1]] ]
linear: [ahead block! | skip]

parse-trace page [any linear]
```

When the input succeeds on the block, then the `AHEAD` rule seems halting the whole execution. I exect a dead lock as `ANY` is "match the rule one or more times". Instead after AHEAD matching, there are no more matches.

[23:26:23](#rztNY_b6vf103ZMGQ7yfUCIcpvJg72HiEZa_QiRrvAI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * This part amazes me:

```
page: [a1 [b2 c2 [c3 [b4]]] x y [x1 [z1]] ]
linear: [ahead block! | skip]

parse-trace page [any linear]
```

When the input succeeds on the block, then the `AHEAD` rule seems halting the whole execution. I exected a dead lock as `ANY` is "match the rule one or more times". Instead after AHEAD matching, there are no more matches.

[23:46:08](#yeEFNbVJsQH8EuPeR4E9yo-Fsrs6D_JiQdmxcF5zcq8) <GiuseppeChillemi (GiuseppeChillemi)>:
 * This part amazes me:

```
page: [a1 [b2 c2 [c3 [b4]]] x y [x1 [z1]] ]
linear: [ahead block! | skip]

parse-trace page [any linear]
```

When the input succeeds on the block, then the `AHEAD` rule seems halting the whole execution. I exected a dead lock as `ANY` is "match the rule one or more times". Instead after AHEAD matching, there are no more matches.

[23:55:13](#ie6oMCZ8zNKmLzAp5kRpV1GSQIuSK6yJiHsJZyelzbc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I have found one source of my problems: what is AHEAD: the position in front of the current one or the current position?

```
parse-trace [a [b]] [ahead block!]
```

[23:55:32](#LgVnz6r1L6bdhZ3eGZ8nUm-zPC70PFe8Lb3cEt4Z-Ec) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I have found one source of my problems: what is AHEAD? Is it the position in front of the current one or the current position?

```
parse-trace [a [b]] [ahead block!]
```

## 29-Jan-2024

[0:19:43](#GlhuDyl3Ux8k_pkz90CM7_aBs7mWYvYyYX68FwBiwPw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * This part amazes me:

```
page: [a1 [b2 c2 [c3 [b4]]] x y [x1 [z1]] ]
linear: [ahead block! | skip]

parse-trace page [any linear]
```

When the input succeeds on the block, then the `AHEAD` rule seems halting the whole execution. I expected a dead lock as `ANY` is "match the rule one or more times". Instead after AHEAD matching, there are no more matches.

[6:30:43](#LQaVrTppMvg45_bS3Jexjqwe8JyvBNA6cjwBzD9OPOg) <gurzgri>:
2nd sentence on `ahead` in the docs: "Fails in case of a rule failure, otherwise succeeds *without advancing* the input." (emphasis mine)

[6:41:35](#hbOuR1zJnF_P7nnhQny5OkMjkXxTG-2kGpn8OAzfVhA) <gurzgri>:
In other words: if `ahead` matches, you are still ahead of what `ahead` just matched. So your rule fails because there is more input but not more rule to process it.
```
parse [[a]] [ahead block! block!] ;== true
```

[6:47:28](#zDtg0_oQScCNiFA_LEOoJ9tWxo5zNOSw_j5DYA3jt-c) <gurzgri>:
`ahead` parses the current position but doesn‚Äòt "reposition" on success: "Preemptively matches a given rule".

[11:50:52](#O4WoqmpGfd_22aHmYtaltDyJN0HuH0ftWG8eSMSjtLE) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> 2nd sentence on `ahead` in the docs: "Fails in case of a rule failure, otherwise succeeds *without advancing* the input." (emphasis mine)

After some sleep, I think that AHEAD was meant as "match the rule ahead". But AHEAD may also be applied to position so this second interpretation.

[13:29:15](#tx5VWQyRBiIYRPt6KTGJ4Bi7jtgLE8FkPYIluwuuUcw) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> In other words: if `ahead` matches, you are still ahead of what `ahead` just matched. So your rule fails because there is more input but not more rule to process it.
> ```
> parse [[a]] [ahead block! block!] ;== true
> ```

Please observe this:

```
parse-trace page [any [ahead block! | skip]]
```

When `BLOCK!` is matched, the execution blocks. We are on the second element.

If you execute this:
```
parse-trace page [any [block! | skip]]
```
When `BLOCK!` is matched, parse stop its execution.

So `AHEAD` on success modifies the working of `ANY`. It stops the process regardless of it. The only thing I imagine is that ANY stops the execution in case of success if at the same time input does not advance. But I don't know if it is right to infer this and if it applied to other rules. 

[13:29:46](#Fj9IQMrGf-dg7Kn_DvnOM0dFsrUmNvhsQLS21_Ckjzc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Please observe this:

```
parse-trace page [any [ahead block! | skip]]
```

When `BLOCK!` is matched, the execution blocks. We are on the second element.

If you execute this:

```
parse-trace page [any [block! | skip]]
```

When `BLOCK!` is matched, parse continues its execution.

So `AHEAD` on success modifies the working of `ANY`. It stops the process regardless of it. The only thing I imagine is that ANY stops the execution in case of success if at the same time input does not advance. But I don't know if it is right to infer this and if it applied to other rules.

[13:31:39](#jyowQYhToEMaeG3Q_oXt2_mBGeNfkCtjTJZiEWQGI-k) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Please observe this:

```
parse-trace page [any [ahead block! | skip]]
```

When `BLOCK!` is matched, the execution blocks. We are on the second element.

If you execute this:

```
parse-trace page [any [block! | skip]]
```

When `BLOCK!` is matched, parse continues its execution.

So `AHEAD` on success modifies the working of `ANY`. It stops the process regardless of it. The only thing I imagine is that ANY stops the execution in case of success if at the same time input does not advance. But I don't know if it is right to infer this and if it applicable to other rules.

[13:40:22](#mH7NbvkrxPyAWrEKAY2NiSob2JtYUAu69GLG1EWrwqI) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> exactly, to claim anything you need metrics, and one person that never follows instructions is not a metric, it's dissidency

Please, let me answer this.
I perception science, metrics is not based on the direct measurement on a document but on the perception of people. So when MP3 has been built and tuned, the Frahunofer Institute has not measured sound but what people say about that sound. The same for JPG, MPG, AAC and anything else which needs their interpretation. So if 9 people say a sound is "transparent" on double blinded test, then the measure is "transparent"; if 1 say it is transparent and 9 hear a difference, it is classified as different. The same happens to a document. The only measurement possible is buiding one or more target segment (newcomers, expert coders and their respective backgrounds) and then make indirect measurement and the opinion about about what they read.

[13:40:30](#0szofc8588QJNPoFpnmIQHx96P7CEIXwpLHREX8PmVo) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> exactly, to claim anything you need metrics, and one person that never follows instructions is not a metric, it's dissidency

 * Please, let me answer this.
In perception science, metrics is not based on the direct measurement on a document but on the perception of people. So when MP3 has been built and tuned, the Frahunofer Institute has not measured sound but what people say about that sound. The same for JPG, MPG, AAC and anything else which needs their interpretation. So if 9 people say a sound is "transparent" on double blinded test, then the measure is "transparent"; if 1 say it is transparent and 9 hear a difference, it is classified as different. The same happens to a document. The only measurement possible is buiding one or more target segment (newcomers, expert coders and their respective backgrounds) and then make indirect measurement and the opinion about about what they read.

[13:40:46](#Qvx8olH9g397McnyU_UhPXBVmOoBSqL-qxzGmgzHBLU) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Please, let me answer this.
In perception science, metrics is not based on the direct measurement on a document but on the perception of people about that document. So when MP3 has been built and tuned, the Frahunofer Institute has not measured sound but what people say about that sound. The same for JPG, MPG, AAC and anything else which needs their interpretation. So if 9 people say a sound is "transparent" on double blinded test, then the measure is "transparent"; if 1 say it is transparent and 9 hear a difference, it is classified as different. The same happens to a document. The only measurement possible is buiding one or more target segment (newcomers, expert coders and their respective backgrounds) and then make indirect measurement and the opinion about about what they read.

[13:41:17](#WIfDDTlNmWVmP4rsai6KJgPT1IJgsbu_M8w_I5n77Iw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Please, let me answer this.
In perception science, metrics is not based on the direct measurement on a document but on the perception of people about that document. So when MP3 has been built and tuned, the Frahunofer Institute has not measured sound but what people say about that sound. The same for JPG, MPG, AAC and anything else which needs their interpretation. So if 9 people say a sound is "transparent" on double blind test, then the measure is "transparent"; if 1 say it is transparent and 9 hear a difference, it is classified as different. The same happens to a document. The only measurement possible is buiding one or more target segment (newcomers, expert coders and their respective backgrounds) and then make indirect measurement and the opinion about about what they read.

[13:41:41](#T5_J1zNhDu2xYNz82n24s6Ll304ow6GnpXedYOLSZ8E) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Please, let me answer this.
In perception science, metrics is not based on the direct measurement on a document but on the perception of people about that document. So when MP3 has been built and tuned, the Frahunofer Institute has not measured sound but what people say about that sound. The same for JPG, MPG, AAC and anything else which needs their interpretation. So if 9 people say a sound is "transparent" on double blind test, then the measure is "transparent"; if 1 say it is transparent and 9 hear a difference, it is classified as different. The same happens to a document. The only measurement possible is buiding one or more target segments (newcomers, expert coders and their respective backgrounds) and then make indirect measurement and the opinion about about what they read.

[13:52:24](#T5Dyfm3FJjQ-ZQ1M1Fb0HIc1eNG2cu3PkUETy_iJBfU) <GiuseppeChillemi (GiuseppeChillemi)>:
I have made furter tests on the console:

```
parse-trace page [any ahead [integer! | skip]]
```
Here parse stops on `SKIP` (success). So it seems it halts the rules on success until processing is resumed from another rule.
It seems 

[13:52:47](#15JBxi4NT1SoqwHeaPY6KecbI6xBbCk10xsS7XdVl0s) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I have made furter tests on the console:

```
parse-trace page [any ahead [integer! | skip]]
```

Here parse stops on `SKIP` (success). So it seems it halts the parsing on success until processing is resumed from another rule.
It seems

[13:52:49](#a40t_78Y7NulJP1AsOwv5iCAEo3BUJlxg7Zte47hsmg) <hiiamboris>:
> But I don't know if it is right to infer this and if it applicable to other rules. 

Maybe you should try documentation?

[13:53:04](#uYRFDSBGENx4jZtpDry9diyVVriZoNLprL-mFTaokU0) <hiiamboris>:
![](https://tchncs.de/_matrix/media/v3/download/tchncs.de/769397079e36f91450d2925cd0c626fecf165fb2)

[13:54:30](#HvRKSzylaV3d8kVtvtMcLcB9Hy8dqrJnOs9Bxdc1gYA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> > But I don't know if it is right to infer this and if it applicable to other rules. 
> 
> Maybe you should try documentation?

I have already read parse red-lang blog, parse wiki, Ungaretti page and documentation. If there is anything else to read which explain exactly how `ahead` works you are welcome.

[13:54:54](#OGAyx6JiN6DE5zczfEv0HIG2ejKuBLW2iH2mtEw_F-Y) <hiiamboris>:
I just inserted a quote Ì†ΩÌ±ÜÌ†ºÌøª

[13:55:14](#u4hvZe89KyGlo5krc8YZuqap5J0iD5O7L6Q1Q2UhVjI) <hiiamboris>:
Again, something is completely wrong with your way of reading.

[13:57:29](#38wDjFzIdiHQoBfX0QwrvNF2b4JQcQhAmkfxpX8wy4M) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> Again, something is completely wrong with your way of reading.

I have read AHEAD, so it is not my way of reading but just ANY which was still not read.

[13:57:55](#nkcvyRpygdn1psay66Bov5Vr03MVOnxtYmfOiYZi4Eg) <GiuseppeChillemi (GiuseppeChillemi)>:
(But as you can see, the working was inferred)

[13:58:03](#Q74q1yrxXlVmquD3vJ4sWUg0Lx1N6cx5BNhp4N9pfqo) <hiiamboris>:
10 people is already a statistically significant number, yes

[13:58:10](#2MNlUpqAJtRZTTWrPiYyPDnHXUUArQ3P4n46KyIivWk) <GiuseppeChillemi (GiuseppeChillemi)>:
 * (But as you can see, the working has been inferred)

[13:59:53](#i9vra5hfnkkLwQapweJNi58GLuIxESi9eV4UxpO8PcI) <hiiamboris>:
I could also brag about the idiocy of the "let's ask what people say" method and how it led to audio quality degradation of all headphones today, but it's off topic

[14:11:22](#BcpQW2d5dmHtDT5i0h_oVe2xFkrg8u8qD53DNmUglls) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> 10 people is already a statistically significant number, yes

I have put a number for example, not to say it is the proper one. In some tests it could be ok, in some other you need bigger ones. The compositions of the panel depends on what you have to measure, the variancy of manny elements... 

[14:11:28](#LqNcN5VcoSzru6MLI_fkWH6EyuSYBRYTZJHuYuh5GZQ) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> 10 people is already a statistically significant number, yes

 * I have put a number for example, not to say it is the proper one. In some tests it could be ok, in some other you need bigger ones. The compositions of the panel depends on what you have to measure, the variancy of many elements...

[14:13:28](#eSS-Es4_F-RsBpH3Ybh4AK8g9XwUSlA6O6ijnaVm340) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> I could also brag about the idiocy of the "let's ask what people say" method and how it led to audio quality degradation of all headphones today, but it's off topic

Believe or not this is how psychoacustic models are refined.
Maybe you should apply to the latest call for listeners of the FraunHofer institute. They give 12EUR for each our of work. You will have the opportunity to say to some of the 250 scientist that their science is "idiocy".



[14:13:30](#Ow02SS4-LsdyFd7SV6u_ag_MO5N0McNC1CNezAMhnVA) <GiuseppeChillemi (GiuseppeChillemi)>:
https://www.iis.fraunhofer.de/en/ff/amm/listening-test.html

[14:13:49](#XWU7Q13NApeduf46ii8zGxR0GgomggWVf1zC7HR4tzg) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> I could also brag about the idiocy of the "let's ask what people say" method and how it led to audio quality degradation of all headphones today, but it's off topic

 * Believe it or not this is how psychoacustic models are refined.
Maybe you should apply to the latest call for listeners of the FraunHofer institute. They give 12EUR for each our of work. You will have the opportunity to say to some of the 250 scientist that their science is "idiocy".

[14:14:16](#85q4ryi1rKvlNux-kp_p7rdniJFaVmdxTWWeJS8SKG0) <hiiamboris>:
why bother? ;)

[14:14:35](#zFdCpnFKvrHzbtHIcj2ACsUZ_2EloDYonV3mNvk05Qc) <hiiamboris>:
let people play their roles

[14:16:48](#ezUJwnQVEMZmBoHg4KOH48rS4TLA7IFUpm7jgAlntFs) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> let people play their roles

So let people express their problem and opinions with the documentation and language experience as it is their role.. Expecially if their formation belong to that science.

[14:16:59](#Kcj7WIGyYKZHaDpuWtuphBcYVmEYBPCeIs385sKoQb8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> let people play their roles

 * So let people express their problem and opinions with the documentation and language experience as it is their role.. Expecially if their formation belongs to that science.

[14:18:23](#wRvqLKgkT4mVAukFUyDypSonsN7v4dkRsJiHqQNhyeY) <hiiamboris>:
but I'm listening to you, don't I ? ;) even though in a scientist role I would exclude you from statistics as a wicked outlier Ì†ΩÌ∏à

[14:21:00](#myp3F1YnBCpNgdo3W3OD0ddmxeeKNlqq_NMXoz_n5W4) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> but I'm listening to you, don't I ? ;) even though in a scientist role I would exclude you from statistics as a wicked outlier Ì†ΩÌ∏à

Lets return to conquer PARSE. Now I have a working rule able to extract quite all the set words of a scirpt until you use dynamic coding and/or different builigin instructions

[14:21:14](#4OZmKqQcBrjznmM5MH-L5BP9_7epEMwBaNMCbrpQF9E) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> but I'm listening to you, don't I ? ;) even though in a scientist role I would exclude you from statistics as a wicked outlier Ì†ΩÌ∏à

 * Lets return to conquer PARSE. Now I have a working rule able to extract quite all the set words of a scirpt until you use dynamic coding and/or different buildin instructions

[17:40:34](#ZW2UCdozkI28H54-s0vp6dmarjlecKDDx690M_zVLFY) <gurzgri>:
GiuseppeChillemi (GiuseppeChillemi) At this point, I really start to feel helpless. Hardly can't think of other words and ways to explain the obvious to you. But, here's yet another try: A rule `ahead something` differs from a rule `something` by succeeding if fed with the right some-thing at the current position but without advancing input beyond that thing. It is nothing but a "look-ahead rule", a "look what's coming now and succeed if it meets expectation"-rule instead of the usual "process what's coming now if it meets expectation AND move input position beyond it if so". Ì†ΩÌπè

```
meal: word! eat: [meal]
parse [pasta] [ahead 'pasta eat] ;== true
parse [pizza] [ahead 'pasta eat] ;== false, pasta lover dislikes pizza
```

"So AHEAD on success modifies the working of ANY" - No, just no. Ì†æÌª® I think I give up, I have no idea where that comes from and I think I don't want to know. Ì†ΩÌ∏â 

Why do even reason about `any` and complicate things further with, well, your ... made up theories ... before understanding just `ahead`. Why always try to be `ahead` of yourself (Cambridge Dictionary: "to do something too early, or before you are ready or prepared")? Ì†æÌµ∫

[17:54:04](#Ri1bX0uZRdGT0UBJO2uPec1ydNhcSGOrHhmabe41moc) <gurzgri>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> Please observe this:
> 
> ```
> parse-trace page [any [ahead block! | skip]]
> ```
> 
> When `BLOCK!` is matched, the execution blocks. We are on the second element.
> 
> If you execute this:
> 
> ```
> parse-trace page [any [block! | skip]]
> ```
> 
> When `BLOCK!` is matched, parse continues its execution.
> 
> So `AHEAD` on success modifies the working of `ANY`. It stops the process regardless of it. The only thing I imagine is that ANY stops the execution in case of success if at the same time input does not advance. But I don't know if it is right to infer this and if it applicable to other rules.

No, no, no. When `ahead block!` matches (`block!` is an argument to `ahead`), we are still on the FIRST element, that is what "not adavancing input" means.

```
>> parse-trace [1 2 3] [any [ahead integer! | skip]]
 -->
   match: [any [ahead integer! | skip]]
   input: [1 2 3]
   -->
     -->
       match: [ahead integer! | skip]
       input: [1 2 3]
       -->
         ==> matched                                      ; aha, there's an integer coming! so `ahead integer!` is feeling lucky
       <--
       match: [| skip]                                    ; [| ...]  - so our subrule is already done ( the part before the pipe) 
       input: [1 2 3]                                        ; but `ahead integer!` hasn't eaten that integer, so the rule fails 
     <--
   <--
 <--                                                                ; and because `any` detects that input did not advance it fails, too
return: false                                                
== false
```


[17:54:29](#mTmd1PyG7dX_dUOJaLC6mPHzICQsJk4xyzYivg5jDYk) <gurzgri>:
 * No, no, no. When `ahead block!` matches (`block!` is an argument to `ahead`), we are still on the FIRST element, that is what "not advancing input" means.

```
>> parse-trace [1 2 3] [any [ahead integer! | skip]]
 -->
   match: [any [ahead integer! | skip]]
   input: [1 2 3]
   -->
     -->
       match: [ahead integer! | skip]
       input: [1 2 3]
       -->
         ==> matched                                      ; aha, there's an integer coming! so `ahead integer!` is feeling lucky
       <--
       match: [| skip]                                    ; [| ...]  - so our subrule is already done ( the part before the pipe) 
       input: [1 2 3]                                        ; but `ahead integer!` hasn't eaten that integer, so the rule fails 
     <--
   <--
 <--                                                                ; and because `any` detects that input did not advance it fails, too
return: false                                                
== false
```

[18:00:12](#E5EwnKnOIT3rpD4BUGJVcSh3jzF_S532ym2Yr5L3LJU) <gurzgri>:
 * No, no, no. When `ahead block!` matches (`block!` is an argument to `ahead`), we are still on the FIRST element, that is what "not advancing input" means.

```
>> parse-trace [1 2 3] [any [ahead integer! | skip]]
 -->
   match: [any [ahead integer! | skip]]
   input: [1 2 3]
   -->
     -->
       match: [ahead integer! | skip]
       input: [1 2 3]
       -->
         ==> matched                                      ; aha, there's an integer coming! so `ahead integer!` is feeling lucky
       <--
       match: [| skip]                                    ; [| ...]  - so our subrule is already done ( the part before the pipe) 
       input: [1 2 3]                                        ; but `ahead integer!` hasn't eaten that integer, so the rule fails 
     <--
   <--
 <--                                                                ; and because `any` detects that input did not advance it stops
return: false                                                ; `any` has stopped, still we are on `[1 2 3]`, so parse fails
== false
```

[18:08:23](#AnFGf25a_iUIQlrDSVrGgLdke3AuvARs5Oz_KaJkU2Q) <gurzgri>:
```
>> parse [light] ['light (probe 'success!) input: (probe input)]
success!
[]
== true

>> parse [light] [ahead 'light (probe 'success!) input: (probe input)]
success!
[light]
== false

>> parse [light] [ahead 'light (probe 'success!) input: (probe input) 'light]
success!
[light]
== true
```

[18:15:28](#O8JFiPd1EQjbXy5TCekt_zkbdBJSiEHgCnnHU0B1IvE) <hiiamboris>:
`ahead rule` = `pos: rule :pos`

[18:50:40](#21CVhdrGbgkopDjZC9JEefBrT_u8xROw8QixBVrMSZk) <gurzgri>:
Yes, that's the tedious old way `ahead` now solves.

"Who does not know the past cannot understand the present and cannot shape the future." ‚Äî Helmut Kohl 1995

[19:16:04](#wSrMNWshIObW4TutBN9fV2XLf3L3_XalFvWqElLRC-Y) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> GiuseppeChillemi (GiuseppeChillemi) At this point, I really start to feel helpless. Hardly can't think of other words and ways to explain the obvious to you. But, here's yet another try: A rule `ahead something` differs from a rule `something` by succeeding if fed with the right some-thing at the current position but without advancing input beyond that thing. It is nothing but a "look-ahead rule", a "look what's coming now and succeed if it meets expectation"-rule instead of the usual "process what's coming now if it meets expectation AND move input position beyond it if so". Ì†ΩÌπè
> 
> ```
> meal: word! eat: [meal]
> parse [pasta] [ahead 'pasta eat] ;== true
> parse [pizza] [ahead 'pasta eat] ;== false, pasta lover dislikes pizza
> ```
> 
> "So AHEAD on success modifies the working of ANY" - No, just no. Ì†æÌª® I think I give up, I have no idea where that comes from and I think I don't want to know. Ì†ΩÌ∏â 
> 
> Why do even reason about `any` and complicate things further with, well, your ... made up theories ... before understanding just `ahead`. Why always try to be `ahead` of yourself (Cambridge Dictionary: "to do something too early, or before you are ready or prepared")? Ì†æÌµ∫

You are not helpless, you have provided a good explanation, even with italian words. The problema I had where basically 2: AHEAD in italian, language can be translated to "davanti" which means position too. So when you look ahead, you "guardi davanti". If you are in a car in the rear seat, you are looking to the street in front you or to the front seat... and yes, to the events in front of you too. In the mental combinatory, the positional explanation has prevailed, so I ended up thinking that AHEAD looks at the next (series) element instead of looking are the next event (rule) from the current position.

[19:16:52](#9OlrGNQOmowTIT2U1hDjdhCDMylhe3tfkA5896Lbj7M) <GiuseppeChillemi (GiuseppeChillemi)>:
* were

[19:26:25](#b49-OAvcsc4sdoxjs9nXbNqb3TVQ8dshoKHpgPpA5tA) <GiuseppeChillemi (GiuseppeChillemi)>:
As prof I have understood I will post the rule I was working on.

[19:32:18](#2H00Y3HSdHQDcLnSEkN36GpOe6H0Xl9pXXYDJ3BUyno) <GiuseppeChillemi (GiuseppeChillemi)>:
* As proof I have understood I will post the rule I was working on.

[22:33:44](#0WuGJfva7qFdHpfek72OGWxssl1cfQwf1IYaGk_YETo) <GiuseppeChillemi (GiuseppeChillemi)>:
I have created a gist with my [collect-functions](https://gist.github.com/GiuseppeChillemi/a654ebaa519fb042038906175cd73ace)

[22:34:37](#FXKwFXH5dj7XGIwuWzbURMCaylOtFPh2IYN4Hx84150) <GiuseppeChillemi (GiuseppeChillemi)>:
I hope you like it. Every suggestion is welcome

## 31-Jan-2024

[12:21:35](#lj5hMWseyxsg0LVPtiSD5BjUIgOopgG2UX87wOThXcw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
... you just need to wait ;)

[19:45:40](#FglTBufQHuKwE01Tgmr3_z_kuDfZUXJH_UInhjFAeII) <greggirwin (Gregg Irwin)>:
Thanks for sharing GiuseppeChillemi (GiuseppeChillemi) .

## 1-Feb-2024

[3:01:14](#c5lSYIUhElenDb6xuACVmNKSxefcaEE7kBN2KfJ8SMs) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Thanks for sharing GiuseppeChillemi (GiuseppeChillemi) .

Your are welcome. You have shared your entile working life making Red free and open.

[3:01:19](#9alyCk_BGjw8To5d1H9wF6ATbLnHhuEqIddxMICQe7k) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Thanks for sharing GiuseppeChillemi (GiuseppeChillemi) .

 * Your are welcome. You have shared your entire working life making Red free and open.

## 5-Feb-2024

[18:05:51](#AKV6azwUQAwRzdZ1Fl6kRPzQeDqZ3Wvz8mu8MioXukI) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> ... you just need to wait ;)

I hope we can speed up because we are stopped and very few improvements are emerging. We must find a way to unblock this, financially or in other ways.

[18:06:34](#LWUdGHVcBUt7Me_XEIyDxgCKUcRkrKSLLgW4OdRmhN8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> ... you just need to wait ;)

 * I hope we can speed up because we are stopped and very few improvements are emerging. We must find a way to unblock this, financially (finding the resources for DEVS like you to come back) or in other ways.

## 12-Feb-2024

[18:43:30](#Ln2FZbKAVa4XdOOYI3nahUG8Z40-jXI5T7HlGUXGH9w) <GiuseppeChillemi (GiuseppeChillemi)>:
Which is the right way of doing this?

```
x: 'b
parse [a b c d] [to x]
```

[18:45:26](#0b996y2z3K9SXOncBVuY3_idrRcR0JblHfAYenmIbZE) <hiiamboris>:
`x: ['b]`

[19:27:54](#jbk14mHR09lioh7Ms4OF-mOumS_LO-mXCFiGGPh_X-A) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> `x: ['b]`

Thank you

[19:29:51](#rPWHh94sE13xZnb2xMlv_AlgiTBJbs660Ne2XVlwxJo) <GiuseppeChillemi (GiuseppeChillemi)>:
-----------------
What I miss in parse is a way to easily know the level of block I am in.
I mean if you enter INTO a block or a paren, level raises by 1, when you exit, level should lower by 1.  If you query the level, you know which level your are

## 13-Feb-2024

[3:27:47](#tSqkCrJmBHWBGcuXdnJUkiawGd0lZ2M_OmXX8bmnQFc) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> `x: ['b]`

I imagine `lit-words` and `set-words` needs `[quote 'b]` or `[quote b:]`.  Are there other datatypes which could not be used directly? 

[8:20:46](#zbqQmnwrPLFxnucWDpY3Os8MPZk6-ae1DWraTK0Axhg) <hiiamboris>:
blocks, parens, integers obviously

## 17-Feb-2024

[1:43:38](#wKsj_RlvaGGRJSPExJtid7W31haScNRydj2sMZBdsDk) <GiuseppeChillemi (GiuseppeChillemi)>:
How do I parse a datatype? This does not work:

```
>> parse [string!] [datatype!]
== false
```

[1:46:12](#l3l72UYLFBvJ9pV1XjDlQ_DDV1i1epht9TefTTovRMA) <GiuseppeChillemi (GiuseppeChillemi)>:
(Obviosly, as it is a word... )

[1:48:35](#B1m6mFLZuB55vJkxxGIjtbXSjSXgwLRr0MmQebDQXmQ) <GiuseppeChillemi (GiuseppeChillemi)>:
I have found only this one:

```
>> parse [string!] [set word word! if (datatype? get/any word)]
== true
```

[1:59:16](#5IVjKPPAqMt4A6mUnEly_-yf1ZBqizUU0hZ0twbD7iM) <GiuseppeChillemi (GiuseppeChillemi)>:
I have found only this one:

```
>> parse [string!] [set word word! if (datatype? get/any word)]
== true
```

[9:37:12](#-WjMHxEyl8RJ-Nd_mGi4p1ovD1sO1MNB3FpsSpixzo8) <Oldes (@oldes.h:matrix.org)>:
```
>> parse [#(string!)][datatype!]
== true

>> parse reduce [string!][datatype!]
== true
```

[10:29:16](#znlLeRtj79UibI9I8Qq7JAHu9qeJiBYj1aknXtGsC2s) <hiiamboris>:
don't forget typesets too

[10:30:09](#VitAGax4GCDXOs7t4e8nh9BxzPHOmn5aYeRDgCJaDLg) <hiiamboris>:
also if you don't want to support user-defined typesets and aliases, you can look it up in `to block! any-type!`

[10:30:43](#P7so6R-k5cyijm4c8Sf1xcG2GWf3rB_1ZXWE6cROHEY) <hiiamboris>:
* and if you don't want to support typesets and user-defined type aliases, you can look it up in `to block! any-type!`

[11:06:09](#wUMi7jlQxmXoJ6mZTxxp2_aW36cHLABlpmtMTGfiWSg) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> and if you don't want to support typesets and user-defined type aliases, you can look it up in `to block! any-type!`

I have not understood this phrase 

[11:15:14](#h9LTJMzYCfmFrMvoZ6rQ4F9pq5aETAJsOJN9BB5gj3c) <Oldes (@oldes.h:matrix.org)>:
```
>> t: type? first blk: [a]  parse blk [t]
== true
```

[11:42:47](#ykUF2CxN07x3_d7GXZUxs6c8Bm8dsmcBmm_kiz3MNp4) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@oldes.h:matrix.org> ```
> >> parse [#(string!)][datatype!]
> == true
> 
> >> parse reduce [string!][datatype!]
> == true
> ```

This could be dangerous as the block could hide a function. Actually we don't have a single command to reduce a block without activating functions.

[11:45:43](#YSrHf4dKC4ihtm6qj1hRpaPCm-V9wjln5mUYciYsRR8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> I have not understood this phrase 

Ok, now I have understood. ANY-TYPE Is a typeset that reduces to the single types.

[11:47:54](#zkySBv0fzAEHeEhgqwAaUrknZTQD1hmCyePfioCkCAs) <GiuseppeChillemi (GiuseppeChillemi)>:
I am parsing the function specs so I need to search for typesets and UDTA too.

[12:05:06](#FlYKtJHICCYkXcp6e9Rn797uY82VYZllv_gpEJwTQeY) <Oldes (@oldes.h:matrix.org)>:
The reduce there was used just for you to understand what is `word` and what is `datatype`.

[23:53:26](#O87NHnU_hfkhL3PXgMX0_SIWN4QJUqDVSdcdXU8vrKI) <GiuseppeChillemi (GiuseppeChillemi)>:
`INTO` accepts maps but how it works?

```
M: append copy [] make map! [a:22 b:44] 
parse m [into []]
```

[23:53:38](#Vsilyk188Zo7o05FAWg-lq2zxQn6siV4W9GtZ42Tb38) <GiuseppeChillemi (GiuseppeChillemi)>:
 * `INTO` accepts maps but how it works?

```
M: append copy [] make map! [a:22 b:44] 
parse m [into [???]]
```

## 18-Feb-2024

[1:51:41](#yWneZHm2CpETcoFtMawC-JHCq4njuuTyNyGbTquB5_M) <greggirwin (Gregg Irwin)>:
I don't think `into` enters maps, as it can only work against series, which maps are not.

[1:54:30](#nr4gNQ26sSRpCco70-jsOMXJJOZ3e_5fVPUO_0LhHe0) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> I don't think `into` enters maps, as it can only work against series, which maps are not.

It seems it enters without erroring

[1:56:24](#obudJZ9BeJs5kRiZlVPJLuNbwemINCeN7dF8Ud5_ecA) <greggirwin (Gregg Irwin)>:
```
>> parse [#[c: 3 d: 4]] [into [(print 'x) some [set-word! number!]]]
== false
>> parse [[c: 3 d: 4]] [into [(print 'x) some [set-word! number!]]]
x
== true
```

[1:56:25](#yPCypJ2mWSoVeG-0hWDj1u6SVrMPoAPTLmA-KuFVpKk) <GiuseppeChillemi (GiuseppeChillemi)>:
No, it doesn't, but `INTO` fails as a rule and not as a syntax error, so the error is not visible

[1:56:56](#dbW1DLIwmwpl1U2c-nERNQhMwAQ6E3mk0X8msAaFj6M) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> ```
> >> parse [#[c: 3 d: 4]] [into [(print 'x) some [set-word! number!]]]
> == false
> >> parse [[c: 3 d: 4]] [into [(print 'x) some [set-word! number!]]]
> x
> == true
> ```

In fact!

[1:57:13](#Cgsz046lc9AWCZCkusrMsQXj9DOpMbYaVCLFpisZiTY) <greggirwin (Gregg Irwin)>:
Because it's not an error, it just doesn't match the value. Same as this:
```
>> parse [1] [into [(print 'x) some [set-word! number!]]]
== false
```

[1:58:39](#fYja-cUr2VMXUGPSi7b21ChcL1gKE-fJHBhYljZo_yY) <GiuseppeChillemi (GiuseppeChillemi)>:
I have found another interesting way to use parse for navigate: moving to a recurrence of a value:

```
parse [a 1 a 2 a 3 a 4 a 5 a 6 a 7] [5 [to 'a x: skip]] 
probe x
```

[1:59:06](#_VTP1KW9v2JBRPR1pPPrMlW4ryLgCDkoYOrKt3GVMgw) <GiuseppeChillemi (GiuseppeChillemi)>:
Result:
```
[a 5 a 6 a 7]
```

[2:02:59](#EC4Rw2FHJPzFC_aFB75W4Dk_HnQm4EH-VfTFAIfOUBY) <GiuseppeChillemi (GiuseppeChillemi)>:
FYI, I have completed a parse rule for functions specs. It was really hard.

[2:03:35](#9SXqfmHnHCipDCQNagUjR_PZgoIjRdOfM_-euQZ5KYQ) <GiuseppeChillemi (GiuseppeChillemi)>:
I think there are rooms for improvements but this is the output:

[2:04:18](#Lf4yKhNW1I8h__5dMO5FAThvMwLptY5sDZTYxevBa2A) <GiuseppeChillemi (GiuseppeChillemi)>:
Target: `FIND`

```
#(
    description: {Returns the series where a value is found, or NONE}
    flags: []
    args: [
        series #(
            datatypes: [series! bitset! typeset! port! map! none!]
            description: none
        ) 
        value #(
            datatypes: [any-type!]
            description: {Typesets and datatypes can be used to search by datatype}
        )
    ]
    refs: [
        length #(
            datatypes: [number! series!]
            description: none
        ) 
        wild #(
            datatypes: [string!]
            description: none
        ) 
        size #(
            datatypes: [integer!]
            description: none
        )
    ]
    locals: []
    returns: []
)
```

[2:04:33](#VfHQQNmp586AP4S_7qpD6ryLmjxTLYQl9suE49NouJM) <greggirwin (Gregg Irwin)>:
The hardest thing is that the function spec dialect isn't formalized.

[2:05:25](#BdfRr0NbhDtF1R1cX-0cHeh6KoGYOGEoBv6AIE2mqqE) <greggirwin (Gregg Irwin)>:
`help` also has a func spec parser in it, but I think you knew that.

[2:06:54](#kb-tNJzi7tSD_MbmhY10Qh1dLtv-cKge6x6_1ZLjPH0) <GiuseppeChillemi (GiuseppeChillemi)>:
No, I have not seen it but my whish was to create my own 

[2:11:26](#46NVSFkI1t3IwPxqcnPqccujEag41nVvW1vtLkBWDm8) <GiuseppeChillemi (GiuseppeChillemi)>:
That way of using parse is a parfect hit!:

```
parse ["a" a 1 "a" a 2 'a a 3 'a a 4 'a a 5 'a a 6 'a a 7] [5 [to [word!] x: skip]] 
probe x
```
Result
```
[a 5 'a a 6 'a a 7]
```

[2:11:44](#PBD1GuEQMdv6xvWdsqP2JcFDLqSimmm3i2Vgm7U5e4g) <GiuseppeChillemi (GiuseppeChillemi)>:
The fifth word...
...or

[2:16:10](#2aoZfNSMlm3e74ASEIWp7JX4vHHdmX-x4Fwj2ETNOoI) <GiuseppeChillemi (GiuseppeChillemi)>:
To an argument!:

```
to-argument: func [
	specs [block!]
	count [integer!]
	/local
	out-data
] [
	parse specs [count [to [word! | lit-word! | get-word!] out-data: skip]]
	out-data
]
```
Here:
```
probe to-argument spec-of :find 2


[
    value [any-type!] {Typesets and datatypes can be used to search by datatype} 
    /part "Limit the length of the search" 
    length [number! series!] 
  ...
]
```

[2:16:47](#3MD7WSIHsP1-oH2_iSdSeKWGbcu8FP5btXAU9tZrEzg) <GiuseppeChillemi (GiuseppeChillemi)>:
 * To an argument!:

```
to-argument: func [
	specs [block!]
	count [integer!]
	/local
	out-data
] [
	parse specs [count [to [word! | lit-word! | get-word!] out-data: skip]]
	out-data
]
```

Here we go to the second argument of find:

```
probe to-argument spec-of :find 2


[
    value [any-type!] {Typesets and datatypes can be used to search by datatype} 
    /part "Limit the length of the search" 
    length [number! series!] 
  ...
]
```

[2:17:09](#duXDHXwGUHTHRJDcjTMkstCWh4H6AD8xm-VHg2d2CMo) <GiuseppeChillemi (GiuseppeChillemi)>:
 * To an argument!:

```
to-argument: func [
	specs [block!]
	count [integer!]
	/local
	out-data
] [
	parse specs [count [to [word! | lit-word! | get-word!] out-data: skip]]
	out-data
]
```

Here we go to the second argument of `find`:

```
probe to-argument spec-of :find 2


[
    value [any-type!] {Typesets and datatypes can be used to search by datatype} 
    /part "Limit the length of the search" 
    length [number! series!] 
  ...
]
```

[2:17:42](#WgSv0fWgbooYy0uy0GqoloVuO8Lf4u3p9BmkQX8ebUU) <GiuseppeChillemi (GiuseppeChillemi)>:
When I will have time I will perfection it to move to the corresponding local or refinement

[2:22:50](#dPB0lMp_eyKPGlYgfPyzHYbaZ4xv-DJx2UtvAdAxNRM) <GiuseppeChillemi (GiuseppeChillemi)>:
 * To an argument!:

```
to-argument: func [
	fn [block! any-function! word!]
	count [integer!]
	/local
	out-data
] [

	case/all [
	 word? :fn [fn: get :fn] 
	 any-function? :fn [fn: spec-of :fn]
	]
	unless block? :fn [do make error! "Not a function"]


	parse fn [count [to [word! | lit-word! | get-word!] out-data: skip]]
	out-data
]
```

Here we go to the second argument of `find`:

```
probe to-argument 'find 2


[
    value [any-type!] {Typesets and datatypes can be used to search by datatype} 
    /part "Limit the length of the search" 
    length [number! series!] 
  ...
]
```

## 19-Feb-2024

[2:23:15](#lGrXXj2PNkKdpca5jaWbhLRikcTtfATKHHuTQiYRQsM) <GiuseppeChillemi (GiuseppeChillemi)>:
hiiamboris: funny, It seems I see two different smiles on my PC and on mobile. One with crossed eyes, another with open eyes. I will check tomorrow again


## 22-Feb-2024

[6:04:15](#Yp76P3fXTbslzYE1D8m0o_oj_5-VwudM0KV49HiZhTs) <lylgithub2021 (lylgithub2021)>:
I tried to count the number of a given sub-string in a string, pls see the following codes. The result I think should be 3, but I get 2. What's wrong with my codes?
```
>> s: "aa^-bb^-cc^-dd"
== "aa^-bb^-cc^-dd"
>> parse s [(n: 0) some[to "^-" (n: n + 1)] (print n)]
2
== false
```

[6:21:36](#0LWPgU-t4GW3snKebN3YyalP2tctaBsJCRmcBu6d3q4) <Oldes (@oldes.h:matrix.org)>:
You are not skipping the LF. Use this:
```
>> parse s [(n: 0) some[to "^-" skip (n: n + 1)] (print n)]
3
```

[6:22:46](#vHvgaWAhOP938WX-IigrMvka68FiXayzTSTpYeNMifw) <Oldes (@oldes.h:matrix.org)>:
The reason why it was 2 is, that the first run you skip to LF, the second time it sees the LF but because the rule does not advances, it stops.

[6:23:31](#CcsgWLdjy2_Y_aSOLE0-nMpmR6UkFmQSl09eHKaLlqg) <greggirwin (Gregg Irwin)>:
Tab, not LF. 

[6:23:53](#1Fg5mS3SQbhrTQUIIUnCNDPucyUTDIwDlAI1crRYrQI) <Oldes (@oldes.h:matrix.org)>:
ok.. TAB or LF:)

[6:24:24](#cEKDEwaJUlBF_xdqiVzzTvJS7V6XI3xTrrNz5Njufbk) <Oldes (@oldes.h:matrix.org)>:
You can also use `thru` instead of `to`+`skip`:
```
>> parse s [(n: 0) some[thru "^-" (n: n + 1)] (print n)]
3
```

[6:24:47](#gyCaGD-LxrjkI2cC3AfeknCtQCittAmcqnoihSnGceM) <greggirwin (Gregg Irwin)>:
:^)

[6:41:24](#-j8h2qj8Ym53lR3WPyMK18ZEtb7iaaSRxVbhwc4s06o) <lylgithub2021 (lylgithub2021)>:
Oldes: greggirwin (Gregg Irwin) Thank you so much for these detail infoes!!

## 5-Mar-2024

[13:10:24](#3ihYeKpGTQTdsZlG7mDE7EPOawva8o_VBF2iulXR7eE) <bubnenkoff (Dmitry Bubnenkov)>:
Few years ago here was posted tool for testing parse rules, could anybody give a link to it?


[13:25:10](#WytKRPGfLNaiOXLMQsyoPHuFnYDeRuTd4kWmeMGUhX0) <hiiamboris>:
https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-red
https://github.com/gltewalt/parse-caddy

[20:23:34](#jUeVKFC-T_26ax6FQ2Qb0PmdeQCw2IgYRBy-6xt85fk) <greggirwin (Gregg Irwin)>:
Also, gltewalt (Greg T) 's parse-caddy.

[20:24:38](#kCwP3XaGknoiG9DsWAVEB2mAA_nOQdsUzJWQCtI3bv8) <greggirwin (Gregg Irwin)>:
hiiamboris's is incredibly advance though.

[20:26:10](#TXW4ZqQRtqAIotLEWPJw1me2YlTefAl_Zx7YP_-pOhE) <hiiamboris>:
I mentioned it

[20:28:26](#EzU72zBI0puYp7ZbnskGU0WipJ22hO7eW84fkcKXtZQ) <greggirwin (Gregg Irwin)>:
Ah, indeed. Thanks. Looked like one long URL here.

## 11-Jul-2024

[13:26:20](#2Ex_4aX4LrsnWR5FbEbnorC4ViWyydQKlMSikTRmQXk) <gor77 (gor77)>:
Hi, This whole thing of using API with Parse is interesting. Are there any examples of using parse/trace and callback? 

[13:28:36](#CaPiVUi9HHhVZR-22SSKyo0zEAdhDht76msEOdP-wlo) <gor77 (gor77)>:
...or any tutorials out there?

[13:30:13](#NBFHP8UL1JQ7wj7Xu0YMsjLFf2HKgEsfbOSIpluM8XY) <hiiamboris>:
welcome gor77 (gor77)
how about `?? parse-trace` in the console?

[13:30:52](#ZyxAAtSjaqF9gL53QCgPjvVKeD591WrAnbJnjfjnfPg) <gor77 (gor77)>:
Yes, I've tried that. But I'm looking for something a bit deeper

[13:31:22](#qp8xr4R3O2CyiqsKsI5Q3CENJMebMLohYZMMxPhwBqY) <gor77 (gor77)>:
To actually understand what's possible with this kind of api

[13:31:47](#KR1Ky0lsoDYhK4mngpTCqWeDgvV2qyrvpfZrPU-UV6M) <hiiamboris>:
though the event function is hidden a bit, let me see

[13:32:32](#Y_aORcJoWfF-V6jggVk_j7fa0RS1xEsta9yTD0AiARo) <hiiamboris>:
`source (to word! last body-of :parse-trace)` to bring the source of the event function

[13:33:29](#asig6MS2GvGVpdLVLQrYXGTAFf1GRaPEu9W3E7nJXKU) <hiiamboris>:
well, my ParSEE tool shows what's possible but TBH.. it was a veeery rough ride with a lot of workarounds, kludges and requests to the designer :)

[13:34:01](#jeYgK4N1OyWNOsrn8mKjQ3AddAeXtPFEzLWfRsVW8nk) <gor77 (gor77)>:
I'm trying to understand how to actually use this with callback function, and couldn't find any examples. This would be very useful.

[13:34:29](#FcA3SpViGznxLWbrH8QKHSS4cxyRp09pWz2cHiWGMBE) <gor77 (gor77)>:
I've seen parsee, but that's a bit too much for me at this stage

[13:34:52](#uZ6T3YvVZ7N9fSmSa2RHlb3afVPaZ4AC1r6elkrQkr4) <hiiamboris>:
indeed, but look at the source of `on-parse-event` (with the above command)

[13:35:27](#XQSZlcqCPBxNbGCx7JqYRjrR8YTIjt86i0eI783V0Qs) <hiiamboris>:
that's the simplest example

[13:35:57](#Akm5ydTDTWibaKlEBwkAnWyZR02RwZG2ND5l4dQsfQo) <gor77 (gor77)>:
hm, on-parse-event is part of parsee, right?

[13:36:30](#Uki7MClJrqCbVbv0RvqaCeXIGp6zsOQN0w6SVLGObZc) <hiiamboris>:
no, it's part of the runtime

[13:36:48](#ZmwSgL_HcAn3mhRLKR8loLaaGs2Cqkq3D8hFPD7IP2U) <gor77 (gor77)>:
hm. but why do I get unset?

[13:36:50](#LvAXfAT2QfAVLKXdWmL_ndK9_tAvSFkP16q4ZSK4JqA) <hiiamboris>:
I've also had an old experiment, let me upload it

[13:37:39](#js478rCDMXgP93WVs5Yd75ME_PLSxXDj32nv4VDzCbc) <hiiamboris>:
because it's hidden in an anonymous context

[13:38:15](#W7ZFguAAmzbcLev8E8p23tBnSHFxS05hudiW4BdI5zM) <gor77 (gor77)>:
aha, I see

[13:38:32](#XaYm8RxvtOT_LZkCoXBdMXOEFGDKpRoc0mgiegG_F8Q) <hiiamboris>:
https://github.com/red/red/blob/master/environment/functions.red#L297

[13:39:20](#kyyfKh9lCHzGpJWUZM3KQ-gSj0guQwENxqYDLTj5tmk) <gor77 (gor77)>:
So that's what arrows are for! :)

[13:39:54](#DQKLKR0zYgBee8yG7qcc1NAWKRmLfKkR2RQ0OCeTBow) <gor77 (gor77)>:
Couldn't understand what exactly all those arrow mean :)

[13:40:02](#Xh7fHlgma0i5RDED-LuNsSZjC8j6ReX7P-2v8ThVPxI) <gor77 (gor77)>:
arrows

[13:40:30](#1sAmuRO8di13DTgjqWwOX-jVsOvu_BAJfq3KDnv5ick) <gor77 (gor77)>:
It's actually push and pop

[13:40:42](#gN9BkrGpFFeGHdEQkioTimXoKK_YlJ3XuEdouqr6hOk) <hiiamboris>:
oh those arrows

[13:40:47](#Y4Bv40Xqxc5FF3zPmUPv8soaOmihtDtXYl6u4ZRnpxY) <gor77 (gor77)>:
yes :)

[13:40:55](#uL6HTcw_nIQrr2t2hKzKwuNJAp5k8u-UD5tEoJ66tLE) <hiiamboris>:
see also my experiment https://gist.github.com/hiiamboris/2834eb7d9b280bded508da5ac73e1b0f

[13:42:35](#BTFTvrvuMhwjX6uDqqA7-9fhold9xycApm8d0emshpk) <hiiamboris>:
I don't remember finishing it, as Parse events were unreliable for it, but it's also a usage example, and a good idea in principle

[13:42:56](#S5fEiFuKGfDcv8BctYUOmsymyBy_UwS3DgXIM8YGbk4) <hiiamboris>:
* I don't remember finishing it, as Parse events were unreliable for it (at that time), but it's also a usage example, and a good idea in principle

[13:43:11](#b2rbGgBGwfjmE920jTgxG4BIhUPoGpuP634_xJiSlvA) <gor77 (gor77)>:
yes, it will take some time to get through this...I kind of get basic idea, but so little is written about it out there

[13:43:35](#68LmK5n_KlMf7c94WR6-vJzn5LhP_2vVY65Ef5fHEpE) <hiiamboris>:
trial-and-error is the way ;)

[13:44:12](#b4emygc3V-gzK53n3Q7GWXsozS2EQX8TxLLpK7YYIbs) <gor77 (gor77)>:
:) it's not easy. But I like the language, it's so effective and clever actually.

[13:44:48](#5th_ct7BQcUEhoCwvCc0j-7jCaNHBwbCJsWToCa-tvQ) <hiiamboris>:
beware, there's no turning back to other langs at some point Ì†ΩÌ∏Ö

[13:45:40](#KC0E-rCV4OHXBuPvqSPrBT_aNK-KJspdGRmCOQnOGTU) <gor77 (gor77)>:
Yes...I know that could happen. But if it gives you anything you need, especially with the Red/System, maybe it doesn't matter.

[13:46:27](#3kP0rz0cI7MLCjkv5IFi5p_kMe1X8ClQcAriqnbAA60) <gor77 (gor77)>:
Gotta go. Tnx!

[13:46:39](#3jwA_x-4twUS-6FnHIuzIPmkl28zbX3oqksZ_VIKP_U) <hiiamboris>:
you're welcome

## 26-Jul-2024

[16:33:52](#NdKGtw446QPoXFDiUi_ah9oFFAQRl6vGrqud6dWc-zI) <mikeyaunish>:
Can't seem to get the recursion working to parse into the nested blocks correctly
```
test-block: [ a: "hello" [ b: "bye" [ c: "joe" ] ] ] 
set-word-rule: [
	set set-word-val set-word!  ( print ["   SET-WORD-RULE / value = " mold set-word-val ])
	| block-match-rule
]

block-match-rule: [ ahead block! into set-word-rule ]

parse test-block [
	any [
		set-word-rule
		| skip
	]
]
```
The results are: 
```
   SET-WORD-RULE / value =  a:
   SET-WORD-RULE / value =  b:
   ```
   I would like to retrieve ```c:``` as well.



[16:46:36](#wa3Bwkfzjhcc2PK-UD0-8h5Q-JytFfl_hvLwpwgdmx8) <gurzgri>:
```
>> block: [a: "hello" [b: "bye" [c: "joe"]]]
>> rule: [keep set-word! keep string! opt into rule]
>> parse block [collect rule]
== [a: "hello" b: "bye" c: "joe"]
```

[17:05:33](#rD01RQJZnGhyQg2VwmLVx9nvE0_QcbKm2pB7Lu_pWUs) <gurzgri>:
First pass of your `set-word-rule` matches `a:` but fails at `"hello". Hence, the top level parse rule `any [ ... | skip]` skips the string.
Next pass of `set-world-rule` fails at the block, so alternates to `block-match-rule`. That consumes `b:`, fails at "bye". So we`re back in `set-word-rule` which does *not* skip "bye" but fails. So the top level rule effectivly skips the whole `[b: "bye" [...]]` block and succeeds.

[17:05:57](#NmKvYnHODiQTyH5RTT_kO36srOjaNlE38LvxZ6o6ahY) <gurzgri>:
 * First pass of your `set-word-rule` matches `a:` but fails at `"hello"`. Hence, the top level parse rule `any \[ ... | skip\]` skips the string. Next pass of`set-world-rule`fails at the block, so alternates to`block-match-rule`. That consumes `b:`, fails at "bye". So we`re back in `set-word-rule` which does _not_ skip "bye" but fails. So the top level rule effectivly skips the whole `[b: "bye" [...]]` block and succeeds.

[17:07:07](#ZTYkIKxBDkGeE7fSfbVzl9PxylJPxeFrum2t1ixpQis) <gurzgri>:
 * First pass of your `set-word-rule` matches `a:` but fails at `"hello"`. Hence, the top level parse rule `any [ ... | skip]` skips the string. Next pass of `set-world-rule` fails at the block, so alternates to `block-match-rule`. That consumes `b:` and fails at "bye". So we're back in `set-word-rule` which does _not_ skip "bye" but fails. So the top level rule effectivly skips the whole `[b: "bye" [...]]` block and succeeds.


[17:39:32](#NwGZn0FKOeFEjeSw6Tm9ShKXCWub8-72veFuszfkvcs) <mikeyaunish>:
Thanks gurzgri I still have a lot to learn about parse. 

## 20-Aug-2024

[11:31:30](#lJuPBmm2AyBpD75HvVwqfN51DhM_43qO_T94zWd2XVw) <Rebol2Red (Rebol2Red)>:
I want this to return:
"fa"
"fb"
"fc"
In others words, break when there is a {x} in the result
```
parse "<fa><fb><fc><fx><fd><fe><ff>" [ 
	some [
		thru "<"
		copy t to ">" (probe t) ;== "fa"
		if (find t "x") (break) ; this does not work
	]  
]
```

[11:42:09](#UD0Cew5pDWf1ddrMvIPEA4FsiGYOnFlnoI6FJbIjkdE) <hiiamboris>:
![https://tchncs.de/_matrix/media/v3/download/tchncs.de/bebb2dcb18058b5305164679233e54a08546a2dc1825860837223432192](https://tchncs.de/_matrix/media/v3/download/tchncs.de/5cd42ac140cc53d8d2625b5aa11238c4b053c9ca1825860868655546368)

[11:42:56](#Ov5XbPrWzCuLdXAeRMySTSJrEsTp01B43uUPB0WuPWc) <hiiamboris>:
indeed, the `if` fails

[11:43:08](#MlPzUv1C72SE5qib17RY262foPkr-oocC0lZJ9cH8JI) <hiiamboris>:
do you expect it to succeed?

[11:45:26](#VOXAqODjtk2kVtbEdr2MVQtyjNQRk_dh5sImc4Ge-pQ) <Rebol2Red (Rebol2Red)>:
yep, but this is wishful thinking I suppose

[11:45:55](#IjKUolDTfe_qP_dKJ7YeqXtJIP70xC3qdasj-HLvwVQ) <hiiamboris>:
there's no `x` in `fa`, so how can it succeed?

[11:46:39](#P9Wgl_vEQisLH3XCvWyeLnhA-bGOIzndyOdarDAXX5o) <Rebol2Red (Rebol2Red)>:
But some is greedy, so ...

[11:47:35](#B5AkTEjkG99_PwgB9CLZsoZpHMi3PUzwyn6ajXkujF4) <hiiamboris>:
it's greedy in a sense that it'll proceed as long as it's subrule matches

[11:47:39](#x12OIVqaZNpD6K3KbbaSMklYlKs4qEl5wlZUmDBHr_k) <hiiamboris>:
if no match - it ends

[11:47:50](#vSaQ3tVO-XMYJMcHTsJS9DMm-NUu36hUHziAyAdtf_0) <hiiamboris>:
* it's greedy in a sense that it'll proceed as long as its subrule matches

[11:48:25](#FJlinn9Cc1SMSne56PSB84ssRBgGN-odWx2XsH7ALUY) <Rebol2Red (Rebol2Red)>:
How can this be done?

[11:51:36](#DUFSQMJRzAo8MHk82YM97ZeJYoOY8O3HlNRsvQbYwdg) <hiiamboris>:
you may negate `if` instead of breaking

[11:53:17](#TYwyhJpc_4D9dhE0v7vS3AaGT0aOoq3cf2Y6y5C1bY4) <Rebol2Red (Rebol2Red)>:
I'll try. Think I will be back soon because parsing is not my thing.

[12:12:47](#ddErqKOA25FBmInP64FtrmSawYJ-FYNqTKR_j7Ocz10) <gurzgri>:
Rebol2Red (Rebol2Red) `[collect some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]`

[12:18:08](#sd4gfbmzAA7_R47em2tBU54krX_pSwOsheHsjwzb6Lk) <Rebol2Red (Rebol2Red)>:
Thank you very much I will use it like this
```
parse "<fa><fb><fc><fx><fd><fe><ff>" [ 
	[collect set res some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]
	(probe res)
]
```

[12:21:29](#C9BE8fJynYhvrwejd16DSlS9PG_gNo6l7gCLoNl5aZ4) <gurzgri>:
In this particulare use case a simpler
```
>> parse "<fa><fb><fc><fx><fd><fe><ff>" [collect some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]
== ["fa" "fb" "fc"]
```
would do.

[12:22:28](#OQly0x6QN1wATpzZLJJ5v5SHSVGOPwfTEbvaCASBgDs) <gurzgri>:
 * In this particular use case a simpler

```
>> parse "<fa><fb><fc><fx><fd><fe><ff>" [collect some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]
== ["fa" "fb" "fc"]
```

would do.

[12:24:14](#EcUkJmekmSQPfYhZDpB1J7ZmI0vEPtJG6zMnNqmf7Tw) <Rebol2Red (Rebol2Red)>:
 * In this particular use case a simpler

```
>> parse "<fa><fb><fc><fx><fd><fe><ff>" [collect some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]
== ["fa" "fb" "fc"]
```

would do.

[12:25:03](#i6TLipN_x8Kf0LA2f0glqL01x3HYy8uG7ZqqNN8e4WA) <Rebol2Red (Rebol2Red)>:
 * Oke, but I need some of the data later on in a program

Maybe this is better

```
rule: [collect set res some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]
parse "<fa><fb><fc><fx><fd><fe><ff>" [ 
	rule
	(probe res)
]
```

[12:25:47](#DmNtEgnmuzqq0bDwNjrXyPY2hDWzEtz4hf4k1apemPk) <GalenIvanov (Galen Ivanov)>:
Rebol2Red (Rebol2Red): ```res: parse "<fa><fb><fc><fx><fd><fe><ff>" [collect some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]```

[12:25:51](#qsTcD1d1mkdc5vusDmYEGEgL8jpe1qSOQlU8qn19s4M) <Rebol2Red (Rebol2Red)>:
 * Oke, but I need some of the data later on in a program

Maybe this is better

```
rule: [collect set res some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]
parse "<fa><fb><fc><fx><fd><fe><ff>" [ 
	rule
	(probe res)
         ....
]
```

[12:26:02](#u0Z6UHZx8L46E30AQFlR0GTe6epXDpLBh-G9IKq-UKs) <gurzgri>:
A top-most `collect` makes `parse` return the "collection", as in
```
res: parse "<fa><fb><fc><fx><fd>..."
```


[12:26:06](#2z3fZ8j0fIR-MJeTlBAJtbNzdD6RowppJjHe6cxzQZU) <GalenIvanov (Galen Ivanov)>:
 * Rebol2Red (Rebol2Red): 
`res: parse "<fa><fb><fc><fx><fd><fe><ff>" [collect some [thru "<" copy t to ">" [if (find t "x") break | keep (t)]]]`

[12:26:18](#AT_Ve9enKDcqr6uVb8NrKt32m3_kjIcK_-eOPGXqaYM) <gurzgri>:
Ah, GalenIvanov (Galen Ivanov) beat me to it.

[12:26:44](#923Nn4v-nL5f1_I-uOpO8tIIsEmUwquuljEKt_BZT5Y) <gurzgri>:
 * A top-most `collect` makes `parse` return the "collection", as in

```
res: parse "<fa><fb><fc><fx><fd>..." [collect ...]
```

[12:29:41](#q3lkGKnJzAGfe2J0xWif5rhsQFIm3mRBOeofPxglIA4) <Rebol2Red (Rebol2Red)>:
It would have been nice if you could break out of some or any with one line of code though

[12:29:49](#GejaQdYmUcrsHAWYB3ra6VpddTFcA7ki4mQKYmiqicE) <gurzgri>:
 * A <del>top-most</del> `collect` makes `parse` return the "collection", as in

```
res: parse "<fa><fb><fc><fx><fd>..." [collect ...]
```

[12:29:59](#2CpyTfSEVzTgxWgcH2uv4mqrBIHY7NQ-QqEMcyla9lY) <gurzgri>:
 * <del>A top-most</del> `collect` makes `parse` return the "collection", as in

```
res: parse "<fa><fb><fc><fx><fd>..." [collect ...]
```

[12:30:27](#4ulVSjKOdkxyLObaaDC9yVVbL-ziWzsHAs-rBLU1pdE) <Rebol2Red (Rebol2Red)>:
 * It would have been nice if you could break out of some or any on a condition with one line of code though

[12:34:34](#foPoIP_vp5yZf3xqtWYjvfZ_kUVb5vTSW-WMMU3tZTc) <GalenIvanov (Galen Ivanov)>:
If the input always consists of digraphs starting with "f":
`parse "<fa><fb><fc><fx><fd><fe><ff>" [collect some ["<" keep ["f" [not "x" skip] | break] ">"]]`

[12:34:39](#SFLppBZi8edCMe_upmTW0DZSi6LhwOfu1-7rGv7gWWc) <GalenIvanov (Galen Ivanov)>:
 * If the input always consists of digraphs starting with "f":
```parse "<fa><fb><fc><fx><fd><fe><ff>" [collect some ["<" keep ["f" [not "x" skip] | break] ">"]]```

[12:36:49](#d-7PNNnig2Dephebgfbv8F5qTHsCA-x3q39VxWMYJCs) <Rebol2Red (Rebol2Red)>:
Ah, my bad

[12:43:06](#jL-cysdr_CQ575i8IxGThXyUqT3dAwR86Nd-6hTroig) <gurzgri>:
`[collect some [thru "<" copy t to ">" if (not find t "x") keep (t)]]`

[12:47:13](#AlpZFpggCUqPCoXTb8IZVbJLaEh0MYK7Bgcq__BRXKI) <gurzgri>:
 * `[collect some [thru "<" copy t to ">" if (not find t "x") keep (t)]]` doesn't even require a `break`, because `some` will fail on the first "x" contained.

## 27-Aug-2024

[19:47:32](#sa-QETAXNBZ_a9K-UWTCKSemczer2dInG7xj3YNsjsQ) <greggirwin (Gregg Irwin)>:
Depending on your data, you can also do it without `parse`.
```
>> collect [foreach tag load s [either find tag "x" [break][keep form tag]]]
== ["<fa>" "<fb>" "<fc>"]
```

## 30-Oct-2024

[20:53:43](#IArYJY7w6Rnji3wcBdjnzr_ImF8FuJ3ksm-qaWcRxSI) <GiuseppeChillemi (GiuseppeChillemi)>:
How do I check with parse if a word is used only one time in  block? I need to know if 4 or 5 keywords are not repeted in a condig:

```
[word1 word4 word2 word1 word3 word4 ]
```
Is invalid
```
[word1 word2 word4 word3 ]
```
Is ok





[20:54:05](#WZIJiuXiqjdB_tS0hQXw9KyflgbaWWNc2d9jAOwu6Bo) <GiuseppeChillemi (GiuseppeChillemi)>:
 * How do I check with parse if a word is used only one time in  block? I need to know if 4 or 5 keywords are not repeted in a config:

```
[word1 word4 word2 word1 word3 word4 ]
```

Is invalid

```
[word1 word2 word4 word3 ]
```

Is ok

[22:02:58](#6VfsAEugEBcTJgpW1QWwTrdVDZJGJReKzcH9f9OcVo0) <gurzgri>:
Pragmatic approach: Maybe you can just use `unique` instead of or before `parse`?

[22:04:23](#kEAkri9I42Shpv_xKrFznjjZxNftaN9VcYMhsvo3NUs) <gurzgri>:
If the unique block is shorter than there are duplicates.

[22:13:23](#AGFCNXy4rx6OgF3to5MwxtHUV4QeHW1Rs0UONCNOie8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> Pragmatic approach: Maybe you can just use `unique` instead of or before `parse`?

Because I want to learn the way. I know the UNIQUE approach but I want to learn how to do it with PARSE

## 31-Oct-2024

[0:00:06](#u0HYYDB4HfR8z6JjTSacZz6yq4RcAbOmGwo-0T3T5Io) <GiuseppeChillemi (GiuseppeChillemi)>:
Basically I have this block:

```
[
   name "My panel"
   ctx-proto [[code here]] 
   panel-proto []
]
```

I need that 
`name string!` 
`ctx-proto block!` and 
`panel-proto block!` 
appears just one time in ANY order. 

[0:28:56](#xw3y8Rc7ZdCx6EOR8S9Z9yGD27lYCPg_qMASDdw4HKI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Basically I have this block:

```
[
   name "My panel"
   ctx-proto [[code here]] 
   panel-proto []
]
```

I need that
`name string!`
`ctx-proto block!` and
`panel-proto block!`
appears one time and no more in ANY order.

[0:29:17](#3t4dxlkTpEjhnaTtKFQbC2ncQmSY932jz6WW8j7TECo) <GiuseppeChillemi (GiuseppeChillemi)>:
Pardon, i have made a mistake and corrected

[4:07:36](#42UvvLCp-wZOlh__crF17BQlYhwliBNmG9_wuHq2vvI) <GiuseppeChillemi (GiuseppeChillemi)>:
I see a way. Each rule must be doubled and the second should be OPT. At the end of second rule you put a FAILURE, so if the rule is mathched for a second time, parse will fail.

[4:09:00](#4QwqhlA6EbAEjw2EcJsuH60T9VhnY9iC5sa2-rRz4L4) <GiuseppeChillemi (GiuseppeChillemi)>:
Of you have a more elegant solution, you are welcome. I am in bed and I will try tomorrow

[4:18:55](#x3Gb5gRgAXESG3DMbva21v5UqWGsAyU2oDxUNwVAzLk) <GiuseppeChillemi (GiuseppeChillemi)>:
* If you have a more elegant solution, you are welcome. I am in bed and I will try tomorrow

[7:36:08](#8OaSE6tG_MozBKHxEVvSbxY-MOdymV5eAaojVdAkhec) <Oldes (@oldes.h:matrix.org)>:
What about ignoring duplicates? The last one wins and is used.

[7:39:54](#gUU62lVaH6SDSdQK7lwFRAWbTCUooEnbf1c_ToTbt_A) <Oldes (@oldes.h:matrix.org)>:
Like here:
```rebol
>> append/part "" "abc" 1   
== "a"

>> append/part/part "" "abc" 1 2
== "ab"

>> append/part/part "" "abc" 2 1 
== "a"
```

[7:41:12](#vS9VC0R_61btNBVwGzrlmvzngNoLx311sYSryhpaDbI) <Oldes (@oldes.h:matrix.org)>:
Or in terminal:
```bash
ls -l -l
```

[7:42:56](#PJ_BAj010LF-kHmgt4Iv538q0iApEOzvX7-mG4aK-SA) <Oldes (@oldes.h:matrix.org)>:
You have a strong tendency to overcomplicate things.

[9:31:09](#-MihLu_MKtBW9cz9qjsvu4bkUEfsT9Gppe_WgbDzPq8) <GiuseppeChillemi (GiuseppeChillemi)>:
Because duplicates mean error in my case, they should not be there.

[9:33:00](#tDxgPs8k4wfmspixJ3t5g_x3PJSXCdRU34JoCQBGaQE) <GiuseppeChillemi (GiuseppeChillemi)>:
hiiamboris: don't agree with him or I will delete your repositories and backups! Ì†ΩÌ∏ë

[12:48:39](#ognOB2GwA5vMe232ILknTSFYSICb3MCocCMFgVec-7E) <ldci (Fran√ßois Jouen)>:
The spirit of Red and Rebol is to keep the code simple and find simple solutions to complicated problems.

[17:36:02](#VDlzqMwyoWwAuKvlRKiDEGso8Qg9MKlmMZ7wobeBASA) <gurzgri>:
GiuseppeChillemi (GiuseppeChillemi) 
```
>> no-dupes: [some [set value skip (value: to lit-word! value) to value fail | skip]] ()
>> parse [here i go again on my own] no-dupes  ;== true
>> parse [here i go again and again] no-dupes  ;== false
```
is a solution not generic enough (and I'm sure can be simplyfied), but is enough to give you a jump start.
The [Whitesnake reference](https://youtu.be/WyF8RHM1OCg?t=36) is by accident, sorry for that.

[17:38:18](#sKuZsTAOuIRsOpXuq1Hqs2QaGLR_GHB6_tIgk2CnBYo) <gurzgri>:
 * GiuseppeChillemi (GiuseppeChillemi)

```
>> no-dupes: [some [set value skip (value: to lit-word! value) to value fail | skip]] ()
>> parse [here i go again on my own] no-dupes  ;== true
>> parse [here i go again and again] no-dupes  ;== false
```

is a solution not generic enough (and I'm sure can be simplyfied), but is enough to give you a jump start.
The [Whitesnake reference](https://youtu.be/WyF8RHM1OCg?t=75) is by accident, sorry for that.

## 13-Nov-2024

[19:48:00](#Padh4Bl3jmWW_W7WAhX70JwEw89YD2vVSL5mZnhpdJ0) <greggirwin (Gregg Irwin)>:
Nice solution gurzgri .

## 29-Nov-2024

[12:55:00](#JZmbHW3aJv_fLq6I8T9Tq94eqZphI_ZIWYNw5VBq6HM) <GiuseppeChillemi (GiuseppeChillemi)>:
If I want to parse inside a paren I can't write:

`parse [a (w)] [word! into [rule-here]]`
 
as it parses `block!` and `path!` too.

I must write this

`parse [a (w)] [word! pos: paren! :pos into [word!]]`

Do you have a shorter version?

[14:21:31](#wH02XocD5JXEnv5HJLLO2xXd6LutWUkF20Oqths_L2w) <hiiamboris>:
`ahead paren!`

[15:14:18](#bl3Ow08R495cIVdeKBku3Iudx7sBuOLW0litlY2_cc8) <GiuseppeChillemi (GiuseppeChillemi)>:
It does not work as you should be on the previous position. When you have matched WORD! then you are OVER paren!

[15:14:32](#xfvI6gJOvYc931ZmjKw3ceCbpgkuKETfgpjkp1uM-is) <GiuseppeChillemi (GiuseppeChillemi)>:
* It does not work as you should be on the previous position. When you have matched WORD! then you are OVER paren! and not before

[16:06:28](#Aqym5u8Ak2ciVGLQ0xnoN-WukyCoHRZsKtLiCKFnko0) <GiuseppeChillemi (GiuseppeChillemi)>:
There must be a keyword to match but not advance. 

[16:26:56](#AgfodULi5b_qJYRxdbPm-XMpnCSfnTvnP3L5iobE25s) <hiiamboris>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> There must be a keyword to match but not advance. 

`ahead`

[18:01:29](#YD1ho4OgTSy7r9hd5Z3-wUeU52rx3v3W5I8ocmUTdaE) <Oldes (@oldes.h:matrix.org)>:
GiuseppeChillemi (GiuseppeChillemi): 
```red
>> parse [a (1 2 3)] [word! ahead paren! into [p: (? p) any integer!]]
P is a paren! value.  length: 3  (1 2 3)

== true
```

[18:01:56](#7sH4UHDUwwkTPLasgI-XSK7CHUQw7pqSlVJH4tba2z4) <Oldes (@oldes.h:matrix.org)>:
```red
>> parse [a some/path] [word! ahead paren! into [p: (? p) any integer!]]
== false
```

[18:02:49](#aRt8qjVGvaSbN1q6IMm5vRnVfZY1u5Ty34d1xfYfw3s) <Oldes (@oldes.h:matrix.org)>:
```red
>> parse [a some/path] [word! [ahead paren! into [p: (? p) any integer!] | ahead path! into [p: (? p) to end]] ]
P is a path! value.  length: 2  some/path

== true
```

[18:07:12](#dzz4OrWYfgjCMYxji5-R6e2SjlCIF271xxnQBcCSB_I) <GiuseppeChillemi (GiuseppeChillemi)>:
It serm I have made a mistake somewhere. I apologize. Thank you everyone.

## 30-Nov-2024

[13:07:34](#p5ammeG1Kx5ezGBCG2QTZDcdDjzuXRZD9SWTO4lhRuU) <GiuseppeChillemi (GiuseppeChillemi)>:
It serm I have made a mistake somewhere. I apologize. Thank you everyone.

[13:08:06](#z0VhqAj_StdWTxCj5rVfBGw-R6kCa72GuwXgZyUFHHc) <GiuseppeChillemi (GiuseppeChillemi)>:
It serm I have made a mistake somewhere. I apologize. Thank you everyone.

## 2-Jan-2025

[20:04:27](#aHaFN8yyjC1QSH6x9zvrIMkNa8G7NLjWT1o1shLIFDQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Parse is giving errors here:

```
parse [a b] [
	'a
	(next-rule: 'some)
	next-rule
	'b
]

*** Script Error: PARSE - invalid rule or usage of rule: some
*** Where: parse
*** Near : parse [a b] ['a (next-rule: 'some) next-rule ]
*** Stack: do-file
*** Files: %"/G/Il mio Drive/Dev/Tests/Parse-Mutable-"
```

Is seems that it interprets the next rule in a sort of buffer an not inline with the remaining part of the input.


[20:07:14](#UCvrURh5GPxh1LyzSw6hHEAJRxAJM7Ntf0VBWBkttuQ) <GiuseppeChillemi (GiuseppeChillemi)>:
It would be more correct if it completes `SOME`, and other keywords, taking the parts it can't complete from the buffer in the main series. 

[20:34:11](#cLhXljfS0tsixLMIlZwzZNJKbuWkxSpheiDMxlfKfBQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* Parse is giving errors here:

```
parse [a b] [
	'a
	(next-rule: 'some)
	next-rule
	'b
]

*** Script Error: PARSE - invalid rule or usage of rule: some
*** Where: parse
*** Near : parse [a b] ['a (next-rule: 'some) next-rule ]
*** Stack: do-file
*** Files: %"/G/Il mio Drive/Dev/Tests/Parse-Mutable-"
```

Is seems that it interprets the next rule in a sort of buffer an not inline with the remaining part of the input, so the reduced word must be complete of all its arguments.

[22:41:28](#0ZEdwfY1Zy7xNjIMW3Gx0OUf_lnI-qMwo0F06qbayrs) <gurzgri>:
`parse` only complains because `'some` isn't a valid sub-rule, see https://github.com/red/docs/blob/master/en/parse.adoc#3-parse-rules at
> Value of one of the following datatypes:
> ...
> - word! that refers to well-formed sub-rule;

A working version of what you're trying to achieve is e.g.
```
>> b-rule: ['b]
>> parse [a b] ['a (next-rule: [some b-rule]) b-rule]

[22:43:29](#ezAQ7BKuCua_X3cZt6KLVKIIPWxrGM-ofBHc5ld2J-Q) <gurzgri>:
* `parse` only complains because `'some` isn't a valid sub-rule, see https://github.com/red/docs/blob/master/en/parse.adoc#3-parse-rules at

> Value of one of the following datatypes:
> ...
> 
> - word! that refers to well-formed next-rule;

A working version of what you're trying to achieve is e.g.

```
>> b-rule: ['b]
>> parse [a b] ['a (next-rule: [some b-rule]) b-rule]
```

[22:43:48](#NiuGVJvoIVrjgIHojYswKytQDlxH0zlEd8YqQ5C5hWY) <gurzgri>:
* `parse` only complains because `'some` isn't a valid sub-rule, see https://github.com/red/docs/blob/master/en/parse.adoc#3-parse-rules at

> Value of one of the following datatypes:
> ...
> 
> - word! that refers to well-formed sub-rule;

A working version of what you're trying to achieve is e.g.

```
>> b-rule: ['b]
>> parse [a b] ['a (next-rule: [some b-rule]) next-rule]
```

[22:44:02](#p54ojHQq2q367oPuccVPmhz29EQVyzvHkzWfYTdsV5E) <gurzgri>:
(fixed typo)

[22:47:27](#uFZb30CID99D611hJATFmjB6SGt9APaKMExAqbuPQa8) <GiuseppeChillemi (GiuseppeChillemi)>:
I know, I have already used this but I thought the word is reduced and the the parsing continues with its content. But It seems it should be a complete rule.

[22:47:42](#3O7I_w0iFar1cdbU7wPaANaF6kQlOVkdJhQ879XK52U) <GiuseppeChillemi (GiuseppeChillemi)>:
* I know, I have already used this but I thought the word is reduced and then the parsing continues with its content. But It seems it should be a complete rule.

## 3-Jan-2025

[14:36:36](#4ihkHVJYzHLThuj3dM8Tz7bn6GYG7OZKeRt4tYldbW4) <GiuseppeChillemi (GiuseppeChillemi)>:
* I know, I have already used this but I thought the word is reduced and then the parsing continues with its content. But It seems it should be a complete rule.

[14:40:05](#dNFMisclPw5sJc18lZCNLoiIknjim38MwarS2QPHHPI) <GiuseppeChillemi (GiuseppeChillemi)>:
As logic, aren't 2 optional rules failed TRUE?

```
>> probe parse [a b] [[opt [word! ref!] | opt [word! ref!]]]

FALSE
```


[15:20:46](#iAy4ek_gsmxsuH0ztuc6qTKdmFQckT4Q05YWZonuLA4) <hiiamboris>:
you didn't reach end of input

[15:34:30](#90Ojo8Gq16Ha60hPovA09nxj5buqlaBdq3wpnMmmabU) <GiuseppeChillemi (GiuseppeChillemi)>:
Thanks Boris, I have totally overlooked this aspect

[16:05:32](#tCo18BSEjtmikz-idQea0IBPesRtG_gi2O68SWBJdXE) <GiuseppeChillemi (GiuseppeChillemi)>:
I have 2 keywords that could be found in a block of elements of any size, I can find them in a precise order and not switched;  but you are allowed to have only 1 of them. They are also optional. How do you parse args that could appear only once and no more with the upper rules.
(Think about /LOCAL that could be followed by /LOCAL+ keyword in this order with words between them

[16:06:06](#ZSyWi0zbizMumGf1mvJOcwoi2RGZmZKUNdGl3TlCEGU) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have 2 keywords that could be found in a block of elements of any size, I can find them in a precise order and not switched;  but you are allowed to have only 1 of them. They are also optional. How do you parse args that could appear only once and no more with the upper rules.
(Think about a func specs block and /LOCAL that could be followed by /LOCAL+ keyword in this order with words between them)

[16:06:35](#XV_rG1HnRqrgmton_E6Z8QVGVnD4FSK9U_ybViA1iRQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have 2 keywords that could be found in a block of elements of any size, I can find them in a precise order and not switched;  but you are allowed to have only 1 of them. They are also optional. How do you parse args that could appear only once and no more with the upper rules.
(Think about a func specs block and /LOCAL that could be followed by /LOCAL+ keyword in this order with words between them and after)

[16:06:57](#cYh60z_vnlFKpXRKW-AmxxA5z0lYlch6HQi7K503ISU) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have 2 keywords that could be found in a block of elements of any size, I can find them in a precise order and not switched;  but you are allowed to have only 1 of them. They are also optional. How do you parse args that could appear only once and no more with the upper rules.
(Think about a func specs block and /LOCAL that could be followed by /LOCAL+ keyword in this order with words between them, before and after)

[16:07:20](#olzGm0BjY_T1zitPXObreHLIh26Bd7EBst0LFY9Q80s) <hiiamboris>:
just count them? if there's 2, it's an error

[16:19:47](#51P_aX8QfNnrecgCIAPFkWGEkghC5J90UTmjV1VpFP8) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, it is the same as using a flag. I am experimentg

## 5-Jan-2025

[1:23:41](#T7ZlZ1HEH_1gBexWqYJHMavw6qgmkeoFgwLPh7MjkD0) <GiuseppeChillemi (GiuseppeChillemi)>:
I have created a checker for datatype of a value against a block of datatypes possible, independent from the standard function parser. 
What about this? Do you have a shorter version?

```
is-type?: func [
	"Checks if a value has a type"
	datatypes [block!] "Block of possible datatypes"
	value [any-type!] 
	/local
	out-data
	element
	found?
] [
	found?: false
	out-data: false
	parse datatypes [
		any [
			set element any-type! (element: attempt [get element]) 
				any [
							if (if not any [typeset? :element datatype? :element] [do make error! "Not typeset or datatype in block"])
						|	
							if (all [not found? datatype? :element element = type? :value]) (out-data: true)
						| 
							if (all [not found? typeset? :element find element type? :value]) (out-data: true)
				]
				(If out-data [found?: true])
			|
				skip
		]			
		to end
	]
	out-data
]

>> probe is-type? [string! number!] 1
TRUE
```

[1:57:52](#TP_8UpliiJGI8Qc4o2_7CpShL88fSN2m2KiRs6spO3o) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have created a checker for datatype of a value against a block of datatypes possible, independent from the standard function parser.
What about this? Do you have a shorter version?

```
is-type?: func [
	"Checks if a value has a type"
	datatypes [block!] "Block of possible datatypes"
	value [any-type!] 
	/local
	out-data
	element
	found?
] [
	found?: false
	out-data: false
	parse datatypes [
		any [
			set element any-type! (
				if not any [typeset? :element datatype? :element] [element: attempt [get element]]
			) 
				any [
							if (if not any [typeset? :element datatype? :element] [do make error! "Not typeset or datatype in block"])
						|	
							if (all [not found? datatype? :element element = type? :value]) (out-data: true)
						| 
							if (all [not found? typeset? :element find element type? :value]) (out-data: true)
				]
				(If out-data [found?: true])
			|
				skip
		]			
		to end
	]
	out-data
]

>> probe is-type? [string! number!] 1
TRUE
```

[7:30:27](#O-1SWFFyIJfCtUPAcjp5CW0J_SPG_7iJXOBxdNdkxME) <hiiamboris>:
`find make typeset! datatypes type? :value`

[7:31:46](#rKL_7BP0TTAs5EKxdPnfhXAm0coEV9wZ3iU_rzxHqeM) <hiiamboris>:
* > Do you have a shorter version?

`find make typeset! datatypes type? :value`

[7:34:04](#1T0C5j7kJJO3rSmYvDTsUs7QHJFzm2RvY6XFetXt9lk) <hiiamboris>:
there's also zero reason to use `parse` in this scenario :)

[10:32:06](#qL68mO0sswT0FD9DqM4ts6Bcp1rbT7avaHJ9VyXCAwM) <GiuseppeChillemi (GiuseppeChillemi)>:
You should process all the elements  because you also need to generate error when there is ni datatype or typeset. Also you must distinguish between this condition and the "not found" datatype one.
I am not in front of my computer but I think it is not that easy.

[10:32:30](#9oayjWNFA3q3f8i2f2i4SbkM92Vo_rQLcLV3CHSe438) <GiuseppeChillemi (GiuseppeChillemi)>:
* You should process all the elements  because you also need to generate error when there is no datatype or typeset but a different element. Also you must distinguish between this condition and the "not found" datatype one.
I am not in front of my computer but I think it is not that easy.

[10:36:12](#pkX0rhnp2oDrWT48Qkm4VMOUCvXN4r5v_ccPpUD9OCY) <hiiamboris>:
> I think it is not that easy.

/shrug I didn't do any of this in my type checker ;)

[10:36:16](#aBOj1aXylcpBJtal7_rPZVzfKxcw545pJC0tYpipZAo) <hiiamboris>:
* > I think it is not that easy.

I didn't do any of this in my type checker ;)

[10:40:00](#gTjFFFgepI6sohyJih5bQ7-fO-53ddAaBbmHlISgH8I) <hiiamboris>:
(but I did other nasty things, for performance's sake)

[11:39:57](#fDPZzb8AZkYli-UFvtlXHwXZz_3o6HQzF1zBjoLRgMA) <GiuseppeChillemi (GiuseppeChillemi)>:
I want to see your nasty things, they are the best ones!

[11:48:31](#KDpPCxtA_xsxF67_nfOy3xdhQKp3iAi7_AlfkRDf7f0) <GiuseppeChillemi (GiuseppeChillemi)>:
Your proposed solution works even with the datatype itself. 

```
>> find make typeset! compose [(integer!) string!] type? 1
```
Also the internal make mechanism fires an error in case of a block with spurious content, so we have the check natively in Red. Thanks to this mechanism the following line seems enough:

```
error? try [find make typeset! [integer! 1 string!] type? 1]
```

[11:50:48](#ApSsnqzeuyuyfuf1FdXP6Dbr5z4Ide2yh0pxGx7XmjY) <GiuseppeChillemi (GiuseppeChillemi)>:
Are there any other nasty things you suggest to speed up this check?

[11:51:00](#hoCaQB46f8C28-qjy9UPQxMoWkTeM1G3CaR0E5CdpSc) <GiuseppeChillemi (GiuseppeChillemi)>:
* Are there any other "nasty" things you suggest to speed up this check?

[12:02:54](#7MF59cbDTvIw9SaRBVndNBoK8KcT-fvNFsOPpxuydnE) <GiuseppeChillemi (GiuseppeChillemi)>:
And now I have discovered something I didn't know at all... `Find` on `typeset!` returns `true` or `false` instead of `none` or the datatype found.

[13:16:50](#jPZfFTP4w-9FNPsFdVWqqthDPFY0-Lrh8xbW3fkIn3E) <hiiamboris>:
https://codeberg.org/hiiamboris/red-common/src/branch/master/typecheck.red

[13:19:17](#qCfnMkbic_AbAZU1eumBWV-QYY_A9czhakLkEULp69w) <hiiamboris>:
there's check function generation and memoization of "compiled" typecheck matrices

[13:19:39](#YiT-frIvBMftvCjThPlB0TRmVgI_BrxU6O3b7aZHp_Y) <hiiamboris>:
* there's (optimal) check function generation and memoization of "compiled" typecheck matrices

[13:43:50](#w0RXcZ1hr3XOikN1AAQ_xAgGSE9y47Mhjoe6Iv-rK8M) <GiuseppeChillemi (GiuseppeChillemi)>:
What you mean for ADVANCED-FUNCTION that you mention inside source? 

[13:46:26](#jicn-5U904oZXvnk1SVZJLd-QKeN7pMQFsXVlOPtdd8) <hiiamboris>:
`typecheck` dispatches types against a map of type -> code, while `advanced-function` inserts into the function body checks that a human would write (so they are readable, but slower)

[13:47:20](#MvWw6WBtuVtyUS26CtzTmFq_1W851Ospxx90BSG1HQM) <hiiamboris>:
my lament addresses the fact that they share the same syntax, but not the implementation

[13:52:44](#YOYig5Ft02GDw_-4fJoQHfyeH1JhhQmtkR9xovly7Rk) <GiuseppeChillemi (GiuseppeChillemi)>:
I see that I am redoing some the steps you have already made, there is a base that needs some new featurea for adavanced projects.

[13:53:55](#Uj_89PXSxKDEUpQ7Ijz7mTbNrmGA3Cb3MXjL5Lf50vs) <GiuseppeChillemi (GiuseppeChillemi)>:
* I see that I discover I always redo some of the steps you have already made, there is a base of new functions needed new for advanced projects.

[13:54:10](#pXBZSIku7d4DhtyrQanK5B00ys6pOtY7k0GY3WDH1As) <GiuseppeChillemi (GiuseppeChillemi)>:
* I discover I always redo some of the steps you have already made, there is a base of new functions needed new for advanced projects.

[13:54:30](#cXe_ay5JfMpSe_A2wfdNStr44VHmCowoZ7KZyKZVQCk) <GiuseppeChillemi (GiuseppeChillemi)>:
* I discover I always redo some of the steps you have already made. There is a base of new functions needed for advanced projects.

[13:55:01](#cNML8nUOvyyOvkUiIpQem_WDBeLPgoUeQjES1RPAxCE) <hiiamboris>:
just as Gregg said ;)

[14:02:49](#iuvkHne0wZqq9yRfiMDXd6xlVFnGrAt4RRWKi39MQrY) <GiuseppeChillemi (GiuseppeChillemi)>:
 greggirwin (Gregg Irwin): :D we sre talking about you here!

[14:03:06](#8lkBBOr5WXNsjiAiHcAY13EO6gUKOz7PVAfLhaFWkHM) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin-55659ddb15522ed4b3e1006f:gitter.im: :D we are talking about you here!

[14:31:37](#82Hj25jVBVsLGm_dYkrkCKwc3O4K1oVG2M_qBsbNlU0) <GiuseppeChillemi (GiuseppeChillemi)>:
hiiamboris: But have you implemented custom types?

[14:31:51](#qEuL9Q6BOcXnsp1OG3rZuDlv4OFGJFCn4MT8wKBmcBQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* @hiiamboris:tchncs.de: But have you implemented custom datatypes?

[14:50:48](#fJDGPZK0ZgI-Jb_eHGDnYxD77_aA9CkmSbcnxD6W3QI) <hiiamboris>:
nope

[16:11:05](#Zbz1vtYQXrYbkYVbs5lFL2Zb-EREVnQ0fVpSupyn6HQ) <GiuseppeChillemi (GiuseppeChillemi)>:
It is not so easy even there for the lack of some technologies but some things could be done.

[18:39:12](#ad00WdipgAW6tSwBsauucfmviR8Vz_EYhtzn20SzFn4) <greggirwin (Gregg Irwin)>:
My ears were burning. 

[18:40:06](#YNDxnsxmjw7VPOLxrTZ5qWcOJrC9oKf8HzYfuVl0yUs) <greggirwin (Gregg Irwin)>:
A typeset isn't a series, but is more like a bitset.

[20:05:39](#zn2KzgcObjgDVkZXME47RlTKOF8ASh-7suLOHIDC1EA) <GiuseppeChillemi (GiuseppeChillemi)>:
I know, we have discussed very long about it and its mapping of ascii chars starting from bit 0

[20:07:16](#Tviz3-WgaDExA-ORA50QmwHh5KMiWAzoT26chM6m4b0) <GiuseppeChillemi (GiuseppeChillemi)>:
In Italy we say the same but with a little difference: "my ears were whistling" 

## 9-Jan-2025

[17:52:23](#qVfQCp-AnwfX-VhxzTwLoFzvxKp0ZirFiKiOLfYWwj0) <GiuseppeChillemi (GiuseppeChillemi)>:
What about keyword to LIMIT a rule seach to a position, and then if it the rule has still no success, it will fail?



[18:16:42](#d3lVAeXCg7f_cAUjUwZ5Zjc9q9sKN9G5-ecZ0jjSQ5k) <greggirwin (Gregg Irwin)>:
You mean like `/part`? Would it work for you do use a `skip` rule wrapper that counts as it skips, and fails at a certain count? At least to try it. I've never needed it, but can see where bailing out before going all the way to the end of large input could be useful. 

Needs a different name than `limit` though, as that sounds sort of like the behavior of the repetition rule.

[18:25:47](#0hhP-xRC4hWJk3BvifRcSwKcjtpQbdQYHZ8b3I1JKME) <GiuseppeChillemi (GiuseppeChillemi)>:
It is exactly to replicate `/part` working. And yes, we can change it to `PART`

[18:26:27](#ABueR56rzAx-_GLgh0s62btGPEeuS7IN0Li4BLOvI2Y) <GiuseppeChillemi (GiuseppeChillemi)>:
* It is exactly to replicate `/part` working and it coults as it skips. And yes, we can change it to `PART`

[18:30:27](#YuFFjVUYwTkSG-Ae5grciNK0muM66BLqku45d6EXg4g) <GiuseppeChillemi (GiuseppeChillemi)>:
If you work with ROWs like in `select/skip` you can see it how useful it could be for parsing a line without a recusive call in parse.  Or you may have a max length and want to limit the `TO` range without more complex red `copy` + code to check.

[18:30:51](#97NQRNf2TlnpTVGHAp32EVceR8ztmOAGrPFp6EDJ5GA) <GiuseppeChillemi (GiuseppeChillemi)>:
* If you work with ROWs like in `select/skip` you can see it how useful it could be for parsing a line without a recusive call in parse.  Or you may have a max length and want to limit the `TO` range without more complex Red `copy` + code to check.

[18:31:13](#KGBw1ys1R1R4B88IHP9nY_JySMHHhVwPogysOjqmCS8) <GiuseppeChillemi (GiuseppeChillemi)>:
* It is exactly to replicate `/part` working and it counts as it skips. And yes, we can change it to `PART`

[18:33:02](#91Ie8l7j8rp4X1HrXEJT-H57eWqxZC_OqSlSH2xH13E) <GiuseppeChillemi (GiuseppeChillemi)>:
There are 2 possible implementations: let complete the rule and check the position, break if the position is reached and the rules passes it. 

[18:52:18](#JjbQmibwZZA6BE-nM8az97vvS0VgdfIuNy4RAjr4qJ4) <greggirwin (Gregg Irwin)>:
Copying out sub-rec isn't complex in my mind, but there is more overhead. If you're parsing fixed-length records in flat blocks, it seems like a clear way to go. Another place where slices would be nice.

[18:52:39](#yuk0vXsK1n8x-Q84YFF4pHx_XtEvv0O_-hWdsEaHtJg) <GiuseppeChillemi (GiuseppeChillemi)>:
* There are 2 possible implementations: let complete the rule and check the position, FAIL if the position is reached and the rules passes it. 

[19:40:51](#igm7iZBtGnEAo0Ub4iuAt5Kr7K1bnluRNINIyPsFWyM) <GiuseppeChillemi (GiuseppeChillemi)>:
An observation about SET: not supporting paths , setting of objects or maps makes complex an easy operation. 

[20:42:42](#stBfhvnsMa5WQYhiZMZdFdxJnzrPoEyKZ2_S2RoRNj4) <GiuseppeChillemi (GiuseppeChillemi)>:
* An observation about SET: not supporting paths , setting of objects or maps using them makes complex an easy operation. 

[20:56:16](#X3YoZhe5Yf0_o9afHZ3N767LdQFLbAfoWRuJkVfqaWI) <greggirwin (Gregg Irwin)>:
It would be nice if that worked in `parse` the way it does in Red proper. Feel free to open a wish for that.

## 5-Feb-2025

[2:44:20](#T_C-LFDupQlS9q5gFjpr4uJqZ83AciNwRLLpXu56UB8) <GiuseppeChillemi (GiuseppeChillemi)>:
Could a SET-WORD in parse be contained in a word as a rule, so you can change it without changing the rules block?

[3:38:35](#g_t8SFS19lKq21EWjxninnicCBpvQ4b2MHAJsdlZ2rM) <gurzgri>:
Have you tried with `quote` ?

[6:15:35](#PpqsxbXN5aqYBA_YtDZXNqGXHyXXSpvm3YzHsWxhEEw) <hiiamboris>:
That involves changing the rules block ;)

[6:16:08](#RnydTKVnME5G0lXyZAbCGCZZNt1SH5ZY6zvIuN-5eZc) <hiiamboris>:
https://github.com/red/REP/issues/142

## 6-Feb-2025

[1:13:11](#bWO7nm_X1Nr1WCfULI2Ud7pZhJzErNI283aUxOl0iBo) <GiuseppeChillemi (GiuseppeChillemi)>:
No, I have written without testing anything. It worked without inserting `quote` other than in the setting of the `word` to a `set-word`

[1:13:38](#rpcbgl_WYOPmLX1rgq3girZkUMKIShRpaG7G6n1wFrw) <GiuseppeChillemi (GiuseppeChillemi)>:
```
pos: quote s:

>> parse [a b c d] [skip pos to end]
>> probe s
[b c d]
```

[1:14:27](#tcNv0Bylrgx-fb472BujbOT-c193Xqqi2LGROFehwo0) <GiuseppeChillemi (GiuseppeChillemi)>:
Something like `for-parse` which surely hiiamboris has already created, is now possible.

[2:26:15](#AE3-hWUsYmQcruhW5PtTvM7LweZ2TXQTUl18pKCnnW4) <GiuseppeChillemi (GiuseppeChillemi)>:
```
	title:   "FORPARSE loop"
	purpose: "Leverage parse power to filter series"
	author:  @hiiamboris
	license: 'BSD-3
```
:D

## 1-Mar-2025

[13:37:24](#QFt7LRC1SjOpneaMZ63QNyZA5NnuxFcNJ4BKv4ex6NQ) <Rebol2Red (Rebol2Red)>:
I want to translate the following Java code to Red (not homework):
```
; https://www.w3schools.com/java/tryjava.asp?filename=demo_regex

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
  public static void main(String[] args) {
    Pattern p = Pattern.compile("Hillary(?=\\s+Clinton)");
	String text = "Once Hillary Clinton was talking about Sir\n" +
		"Edmund Hillary to Hillary Makasa and then Hillary\n" +
		"Clinton had to run off on important business.";
    Matcher m = p.matcher(text);
	System.out.println(m.replaceAll("Secretary"));
  }
}
```
What this Java code does:
```
The specific regex pattern `Hillary(?=\\s+Clinton)` matches the word "Hillary" 
only when it is followed by one or more whitespace characters and the word 
"Clinton". In the provided text, it will replace occurrences of "Hillary" 
followed directly by "Clinton" with the word "Secretary". 

So if you run this code, it will replace the appropriate occurrences in the 
string and print the result.
```
I came up with this:
```
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
	
whitespace: charset reduce [space cr]

parse text [ 
	some [
		to {Hillary}
		thru whitespace
		to {Clinton} w: (
			x: (index? w) - 1
			case [
				text/(x) = #" " [
					replace/all text "Hillary Clinton" "Secretary Clinton"
				]
				text/(x) = #"^/" [
					replace/all text "Hillary^/Clinton" "Secretary^/Clinton"
				]
			]
		)
	]
]
print text
```
I think someone who is better at parsing than myself can do this better

[13:39:22](#Bt8cqAshNU3RE_JLpShU4QhJtV0wrEg9sNv_69_iCHA) <Rebol2Red (Rebol2Red)>:
* I want to translate the following Java code to Red (not homework):

```
; https://www.w3schools.com/java/tryjava.asp?filename=demo_regex

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
  public static void main(String[] args) {
    Pattern p = Pattern.compile("Hillary(?=\\s+Clinton)");
	String text = "Once Hillary Clinton was talking about Sir\n" +
		"Edmund Hillary to Hillary Makasa and then Hillary\n" +
		"Clinton had to run off on important business.";
    Matcher m = p.matcher(text);
	System.out.println(m.replaceAll("Secretary"));
  }
}
```

What this Java code does:

```
The specific regex pattern `Hillary(?=\\s+Clinton)` matches the word "Hillary" 
only when it is followed by one or more whitespace characters and the word 
"Clinton". In the provided text, it will replace occurrences of "Hillary" 
followed directly by "Clinton" with the word "Secretary". 

So if you run this code, it will replace the appropriate occurrences in the 
string and print the result.
```

I came up with this:

```
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
	
whitespace: charset reduce [space cr]

parse text [ 
	some [
		to {Hillary}
		thru whitespace
		to {Clinton} w: (
			x: (index? w) - 1
			case [
				text/(x) = #" " [
					replace/all text "Hillary Clinton" "Secretary Clinton"
				]
				text/(x) = #"^/" [
					replace/all text "Hillary^/Clinton" "Secretary^/Clinton"
				]
			]
		)
	]
]
print text
```
The result of this code is:
I think someone who is better at parsing than myself can do this better

[13:39:49](#vUIdqDV-AFPr2LdJ62z5TxvJFEy6lCoiDBIqgHm4Ycg) <Rebol2Red (Rebol2Red)>:
* I want to translate the following Java code to Red (not homework):

```
; https://www.w3schools.com/java/tryjava.asp?filename=demo_regex

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
  public static void main(String[] args) {
    Pattern p = Pattern.compile("Hillary(?=\\s+Clinton)");
	String text = "Once Hillary Clinton was talking about Sir\n" +
		"Edmund Hillary to Hillary Makasa and then Hillary\n" +
		"Clinton had to run off on important business.";
    Matcher m = p.matcher(text);
	System.out.println(m.replaceAll("Secretary"));
  }
}
```

What this Java code does:

```
The specific regex pattern `Hillary(?=\\s+Clinton)` matches the word "Hillary" 
only when it is followed by one or more whitespace characters and the word 
"Clinton". In the provided text, it will replace occurrences of "Hillary" 
followed directly by "Clinton" with the word "Secretary". 

So if you run this code, it will replace the appropriate occurrences in the 
string and print the result.
```

I came up with this:

```
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
	
whitespace: charset reduce [space cr]

parse text [ 
	some [
		to {Hillary}
		thru whitespace
		to {Clinton} w: (
			x: (index? w) - 1
			case [
				text/(x) = #" " [
					replace/all text "Hillary Clinton" "Secretary Clinton"
				]
				text/(x) = #"^/" [
					replace/all text "Hillary^/Clinton" "Secretary^/Clinton"
				]
			]
		)
	]
]
print text
```

The result of this code is:
```
```
I think someone who is better at parsing than myself can do this better

[13:40:19](#nBtoEDKXrPB5fo-DU47r-rswqtm4QSkSMiBfjejO1EE) <Rebol2Red (Rebol2Red)>:
* I want to translate the following Java code to Red (not homework):

```
; https://www.w3schools.com/java/tryjava.asp?filename=demo_regex

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
  public static void main(String[] args) {
    Pattern p = Pattern.compile("Hillary(?=\\s+Clinton)");
	String text = "Once Hillary Clinton was talking about Sir\n" +
		"Edmund Hillary to Hillary Makasa and then Hillary\n" +
		"Clinton had to run off on important business.";
    Matcher m = p.matcher(text);
	System.out.println(m.replaceAll("Secretary"));
  }
}
```

What this Java code does:

```
The specific regex pattern `Hillary(?=\\s+Clinton)` matches the word "Hillary" 
only when it is followed by one or more whitespace characters and the word 
"Clinton". In the provided text, it will replace occurrences of "Hillary" 
followed directly by "Clinton" with the word "Secretary". 

So if you run this code, it will replace the appropriate occurrences in the 
string and print the result.
```

I came up with this:

```
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
	
whitespace: charset reduce [space cr]

parse text [ 
	some [
		to {Hillary}
		thru whitespace
		to {Clinton} w: (
			x: (index? w) - 1
			case [
				text/(x) = #" " [
					replace/all text "Hillary Clinton" "Secretary Clinton"
				]
				text/(x) = #"^/" [
					replace/all text "Hillary^/Clinton" "Secretary^/Clinton"
				]
			]
		)
	]
]
print text
```

The result of this code is:
```
Once Secretary Clinton was talking about Sir
Edmund Hillary to Hillary Makasa and then Secretary
Clinton had to run off on important business.
```
I think someone who is better at parsing than myself can do this better

[13:41:20](#SFL4aB1jEFIY_TMRP8Hz0PpzeaBf-LGqjhIBE_eOLtw) <Rebol2Red (Rebol2Red)>:
* I want to translate the following Java code to Red (not homework):

```
; https://www.w3schools.com/java/tryjava.asp?filename=demo_regex

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
  public static void main(String[] args) {
    Pattern p = Pattern.compile("Hillary(?=\\s+Clinton)");
	String text = "Once Hillary Clinton was talking about Sir\n" +
		"Edmund Hillary to Hillary Makasa and then Hillary\n" +
		"Clinton had to run off on important business.";
    Matcher m = p.matcher(text);
	System.out.println(m.replaceAll("Secretary"));
  }
}
```

What this Java code does:

```
The specific regex pattern `Hillary(?=\\s+Clinton)` matches the word "Hillary" 
only when it is followed by one or more whitespace characters and the word 
"Clinton". In the provided text, it will replace occurrences of "Hillary" 
followed directly by "Clinton" with the word "Secretary". 

So if you run this code, it will replace the appropriate occurrences in the 
string and print the result.
```

I came up with this:

```
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
	
whitespace: charset reduce [space cr]

parse text [ 
	some [
		to {Hillary}
		thru whitespace
		to {Clinton} w: (
			x: (index? w) - 1
			case [
				text/(x) = #" " [
					replace/all text "Hillary Clinton" "Secretary Clinton"
				]
				text/(x) = #"^/" [
					replace/all text "Hillary^/Clinton" "Secretary^/Clinton"
				]
			]
		)
	]
]
print text
```

The result of this code is:

```
Once Secretary Clinton was talking about Sir
Edmund Hillary to Hillary Makasa and then Secretary
Clinton had to run off on important business.
```

I think someone who is better at parsing than myself can do better, can you?

[13:47:09](#1YeLuTo8lKZmaaxukfnxD2WQ0ebCgaqF6I_sVTMmqB8) <Rebol2Red (Rebol2Red)>:
* I want to translate the following Java code to Red (not homework):

```
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
  public static void main(String[] args) {
    Pattern p = Pattern.compile("Hillary(?=\\s+Clinton)");
	String text = "Once Hillary Clinton was talking about Sir\n" +
		"Edmund Hillary to Hillary Makasa and then Hillary\n" +
		"Clinton had to run off on important business.";
    Matcher m = p.matcher(text);
	System.out.println(m.replaceAll("Secretary"));
  }
}
```

What this Java code does:

```
The specific regex pattern `Hillary(?=\\s+Clinton)` matches the word "Hillary" 
only when it is followed by one or more whitespace characters and the word 
"Clinton". In the provided text, it will replace occurrences of "Hillary" 
followed directly by "Clinton" with the word "Secretary". 

So if you run this code, it will replace the appropriate occurrences in the 
string and print the result.
```

I came up with this:

```
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
	
whitespace: charset reduce [space cr]

parse text [ 
	some [
		to {Hillary}
		thru whitespace
		to {Clinton} w: (
			x: (index? w) - 1
			case [
				text/(x) = #" " [
					replace/all text "Hillary Clinton" "Secretary Clinton"
				]
				text/(x) = #"^/" [
					replace/all text "Hillary^/Clinton" "Secretary^/Clinton"
				]
			]
		)
	]
]
print text
```

The result of this code is:

```
Once Secretary Clinton was talking about Sir
Edmund Hillary to Hillary Makasa and then Secretary
Clinton had to run off on important business.
```

I think someone who is better at parsing than myself can do better, can you?

[13:51:13](#i-aSS1Fq7QpeR0Vr_ukcWw-aRe-P111RqVVheCdM-YA) <Rebol2Red (Rebol2Red)>:
* I want to translate the following Java code to Red (not homework):

```
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
  public static void main(String[] args) {
    Pattern p = Pattern.compile("Hillary(?=\\s+Clinton)");
	String text = "Once Hillary Clinton was talking about Sir\n" +
		"Edmund Hillary to Hillary Makasa and then Hillary\n" +
		"Clinton had to run off on important business.";
    Matcher m = p.matcher(text);
	System.out.println(m.replaceAll("Secretary"));
  }
}
```

What this Java code does:

```
The specific regex pattern `Hillary(?=\\s+Clinton)` matches the word "Hillary" 
only when it is followed by one or more whitespace characters and the word 
"Clinton". In the provided text, it will replace occurrences of "Hillary" 
followed directly by "Clinton" with the word "Secretary". 

So if you run this code, it will replace the appropriate occurrences in the 
string and print the result.
```

I came up with this:

```
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
	
whitespace: charset reduce [space cr]

parse text [ 
	some [
		to {Hillary}
		thru whitespace
		to {Clinton} w: (
			x: (index? w) - 1
			case [
				text/(x) = #" " [
					replace/all text "Hillary Clinton" "Secretary Clinton"
				]
				text/(x) = #"^/" [
					replace/all text "Hillary^/Clinton" "Secretary^/Clinton"
				]
			]
		)
	]
]
print text
```

The result of this code (which is correct) is:

```
Once Secretary Clinton was talking about Sir
Edmund Hillary to Hillary Makasa and then Secretary
Clinton had to run off on important business.
```

I think someone who is better at parsing than myself can do better, can you?

[14:21:25](#G7A7K4EbVI5S-sSQYxpNuaUy3UhWTM_riu3w9wfbejQ) <hiiamboris>:
Just `replace/all text ["Hillary" ahead [some [space | lf] "Clinton"]] "Secretary"` is all you have to do

[15:00:16](#OBaOxLu6W4dpnH1MF2-3Y7HijBC9KD7mngV2aAbNW7Y) <Rebol2Red (Rebol2Red)>:
Wow, Thanks I like to do it with parse. I could learn from that code which was the first goal of this.

[15:02:14](#KClABcGc_3NaPeVhsCDuv1buiGvWgSRy65U9egstoak) <Rebol2Red (Rebol2Red)>:
* Wow, Thanks. I like to do it with parse because I could learn from that code.

[15:06:59](#ne2_uTKk-D70hC_jV3o26xaLeWJdWrQIKn7fxwCmzZo) <Rebol2Red (Rebol2Red)>:
* Wow, Thanks. I like to do it with parse txt [...] because I could learn from that code.

[15:07:20](#L-HeXwpvBoxNZOF3JVB8CgTQ-OjSOX9D19XrXfp7ca4) <Rebol2Red (Rebol2Red)>:
* Wow, Thanks. I like to do it with parse text \[...\] because I could learn from that code.

[15:13:42](#G7Ujx3xeDrPpN51TUewrZ1NJ9Go61qcFmeLMQERJaFU) <Rebol2Red (Rebol2Red)>:
* Wow, Thanks. Can you show me how to do this with parse text \[...\] because I could learn from that code.

[15:34:35](#HGmZ-GGIJsyr-eygLadABfyG_38x3-oFqLeXLv8Z4jQ) <hiiamboris>:
Parse has a [`change` rule](https://github.com/red/docs/blob/master/en/parse.adoc#change) for that. Just adapt it to the above matching rule

## 2-Mar-2025

[10:24:54](#wsKFnDiyX6pMJKxVqueIZ2YHVr5QDho4lan9iSxKPk8) <Rebol2Red (Rebol2Red)>:
hiiamboris: This is beyond me. Can you give me the code please. Thanks in advance.

[10:35:47](#lGqmWuNJ2yabnFa31gGf4b-t-gPEiho5lui4igcmwHw) <hiiamboris>:
Just ask what you don't understand

[11:22:01](#SSUkADCSM5OjCotWvy-VdphEV0PHShQlDsszp5Okqt4) <Rebol2Red (Rebol2Red)>:
hiiamboris: How do I get the result of parsing [rule] ?
In this case (I think it would be, I could be wrong though): ````parse ["Hillary" ahead [some [space | lf] "Clinton"]]``` if I can't use copy or keep?```

[11:22:32](#_UP3o3YJZU42SqskYaCbB85BZO5dCRgveWsaWzT0y_U) <Rebol2Red (Rebol2Red)>:
* hiiamboris: How do I get the result of parsing \[rule\] ?
In this case (I think it would be, I could be wrong though): 
```parse \["Hillary" ahead \[some \[space | lf\] "Clinton"\]\]```
 if I can't use copy or keep?`

[11:22:57](#YMjUlBiBJ3MAUMVLyzozRhdDwbFBEglxooASYYnbZbk) <Rebol2Red (Rebol2Red)>:
* hiiamboris: How do I get the result of parsing \[rule\] ?
In this case (I think it would be, I could be wrong though):
'''parse ["Hillary" ahead \[some \[space | lf\] "Clinton"\]\]'''
if I can't use copy or keep?\`

[11:23:23](#ThZJ1vx9KeUWoV-MaG-eRAc2BYmN8tBvhr76ItswvSk) <Rebol2Red (Rebol2Red)>:
* hiiamboris: How do I get the result of parsing \[rule\] ?
In this case (I think it would be, I could be wrong though):
```
parse \["Hillary" ahead \[some \[space | lf\] "Clinton"\]\]
```
if I can't use copy or keep?\`

[11:24:01](#SfMjKB5PWdIXnKTyMb7kzq3ZuWT7kueCM5s08SdgSW0) <Rebol2Red (Rebol2Red)>:
* hiiamboris: How do I get the result of parsing \[rule\] ?
In this case (I think it would be, I could be wrong though):

```
parse ["Hillary" ahead \[some \[space | lf\] "Clinton"\]\]
```

if I can't use copy or keep?\`

[11:24:12](#lPYZAOMObf4gYuRThnfLz-MPdHCnZxMSISYY760wR4Y) <Rebol2Red (Rebol2Red)>:
* hiiamboris: How do I get the result of parsing \[rule\] ?
In this case (I think it would be, I could be wrong though):

```
parse ["Hillary" ahead \[some \[space | lf\] "Clinton"]]
```

if I can't use copy or keep?\`

[11:24:25](#AWprc5_9TNGFQxG6xRiFgnhnZXC5NBpWXSX3iJBqV28) <Rebol2Red (Rebol2Red)>:
* hiiamboris: How do I get the result of parsing \[rule\] ?
In this case (I think it would be, I could be wrong though):

```
parse ["Hillary" ahead [some \[space | lf] "Clinton"]]
```

if I can't use copy or keep?\`

[11:24:48](#oOOU_OyE3RDGyavUAfvm_MvmqqLDT-zHg5KWxkIzIEc) <hiiamboris>:
Do you need the result though? `change` combinator will receive the part of the string that matched the rule following it anyway. Just let it do its work ;)

[11:25:20](#RNGZ7kQ9Ifed-ampQAhxg_vMPc4Td-9_1LHhjOxbTcU) <Rebol2Red (Rebol2Red)>:
* hiiamboris: How do I get the result of parsing \[rule\] ?
In this case (I think it would be, I could be wrong though):

```
parse ["Hillary" ahead [some [space | lf] "Clinton"]]
```

if I can't use copy or keep?\`

[11:25:32](#cLCm1D-k7opMkQ-w57Ljya135Izxhu18jncOJE0tUQ8) <hiiamboris>:
Play with it in the console, get a feel of it first.

[11:26:00](#uQyjEor5xnJjy_PqPCNhRFC5pZ29T7UOZeAhh4wA98k) <hiiamboris>:
```
>> parse s: "abcd" [change "ab" "xy"] s
== "xycd"
```

[11:34:35](#K9znGjluQy6A_aw9siFd6LcDMZTOblJZeWi-OiJ9OJ0) <Rebol2Red (Rebol2Red)>:
Aha, I will try. 'I'll be back' If I can't get it working. The reason I want this as a showoff of Red to my son. He is very smart. Studying mathematics and physics on a university in holland. Maybe I can convince him with this code to switch from Python to Red. Then we have another ReducerÌ†ΩÌ∏Ä

[11:37:03](#olOa6JR0D5IsL-4DcQ4bTxgO8stqYHzLmokyDQOVGes) <hiiamboris>:
Try it and if you feel blocked again, don't hesitate to ask ;)

[11:37:26](#TGCq9M04Gs6EecxJgSzbxPhd4XPYsBJ6Kw2NCEyxFk4) <hiiamboris>:
By the way, we have an [intro guide for Python coders by Galen](https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers)

[11:38:20](#ovpNdYoF_agIiPcU8fsDACuSpttPWrL3DWq8QguTRx4) <Rebol2Red (Rebol2Red)>:
I will show him this intro guide, thanks.

[12:17:29](#9FYUaixXi97HITb0-BSZ-1vnU-INyx4XpYOqQ3M9xw8) <Rebol2Red (Rebol2Red)>:
hiiamboris: I have tried this:
```
parse s: text [
	["Hillary" ahead [some [space | lf] "Clinton"]] (change s "Hillary Clinton" "Secretary Clinton")
]
probe text
probe s	
```
Is the following not oke?
```
["Hillary" ahead [some [space | lf] "Clinton"]]
```
Do i have to use this?
```
"Hillary" ahead [some [space | lf] "Clinton"
```
Is the following not oke?
```
(change s "Hillary Clinton" "Secretary Clinton")
```
Do I have to use?
```
(change s "Hillary" "Secretary")
```
Or is everything wrong?
 
I tried all of it. Nothing changes.

I'm very confused at the moment!

[12:18:25](#EDAmFXAJkHnHpa4XPeVWL4XQIQTSFuT08w3yY4_94i4) <Rebol2Red (Rebol2Red)>:
* hiiamboris: I have tried this:

```
parse s: text [
	["Hillary" ahead [some [space | lf] "Clinton"]] (change s "Hillary Clinton" "Secretary Clinton")
]
probe text
probe s	
```

Is the following not oke?

```
["Hillary" ahead [some [space | lf] "Clinton"]]
```

Do I have to use the following?

```
"Hillary" ahead [some [space | lf] "Clinton"
```

Is the following not oke?

```
(change s "Hillary Clinton" "Secretary Clinton")
```

Do I have to use the following?

```
(change s "Hillary" "Secretary")
```

Or is everything wrong?

I tried all of it. Nothing changes.

I'm very confused at the moment!

[12:18:46](#R1ialaRAscDRjfZbyBjHI498Iu3iXtyf1EvZLGLKHoo) <hiiamboris>:
You're confused  because you're mixing `change` parse rule with `change` Red action

[12:19:17](#dMhXrmjSBqtPNL9XtvbhsMFCOrLopSJzRTqIUQLggRM) <hiiamboris>:
Note in my above example I didn't write `parse s: "abcd" ["ab" (change s "xy")]`!

[12:20:31](#gRJtszu49BKVFnpORXhabYKrnAS-w4GcaS0qfNGoGBE) <hiiamboris>:
`()` in Parse is an escape mechanism to run arbitrary Red code. But until you did, you're writing Parse rules.

[12:22:25](#5o8OvVRMmwDD0sGpxfsNtNNgkhdd8iIK-SJrlgVY9ME) <hiiamboris>:
Also you will have to add an `any` loop around your `change match replacement` construct, and add a `skip` alternative to advance input where your rule is not matched.

[12:24:16](#b0zMtOJKtjYy72Xmt-nj1jEvajpFpIBMhjSN9q3d8Z0) <hiiamboris>:
You can inspect `?? replace` to see what rule it uses currently:
```
        ...
        rule: [
            any [
                end
                | change pattern (value) [if (all) | break]
                | if (deep?) ahead any-list! into rule
                | skip
            ]
        ]
```

[12:25:00](#M3-SFqEEXdpzCYqtKt3uw2GoX4mdh_pkw5xGkubCDRE) <hiiamboris>:
It's more complicated than what you want, but may give you a general idea.

[12:38:07](#90qd-SdkwzXOhO0r8K9IbRms9ZDww-Q1Mh1SyJO1B8A) <Rebol2Red (Rebol2Red)>:
I don't understand it at all anymore. 
I told my son this would be easy because I can easily parse webpages. See http://rensvanschie.atwebpages.com/filmsoptv.html
(Old data because I have to run my program to parse a lot of pages with subpages for this and upload it to my website)
I think this will scare him off.

[12:38:49](#M5acJmucFykef-KJ2GJbW1MAZ49ls7VX1EZ7agpt-_Q) <Rebol2Red (Rebol2Red)>:
* I don't understand it at all anymore. 
I told my son this would be easy because I can easily parse webpages. See http://rensvanschie.atwebpages.com/filmsoptv.html
(Old data because I have to run my program to parse a lot of pages with subpages for this and upload it to my website and its designed to show on a tablet)
I think this will scare him off.

[12:39:28](#9jMkyjLByXbAfxO1YX9JyRg8I0IZY7_a0UvShZN9ucM) <hiiamboris>:
Or maybe he will solve it in a few minutes, who knows ;)

[12:42:47](#G8J4Zr9MtREx4s4qje-YU-gShBV19dRuxhYwqJa09oY) <Rebol2Red (Rebol2Red)>:
I will let him try to solve it when he is back from a little vacation for 4 days. I will leave it for now. Many thanks!!!

[12:43:41](#0Sl2AK9GhcuzWfeydfohU1guYHlD0aq1SoLGU7xmoHI) <hiiamboris>:
You're welcome :) There's some beginner's level Parse introduction in that guide I gave you. Let him start the quest from there :)

[12:45:47](#HTD4SevPrZ7BYiAux-vLHGFOlPRtuiXPUceQSGKkR6A) <Rebol2Red (Rebol2Red)>:
Can I somehow save our conversation?

[12:46:54](#9_wNvIgNMRutI_YVXjb6WW-pKHMv7g64w-zmHIg1Qb0) <hiiamboris>:
To an extent possible with this awkward matrix infrastructure: 
https://matrix.to/#/%23red_parse%3Agitter.im/%24QFt7LRC1SjOpneaMZ63QNyZA5NnuxFcNJ4BKv4ex6NQ?via=gitter.im&via=matrix.org&via=matrix.freyachat.eu

[12:48:01](#GhJbkBeiAlwzmt8XC8N_4TgdEjyzwiz_RJtTi7QUEaI) <Rebol2Red (Rebol2Red)>:
I could also make screenshots. I'll see. Have a nice day!

[13:06:15](#jZwswspfAlFllpYH78jPaj-XeD8N0moqyB6ykoS-m5A) <Rebol2Red (Rebol2Red)>:
* I don't understand it at all anymore. 
I told my son this would be easy because I can easily parse webpages.
(Old data because I have to run my program to parse a lot of pages with subpages for this and upload it to my website and its designed to show on a tablet)
I think this will scare him off.

[13:06:31](#SVDsABkbeCGZIZ_UV-XeP6a6-dmdU6cG_TQVbb--NcI) <Rebol2Red (Rebol2Red)>:
* I don't understand it at all anymore. 
I told my son this would be easy because I can easily parse webpages.
I think this will scare him off.

[14:12:21](#X6-ZIS6_7G810DG1UrhWACehDz3UXhsSaTuUmclNHLY) <GiuseppeChillemi (GiuseppeChillemi)>:
Remember one central point: the rules start at a point and then end where the rule you have created is no more valid, in other words, where it does not match. This is the end position of the rule.

So if you have the following rule:

```
parse x: "xxxababababxxxxx" [any "x"]
```
This rule will match from the first "x" and stops before "ab"

`change` modifies what a rule has mached. So if you write:

```
parse x: "xxxababababxxxxx" [change [any "x"] "hello"]
```

It will change the 3 "x" matched from any into "hello", resulting in 

```
parse x: "xxxababababxxxxx" [change [any "x"] "hello"]
>> probe x
"helloababababxxxxx"
```

[14:12:34](#MIZbKSoCBvBo7ZgiwW0j0D9ZortZ_gYRM5k4PmxdGw0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Remember one central point: the rules start at a point and then ends where the rule you have created is no more valid, in other words, where it does not match. This is the end position of the rule.

So if you have the following rule:

```
parse x: "xxxababababxxxxx" [any "x"]
```

This rule will match from the first "x" and stops before "ab"

`change` modifies what a rule has mached. So if you write:

```
parse x: "xxxababababxxxxx" [change [any "x"] "hello"]
```

It will change the 3 "x" matched from any into "hello", resulting in

```
parse x: "xxxababababxxxxx" [change [any "x"] "hello"]
>> probe x
"helloababababxxxxx"
```

[14:13:30](#aLyqRak5vZ1RYw9QwrR38FMamk9sdWE2gGYf_ygwiOM) <GiuseppeChillemi (GiuseppeChillemi)>:
* Remember one central point: the rules start at a point and then ends where the rule you have created is no more valid, In other words, where it does not match anumore,  this is the end position of the rule. So you have a starting and ending point

Lets make an example: you have the following rule:

```
parse x: "xxxababababxxxxx" [any "x"]
```

This rule will match from the first "x" and stops before "ab"

`change` modifies what a rule has mached. So if you write:

```
parse x: "xxxababababxxxxx" [change [any "x"] "hello"]
```

It will change the 3 "x" matched from any into "hello", resulting in

```
parse x: "xxxababababxxxxx" [change [any "x"] "hello"]
>> probe x
"helloababababxxxxx"
```

[14:14:00](#GYQsceVfXqgsDJLckVa7RT_OEb4FuM1lt6EaGQOrhd4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Remember one central point: the rules start at a point and then ends where the rule you have created is no more valid, In other words, where it does not match anumore,  this is the end position of the rule. So you have a starting and ending point

Lets make an example: you have the following rule:

```
parse srt: "xxxababababxxxxx" [any "x"]
```

This rule will match from the first "x" and stops before "ab"

`change` modifies what a rule has mached. So if you write:

```
parse str: "xxxababababxxxxx" [change [any "x"] "hello"]
```

It will change the 3 "x" matched from any into "hello", resulting in

```
parse str: "xxxababababxxxxx" [change [any "x"] "hello"]
>> probe str
"helloababababxxxxx"
```

[14:14:28](#0cwOQdn2tibDbf4eupWvb0pUyU-ewAGGpRn3oURYOX0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Remember one central point: the rules start at a point and then ends where the rule you have created is no more valid, In other words, where it does not match anumore,  this is the end position of the rule. So you have a starting and ending point

Lets make an example: you have the following rule:

```
parse srt: "xxxababababxxxxx" [any "x"]
```

This rule will match from the first "x" and stops before "ab"

`change` modifies what a rule has mached. So if you write:

```
parse str: "xxxababababxxxxx" [change [any "x"] "hello"]
```

It will change the 3 "x" matched from any into "hello", resulting in

```
parse str: "xxxababababxxxxx" [change [any "x"] "hello"]
>> probe str
"helloababababxxxxx" ; <----- THIS IS THE RESULT
```

[14:24:13](#Jnc_8wDDJotAo8Tvx-tOb2sv7kEwwKb5_xFSIZmUgeI) <GiuseppeChillemi (GiuseppeChillemi)>:
Now lets modify the rule: `any "x"` into `any ["x" | "ab"]

The rule is matches "x" OR "ab". 
So it starts matching the 3 "x".
Then it fails, as not the input is "abababab...". So the rule "x" fails but the rule "ab", succeds until "...abxxxxx". Then the input returns to be "xxxxx" and the first rule returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule ends and the end of the string.

If you write:

```  
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
>> probe x
"hello";<------ THIS IS THE RESULT
```  
The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into "hello"

[14:24:35](#T5G858IZZlhuFy4i45hdxmuPYWbRuYGe9nlcAfkfs-Q) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule is matches "x" OR "ab".
So it starts matching the 3 "x".
Then it fails, as not the input is "abababab...". So the rule "x" fails but the rule "ab", succeds until "...abxxxxx". Then the input returns to be "xxxxx" and the first rule returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule ends and the end of the string.

If you write:

```
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into "hello"

[14:24:45](#aMiJjcLs22UQBLfi0C6kbynlLdpYkDt0Q6aM4xmkWNY) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches "x" OR "ab".
So it starts matching the 3 "x".
Then it fails, as not the input is "abababab...". So the rule "x" fails but the rule "ab", succeds until "...abxxxxx". Then the input returns to be "xxxxx" and the first rule returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule ends and the end of the string.

If you write:

```
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into "hello"

[14:26:17](#PnMR95-8qqaTQzj_vi9Tck0AY8C9bTaAu4sWzdlj_vM) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as not the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until "...xxxxx", so the end position of the matches continues moving. When the input returns to be "xxxxx" , the first rule returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule ends and the end of the string.

If you write:

```
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into "hello"

[14:26:46](#JP6fWuvF5iFC1794AIQEufSaNG8X992_P5Qt7xVTsc4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as not the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until `"...xxxxx"`, so the end position of the matches continues moving. When the input returns to be "xxxxx" , the first rule returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule ends and the end of the string.

If you write:

```
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into `"hello"`

[14:27:45](#TyJ75fj43BhFLCaAQj8h3RXQDN3Y-dIMs2SDsffgncU) <GiuseppeChillemi (GiuseppeChillemi)>:
Again, remember: "CHANGE` receives a start and end position where the rule provided has matched and changes it into the string you the string you have provided.

[14:27:56](#wQmSWlyHon63E9j03ds3CzoWQN9HJ_GwOTq31NL2ako) <GiuseppeChillemi (GiuseppeChillemi)>:
* Again, remember: `CHANGE` receives a start and end position where the rule provided has matched and changes it into the string you the string you have provided.

[14:28:32](#46hgQo0bOfJ0pZhH_LhPRtTTB7N4GllUqLqI1PrGYZk) <GiuseppeChillemi (GiuseppeChillemi)>:
* Again, remember: `CHANGE` receives a start and end position where the rule provided has matched and changes the parsed content into the string you have provided.

[14:30:12](#5ozkDcf4C_623NelqykB9Z66l8oswZKquG2rsKi6E1s) <GiuseppeChillemi (GiuseppeChillemi)>:
* Again, remember: `CHANGE` receives a start and end position where the rule provided has matched and changes the parsed content into the string you given to it.
In this case: `"xxxababababxxxxx"` become `"hello"` because your rule has stared at position 1 and ended at the end of the string, so it changes everything.

[14:31:26](#K9F7WjsamNLCIkDZ_KG4JyhtHlgN7NL606kphCTM1qU) <GiuseppeChillemi (GiuseppeChillemi)>:
* Remember one central point: the rules start at a point and then ends where the rule you have created is no more valid, In other words, where it does not match anymore,  this is the end position of the rule. So you have a starting and ending point

Lets make an example: you have the following rule:

```
parse srt: "xxxababababxxxxx" [any "x"]
```

This rule will match from the first "x" and stops before "ab"

`change` modifies what a rule has mached. So if you write:

```
parse str: "xxxababababxxxxx" [change [any "x"] "hello"]
```

It will change the 3 "x" matched from any into "hello", resulting in

```
parse str: "xxxababababxxxxx" [change [any "x"] "hello"]
>> probe str
"helloababababxxxxx" ; <----- THIS IS THE RESULT
```

[14:31:59](#nRqWt6k_ALGAC8xNq91TE206UneoBvinfiq4xgCEDj0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Remember one central point: the rules start at a point and then ends where the rule you have created is no more valid, In other words, where it does not match anymore,  this is the end position of the rule. So you have a starting and ending point

Lets make an example: you have the following rule:

```
parse srt: "xxxababababxxxxx" [any "x"]
```

This rule will match from the first `"x"` and stops before `"ab"`

`change` modifies what a rule has mached. So if you write:

```
parse str: "xxxababababxxxxx" [change [any "x"] "hello"]
```

It will change the 3 "x" matched from any into "hello", resulting in

```
parse str: "xxxababababxxxxx" [change [any "x"] "hello"]
>> probe str
"helloababababxxxxx" ; <----- THIS IS THE RESULT
```

[14:32:30](#IebWwkwDhNWgiqwMw1DNZAzgIfdUx9qKLWenMAbLblc) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until `"...xxxxx"`, so the end position of the matches continues moving. When the input returns to be "xxxxx" , the first rule returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule ends and the end of the string.

If you write:

```
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into `"hello"`

[14:33:34](#KBfpNbofhPCnIcHWcNnVxYbMtACcGIGVZbzULOlvCq0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until `"...xxxxx"`. When the input returns to be `"xxxxx"` , the first rule `"x"` returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule ends and the end of the string.

If you write:

```
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into `"hello"`

[14:33:48](#LxtsEybeocWKdIKs1lE4C8j-N5HVNK6-BEm486UYQRE) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until `"...xxxxx"`. As the input returns to be `"xxxxx"` , the first rule `"x"` returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule ends and the end of the string.

If you write:

```
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into `"hello"`

[14:36:07](#-9ROD0IXsSEGEYlNSvgB9DxLoWGo5vn4-UI2mNifEHM) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until `"...xxxxx"`. As the input returns to be `"xxxxx"` , the first rule `"x"` returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule has successfully continue until the end of the string.

If you write

```
>> parse x: "xxxababababxxxxx" [change [any "x" | "ab"] "hello"]
```
You will change everything!
```
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into `"hello"`

[14:36:56](#Igk1n2LGbuWQNxPzgKdcsAlEp-u1dRTn_vNCAqf7kg0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Again, remember: `CHANGE` receives a start and end position where the rule provided has matched and changes the parsed content into the string you given to it.
In this case: `"xxxababababxxxxx"` become `"hello"` because your rule has stared at position 1 and the last successful match was at the end of the string, so it changes everything.

[14:37:01](#HnYAd9qR-IUdBmr4K9J-BzkeFHOu8Lje_g1bUmznQ58) <GiuseppeChillemi (GiuseppeChillemi)>:
* Again, remember: `CHANGE` receives a start and end position where the rule provided has matched and changes the parsed content into the string you given to it.
In this case: `"xxxababababxxxxx"` become `"hello"` because your rule has stared at position 1 and the last successful match was at the end of the string, so it changes everything!

[15:38:25](#aLVmTqAGhIEVg-SRrEWv9lpilylVlXXccPW-oR2pspI) <Rebol2Red (Rebol2Red)>:
GiuseppeChillemi (GiuseppeChillemi): This looks clear to me at a first glance. Will dive into this. Thank you.

[18:55:17](#tPQR80fk2n5-FxaFxJjYrMmz7ehyCIK2uk_AJZJCfHc) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until `"...xxxxx"`. As the input returns to be `"xxxxx"` , the first rule `"x"` returns to match again.. until the end position.
So you have parsed starting at position 1, end you rule has successfully continue until the end of the string.

If you write

```
>> parse x: "xxxababababxxxxx" [change [any ["x" | "ab"]] "hello"] ;<------- I have changed this!!
```

You will change everything!

```
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into `"hello"`

[18:55:54](#zK8i5T8VZsrmvSNE5KtrCQ0OPKc5r_ijyvQhEAX1FVo) <GiuseppeChillemi (GiuseppeChillemi)>:
I have added "I have changed this!!" in an error I have made while copying and pasting a bug

[18:56:19](#xnXbBFbSxzteKVgJbcnPbmD_jHEgZJV7stMX9eC7IxU) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have added "I have changed this!!" in an error I have made while copying and pasting a bug in another group. So look at my code and screenshot it again! :D

[19:21:37](#Z9DJx6Eumid-PBvNBi51WMTw3mR_8rZIuG1BRNgSfpY) <GiuseppeChillemi (GiuseppeChillemi)>:
This is difficult, so Rebol2Red (Rebol2Red) does not consider it!

I have found a way to index al the elements found:

```
>> parse "xxxababxxx" [collect [any ["x" | keep pos: "ab" keep (index? pos) | skip ]]]
== ["ab" 4 "ab" 6]
```

Keep is able to retain the result of a paren other than the matched element

[19:22:01](#mvaOAHdLPGKlGp8s3K2t1tm6nwfGZxPhcJSV7vc_d6k) <GiuseppeChillemi (GiuseppeChillemi)>:
* This is difficult, so Rebol2Red (Rebol2Red) does not consider it!

I have found a way to index al the elements found:

```
>> parse "xxxababxxx" [collect [any ["x" | keep pos: "ab" keep (index? pos) | skip ]]]
== ["ab" 4 "ab" 6]
```

Keep is able to retain the result of a paren other than the imput matched from the rule

[19:23:31](#gzyCPqMCPWrUinzay0H7aVGu2wMO3t6VVRYcH-vUsDw) <GiuseppeChillemi (GiuseppeChillemi)>:
* This is difficult, so Rebol2Red (Rebol2Red) do not consider it!

I have found a way to index al the elements found:

```
>> parse "xxxababxxx" [collect [any ["x" | keep pos: "ab" keep (index? pos) | skip ]]]
== ["ab" 4 "ab" 6]
```

Keep is able to retain the result of a paren other than the imput matched from the rule

[19:50:00](#uXyCgCWbUxVs9xwWWTSusdVZ9dPxzYPZWBiwIhMT5CA) <GiuseppeChillemi (GiuseppeChillemi)>:
* This is difficult, so Rebol2Red (Rebol2Red) do not consider it!

I have found a way to index al the elements found:

```
>> parse "xxxababxxx" [collect [any ["x" | keep pos: "ab" keep (index? pos) | skip ]]]
== ["ab" 4 "ab" 6]
```

Keep is able to retain the result of a paren other than the input matched from the rule

[19:51:58](#aSE3b4qfS7xpQmaFRtQ1lBegzjlKe2ip_AAvGWZ6XW4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until `"...xxxxx"`. As the input returns to be `"xxxxx"` , the first rule `"x"` returns to match again.. until the end position.
So you have parsed starting at position 1 and you rule has successfully continued until the end of the string mathching "x" or "ab" when the input is not "x...x".

If you write

```
>> parse x: "xxxababababxxxxx" [change [any ["x" | "ab"]] "hello"] ;<------- I have changed this!!
```

You will change everything!

```
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into `"hello"`

[19:52:10](#Q37th4VWv9tsRWB_GVRwIfGTNSg4VFAf_ZaOjyX-Y30) <GiuseppeChillemi (GiuseppeChillemi)>:
* Now lets modify the rule: `any "x"` into `[any ["x" | "ab"]]`

The rule matches `"x"` OR `"ab"`.
So it starts matching the 3 `"x"`.
Then it fails, as the input is `"abababab..."`.The rule `"x"` fails after position 3 but the rule `"ab"` succeds until `"...xxxxx"`. As the input returns to be `"xxxxx"` , the first rule `"x"` returns to match again.. until the end position.
So you have parsed starting at position 1 and you rule has successfully continued until the end of the string mathching "x" or "ab" when the input is not `"x...x"`.

If you write

```
>> parse x: "xxxababababxxxxx" [change [any ["x" | "ab"]] "hello"] ;<------- I have changed this!!
```

You will change everything!

```
>> probe x
"hello";<------ THIS IS THE RESULT
```

The result will be just `"hello"` because your rule has matched from position 1 to the end and CHANGE will bodify the match from start to the end into `"hello"`

[22:08:45](#xJ1qFgQnMi_reO6OxBZQnMa4MQN13NZpUQBucuhtol0) <Rebol2Red (Rebol2Red)>:
GiuseppeChillemi (GiuseppeChillemi): I think this is correct 
```
whitespace: [" " | "^/"] 
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
parse text [collect set res[any [pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip ]]]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```
Do you see any problem with this code?


[22:09:07](#zCzbBnui3UcBL6ALYyoJ4j8ZQjPbGQXgJzQPb5xlEgU) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi): I think this is correct

```
whitespace: [" " | "^/"] 
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
parse text [collect set res [any [pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip ]]]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

[22:09:46](#LHrnzKI7NT10fmpZ5xfyaY_NSvRE0npz626-YXBpejI) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi): 
I think this is correct

```
whitespace: [" " | "^/"] 
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
parse text [collect set res [any [pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip ]]]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

[22:11:25](#wqWGKGEDK-7omZyDloDpJX-01ICZj8ueAxLZA8xvRFU) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi):
I think this is correct

```
whitespace: [" " | "^/"] 
text: rejoin [
	"Once Hillary Clinton was talking about Sir^/"
	"Edmund Hillary to Hillary Makasa and then Hillary^/"
	"Clinton had to run off on important business."
]
parse text [
    collect set res [any [pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip ]]
]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

[22:11:50](#-Ej0HdQpQUAAwpGTcFChdYyHHw6fz6LoL1yie7ehMkQ) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi):
I think this is correct

```
whitespace: [" " | "^/"] 
text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]
parse text [
    collect set res [any [pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip ]]
]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

[22:12:17](#Rk_rzV8CDjLAwUhr_QeFgGpU9LIuDrN8OrdYb5QqH-8) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi):
I think this is correct

```
whitespace: [" " | "^/"] 
text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]
parse text [
    collect set res [
        any [pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip ]
    ]
]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

[22:12:43](#3LEKYNErX-kh0xXAF_bDZQCNV86f2szf-ljMGb7i72M) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi):
I think this is correct

```
whitespace: [" " | "^/"] 
text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]
parse text [
    collect set res [
        any [
            pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip 
        ]
    ]
]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

[22:13:31](#yJ0AxqMJSicwIiDziwjQlsT1A6XmWE2IBhBGQkFGKoA) <GiuseppeChillemi (GiuseppeChillemi)>:
Why don't you use CHANGE? Try it! 

[22:14:03](#vWA63i3cRX08RUw_jkGhvur9Qz5BUZbq4tqL47Hr83g) <GiuseppeChillemi (GiuseppeChillemi)>:
(I will test your code when in front of my PC)

[22:20:44](#uTrOlYSmCbm2iu7hOGdXWH7UtQsGi7kYKJamyqNJk8A) <Rebol2Red (Rebol2Red)>:
GiuseppeChillemi (GiuseppeChillemi): I would like to use change but I do not know how

[22:21:54](#liigSih37JOrB_2O4cNv_c4bC624tA419SDqz2-fU0Y) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi): I would like to use change but I do not know how and were to put this

[22:22:09](#D4jLc-77xhUuKZzVRvHHGAEb0dFz-QpAAugxorx59BM) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi): I would like to use change but I do not know how and where to put this

[22:52:53](#rtuI4TY8Dn-yRLtj9PZbekrLdbtdaO6kXjzlP19QCVk) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi):
I think this is correct

```
whitespace: [" "|"^/"] 
text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]
parse text [
    collect set res [
        any [
            pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip 
        ]
    ]
]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

[22:55:45](#fvoz6MY-rcgLhpLXgu3cHhaVbt-t7ZenjGGCTPUhUkk) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi):
I think this is correct

```
; whitespace: [" "|"^/"] 
whitespace: charset reduce [tab space cr lf]
text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]
parse text [
    collect set res [
        any [
            pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip 
        ]
    ]
]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

[22:58:15](#STxuh3J51aWdKzV9IdMZs-Jv3JdVe6-EBmWsNmA73e0) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi):
I think this is correct

```
whitespace: charset reduce [tab space cr lf] ; whitespace: ["^-"|" "|"^M"|"^/"] 
text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]
parse text [
    collect set res [
        any [
            pos: "Hillary" whitespace "Clinton" keep (index? pos) | skip 
        ]
    ]
]
forall res [replace at text res/1 "Hillary" "Secretary"]
print text
```

Do you see any problem with this code?

## 3-Mar-2025

[2:24:23](#cJnsBHQuU0QgXYGaUlVtf3Jkno_hLlG2MXDY1hS6A4E) <GiuseppeChillemi (GiuseppeChillemi)>:
You have this text: 

```
text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]
```
Then you have created the `whitespace` rule:
```
whitespace: charset reduce [tab space cr lf] ; whitespace: ["^-"|" "|"^M"|"^/"] 
```
You have all you need:

[2:25:22](#JEvM-aS840kSM6w2RrXIjbp_zegaHXbDP8YT26f1AK8) <GiuseppeChillemi (GiuseppeChillemi)>:
First you need to search for `"Hillary" whitespace "Clinton"`

[2:25:43](#VXQu_Lo65VjGKfiB0yRpv0ir2kFOlybyIuw8J__it0w) <GiuseppeChillemi (GiuseppeChillemi)>:
Then change just `"Hillary"`

[2:26:08](#LAxPjZJeVajxwy7ULmvLROfAftOwDEpGRx4MuJPt8mM) <GiuseppeChillemi (GiuseppeChillemi)>:
So you need 2 rules, one to find the name and surname, and another to change the name. 

[2:26:54](#LcUNjjy63jEjXXbD4HkeAXib1wKp7wIzsskLBKdAb1s) <GiuseppeChillemi (GiuseppeChillemi)>:
To change just it, you need to come back to the starting position once you found `"Hillary" whitespace "Clinton"`

[2:27:57](#uydVK89Hn5h0NIqopkIfrfhFiJ4giLzmeqpggIwas-U) <GiuseppeChillemi (GiuseppeChillemi)>:
You have 2 ways: setting a position with `pos:` and returning back to it with `:s` after having matched the full name and surname.

[2:28:41](#66An-Ry87vjUAHPcDFXZjKusdhExBKFsSOJw8DEqOnU) <GiuseppeChillemi (GiuseppeChillemi)>:
Or just the rule `ahead [<rule>]` which matches without advancing, so after it you are still at the start of the match

[2:29:31](#tMXoU1DEjA-u9YvuKxv7EmBe4TZvisoWwSXuJT6QmTY) <GiuseppeChillemi (GiuseppeChillemi)>:
In both cases, you must say Red: `change "Hillary" "secretary"`

[2:31:00](#0EGgg2sIqr0IHcbkM0n81tRF7w9qlt-pX9KG6xdDaYU) <GiuseppeChillemi (GiuseppeChillemi)>:
Which means "match the rule `"Hillary"`, so from the starting position of the match which is `h` to the end which is `y` into `"Secretaty"`

[2:31:33](#J-FSARs0e5Q3gXMIMzL5_a2buPuBYWOvEJ9zFDEedzk) <GiuseppeChillemi (GiuseppeChillemi)>:
* Which means "match the rule `"Hillary"`, so from the starting position of the match which is `h` to the end which is `y` into `"Secretary"` (Remeber, starting and end position, so you fix this rule)

[2:37:49](#fZsbFcKb5b-05oaK-vLxGn3TUyS0YaxSwvN1x_fOSRw) <GiuseppeChillemi (GiuseppeChillemi)>:
Lets write the parse rule together: 
```
parse text [
   any [;Start a loop
      ahead ["Hillary" whitespace "Clinton"]; Look AHEAD if you find "Hillary" whitespace "Clinton" DON'T MOVE!, or stop the rule HERE and go to SKIP 
               change "Hillary" "Secretary"  ;<-- If the previous rule is found, try to match "Hillary" and change to "Secretary"
               ;you can do this because `AHEAD` has found your string but has not advanced, so the the parsing continues to the `CHANGE` rule 
    | 
       skip; If the "Hillary" whitespace "Clinton" string is not found, skip 1 character
   ]
]
```

[2:38:22](#NFJAVwJ89n7u0vFimh4ArcyrnBMsqfF0H0BTi_jLptw) <GiuseppeChillemi (GiuseppeChillemi)>:
* Lets write the parse rule together:

```
parse text [
   any [;Start a loop
      ahead ["Hillary" whitespace "Clinton"]; Look AHEAD and if you find "Hillary" whitespace "Clinton" DON'T MOVE!, or stop the rule HERE and go to SKIP 
               change "Hillary" "Secretary"  ;<-- If the previous rule is found, try to match "Hillary" and change to "Secretary"
               ;you can do this because `AHEAD` has found your string but has not advanced, so the the parsing continues to the `CHANGE` rule 
    | 
       skip; If the "Hillary" whitespace "Clinton" string is not found, skip 1 character
   ]
]
```

[2:39:46](#DImiw-LB-eIVBMoZjjqWNKAgBcB4b4_HpISxmuzdNJM) <GiuseppeChillemi (GiuseppeChillemi)>:
Remembers, rules are linear and prosecutes on succes, otherwhise PARSE try the alternate, if AHEAD fails, you go to SKIP without passing from `change`.

[2:41:35](#YyOxnKxHZKotObMkk_AYE-2uB8c4tb6DQMGLOCMkGSM) <GiuseppeChillemi (GiuseppeChillemi)>:
If `AHEAD` succeds, `CHANGE` tries to match `Hillary`, if it succeds, the input jumps after this word and change transforms it to `Secreatary` 

[2:43:52](#UidfPWaMAnGZyDHLmFaPj_3ay3P9t3qfyauwTK8MlY0) <GiuseppeChillemi (GiuseppeChillemi)>:
As the input has endend with success,  has you have reached `|`, then the whole rule has been completed with succes and `SKIP` is not executed. You don't move by 1 character but by the position matched by `change`

[2:45:37](#wzIIWInyZLY-JMI0WNQhToSCVfeX7T5-mx3MWC_Kq0M) <GiuseppeChillemi (GiuseppeChillemi)>:
If `change` has not success, for exampe if you tried `change "hillarii"`, the input would be still at the start of `hillary` and `SKIP` activated as alternate rule. 

[2:45:46](#qTNkFIX_9kTFDrXWdkJffgx0suMqL6oZjbz_sRzBnQM) <GiuseppeChillemi (GiuseppeChillemi)>:
* If `change` has not success, for exampe if you tried `change "hillarii"`, the input would be still at the start of `"hillary"` and `SKIP` activated as alternate rule.

[2:46:33](#4WcNg9KS1rpsiGvPJYYsnNyrjeJhe8s69uX4pY5CGLQ) <GiuseppeChillemi (GiuseppeChillemi)>:
This because `AHEAD` matches but doesn't move.

[2:50:55](#rnL1b4gRxHQjcgKPJ22Dfw1SV6QBrs-uScD3AUdJHTs) <GiuseppeChillemi (GiuseppeChillemi)>:
Without it: `"Hillary" whitespace "Clinton"` would move other than succed. And you would never match the next one `change "hillary"...` So the whole rule would fail as `|` was not reached and nothing input never advanced because of this. Then skip would move to 1 character to `illary Clinton` which will never be matched by anything.

[2:55:22](#2rXPEi_kF4_GFWOtKtLTu8HiEDsFQNRQbbBKKtNXZiI) <GiuseppeChillemi (GiuseppeChillemi)>:
The same result can be reached using this:

```
parse text [any [s: "Hillary" whitespace "Clinton" :s change "Hillary" "Secretary"  | skip ]]
print text
```
`:s` return to the position marked by `s:`

[3:00:59](#fke7SfskfuE6t_1gGiirdxaBFgtgBV6uXgqdaj9gaQI) <GiuseppeChillemi (GiuseppeChillemi)>:
And then have fun with this:
```
parse text [
	any [
			s: (probe s) "Hillary" whitespace "Clinton" (Print "!---MATCHED ABOVE---!") 
			:s change "Hillary" "Secretary" (prin "Changed: " probe s) 
		| 
			skip 
	]
]
print text
```


[3:01:14](#i1r2RUuy-cPiqc5Zg4ofi1nd3Zq2jzXRkdsmyWVWcks) <GiuseppeChillemi (GiuseppeChillemi)>:
It is the same rule but with printout

[3:04:56](#kAkkdUxeKjz8bbALkU1o8M4QL6K_v9dsD1ZVguRiOE8) <GiuseppeChillemi (GiuseppeChillemi)>:
* Without it: `"Hillary" whitespace "Clinton"` would move the input to its end other than succed. And you would never match the next one `change "hillary"...` So the whole rule would fail as `|` was not reached and nothing input never advanced because of this. Then skip would move to 1 character to `illary Clinton` which will never be matched by anything.

[3:05:22](#NEY6Kq8i80AgZWng20BxzI5PwBZZYN2uj52OLwWGQ38) <GiuseppeChillemi (GiuseppeChillemi)>:
* Without `AHEAD` : `"Hillary" whitespace "Clinton"` would move the input to its end other than succed. And you would never match the next one `change "hillary"...` So the whole rule would fail as `|` was not reached and nothing input never advanced because of this. Then skip would move to 1 character to `illary Clinton` which will never be matched by anything.

[3:05:50](#cJ6mUZcoLchduGv2DCS_H8ssbeRRc4xbkop5QwMcAaE) <GiuseppeChillemi (GiuseppeChillemi)>:
* Without `AHEAD` : `"Hillary" whitespace "Clinton"` would move the input to its end other than succed. And you would never match the next one `change "hillary"...` So the whole rule would fail as `|` was not reached and input never advanced because of this. Then skip would move to 1 character to `illary Clinton` which will never be matched by anything.

[3:19:34](#r48TmOGyUuz-cIE_2hp_4P3ZupdwzgmgDAGximn6cT8) <GiuseppeChillemi (GiuseppeChillemi)>:
* And then have fun with this:

parse text [
	any [
			s: (probe s) "Hillary" whitespace "Clinton" e: (Print "" Print ">> !---MATCHED ABOVE---!")
			(Prin ">> Input position is ->>>>: " probe e)
			(Print ">> setting the input BACK to the start of the match")
			:s 
			(Prin ">> Input position is ->>>>: " probe s)
			(Print ">> If ahead we find Hillary, change it to Secretry: ")			
			change "Hillary" "Secretary" 
			(prin ">> Found and Changed, look here: " probe s)
			(Print ">> input now to the end of it Secretary, which was the end of Hillary") 
			(Print ">> The next line is the NEW current input position" Print "")
		| 
			skip 
	]
]
print text

[3:20:04](#kXoLWbjrTaJXZME1FTAEuZbMiADDkI8tVGCgPhRKx0Q) <GiuseppeChillemi (GiuseppeChillemi)>:
* And then have fun with this:
```
parse text [
	any [
			s: (probe s) "Hillary" whitespace "Clinton" e: (Print "" Print ">> !---MATCHED ABOVE---!")
			(Prin ">> Input position is ->>>>: " probe e)
			(Print ">> setting the input BACK to the start of the match")
			:s 
			(Prin ">> Input position is ->>>>: " probe s)
			(Print ">> If ahead we find Hillary, change it to Secretry: ")			
			change "Hillary" "Secretary" 
			(prin ">> Found and Changed, look here: " probe s)
			(Print ">> input now to the end of it Secretary, which was the end of Hillary") 
			(Print ">> The next line is the NEW current input position" Print "")
		| 
			skip 
	]
]
```
print text

[3:20:25](#3UymAWKGAkGCW7mg_fOs06y6IzJSvFkkWdxCBuVY4WE) <GiuseppeChillemi (GiuseppeChillemi)>:
* And then have fun with this:

```
parse text [
	any [
			s: (probe s) "Hillary" whitespace "Clinton" e: (Print "" Print ">> !---MATCHED ABOVE---!")
			(Prin ">> Input position is ->>>>: " probe e)
			(Print ">> setting the input BACK to the start of the match")
			:s 
			(Prin ">> Input position is ->>>>: " probe s)
			(Print ">> If ahead we find Hillary, change it to Secretry: ")			
			change "Hillary" "Secretary" 
			(prin ">> Found and Changed, look here: " probe s)
			(Print ">> input now to the end of it Secretary, which was the end of Hillary") 
			(Print ">> The next line is the NEW current input position" Print "")
		| 
			skip 
	]
]
print text
```



[3:21:25](#6erkmLZX2n5T0-LkEzJyKn2KrlcvTzrOTCEZ_uRamLs) <GiuseppeChillemi (GiuseppeChillemi)>:
It will print each movement of the curso made by `SKIP` and the other RULES

[3:22:04](#zKjLfF69PYmEv9NP20Spz3KFsx9U6GHfBKq0Ng2Lb9Q) <GiuseppeChillemi (GiuseppeChillemi)>:
* It will print each movement of the cursor made by `SKIP` and the other RULES. 

[3:25:59](#9NB4UxN9nQbKtO_4cnZBXW-OG3jwlNR9_7tFKp1J45g) <GiuseppeChillemi (GiuseppeChillemi)>:
* And then have fun with this:

```
whitespace: charset reduce [tab space cr lf] ; whitespace: ["^-"|" "|"^M"|"^/"] 

text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]

parse text [
	any [
			s: (probe s) "Hillary" whitespace "Clinton" e: (Print "" Print ">> !---MATCHED ABOVE---!")
			(Prin ">> Input position is ->>>>: " probe e)
			(Print ">> setting the input BACK to the start of the match")
			:s 
			(Prin ">> Input position is ->>>>: " probe s)
			(Print ">> If ahead we find Hillary, change it to Secretry: ")			
			change "Hillary" "Secretary" 
			(prin ">> Found and Changed, look here: " probe s)
			(Print ">> input now to the end of it Secretary, which was the end of Hillary") 
			(Print ">> The next line is the NEW current input position" Print "")
		| 
			skip 
	]
	end 
	(Print "End of the string to parse reached!" Print "")
]
print text
```

[3:26:49](#ZgdzdDeR_WsgA5Q6DfPA56bHqdUHe_ye33-yfvT99GY) <GiuseppeChillemi (GiuseppeChillemi)>:
(I have changed it now to the full code so you can test it without assembling pieces)



[3:27:16](#bOtGDAXrXqz2VYVm5oXnuQ8w7Za8eEGV4Jmsgf-MIbI) <GiuseppeChillemi (GiuseppeChillemi)>:
I am here for any question you need to answer

[3:28:02](#FUq1Cv-j2SjCzgdhpADSjym2uRRDci_Zn2HKFaI02rU) <GiuseppeChillemi (GiuseppeChillemi)>:
* To change just it, you need to come back to the starting position once you have found `"Hillary" whitespace "Clinton"`

[3:28:21](#dOP90qa7P9yNt_fgDUy-ycDoat_oANSNToIheanc6O8) <GiuseppeChillemi (GiuseppeChillemi)>:
* You have 2 ways: setting a position with `s:` and returning back to it with `:s` after having matched the full name and surname.

[3:28:39](#nAWT2yjQBj7vDGzO5ja42fB-Hw-XzKoENOxDSo2b08g) <GiuseppeChillemi (GiuseppeChillemi)>:
* In both cases, you must say Red: `change "Hillary" "Secretary"`

[3:29:47](#jLXQCV4CVPOi4UK_yaidyaFb-JGaV9-OpWKUtA37tC4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Which means: "match the rule `"Hillary"`, which is from the starting position of the match: `H`, to the end, `y`,  into `"Secretary"` (Remember, starting and end position, so you fix this rule)

[3:29:56](#IrDhylZ2Gj1Pr_oMTbWhrPCYwR1FO3pwhSum55z-MCo) <GiuseppeChillemi (GiuseppeChillemi)>:
* Which means: "match the rule `"Hillary"`, which is from the starting position of the match: `H`, to the end, `y`,  into `"Secretary"` (Remember, starting and end position, so you  need to fix this rule)

[3:30:28](#JiXUCh8PFDndiTNic7Kev9IEzCkTZTwjZEIdE8WewXc) <GiuseppeChillemi (GiuseppeChillemi)>:
* Remembers, rules are linear and prosecute on succes, otherwhise they fail and PARSE try the alternate, if AHEAD fails, you go to SKIP without passing from `change`.

[3:30:55](#4SPSaLqLxCKbRy_axEFMr42X-S3KVAjftnaKVKwUhmw) <GiuseppeChillemi (GiuseppeChillemi)>:
* If `AHEAD` succeds, `CHANGE` tries to match `Hillary`, if it succeds, the input jumps after this word and change  it to `Secretary`

[3:31:32](#OYjbzRuY6iEEcMPexiWh19ouL7peEF1FHrR9-thWa3E) <GiuseppeChillemi (GiuseppeChillemi)>:
* As the input has endend with success,  has you have reached `|`, then the whole rule has been completed with succes and `SKIP` is not executed. You don't move by 1 character but from the number of character matched by the rule you used in `change`

[3:32:13](#n45IoW097At4UCwgtaZOiRys1Rp2TFNS2HazHhFWsc0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Without `AHEAD` : `"Hillary" whitespace "Clinton"` would move the input to its end other than succed. And you would never match the next one `change "hillary"...` So the whole rule would fail as `|` was not reached and input never advanced because of this. Then `skip` would move to 1 character to `illary Clinton` which will never be matched by anything.

[3:33:18](#_bEe6MqIsA21a4UAiSz8PVjn3v38wz30XdRifMMq7vA) <GiuseppeChillemi (GiuseppeChillemi)>:
* And then have fun with this:

```
whitespace: charset reduce [tab space cr lf] ; whitespace: ["^-"|" "|"^M"|"^/"] 

text: rejoin [
    "Once Hillary Clinton was talking about Sir^/"
    "Edmund Hillary to Hillary Makasa and then Hillary^/"
    "Clinton had to run off on important business."
]

parse text [
	any [
			s: (probe s) "Hillary" whitespace "Clinton" e: 
			(Print "" Print ">> !---MATCHED ABOVE---!")
			(Prin ">> Input position is ->>>>: " probe e)
			(Print ">> setting the input BACK to the start of the match")
			:s 
			(Prin ">> Input position is ->>>>: " probe s)
			(Print ">> If ahead we find Hillary, change it to Secretry: ")			
			change "Hillary" "Secretary" 
			(prin ">> Found and Changed, look here: " probe s)
			(Print ">> input now to the end of it Secretary, which was the end of Hillary") 
			(Print ">> The next line is the NEW current input position" Print "")
		| 
			skip 
	]
	end 
	(Print "End of the string to parse reached!" Print "")
]
print text
```

[9:16:36](#p0v_EOOXBLxxGzLaroJjyCjnF_EpNpkD4K3fwUeRp_s) <Oldes (@oldes.h:matrix.org)>:
Whenever it is possible, try to avoid using `skip`
In Red:
```red
text: append/dup copy "" "aaaaaaaaaaaaaaaaaaaxaaaaaaaaaaaaaaaaaaax" 1000
>> dt [parse text [any [to #"x" skip] to end]]
== 0:00:00.0010558
>> dt [parse text [any [#"x" | skip]]]
== 0:00:00.0105077 ;<--- 10x slower!!!
```
Using above parses' replace test in R3:


[9:16:58](#mTogUMsYTj5fSoNGVtcBTAPnbDB90sphYxxbj04io3o) <Oldes (@oldes.h:matrix.org)>:
* Whenever it is possible, try to avoid using `skip`
In Red:

```red
text: append/dup copy "" "aaaaaaaaaaaaaaaaaaaxaaaaaaaaaaaaaaaaaaax" 1000
>> dt [parse text [any [to #"x" skip] to end]]
== 0:00:00.0010558
>> dt [parse text [any [#"x" | skip]]]
== 0:00:00.0105077 ;<--- 10x slower!!!
```

Using above parses' replace test in R3:
```rebol
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (6Œºs)         | 44     | 1      | 0      | 160         | [parse out: copy text [any [ahead ["Hillary" whitespace "Clinton"] change "Hillary" "Secretary" | to #"H"]]]
1.08x (7Œºs)        | 32     | 1      | 0      | 160         | [parse out: copy text [any [to "Hillary" ahead ["Hillary" whitespace "Clinton"] change "Hillary" "Secretary" | to end]]]
3.18x (20Œºs)       | 527    | 1      | 0      | 160         | [parse out: copy text [any [s: "Hillary" whitespace "Clinton" :s change "Hillary" "Secretary" | skip]]]
```

[9:17:42](#BA0FutaYHXfF-2YVR5463szmoqOGtVdECfkAg6yXjtY) <Oldes (@oldes.h:matrix.org)>:
* Whenever it is possible, try to avoid using `skip`
In Red:

```red
text: append/dup copy "" "aaaaaaaaaaaaaaaaaaaxaaaaaaaaaaaaaaaaaaax" 1000
>> dt [parse text [any [to #"x" skip] to end]]
== 0:00:00.0010558
>> dt [parse text [any [#"x" | skip]]]
== 0:00:00.0105077 ;<--- 10x slower!!!
```
Same in R3:
```rebol
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (197Œºs)       | 6008   | 0      | 0      | 0           | [parse text [any [to #"x" skip] to end]]
9.37x (2ms)        | 118008 | 0      | 0      | 0           | [parse text [any [#"x" | skip]]]
```
Using above parses' replace test in R3:

```rebol
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (6Œºs)         | 44     | 1      | 0      | 160         | [parse out: copy text [any [ahead ["Hillary" whitespace "Clinton"] change "Hillary" "Secretary" | to #"H"]]]
1.08x (7Œºs)        | 32     | 1      | 0      | 160         | [parse out: copy text [any [to "Hillary" ahead ["Hillary" whitespace "Clinton"] change "Hillary" "Secretary" | to end]]]
3.18x (20Œºs)       | 527    | 1      | 0      | 160         | [parse out: copy text [any [s: "Hillary" whitespace "Clinton" :s change "Hillary" "Secretary" | skip]]]
```

[9:18:25](#lMzugCMNaC7Nix_DiVcoJHHMEFYE_CE9gIgl7Ebg9DM) <Rebol2Red (Rebol2Red)>:
GiuseppeChillemi (GiuseppeChillemi): This is great! Thank you very much for taking the time to explain it all. 

Isn't there a gui program which shows exactly what parse is doing? 
I  think I have it somewhere but do'nt know the name of it.

[9:19:17](#OT-EROhM5bft4oPxUIMqitc4l857j9xyZ1xzbDdbSDk) <Oldes (@oldes.h:matrix.org)>:
* Whenever it is possible, try to avoid using `skip`
In Red:

```red
text: append/dup copy "" "aaaaaaaaaaaaaaaaaaaxaaaaaaaaaaaaaaaaaaax" 1000
>> dt [parse text [any [to #"x" skip] to end]]
== 0:00:00.0010558
>> dt [parse text [any [#"x" | skip]]]
== 0:00:00.0105077 ;<--- 10x slower!!!
```

Same in R3:

```rebol
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (197Œºs)       | 6008   | 0      | 0      | 0           | [parse text [any [to #"x" skip] to end]]
9.37x (2ms)        | 118008 | 0      | 0      | 0           | [parse text [any [#"x" | skip]]]
```

Using above parses' replace test in R3:

```rebol
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (6Œºs)         | 44     | 1      | 0      | 160         | [parse out: copy text [any [ahead ["Hillary" whitespace "Clinton"] change "Hillary" "Secretary" | to #"H"]]]
1.08x (7Œºs)        | 32     | 1      | 0      | 160         | [parse out: copy text [any [to "Hillary" ahead ["Hillary" whitespace "Clinton"] change "Hillary" "Secretary" | to end]]]
3.18x (20Œºs)       | 527    | 1      | 0      | 160         | [parse out: copy text [any [s: "Hillary" whitespace "Clinton" :s change "Hillary" "Secretary" | skip]]]
```
The longer is the input, the slower is the `skip`!

[9:22:02](#Pb5fkeR52NizP-Y2O1rLWAeHgmH-J0E8c0oUBcG5K_I) <Rebol2Red (Rebol2Red)>:
* GiuseppeChillemi (GiuseppeChillemi): This is great! Thank you very much for taking the time to explain it all.

Isn't there a gui program using Red which shows exactly what parse is doing?
I  think I have it somewhere but do'nt know the name of it.

[9:52:18](#fZRVq4kUgUSTnORAVV6hCuEp0x32NK_8dn2GFN_aopE) <Rebol2Red (Rebol2Red)>:
Oldes: Alright, it's true skip is slow but only the code from Giuseppe gives the correct output which happens to be the slowest one. Slow but correct.

[9:55:14](#XJr5ZlCRxIi4k_x53A2ffXX0bxauwmGdAvImPC579wg) <Rebol2Red (Rebol2Red)>:
* Oldes: Alright, it's true skip is slow but only the code from Giuseppe gives the correct output which happens to be the slowest one. Slow but correct. But I think you are proving your point "Whenever it is possible, try to avoid using skip"

[10:04:18](#DhUzCCSwzVbexT0-CbS5cmb7wk1X5tHQ4P5o2Vfxi6o) <Oldes (@oldes.h:matrix.org)>:
Try this one:
```
parse text [any [to #"H" [ahead ["Hillary" whitespace "Clinton"] change "Hillary" "Secretary" | skip]]]
```
(it uses `skip` only in case that `H` is found, but it is not `Hillary Clinton`)

[10:16:46](#MPoVy5r4rHhKpno0xI6GEccly9Xw-s4ZrB4s73pjVV8) <Rebol2Red (Rebol2Red)>:
Ì†ΩÌ≤Ø

[10:17:59](#5CVf4bP9rDfvTbK7hZQoZsjz3UhbQB0_YqeWAWBt1dE) <hiiamboris>:
There's [ParSEE](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-red), there's [Parse Caddy](https://github.com/gltewalt/parse-caddy) and there's out of the box `parse-trace`

[11:54:59](#dUAzvLWjGapUSx6NNdZZUIoed_gKjcb-JyPK4HLKSQc) <GiuseppeChillemi (GiuseppeChillemi)>:
I see Red Parse being 5 times slower than Rebol3. 10 milliseconds vs 2 milliseconds. Am I reading it correctly? 

## 4-Mar-2025

[16:11:25](#IJ612FUsnx-meC7FBgqMuDeYNtV6wpY_7hl2wDcU5eM) <Rebol2Red (Rebol2Red)>:
hiiamboris: Why is the timeline already at the end when using this code in ParSEE
```
#include %"ParSEE.red"

whitespace: charset reduce [tab space cr lf] ; whitespace: ["^-"|" "|"^M"|"^/"]

text: {Once Hillary Clinton was talking about Sir^/Edmund Hillary to Hillary Makasa and then Hillary^/Clinton had to run off on important business.}

parsee text [
	any [
		to #"H" [
			ahead [
				"Hillary" whitespace "Clinton"
			] 
			change "Hillary" "Secretary" 
			| 
			skip
		]
	]
]
```


[16:13:07](#CKnyKQkEiqFbNszNBGzEOZof97gDwz4HKj3RCsHABkQ) <hiiamboris>:
it's at the end because it's convenient to see the result up front

[16:13:46](#Wssp2AqJWFmvrIt7lIE-aATuElNNbHhravoEQjDHuuk) <hiiamboris>:
scroll it :)

[16:17:45](#-zG_lPK_dStmTs8fu8tlKE82QphpoBxppEFJYXuY7B0) <hiiamboris>:
but parsee is glitchy on that example, likely due to series modification

[16:19:01](#tnrpwc05N55IqhBHh8GCoGmDmTXDxLKv6oP7qekEPXs) <hiiamboris>:
I'll have a look tomorrow if it can be supported

[16:54:41](#fwedwSNp87u_a3Pg8TLte4pOl0mtFdGD1VBD6S7CIw0) <Rebol2Red (Rebol2Red)>:
hiiamboris: If I scroll it to the start the text will be the same which is the changed text.

[16:56:07](#F79LoM1pzH_zEqXeeTa92LUPhRj-zRRuxTuRFjjOjo8) <Rebol2Red (Rebol2Red)>:
* hiiamboris: If I scroll it to the start, the text will be the same which is the changed text.

[16:56:58](#HHpSUFZdglTi_chz_derEdNERbXYYbU4cZUn7Cm3UAU) <Rebol2Red (Rebol2Red)>:
* hiiamboris: If I scroll the timeline to the start, the text will be the same which is the changed text.

[19:01:54](#yf_W-SL1UqQK8U3fgiFU8I4xE6IeC7JJTgsQWMmNeio) <Rebol2Red (Rebol2Red)>:
* hiiamboris: If I scroll the timeline to the start, the text will be the same which is the changed text.

[19:01:57](#y88_wRqfGagKuQTuREKuMDtT5uqmDilz-k9-gMgpnCo) <Rebol2Red (Rebol2Red)>:
* hiiamboris: If I scroll the timeline to the start, the text will be the same which is the changed text.

[19:03:55](#I4uMQiVfH8eAVEkRbPD-2Kn8q-ouMisV_758WQazSjg) <Rebol2Red (Rebol2Red)>:
* hiiamboris: If I scroll the timeline to the start, the text will be the same which is the changed text.

[19:04:21](#G3j6kEro9_d_nQYvuoov9XNBqDAxc3pHx_W3vmJBwE4) <Rebol2Red (Rebol2Red)>:
* Look at this screenshots. When started (first screenshot) and when scrolled (second screenshot)

[19:05:57](#OeehZPPrwqY1ORHqoTfNyemQGUOx7GDzROxTUJRHyvA) <Rebol2Red (Rebol2Red)>:
* Look at this screenshots. When started (first screenshot) and when scrolled (second screenshot)

[19:06:56](#fxUHqhzCSsReDpOG1wsAZLS4Smn0-vd6EDkcT7NRClE) <Rebol2Red (Rebol2Red)>:
![https://gitter.ems.host/_matrix/media/v3/download/gitter.im/87877027e329ad1b4744706e4da8aa46f42347f51896999558752239616](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/bf322e4bc2533de30ab87681852d58bec166a1e61896999559813398528)

[19:06:59](#Cf9eyyWnKPss43AaZwQxXPsRQa_nUYwyAdkg2PIUnfI) <Rebol2Red (Rebol2Red)>:
![https://gitter.ems.host/_matrix/media/v3/download/gitter.im/9f0502309eddc441227faca3bea6fe65c60320a51896999571012190208](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/2e04f1ebf1eafe2b7a83aa0108892414654a5ff41897000577473183744)

[19:07:05](#hs6gOP-ZNVvA4wFDretYw-U7sabS2UBaKGRov4Yi_68) <Rebol2Red (Rebol2Red)>:
Look at this screenshots. When started (first screenshot) and when scrolled (second screenshot)

[19:09:05](#a4Fz9uDIHccb0n0PVrirMIRch-07ML6LRyYHO2bchVY) <Rebol2Red (Rebol2Red)>:
* Look at this screenshots. When started (first screenshot) and when scrolled (second screenshot). Parsed Input text is the same.

[19:09:33](#OYiCh3qr3D1kkolw8Eq9KsFJv9k3uQVteIwJUu9VEfM) <Rebol2Red (Rebol2Red)>:
* Look at these screenshots. When started (first screenshot) and when scrolled (second screenshot). Parsed Input text is the same.

## 5-Mar-2025

[3:29:27](#beHdiYKv07Futci_AlzG9tWiQibwJ3zovoYMBNV38D8) <hiiamboris>:
Sure, I get it. Will look into it when I have time. Thanks for the bug report

[6:13:30](#IeSLQkxwmEa3WW8Ut2BqM-RssBBmrXtuJs6J1yAEdvI) <hiiamboris>:
So after refreshing my memory, it's a [bug in Red reactivity support](https://github.com/red/red/issues/4788#issuecomment-2699973715) (one of many actually)

## 14-Mar-2025

[15:22:54](#0pSlUy6cUiUakFHxXjl4jKta48LQHqlQswT4JfAwr2I) <gr4xity>:
Is this a bug? I'm unexpectedly getting case-sensitive behavior in Red's `parse`.

Rebol:
```
>> parse [Hello World] ['Hello 'world]
== true
```

Red:
```
>> parse [Hello World] ['Hello 'world]
== false
```

[16:00:09](#UhMEt7jL5fNgv6JhUnRFaBu78E_3SQxQW2yYI0WA_pU) <hiiamboris>:
yes

[16:00:11](#Ky1NcruiByuU0YwbhVpRSt7kL818nX0JH48Vte2n6Nw) <gurzgri>:
Yes, see https://github.com/red/red/issues/4996 and https://github.com/red/red/issues/3029

[16:03:18](#mmkvfWCB2bMraoL7ZDTOmx9Kl2yNnQsE9a5kisLxsGY) <gurzgri>:
4996 is missing in https://github.com/red/docs/blob/master/en/parse.adoc#63-open-issues though, never came across that last section before.

## 18-Mar-2025

[21:02:48](#FOy9VqLRYx68blYlSxXtryA2DJAcov4706BnG5ICD4Q) <GiuseppeChillemi (GiuseppeChillemi)>:
How could the second parse work as the first one?
```
>> parse [a] [none to end]
== true
>> parse [a] [(a: none) a to end]
== false
```

[21:03:01](#go3CU9Zn1Tp_9yZLoui-YLvdgf80oomfD2JaXeJZDYM) <GiuseppeChillemi (GiuseppeChillemi)>:
* How could the second parse work as the first one?

```
>> parse [a] [none to end]
== true
>> parse [a] [(b: none) b to end]
== false
```

[21:11:16](#4_A0htC7XPt3h8cf3OgNKFFLG5v1pjkbmy7P2Kgx2Ks) <GiuseppeChillemi (GiuseppeChillemi)>:
`none` seems to not have effect there. Even `b: none`

[21:11:22](#ZWStzK80SwFgZDHKFr9b8iUjmkqq2YHcT3LBCs3p-5M) <GiuseppeChillemi (GiuseppeChillemi)>:
* `none` seems to not have effect there. Even `b: 'none`

[21:43:46](#biej85GsmnkGy1VyWrvsZOaGHwcM9N9cJQzihMEhO7U) <greggirwin (Gregg Irwin)>:
```
>> parse [a] [(b: [none]) b to end]
== true
```

[21:44:32](#A-K1j8bBm4EZBxJXHPaQwuXhGWMsMPV_kbIj1wmxyE4) <greggirwin (Gregg Irwin)>:
I don't know if this is by design though. Brain on overload right now.

[22:21:33](#Aouoz5h4OQ3pM6riqmpgYuyWY1Uitr6Mz09jrGLmm9k) <Oldes (@oldes.h:matrix.org)>:
Seems to be a bug... in R3 I can do this:
```
>> parse "abc" [collect [(rule: 'to) keep rule #"b"]]
== [#"a"]

>> parse "abc" [collect [(rule: 'thru) keep rule #"b"]]
== ["ab"]
```

[22:30:53](#R7kj4B8OEH0Tjjytmh7GAr-Ykb-UJxYJB9yV2id8pRU) <greggirwin (Gregg Irwin)>:
Thanks for checking that.

[22:46:20](#KrCge1ZI5wGV6ruaCXeBIaJYxRDlZbiAn6pcPzMzPNc) <GiuseppeChillemi (GiuseppeChillemi)>:
I wait for the answer of the others and then report it.

[23:06:30](#B8zJvBIfzdfbLQygL7OZy3DAlVfTFw8atGy1qx3uzHI) <Oldes (@oldes.h:matrix.org)>:
I think that in R3 is also a bug:
```
>> parse [#(true)] [#(true)] 
== #(true)

>> parse [#(none)] [#(none)] 
== #(false) ;<-- should be true I guess
```

## 19-Mar-2025

[2:17:59](#UG1DXaxiJKCldM29RfJDkmMdPG2-4Drh7cyx2RcdjAY) <GiuseppeChillemi (GiuseppeChillemi)>:
I think too. In the construction syntax you don't need to reduce the element to be `none`. So it is a match.

[4:28:30](#W3WACtxoHTFOmwp-nMa6KIa-1Ma9_EjSE_QZeu15XA0) <hiiamboris>:
> <@oldes.h:matrix.org> Seems to be a bug... in R3 I can do this:
> ```
> >> parse "abc" [collect [(rule: 'to) keep rule #"b"]]
> == [#"a"]
> 
> >> parse "abc" [collect [(rule: 'thru) keep rule #"b"]]
> == ["ab"]
> ```

I think Red parse generally does not accept getting keywords from words. Most likely by design.

[10:04:51](#jMCtvG2t63IJh3gdEGSb1V6-Dd6uZjdnwxMHbr_XPi4) <GiuseppeChillemi (GiuseppeChillemi)>:
I hope it is not the case, as it would stop any dynamic rule creation technique.

[10:05:29](#VAYMWe8cFQDFevnxfihhoDsuqddV0Rfl6xYtbDFuEnw) <GiuseppeChillemi (GiuseppeChillemi)>:
I was experimenting with it.

[11:43:56](#uAw621keocozfTw_r_viQKxSthWBQTmTfhTGjVZvocw) <gurzgri>:
Dynamic rule creation has never been impossible nor is it impossible now. It‚Äòs just not possible to have "dynamic incomplete rules" and wordy rules instead of blocky rules. Nothing stops you herr if you accept running *around* walls instead of *into* walls ;)

[11:44:20](#AqKdgF9HvaaJxNUEoZ3qAmXL9CvqjPGe2EUZGXKabTI) <gurzgri>:
* Dynamic rule creation has never been impossible nor is it impossible now. It‚Äòs just not possible to have "dynamic incomplete rules" and wordy rules instead of blocky rules. Nothing stops you here if you accept running around walls instead of into walls ;)

[14:28:02](#ybe0Ofaxnq3x2bQZchvsYxEY5pTBnSbKmJF6Z91SyTo) <GiuseppeChillemi (GiuseppeChillemi)>:
We have discussed about "dynamic incomplete rules" but neve about wordy rules. I don't know the cause of the limitation but if possible, like for some wordy rules in Rebol3 demonstrate, it would be good to have all wordy rules accepted and overcome this limitation.

[14:28:09](#46LWCTs4FRAfOdUMh0c01XV9kySSB0ZB-f80avvvj8s) <GiuseppeChillemi (GiuseppeChillemi)>:
* We have discussed about "dynamic incomplete rules" but never about wordy rules. I don't know the cause of the limitation but if possible, like for some wordy rules in Rebol3 demonstrate, it would be good to have all wordy rules accepted and overcome this limitation.

[14:29:34](#jphPU9pwwyAJv3_Oa9nTHb5avJ6fBaaE-ce4DFlvREU) <GiuseppeChillemi (GiuseppeChillemi)>:
This is how languages make steps forward: discussing about the limitations that forces us "patchy" solutions and implement them when useful.

[14:31:25](#Wxr69xPJoLZRbKhGuxhfcOPe-1mnKpfT-1zQN6gERfs) <GiuseppeChillemi (GiuseppeChillemi)>:
This is how languages make steps forward: discussing about the limitations that forces us "patchy" solutions and implement them when useful.

[14:33:33](#98CO3vYG9AqGoVmUMacRNy_Rx19iOeFvEw2Oq2A-ZSo) <GiuseppeChillemi (GiuseppeChillemi)>:
Walking around walls keeps them where they are and force everyone to walk around the obstacle at some point in its life. Instead it could be a could moment to fix the problem, remove the wall and develop this new chapter of techinque in Red and Rebol3.

[14:33:44](#T1oj0fuAR8uHhR0g9WwIloTp6L7ym5wsJH33QsFdQpw) <GiuseppeChillemi (GiuseppeChillemi)>:
* Walking around walls keeps them where they are and forces everyone to walk around the obstacle at some point in its life. Instead it could be a could moment to fix the problem, remove the wall and develop this new chapter of techinque in Red and Rebol3.

[14:33:57](#P5esQOclum2k_nIsuvRKZf35N2W-h8Ewu86pMK0kaZI) <GiuseppeChillemi (GiuseppeChillemi)>:
* Walking around walls keeps them where they are and forces everyone to walk around the obstacle at some point in its life. Instead it could be a good moment to fix the problem, remove the wall and develop this new chapter of techinque in Red and Rebol3.

[14:34:12](#uCBS55qlufPOg-WHHb0PLMY-URgdl5hRdtTx91mdgvo) <GiuseppeChillemi (GiuseppeChillemi)>:
* Walking around walls keeps them where they are and forces everyone to walk around the obstacle at some point in its life. Instead it could be a good moment to fix the problem, remove the wall and develop this new chapter of techinques in Red and Rebol3.

[14:54:13](#RXbvDz6myILFFHhUExFOrU7PIo5JGaEZjbVSPkpdMVg) <GiuseppeChillemi (GiuseppeChillemi)>:
I have tried all the combinations (I think). There is the result:

```

word: none
probe parse [none] [word] ;--- False

word: [none]
probe parse [none] [word] ;--- false  <--- This should be true?

word: [none]
probe parse compose [(none)] [word] ;--- false

word: compose [(none)]
probe parse compose [(none)] [word] ;--- true

word: [quote #(none)]
probe parse [none] [word] ;--- false

word: [quote none]
probe parse [none] [word] ;--- true

word: #(none)
probe parse  [none] [word] ;--- false

word: #(none)
probe parse compose [(none)] [word] ;--- true

word: quote none
probe parse [none] [word] ;--- False

word: 'none
probe parse compose [none] [word] ;--- Error - Invalid rule usage of none - (Should it work?)
```

[14:55:01](#tG443ZzQyBNdUnzR8qZYK2cyQPfp8ehkcd0G6NWcMWo) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have tried all the combinations (I think). There is the result:

```

word: none
probe parse [none] [word] ;--- False

word: 'none
probe parse compose [none] [word] ;--- Error - Invalid rule usage of none - (Should it work?)
word: [none]
probe parse [none] [word] ;--- false  <--- This should be true?

word: [none]
probe parse compose [(none)] [word] ;--- false

word: compose [(none)]
probe parse compose [(none)] [word] ;--- true

word: [quote #(none)]
probe parse [none] [word] ;--- false

word: [quote none]
probe parse [none] [word] ;--- true

word: #(none)
probe parse  [none] [word] ;--- false

word: #(none)
probe parse compose [(none)] [word] ;--- true

word: quote none
probe parse [none] [word] ;--- False
```

[14:55:07](#MGQEivAJmdXq5sgZqMUB696UnUHt9CAKq27uQwj_AD4) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have tried all the combinations (I think). There is the result:

```

word: none
probe parse [none] [word] ;--- False

word: 'none
probe parse compose [none] [word] ;--- Error - Invalid rule usage of none - (Should it work?)

word: [none]
probe parse [none] [word] ;--- false  <--- This should be true?

word: [none]
probe parse compose [(none)] [word] ;--- false

word: compose [(none)]
probe parse compose [(none)] [word] ;--- true

word: [quote #(none)]
probe parse [none] [word] ;--- false

word: [quote none]
probe parse [none] [word] ;--- true

word: #(none)
probe parse  [none] [word] ;--- false

word: #(none)
probe parse compose [(none)] [word] ;--- true

word: quote none
probe parse [none] [word] ;--- False
```

[14:56:05](#wKFimcfeivOB6e4zvahO_E84XyVYPj3fkekSaDQusgE) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have tried all the combinations (I think). There is the result:

```
; - 1 
word: none
probe parse [none] [word] ;--- False
; - 2
word: 'none
probe parse compose [none] [word] ;--- Error - Invalid rule usage of none - (Should it work?)
; - 3
word: [none]
probe parse [none] [word] ;--- false  <--- This should be true?
; - 4
word: [none]
probe parse compose [(none)] [word] ;--- false
; - 5
word: compose [(none)]
probe parse compose [(none)] [word] ;--- true
; - 6
word: [quote #(none)]
probe parse [none] [word] ;--- false
; - 7
word: [quote none]
probe parse [none] [word] ;--- true
; - 8
word: #(none)
probe parse  [none] [word] ;--- false
; - 9
word: #(none)
probe parse compose [(none)] [word] ;--- true
; - 10
word: quote none
probe parse [none] [word] ;--- False
```

[14:57:06](#Mo_Nsb0orx3Kri-cMFoOZc9kVHg79Xk_v-jK3dRkSPE) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have tried all the combinations (I think). There is the result:

```
; - 1 
word: none
probe parse [none] [word] ;--- False
; - 2
word: 'none
probe parse compose [none] [word] ;--- Error - Invalid rule usage of none - (Should it work?)
; - 3
word: [none]
probe parse [none] [word] ;--- false  <--- This should be true?
; - 4
word: [none]
probe parse compose [(none)] [word] ;--- false
; - 5
word: compose [(none)]
probe parse compose [(none)] [word] ;--- true
; - 6
word: [quote #(none)]
probe parse [none] [word] ;--- false
; - 7
word: [quote none]
probe parse [none] [word] ;--- true
; - 8
word: #(none)
probe parse  [none] [word] ;--- false
; - 9
word: #(none)
probe parse compose [(none)] [word] ;--- true
; - 10
word: quote none
probe parse [none] [word] ;--- invalid rule or usage of rule: none
```

[14:58:21](#2dqgCAJEDatDiMpj-3gcIF5_oITjnQOmL04A9VyYgxs) <GiuseppeChillemi (GiuseppeChillemi)>:
Number 2, 3 and 10 should work IMHO, instead you need the wrapping as in rule 7. 


[15:37:03](#e60IEFgj4c1ZI7DErYkB0DH6wfDMq0mWBDwoo14C2jg) <GiuseppeChillemi (GiuseppeChillemi)>:
Fort `NONE` as a rule:
```
; - 1
probe parse [hello] [(operation: none) operation to end]  ;---- False
; - 2
probe parse [hello] [(operation: [quote none]) operation to end]  ;--- False
; - 3
probe parse [hello] [(operation: [none]) operation to end]   ;--- True
```


[15:39:37](#6b4Tesd6_54WCHIdLiip4LqhNMO8HeaFGVmydPhH56s) <GiuseppeChillemi (GiuseppeChillemi)>:
I still don't undestand which common mechanism governs reducing a word in paren and triggering `parse` to use it as a rule, and having an error if `lit-word`. I should take a look at `parse` source.

[16:03:38](#w6rzckqVkjWcphg21j74D0OCa9xmEUBJhpmJUDZAD1w) <GiuseppeChillemi (GiuseppeChillemi)>:
* I still don't undestand which common mechanism governs reducing a word in `block` and triggering `parse` to use it as a rule, and having an error if `lit-word`. I should take a look at `parse` source.

[16:32:29](#Lfc3grRTK60ya8_sE3i9zupU4BTBtkstmmqHN5NmA9M) <GiuseppeChillemi (GiuseppeChillemi)>:
Also another observation:

Writing a function that use `parse` to check among various values is tricky.

Think about this:
```
specs: [
  a: [22 33]
  b: [44 55]
  c: [integer!]
]
```

You shoud wrote:
```
probe parse [a 22 b 33] [
   [quote a: | quote b:] [quote 22 | quote 33] 
   [quote a: | quote b:] [quote 44 | quote 55]
]
```

To check for elements, we need to quote numbers and letters as they are part of the parse language. Even datatypes are difficult to parse. Instead, the rest of Red and Rebol, uses block with direct values. So, moving from normal language to parse,  each block containing multiple choices must be `quote`d and separated with `|`. 

Instead, why not introducing OF keyword, so we can do as follow:

```
probe parse [a 22 b 33] [
   a 1 of [22 33]] 
   b 1 of [44 55]] 
   c 1 of [integer! string!]
]
```


[16:33:54](#n9eOek2aV1CVKnX-wB-kCisYLMZHpbRrCO1iNko05es) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also another observation:

Writing a function that use `parse` to check among various values is tricky.

Think about this:

```
specs: [
  a: [22 33]
  b: [44 55]
  c: [integer! string!]
]
```

You shoud wrote:

```
probe parse [a 22 b 33] [
   [quote a: | quote b:] [quote 22 | quote 33] 
   [quote a: | quote b:] [quote 44 | quote 55]
]
```

To check for elements, we need to quote numbers and letters as they are part of the parse language. Even datatypes are difficult to parse. Instead, the rest of Red and Rebol, uses block with direct values. So, moving from normal language to parse,  each block containing multiple choices must be `quote`d and separated with `|`.

Instead, why not introducing OF keyword, so we can do as follow:

```
probe parse [a 22 b 33] [
   a 1 of [22 33]] 
   b 1 of [44 55]] 
   c 1 of [integer! string!]
]
```

[16:35:21](#Hi15vqkMyjhUhVEXh_qXA0ZSZMbfonL3ok_2ad44Zhs) <GiuseppeChillemi (GiuseppeChillemi)>:
```
[22 33]
```

Now imagine those blocks being function specs to parse... or MAPS or OBJECTS, key-value parirs, or ROW specs in a database.

[16:45:29](#ifHl26q38WRLt-R_BQCg7tPfSaJrzdglLo5EbLDQMqc) <GiuseppeChillemi (GiuseppeChillemi)>:
* ```
[22 33]
```

Now imagine those blocks of values being function specs to parse... or MAPS or OBJECTS, key-value parirs, or ROW specs in a database.

[16:45:41](#oasFu2OKVxEig2Lhq7hMKfPD6f1TW_Iiq5ZVz9RgU8A) <GiuseppeChillemi (GiuseppeChillemi)>:
* ```
[22 33]
```

Now imagine those blocks of values being function specs to parse... or MAPS or OBJECTS, key-value pairs, or ROW specs in a database.

[16:48:11](#Er2tok-pNYdHtJVfizZ5AtPaPlaFyWlTlEkqpg7CnWM) <hiiamboris>:
You're mixing up `none` word with `#(none)` value.

[16:48:15](#ctyy_b6iO4jRZrjDRyr-UtezljyRlFm4_8a3UfexQH8) <hiiamboris>:
```
>> word: quote 'none parse [none] [word]
== true
```

[16:48:57](#ePvd8PAuRUlU2-61HgbSDPCsaOzWkGVseOSdGTvZel8) <hiiamboris>:
* ```
>> word: quote 'none parse [none] [word]
== true
>> word: none parse [#(none)] [word]
== true
```

[16:49:06](#d0k7gK1JxxRp3Pl1ZJoqgSjFiePFpOUOwrgLkGU7AEk) <hiiamboris>:
* ```
>> word: quote 'none parse [none] [word]
== true
>> word: none parse [#(none)] [word]
== true
```

[16:53:42](#Wzr_WEuwvXhQ7EZcGm3hJQgr3vWQEyFpBrrN7hJm82w) <hiiamboris>:
These examples above look like a stretch to me. Who hardcodes specific keys and values into the rules?

[17:44:53](#nDOeW1gonuRy5xu5nMLhZRkLE3w6JdFa4epF8_L0rXU) <GiuseppeChillemi (GiuseppeChillemi)>:
Often, in a rule, you must parse among different options coming from a function, like one of many keywords, datatypes, values. With it you can avoid any manipulation of blocks coming from Red. 

[17:50:12](#1EEpTnN8f9AZxunmZRmsaZ-Kxhq7mHXMu_lwZlOYHeE) <GiuseppeChillemi (GiuseppeChillemi)>:
* Often, in a rule, you must parse among different options coming from a function, like one of many keywords, datatypes, values. With it you can avoid any manipulation of blocks coming from Red before feeding them to PARSE.

[17:55:07](#SdineEEENdgo8oweqgtTgnNr8Bb6bQj11cpDapB56hs) <Oldes (@oldes.h:matrix.org)>:
Parse was not meant to be used this way!

[17:57:58](#LScRT8fK-CuEntLzzMYrJJvHRploMrlV7_1fg_4QC4c) <GiuseppeChillemi (GiuseppeChillemi)>:
It already parse among many values but if you need pass the from Red domain parse domain via interface you need extra work. Instead it is direct and very easy

[17:59:29](#oinxdO7YnL6_HMFWi--nXRY1Km-KPwbyO22oAVD2-Mw) <GiuseppeChillemi (GiuseppeChillemi)>:
* It already parse among many values but for some it is complicate as part of the language. Nut if you need pass the from Red domain to parse domain via interface you need extra work. Instead with this command is very easy

[18:01:01](#rKEH6v79WSYsDCiVDkIY3P1nTQx4cryRNpVnaJdvTag) <GiuseppeChillemi (GiuseppeChillemi)>:
* Instead it is the opposite: already it parses among many values but for some it is complicate as they are part of the language. If you need to pass the from Red domain to parse domain via function interface you need extra work. Instead with this command is very easy and direct.

[18:02:18](#LfHysjouncqtoVv_R-L6TiPlxP51VYKo5cIqO0gEOZs) <GiuseppeChillemi (GiuseppeChillemi)>:
* Instead it is the opposite: already it has rules to parse one among many values but for some of them it is complicate as they are part of the language. If you need to pass them the from Red domain to parse domain via function interface you need extra work. Instead with this command it is very easy and direct.

[18:06:43](#tCGOuuV86d9oj4p4SegiZC89j9pk4CuO8jidsZ9i8yI) <hiiamboris>:
https://github.com/red/REP/issues/142

[18:29:54](#WhPjxhaLSVdkagWJtDGHXXydAYa96jQCWcTOqULQ9fs) <Oldes (@oldes.h:matrix.org)>:
I strongly disagree with you. Sorry GiuseppeChillemi (GiuseppeChillemi) . You are asking for something you cannot get.
For example you never can have your `parse [a 22] [a 1 of [22]]` ... imagine that instead of `a` you would have some of the parse's key words.

[18:30:52](#9G9ICNIg5nCPSRuNiu4kAGVapbqd5o-ioq8GymBZA8Y) <Oldes (@oldes.h:matrix.org)>:
Instead of using parse for data validation. Write your own `validate` dialect.

[18:33:00](#_V_wDVHvsrntPo0wu4VvgcsSLfqNuvCcx4BqAv0B_xg) <GiuseppeChillemi (GiuseppeChillemi)>:
My example is wrong, I will rewrite it later

[22:08:38](#L3flEeYERzu_wXIdVdbbooz-R5ljSJDmFw0euAp9DaA) <GiuseppeChillemi (GiuseppeChillemi)>:
Here it is:
```
probe parse [a 22 b 33] [
   of [a] 1 of [22 33]] 
   of [b] 1 of [44 55]] 
   of [c] 1 of [integer! string!]
]
```


[22:09:26](#56FBFcYD3aD8gjTvAeO3CD1SiqkIQGY39DU3G4QUDs4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Here it is:

```
probe parse [a 22 b 33] [
   of [a] of [22 33]] 
   of [b] of [44 55]] 
   of [c] of [integer! string!]
]
```

[22:13:19](#gI1w77BfXqBAEeZarSOLZdr9A2a8-_PIR55aGeopmlw) <GiuseppeChillemi (GiuseppeChillemi)>:
Which is basically the same with created by hiiamboris without the `only` version. I have choosen it only for wording, so you can write: 
`1 of [a]`
or
`2 of [a]`
But `[lit a]` is another good name and I like it too. 
It solves exacly what you can find in Boris which. He has been better than me to explain the complexity of certain parsing rules which uses datatypes which are part of the PARSE DSL.

[22:14:52](#pi2G0l-FCArqSNRDsowCoqbzindiIW_8Puxd6_Cm370) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also another observation:

Writing a function that use `parse` to check among various values is tricky.

Think about this:

```
specs: [
  a: [22 33]
  b: [44 55]
  c: [integer! string!]
]
```

You shoud wrote:

```
probe parse [a 22 b 33] [
   [quote a: | quote b:] [quote 22 | quote 33] 
   [quote a: | quote b:] [quote 44 | quote 55]
]
```

To check for elements, we need to quote numbers and letters as they are part of the parse language. Even datatypes are difficult to parse. Instead, the rest of Red and Rebol, uses block with direct values. So, moving from normal language to parse,  each block containing multiple choices must be `quote`d and separated with `|`.

Instead, why not introducing OF keyword, so we can do as follow:

```
EDIT: wrong example, a better one is after!
probe parse [a 22 b 33] [
   a 1 of [22 33]] 
   b 1 of [44 55]] 
   c 1 of [integer! string!]
]
```

[22:29:22](#pcrAXXB-LIw4KZ6zJOzsidIjLsjXnj_Gn76Zy1e_9sM) <GiuseppeChillemi (GiuseppeChillemi)>:
* Which is basically the same wish created by hiiamboris without the `only` version. I have choosen it only for wording, so you can write:
`1 of [a]`
or
`2 of [a]`
But `[lit a]` is another good name and I like it too.
It solves exacly what you can find in Boris which. He has been better than me to explain the complexity of certain parsing rules which uses datatypes which are part of the PARSE DSL.

[22:29:42](#b00lmImdFUSWkO1CRRZtSn8iQacw99n_78T_rNNgzA8) <GiuseppeChillemi (GiuseppeChillemi)>:
* Which is basically the same wish created by hiiamboris without the `only` version. I have choosen it only for wording, so you can write:
`1 of [a]`
or
`2 of [a]`
But `[lit a]` is another good name and I like it too.
It solves exacly what you can find in Boris whish. He has been better than me to explain the complexity of certain parsing rules which uses datatypes which are part of the PARSE DSL.

[22:30:17](#UFU2RZt6aYqtJCeijk3iiQ_cMdlwvFtjF-JaVW3XTkE) <GiuseppeChillemi (GiuseppeChillemi)>:
(Pardom some some errors, I have corrected them)

[22:30:52](#cD8T0MEjC7bg8vw2Oy6YuReWShj0lKOqC-HZNYrpQpk) <GiuseppeChillemi (GiuseppeChillemi)>:
* Which is basically the same wish created by hiiamboris without the `only` version. I have choosen it only for wording, so you can write:
`1 of [a]`
or
`2 of [a]`
But `[lit a]` is another good name and I like it too.
`Lit [a] Lit [22 33]] solves exacly what you can find in Boris whish. He has been better than me to explain the complexity of certain parsing rules which uses datatypes which are part of the PARSE DSL.

[22:31:11](#nRPOAOBSpfPw0VQwXesoxEtj-YI2Qbs55J5fYkqEPmQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* Which is basically the same wish created by hiiamboris without the `only` version. I have choosen it only for wording, so you can write:
`1 of [a]`
or
`2 of [a]`
But `[lit a]` is another good name and I like it too.
`Lit [a] Lit [22 33]]` solves exacly what you can find in Boris whish. He has been better than me to explain the complexity of certain parsing rules which uses datatypes which are part of the PARSE DSL.

[22:31:29](#2MTq05seSIoNv3lLb_CM5rFHUCm-W4htwibQyq4BtFQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* (Pardon some some errors, I have corrected them)

[23:31:27](#I3rmTxqbUS7_Y7r6ziZQULqHmsiIMT5HzGYZiMRDoRM) <GiuseppeChillemi (GiuseppeChillemi)>:
* (Pardon some errors, I have corrected them)

## 20-Mar-2025

[0:06:03](#NT2ycaPNjfIQowboSlsDXmItoYIfPSg5i4laoKIQk3o) <GiuseppeChillemi (GiuseppeChillemi)>:
Thanks, I have made some mistakes. This is better:

```
probe parse [a b] [(operation: ['a 'b]) operation to end] ; --- true
probe parse [none a b] [(operation: [none]) operation 'a 'b  to end] ;--- False
probe parse [none a b] [(operation: [quote none]) operation 'a 'b to end] ;--- True
probe parse compose [(none) #(none) a b] [(operation: #(none)) operation #(none) 'a 'b  to end] ;--- True
probe parse compose [(none) #(none) a b] [(operation: [none]) operation (operation: [#(none)]) operation #(none) 'a 'b  to end] ;--- True

```
I have a general rule now:

To match `none` as a word: `[quote none]`
To a parse command like `none` work: `[none]`
To match the value `none`: `#(none)` or `[#(none)]`


[0:17:37](#oP4yVXDEHU77HdYyqHqAxisVCDEp8b1RN1RpRVzTkiY) <GiuseppeChillemi (GiuseppeChillemi)>:
* Thanks, I have made some mistakes. This is better:

```
probe parse [a b] [(operation: ['a 'b]) operation] ; --- true
probe parse [none a b] [(operation: [none]) operation 'a 'b] ;--- False
probe parse [none a b] [(operation: [quote none]) operation 'a 'b] ;--- True
probe parse compose [(none) #(none) a b] [(operation: #(none)) operation #(none) 'a 'b] ;--- True
probe parse compose [(none) #(none) a b] [(operation: [none]) operation (operation: [#(none)]) operation #(none) 'a 'b] ;--- True
```

I have a general rule now:

To match `none` as a word: `[quote none]`
To a parse command like `none` work: `[none]`
To match the value `none`: `#(none)` or `[#(none)]`

[0:17:56](#yqLSPfV5uVB76jQQ2wFPj3floxCe6_kfYXJUvMUlhJI) <GiuseppeChillemi (GiuseppeChillemi)>:
* Thanks, I have made some mistakes. This is better:

```
probe parse [a b] [(operation: ['a 'b]) operation] ; --- true
probe parse [none a b] [(operation: [none]) operation 'a 'b] ;--- False
probe parse [none a b] [(operation: [quote none]) operation 'a 'b] ;--- True
probe parse compose [(none) #(none) a b] [(operation: #(none)) operation #(none) 'a 'b] ;--- True
probe parse compose [(none) #(none) a b] [(operation: [none]) operation (operation: [#(none)]) operation #(none) 'a 'b] ;--- True
```

I have a general rule now:

To match `none` as a word: `[quote none]`
To parse commands like `none` work: `[none]`
To match the value `none`: `#(none)` or `[#(none)]`

[1:15:51](#NTd1MgSx7RszgoPm7flyEqxxy5fW9u22fFmSDzY7u4Q) <GiuseppeChillemi (GiuseppeChillemi)>:
In the meantime I have produced an element quoter for parse. Please [test it](https://gist.github.com/GiuseppeChillemi/191e55404f76c24ffeb48beb4a8587f3) and report if you spot any bug

[3:29:24](#s8VPgYYIMK9BRsYLZab9vfVw7krCOPbt9miAv7DbvfA) <hiiamboris>:
In the meantime I have produced an element quoter for parse. Please [test it](https://gist.github.com/GiuseppeChillemi/191e55404f76c24ffeb48beb4a8587f3) and report if you spot any bug

[3:30:01](#VqMoHVsCUbQ8Ew6TfexrzsLLyyUzJjxV7Lva4CZdZvg) <hiiamboris>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> In the meantime I have produced an element quoter for parse. Please [test it](https://gist.github.com/GiuseppeChillemi/191e55404f76c24ffeb48beb4a8587f3) and report if you spot any bug

The whole approach is fundamentally wrong. Using parse alternatives will lead you to O(list-length*alternatives-count) time complexity.

[7:43:18](#2tmBBGMrNnJqZ8GNsHa6ijiL9EIQYErs-TPBDh7KY5U) <GiuseppeChillemi (GiuseppeChillemi)>:
It is an approach valid for minimal alternatives, not for hundred or thousand. 

[7:46:59](#s5_Jm9Ccz_B1QCZIFWvsHPlVBOJlEMWRt-9zjh5zYVI) <GiuseppeChillemi (GiuseppeChillemi)>:
The automation of a function will save you time and headache. This until LIT will eventually be implemented. 

[8:56:26](#1XppSnNrvLdy6HjlbDXihDtS02nkyQ4aHl2lQDtXEpQ) <Oldes (@oldes.h:matrix.org)>:
If it suits you, enjoy it... but I don't see any reason to use something like this. You never gives real life examples. If you want to use it to validate generic function input, I'm sure there could be better methods.

[8:58:08](#FlhiU9JQwwqsM6qKMjM1qrC4u3T3oQM0qLpn6ADg7R8) <Oldes (@oldes.h:matrix.org)>:
For example how you could use such a result without a headache?
```
>> delimit-elements [any [integer!]]
== [quote any | quote [integer!]]
```


[8:59:28](#7uT-61WBACiBXQS7n9uLDdMLeh8zKPj_pj0cU_7sSEA) <Oldes (@oldes.h:matrix.org)>:
I even don't know, how useful would be result: `[quote 1 | quote 2 | quote 3]`?

[9:00:41](#HKEpMDIEEV2V3EDqye0GHFwcTzBKKhmXyfzpEJXWyPo) <Oldes (@oldes.h:matrix.org)>:
Maybe using it like:
```
>> parse [1 2 3] compose/only [any (delimit-elements [1 2 3])]
== #(true)
```
But isn't easier to write: `equal? [1 2 3] [1 2 3]` ???

[11:05:13](#ZUyB_eUMky14he9C7WDEksbhOA3UWdfG5Us4fpfxi28) <GiuseppeChillemi (GiuseppeChillemi)>:
It has not born for that use but for something like this:
```
probe parse [5 a "x" 'xxx] [(probe rule: delimit-elements ["x" 5 a 10 lit-word!]) some rule ]
["x" | quote 5 | quote a | quote 10 | lit-word!]
true
```

[11:10:46](#XAuXTVWKitgk4R2gnE3tbZ_HRHBSX_bIjsWRgPQ1Zuc) <GiuseppeChillemi (GiuseppeChillemi)>:
So you can easily receive or write list of options and datatypes without quoting any alement.
This command would need the same function I have requested for VID: `DO-COMPOSE` or something similar.
So you could write:
```
parse [5 a "x" 'xxx] [some do-compose [delimit-elements ["x" 5 a 10 lit-word!]]
```
It is a tecnique that avoids distant `compose` that act on deep hidden uncontrollable parens. Compose in on-site instead on top.

[13:30:24](#edpKXA1COagtpmdsO2Mf1BhpKbou9H0g_1W6o34rDNE) <GiuseppeChillemi (GiuseppeChillemi)>:
* So you can easily receive or write list of options and datatypes without quoting any alement.
This command would need the same function I have requested for VID: `DO-COMPOSE` or something similar.
So you could write:

```
parse [5 a "x" 'xxx] [some do-compose [delimit-elements ["x" 5 a 10 lit-word!]]
```

It is a tecnique that avoids distant `compose` that acts on deep hidden uncontrollable parens. Compose is on-site instead on top.

[14:43:56](#389YdvQiwpLquZXYLSoPaQM3HbP6jEuDyZItaMaJ_5c) <rebolek (Boleslav B≈ôezovsk√Ω)>:
So it's basically over-engineered
```
>> inp: [5 a "x" 'xxx]
== [5 a "x" 'xxx]

>> elems: ["x" 5 a 10 'xxx]
== ["x" 5 a 10 'xxx]

>> ok?: true
== #(true)

>> foreach value inp [unless find elems value [ok?: false break]]
== #(none)

>> ok?
== #(true)
```

right?

[16:05:04](#PHiAtvhUx8c6z4Kbawgcc0qjlgbkzVJkTcufakpg7MI) <GiuseppeChillemi (GiuseppeChillemi)>:
Simple examples are made to undestand the topic. Try more complex one as those in hiiamboris  wish. Even bindin is a "simple table/word" association but once you scale it you will see how simple many things will be. Also, in your example you are not considering the explicit datatype which matches `'xxx` and any other value. Datatype which  can also be a typeset. Build the same complex examples as Boris ones and then we can talk about what it really solves.

[16:05:21](#IXOq35uh5WdACcUuv4BK2GH8pXVmgrn-uABaotKUMfk) <GiuseppeChillemi (GiuseppeChillemi)>:
* Simple examples are made to undestand the topic. Try more complex one as those in hiiamboris  wish. Even binding is a "simple table/word" association but once you scale it you will see how simple many things will be. Also, in your example you are not considering the explicit datatype which matches `'xxx` and any other value. Datatype which  can also be a typeset. Build the same complex examples as Boris ones and then we can talk about what it really solves.

[16:10:20](#qWMNJ2TueWIndsn_f-xG_zMYIwfxmmCvcdfTCtADCmg) <GiuseppeChillemi (GiuseppeChillemi)>:
And if you refer to `do-compose` or `do` keyword. I know you are aware how difficult sometime is to catch (or to not catch) `paren!`. We need on call site creation of elements for dynamically generate content. I had more than headache going deep in a way to dinamically create panels with contexts which are reusable too. This is a part of the global view about new instruments to make Redbol more flexible than it is. It is already great but it could be greater if we are not too conservative ;)

[16:10:47](#8IH7dCfmqGRI8CD9CTbUdStVhXl4Sidnqo8S8QrwL40) <GiuseppeChillemi (GiuseppeChillemi)>:
* And if you refer to `do-compose` (or a shorter `do`) keyword in parse. I know you are aware how difficult sometime is to catch (or to not catch) `paren!`. We need on call site creation of elements for dynamically generate content. I had more than headache going deep in a way to dinamically create panels with contexts which are reusable too. This is a part of the global view about new instruments to make Redbol more flexible than it is. It is already great but it could be greater if we are not too conservative ;)

[16:11:01](#9JbHugHvxTlWkbETp-e6-vpBYEJ6IgOOqj2pCQdQK1o) <GiuseppeChillemi (GiuseppeChillemi)>:
* And if you refer to `do-compose` (or a shorter `do`) keyword in parse. I know you are aware how difficult sometime is to catch (or to not catch) `paren!` while composing. We need on call site creation of elements for dynamically generate content. I had more than headache going deep in a way to dinamically create panels with contexts which are reusable too. This is a part of the global view about new instruments to make Redbol more flexible than it is. It is already great but it could be greater if we are not too conservative ;)

[16:11:13](#izzscgKU2FFki1sxf1I8F-LNDxN2w773uzPpiOsxSNI) <GiuseppeChillemi (GiuseppeChillemi)>:
* And if you refer to `do-compose` (or a shorter `do`) keyword in parse. I know you are aware how difficult sometime is to catch (or to not catch) `paren!`s while composing. We need on call site creation of elements for dynamically generate content. I had more than headache going deep in a way to dinamically create panels with contexts which are reusable too. This is a part of the global view about new instruments to make Redbol more flexible than it is. It is already great but it could be greater if we are not too conservative ;)

[16:11:26](#8IIMh3vYGjYafchiQmglueNFaXT9-c9crEkaUJ-I7hE) <GiuseppeChillemi (GiuseppeChillemi)>:
* And if you refer to `do-compose` (or a shorter `do`) keyword in parse. I know you are aware how difficult sometime is to catch (or to not catch) `paren!`s while composing. We need on call site creation of elements for dynamically generate content. I have had more than headache going deep in a way to dinamically create panels with contexts which are reusable too. This is a part of the global view about new instruments to make Redbol more flexible than it is. It is already great but it could be greater if we are not too conservative ;)

[16:11:43](#UAPcG-vJRIHrQybuYokU0h0kwtcmxh7aDehQtn7fK4k) <GiuseppeChillemi (GiuseppeChillemi)>:
* And if you refer to `do-compose` (or a shorter `do`) keyword in parse. I know you are aware how difficult sometime is to catch (or to not catch) `paren!`s while composing. We need on call site creation of elements for dynamically generate content. I have had more than headache going deep trying to create a way to dinamically create panels with contexts which are reusable too. This is a part of the global view about new instruments to make Redbol more flexible than it is. It is already great but it could be greater if we are not too conservative ;)

[16:12:01](#bGWyBLU1R8t_SlYRSjLneuNq8tR7Y4f9vrZhLk1lFxc) <GiuseppeChillemi (GiuseppeChillemi)>:
* And if you refer to `do-compose` (or a shorter `do`) keyword in parse. I know you are aware how difficult sometime is to catch (or to not catch) `paren!`s while composing. We need on call site creation of elements for dynamically generate content. I have had more than headache going deep trying to develop a way to dinamically create panels with contexts which are reusable too. This is a part of the global view about new instruments to make Redbol more flexible than it is. It is already great but it could be greater if we are not too conservative ;)

[16:13:58](#-P5Q7SYPp6cRrlA7ulg8TI7gsNAvLsn8QBIdhhr3yAw) <GiuseppeChillemi (GiuseppeChillemi)>:
* And if you refer to `do-compose` (or a shorter `do`) keyword in parse. I know you are aware how difficult sometime is to catch (or to not catch) `paren!`s while composing. We need on call site creation of elements for dynamically generate content, here and in `VID`. I have had more than headache going deep trying to develop a way to dinamically create `GUI` panels with contexts which are reusable too. This is a part of the global view about new instruments to make Redbol more flexible than it is. It is already great but it could be greater if we are not too conservative ;)

## 12-May-2025

[16:02:04](#FfjOVIYvaUrDMUBmppd9iDFBjBqCbfa8mPADpzlZPGQ) <mikeyaunish>:
Trying to understand the parse changes from 0.6.4 to 0.6.6.
```
parse [2x2 - 3x2] [
	any [
		(print "START parse")
		pair! '- pair! 
		|	pair! 
	] 
]
about
```
0.6.4 results only shows the parse loop starting once
```
START parse 
== true
>> about
Red 0.6.4 for Windows built 27-Jun-2024/2:05:25
```
0.6.6 results shows the parse loop starting twice
```
START parse
START parse
== true
>> about
Red 0.6.6 for Windows built 19-Mar-2025/6:09:25-07:00  commit #6942c7a
```
I'd like to know how to get 0.6.6 version to behave the same as the 0.6.4 version. My attempts have resulted in nothing. 


[16:49:11](#hj0AKm7mih9zUrmMDHQiEL1mZ4XWxlK03lVDgiTEg_s) <GiuseppeChillemi (GiuseppeChillemi)>:
Maybe ANY does not check if it has reached the end of input and It stops because it is not moving.

[17:12:56](#nrvMA7uJjYfYaBSvYxo-VqVRk1huGiaMmyStV-bdY1s) <hiiamboris>:
Add `end |` before your rules

[22:27:00](#ZZiTbLCIu0zlWT7GEENkszGyLHlIobyMh7z-TdN4Llw) <mikeyaunish>:
Thanks hiiamboris . Putting end at the beginning seems like a paradox.

## 13-May-2025

[2:22:45](#Vi6Xbx3Jm5cS9N7hm7Dp7lMj7qjCmJlAQNSaJRBfcDY) <hiiamboris>:
`any` loop should not stop until it either fails or does not progress, both conditions can only be tested after evaluating its rule. If you don't want your rule to be evaluated in the last (terminating) iteration, `end |` acts as a trap for it.

[13:54:19](#GOtDwWv49REDeDkdxJayLvA9fyApzEONMBp0__0n1Fo) <mikeyaunish>:
Thanks for the explanation, it clears things up for me.


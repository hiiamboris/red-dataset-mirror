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

## August 9, 2023

[]()

### [Subpixel GUI](https://www.red-lang.org/2023/08/subpixel-gui.html)

Maybe you didn't notice, but Red/View, our GUI engine, has subpixel precision from the beginning! Unfortunately, that level of precision was not directly accessible to end users, until now. 

Actually, it would be more accurate to say that we had [subpixel resolution](https://en.wikipedia.org/wiki/Sub-pixel_resolution) only so far. The guilty part is the pair! datatype being limited to integer components only, while subpixel precison requires decimal numbers. So we have recently introduced new datatypes to cope with that.

What urged us to make those changes now was a very peculiar visual glitch caused by that dissonance. That glitch happens during face dragging operations. Here is an example using our View [test script](https://github.com/red/red/blob/master/tests/view-test.red):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgBlZCIqAJqy8lOhvwXT_49m974ocbb9xJwfgHw4oGr4_yGr_w4aBfUQF4HIZHoZCpqgHQPAhoPIugfinmNuZZ_wrEN21ps9pRAXmt8aH0ZwxH8N8hvv0Yp8JxEalAP3Wrf1jBxMZUr8Tj1WeloAgwKCbSbDWp3oUSabKybi0RYVa3FE-Yj0VE5qx5pW_XQ/s16000/glitch.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgBlZCIqAJqy8lOhvwXT_49m974ocbb9xJwfgHw4oGr4_yGr_w4aBfUQF4HIZHoZCpqgHQPAhoPIugfinmNuZZ_wrEN21ps9pRAXmt8aH0ZwxH8N8hvv0Yp8JxEalAP3Wrf1jBxMZUr8Tj1WeloAgwKCbSbDWp3oUSabKybi0RYVa3FE-Yj0VE5qx5pW_XQ/s551/glitch.gif)

As you can see, on some positions, the face starts *shaking* while the mouse cursor remains still. This affects any type of face. The shaking is about ±2 pixels. It is caused by the difference in precision between the /offset facet expressed in integer numbers and the backend API, which only deals with floating point numbers. The accumulated error when converting integer-&gt;float-&gt;integer gives a 2 pixels difference. Such error happens on displays where the scaling factor is different from 100%. With the rise of 2K, 3K and 4K displays, a scaling factor &gt; 100% has become the norm, making this glitch more frequent. You might think that this is not a big issue until you start building custom scrollbars and see your entire scrolled content shaking massively...

### New point datatypes

In order to provide decimal positions and sizes for View faces, extending the existing pair! datatype was considered, though, the pair syntax can hardly scale up for such needs:

```
    2343.122x54239.44
    2343.122x54239.44x6309.332
    2343.122x54239.44x6309.332x442.3321
    2.33487e9x54239.44
    2.33487e9x54239.44x9.83242e17
    2.33487e9x54239.44x9.83242e17x5223.112
    1.#infx1.#infx1.#inf
```

As you can notice there, it quickly becomes difficult to read and identify the individual components. So we opted for adding a new literal form (hence a new datatype) that matches how coordinates for two or more dimensions are commonly represented:

```
    (2343.122, 54239.44)
    (2343.122, 54239.44, 6309.332)
    (2343.122, 54239.44, 6309.332, 442.3321)
    (2.33487e9, 54239.44)
    (2.33487e9, 54239.44, 9.83242e17)
    (2.33487e9, 54239.44, 9.83242e17, 5223.112)
    (1.#inf, 1.#inf, 1.#inf)
```

Such literal forms requires the comma character to be a delimiter, so that it cannot be used anymore as a decimal separator. That was, unfortunately, a necessary decision in order to unlock such literal forms. The gains should be bigger than the loss.

So, two new datatypes have been added:

- point2D!: a two-dimensional coordinate or size.
- point3D!: a three-dimensional coordinate or size.

Their canonical lexical forms are:

```
    (<x>, <y>)
    (<x>, <y>, <z>)

    where <x>, <y> and <z> are integer or float numbers.
```

Optional spaces are allowed anywhere inside the point literals on input, they will be removed on loading.

```
    >> (1,2)
    == (1, 2)
    >> (  1.35 ,  2.4  )
    == (1.35, 2.4)
```

Both for 2D and 3D points, their components are internally stored as 32-bit floating point numbers, so that their precision is limited to 7 digits. This should be far enough for their use-cases though.

When one of the components has a fractional part equal to zero, it is displayed without the .0 part for easier reading. Similarly, integers are accepted as input for any component and are internally converted to a 32-bit float.

```
    >> (0.3, 0.5) + (0.7, 0.5)
    == (1, 1)
    >> (2.0, 3.0)
    == (2, 3) 
```

#### Creation

Besides literal points, it is possible to create them dynamically, the same way as pairs, using make, to or one of the as-* native functions:

```
    >> make point2D! [2 4.5]
    == (2, 4.5)
    >> to-point2D 1x2
    == (1, 2)
    >> as-point3D 1 (3 / 2) 7 * 0.5
    == (1, 1.5, 3.5)
```

#### Accessors

Point components can be individually accessed using ordinal numbers or component names using action accessors or path syntax:

```
    >> pick (2, 4.5) 1
    == 2.0
    >> pick (2, 4.5) 'y
    == 4.5
    >> p: (2, 4.5)
    == (2, 4.5)
    >> p/x
    == 2.0
    >> p/y: 3.14159
    == 3.14159
    >> p
    == (2, 3.14159)
```

#### Math operations

Basic math operations are supported as well:

```
    >> (1, 1) + (2, 3.5)
    == (3, 4.5)
    >> (1, 1) - (2, 3.5)
    == (-1, -2.5)
    >> (2, 3) * (10, 3.5)
    == (20, 10.5)
    >> (20, 30) / (10, 3)
    == (2, 10)
```

Notice that mixing pairs with point2D in math expressions is allowed. The pair value will be promoted to a point2D in such case (as integers with floats):

```
    >> 1x1 + (2, 3.5)
    == (3, 4.5)
```

#### Other actions/natives

```
    >> round (2.78, 3.34)
    == (3, 3)
    >> round/down (2.78, 3.34)
    == (2, 3)
    >> random (100, 100)
    == (53, 81)
    >> zero? (0, 0)
    == true
    >> min (10, 100) (24, 35)
    == (10, 35)
    >> max 10x100 (24, 35)
    == (24, 100)    
```

Notice that pairs will be promoted to point2D in mixed use cases with min/max.

 

### View and VID adjustments

The main changes are in face! object:

- /offset: now only accepts point2D! values.
- /size: accepts both pair! and point2D! values.

In VID, both pair and point2D values can be used to denote positions and sizes, so that VID is backward compatible. All previous VID code should work without any change. VID will convert all positions to point2D values. Sizes by default in VID, keep using pairs, unless a point2D is provided by the user.

All Draw commands that were accepting pairs now also accept point2D values for higher precision.

The related documentation will get updated soon to reflect those changes.

In order to illustrate the difference in using pairs and point2D positions, here is a (not so) simple animation comparison showing the subpixel positioning difference (correctness of animation in this case is privileged over simplicity of code):

```
    view/no-wait [
        size 800x200 space 0x0
        b1: box 2x40 red return
        b2: box 2x40 blue
    ]
    x: b1/offset/x
    until [
        do-events/no-wait                   ; processes GUI events in queue
        wait 0.1                            ; slows down the animation
        do-no-sync [                        ; switches to manual faces redrawing
            b1/offset/x: b1/offset/x + 0.1
            b2/offset/x: to-integer x: x + 0.1
            if all [b1/state b2/state][show [b1 b2]] ; redraws both faces
        ]
        any [b1/offset/x > 700 none? b1/state none? b2/state]
    ]
```

Here's the zoomed capture of the result (on a display with 200% scaling factor):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgVPWM8XAMRMSeFKPbcPpB5Un2AHE2I6iAr15WnD-UDDAz08xq459j-IncjXAFiNC6yDqu99u-LJ2w7Rhfh1LaWwkr54Fjl4sYLT2S_BmBSTBM-pLbyoMP9JCtA4oqNf2Sb6n0JnNNoKf9QmcqbHTru34Knt0FZ9E2BEg8tCuvSIC5ycV7rWXcJSCLFjI-/w640-h416/run2.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgVPWM8XAMRMSeFKPbcPpB5Un2AHE2I6iAr15WnD-UDDAz08xq459j-IncjXAFiNC6yDqu99u-LJ2w7Rhfh1LaWwkr54Fjl4sYLT2S_BmBSTBM-pLbyoMP9JCtA4oqNf2Sb6n0JnNNoKf9QmcqbHTru34Knt0FZ9E2BEg8tCuvSIC5ycV7rWXcJSCLFjI-/s796/run2.gif)

The red bar uses the newly enabled subpixel precision, while the blue bar simulates the old pair positioning precision (so only allowing integer positions). What you can see is that the red bar makes two smaller steps while the blue bar makes a single one, looking more "jumpy".

This means that now animations on displays with a scaling factor &gt; 100% can be smoother as they benefit from more accurate positioning.

Note: the animation code above is far from being simple or elegant, we'll be working on improving that. The animation code could have been quite simpler by using a rate option in VID and putting the animation code in a on-time handler. Though, timer events firing (especially on Windows) are not very reliable, so unrolling a custom event loop lowers that risk when the timing is critical (like for fast game loops).

As a conclusion, here is an old-school style starfield [code demo](https://github.com/red/code/blob/master/Scripts/starfield.red) using 2D and 3D points (moving mouse left/right changes the stars speed):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgv67jMw_YEHeCq-WZmd1lw6b5xs2SuO4a4kBFxdF1ZD4GuqRFKXBZSJBOb_XJfg8-qNSTfFthtKmz7hIza0hx5LgPgBMc-Sjn3UqthW9DCja5rtzIHxZdslT-KaAs5aFV19WOJHGG9fJUoRtgfUk-HogZVHAcV5Ntj2kbenZunc3w9DxfgigagBXTKR0EK/w626-h640/starfield.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgv67jMw_YEHeCq-WZmd1lw6b5xs2SuO4a4kBFxdF1ZD4GuqRFKXBZSJBOb_XJfg8-qNSTfFthtKmz7hIza0hx5LgPgBMc-Sjn3UqthW9DCja5rtzIHxZdslT-KaAs5aFV19WOJHGG9fJUoRtgfUk-HogZVHAcV5Ntj2kbenZunc3w9DxfgigagBXTKR0EK/s1402/starfield.gif)

Let us hear your feedback about those changes on our Gitter (now Matrix) [channel](https://app.gitter.im/#/room/%23red_red:gitter.im).

Enjoy!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:32 PM](https://www.red-lang.org/2023/08/subpixel-gui.html "permanent link") [5 comments:](https://www.red-lang.org/2023/08/subpixel-gui.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4305336381562427106&from=pencil "Edit Post")

Labels: [GUI](https://www.red-lang.org/search/label/GUI), [pairs](https://www.red-lang.org/search/label/pairs), [points](https://www.red-lang.org/search/label/points), [subpixel](https://www.red-lang.org/search/label/subpixel)

[Newer Posts](https://www.red-lang.org/ "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2023-08-09T15%3A32%3A00%2B02%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
    
    - [Subpixel GUI](https://www.red-lang.org/2023/08/subpixel-gui.html)
  
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

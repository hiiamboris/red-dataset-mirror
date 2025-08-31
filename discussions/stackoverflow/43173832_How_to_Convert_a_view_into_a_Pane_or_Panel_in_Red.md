# How to Convert a view into a Pane or Panel in Red

**Link:**
<https://stackoverflow.com/questions/43173832/how-to-convert-a-view-into-a-pane-or-panel-in-red>

**Asked:** 2017-04-02 21:38:36 UTC

------------------------------------------------------------------------

So I have a view that is currently working and looking like I want. What
I would like to do take the content it contains wrap it inside a
variable and put it inside of a tab-panel. To do this, I believe I need
to convert it to a panel or some such. But I am not really sure how.

Here is the view,

            Red [ Title: "Editor"  needs: 'view]

            s: 110x25
            ts: 50x50

            view [size 800x800 title "Red Edit"

            drop-down s "Debug" data ["Debug" "Release"] 
            drop-down s "Windows" data ["Windows" "MacOSX" "Linux" "BSD" ] 
            button s "Compile" []  across
            button s  "Run" []


             return
                a: area 700x700 black
            ]

Here is the tab-panel

           view [backdrop brown
                title "Red Edit"
                tab-panel 820x820 [
                      "File1" []

                                  ]
            ]

It would go inside of the first tab named \"File1\". My attempts thus
far have given me a compiler error telling me that the panel I am trying
to create has no value.

Also, tips on syntax and coding style would be appreciated too since I
am still learning red.

**Update**: here is how I would like to combine them :

        Red [ Title: "Editor"  needs: 'view]
        s: 110x25
        ts: 50x50

        p: [size 800x800 title "Red Edit"

        drop-down s "Debug" data ["Debug" "Release"] 
        drop-down s "Windows" data ["Windows" "MacOSX" "Linux" "BSD" ] 
        button s "Compile" []  across
        button s  "Run" []


         return
            a: area 700x700 black
        ]



        view [backdrop brown
        title "Red Edit"

        tab-panel 820x820 [
            "File1" [text "hello" p]

                                      ]
        ]

If I do this, p never gets displayed.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by Geeky I

If I was going to make a guess about your intentions, I think your real
question is:

# How can I compose and glue GUI stuff together?

There are several ways to do this, but the first thing you should ask
is:

## Do I need to?

As \@dockimbel says if it isn\'t dynamic, you can simply have it after
`tab-panel` word inside the dialect block `[]`, and this is idiomatic:

    tab-panel [<rest of gui here>]

## Method 1: Compose into the dialect with a *block*

This is the next simplest way, using your code:

    Red [ Title: "Editor"  needs: 'view]

    s: 80x25
    ts: 50x50

    cnt-object: layout cnt-view-dialect-blk: [
        ;size 80x80 title "Red Edit"
        drop-down s "Debug" data ["Debug" "Release"] 
        drop-down s "Windows" data ["Windows" "MacOSX" "Linux" "BSD" ] 
        button s "Compile" []

        ;across
        button s  "Run" []

        return
        a: area 350x150 black
    ]

    ; view cnt-object

    pnl-object: layout pnl-view-dialect-blk: compose/deep [
        title "Red Edit"
        tab-panel 400x200 [
            "File1" [(cnt-view-dialect-blk)]
        ]
    ]

    view pnl-object

## Method 2: Use the view `face!` *object*

This requires a steeper learning curve, but makes everything much easier
when you learn it, and is probably more efficient too! If you read the
documentation for
[`face!`](https://doc.red-lang.org/en/view.html#_face_object){rel="nofollow noreferrer"}:

    button: make face! [type: 'button]

Then look back at what I\'ve named as `-object` in the code above, you
realize they are conceptually the same thing. That is, an `object!`
created with `make`.

If you\'re doing this way, one of the most useful things is `/pane` and
`/parent` to move up and down the hierarchy

## Further considerations

View is not a \"thing\" as it appears on the surface. It may refer to
the VID *dialect* (what you have in *\[blocks\]*), or `view` *function*
which is used to display things in the view engine. The actual things
are `face!` objects, created manually with `make` or by the `layout`
function.

I\'ve labelled `-view-dialect-blk`, written in the actual view dialect,
which is conceptually different from the actual objects. If you inspect
all that I\'ve labelled with `??`, I think you\'d be a few steps closer
to understanding how everything works under the hood ;-)

It\'s also good to read up on [rebol2 view
concepts](https://www.cis.upenn.edu/~matuszek/Concise%20Guides/Concise%20Rebol-View.html){rel="nofollow noreferrer"}
and the [official
documentation](https://duckduckgo.com/?q=rebol%20view%20docs%20site%3Arebol.com&t=ffsb&ia=web){rel="nofollow noreferrer"}
until red\'s catches up with it. Though slightly different, the concepts
are the same

*Comment by Alexander Ryan Baggett:* The \"File1\"
\[(cnt-view-dialect-blk)\] that syntax is what I needed :)

*Comment by Alexander Ryan Baggett:* Actually, no. I see that what you
have given me works, but I still don\'t understand it.

*Comment by Alexander Ryan Baggett:* What does compose/deep do?

*Comment by Geeky I:* \@AlexanderRyanBaggett `compose` is a general
purpose function in rebol, the best advice I can give you is read more
documentation, and come on the
[gitter](https://gitter.im/red/help){rel="nofollow noreferrer"} chat.
(also, keep posting questions! :D)

*Comment by Alexander Ryan Baggett:* You can count on the questions part
;)

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Use `layout` instead of `view` and `??` it. I
think you are confusing it as something else. For more details, check
out the rebol2 view docs

*Comment by Alexander Ryan Baggett:* Yes, I am aware of layout, I am
just not sure of the mechanics of it. I have a working and a non-working
example, but I can\'t figure out what is different.

*Comment by Alexander Ryan Baggett:* Could you provide a link?

*Comment by Alexander Ryan Baggett:* Do you understand what I am trying
to do in general? I would like to put the content representing the
buttons and dropdowns and area inside of the tab-panel. Is that
something you can show me how to do?

*Comment by Alexander Ryan Baggett:* The Red documentation on Tab-panel
looks like this : 7.3. tab-panel Syntax tab-panel \<options\> \[\<name\>
\<body\>\...\] \<options\> : optional list of settings for the panel.
\<name\> : a tab\'s title (string!). \<body\> : a tab\'s content as VID
description (block!). VID Dialect 48 Description Constructs a tab-panel
panel inside the current container. The spec block must contain a pair
of name and content description for each tab. Each tab's content body is
a new child panel face, acting as any other panels.

*Comment by DocKimbel:*
`What I would like to do take the content it contains wrap it inside a variable and put it inside of a tab-panel`
This is not clear enough to make an answer. Do you really need to do
that dynamically at run-time? If not, why don\'t you just copy/paste
your VID code for your \"view\" inside the block after `"File1"`?

*Comment by Alexander Ryan Baggett:* I intend to be able to dynamically
add and remove tabs at runtime. This content will be in every tab.

*Comment by Alexander Ryan Baggett:* The overwhelming majority of the
documentation on how to use red focues on the apis View, and Vid,and not
syntax or primitives which tends to be where I am struggling.

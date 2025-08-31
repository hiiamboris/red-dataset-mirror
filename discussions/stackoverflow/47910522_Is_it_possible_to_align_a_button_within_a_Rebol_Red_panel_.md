# Is it possible to align a button within a Rebol / Red panel?

**Link:**
<https://stackoverflow.com/questions/47910522/is-it-possible-to-align-a-button-within-a-rebol-red-panel>

**Asked:** 2017-12-20 16:29:48 UTC

------------------------------------------------------------------------

Would like to do something like this except button is not really in the
middle

      v: [text "test" field "test"
          return
          button middle
      ]
      view v

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by DocKimbel

The Red/VID dialect is capable of [aligning
faces](https://doc.red-lang.org/en/vid.html#_layout){rel="nofollow noreferrer"}
in the current row/column, but not yet centering it relatively to its
parent face. The current way to achieve it is to explicitly call the
`center-face` function, once the face tree has been constructed:

    v: layout [
        size 500x200
        text "test" field "test" return 
        b: button "ok" 
    ]
    center-face/x b
    view v

------------------------------------------------------------------------

### Answer (score: 0) --- by Civan Tun&#231;

A way for people who still want to know:

    boyut: system/view/screens/1/size
    orta: boyut * 1x0 / 2.6
    view [
      size boyut
      origin orta
      ; faces
    ]

------------------------------------------------------------------------

## Comments on question

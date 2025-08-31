
#2953: gui text in array
================================================================================
Issue is closed, was reported by tmpbci and has 16 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2953>

 c: "something"
view [ field c ]

is OK.

c:  ["something"] 
view [ field c/1 ]

Fails with red063 from cask/brew


Comments:
--------------------------------------------------------------------------------

On 2017-08-01T10:53:46Z, geekyi, commented:
<https://github.com/red/red/issues/2953#issuecomment-319337662>

    Assuming you get the following error:
    ```red
    >> view [ field c/1 ]
    *** Script Error: VID - invalid syntax at: [c/1]
    *** Where: do
    *** Stack: view layout cause-error
    ```
    
    What's in the block after `view` is a dialect / dsl, so Red syntax won't work there.
    Come chat in https://gitter.im/red/red/welcome. and check out the docs from http://www.red-lang.org/p/documentation.html.
    Particularly https://doc.red-lang.org/en/vid.html

--------------------------------------------------------------------------------

On 2017-08-01T11:47:58Z, 9214, commented:
<https://github.com/red/red/issues/2953#issuecomment-319347863>

    ```Red
    c: ["something"]
    view [f: field do [f/text: c/1]]
    ```

--------------------------------------------------------------------------------

On 2017-08-01T11:57:10Z, geekyi, commented:
<https://github.com/red/red/issues/2953#issuecomment-319349592>

    This actually works in Rebol 2, so I wonder if it's just missing support for `path!` syntax?

--------------------------------------------------------------------------------

On 2017-08-01T14:37:27Z, 9214, commented:
<https://github.com/red/red/issues/2953#issuecomment-319389718>

    @geekyi is onto something, see:
    ```Red
    view [
        across
        b: base transparent 50x50 
            draw  [fill-pen 255.55.0.70 circle 25x25 20]
            react/later [b/draw/2/4: to integer! 255 * s/data]
    
        s: slider
    ]
    ```
    Results in
    ```Red
    *** Script Error: VID - invalid syntax at: [react/later [b/draw/2/4: to integer! 255 * s/data] s:]
    *** Where: do
    *** Stack: view layout cause-error
    ```
    but this one works
    ```Red
    view [
        across
        b: base transparent 50x50 draw [fill-pen 255.55.0.70 circle 25x25 20]
        s: slider
    
        do [react/later [b/draw/2/4: to integer! 255 * s/data]]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-08-01T17:55:46Z, greggirwin, commented:
<https://github.com/red/red/issues/2953#issuecomment-319447335>

    @9214, the syntax in VID is slightly different for `react/later`:
    ```
    view [
        across
        b: base transparent 50x50 
            draw  [fill-pen 255.55.0.70 circle 25x25 20]
            react later [b/draw/2/4: to integer! 255 * s/data]
    
        s: slider
    ]
    ```

--------------------------------------------------------------------------------

On 2017-08-01T18:00:32Z, greggirwin, commented:
<https://github.com/red/red/issues/2953#issuecomment-319448710>

    Words are evaluated, and file or url values are loaded, but paths are not, at this time.

--------------------------------------------------------------------------------

On 2017-08-01T18:04:55Z, greggirwin, commented:
<https://github.com/red/red/issues/2953#issuecomment-319449888>

    I don't know if it's a design choice or something that just hasn't been needed yet. See: https://github.com/red/red/blob/master/modules/view/VID.red#L180

--------------------------------------------------------------------------------

On 2017-08-02T07:27:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2953#issuecomment-319591241>

    Just a few cases in VID are allowed to use Red expressions, like after `data` and `at`. So the following code will work fine:
    ```
    c: ["something"]
    view [ field data c/1 ]
    ```
    
    I don't want to allow to use Red expressions everywhere for now where possible in VID, as that would make it very confusing to many users, who have troubles distinguishing what is regular Red code and what is VID dialect. One option could be to allow it but require a parens around the expression, visually isolating it from the rest of VID. That is used in Parse also, so would feel more familiar. Though, I don't want to make that a mandatory convention in all dialects, each one should be free to define its own semantics and how much mixing the dialect with regular language is allowed.


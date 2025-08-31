# Red updating text in VID using reactive method

**Link:**
<https://stackoverflow.com/questions/43271499/red-updating-text-in-vid-using-reactive-method>

**Asked:** 2017-04-07 06:52:04 UTC

------------------------------------------------------------------------

    Red [needs: 'view]

    num: ["1^/"]
    k: num/1

    view [
         size 600x600
         txt: text 30x50 k
         ar: area 300x400 "" focus on-change[
             txt/size: ar/size
             len: length? split face/text newline
             either (len - face/data) > 0 [
                   append num append form (len + 1) newline
                   face/data: len
             ][
                   remove back tail num
                   face/data: face/data - 1 
              ]
              txt/text: form num
         ]
         do [ar/data: 0]
    ]

This Red program contains a \"text face\" and an \"area face\". The text
face contains a vertical list of serial numbers. When a newline is added
in the area face, the serial number will increase as per number of
lines. And when a line is removed in the area face, the serial number
will decrease as well.

This is using a non-reactive method. Is there a reactive approach to do
it?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by Eran W

I believe that you we\'re looking for the
[`react`](https://doc.red-lang.org/en/reactivity.html#_react){rel="nofollow noreferrer"}
function. The reactive framework was introduced in [this blog
post](http://www.red-lang.org/2016/06/061-reactive-programming.html){rel="nofollow noreferrer"}
and there is a very similar example of converting an example using
`on-change` to its reactive version.

Anyhow, I was reading a lot lately about Red, and I was looking for an
first exercise; My `to-list` implementation could be improved probably,
but the view declaration is more compact now:

    Red [needs: 'view]

    to-list: function [text][
        ; converts text area string to list of numbers separated by newlines
        txt: copy text
        append txt "dummy" ; handle empty lines
        len: length? split txt newline
        x: copy ""
        repeat i len [ append x mold i append x newline]
    ]

    view [ 
        size 600x600 
        text 30x600 react [
            face/text: to-list text-area/text
        ]
        text-area: area 300x400 ""
    ]

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* For code that works, there is
[codereview.stackexchange.com](https://codereview.stackexchange.com/) ;
best way (I think) is to post there and link to it from
gritter.im/red/help channel

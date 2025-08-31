
#2293: Scrolling base face flickers if background color is provided ...
================================================================================
Issue is closed, was reported by pekr and has 4 comment(s).
[status.resolved] [type.review] [GUI]
<https://github.com/red/red/issues/2293>

Ported my short R2/R3 news scroller to Red. When you uncomment the code (no background), the result is nice. However, once there is a base face background, it flickers very upleasantly (paste following code into the gui console):
```
Red [
   Title: "Simple news scroller"
]

system/view/auto-sync?: no

screen-size: system/view/screens/1/size
news-bottom-offset: 0x100
news-height: 0x100

message: "Simple news scroller. Who makes me faster and smoother? ..."

;--- style for draw dialect
bold64: make font! [style: 'bold size: 64 color: white]

;--- just to calculate text size ....
txt: make face! compose [size: 3000X200 text: (message)]
txt/font: make font! [style: 'bold size: 64 color: white]
text-size: size-text txt

win: view/options/flags/no-wait compose/deep [
  backdrop green

  ;--- we place the text behind the right border of the screen ....
  at (as-pair screen-size/x 10)

  news: base 3000x200 draw [font bold64 text 0x0 (message)] ;0.255.0.255

][
  size: as-pair screen-size/x news-height/y
  offset: as-pair 0 (screen-size/y - news-bottom-offset/y - news-height/y)
][no-border]

forever [
   wait 0.0001
   news/offset: news/offset - 1x0
   if (news/offset/x + (first text-size)) < 0 [news/offset/x: screen-size/x]
   do-events/no-wait
   show win
]
```


Comments:
--------------------------------------------------------------------------------

On 2016-10-29T09:43:55Z, qtxie, commented:
<https://github.com/red/red/issues/2293#issuecomment-257082091>

    It's a known limitation of the Windows native widget. The default windows widget is not suitable for animation.
    
    When no background (`none`) or set the background to `transparent`, the view engine will use the so called `layered window` internally, it's suitable for animation. That's why the result is smoother.
    
    We don't use `layered window` by default becuase it cannot be child window on OS before Windows 8.

--------------------------------------------------------------------------------

On 2017-01-12T12:32:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2293#issuecomment-272151968>

    Fixed by recent commits on master branch. Now the scrolling is smooth.


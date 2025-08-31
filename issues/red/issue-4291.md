
#4291: Heisenbug with zero bytes in `mold` output
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [type.bug] [type.GC]
<https://github.com/red/red/issues/4291>

**Describe the bug**

The snippet below molds face content, saves it, reads back and then examines for zero bytes (which are not loadable).

**To reproduce**

1) Save this script and run with any Red or console build (with View support).
2) Wait for it to finish and watch out for messages about zero bytes.

The window content is incidental, but due to the random nature of the bug, any modification of the code or switch of the Red version affects the output. Example output is attached at the end.

I've tried it with about 10 different builds, including those built from sources, and from fast-lexer branch, with `-d` or without - everywhere there's some zero byte output, albeit always different.

~~The only build that seems unaffected is https://github.com/red/red/pull/4097 - I should hope it fixes the bug for good, but since I don't know where the bug is, it's worth checking again after it will be merged.~~
```
Red []

v: view/no-wait [
	sp: base magenta 20x300 loose draw [rotate 90 pen yello text 0x-20 "DRAG ME"]
	on-drag [
		face/offset/y: 0
		pr/size/x: face/parent/size/x - face/offset/x - 20 
		pr/offset/x: face/offset/x + 20 
	] 
	pr: panel [
		at 0x0 box 300x300 #00FFFF00 react []
	]
]
until [not do-events/no-wait]

repeat iter 10000 [
	write %v mold/all/flat v
	bin: read/binary/seek %v start: random 1000
	repeat i length? bin [
		if bin/:i = 0 [print ["iteration" iter "start" start "byte" i "is zero"]]
	]
]

unview
```

**Expected behavior**

No output.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 3-Feb-2020/0:33:33+03:00      ;) that's a funny timestamp btw
```

**Example output**
`is zero: ` is followed by a null char. Notice how null bytes always happen before the set-word.
```
iteration 1170 start 435 byte 9405 is zero:  state: [#[handle! 00230B84h] 0 #[none] #[false]]   
iteration 1170 start 435 byte 9454 is zero:  rate: #[none] edge: #[none] para: #[none] font: #  
iteration 1170 start 435 byte 9468 is zero:  edge: #[none] para: #[none] font: #[none] actors:  
iteration 1170 start 435 byte 9482 is zero:  para: #[none] font: #[none] actors: #[none] extra  
iteration 1170 start 435 byte 9496 is zero:  font: #[none] actors: #[none] extra: #[none] draw  
iteration 1170 start 435 byte 9510 is zero:  actors: #[none] extra: #[none] draw: #[none] on-c  
iteration 1170 start 435 byte 9526 is zero:  extra: #[none] draw: #[none] on-change*: func [wo  
iteration 1170 start 435 byte 9541 is zero:  draw: #[none] on-change*: func [word old new /loc  
iteration 1170 start 435 byte 9555 is zero:  on-change*: func [word old new /local srs same-pa  
iteration 1170 start 435 byte 11328 is zero:  on-deep-change*: func [owner word target action n 
iteration 1620 start 257 byte 9584 is zero:  state: [#[handle! 00230B84h] 0 #[none] #[false]]   
iteration 1620 start 257 byte 9633 is zero:  rate: #[none] edge: #[none] para: #[none] font: #  
iteration 1620 start 257 byte 9647 is zero:  edge: #[none] para: #[none] font: #[none] actors:  
iteration 1620 start 257 byte 9661 is zero:  para: #[none] font: #[none] actors: #[none] extra  
iteration 1620 start 257 byte 9675 is zero:  font: #[none] actors: #[none] extra: #[none] draw  
iteration 1620 start 257 byte 9689 is zero:  actors: #[none] extra: #[none] draw: #[none] on-c  
iteration 1620 start 257 byte 9705 is zero:  extra: #[none] draw: #[none] on-change*: func [wo  
iteration 1620 start 257 byte 9720 is zero:  draw: #[none] on-change*: func [word old new /loc  
iteration 1620 start 257 byte 9734 is zero:  on-change*: func [word old new /local srs same-pa  
iteration 1620 start 257 byte 11507 is zero:  on-deep-change*: func [owner word target action n 
iteration 2070 start 481 byte 9359 is zero:  state: [#[handle! 00230B84h] 0 #[none] #[false]]   
iteration 2070 start 481 byte 9408 is zero:  rate: #[none] edge: #[none] para: #[none] font: #  
iteration 2070 start 481 byte 9422 is zero:  edge: #[none] para: #[none] font: #[none] actors:  
iteration 2070 start 481 byte 9436 is zero:  para: #[none] font: #[none] actors: #[none] extra  
iteration 2070 start 481 byte 9450 is zero:  font: #[none] actors: #[none] extra: #[none] draw  
iteration 2070 start 481 byte 9464 is zero:  actors: #[none] extra: #[none] draw: #[none] on-c  
iteration 2070 start 481 byte 9480 is zero:  extra: #[none] draw: #[none] on-change*: func [wo  
iteration 2070 start 481 byte 9495 is zero:  draw: #[none] on-change*: func [word old new /loc  
iteration 2070 start 481 byte 9509 is zero:  on-change*: func [word old new /local srs same-pa  
iteration 2070 start 481 byte 11282 is zero:  on-deep-change*: func [owner word target action n 
iteration 2760 start 640 byte 9200 is zero:  state: [#[handle! 00230B84h] 0 #[none] #[false]]   
iteration 2760 start 640 byte 9249 is zero:  rate: #[none] edge: #[none] para: #[none] font: #  
iteration 2760 start 640 byte 9263 is zero:  edge: #[none] para: #[none] font: #[none] actors:  
iteration 2760 start 640 byte 9277 is zero:  para: #[none] font: #[none] actors: #[none] extra  
iteration 2760 start 640 byte 9291 is zero:  font: #[none] actors: #[none] extra: #[none] draw  
iteration 2760 start 640 byte 9305 is zero:  actors: #[none] extra: #[none] draw: #[none] on-c  
iteration 2760 start 640 byte 9321 is zero:  extra: #[none] draw: #[none] on-change*: func [wo  
iteration 2760 start 640 byte 9336 is zero:  draw: #[none] on-change*: func [word old new /loc  
iteration 2760 start 640 byte 9350 is zero:  on-change*: func [word old new /local srs same-pa  
iteration 2760 start 640 byte 11123 is zero:  on-deep-change*: func [owner word target action n 
iteration 2970 start 27 byte 9813 is zero:  state: [#[handle! 00230B84h] 0 #[none] #[false]]    
iteration 2970 start 27 byte 9862 is zero:  rate: #[none] edge: #[none] para: #[none] font: #   
iteration 2970 start 27 byte 9876 is zero:  edge: #[none] para: #[none] font: #[none] actors:   
iteration 2970 start 27 byte 9890 is zero:  para: #[none] font: #[none] actors: #[none] extra   
iteration 2970 start 27 byte 9904 is zero:  font: #[none] actors: #[none] extra: #[none] draw   
iteration 2970 start 27 byte 9918 is zero:  actors: #[none] extra: #[none] draw: #[none] on-c   
iteration 2970 start 27 byte 9934 is zero:  extra: #[none] draw: #[none] on-change*: func [wo  
iteration 2970 start 27 byte 9949 is zero:  draw: #[none] on-change*: func [word old new /loc  
iteration 2970 start 27 byte 9963 is zero:  on-change*: func [word old new /local srs same-pa  
iteration 2970 start 27 byte 11736 is zero:  on-deep-change*: func [owner word target action n 
iteration 3150 start 180 byte 9660 is zero:  state: [#[handle! 00230B84h] 0 #[none] #[false]]  
iteration 3150 start 180 byte 9709 is zero:  rate: #[none] edge: #[none] para: #[none] font: # 
iteration 3150 start 180 byte 9723 is zero:  edge: #[none] para: #[none] font: #[none] actors: 
iteration 3150 start 180 byte 9737 is zero:  para: #[none] font: #[none] actors: #[none] extra 
iteration 3150 start 180 byte 9751 is zero:  font: #[none] actors: #[none] extra: #[none] draw 
iteration 3150 start 180 byte 9765 is zero:  actors: #[none] extra: #[none] draw: #[none] on-c 
iteration 3150 start 180 byte 9781 is zero:  extra: #[none] draw: #[none] on-change*: func [wo 
iteration 3150 start 180 byte 9796 is zero:  draw: #[none] on-change*: func [word old new /loc 
iteration 3150 start 180 byte 9810 is zero:  on-change*: func [word old new /local srs same-pa 
iteration 3150 start 180 byte 11583 is zero:  on-deep-change*: func [owner word target action n
iteration 6390 start 795 byte 9045 is zero:  state: [#[handle! 00230B84h] 0 #[none] #[false]]  
iteration 6390 start 795 byte 9094 is zero:  rate: #[none] edge: #[none] para: #[none] font: # 
iteration 6390 start 795 byte 9108 is zero:  edge: #[none] para: #[none] font: #[none] actors: 
iteration 6390 start 795 byte 9122 is zero:  para: #[none] font: #[none] actors: #[none] extra 
iteration 6390 start 795 byte 9136 is zero:  font: #[none] actors: #[none] extra: #[none] draw 
iteration 6390 start 795 byte 9150 is zero:  actors: #[none] extra: #[none] draw: #[none] on-c 
iteration 6390 start 795 byte 9166 is zero:  extra: #[none] draw: #[none] on-change*: func [wo 
iteration 6390 start 795 byte 9181 is zero:  draw: #[none] on-change*: func [word old new /loc 
iteration 6390 start 795 byte 9195 is zero:  on-change*: func [word old new /local srs same-pa 
iteration 6390 start 795 byte 10968 is zero:  on-deep-change*: func [owner word target action n
iteration 7890 start 161 byte 2389 is zero:  pane: [make object! [type: 'base offset: 10x10 si 
iteration 7890 start 161 byte 9679 is zero:  state: [#[handle! 00230B84h] 0 #[none] #[false]]  
iteration 7890 start 161 byte 9728 is zero:  rate: #[none] edge: #[none] para: #[none] font: # 
iteration 7890 start 161 byte 9742 is zero:  edge: #[none] para: #[none] font: #[none] actors: 
iteration 7890 start 161 byte 9756 is zero:  para: #[none] font: #[none] actors: #[none] extra 
iteration 7890 start 161 byte 9770 is zero:  font: #[none] actors: #[none] extra: #[none] draw 
iteration 7890 start 161 byte 9784 is zero:  actors: #[none] extra: #[none] draw: #[none] on-c 
iteration 7890 start 161 byte 9800 is zero:  extra: #[none] draw: #[none] on-change*: func [wo 
iteration 7890 start 161 byte 9815 is zero:  draw: #[none] on-change*: func [word old new /loc 
iteration 7890 start 161 byte 9829 is zero:  on-change*: func [word old new /local srs same-pa 
iteration 7890 start 161 byte 11602 is zero:  on-deep-change*: func [owner word target action n
```


Comments:
--------------------------------------------------------------------------------

On 2020-02-21T22:09:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/4291#issuecomment-589858162>

    Turns out it's not always *zero* bytes. Here's another funny output it produced:
    ```
    >> str: {make object! [type: 'window offset: 665x408 size: 204x44 text: "Red: untitled" image: #[none] color: #[none] menu: #[none] data: #[none] enabled?: #[true] visible?: #[true] selected: #[none] flags: #[none] options: #[none] parent: make object! [type: 'screen offset: 0x0 size: 1536x864 text: #[none] image: #[none] color: #[none] menu: #[none] data: #[none] enabled?: #[true] visible?: #[true] selected: #[none] flags: #[none] options: #[none] parent: #[none] pane: [make object! [...]] state: [#[handle! 00000000h] 16384 #[none] [1]] rate: #[none] edge: #[none] para: #[none] font: #[none] actors: #[none] extra: #[none] draw: #[none] on-change*: func [word old new /local srs same-pane? f saved][if debug-info? self [print ["-- on-change event --" lf tab "face :" type lf tab "word :" word lf tab "old  :" type? :old lf tab "new  :" type? :new]] if all [word <> 'state word <> 'extra] [all [not empty? srs: system/reactivity/source srs/1 = self srs/2 = word set-quiet in self word old exit] if word = 'pane [if all [type = 'window object? :new new/type = 'window] [cause-error 'script 'bad-window []] same-pane?: all [block? :old block? :new same? head :old head :new] if all [not same-pane? block? :old not empty? old] [modify old 'owned none foreach f head old [f/parent: none stop-reactor/deep f if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]]] if all [not same-pane? type = 'tab-panel self/state] [link-tabs-to-parent/init self]] if all [not same-pane? any [series? :old object? :old]] [modify old 'owned none] unless any [same-pane? find [font para edge actors extra] word] [if any [series? :new object? :new] [modify new 'owned none modify new 'owned reduce [self word]]] if word = 'font [link-sub-to-parent self 'font old new] if word = 'para [link-sub-to-parent self 'para old new] if find [field text] type [if word = 'text [set-quiet 'data any [all [not empty? new attempt/safer [load new]] all [options options/default]]] if word = 'data [either data [if string? text [modify text 'owned none] set-quiet 'text form data modify text 'owned reduce [self 'text]] [clear text] saved: 'data word: 'text]] system/reactivity/check/only self any [saved word] either state [state/2: state/2 or (1 << ((index? in self word) - 1)) if all [state/1 system/view/auto-sync?] [show self]] [if type = 'rich-text [system/view/platform/update-view self]]]] on-deep-change*: func [owner word target action new index part][on-face-deep-change* owner word target action new index part state no]    ] pane: [make object! [type: 'check offset: 10x10 size: 96x24 text: #[none] image: #[none] color: #[none] menu: #[none] data: #[false] enabled?: #[true] visible?: #[true] selected: #[none] flags: #[none] options: [style: check vid-align: top at-offset: #[none]] parent: make object! [...] pane: #[none] state: [#[handle! 00BE0F2Ah] 0 #[none] #[false]] rate: #[none] edge: #[none] para: #[none] font: #[none] actors: #[none] extra: #[none] draw: #[none] on-change*: func [word old new /local srs same-pane? f saved][if debug-info? self [print ["-- on-change event --" lf tab "face :" type lf tab "word :" word lf tab "old  :" type? :old lf tab "new  :" type? :new]] if all [word <> 'state word <> 'extra] [all [not empty? srs: system/reactivity/source srs/1 = self srs/2 = word set-quiet in self word old exit] if word = 'pane [if all [type = 'window object? :new new/type = 'window] [cause-error 'script 'bad-window []] same-pane?: all [block? :old block? :new same? head :old head :new] if all [not same-pane? block? :old not empty? old] [modify old 'owned none foreach f head old [f/parent: none stop-reactor/deep f if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]]] if all [not same-pane? type = 'tab-panel self/state] [link-tabs-to-parent/init self]] if all [not same-pane? any [series? :old object? :old]] [modify old 'owned none] unless any [same-pane? find [font para edge actors extra] word] [if any [series? :new object? :new] [modify new 'owned none modify new 'owned reduce [self word]]] if word = 'font [link-sub-to-parent self 'font old new] if word = 'para [link-sub-to-parent self 'para old new] if find [field text] type [if word = 'text [set-quiet 'data any [all [not empty? new attempt/safer [load new]] all [options options/default]]] if word = 'data [either data [if string? text [modify text 'owned none] set-quiet 'text form data modify text 'owned reduce [self 'text]] [clear text] saved: 'data word: 'text]] system/reactivity/check/only self any [saved word] either state [state/2: state/2 or (1 << ((index? in self word) - 1)) if all [state/1 system/view/auto-sync?] [show self]] [if type = 'rich-text [system/view/platform/update-view self]]]] on-deep-change*: func [owner word target action new index part][on-face-deep-change* owner word target action new index part state no]    ] make object! [type: 'button offset: 116x9 size: 78x25 text: #[none] image: #[none] color: #[none] menu: #[none] data: #[none] enabled?: #[true] visible?: #[true] selected: #[none] flags: #[none] options: [style: button vid-align: top at-offset: #[none]] parent: make object! [...] pane: #[none] state: [#[handle! 00C10978h] 0 #[none] #[false]] rate: #[none] edge: #[none] para: #[none] font: #[none] actors: make object! [on-click: func [face [object!] event [event! none!]][c/data: none append list c/data]        ] extra: #[none] draw: #[none] on-change*: func [word old new /local srs same-pane? f saved][if debug-info? self [print ["-- on-change event --" lf tab "face :" type lf tab "word :" word lf tab "old  :" type? :old lf tab "new  :" type? :new]] if all [word <> 'state word <> 'extra] [all [not empty? srs: system/reactivity/source srs/1 = self srs/2 = word set-quiet in self word old exit] if word = 'pane [if all [type = 'window object? :new new/type = 'window] [cause-error 'script 'bad-window []] same-pane?: all [block? :old block? :new same? head :old head :new] if all [not same-pane? block? :old not empty? old] [modify old 'owned none foreach f head old [f/parent: none stop-reactor/deep f if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]]] if all [not same-pane? type = 'tab-panel self/state] [link-tabs-to-parent/init self]] if all [not same-pane? any [series? :old object? :old]] [modify old 'owned none] unless any [same-pane? find [font para edge actors extra] word] [if any [series? :new object? :new] [modify new 'owned none modify new 'owned reduce [self word]]] if word = 'font [link-sub-to-parent self 'font old new] if word = 'para [link-sub-to-parent self 'para old new] if find [field text] type [if word = 'text [set-quiet 'data any [all [not empty? new attempt/safer [load new]] all [options options/default]]] if word = 'data [either data [if string? text [modify text 'owned none] set-quiet 'text form data modify text 'owned reduce [self 'text]] [clear text] saved: 'data word: 'text]] system/reactivity/check/only self any [saved word] either state [state/2: state/2 or (1 << ((index? in self word) - 1)) if all [state/1 system/view/auto-sync?] [show self]] [if type = 'rich-text [system/view/platform/update-view self]]]] on-deep-change*: func [owner word target action new index part][on-face-deep-change* owner word target action new index part state no]    ]]hstate: [#[handle! 00621490h] 0 #[none] #[false]]hrate: #[none]hedge: #[none]hpara: #[none]hfont: #[none]hactors: #[none]hextra: #[none]hdraw: #[none]hon-change*: func [word old new /local srs same-pane? f saved][if debug-info? self [print ["-- on-change event --" lf tab "face :" type lf tab "word :" word lf tab "old  :" type? :old lf tab "new  :" type? :new]] if all [word <> 'state word <> 'extra] [all [not empty? srs: system/reactivity/source srs/1 = self srs/2 = word set-quiet in self word old exit] if word = 'pane [if all [type = 'window object? :new new/type = 'window] [cause-error 'script 'bad-window []] same-pane?: all [block? :old block? :new same? head :old head :new] if all [not same-pane? block? :old not empty? old] [modify old 'owned none foreach f head old [f/parent: none stop-reactor/deep f if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]]] if all [not same-pane? type = 'tab-panel self/state] [link-tabs-to-parent/init self]] if all [not same-pane? any [series? :old object? :old]] [modify old 'owned none] unless any [same-pane? find [font para edge actors extra] word] [if any [series? :new object? :new] [modify new 'owned none modify new 'owned reduce [self word]]] if word = 'font [link-sub-to-parent self 'font old new] if word = 'para [link-sub-to-parent self 'para old new] if find [field text] type [if word = 'text [set-quiet 'data any [all [not empty? new attempt/safer [load new]] all [options options/default]]] if word = 'data [either data [if string? text [modify text 'owned none] set-quiet 'text form data modify text 'owned reduce [self 'text]] [clear text] saved: 'data word: 'text]] system/reactivity/check/only self any [saved word] either state [state/2: state/2 or (1 << ((index? in self word) - 1)) if all [state/1 system/view/auto-sync?] [show self]] [if type = 'rich-text [system/view/platform/update-view self]]]]hon-deep-change*: func [owner word target action new index part][on-face-deep-change* owner word target action new index part state no]]}
    >> obj: do load str
    >> ? obj
    OBJ is an object! with the following words and values:
         type              word!         window
         offset            pair!         665x408
         size              pair!         204x44
         text              string!       "Red: untitled"
         image             none!         none
         color             none!         none
         menu              none!         none
         data              none!         none
         enabled?          logic!        true
         visible?          logic!        true
         selected          none!         none
         flags             none!         none
         options           none!         none
         parent            object!       [type offset size text image color menu data enabled? visi...
         pane              block!        length: 6  [make object! [type: 'check offset: 10x10 size:...
         hstate            block!        length: 4  [handle! 0 none false]
         hrate             none!         none
         hedge             none!         none
         hpara             none!         none
         hfont             none!         none
         hactors           none!         none
         hextra            none!         none
         hdraw             none!         none
         hon-change*       function!     [word old new /local srs same-pane? f saved]
         hon-deep-change*  function!     [owner word target action new index part]
    ```
    Note the `h` prefix from: `]hstate: [`, `]hrate: #[` and so on

--------------------------------------------------------------------------------

On 2020-03-06T21:24:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4291#issuecomment-595971356>

    Enters even more badass test (this one NEVER succeeds ☻), `2.red`:
    ```
    Red []
    
    img: make image! reduce [20x20 red]
    v: view/no-wait [
    	backdrop white  size 400x200
    	gb: group-box loose [b: button [gb/offset/x: 100] i: image img]
    ]
    until [not do-events/no-wait]
    random/seed now/precise
    invalid: charset [not 9 10 13 32 - 126]
    repeat iter 1000 [
    	write %v mold/all/flat v
    	p: bin: read/binary/seek %v start: random 1000
    	while [p: find/tail p invalid] [
    		print ["iteration" iter "start" start "byte" index? p "is invalid:" to string! copy/part back p 50]
    	]
    ]
    
    unview
    ```
    
    **To be run as `red --cli 2.red`.**
    
    A couple results:
    ```
    iteration 19 start 714 byte 11367 is invalid: ►state: [#[handle! 000D21D2h] 0 #[none] #[false]]►
    iteration 19 start 714 byte 11416 is invalid: ►rate: #[none]►edge: #[none]►para: #[none]►font: #
    iteration 19 start 714 byte 11430 is invalid: ►edge: #[none]►para: #[none]►font: #[none]►actors:
    iteration 19 start 714 byte 11444 is invalid: ►para: #[none]►font: #[none]►actors: #[none]►extra
    iteration 19 start 714 byte 11458 is invalid: ►font: #[none]►actors: #[none]►extra: #[none]►draw
    iteration 19 start 714 byte 11472 is invalid: ►actors: #[none]►extra: #[none]►draw: #[none]►on-c
    iteration 19 start 714 byte 11488 is invalid: ►extra: #[none]►draw: #[none]►on-change*: func [wo
    iteration 19 start 714 byte 11503 is invalid: ►draw: #[none]►on-change*: func [word old new /loc
    iteration 19 start 714 byte 11517 is invalid: ►on-change*: func [word old new /local srs same-pa
    iteration 19 start 714 byte 13268 is invalid: ►on-deep-change*: func [owner word target action n
    iteration 48 start 301 byte 11780 is invalid: àstate: [#[handle! 000D21D2h] 0 #[none] #[false]]
    *** Access Error: invalid UTF-8 encoding: #{A0737461}
    *** Where: to
    *** Stack:
    ```
    ```
    iteration 48 start 342 byte 7440 is invalid: ðcolor: #[none]ðmenu: #[none]ðdata: #[none]ðen
    *** Access Error: invalid UTF-8 encoding: #{B0636F6C}
    *** Where: to
    *** Stack:
    ```
    ```
    iteration 19 start 520 byte 7262 is invalid: ►color: #[none]►menu: #[none]►data: #[none]►enable
    iteration 19 start 520 byte 7277 is invalid: ►menu: #[none]►data: #[none]►enabled?: #[true]►vis
    iteration 19 start 520 byte 7291 is invalid: ►data: #[none]►enabled?: #[true]►visible?: #[true]
    iteration 19 start 520 byte 7305 is invalid: ►enabled?: #[true]►visible?: #[true]►selected: #[n
    iteration 19 start 520 byte 7323 is invalid: ►visible?: #[true]►selected: #[none]►flags: #[none
    iteration 19 start 520 byte 7341 is invalid: ►selected: #[none]►flags: #[none]►options: [style:
    iteration 19 start 520 byte 7359 is invalid: ►flags: #[none]►options: [style: image vid-align:
    iteration 19 start 520 byte 7374 is invalid: ►options: [style: image vid-align: top at-offset:
    iteration 19 start 520 byte 7432 is invalid: ►parent: make object! [...]►pane: #[none]►state: [
    iteration 19 start 520 byte 7459 is invalid: ►pane: #[none]►state: [#[handle! 001E21D2h] 0 #[no
    iteration 19 start 520 byte 7473 is invalid: ►state: [#[handle! 001E21D2h] 0 #[none] #[false]]►
    iteration 19 start 520 byte 7522 is invalid: ►rate: #[none]►edge: #[none]►para: #[none]►font: #
    iteration 19 start 520 byte 7536 is invalid: ►edge: #[none]►para: #[none]►font: #[none]►actors:
    iteration 19 start 520 byte 7550 is invalid: ►para: #[none]►font: #[none]►actors: #[none]►extra
    iteration 19 start 520 byte 7564 is invalid: ►font: #[none]►actors: #[none]►extra: #[none]►draw
    iteration 19 start 520 byte 7578 is invalid: ►actors: #[none]►extra: #[none]►draw: #[none]►on-c
    iteration 19 start 520 byte 7594 is invalid: ►extra: #[none]►draw: #[none]►on-change*: func [wo
    iteration 19 start 520 byte 7609 is invalid: ►draw: #[none]►on-change*: func [word old new /loc
    iteration 19 start 520 byte 7623 is invalid: ►on-change*: func [word old new /local srs same-pa
    iteration 19 start 520 byte 9374 is invalid: ►on-deep-change*: func [owner word target action n
    iteration 38 start 578 byte 7204 is invalid: ðcolor: #[none]ðmenu: #[none]ðdata: #[none]ðen
    *** Access Error: invalid UTF-8 encoding: #{B0636F6C}
    *** Where: to
    *** Stack:
    ```
    ```
    iteration 19 start 552 byte 7230 is invalid: color: #[none]menu: #[none]data: #[none]en
    *** Access Error: invalid UTF-8 encoding: #{80636F6C}
    *** Where: to
    *** Stack:
    ```
    
    By the way it crashes the aforementioned #4097 build just as easily, unless it's compiled with `-d` flag. So, no known cure for it.

--------------------------------------------------------------------------------

On 2020-03-07T00:10:18Z, qtxie, commented:
<https://github.com/red/red/issues/4291#issuecomment-596016084>

    Seems the GC corrupted the memory. If I turn off the GC with `recycle/off`, then no errors.


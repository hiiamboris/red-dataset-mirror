Red [
	title:   "Celestial clock"
	author:  @hiiamboris
	license: 'BSD-3
	needs:   view
	icon:    %clock.ico
]

#include %../../common/sift-locate.red

;; formula: https://www.had2know.org/society/sunrise-sunset-time-calculator-formula.html
half-day: func [day lat] [1:0 / 15 * arccosine (tangent 0 - lat) * (tangent 23.44 * sine day + 284 * 360 / 365)]

;; geometry
mark: [shape [move 0x-195 'arc 10x10 15 15 0 'arc -10x10 15 15 0 'arc -10x-10 15 15 0 'arc 10x-10 15 15 0 close]]
marks: compose append/dup [] [rotate 30 0x0 (mark)] 12
sec-arrow:  [rot-sec: rotate 0 0x0 shape [
	move 0x-190 'line 5x5
	'arc  -4x45  4 45 0
	'line -1x135 -1x-135
	'arc  -4x-45 4 45 0 close
]]
min-arrow:  [rot-min: rotate 0 0x0 shape [
	move 0x-175 'line 9x5
	'arc  -2x40  6 20  5
	'arc  -6x30  8 30  3
	'line -1x95 -1x-95
	'arc  -6x-30 8 30 -3
	'arc  -2x-40 6 20 -5 close
]]
hour-arrow: [rot-hour: rotate 0 0x0 shape [
	move 0x-140 'line 11x7
	'arc  3x88  15 50  4
	'arc -14x45  8 35  11
	'arc -14x-45 8 35 -11
	'arc  3x-88 15 50 -4 close
]]
shadow: [scale 1.01 1.01 translate (0.5, 1.5) fill-pen black]

;; background reflects time of day
t: 12:00
h: half-day now/yearday 30
timeline: compose [
	00:00         #000 #000
	(t - h - 1:0) #000 #205
	(t - h)       #FE8 #F45
	(t - h + 1:0) #EFF #DDF
	(t + h - 1:0) #EFF #DDF
	(t + h)       #FE8 #F45
	(t + h + 1:0) #000 #205
	(t + h + 2:0) #000 #000
	24:00         #000 #000
]
renew-background: function [time] [
	set     [t1: c1: c2: t2: c3: c4:] locate timeline [t1 - - | t2 .. t1 <= time time < t2]
	dt:     (time - t1) / (t2 - t1)
	grad/3: (hex-to-rgb c1) * (1 - dt) + ((hex-to-rgb c3) * dt)
	grad/5: (hex-to-rgb c2) * (1 - dt) + ((hex-to-rgb c4) * dt)
]

view/no-sync [
	title "Celestial clock" do [i: 0]
	box: box 400x400 draw compose/deep/only [
		grad: fill-pen linear black 0.0 black 1.0  0x0 0x400 box 0x0 400x400
		translate 200x200 line-join bevel pen off fill-pen white 
		push [(shadow) (marks     )] push (marks)		;-- every component's shadow is above another component
		push [(shadow) (hour-arrow)] push (hour-arrow)
		push [(shadow) (min-arrow )] push (min-arrow)
		push [(shadow) (sec-arrow )] push (sec-arrow)
	] rate 99 on-time [
		;; all movement is smooth as in analog clock
		ftime: to float! time: now/time/precise
		rot-sec/2:  ftime % 60 * 6
		rot-min/2:  ftime % 3600 / 10
		rot-hour/2: ftime / 120
		if 1 = i: i + 1 % 300 [renew-background time]	;-- once per 5 secs or so
		show box
	]
]

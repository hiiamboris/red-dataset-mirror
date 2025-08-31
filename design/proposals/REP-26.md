
#26: Windows FPS cap and what to do about it
================================================================================
Issue is open, was reported by hiiamboris and has 26 comment(s).
<https://github.com/red/REP/issues/26>

I've been poking around Windows animation lag and wanna share the results.
This only concerns animation achieved via the use of `rate` facet, and can likely be avoided via `do-events/no-wait` running in a custom loop.

## TLDR: Currently the FPS is capped at 65 and can only equal the integer fractions of 65: 65, 32, 21, 16, 13, 10 and lower. Moreover the frame lag is somewhat jumpy. This has to improve ☺

### Here's a typical correspondence plot between the desired `rate` facet of a face and the FPS it produces:
![](https://i.gyazo.com/f6d6fd90b9899e650fca6479c42fbc79.png)

From top to bottom is the measured FPS (0 to 100), from left to right is the value of `rate` facet (1 to 100). Gray is the desired line, red is what actually happens. Note also the strange artifact happening at rate ~60, resulting in ~37-38 FPS.

As you can see there are steps on the plot. The steps values are fractions of 65, which indicates that `on-time` event happens on the margins of `1000 / 65 = 15.4ms`.

Currently Red implements `on-time` via [`SetTimer` winapi call that pushes the WM_TIMER messages into the thread's window message queue.](https://github.com/red/red/blob/ffa4044bd9b0d83c3aa6e2ed0405cafd0de46c3f/modules/view/backends/windows/gui.reds#L2059). [`SetTimer` is theoretically capped at 100 FPS](https://msdn.microsoft.com/en-us/library/windows/desktop/ms644906%28v=vs.85%29.aspx):
> If uElapse is less than USER_TIMER_MINIMUM (0x0000000A), the timeout is set to USER_TIMER_MINIMUM

0xA = 10 ms = 100 fps.
On practice however, as shown before, even this is never reached.

### Moreover, here's some histograms of inter-frame time for a few `rate` values:
![](https://i.gyazo.com/e95e2149fc53c85bf4b2644ecf71ed3d.png)
`refdt` denotes a reference time between frames, which should ideally be obtained for a given rate. At rate 100 it is scattered between 10ms and 20ms.

![](https://i.gyazo.com/11681b333ae84f956cc123df506e0ec0.png)
At rate 66 - same scattering.

![](https://i.gyazo.com/a1b456a61e3ac35d22ef0316b28df344.png)
At rate 60 - where the artifact occurs - sometimes it happens to be quick enough to trigger the event in time, but more often skips it!

![](https://i.gyazo.com/85402583e492366933adeb548ed7bba7.png)
At rate 55 it already gets to 33 fps.

![](https://i.gyazo.com/baefc1bfeb24be0fdb8f4fe5dbb70a3a.png)
33 fps as requested.

![](https://i.gyazo.com/2ba03fbb9ca749d35ecd28ff05b2fbad.png)
At lower rates the spread becomes thinner.

## Solutions
I'll just draft a few ideas. Someone with better knowledge of Red internals, and multimedia programming expertise might provide better insights and be able to implement this.

### check+wait
I would myself give up the timers and go for a simpler algorithm:
- record all timers set in a block
- in the event loop: process window messages, check the timers, if nothing to do - wait 1ms, and over again...
- when one of the timers is about to hit (is expected to hit in less than 500us), it's actor should be called
- after that the timer check should continue where left off so that in case multiple timers are waiting, they are treated equally

With this approach both 1000 FPS and 100% CPU core load should be achievable, while it's also very simple. Also it's system-independent.

### multimedia timers
If timers are the way to go, there are better timers than `SetTimer`.
[`timeSetEvent`](https://msdn.microsoft.com/en-us/library/Dd757634%28v=VS.85%29.aspx) allows 1ms resolution timers to be set. When given a `TIME_CALLBACK_EVENT_PULSE` value it will pulse an event object.

[`MsgWaitForMultipleObjects`](https://docs.microsoft.com/en-us/windows/desktop/api/Winuser/nf-winuser-msgwaitformultipleobjects) may be used to wait for both: timer event and WM* events coming to the window, thus preserving the synchronous behavior of event operations. If a callback function was used instead of the system event, I expect `on-time` would be able to fire in the midst of other Red code being executed, undesirably.

Same 1000 FPS and 100% CPU core load should be achievable.

## Notes
The info was gathered on W7 x64. Users of other versions might provide more info by running these tests:

### measure the rate/fps curve
Change `pts` to choose how many points on the plot you want. Each takes 1 sec to measure.
```
Red []

pts: 50
stop: 0:0:1
print "measuring fps:"
data: collect [
	repeat i pts [
		rate: i * 100 / pts
		t0: now/time/precise
		fps: 0  view compose [base rate (rate) on-time [fps: fps + 1  if stop <= dt: now/time/precise - t0 [unview]]]
		print [rate "->" keep fps / stop/second]
	]
]

print "^/fractions of 65:"
repeat i 6 [probe 65 / i]

size: 400x200
view compose/deep [
	box (size) draw [
		pen white
		text 1x1 "0"
		text (size * 0x1 - 0x20) "100"
		line-width 2 pen red (collect [
			repeat i pts - 1 [
				keep reduce ['line
					as-pair  i * size/x / pts  data/:i * size/y / 100
					as-pair  i + 1 * size/x / pts  data/(i + 1) * size/y / 100
				]
			]
		])
		pen gray line 0x0 (size)
	]
]
```

### measure the time between frames
`period` controls how long to run the test
`rate` - obvious
`cell` - how many columns the histogram should be divided upon
```
Red []

period: 0:1:0
rate: 55
cells: 40
refdt: 1.0 / rate
now': does [now/precise/time]

dts: []
view compose [base rate (rate) on-created [t0: t1: now'] on-time [
	append dts (t2: now') - t1  t1: t2  if period <= (t2 - t0) [unview]
]]
probe dts

histo: append/dup [] 0 cells
maxdt: 0.0  mindt: 100.0
foreach dt dts [
	maxdt: max dt/second maxdt
	mindt: min dt/second mindt
]
mindt: 0.0  maxdt: refdt * 4
span: maxdt - mindt
foreach dt dts [
	i: 1 + to-integer dt/second - mindt / span * cells
	i: min i length? histo
	histo/:i: histo/:i + 1
]
probe histo
peak: last sort copy histo

size: 1000x300
cell: as-pair size/x / cells size/y
boxes: collect [
	foreach n histo [
		keep reduce ['box as-pair 1 n * cell/y / peak * -1 + cell/y cell 'translate cell * 1x0]
	]

	keep compose [reset-matrix pen green line-width 2 line (as-pair x: refdt - mindt / span * size/x 0) (as-pair x cell/y)]
	keep compose [text (as-pair x 0) (form reduce ["refdt =" form/part refdt 7 "sec"])]
	keep compose [pen red text 0x0 (form reduce ["rate =" rate "^/period =" period "^/peak counts =" peak])]

	i: 1
	keep [reset-matrix pen orange line-width 1 anti-alias on]
	ofs: as-pair 0 (cell/x - second (size-text/with system/view/screens/1 "0")) / 2
	foreach n histo [
		keep compose/deep [rotate -90 (cell / 2x1) [text (cell / 2x1 + ofs) (form/part i * span / cells 6)]]
		keep reduce ['translate cell * 1x0]
		i: i + 1
	]
]

view compose/deep [
	box (size) draw [
		pen off fill-pen teal (boxes)
	]
]
```




Comments:
--------------------------------------------------------------------------------

On 2018-07-20T18:41:06Z, toomasv, commented:
<https://github.com/red/REP/issues/26#issuecomment-406692152>

    Here are comparable stats from my W10:
    [![](http://vooglaid.ee/red/stats.png)](http://vooglaid.ee/red/stats-rate11.png)
    [![](http://vooglaid.ee/red/stats-rate100.png)](http://vooglaid.ee/red/stats-rate100.png)
    [![](http://vooglaid.ee/red/stats-rate66.png)](http://vooglaid.ee/red/stats-rate66.png)
    [![](http://vooglaid.ee/red/stats-rate60.png)](http://vooglaid.ee/red/stats-rate60.png)
    [![](http://vooglaid.ee/red/stats-rate55.png)](http://vooglaid.ee/red/stats-rate55.png)
    [![](http://vooglaid.ee/red/stats-rate33.png)](http://vooglaid.ee/red/stats-rate33.png)
    [![](http://vooglaid.ee/red/stats-rate11.png)](http://vooglaid.ee/red/stats-rate11.png)

--------------------------------------------------------------------------------

On 2018-07-20T22:52:05Z, nedzadarek, commented:
<https://github.com/red/REP/issues/26#issuecomment-406745809>

    It's late so I took only 1st test twice with waiting 1 and 4 seconds:
    https://gist.github.com/nedzadarek/b2a73ccb6832b89456967be30df605bf
    I'm on win 8.1 x64
    In my opinion FPS is capped at 2^N but starting at 2^3(8).  
    FPS <= 8 are precise. 
    8FPS to more or less 14FPS have lost 1FPS.    
    2^4 (16) starts the pattern and it last to ~20FPS
    => From 22 to 30 FPS - it's irregular pattern. We need to inspect it more.
    2^5 (32) & 2^6(64) are another patterns - FPS capped at 32 and 64 respectively. With those 2 checkpoints, you can see that (2^N)-4 to (2^N)-2 for N = 5 & 6 have sudden jump. I guess that sudden jump exist for 2^4(16) and 12 & 14 but I may overanalize it.   
    In my opinion the test should be more precise, especially for N<5. I mean count every FPS not every 2nd. 
    ps. for curiosity I tried 140 and it's still capped at 64.

--------------------------------------------------------------------------------

On 2018-07-21T05:51:38Z, hiiamboris, commented:
<https://github.com/red/REP/issues/26#issuecomment-406772980>

    Thanks, @nedzadarek ! Your data just follows that gathered by me and @toomasv. Never any progress at MS :)

--------------------------------------------------------------------------------

On 2018-12-14T01:35:00Z, qtxie, commented:
<https://github.com/red/REP/issues/26#issuecomment-447182623>

    > Note also the strange artifact happening at rate ~60, resulting in ~37-38 FPS
    
    IIRC, there is an issue about it. Yes. that's really strange as I cannot find any information online. No C/C++ (or other languages) programmers complain about it. So I suspect the problem is in our side, maybe we use the Timer API incorrectly?

--------------------------------------------------------------------------------

On 2018-12-15T00:15:48Z, hiiamboris, commented:
<https://github.com/red/REP/issues/26#issuecomment-447516384>

    @qtxie the problem is WM_TIMER, as in reality it occurs only once every 15.4ms, as I've shown above.

--------------------------------------------------------------------------------

On 2020-12-13T18:11:24Z, Oldes, commented:
<https://github.com/red/REP/issues/26#issuecomment-744046226>

    This may be useful: https://www.codeproject.com/Articles/1236/Timers-Tutorial

--------------------------------------------------------------------------------

On 2022-02-08T13:09:22Z, hiiamboris, commented:
<https://github.com/red/REP/issues/26#issuecomment-1032590691>

    Data from another device (laptop, W10 x64).
    
    | desired rate <br> / mode | 55 fps |
    |-|-|
    | better battery | ![](https://i.gyazo.com/65f55bd75c4db9ad37dc5edd927568b7.png) |
    | max performance | ![](https://i.gyazo.com/e35cd7251536c3a6971c7238b1c10317.png) |
    
    FPS curve: <img src=https://i.gyazo.com/ca6eaef5d4c99c94c4baa672ed9cebd0.png width=300></img>
    
    ---
    
    Now, on the same machine inside WSL2 running Ubuntu 20:
    
    FPS curve: <img src=https://i.gyazo.com/8738cfc813eee3c32be39b4519b7bad9.png width=300></img>
    
    Histograms:
    
    ![](https://i.gyazo.com/388aa9ace55975f02e204c67c225e605.png)
    ![](https://i.gyazo.com/2ea27300d3e3ca23aca1711acae1154f.png)
    (also tried in both battery modes - no difference)
    
    So, data suggests it's not a common hardware but an OS issue. Also, I didn't register any elevation in CPU usage from Ubuntu during tests, so claims about heavier battery drain may turn out to be baseless.

--------------------------------------------------------------------------------

On 2022-02-08T14:08:01Z, dockimbel, commented:
<https://github.com/red/REP/issues/26#issuecomment-1032647887>

    > @qtxie the problem is WM_TIMER, as in reality it occurs only once every 15.4ms, as I've shown above.
    
    Correct, we used WM_TIMER message as a temporary implementation, that is not the way to achieve regular higher-precision time events.

--------------------------------------------------------------------------------

On 2023-03-06T17:47:58Z, hiiamboris, commented:
<https://github.com/red/REP/issues/26#issuecomment-1456629424>

    Just a related note. We're not using [GetSystemTimePreciseAsFileTime](https://learn.microsoft.com/en-us/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtimepreciseasfiletime) in `now/precise`, because it's limited to W8+. But it boasts <1us precision, which would be nice to have. To support it we'll need to detect at runtime if it is supported by the OS and then load it conditionally and plug into `now`. Won't affect the FPS, but at least profiling precision.

--------------------------------------------------------------------------------

On 2023-03-07T15:00:09Z, dockimbel, commented:
<https://github.com/red/REP/issues/26#issuecomment-1458322421>

    > We're not using [GetSystemTimePreciseAsFileTime](https://learn.microsoft.com/en-us/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtimepreciseasfiletime) in now/precise, because it's limited to W8+.
    
    We've dropped support for Win7, so we can move to that API.
    
    EDIT: we [already use](https://github.com/red/red/blob/master/runtime/platform/win32.reds#L522) that API for `now/precise` (it's actually your own code @hiiamboris), but I wonder where that 100ns accuracy went?
    ```
    >> now/time/precise
    == 23:43:45.8046
    >> now/time/precise
    == 23:43:52.9451
    >> now/time/precise
    == 23:43:53.6194
    ```

--------------------------------------------------------------------------------

On 2023-03-07T22:50:06Z, hiiamboris, commented:
<https://github.com/red/REP/issues/26#issuecomment-1458987462>

    You misread
    `GetSystemTimeAsFileTime`
    as
    `GetSystemTimePreciseAsFileTime`
    
    As for W7, one thing is letting some things break, another - not being able to run the exe because some import is missing. I vote against that.

--------------------------------------------------------------------------------

On 2023-03-08T01:42:57Z, qtxie, commented:
<https://github.com/red/REP/issues/26#issuecomment-1459137783>

    > You misread `GetSystemTimeAsFileTime` as `GetSystemTimePreciseAsFileTime`
    > 
    > As for W7, one thing is letting some things break, another - not being able to run the exe because some import is missing. I vote against that.
    
    We can use `GetProcAddress` to load those functions.
    

--------------------------------------------------------------------------------

On 2023-03-08T12:09:42Z, dockimbel, commented:
<https://github.com/red/REP/issues/26#issuecomment-1460061894>

    You are welcome to send a PR modifying your own code to use `GetSystemTimePreciseAsFileTime()`.


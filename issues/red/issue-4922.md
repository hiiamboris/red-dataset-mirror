
#4922: Alignment of text in a field and a text-list are different
================================================================================
Issue is closed, was reported by Rebol2Red and has 2 comment(s).
<https://github.com/red/red/issues/4922>

Red 0.6.4 for Windows built 3-Jul-2021/13:08:38+02:00  commit #ef6ca5e

d: ["text1" "text2"]
view [
	f: field font-size 20 return
	t: text-list 100x38 font-size 20 data d return
]

![Knipsel](https://user-images.githubusercontent.com/18308797/124364089-88235780-dc3f-11eb-9755-ce996408a912.JPG)


Comments:
--------------------------------------------------------------------------------

On 2021-07-03T19:03:40Z, greggirwin, commented:
<https://github.com/red/red/issues/4922#issuecomment-873455338>

    This is the native control's behavior (unless you can find native apps and the APIs they use to that prove me wrong :^), so out of our control in the native UI. One of the reasons we're working on a non-native GUI system is so we have more control.


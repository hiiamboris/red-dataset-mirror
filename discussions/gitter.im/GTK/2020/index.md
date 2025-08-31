# Archived messages from: [gitter.im/red/GTK](/gitter.im/red/GTK/) from year: 2020

## Friday 3th January, 2020

rebolek

[10:28](#msg5e0f1764be6bab58cd66ab54)I have a problem where a face steals all events in a panel. To reproduce it:

[10:31](#msg5e0f18062af31b403d0ed2dd)1) clone repo https://gitlab.com/rebolek/red-styles/tree/scroller  
2\) checkout `scroller` branch  
3\) do `%demo/scroller.red`  
4\) click and drag anywhere on the panel. Horizontal scroller will start moving

If you remove the `dx` box from demo, it works fine. If you remove `react` block from `dx`, it works fine. On W10 it works fine.

## Friday 24th January, 2020

loziniak

[12:38](#msg5e2ae54b01914e3e043daaf0)Hi! Can anybody confirm this crashes on Linux/GTK, when run from `console-view` at the button click?

```
Red [Needs: 'View]

metrics-font: make font! []

styles: [
	panel-widget: [
		default-actor: on-down
		template: [
			type: 'panel
			pane: copy [] 
			actors: [
				on-create: func [face [object!] event [event! none!]] [
					append face/pane make face! [
						type: 'field
						font: (metrics-font)
						parent: face
					]
				]
			]
		]
	]

]

window: layout/styles [
	panel [
		panel-widget
		button "CLICK ME" [
			print "OK?"
			make metrics-font [style: 'bold] ; XXXXX
			print "OK!"
		]
	]
] styles

view/flags window ['resize]
```

With various error messages. The ones I noticed were:

```
free(): invalid pointer
[1]    5197 abort (core dumped) 

munmap_chunk(): invalid pointer
[1]    5138 abort (core dumped)

double free or corruption (out)
[1]    5270 abort (core dumped)

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

[12:41](#msg5e2ae5e9f196225bd64cd637)I mean confirm or deny :-)

[12:41](#msg5e2ae616f196225bd64cd708)`console-view` compiled from latest GTK branch.

[14:00](#msg5e2af87ca9b30639e2db3261)If I compile it, it's the same.

## Saturday 25th January, 2020

bitbegin

[09:25](#msg5e2c096c9ad22d5bd5d89c90)@loziniak confirmed

loziniak

[15:17](#msg5e2c5beeda04a624f47fd35a)@bitbegin thanks! filed a bug report.

## Sunday 26th January, 2020

gour

[20:02](#msg5e2df03e1a1c2739e304ff31)evening...for quite some time i was not following what's going on with red, but just read blog post saying that gtk-branch could be merged soon which is raising some enthusiasm that Red could be still used for our project, so wonder if after merging of gtk-branch Red could be potentially ready to develop desktop gui app on linux platform?

greggirwin

[21:16](#msg5e2e019901914e3e0453480d)Yes.

loziniak

[21:24](#msg5e2e0389183449313be219ed)I'm already doing a commercial project in Red/GTK. I find a lot of bugs along the way, but happily Red team is always ready to fix them.

gour

[22:19](#msg5e2e10701a1c2739e305d595)@loziniak that's encouraging to hear. do you find that Red's performance is ready for production if one wants better than dynamic languages like Python?

loziniak

[23:26](#msg5e2e20281a1c2739e3063c1c)If you care about performance, according to my knowledge, Red is not the best option, because i is not optimized. My points pro-Red were portability and cross-compilation, lightness, planned Android support.

greggirwin

[23:39](#msg5e2e2328f85dba0aab1e507e)@gour there's no way to generalize performance. Red is on par with other langs at the same level, but you can easily drop into Red/System if needed, giving up high level features for speed in key areas.

## Monday 27th January, 2020

gour

[05:56](#msg5e2e7b7a01914e3e045630c0)well, i do not expect to be on the level of C(++)/Rust, but wonder where does it belong, in general, comparable to other more popular languages? iow. for a desktop GUI app, I was/am considering languages like Racket/Pharo/Nim/Eiffel...

greggirwin

[06:28](#msg5e2e8302f85dba0aab20b0db)I don't know what you mean by "where does it belong". The langs you listed are all quite different. Red is not quite like any of them, but Red/System is very much C-like.

gour

[06:30](#msg5e2e837af196225bd665d4f1)@greggirwin i was thinking performance-wise

[06:32](#msg5e2e84144c3dae24f5f79bd4)@gour is moving discussion to main channel...

[09:38](#msg5e2eafa91a883c619618e6ba)do i understand correctly that Red should allow one to use the \*single* codebase (more or less) by taking advantage of GUI-DSL and target different platforms (Android, Linux, Mac, Windows) where native toolkit will be used on each OS?

rebolek

[09:56](#msg5e2eb3e334829272793779b0)@gour yes, you understand it right, that's the goal.

gour

[11:23](#msg5e2ec84d183449313be7479f)good

## Friday 7th February, 2020

rebolek

[09:38](#msg5e3d3007dc52c34ace4f4534)This code updates progress bar on Windows but not on GTK:

```
view [p: progress 0% button "go" [loop 10 [p/data: p/data + 10% wait 0.5]]]
```

bitbegin

[09:48](#msg5e3d3253f6945f41ef64354d)remove `wait`, it will work

rebolek

[09:51](#msg5e3d3325e8a83835591f037d)@bitbegin what do you mean by "work"? See this:

```
view [p: progress 0% button "go" [loop 100000 [p/data: p/data + 0.001%]]]
```

Click "go", there's some pause and then the progress bar is full. By "work" I mean that the progress bar will update for each step.

bitbegin

[09:54](#msg5e3d33d6fe0e6f74e9094937)i mean it's a bug about `wait`

rebolek

[09:55](#msg5e3d3403dc52c34ace4f547f)Hm.

## Saturday 8th February, 2020

bitbegin

[08:33](#msg5e3e725d62e9db4bf7867ca9)@rebolek `view [p: progress 0% button "go" [loop 10 [p/data: p/data + 10% loop 10 [system/view/platform/do-event-loop yes] wait 0.5]]]`

[08:35](#msg5e3e72be62e9db4bf7867d28)`view [p: progress 0% button "go" [loop 10 [p/data: p/data + 10% loop 10 [do-events/no-wait] wait 0.5]]]`

[08:37](#msg5e3e734963c15921f467b2ed)`wait` will block the event process, if we have `async wait`, this will work

pekr

[09:07](#msg5e3e7a4e63c15921f467c035)Will we get async wait with the upcoming 0.7 IO release?

## Saturday 15th February, 2020

blkstph\_gitlab

[18:22](#msg5e4836fa0c50da598c11e3d7)How close is the gtk version from completion? Trello has it at, I think, 104/120 for several months now.

greggirwin

[18:40](#msg5e483b080d257250fdebf925)There is no such thing as completion :^), but it's much more robust now, and approaching feature parity with other OSs. @bitbegin or @qtxie can say more.

blkstph\_gitlab

[19:40](#msg5e48491db401eb68a57d3efd)I see the bug fixes. Are most all the remaining 16 items awaiting checkoff actually done? Or are they all, perhaps, awaiting a single other piece which is creating a bottleneck? Obviously I'm anxious for the Linux release to be, at least, roughly on equal footing with Windows and Mac.

greggirwin

[21:19](#msg5e48604dae97f129757c2c23)There are PRs for a couple of them but, again, there's no such thing as done. What people need to do is look at the tickets and see if those things will affect them. If not, play. It may be that you find new issues to be addressed because \*you* need them, and we just don't know about them yet.

## Monday 17th February, 2020

qtxie

[13:28](#msg5e4a95130d257250fdf0a9e2)@blkstph\_gitlab It's not a completed list on Trello. Some items in the list are not avaliable on the other platforms. Also some features are not in the list. It's a task list for the community, anyone can add tasks on it.

## Tuesday 18th February, 2020

blkstph\_gitlab

[03:11](#msg5e4b55eab3023d5025f7edf4)@qtxie Cool!

bitbegin

[07:40](#msg5e4b9500b3023d5025f86e16)I accidentally deleted two items in trello, and these can't be retrieved. There are some issues(on github) can't be solved easily.

## Monday 24th February, 2020

proksi21

[12:19](#msg5e53bf3ffa9f20553b49fd72)Hey guys! How can I test Linux GUI?

rebolek

[12:19](#msg5e53bf6e1c4f1707f8c8c394)Hi! Install 32bit GTK and compile the GTK branch.

proksi21

[12:20](#msg5e53bf719aeef6523215a802)Seems like automated build for Linux doesn’t include any GUI stuff

rebolek

[12:20](#msg5e53bf97ef8d646099cb20b7)I have Linux GTK builds on my server, but that's unfortunately down, until I can get some time to fix it.

proksi21

[12:20](#msg5e53bfa9d7bb4e179c9ad58f)Oh, I got it. I thought it’s included already in red binary

rebolek

[12:21](#msg5e53bfad1ec15e021199cb2a)However building Red is really easy.

[12:21](#msg5e53bfc1901209179b379bbf)GTK is still not part of master branch.

[12:21](#msg5e53bfd05cd3836098c66548)That's why it isn't in official build.

proksi21

[12:21](#msg5e53bfe55cd3836098c6656f)Thanks!

## Tuesday 25th February, 2020

qtxie

[06:35](#msg5e54c0181c4f1707f8cb99d3)@proksi21 You can download it from here: http://static.red-lang.org/dl/branch/GTK/linux/red-latest

[06:38](#msg5e54c0ca901209179b3a656c)Actually you can download binaries for any branches. e.g. fast-lexer branch:  
http://static.red-lang.org/dl/branch/fast-lexer/linux/red-latest  
http://static.red-lang.org/dl/branch/fast-lexer/mac/red-latest  
http://static.red-lang.org/dl/branch/fast-lexer/win/red-latest.exe

[06:46](#msg5e54c2bd101adb4160c5892c)Here are the instructions for Ubuntu 64bit:

```
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libgtk-3-0:i386 libcanberra-gtk3-module:i386 libcurl4:i386
```

Use `libcurl3:i386` if no `libcurl4:i386`.

proksi21

[06:47](#msg5e54c3161ec15e02119c9c4d)@qtxie thanks!

GaryMiller

[10:31](#msg5e54f76f9aeef65232190db7)I tried the Windows red-latest.exe as shown above and got the following error.

PS C:\\Red&gt; .\\red-latest.exe  
Compiling Red GUI console...  
\*\** Loading Error: file access error: %lexer.reds  
\*\** in file: %/C/Red/interpreter.reds  
\*\** at line: 122

## Wednesday 26th February, 2020

qtxie

[06:24](#msg5e560f1f8f8af6553a04b22f)@GaryMiller Added missing files.

GaryMiller

[13:00](#msg5e566bdcef8d646099d287d8)Thanks!

[13:08](#msg5e566deb8f8af6553a05c349)@qtxie Just tried red-latest.exe after re-downloading. Runs fine by itself and brings up the console window

But when I run my large app. .\\red-latest.exe ZandraGUI.red (102,384 lines) I get the following message in my console window before my app starts to do anything.

\*\** Internal Error: stack overflow  
\*\** Where: function  
\*\** Stack:  
&gt;&gt;

qtxie

[13:17](#msg5e566fcc1c4f1707f8cff0b3)@GaryMiller Does the red.exe in master branch work fine with ZandraGUI.red?

GaryMiller

[13:21](#msg5e5670cd1c4f1707f8cff609)This one still runs fine .\\red-21feb20-3c68ef12.exe .\\ZandraGUI.red

Is that the same as master branch? If not is there a different link for that one?

qtxie

[13:24](#msg5e5671ab5cd3836098ce028f)Yes. It's the same.

greggirwin

[19:04](#msg5e56c152aaf81d4d547ba56a)@GaryMiller this is your app with the large number of parse rules, correct?

GaryMiller

[22:01](#msg5e56eaa365b2fe6ccff31f23)No, no parse rules at all. I had considered making a parse rule to reduce the volume of code but decided it might slow it down having to parse everything when load was taking 16 seconds already.

greggirwin

[22:04](#msg5e56eb8586e6ec2f5c5d3057)Ah, I misremembered what your big content is made of then.

GaryMiller

[22:29](#msg5e56f13386e6ec2f5c5d4236)The big content is 5 line patterns and responses and sometimes if/then logic that makes them slightly longer than 5 lines fed through Levenshtein Algorithm in a function call to find the pattern that has the shortest distance to the user's input. All the patterns are in a loop and the response for the closest pattern is displayed in the View interface and it waits until the user types another input and hits return at which time it re-enters the loop. It also passes the response string out to a small file and run a DOS based speech program to say the response out loud. There are over 20,000 patterns/ressponse which is what makes it so big. Hope when modules are done to be able to break it up a little but speedup of the program itself would have to wait for 64 bit or multi threading to be able to use more than one core at a time.

greggirwin

[22:31](#msg5e56f1b165b2fe6ccff33401):+1: If we keep on this topic, we should change rooms. I'm anxious to see how it goes once the fast lexer can load it successfully.

## Friday 27th March, 2020

loziniak

[19:11](#msg5e7e4ff263c1c130d5cca47e)GTK:

```
>> ? system/view/metrics/colors
SYSTEM/VIEW/METRICS/COLORS is a map! with the following words and values:
     area  tuple!        255.255.255
```

Windows:

```
>> ? system/view/metrics/colors
SYSTEM/VIEW/METRICS/COLORS is a map! with the following words and values:
     text       tuple!        72.136.211
     window     tuple!        0.0.0
     panel      tuple!        0.0.0
     tab-panel  tuple!        255.255.255
```

Is this something to fix?

## Saturday 4th April, 2020

loziniak

[07:31](#msg5e8837d32447ce17eba06698)

```
Red [File: %z-index.red Needs: View]

ccc: draw 20x20 [
	fill-pen red   box    0x0 20x20
	fill-pen green circle 10x10 10
]

view [
	base draw [
		image ccc 0x0 20x20
	]
]
```

[07:31](#msg5e8837d930ec2e5a2599089e)Results in Windows (Wine) and GTK:

[07:31](#msg5e8837e54d7bfa6d3146fa36)\[!\[obraz.png](https://files.gitter.im/red/GTK/lUuW/thumb/obraz.png)](https://files.gitter.im/red/GTK/lUuW/obraz.png)

[07:32](#msg5e88381a4d7bfa6d3146fa7a)In GTK `image!` is not displayed on `base` face.

bitbegin

[07:34](#msg5e88386a2447ce17eba06771)ok, will look it

loziniak

[07:34](#msg5e8838764d7bfa6d3146fb2c)Thanks!

## Thursday 9th April, 2020

rcqls

[08:29](#msg5e8edce55d148a0460f4edd7)@hiiamboris Nice to see that your red-view system test is greatly evolving. I have already checked your repo once few days ago. How hard is it to extend it to GTK (and macOS)? Is it possible that you provide the first steps or a bit of explanations in order to be completed by any other guys? As I already told you I believe that this kind of tool really matters in the Red development.

hiiamboris

[10:04](#msg5e8ef33f9316f34b8d8e140a)Hi ☻  
Can't tell how hard it will be to extend but I tried to make it as easy as I could, by separating OS-specific code from the rest. As I'm not versed in GTK and MacOS internals, some simplistic designs that I wrote may evolve a little, but that's okay, we just need to know what to aim for.

I will gladly provide all the info and explanations to anyone who would be willing to port it!

[10:07](#msg5e8ef3d4e24b4d6c44f7c1a1)Most unportable notions right now that I see, is how to close a window, and how to remove OS decorations (taskbar on Windows) from the screenshot. Also maybe how to click on a popup menu item, as that depends on how the OS displays that menu. These are the examples that would require totally different logic across platforms.

## Friday 10th April, 2020

bitbegin

[09:46](#msg5e90408138198d56a192b779)@loziniak your example work for me, can you test it again?

loziniak

[14:05](#msg5e907d1d38198d56a1935035)Yes. I still get the bottom picture from my screenshot.

## Thursday 23th April, 2020

loziniak

[14:38](#msg5ea1a8601e3d5e20633c34fd)Hi, probably found a debugging leftover:

```
% ~/prj/red/gtk/red-github/console-view__Gtk                 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> view []
n: 497
>> view []
n: 254
>>
```

[14:42](#msg5ea1a9693c03d3206261feb8)And positive news is that \[my z-index example ↑](https://gitter.im/red/GTK?at=5e8837d32447ce17eba06698) works ok!

[14:43](#msg5ea1a99594ac2758e30289e3)\[!\[obraz.png](https://files.gitter.im/red/GTK/vlAo/thumb/obraz.png)](https://files.gitter.im/red/GTK/vlAo/obraz.png)

## Friday 24th April, 2020

qtxie

[01:44](#msg5ea2446c568e5258e47e4989)@loziniak Thanks for testing. The debugging output is on purpose. We're working actively on GTK branch.

loziniak

[07:25](#msg5ea294783c03d32062649223)Noticed that. Fantastic work, thanks!

## Tuesday 28th April, 2020

ralfwenske

[03:59](#msg5ea7aa353a56be46689c0226)On Mint I downloaded from: http://static.red-lang.org/dl/branch/GTK/linux/red-latest  
After starting `red` in /usr/local/bin I get:

```
~$ red
Compiling compression library...
Compiling Red console...
*** Loading Error: file access error: %../image-utils.reds 
*** in file: %/home/ralf/datatypes/image.reds 
*** at line: 13
```

What do I need to do in preparation for this to work?

x8x

[12:35](#msg5ea8231a4d4c423e28b91b46)@ralfwenske There is a bug in latest nightly, a fix is coming soon.

## Wednesday 29th April, 2020

bitbegin

[02:04](#msg5ea8e0980b23797ec04d7581)@ralfwenske fixed, please retry...

ralfwenske

[04:09](#msg5ea8fe065cd4fe50a3d9b0ed)It works. Thank you @bitbegin @x8x

```
Red 0.6.4 for Linux built 29-Apr-2020/11:52:07+10:00 commit #7f9804b
```

xqlab

[09:10](#msg5ea944949f0c955d7d921b06)

```
console-2020-4-29-7002:11496): Gtk-WARNING **: 11:08:29.328: Theme parsing error: gtk.css:27:35: Junk at end of value for background-color

(console-2020-4-29-7002:11496): Gtk-WARNING **: 11:08:29.329: Theme parsing error: gtk.css:40:48: Junk at end of value for background-color

(console-2020-4-29-7002:11496): Gtk-WARNING **: 11:08:29.329: Theme parsing error: gtk.css:48:46: Junk at end of value for background-color

(console-2020-4-29-7002:11496): Gtk-WARNING **: 11:08:29.329: Theme parsing error: gtk.css:59:58: Junk at end of value for background-color

(console-2020-4-29-7002:11496): Gtk-WARNING **: 11:08:29.329: Theme parsing error: gtk.css:66:28: The :prelight pseudo-class is deprecated. Use :hover instead.

(console-2020-4-29-7002:11496): Gtk-WARNING **: 11:08:29.329: Theme parsing error: gtk.css:70:46: Junk at end of value for background-color

(console-2020-4-29-7002:11496): Gtk-WARNING **: 11:08:29.329: Theme parsing error: gtk.css:77:35: The :prelight pseudo-class is deprecated. Use :hover instead.

(console-2020-4-29-7002:11496): Gtk-WARNING **: 11:08:29.329: Theme parsing error: gtk.css:81:58: Junk at end of value for background-color
66
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> about
Red 0.6.4 for Linux built 29-Apr-2020/3:52:07+02:00 commit #7f9804b

>>
```

[09:11](#msg5ea944d77975db7ebfd1fa7d)How comes to these error messages with the same commit?

bitbegin

[10:06](#msg5ea951a3d898fe7a3754838e)seems your system's css style issue

[10:11](#msg5ea952db7a24ff01b0ee0236)did you set `$RED_GTK_STYLES` ?

ralfwenske

[11:02](#msg5ea95edb5cd4fe50a3dab91c)Is it intentional that a resizable window cannot be resized below the initial size on GTK? On macOS it can.

xqlab

[11:03](#msg5ea95ee67a24ff01b0ee2906)no. to what should I set it?

ralfwenske

[11:05](#msg5ea95f967975db7ebfd25373)? On macOS I can resize to any size I wish. On GTK I cannot make it smaller than the original size as declared in

```
layout ["title" 600x400 ….]
```

resizing using the cursor

qtxie

[12:59](#msg5ea97a487a24ff01b0ee76fd)&gt; Is it intentional that a resizable window cannot be resized below the initial size on GTK? On macOS it can.

@ralfwenske Yes. It's a limitation (or someone may call it a feature) on GTK. We may be able to use some tricks to workaround it.

[13:02](#msg5ea97afa5cd4fe50a3db10de)@xqlab What linux distro are you using? Seems the gtk.css on the system is too old. In other words, your GTK version is newer.

[13:07](#msg5ea97c1ef0377f1631576a0d)Do you have a `gtk.css` file in `~/.config/gtk-3.0/gtk.css`? The system default one (/usr/share/themes/Adwaita/gtk-3.0/gtk.css) should be no warning.

xqlab

[15:25](#msg5ea99c6d7a24ff01b0eee80b) @qtxie thanks. The new one is empty.)

## Thursday 30th April, 2020

qtxie

[03:39](#msg5eaa48620b23797ec051b6f7)@ralfwenske Fixed the window resize issue on GTK.

## Saturday 9th May, 2020

ralfwenske

[06:33](#msg5eb64eaf347bd61630653af4)Only saw this now. Thanks @qtxie

## Thursday 21st May, 2020

Shaping

[03:23](#msg5ec5f446c6541c05d8eec186)Is Red's GTK integration working well? Is it ready for production work?

rebolek

[05:46](#msg5ec6159a0fbf8b175884aa5b)I would say that it's comparable to macOS GUI. Both re not as complete as Windows one, but good for an alpha language :-)

## Saturday 30th May, 2020

rcqls

[12:17](#msg5ed24ec27da67d06fadf723b)For macOS users (above all on Catalina), I adapted an old project to launch `redGTK` inside docker container: \[red-gtk-macOS](https://github.com/rcqls/red-gtk-macOS).

[12:19](#msg5ed24f56f0b8a2053ac28ca1)@bitbegin Just to let you know that `code/Showcase/ballots/ballots.red` seems to be buggy for the two last windows when selecting.

bitbegin

[13:12](#msg5ed25bacf0b8a2053ac2a87f)ok

## Monday 1st June, 2020

bitbegin

[07:18](#msg5ed4abbf7da67d06fae49896)@rcqls seems work now

rcqls

[09:53](#msg5ed4d013ff7a920a72253208)@bitbegin Can’t see in the red:GTK branch which fix could solve a mouse drag issue.

bitbegin

[09:55](#msg5ed4d08d9da05a060a442e41)i just can't reproduce...

rcqls

[09:57](#msg5ed4d0f79da05a060a443052)in the 2 last windows when you select and move an object the circles move too and this is not supposed to be.

bitbegin

[10:02](#msg5ed4d2344412600ccd7ef9de)\[!\[ballots-drag.gif](https://files.gitter.im/red/GTK/SJP7/thumb/ballots-drag.gif)](https://files.gitter.im/red/GTK/SJP7/ballots-drag.gif)

rcqls

[10:39](#msg5ed4dae43ffa6106f1e983f9)Ok so I’ll retry!

[13:59](#msg5ed509cf9da05a060a44bbb4)@bitbegin Behavior different tested on `http://static.red-lang.org/dl/branch/GTK/linux/red-latest` running inside a docker container based on ubuntu i386. Maybe that’s the explanation...

[19:31](#msg5ed557ada91f120a6cd899b7)@bitbegin Same thing in another macOS with:

```
>> ? system/build/git
SYSTEM/BUILD/GIT is an object! with the following words and values:
     branch   string!       "GTK"
     tag      issue!        #v0.6.4
     ahead    integer!      2490
     date     date!         31-May-2020/14:55:54
     commit   issue!        #b7fa9e7b586fed8a325db5e009b1cc70...
     message  string!       "FIX: area's font can't be changed"
```

Could you please provide the console binary you use except if it is already `red-latest` from `http://static.red- lang.org/dl/branch/GTK/linux/red-latest`? In such a case, this would be an error coming from docker container but I never observe this weird behavior before.

## Tuesday 2nd June, 2020

bitbegin

[01:45](#msg5ed5af2eb101510b20304d19)@rcqls i tested the red-latest, it's also ok

[01:46](#msg5ed5af8cdaf4cf366ed6d2f2)\[linux-gui-console](https://files.gitter.im/red/GTK/SMHl/linux-gui-console)

qtxie

[02:52](#msg5ed5bed8f0b8a2053acaaf7e)@rcqls There are some fixes in the ballots demo on 0.6.5 branch. https://github.com/red/code/tree/0.6.5

rcqls

[05:31](#msg5ed5e415b101510b2030b9bb)@qtxie @bitbegin Same issue (dragging square move the target circles) in my docker container (with linux-gui-console too). It is really weird…. Maybe you could try it from your side on a macOS with a docker container (see, for instance, my red-gtk-macOS repo)

qtxie

[06:35](#msg5ed5f3219da05a060a46fab7)@rcqls Did you use the script from the 0.6.5 branch? https://github.com/red/code/tree/0.6.5

rcqls

[06:58](#msg5ed5f8872c49c45f5ab8db9d)@qtxie yes of course (`git checkout -b 0.6.5`)

qtxie

[07:01](#msg5ed5f94bb101510b2030e9f1)OK. I'll try the docker container. I can reproduce the issue with the script on master branch. It should be fixed on 0.6.5/

rcqls

[07:03](#msg5ed5f9cc4c9b0f060d3ba35b)That’s weird! I'll give a new try then in the `0.6.5` branch ...

qtxie

[07:05](#msg5ed5fa2b36dadc36f0d98699)The latest logs:

```
$ git log
commit 489dfe96d65001ada72f2956e6224703ced18b1a (HEAD -> 0.6.5, origin/0.6.5)
Author: Qingtian <xqtxyz@gmail.com>
Date:   Thu May 28 19:26:48 2020 -0700

    some fixes (#87)

    * FIX: perlin.red cannot be compiled.

    * FIX: disable Draw button while image is processing.

    * FEAT: minor improvements in ballots demo.

commit f090ae7688ff34fd765c5d58cbfb7158c6ac01b7
Author: Nenad Rakocevic <nr@red-lang.org>
Date:   Fri May 22 19:43:33 2020 +0200

    FEAT: upgrades lexer scripts after callback `type` argument change.

    `type` value is now a datatype! when a type name is passed.
```

rcqls

[07:16](#msg5ed5fcd3225dc25f54bec708)@qtxie Thanks, weirdly `git checkout -b 0.6.5` did not change the workspace because git log was not the one you show me. Now it’s ok after `git clone -b 0.6.5 https://github.com/red/code`.

[07:18](#msg5ed5fd5adaf4cf366ed779e5)BTW, `view-test.red` has a similar problem when dragging the robot image just below the book list, it can’t be dragged anymore. In the other places it is ok.

[07:24](#msg5ed5fea1a3a1b13679c06dea)So `base transparent` is the key to avoid dragging `circles`….

[09:31](#msg5ed61c69778fad0b133fe66b)Currently it seems normal the pseudo-issue of `view-test.red` since `camera` is a `base` element maybe without `transparent` option.

## Monday 15th June, 2020

blkstph\_gitlab

[21:48](#msg5ee7eccbef5c1c28f025bc55)What is the best way to get a gui version for linux mint? Last time I did a download from red-lang of the nightly, but it had no gui. Also, what is the hold up on the public release of the GTK version? I see it is slated for formal announcement some time after the fast lexer version, but I'm wondering why it isn't released first if it is ready first?

## Tuesday 16th June, 2020

greggirwin

[00:04](#msg5ee80c72ef5c1c28f0260d42)Have you tried building the GTK branch?

rebolek

[03:45](#msg5ee840422cf2f36eae60c15f)Building your own version is really the best way. It's easy.

blkstph\_gitlab

[14:17](#msg5ee8d4767a7f8d2d633b4b03)No, I've not tried building the GTK branch. I've always just downloaded the nightly per red-lang.org. I've not seen clear instructions on how to do that, nor what the advantages are if I am not developing the language. So I am correct the nightly builds include the gui for the other platforms but not for linux? What's the reason for that (I don't doubt there is reason)?

[14:29](#msg5ee8d73a7a7f8d2d633b53de)I see up above @qtxie says "You can download it from here: http://static.red-lang.org/dl/branch/GTK/linux/red-latest". I missed that.

bitbegin

[14:57](#msg5ee8ddcc7a7f8d2d633b672b)you can use rebol to build gui-console

[14:57](#msg5ee8ddcf5782a312780225ff)

```
rebol -qws red.r -r environment/console/GUI/gui-console.red
```

greggirwin

[18:05](#msg5ee909d930401c1f245e36dc)@blkstph\_gitlab the reason is that the GTK branch hasn't been merged yet. We don't do automated builds for all branches.

blkstph\_gitlab

[18:28](#msg5ee90f4b7b6da9126a9bae72)@greggirwin For my edification, is it not "merged yet" because the fast lexer (or something else) needs to be in place that isn't there yet? That would mean the design of the GTK branch is more sophisticated, I would guess....

greggirwin

[18:30](#msg5ee90fd2035dfa126124b532)They were two separate branches, but both large. You don't want to merge two big branches at once, and fast lexer was the priority.

## Monday 17th August, 2020

guaracy

[13:50](#msg5f3a8b2a5ccdf30c584fca5a)Coded for Windows in 2018. Must be reviewed but working on GTK now. :D

https://gist.github.com/guaracy/ac22eefc5c88ad8a2d948632ab5e0ebd

[13:51](#msg5f3a8b763e6ff00c289b9b1c)\[!\[frog.gif](https://files.gitter.im/5c31dc1cd73408ce4fb3c75a/Tyw9/thumb/frog.gif)](https://files.gitter.im/5c31dc1cd73408ce4fb3c75a/Tyw9/frog.gif)

rebolek

[14:25](#msg5f3a936122a7e979dbe86fc7)nice! :)

toomasv

[15:00](#msg5f3a9b795ccdf30c584ffe9c)@guaracy Lovely :frog:

ldci

[16:14](#msg5f3aaceee8eb3939a49a4020)@guaracy Nice and running with macOS

Respectech

[17:36](#msg5f3ac018ba27767ee5f8743d)@guaracy It somewhat reminds me of the style of animation used in the Road Runner cartoons. Fun!

## Thursday 20th August, 2020

mxdpeep

[11:34](#msg5f3e5fb6582470633b69f7d2)Docker Red + GTK: always ending like this &gt;

[11:34](#msg5f3e5fb8ee58011680bae1d7)/root/.red/console-2020-8-20-31013: symbol lookup error: /root/.red/console-2020-8-20-31013: undefined symbol: gtk\_menu\_popup\_at\_pointer

[11:35](#msg5f3e600833878e7e602f7c9b)Dockerfile line: RUN apt-get install -y --force-yes libcurl3 libc6:i386 libgtk-3-0:i386 libcanberra-gtk3-module:i386 libcurl3:i386 &amp;&amp; wget https://static.red-lang.org/dl/auto/linux/red-latest -O /bin/red &amp;&amp; chmod +x /bin/red &amp;&amp; echo "q" | /bin/red

qtxie

[12:08](#msg5f3e67be582470633b6a0d96)FYI, GTK branch has been merged into master.

vazub\_gitlab

[12:30](#msg5f3e6cf0ef8d4e243b4e345e)yay! good work, Qingtian!

loziniak

[14:12](#msg5f3e84dd07c30d132a9d3927)&lt;3

guaracy

[14:40](#msg5f3e8b45ef8d4e243b4e8e46)thanks qtxie

rcqls

[21:04](#msg5f3ee5455d0f8f244083c02f)@qtxie Excellent news!

qtxie

[22:59](#msg5f3f003fee58011680bcb778)Thanks all the contributors! Especially @rcqls and @bitbegin, you guys did most of work.👍

## Wednesday 26th August, 2020

guaracy

[14:12](#msg5f466dd236e6f709fd0374d0)Fail to compile to windows platform on linux

```
[guaracy@guaracy maze ]$ red -r -t windows win.red

-=== Red Compiler 0.6.4 ===- 

Compiling /home/guaracy/temp/red/maze/win.red ...
...compilation time : 1249 ms

Target: windows 

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : int-ptr! has no value 
*** Where: none 
*** Near:  [file-sum: make struct! int-ptr! [0]]
```

[14:15](#msg5f466e84ddc2d041c0cafdaa)

```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 2709 date: 25-Aug-2020/3:51:06 commit: #a2a22be4543f9d1a1b7a880f029cd27f75f8b72e ]
PLATFORM: [ name: "Linux Mint 19.3" OS: 'Linux arch: 'x86_64 version: 5.4.0 build: {#46~18.04.1-Ubuntu SMP Fri Jul 10 07:21:24 UTC 2020} ]
--------------------------------------------
>>
```

[14:21](#msg5f466fec89cf2d584b7941e8)Well, the win.exe was generated an worked on wine. Just the error message.

## Friday 9th October, 2020

rebred

[19:57](#msg5f80c08ea1c81d0a7ed11f75)I am using red-09oct20-ee607d5aa on a Mac and try to make 'frog' run on a Raspberry PI 4 - Raspberry Pi OS (32-bit)  
I compiled the .red file on the mac and moved to the PI

```
macmini:Desktop apple$ red.dms -c -t RPi frog.red

-=== Red Compiler 0.6.4 ===- 

Compiling test1.red ...
...compilation time : 1360 ms

Target: RPi 

Compiling to native code...
...compilation time : 44105 ms
...linking time     : 439 ms
...output file size : 2024204 bytes
...output file      : /Users/red/Desktop/frog
```

when I try to run it, it shows briefly a window and then quits  
On the Mac it runs fine

[19:58](#msg5f80c0d624a20801a8d8478a)\[frog.mp4](https://files.gitter.im/5c31dc1cd73408ce4fb3c75a/lXB8/frog.mp4)

9214

[20:01](#msg5f80c17e43fa5d19e6fdfea0)@rebred compile in release mode (`-r` flag) and use `RPi-GTK` target, assuming that you have the necessary GTK dependencies installed on your Pi. You can use \[this](https://github.com/red/red/wiki/%5BNOTE%5D-Linux-GTK-dependencies) list as a starting point.

rebred

[20:10](#msg5f80c3d1cdb04d1ea0716ac5)

```
macmini:Desktop apple$ red.dms -r -t RPi-GTK frog.red

-=== Red Compiler 0.6.4 ===- 

Compiling /usr/local/var/www/frog.red ...
...compilation time : 1434 ms

Target: RPi-GTK 

Compiling to native code...
...compilation time : 44035 ms
...linking time     : 440 ms
...output file size : 2023508 bytes
...output file      : /Users/red/Desktop/frog
```

[20:11](#msg5f80c3e06e1aa94de7ec6675)@9214 same problem, it doesn't run

9214

[20:13](#msg5f80c44c3775d02b5afdd325)@rebred then try to compile with `-r -d` flags and launch the binary from system shell, then paste the output (if any) here.

rebred

[20:19](#msg5f80c5df78d7f20c9f9cdd4e)@9214

```
/usr/local/bin/red.dms -r -d RPi-GTK /usr/local/var/www/frog.red

Cannot access source file: /Users/apple/Desktop/RPi-GTK
```

9214

[20:20](#msg5f80c60d02e81701b0102699)@rebred

```
/usr/local/bin/red.dms -r -d -t RPi-GTK /usr/local/var/www/frog.red
```

rebred

[20:24](#msg5f80c6e424a20801a8d85939)

```
macmini:Desktop apple$ red.dms -r -d -t RPi-GTK test1.red

-=== Red Compiler 0.6.4 ===- 

Compiling test1.red ...
...compilation time : 1361 ms

Target: RPi-GTK 

Compiling to native code...
...compilation time : 48854 ms
...linking time     : 4805 ms
...output file size : 4873596 bytes
...output file      : /Users/apple/Desktop/test1
```

[20:25](#msg5f80c72260efef1ec36f9138)@9214

```
pi@raspberrypi:~/Desktop $ ./test1 
./test1: error while loading shared libraries: libcrypto.so.1.0.2: cannot open shared object file: No such file or directory
```

9214

[20:28](#msg5f80c7e76e1aa94de7ec726b)@rebred great! You can start by resolving the required dependencies (listed on the \[download](https://www.red-lang.org/p/download.html) page, plus the GTK deps. that I posted a few messages above, or simply run `ldd` and see which shared libraries are linked).

rebred

[20:34](#msg5f80c93f99e1ab4dd1ec810b)@9214 so we can't yet distribute a RED binary file to Raspberry PI users. We need to tell them "in order to run our software you will need to download the following libraries and install and configure etc."

9214

[20:37](#msg5f80ca1f1cbba72b63cddc64)@rebred programming language toolchains pressupose a set of dependencies that are required to get them up and running. Red tries to minimizes their number as much as possible, but e.g. if you want to use View with GTK backend, then you need GTK libraries installed. Some of the dependencies (like `libc` or `libcurl`) are temporary. That doesn't mean that Red cannot be distributed.

[20:40](#msg5f80cad243fa5d19e6fe1749)RPi OS is Debian-based, so installing packages on it shouldn't be that much of a hurdle.

rebred

[20:46](#msg5f80cc1824a20801a8d8650b)@9214  
I installed 'Raspberry Pi OS (32-bit)' that is based on Debian Buster

I followed the following instructions:

```
If you are using a Debian 7+ or Ubuntu 13.10+ version, you should use libcurl3 with multiarch:
    dpkg --add-architecture i386
    apt-get update
    apt-get install libc6:i386 libcurl3:i386
```

then I tried to install libc6:i386 libcurl3:i386 and I get

```
pi@raspberrypi:~/Desktop $ sudo apt-get install libc6:i386 libcurl4:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Package libc6:i386 is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source
However the following packages replace it:
  libdb1-compat tzdata

Package libcurl4:i386 is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

E: Package 'libc6:i386' has no installation candidate
E: Package 'libcurl4:i386' has no installation candidate
```

9214

[20:50](#msg5f80cd1e07361f0cc63ff1f0)@rebred if you have 32-bit distro, why are you using multiarch?

```
sudo apt-get install libc6 libcurl4
```

rebred

[21:06](#msg5f80d0f2aacbfa2248c9d5e0)@9214

```
pi@raspberrypi:~/Desktop $ ./frog 

(frog:8982): GLib-GObject-CRITICAL **: 22:06:08.722: g_value_set_boolean: assertion 'G_VALUE_HOLDS_BOOLEAN (value)' failed

*** Runtime Error 1: access violation
Segmentation fault
```

9214

[21:09](#msg5f80d184dc95072254c7ad16)Thanks @rebred, that's something we can look in. Could you please try to narrow down that frog snippet to a minimal example, or pinpoint the cause of the crash?

[21:21](#msg5f80d45399e1ab4dd1ec9aed)You can simplify the task by cross-compiling the Red console itself, and then running the script in the REPL.

## Sunday 15th November, 2020

tinulac-leinad

[17:34](#msg5fb1668974152347c23733a3)hi, something wrong in this small code or refinements not implemented for request-file ?  
`request-file/title/file/filter "Select ABC Files " "./data/sources" ["ABC Files " "*.abc"]`  
Thanks for help.

## Monday 16th November, 2020

endo64

[16:46](#msg5fb2acda2a60f731f75b7b14)Should `"./data/sources"` be `%./data/sources` ?

tinulac-leinad

[20:35](#msg5fb2e29e06fa0513ddb89584)@endo64 Yes but this is not the source of the problem. I can select files from the dialog but the title, the predefined path and the filter are not set.

```
>> request-file/title/file/filter "Select ABC Files " "%./dn-abc-tools/data/sources" ["ABC Files " "*.abc"]
GLib-GIO-Message: 19:04:50.528: Using the 'memory' GSettings backend.  Your settings will not be saved or shared with other applications.
```

qtxie

[23:05](#msg5fb305d08d286f2076b36661)@bitbegin Does those refinements be implemented on GTK backend?

## Tuesday 17th November, 2020

bitbegin

[00:24](#msg5fb31827b4283c208a6c7384)should be

tinulac-leinad

[12:26](#msg5fb3c191d5a5a635f2c7dbe6)@qtxie @bitbegin If someone ca jsut test the dialog box with is refinements, I hope that we ca confirm if it is a "lack " in the Gtk prot of only a problem on my system ?

bitbegin

[13:23](#msg5fb3cee02a60f731f75e73b9)@tinulac-leinad https://github.com/red/red/pull/4725

## Thursday 19th November, 2020

tinulac-leinad

[00:10](#msg5fb5b7ef2a3544071533c45f)@bitbegin Thanks it work now ;)

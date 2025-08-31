# Archived messages from: [gitter.im/red/bugs](/gitter.im/red/bugs/) from year: 2023

## Tuesday 3th January, 2023

mikeyaunish

[15:26](#msg63b4492eff1fd121b328edd5)Just checking to confirm this.  
Using: Red 0.6.4 for Windows built 29-Dec-2022/13:00:14-07:00 commit #6af0b70  
and running the following:

```
view [
    vid-code: area 300x200 {
        tab-panel1: tab-panel 
            "tab-panel1" [
                "Tab-A" [tab-a-btn1: button "tab-A-btn1"] 
                "Tab-B" [tab-b-btn1: button "tab-B-btn1"]
            ]    
    }
    output-panel: panel 200x200 gray
    button "Refresh Panel" [
        output-panel/pane: layout/only load vid-code/text
    ]
]
```

Then press "Refresh Panel" around 15-20 times will crash Red.  
Last version of Red that I have that won't crash is: Red 0.6.4 for Windows built 2-Jun-2022/0:50:38-07:00 commit #671dae6

luce80

[15:33](#msg63b44ad6410c633d4809d47b)Another that won't crash is: Red 0.6.4 for Windows built 4-Jul-2022/9:48:56+01:00 commit #ccc7e08

hiiamboris

[15:42](#msg63b44ce1378d512c18441d41)Confirmed, good catch @mikeyaunish !

[15:42](#msg63b44cef63c9fc72d30d8f6f)Stack traces seem to vary from time to time.

[15:43](#msg63b44d05ff1fd121b328f5a3)`red+view-debug-master-2022-09-09-2ba8188.exe` and before doesn't crash  
`red+view-debug-master-2022-09-11-85fa7e7.exe` and after all crashing

mikeyaunish

[15:57](#msg63b4508151d2482e91eda5a8)Is this a open issue or should I open a problem @hiiamboris ?

hiiamboris

[15:59](#msg63b450cdff1fd121b328ff9b)Open it please

mikeyaunish

[16:03](#msg63b451bbff1fd121b3290234)OK

hiiamboris

[16:31](#msg63b4584fff1fd121b32910d9)You omitted the `view [` part @mikeyaunish

mikeyaunish

[22:10](#msg63b4a7d1fb195421bd699964)Oops. looks like markdown ate it. Fixed now.

hiiamboris

[22:48](#msg63b4b0c20dba3574235b27b2)thanks :+1:

## Thursday 5th January, 2023

dsunanda

[19:54](#msg63b72ae48f8df4262adb19f5)SORT/COMPARE does not seem to work if it has /LOCAL words. Is this a known problem?

hiiamboris

[20:05](#msg63b72d7eff1fd121b32e8682)no.. have an example?

[20:07](#msg63b72df2ff1fd121b32e8753)looks ok:

```
>> sort/compare [7 3 4 9 8 1 6 4 3] function [a b] [x: 0 a < b]
== [1 3 3 4 4 6 7 8 9]
```

dsunanda

[20:12](#msg63b72f24d8678973f99acfac)Try with or without either of the PRINT lines to get different results .... including the occasional console crash:

```
o1: make object! [x: 1 y: 90]
o2: make object! [x: 2 y: 1]
o3: make object! [x: 2 y: 2]

data: reduce [o1 o2 o3]

sort/compare data func [a b /local ra rb][
   ra: a/x + a/y
   print [ra a/x a/y]
   rb: b/x + b/y
   print [rb b/x b/y]
   return ra < rb
   ]
 probe data
```

At least, that is what I am seeing (Windows, couple of weeks old release)

hiiamboris

[20:18](#msg63b730b0378d512c1849cf7b)interesting

[20:20](#msg63b73108410c633d480f9337)this reminds me of https://github.com/red/red/issues/4543

[20:21](#msg63b731568f8df4262adb2564)and https://github.com/red/red/issues/4854

[20:22](#msg63b7318b7de82d261614a06b)please make an issue

dsunanda

[20:58](#msg63b739fcff1fd121b32e9dbe)@hiiamboris Thanks. It's 5265

hiiamboris

[21:01](#msg63b73a91c9591d20d38bcbc4):+1:

dsunanda

[21:11](#msg63b73cfc63c9fc72d3134465).Thanks for adding error examples....I did not bother to do so as I have seen such a large range of strange errors (including PRINT no longer doing an implicit REDUCE on its block).

hiiamboris

[21:15](#msg63b73e087de82d261614b73c)we will be looking at this issue years ahead, maybe trying with a different Red build, so it's important to capture the behavior

## Sunday 8th January, 2023

dsunanda

[11:42](#msg63baac4051d2482e91fa2fda)@qtxie Thanks for the quick fix on 5265 - it seems to work well.

[11:45](#msg63baacc340557a3d5c6705e7)In testing the fix, I found it is possible to break SORT/COMPARE with a refinement in the function spec. Don't know if this should be a new issue, or is part of the previous one:

```
o1: make object! [x: 1 y: 90]
o2: make object! [x: 2 y: 1]
o3: make object! [x: 2 y: 2]
data: random reduce [o1 o2 o3 o1 o1 o2 o3 o2]

s-func: func [a b /x /local ra rb][
   ra: a/x + a/y
   print [ra a/x a/y]
   rb: b/x + b/y
  print [rb b/x b/y]
   return ra < rb
   ]
sort/compare data :s-func

*** Script Error: rb is missing its value argument
*** Where: rb
*** Near : return ra < rb
```

hiiamboris

[11:51](#msg63baae48c9591d20d392a86a)the fix counts locals, so it misses refinements

[11:51](#msg63baae580cd40c2e89c76719)add this info to the issue pls

dsunanda

[12:24](#msg63bab6167de82d26161ba38e)@hiiamboris Done - thanks! (I have never had a usage-case for refinements in sort functions....Just stumbled on this edge case)

hiiamboris

[12:34](#msg63bab863c4fec572d675d211):+1:

## Saturday 14th January, 2023

hiiamboris

[16:17](#msg63c2d5a90cd40c2e89d676ca)R2:

```
>> sort [a /a]
== [a /a]
>> sort/reverse [a /a]
== [/a a]
>> sort/case [a /a]
== [a /a]
>> sort/case/reverse [a /a]
== [/a a]
```

Red:

```
>> sort [a /a]
== [a /a]
>> sort/reverse [a /a]
== [a /a]
>> sort/case [a /a]
== [a /a]
>> sort/case/reverse [a /a]
== [a /a]
```

@dockimbel bug or feature? ;)

luce80

[16:32](#msg63c2d90eff1fd121b3446484)Script A:

```
Red [] catch [do %scriptB.red]
```

Script B:

```
Red [] throw 1
```

And then:

```
*** Throw Error: no catch for throw: 1
*** Where: transcode
*** Near : do %scriptB.red
*** Stack: probe do-file load
```

Not sure it's a bug but just to mention.

hiiamboris

[16:36](#msg63c2da040cd40c2e89d67e4c)no, it's not: `do` contains an implicit `catch`, so you need to catch your throws within the script that throws them (or resort to `do/expand load %scriptB.red`)

luce80

[16:42](#msg63c2db6d3b37dd2c117ba9e0)Wow! this is quite deep, thanks for the trick !

hiiamboris

[16:43](#msg63c2dba0410c633d4825b347)but you're onto something here... because `halt` works somehow... ;)

[16:53](#msg63c2de043b37dd2c117baef0)I've reported the discrepancy https://github.com/red/red/issues/5267

[17:13](#msg63c2e2a7410c633d4825bf31)after studying the code of `do*` native I've come to agree that what you reported is also a bug, since code intends to `re-throw` catches (but for some reason they aren't caught)

[17:14](#msg63c2e2fafb195421bd84836a)https://github.com/red/red/blob/c7ceccff1e0022b22e35f25abdbac40940264c9c/runtime/natives.reds#L627-L641

## Thursday 19th January, 2023

zwortex

[16:36](#msg63c9717c6f6a0b74194125cb)Good day all.  
I am trying to reactive a script I've written in Red some time ago. and I bumped into an error. It shows

```
*** Script Error: pick does not allow none! for its index argument
*** Where: pick
*** Near : all [word = 'selected block? data find [] ]
*** Stack: do-file
```

Not very helpful. However, I tracked the error down to the face text-list. I try to unselect the selected row using face/selected: none. It used to work as documented : « selected  
Index of selected string or none value if no selection (read/write) ». see  
https://github.com/red/docs/blob/master/en/view.adoc#text-list  
Is it a bug, or a documentation defect ? Regards.

```
view [
   l: text-list 100x100 data ["One" "Two"]
   with [ selected: 1 ]
   button {click me to get the error} [ l/selected: none ]
   button {works with 0} [ l/selected: 0 ]
   button {works with 2} [ l/selected: 2 ]
   button {silent with -1} [ l/selected: -1 ]
   button {silent with 3} [ l/selected: 3 ]
]
```

hiiamboris

[16:40](#msg63c972687bcbfb74311e37de)Hey, long time no see @zwortex :)

[16:40](#msg63c97280d86fd34ee5621b50)Due to your luck (or lack of) it was fixed yesterday. So just update :)

[16:41](#msg63c972c3f2b13e5e50f9e0ba)https://github.com/red/red/issues/5260

zwortex

[16:42](#msg63c97307b1f383475e0d3b51)That is merry christmas then ! Thank you all for your kind support.

hiiamboris

[16:43](#msg63c97341726b415e594d265c):+1:

## Monday 23th January, 2023

hiiamboris

[19:38](#msg63cee23649431d637012b8da)If I press Alt+Enter in Red GUI console it blinks, may lose focus, but if I switch from it and try to run `mpv` with direct3d video output it says "unable to init video output" and terminates. Until I get back to GUI console and press Alt+Enter again, or quit it.

[19:38](#msg63cee24ab5e8a462767fa652)Worth an issue?

## Monday 6th February, 2023

mikeyaunish

[21:30](#msg63e1717f511fff631f6b1a07)\[!\[console-truncate.gif](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/5j08/thumb/console-truncate.gif)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/5j08/console-truncate.gif)

[21:31](#msg63e171b94ecd45446ec99147)Is anyone else getting truncated errors to the console? If I open the console and enter:

```
view layout [ button "Error text" [ print xyz ]]
```

. Then click on the 'Error text' button. When the output gets to the bottom of the console it is truncated like this:

ne1uno

[21:46](#msg63e17532195b0f6482860a19)no auto scroll, seeing in win10

hiiamboris

[21:56](#msg63e17773480b726318b1868e)for me it scrolls on every second click

[21:56](#msg63e17780747c6938e1065f82)!\[](https://i.gyazo.com/5768ce9f75e6b7ff77e85ac086c08b5a.gif)

[21:57](#msg63e177d4f4ead81aa363b1d0)I suggest commenting on https://github.com/red/red/issues/5250

## Tuesday 7th February, 2023

mikeyaunish

[14:04](#msg63e25a604a6a70544c8eda4c)Will do

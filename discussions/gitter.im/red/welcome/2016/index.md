# Archived messages from: [gitter.im/red/red/welcome](/gitter.im/red/red/welcome/) from year: 2016

## Tuesday 5th April, 2016

dockimbel

[09:42](#msg5703889fd39de41b4960a8c0)Welcome to Red programming language chat room for newcomers. Feel free to ask any question related to Red here.

## Wednesday 6th April, 2016

RnBrgn

[00:19](#msg570456098e22137808cc577a)Hello, couple of questions..

Going through some the examples at http://business-programming.com/  
I had an issue creating a block of data when an item in my list had a dollar sign and it wasn't quoted. accounts: \[ "Bob" $500.00 Jan-21-2016] The error red "get does not allow integer." The fix was easy, removing dollar sign or putting quotes around "$500.00". The error did not point out which item in the list was incorrect, which would have been nice.  
Is the example wrong for this tutorial, which didn't have the dollar value quoted or is Red different from Rebol that it needs to have it quoted?

Second question: After seeing this error, is there a way to automatically quote all items in a list at creation time for you? Accounts: \[ Bob $500.00 Jan-21-2-16]

Lastly, I have not been able to get the functions "alert" and "rejoin" to work. Are they not implemented in Red yet?

Taking advantage of the new Red Welcome Room :) Thanks

dockimbel

[03:52](#msg5704880f488f66e00debe71c)@RnBrgn That tutorial you linked is specific to Rebol, not all the features used in those scripts are implemented \*yet* in Red, like the `money!` datatype.

[03:56](#msg570488d53a2aa3ca5a831926)@RnBrgn For your second question: you cannot input values with invalid or unsupported syntax, so `[ Bob $500.00 Jan-21-2-16]` will generate a syntax error on input.

[03:57](#msg5704893fab6502a50341b4e7)@RnBrgn For processing a block of values and changing each of them to a string, you can do:

```
red>> list: [Bob 500 Jan-21-2-16]
== [Bob 500 Jan-21-2-16]
red>> forall list [list/1: form list/1]
== "Jan-21-2-16"
red>> list
== ["Bob" "500" "Jan-21-2-16"]
```

[04:02](#msg57048a723a2aa3ca5a83192f)\*Lastly, I have not been able to get the functions "alert" and "rejoin" to work. Are they not implemented in Red yet?*

Not implemented yet, but they are trivial to add to your code if you need them:

```
rejoin: function [
    "Reduces and joins a block of values."
    block [block!] "Values to reduce and join"
][
    if empty? block: reduce block [return block]
    append either series? block/1 [copy block/1][form block/1] next block
]

alert: function [
    "Displays an alert message"
    msg [string!]  "Message to display"
][
	view/flags [
		t: text msg center return
		b: button "ok" [unview]
		do [b/offset/x: t/offset/x + (t/size/x - b/size/x / 2)]
	][modal popup]
]
```

iArnold

[06:52](#msg5704b23c8e22137808cc6714)To all newcomers wondering what strange datetype is used above. Jan-21-2-16 is a typo, the date started as Jan-21-2016.

[06:54](#msg5704b2bef7d63d897f23af5d)The rejoin code is also available through the wiki page: https://github.com/red/red/wiki/mezzanines

[07:00](#msg5704b425ad40c3877fa9abe5)I added the alert window example by Doc now.

Phryxe

[11:35](#msg5704f47fdc7a73775697bb01)If I want to read a large file line by line I suppose I have to use `open/lines` (ports isn't implemented yet) as `read/lines` loads the entire file at once!?

RenaudG

[11:36](#msg5704f4ac5386a9152533d054)Yes, exactly

Phryxe

[11:36](#msg5704f4bbf7d63d897f23c1a0)@RenaudG Thnx

dockimbel

[11:50](#msg5704f7f008313f6c11c3105a)@Phryxe Ports are not implemented yet, so `open` is not yet available. Please have a look at our detailed \[roadmap](https://trello.com/b/FlQ6pzdB/red-tasks-overview).

Phryxe

[13:05](#msg5705099276b97d2831c8c0f7)@dockimbel Yep, that is what I thought ;)

## Thursday 14th April, 2016

RnBrgn

[14:12](#msg570fa553548df1be102cde36)Is the "change" function implemented in Red?  
mystring: "1234"  
change ( at mystring 3 ) "8"

Poke does work for me..

pekr

[14:19](#msg570fa6d64c2125fc3f02599e)Not yet, as can be seen on the next Trello board. It is scheduled for 0.6.1 - https://trello.com/c/11bblhBn/133-0-6-1-android-gui-support

gour

[14:37](#msg570fab1b30a23db340afbb83)@pekr is there any ETA for 0.6.1 release?

pekr

[14:37](#msg570fab444c2125fc3f025b2a)The task list is quite long. Doc said, it might be divided into several smaller releases ....

SteeveGit

[14:38](#msg570fab575cd40114649b42db)@RnBrgn change is implemented. (download a fresh red release). There's still some inconsistencies with Rebol though.

gour

[14:38](#msg570fab5a30a23db340afbb87)ok. thanks

RnBrgn

[17:41](#msg570fd6595ed5a4fd3fe30c0e)@SteeveGit &gt; Tried the “change” function with the new release. It worked. I didn’t expect it to behave like it did. It doesn’t insert the characters into the string. It overwrites the characters based on the length.

red&gt;&gt; mystring: "12345678"  
\== "12345678"  
red&gt;&gt; print change (at mystring 4 ) "four"  
8  
red&gt;&gt; print mystring  
123four8

Thanks for the update.

SteeveGit

[17:56](#msg570fd9ea548df1be102cf194)@RnBrgn To replace only one char with /part. `change/part my-string "test" 1`

[17:58](#msg570fda48b30cfa0f384b7420)Or with /only: `change/only mystring "test"`

[18:00](#msg570fdad05ed5a4fd3fe30dbd)Or with an enclosing block!. `change my-string ["test"]`

[18:02](#msg570fdb2a4c2125fc3f026c76)Too many options ;-)

## Friday 15th April, 2016

RnBrgn

[17:38](#msg571127245ed5a4fd3fe36381)Why would the replace function remove the data items at the end of the block?

red&gt;&gt; myblock: \["John" "Smith" "1 Main Street" "Dallas" "texas" "75201" "212-432-5555" ]  
\== ["John" "Smith" "1 Main Street" "Dallas" "texas" "75201" "212-4...  
red&gt;&gt; print myblock  
John Smith 1 Main Street Dallas texas 75201 212-432-5555  
red&gt;&gt; replace myblock "Dallas" "123456"  
\== \["John" "Smith" "1 Main Street" "123456"]  
red&gt;&gt; print myblock  
John Smith 1 Main Street 123456  
red&gt;&gt;

RenaudG

[17:44](#msg571128935ed5a4fd3fe3640e)That's a bug, methink :(

```
red>> replace ["John" "Smith" "1 Main Street" "Dallas" "texas" "75201" "212-432-5555" ] "Dallas" "123456"
== ["John" "Smith" "1 Main Street" "123456"]
red>> replace ["John" "Smith" "1 Main Street" Dallas "texas" "75201" "212-432-5555" ] 'Dallas "123456"
== ["John" "Smith" "1 Main Street" "123456" "texas" "75201" "212-432-5555"]
```

Senenmut

[17:54](#msg57112ae5b30cfa0f384bcd5e)Hello , Arnold Schwarzenegger. I am back.

## Tuesday 19th April, 2016

gour

[06:16](#msg5715cd5882811d2e18b4d180)morning. i'd like to hear from some experienced Red/REBOL user which mode to use in Emacs for Red? i've found the two:  
\* \[REBOL](http://www.rebol.com/tools/rebol.el) mode and  
\* \[Red](https://github.com/Skrylar/red.el) mode  
Any advice? (of course, I'm just starting with Red without any prior REBOL experience)

## Friday 22nd April, 2016

Phryxe

[12:43](#msg571a1c791aa9eb495116fdf7)Is there yet a function to convert `string!` to `url!`?

dockimbel

[13:47](#msg571a2b6eaca916774e0f84fb)@Phryxe Use `to`:

```
red>> to url! "http://red-lang.org"
== http://red-lang.org
```

[14:04](#msg571a2f8270a67b20788da87a)@RnBrgn `replace` bug on strings just fixed.

RnBrgn

[15:01](#msg571a3cbe4bbb6abf7d5e2a3f)@dockimbel "replace" works great. thank you.

Phryxe

[16:08](#msg571a4c6ef5b6334a5e7003da)@dockimbel Thanks.

[18:10](#msg571a690647b4c6480ff96d51)Should there really be a question mark after `wrap` on wiki page \*\*Red View Graphic System\*\*?

## Saturday 23th April, 2016

dockimbel

[02:20](#msg571adbe88910b79b5b65e471)@Phryxe Yes, it is a convention from Rebol world that use also in Red when the word is referring to a `logic!` value, same for `visible?`and `enable?`.

Phryxe

[06:26](#msg571b15969689a5440f7ac1fb)@dockimbel Oh, I confused it with `wrap` (argument to `area`) that I didn't find any documentation about, but it worked.

dockimbel

[06:29](#msg571b164ef638ed830c7843f9)@Phryxe I guess you were thinking about the VID \[wrap](https://github.com/red/red/wiki/VID-Reference-Documentation#wrap) keyword.

RenaudG

[07:40](#msg571b27050eef754b5ea9b44b)But one of the inconsistencies of REBOL is that `?` at the end don't allways mean `logic!`... like in `length?` :-1:

endo64

[10:40](#msg571b510f47b4c6480ff992d4)In some rarer cases they return non-logic values, like `length?`, `info?`, `offset?`, `suffix?`, `index?`. But I prefer `length?` instead of `get-length`, or `index?` instead of `get-index` or `position`.

Phryxe

[14:53](#msg571b8c507469496137b887d1)@dockimbel Yes, you are right. I missed that. Next time I'll be sure to also check the VID page.

dockimbel

[16:56](#msg571ba92d01f15fc17a62a820)@RenaudG It is not a strict rule, more like a weak convention. There is no need actually for encoding the return type in some ways at the end of a function name, we don't aim at \[Hungarian notation](https://en.wikipedia.org/wiki/Hungarian\_notation). It is often more like a visual clue when reading a long line of conditional expressions, to more easily separate each expression boundary. It is also used for functions which are not verbs (which is the default convention) as shown by @endo64 , so it looks like asking a question in such case (and does not collide with words used as variables).

## Sunday 24th April, 2016

Phryxe

[08:23](#msg571c826f7469496137b8a985)Trying to find scrollbar in an `area`. I don't quite understand \*A vertical scroll-bar \*\*can\** appear if all lines of text cannot be visible in the area\*. Maybe it is on the to-do list?

dockimbel

[08:25](#msg571c82e28910b79b5b65e975)@Phryxe There's a \[ticket](https://github.com/red/red/issues/1797) about that already.

Phryxe

[08:27](#msg571c8361f5b6334a5e705cac)@dockimbel Oh, I see, thanks.

## Monday 25th April, 2016

RnBrgn

[21:43](#msg571e8f867469496137b922c4)I've seen some discussions in the Red room regarding the parse function. Is Parse fully implemented in Red ? If so , would the Rebol docs be useful for examples or is the Red version too different?

RenaudG

[21:46](#msg571e9040f5b6334a5e70d5cc)Parse implementation is well advanced already : http://www.red-lang.org/2013/11/041-introducing-parse.html

[21:47](#msg571e907ed47413c07dcd31eb)There is some differences, but i'm using rebol doc as a starting point to learn parsing with Red.

Zamlox

[21:49](#msg571e90d7f5b6334a5e70d602)I'm using parse function with complex rules and so far it works ok. I use Rebol documentation.

RenaudG

[21:52](#msg571e919f9689a5440f7b670d)The only obvious difference i know is that in Red the rules argument can only be a block!

SteeveGit

[21:52](#msg571e91b0f5b6334a5e70d652)yeah parse in Red is verry good so far

Zamlox

[21:55](#msg571e92430eef754b5eaa5afb)@RenaudG true. So parse cannot be used to split strings based on a delimiter. But for this Red has 'split' function.

RnBrgn

[22:00](#msg571e93690eef754b5eaa5b5e)I see , that's where I was getting hung up when trying the Rebol examples. The first example splits a string based on delimiter and i could not get it to work.  
parse "this is a string" none  
The parse function does not take strings as an argument . only blocks.  
Thanks.

## Tuesday 26th April, 2016

dockimbel

[04:41](#msg571ef166ad23942c68599a7a)In Red, we have separated \*splitting* from \*parsing\*, as they are really different functions.

keesse

[11:03](#msg571f4ae64bbb6abf7d5f25b7)Is there something in Red like what is called a dictionary in Python?  
&gt;&gt;&gt; dict = {}  
&gt;&gt;&gt; dict\['one'] = 1  
&gt;&gt;&gt; dict\['two'] = 2  
&gt;&gt;&gt; dict\['one'] + dict\['two']  
3

dockimbel

[11:06](#msg571f4bc1d47413c07dcd5975)@keesse Sure, you can use `map!` type:

```
red>> dict: #()
== #()
red>> dict/one: 1
== 1
red>> dict/two: 2
== 2
red>> dict/one + dict/two
== 3
```

[11:07](#msg571f4bf94bbb6abf7d5f2604)Alternatively, you can create the map filled already:

```
ed>> dict: #(one: 1 two: 2)
== #(
    one: 1
    two: 2
)
red>> dict/one + dict/two
== 3
```

[11:11](#msg571f4cdc7469496137b94ab7)More about `map!` datatype \[here](https://github.com/red/red/wiki/Map!-datatype).

keesse

[11:11](#msg571f4cfc7469496137b94ac2)@dockimbel thanks, I'll give it a try

[11:44](#msg571f54950f156f102b40d388)@dockimbel, that works fine, but how can I use in in a loop with the index as a variable, like in python:  
&gt;&gt;&gt; numbers = {"one","two","three"}  
&gt;&gt;&gt; dict = {}  
&gt;&gt;&gt; for n in numbers:  
... dict\[n] = 0  
&gt;&gt;&gt; dict  
{'three': 0, 'two': 0, 'one': 0}

RenaudG

[12:00](#msg571f587539700a7809273b9f)@keesse

```
D: #(one: 1 two: 2)
foreach k keys-of D [ print D/:k ]
```

[12:02](#msg571f58bb4da16e7d13d8db57)

```
foreach v values-of D [ print v ]
```

Zamlox

[12:03](#msg571f59184ba1347709b51a27)@keesse

```
red>> i: 1
== 1
red>> dict: #()
== #()
red>> while [i < 10] [dict/:i: i i: i + 1]
red>> dict
== #(
    1 1
    2 2
    3 3
    4 4
    5 5
    6 6
    7 7
    8 8
    9 9
)
```

pekr

[12:04](#msg571f596be8a4670f2b5c9406)yes, we don't have `for`yet ...

Zamlox

[12:05](#msg571f59728a90ed791312b837)yep

pekr

[12:07](#msg571f59ea2cd01bf9764aca45)Also - we can't use path notation, as doing something like dict/1: 10, will simply not set a word `one`, but will introduce new item in terms of map!

RenaudG

[12:08](#msg571f5a2d4ba1347709b51a83)@keese to do the same as your example, you could write:

```
L: ["one" "two" "three"]
foreach n L [D/:n: 0]
```

Then D would be:

```
#(
    "one" 0
    "two" 0
    "three" 0
)
```

pekr

[12:08](#msg571f5a2f9b4160fa7609e88f)@Zamlox - hence your example above does not apply. Author wanted to have `one`, `two,`three\`set,

[12:08](#msg571f5a590f156f102b40d583)What a trick :-)

Zamlox

[12:09](#msg571f5a814da16e7d13d8dbfb)I was thinking at a general example how to use index.

RenaudG

[12:11](#msg571f5ad88a90ed791312b8ac)My example is wrong. If you want to write D/one later L must be `[one two three]` (words, not strings inside)

dockimbel

[12:15](#msg571f5bc64da16e7d13d8dc59)@keesse Here are two examples of indexed access in a loop:

```
red>> dict: #()
== #()
red>> foreach key [one two three][dict/:key: 0]
== 0
red>> dict
== #(
    one: 0
    two: 0
    three: 0
)
red>> foreach key [four five six][put dict key 0]
== 0
red>> dict
== #(
    one: 0
    two: 0
    three: 0
    four: 0
    five: 0
 ...
```

keesse

[12:15](#msg571f5bc92cd01bf9764acae1)Thanks all!, I also did a foreach loop like in my python example:  
red&gt;&gt; dict: #()  
\== #()  
red&gt;&gt; numbers: \["one" "two" "three"]  
\== \["one" "two" "three"]  
red&gt;&gt; foreach n numbers \[ dict/:n: 0]  
\== 0  
red&gt;&gt; dict  
\== #(  
"one" 0  
"two" 0  
"three" 0  
)  
It works fine, I can now go on with converting my python script to red :-)

RnBrgn

[12:48](#msg571f638c4da16e7d13d8ded9)@dockimbel Wondering if "replace/all" changed after latest fix.

red&gt;&gt; str: "test one test two test three"  
\== "test one test two test three"  
red&gt;&gt; replace/all str "test" "number"  
\*\** Script error: invalid argument: "number"  
\*\** Where: eval-set-path  
red&gt;&gt; replace str "test" "number"  
\== "numberest one test two test three"  
red&gt;&gt; print str  
numberest one test two test three

dockimbel

[13:56](#msg571f73a88d3a974522a50057)@RnBrgn It works fine here:

```
red>> str: "test one test two test three"
== "test one test two test three"
red>> replace/all str "test" "number"
== "number one number two number three"
```

[13:57](#msg571f73bcc388e4fe099a878e)For bug reports, I would prefer them to be done in red/red channel rather than red/welcome, which is meant to help with first steps of using Red and answer questions from newcomers. TIA

RnBrgn

[14:17](#msg571f78848a90ed791312c3cc)I was getting those results using the Windows build 22apr16 . I downloaded 26apr16 and it's working fine now. Should have tried that first.  
Noted about the bug reports. Just not always sure whether a possible bug or lack of experience. Thanks again

## Wednesday 27th April, 2016

Senenmut

[11:29](#msg5720a2b00f156f102b4131f9)This Red example is not working here.

[11:31](#msg5720a3290f156f102b413220)This Red example is not working here. I have WinXP. Compiler is the 060 exe. There are no ressource for the version and author etc. in the compiled exe.Here is the code : Red [ needs: 'view

title: "Basic Red GUI Widgets"  
author: "Hans Schueren"  
rights: "Hans Schueren"

]

view [  
below  
t: text "Some text"  
text 400x30 bold italic blue font-size 16 "Text with properties"  
button "Click Me" \[t/text: "Changed!"]  
field 400 "Type something into this text entry field"  
area 400x200  
]

RenaudG

[11:35](#msg5720a3f69b4160fa760a45dc)How is it not working? Don't the "Some text" become "Changed!" when you click?

Senenmut

[11:38](#msg5720a4afe8a4670f2b5cf31c)The version and author ressources from the exe context menue only. The program is ok and ready. Only the ressoures in the Red header. author and rights.

[11:40](#msg5720a5434da16e7d13d93886)also : there is no title in the compiled exe. Does that example code working on your PC ?

RenaudG

[11:43](#msg5720a5de4da16e7d13d938b0)The window title is set by adding `title "The title you want"` in the view block. Red metadata, for now, are just metadata for Red and not used to set a default title.

[11:46](#msg5720a6874da16e7d13d938e4)I just tried the compilation. It works, and the program runs fine.

Senenmut

[11:47](#msg5720a6da4ba1347709b5797d)Its strange. If you only interpret this code there is also no title. It seems the header is false code. May i ask you for a red example template of a working header with ressources. Also strange is that a red programmer has made that code on his PC and it works well there.

RenaudG

[11:48](#msg5720a71b0f156f102b41330e)I compiled this, with the latest Red binay:

```
Red [ needs: 'view
  title: "Basic Red GUI Widgets" 
  author: "Hans Schueren" 
  rights: "Hans Schueren" 
]

view [
    title "Window title"
    below
    t: text "Some text"
    text 400x30 bold italic blue font-size 16 "Text with properties"
    button "Click Me" [t/text: "Changed!"]
    field 400 "Type something into this text entry field"
    area 400x200
]
```

Senenmut

[11:50](#msg5720a77439700a7809279c0f)Do you see the right version and author in the context menue VERSION ? Is there a icon ?

RenaudG

[11:50](#msg5720a77d2cd01bf9764b2901)\[!\[red.png](https://files.gitter.im/red/red/welcome/IUXn/thumb/red.png)](https://files.gitter.im/red/red/welcome/IUXn/red.png)

[11:53](#msg5720a81c39700a7809279c44)And if i add `version: 1.2.3` in the Red header it shows in the EXE properties as well.

Senenmut

[11:53](#msg5720a8482cd01bf9764b2945)Seems to work well on your PC

RenaudG

[11:54](#msg5720a87c4da16e7d13d9397f)Yes, on Win10. Maybe your issue is only related to WinXP.

Senenmut

[11:55](#msg5720a8b839700a7809279c7b)ok i dont know why it is not functioning here. I have to check out.

RenaudG

[11:57](#msg5720a90f2cd01bf9764b2984)Good luck.... sorry i can't help more, but have no XP at hand.

Senenmut

[11:58](#msg5720a9544ba1347709b57a54)Thanks. That helps me. Its the OS Version. Nothing else. By. Have a nice day on the RED PLANET&gt;

nodrygo

[12:05](#msg5720ab0c4ba1347709b57ae2)\[!\[xpproperties.png](https://files.gitter.im/red/red/welcome/9BzG/thumb/xpproperties.png)](https://files.gitter.im/red/red/welcome/9BzG/xpproperties.png)

[12:05](#msg5720ab158a90ed79131316e4)work fine for me on my XP/virtualbox . see version/description/copyrigth on exe properties  
but I use that build \*"22-Apr-2016/8:44:45+2:00"*

Senenmut

[12:09](#msg5720abe2e8a4670f2b5cf554)May i ask you what Service Pack ?

nodrygo

[12:10](#msg5720ac418a90ed791313174f)no idea .. it's a very old virtual box on xp . My main working os is Linux :-)  
how to know that ?

Senenmut

[12:12](#msg5720acc50f156f102b4134d6)ok. i have to try another PC here. thanks

nodrygo

[12:14](#msg5720ad3c2cd01bf9764b2aee)do you use the last Red nightly build ?

Senenmut

[12:15](#msg5720ad6be8a4670f2b5cf5e9)I use the actual 060.exe from red page.

nodrygo

[12:17](#msg5720adece8a4670f2b5cf608)you should try with last Windows red-27apr16-88a43c8.exe

Senenmut

[12:19](#msg5720ae500f156f102b413552)ok. i have not think about that. i will try

dockimbel

[12:24](#msg5720af8de8a4670f2b5cf69f)@Mennohexo For running a GUI app on WindowsXP, you need to compile with `-t WindowsXP` target.

Senenmut

[12:26](#msg5720aff59b4160fa760a49a8)Hello Nenad , if i do that , is the app aslo running on other windows versions ?

dockimbel

[12:27](#msg5720b04b0f156f102b413604)@Mennohexo It should, as long as you don't use the Gesture API which is not supported on XP and Vista.

Senenmut

[12:31](#msg5720b1264ba1347709b57d0c)ok. Everything is ready here. The only point is the RECOURSES Header Script for the APP. I am working on it. Many times it is not functioning. Now i try another PC, the target XP option , and the nightly build version until finally the exe has the right data for ICON ,VERSION , AUTHOR etc in the context menue

[12:32](#msg5720b16b4ba1347709b57d28)Thank you for your kindly support. Have a nice day. See you later.

[12:59](#msg5720b7aa8a90ed7913131b65)ha ha haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ok I have tried the following 1. compiling with -t WindowsXP 2. compiling with the night build actual version red-27apr16-719aeac.exe There are NO ressources in the .exe to see. NOW i try another Windows XP Version on a Different Laptop.

pekr

[13:02](#msg5720b8682cd01bf9764b2ee0)I am not sure if executable resources are properly implemented already. There was even a separate branch for that in the past ...

Senenmut

[13:06](#msg5720b94be8a4670f2b5cf9f5)i am working on it. You know: "The Devil is in the detail" You think your work is ready in all complete ways. But in the last phase of the project the hectic may occur for unbelievable reasons. Not only in programming ....

gour

[13:38](#msg5720c0cf8d3a974522a5070c)am i right that \[roadmap](http://www.red-lang.org/p/roadmap.html) is regualrly updated?

dockimbel

[13:56](#msg5720c50649d5aaf16db7ee0d)@gour Only when a new official release is made.

Senenmut

[14:20](#msg5720ca9e2cd01bf9764b3617)Hello again , the following report : 1. a complete APP is ready and running properly 2. The only thing for deployment is to attach the ressources data to the compiler in the script form which is seen above. 3. This is working well on the computers of 3 red programmers. 4. One of them have OS WINXP too. 5. I have 2 computers with WINXP SP3 and have tried on them : 5. Compiling the above seen example code with the 060.exe and the red-27apr16-719aeac.exe also with the parameter -t WindowsXP 6. In every compiled .exe is NO ressources seen in the context menue VERSION - autor and rights. 7. Its strange that the TITLE is also not seen. My next step: try it on a WIN7 PC. Bottomline : i have no idea how to handle this last step for deploy and why this appeared here. stay dry

[14:38](#msg5720cee339700a780927ab1b)One point more : ressource hacking of the ICON in the compiled .exe is possible , so the .res script is there.

asampal

[14:41](#msg5720cf7d9c86c12a7f568693)@Mennohexo just for your information (FYI), you can enter a new line without submitting the text in gitter using `shift-enter`. In this way, when you have something like the list you had above, it would be easier read.

Senenmut

[14:45](#msg5720d0a42cd01bf9764b388b)Thanks. I will sort this information at the right time. I am a beginner in programming. Just want to deploy one first program. And then make a break to sort all information in a relaxt manner. Because the first work is done.

gour

[17:23](#msg5720f57b49d5aaf16db7ef80)@dockimbel really? i had feeling that some items got updated after 0.6.0

Senenmut

[18:23](#msg57210399e8a4670f2b5d18ac)Ladys and Gentlemen there are some good news.  
(Now with shift-enter)  
Deployment is ready yet !  
I have hacked my own Ressources from .exe  
Works fine  
I have inserted the relevant VALUES manually.  
WHY have i done this ?  
Because you made a phone call ! ha ha ha  
This job is successfully done.  
Now i have deserved a little holiday.  
Make 14 days Break on the Planet Earth.  
See you....  
Hans

[18:28](#msg572104dc4da16e7d13d95e15)JIS - Illusions Of Reality \[Full Album]

## Thursday 28th April, 2016

dockimbel

[04:07](#msg57218c989c86c12a7f568a62)@gour I usually update the roadmap in the 24h after publishing the new article.

gour

[07:30](#msg5721bc1f9c86c12a7f568aad)is there some specific niche for which Red is recommended to use or it does qualify as 'general programming language' ?

[07:30](#msg5721bc339c86c12a7f568aae)of course, here i'm thinking about Red-1.0 ?

dockimbel

[07:47](#msg5721c00849d5aaf16db7f257)@gour Red is the first real \*fullstack* language, which means its range of application is much wider than any other language around. Red is the true embodiment of "general programming language". ;-)

asampal

[07:50](#msg5721c0b79c86c12a7f568ac7)@dockimbel I'm not sure I remember your thinking on this - once GC is added to Red will you still be able to program with the collector disabled? I'm just thinking of the end of the application spectrum where GC is usually not desired.

dockimbel

[07:51](#msg5721c0fb8d3a974522a50bc4)@asampal Yes, same as in Rebol, you'll be able to deactivate the GC if you need to.

gour

[07:54](#msg5721c1b18d3a974522a50bcc)@dockimbel thanks. i'm going to put all my 'eggs' in Red's 'basket' :)

Senenmut

[10:51](#msg5721eb21e8a4670f2b5d5220)Hello ,

its time to deliver.

You can download my first APP on Homepage http://www.hans-schueren.de

RED brings back the FUN in programming.

For me as a beginner that has come to reality.

See you.....

Hans

pekr

[10:59](#msg5721ed0e2cd01bf9764b8689)@Mennohexo - you should allow to close the app by pressing the close button at the top right section of the screen?

Senenmut

[11:12](#msg5721f0394da16e7d13d99667)not important at that state. its ready as it is.  
my statement : nothing is perfect  
but the main function and intention of a tool  
or system you must rely on.  
as a beginner i have given my best.

pekr

[11:15](#msg5721f0b62cd01bf9764b8787)It is just strange, as simple: `view [button "ok"]`let's you close the window back to console, when the close button is pressed ...

[11:15](#msg5721f0e58a90ed791313733c)Maybe it's different in a compiled code or there is something other happening, who knows ....

[11:16](#msg5721f0f34ba1347709b5da41)Other than that - apps behaves as expected!

Senenmut

[11:20](#msg5721f20f2cd01bf9764b87eb)i do this software because i need that for my own data  
if the main functions are working than ok.  
i appeciate your advice here and will do that  
in the next APP.  
The idea of that APP is already fixed.  
But my energy levels are dropped yet.  
So i make brake and start the new project in time.  
Have a nice day.  
One thing is shure : RED is FUN programming.

## Tuesday 3th May, 2016

ietv\_twitter

[00:56](#msg5727f730df1a01ff18fbde4e)I'm trying to learn view, but not making much sense of the documentation. I just want to create an object that draws a circle, then move the circle around. What do I do?

dockimbel

[04:20](#msg57282705c2a86dcf7919443a)@ietv\_twitter Hi Sherman, the so called "reference documentation" is mostly for documentation writers, so we are lacking currently appropriate documentation and tutorials for beginners.

[04:20](#msg57282713682b8fdf3c8c8544)@ietv\_twitter You can start from this simple VID example:

```
view [base loose draw [circle 40x40 20]]
```

It creates a draggable face object of type `base` which contains a circle.

[04:21](#msg57282738c2a86dcf7919443f)That example was using VID, the DSL on top of Red/View. If you want to do it directly by manually constructing the face objects, here is an example:

```
view make face! [
	type: 'window offset: 100x100 size: 300x300
	pane: reduce [
		make face! [
			type: 'base offset: 20x20 size: 80x80 color: silver
			draw: [circle 40x40 20]
			options: [drag-on: 'down]
		]
	]
]
```

keesse

[09:19](#msg57286d0412cceadb7b1a16f0)I'm trying to concatenate strings, append is the only way I found, but doing so in a loop does not give me the result I Expect:  
var code = "formatted";  
Red \[]

ind: \["one" "two" "three"]  
foreach i ind \[ print i]

foreach i ind [  
j: ""  
print \[ "J:" j "I:" i]  
j: append append "'" i "'"  
print j  
]

one  
two  
three  
J: I: one  
'one'  
J: I: two  
'one'two'  
J: I: three  
'one'two'three'

mydoghasworms

[09:23](#msg57286e1f6871c4a646c14056)@keesse In Rebol there was a `join` function. Not sure what is planned for Red, but if you look here: https://gitter.im/red/red?at=571e90b047b4c6480ffa3240 there is a workaround.

ietv\_twitter

[09:26](#msg57286eb272798bd77be97be9)@dockimbel Thank you. That gives me the basis to experiment a bit. I misunderstood that 'view was the higher level dialect, not VID, so that was part of the problem!

mydoghasworms

[09:26](#msg57286ebe6871c4a646c14090)So you can do something like

```
red>> append copy "" reduce ["a" "b" "c"]
== "abc"
```

ietv\_twitter

[09:26](#msg57286ecf474247a946a5b6be)Is there a way to use the wonderful HELP command in the console on VID and/or 'view?

dockimbel

[09:27](#msg57286ef46871c4a646c1409c)@ietv\_twitter Not yet, though, contributions would be welcome for that. ;-)

mydoghasworms

[09:30](#msg57286fc36871c4a646c140cb)@keesse Though even this works for basic string concatenation: `append "" ["a" "b" "c"]`. Did I understand the problem correctly?

keesse

[09:30](#msg57286fc512cceadb7b1a1798)@mydoghasworms I also found join not to be implemented yet.  
The append copy "" reduce works fine  
Thanx!

dockimbel

[09:30](#msg57286fd36871c4a646c140d1)@keesse You can render nicely the posted source code on Gitter by enclosing it with 3 backquotes on a head line, then 3 backquotes on a bottom line.

keesse

[09:32](#msg57287043d6d0f60219f00760)@dockimbel Yes I saw so, but used the text in the example instead of the \`, better luck next time ;-)

dockimbel

[09:35](#msg572870d0474247a946a5b739)@keesse The issue is coming from `j: ""`, where I suppose you assume it does some kind of "resetting", but that's not how assignment works in Red and other Rebol languages. In a nutshell, you make the word `j` refer to the literal string which follows it. Each change on that literal string is persistent, as on each iteration, you are making `j` refer to the \*same* string. The solution can be:  
1\. Use COPY to ensure you get a new empty string on each iteration: `j: copy ""`.  
2\. Use a dynamic allocation: `j: make string! 10` which creates an empty string with 10 slots reserved (will auto-expand if required).

If you want a longer/deeper explanation, you can read this \[post](https://www.reddit.com/r/redlang/comments/4ecs9n/insane\_behavior\_in\_rebol\_lets\_put\_an\_end\_to\_this/d2lt4fi) on \[/r/redlang](https://www.reddit.com/r/redlang/).

ietv\_twitter

[09:35](#msg572870de72798bd77be97c76)@dockimbel I would love to contribute, but I don't know enough to even be dangerous yet. If I can start with the basics you gave me above and figure some things out, I'll submit them to github as beginner's examples for VID.

dockimbel

[09:39](#msg572871e66871c4a646c1412a)@ietv\_twitter You are welcome to ask any question here about Red. We'll do our best to answer asap.

ietv\_twitter

[09:40](#msg5728720cdf1a01ff18fbf4bb)@dockimbel Thank you. So far I've found the community very welcoming.

dockimbel

[09:46](#msg5728736d72798bd77be97d29)@ietv\_twitter Well, we all have been through the same discovering/learning process at some point, so we know how important are the first questions/answers to quickly get the correct picture. I suggest you have a look at the \[Overview](https://github.com/red/red/wiki/Red-View-architecture) document for our GUI system, then you can see/try some examples from \[red/code](https://github.com/red/code) and our GUI \[test scripts](https://github.com/red/red/tree/master/tests).

ietv\_twitter

[09:51](#msg572874a3474247a946a5b833)@dockimbel I have run through some of the examples in red/code. Some of them I understood, some of them I didn't. I'm going to dig through the VID documentation and the examples again, and the test scripts, and see what questions it brings up. Thanks again!

keesse

[11:27](#msg57288b3f0149d6bb04b83851)@dockimbel thank you for the explanation, I added

```
j: ""
```

because it looked like it was added to the previous result, but it didn't change the effect, the print statement showed that j was empty (also without making it an empty string) and i what it should be.

dockimbel

[11:52](#msg572890fdd6d0f60219f00fc9)@ietv\_twitter Oops, I overlooked it, sorry. Anyway, that explanation should avoid you to fall into that common trap for newcomers in Red/Rebol world. ;-)

ietv\_twitter

[16:54](#msg5728d7be944fc7ba04ccabe5)So this morning I learned a little more about VID, 'View and Draw. Working off of doc's simple example he gave me, how would I move a VID face programmatically? For example, I have my Base that I'm drawing a circle on, now I want to move it across the screen incrementally. I tried /offset and it didn't work.

nodrygo

[17:07](#msg5728dae4df1a01ff18fc1911)you have to calculate the new position and change the circle coordinates in the draw block.  
This is different of your needs but you may look \[simpleDraw1](https://github.com/nodrygo/DemosRed) in my git Red demos code . I draw a list of circle to paint on face at different coord. following the mouse

dockimbel

[17:21](#msg5728ddfcc2a86dcf791949f5)@ietv\_twitter `/offset` is the right facet to modify for that:

```
view [b: base button "+10" [b/offset: b/offset + 10x0]]
```

nodrygo

[17:21](#msg5728de2812cceadb7b1a3e9b)oh great I don't know that

ietv\_twitter

[18:28](#msg5728edd60149d6bb04b85e01)@dockimbel But that only works with VID faces, right? Can I use that to move the Base face if I'm drawing on it?

[18:30](#msg5728ee30474247a946a5e18a)Something like this: '''cb: base draw \[circle 40x40 20 cb/offset: cb/offset + 10x0]'''

[18:30](#msg5728ee40474247a946a5e193)

```
cb: base draw [circle 40x40 20 cb/offset: cb/offset + 10x0]
```

nodrygo

[18:49](#msg5728f2b3df1a01ff18fc21d0)@dockimbel have certainly a better answer than me  
but may be you want something like that  
\*unfortunately I don't know how to have an infinite event when nothing is done so you have to move your mouse in face area*  
\*and this is probably naive and bad Red idiomatic code *

```
Red [
        Title: "ballbounce"
        Needs: 'view
]

move: 1x1
moveball: does [
   lastpos: ball/4
   nextpos: lastpos + move 
   if nextpos/x >= 800  [move: as-pair -1 (move/y)]
   if nextpos/x <= 0    [move: as-pair 1 (move/y)]
   if nextpos/y >= 600  [move: as-pair (move/x) -1]
   if nextpos/y <= 0    [move: as-pair (move/x) 1]
   ball/4: nextpos
]

ball: [pen black  circle 20x20 10]
view/no-wait [
    title "VID demo : Simple Draw"
    b: base 800x600 white all-over draw ball on-over[moveball]
]
```

ietv\_twitter

[22:10](#msg572921eddf1a01ff18fc32af)Thanks @nodrygo , I got something working. I want to be able to click a button and have it move the circle 1 pixel, update the screen, repeat some arbitrary number of times (starting at, say, 100 loops). But when I do that, it moves too fast to see. I tried slowing the loop down with Wait, but that just made the program wait and then update the screen to the final position. How do I get it to move incrementally across the screen?

## Wednesday 4th May, 2016

dockimbel

[02:56](#msg572964c2aa92b14772cb513f)@ietv\_twitter We don't have support for timer events yet, but that should come very soon (next release). Without timer event, you cannot do animations properly. There is a workaround to achieve simple animations right now, but it is not handy to work with:

```
Red []
 
view/no-wait [size 500x100 b: base]
 
loop 20 [
	b/offset: b/offset + 10x0
	loop 5 [do-events/no-wait wait 0.02]	;-- wait 0.1 second
	show b
]

do-events
```

[03:07](#msg57296774c2a86dcf79194dbe)Here's a version where the animation is activated by a click on a button as you asked for:

```
view [
	size 500x100
	button "Move" [
		loop 20 [
			b/offset: b/offset + 10x0
			loop 5 [do-events/no-wait wait 0.02]	;-- wait 0.1 second
			show b
		]
	]
	b: base
]
```

[03:09](#msg572967ccc2a86dcf79194dbf)@ietv\_twitter Draw dialect accepts only commands described \[there](https://github.com/red/red/wiki/Draw-dialect), you cannot put regular code in it.

nodrygo

[06:51](#msg57299c0bdf1a01ff18fc4908)@dockimbel I have rewrite 2 demos bouncing ball. One with face offset and other with moving the draw circle.  
with face the demo is more fluid.  
so just a question just to have better understand (I have only 2 weeks of Red/Rebol experiences):  
Do you thing it is possible to have a lot of creation/deletion of faces in acceptable time/memory usage ? (consider some demos like particles). Is it better to use a lot of faces ?

pekr

[06:59](#msg57299de8474247a946a6089c)Particles dome in R2? It imo uses just one face and dynamically creates a draw block ...

nodrygo

[07:12](#msg5729a0ea6871c4a646c1942a)@pekr yes I know that but the question is is it possible with lot of faces or not applicable ?

pekr

[07:32](#msg5729a59472798bd77be9d395)In the R2 era, lots of faces meant a slow down, as the face object was quite big. There is a 1000cows.r demo somewhere. R3 was IIRC a magnitude faster, as it used gob! on the low level, which was much more streamlined. Maybe it was also related to change, as R3 removed old R2 renderer and used AGG for rendering. While it is not HW accelerated, it was still much faster than original R2 one.

[07:34](#msg5729a608944fc7ba04ccdeba)We need Rebolek to port the demo to Red :-)

nodrygo

[07:36](#msg5729a66ad6d0f60219f05e5d)@pekr thanks for that information

dockimbel

[07:36](#msg5729a6720149d6bb04b8890f)@nodrygo You can use as many faces as you want, but they comsume a lot of resources compared to Draw primitives. Also, adding/removing faces from a face tree is much more time-consuming than the similar operation in a Draw block.

nodrygo

[07:37](#msg5729a6ad944fc7ba04ccded6)@dockimbel thanks for explanations. In fact I wondered if I should rewrite my CAD demo using faces and the answer seem no

keesse

[10:53](#msg5729d4946871c4a646c1a173)How to access a file by variable name?

```
red>> process_textfile: func [textfile] [
[        print textfile
[        tfile: read/lines %:textfile
[        foreach line tfile [
[            print line
[        ]
[    ]
== func [textfile][print textfile 
    tfile: read/lines %"" :textfil
red>> 
red>> process_textfile "textfile.txt"
textfile.txt
*** Access error: cannot open: %""
*** Where: read
```

ietv\_twitter

[10:54](#msg5729d4da6871c4a646c1a18b)Why doesn't this work?

```
view [
    size 500x200
    b: base 
    b/offset: b/offset + 175x50  
]
```

dockimbel

[10:57](#msg5729d598df1a01ff18fc57d3)@ietv\_twitter The VID DSL does not support regular code directly, but only VID grammar. See the VID document on the wiki for accepted commands with their syntax. In your above case, you could use the `do` command for running that code:

```
view [ size 500x200 b: base do [b/offset: b/offset + 175x50 ]]
```

ietv\_twitter

[10:59](#msg5729d61212cceadb7b1a7db3)Ah, I see. I misunderstood the

```
do
```

documentation.

[11:01](#msg5729d684944fc7ba04ccebc7)So in the first example above, is there documentation on `do-events` or `no-wait`? I couldn't find it.

[11:07](#msg5729d80d12cceadb7b1a7e4e)Also in the first example, because some of the code is attached to the button, it acts as an implicit `do`?

Oldes

[11:53](#msg5729e2b772798bd77be9e364)@keesse use

```
to file! textfile
```

instead of

```
%:textfile
```

[11:59](#msg5729e42e12cceadb7b1a8158)@keesse or don't use

```
string!
```

type where you expect

```
file!
```

.... so:

```
process_textfile %textfile.txt
```

and

```
tfile: read/lines textfile
```

Zamlox

[12:02](#msg5729e4d0944fc7ba04ccef4e)@ietv\_twitter you can use

```
to-red-file
```

for your purpose:

```
tfile: read/lines to-red-file textfile
```

then make the call:

```
red>> process_textfile "textfile.txt"
```

Oldes

[12:02](#msg5729e4dcd6d0f60219f06e7f)

```
process_textfile: func [textfile [file!] "file to process"] [
    print textfile
    tfile: read/lines textfile
    foreach line tfile [
        print line
    ]
]

process_textfile %usage.txt
```

keesse

[12:19](#msg5729e8dc944fc7ba04ccf0aa)@Oldes

```
to file!
```

works fine, your last suggestion

```
func [textfile [file!]
```

not

[12:20](#msg5729e907474247a946a61c32)@Zamlox

```
to-red-file
```

works as well

[12:20](#msg5729e91c72798bd77be9e552)@Oldes @Zamlox thank you both!

Oldes

[12:21](#msg5729e94dd6d0f60219f06fcd)@keesse the types after argument name in the func creation block is not making conversion, but checks if the type you are passing in is compatible! It works as expected.

[12:23](#msg5729e9b40149d6bb04b89a6f)@keesse also note this difference:

```
red>> to file! "c:/a/b"
== %c:/a/b
red>> to-red-file "c:/a/b"
== %/c/a/b
```

[12:24](#msg5729e9f66871c4a646c1a70e)so if you need to convert user file name input, you should use @Zamlox 's function

keesse

[12:25](#msg5729ea1e474247a946a61c8a)@Oldes thanks for your advice, they certainly dffer, good to know!

## Thursday 5th May, 2016

ietv\_twitter

[10:44](#msg572b2418df1a01ff18fcb322)Is it possible to hide/show a container? What I'd like to do is have 2 panels. Hide the first panel and show the second panel when a checkmark is checked, then save the data from the fields in the second panel, hide the second panel, show the first panel when you click a button on the second panel.

[10:44](#msg572b2425d6d0f60219f0c668)The idea is similar to a single page app in javascript.

dockimbel

[12:30](#msg572b3ceb682b8fdf3c8c9b66)@ietv\_twitter Sure, this is how:

```
view [
    button "show/hide" [p/visible?: not p/visible?]
    p: panel [text "hello"]
]
```

[12:31](#msg572b3d34c2a86dcf79195aa9)You can define any widget as initially invisible in VID using `hidden` keyword.

## Friday 6th May, 2016

nodrygo

[06:13](#msg572c35f5d6d0f60219f10fa1)hello. I am trying to test the most simple demo for bricks games but fail. Probably my understanding for both Red, VID and REACT is bad .Will be grateful if somebody could point my mistakes \[here](https://gist.github.com/nodrygo/a5aced657681946ca4d0b504dee2e845)

endo64

[06:23](#msg572c385b0149d6bb04b938b1)I didn't chechk the whole script, but there is no set-word! and path! in your react block.

[06:23](#msg572c3864d6d0f60219f11010)[print "

[06:25](#msg572c38c9df1a01ff18fcfc59)`react [print "react"]]` doen't react anything. (sorry I'm on mobile app, can't write easily)

nodrygo

[06:26](#msg572c39210149d6bb04b938ce)no this was old stupid test .. the react I am speaking about is on \*makebrick*  
but only work for the last brick

dockimbel

[06:27](#msg572c396512cceadb7b1b2534)@nodrygo Just a general remark about games, you really want to have timers in order to support proper animations. They'll come in one of the 0.6.x releases.

nodrygo

[06:29](#msg572c39d2474247a946a6b70d)@dockimbel yes you are wright I know that but it is just for fun and mainly to learn things not to create a real demo (and I am not interested by games développement in general ;-) )

dockimbel

[06:39](#msg572c3c2512cceadb7b1b25d0)@nodrygo For your code above to work properly, replace `copy makebrick` by `copy/deep makebrick`. By failing to copy the `react` argument block, you end up having only one reaction bound to the last `base`face only.

[06:41](#msg572c3ca472798bd77bea8601)You can also try with this alternative reaction:

```
react [
   [ball/offset]
   if all [face/visible? overlap? ball face][
	   print ["touche" face] 
	   face/visible?: false 
	]
]
```

[06:42](#msg572c3ce6474247a946a6b79f)Though, the collision detection between the round ball and the rectangles is not accurate anyway, you would need a custom collision detection algorithm for pixel-accurate detection.

nodrygo

[06:42](#msg572c3ce7df1a01ff18fcfd1c)@dockimbel oh great, thanks a lot, that's help me to better understand how it work  
for the collision this is secondary in my needs, first of all I want to learn better REACT  
and in me try for simpleCad I have some start test to know if a point is in a circle or in box side  
I will add some intersect in future usable here

ietv\_twitter

[09:57](#msg572c6a736871c4a646c24d08)Why doesn't this work?

```
view [
	sh: [ p/visible?: not p/visible? ]
    button "show/hide" [ do sh ]
    p: panel [text "hello"]
]
```

nodrygo

[09:59](#msg572c6b100149d6bb04b94427)@ietv\_twitter if I not mistake you are not allowed to put block of code in VID

ietv\_twitter

[10:01](#msg572c6b5e72798bd77bea915d)@nodrygo Yes, that was it, thanks!

## Saturday 7th May, 2016

camspilly

[18:59](#msg572e3b21f16c08510661997c)

## Monday 9th May, 2016

ietv\_twitter

[17:00](#msg5730c243f16c085106620ed0)How would I do something like this? I have several fields in a panel. I want to update the fields one by one and put a calculated number in the field. Since I'm doing the same calculations many times, I have a function that returns the value I want, but I don't want to put the same function name as an action in every field. Is there an easy way to get all the names of fields in a panel? Or maybe create a string with the name of the field and treat that name as the field?

[17:28](#msg5730c8ac12fa465406eb3dc8)Ok, I think I figured it out - convert the 'string to 'word then 'get it?

pekr

[17:35](#msg5730ca6b3170252648f554fe)Not sure if you wanted some Getter functionality, collecting field values, but here's the idea:

```
view [
    below
    text "Getter"
    p: panel [
       f1: field 
       f2: field
    ]
    button "Get fields" [
       foreach item p/pane [
           if item/type == 'field [print item/text]
       ]
    ]
]
```

[17:37](#msg5730cadea351d83109524bbd)I wonder if we would be able to get to the words referring to those fields? Here `f1`and `f2`

Senenmut

[17:48](#msg5730cd78b51b0e294850855b)Hello. I am back again.  
i send you a example code in RED.  
The following case -  
1\. i have made a base container with widgets.  
2\. additional another view if you klick the button  
WEITER  
The bakcground is simple.  
I want to know to program GUI that automatic resize  
themselfs on the computer screen where it is  
started. ( always portable apps)

i have checked my compiled exe on a smaller PC

YES , the base container with the first main view  
is resizing on the smaller screen.  
But not the other window WEITER.

So my question. You can run the code.

How can i make the other window to get maximum size on a computer  
depending on the screen datas that Red has from that computer when  
a .exe is started on them.  
automatic such like the base.  
Notice :

the other view window area is always small. Also on a great screen !

It is not changing itself always.

So i have not programmed it correct such like the VIEW GRAPHIC REFERENCE  
it describes.  
I have not fully understand it.  
It must be possible to make that window of screen size maximum anyhow.

Thanks for your attention.

The code comes with the next posting.

Please be patient for my answer because i am on a hurry here.  
Could take a longer hours. Dont know.

[17:49](#msg5730cdc33170252648f5564d)Red \[needs: 'view]

view [

base red "Hello you programmers" font-size 12 bold underline  
image %test.png return

below  
button "Button"  
button "Button2"  
button "Button3"  
button "wechsel" \[unview]

across space 50x50 return  
field "hello" center  
field "hello2" center  
field "hello3" center  
field "hello4" center

]

view [ title "another window"

a: area font-size 12 bold "This window wants to be as great as the screen size is"

below  
b: field red font-size 18 bold

below  
field "Test" font-size 20 bold

button "Save" font-size 10 bold

button "Print" font-size 10 bold

button "Exit" font-size 10 bold \[quit]

]

## Tuesday 10th May, 2016

ietv\_twitter

[09:37](#msg5731abd0f9a53a60793d5661)@pekr That is part of what I want. The second part is to process the values of each field, then set new values in the field with another loop.

[09:38](#msg5731ac00b51b0e294850c017)Also complicating things is that I have panels inside the panels. I still haven't figured out a way to get the fields of the inner panel.

pekr

[13:04](#msg5731dc63f36daf63798e3d86)Each panel, has a `pane`object field. It is basically a block/container, containing other stuf ... you can use path notation to get access to the inner elements, so you can repeat the process down the way ....

Senenmut

[15:27](#msg5731fdd2f9a53a60793d79d1)Hi there ,  
may i ask if someone have an idea to  
make the "another window" an area of my posted code  
above appear  
always in maximum screen resolution that is possible  
on that PC where the .exe is running ?  
I think this is also interesting for other programmers here .  
a base is self resizing here on a smaller PC  
but not the area field.  
What comes after the base in category of GUI flow ?  
Or do i have to make another base instead of an area ?  
\--  
I have not given the widgets any size as described in the  
manual VIEW. They make a self arrange.  
\-  
One question EVERY Red programmer is thinking of in starting GUI is  
why can i not maximize a window ?  
just maximize to full screen.

pekr

[18:18](#msg5732260e3170252648f5c4bb)@Mennohexo - see my answer at the related Google groups thread ...

Senenmut

[19:32](#msg57323755f9a53a60793d9240)Thanks Petr. I try it. Also i have uploaded my new GUI example.  
Now with widgets INSIDE the main.

## Wednesday 11st May, 2016

nodrygo

[07:23](#msg5732ddf1f16c08510662b0bc)\[!\[editide.png](https://files.gitter.im/red/red/welcome/SVrZ/thumb/editide.png)](https://files.gitter.im/red/red/welcome/SVrZ/editide.png)

[07:24](#msg5732de1212fa465406ebddf1)2 more stupid questions  
playing with a naive \[IdeEditor](https://gist.github.com/nodrygo/2e95f5d01748e40bc85ad492f1ba8965)  
1: I need to save content of area/text but formatted as is and not with string encapsulation {} ? \*(of course I had tested lot of things before request)*

2: When I compile this code with -c -t windowsXP -d the code compile fine but the .exe start and stop immediately without any clues. How to test that ?  
\*(a old previous test was working fine but don't know witch change kill it)*  
any help will be welcome  
(work interpreted)

[07:34](#msg5732e074f36daf63798e8e43)Find myself for question 1 .. seem I need to use `write` instead of `save`

dockimbel

[07:34](#msg5732e088ed393f3409b1ba9b)@nodrygo Nice progress in your journey through learning Red! ;-)  
1\. Use `write/binary` to save the text on disk.  
2\. Run it from a DOS shell to see the error output.

nodrygo

[07:35](#msg5732e0be3170252648f5f2ba)I alway run it from dos shell .. no output

[07:35](#msg5732e0d8ed393f3409b1bab7)\[!\[consolecompile.png](https://files.gitter.im/red/red/welcome/FMHh/thumb/consolecompile.png)](https://files.gitter.im/red/red/welcome/FMHh/consolecompile.png)

dockimbel

[07:36](#msg5732e0f2f16c08510662b179)@nodrygo Can you compile it with just `-c -d`?

nodrygo

[07:38](#msg5732e15a3170252648f5f2e0)@dockimbel same behavior :-(

dockimbel

[07:38](#msg5732e1933170252648f5f2eb)@nodrygo Examine the last changes you made in the source code. Roll them back up to a working version (if you're not using a versioning tool, I strongly suggest you to use one, will save you lot of headaches and time).

nodrygo

[07:40](#msg5732e1d9f9a53a60793db9fb)@dockimbel yes I have try to do that but a lot of change ... with go back on my modif to find the culprit (unfortunatly no commit to see change and the code is not yet git)

dockimbel

[07:41](#msg5732e222f9a53a60793dba0c)You can also use put some `probe` calls through your starting code to see where it quits.

nodrygo

[07:41](#msg5732e23f12fa465406ebdeef)@dockimbel yes that a good idea will do that

[08:58](#msg5732f418f9a53a60793dbf40)@dockimbel found .. it is the no-wait `view/no-wait/flags mainwin [resize]`  
without work fine  
I have to go now

dockimbel

[08:58](#msg5732f44ef9a53a60793dbf54)`view/no-wait` means it does not run the event loop, so he will not block. It is useful when an event loop is already running (to avoid launch new ones).

nodrygo

[09:26](#msg5732fac812fa465406ebe6ef)@dockimbel yes that make sens.

[11:43](#msg57331aeca351d8310952fe78)my big hack for a basic ide is now working with still some bugs but I have another problem with compiler  
this simple demo  
\[BallBounce]( https://gist.github.com/nodrygo/7400c266d177ef923a8d1b8ae92ac5b1 )  
run with interpreted but compiler fail on `show playground` in the loop  
seem it do see the word! playground  
how to do to avid that please ?

```
Z:\devygo\red\DemosRed\basicIde>red -c -t Windows ball.red
-=== Red Compiler 0.6.0 ===-
Compiling Z:\devygo\red\DemosRed\basicIde\ball.red ...
*** Compilation Error: undefined word playground
*** in file: %/Z/devygo/red/DemosRed/basicIde/ball.red
*** near: [playground]
```

Zamlox

[12:41](#msg57332864a351d8310953030a)@nodrygo as a workaround declare word

```
playground
```

in global context before using it, like:

```
playground: none
mainwin: layout [
...
```

elavoie

[12:51](#msg57332adbf36daf63798ea623)Hi @dockimbel! We met briefly in Montreal at the last Rebol conference and I kept following distantly Red ever since. It has come a long way since then :-). It is awesome to witness the evolution of such an ambition project.

[12:52](#msg57332af1a351d831095303f6)I just installed Red on OSX and got curious about what is happening the first time the executable is launched

[12:52](#msg57332b033170252648f609f8)Is it compiling itself and rewriting the binary executable?

[12:52](#msg57332b10b51b0e2948513a2b)I did not see any auxiliary file.

pekr

[12:54](#msg57332b96ed393f3409b1d2fb)It compiles crush.dll and creates a console somewhere else ... under Windows, it is in some Program Data \\ Red folder, not sure about OS-X ...

elavoie

[12:54](#msg57332ba2ed393f3409b1d303)Also I may want to use Red on the Novena laptop (https://www.crowdsupply.com/sutajio-kosagi/novena), will it work on Arm?

pekr

[12:55](#msg57332bb6b51b0e2948513a66)ARM should be supported - no gui though ....

[12:55](#msg57332bc5f9a53a60793dd156)btw - there is experimental Linux/OS-X GUI branch .... https://github.com/qtxie/red/commits/MacOSX-GUI

elavoie

[12:55](#msg57332bd6f9a53a60793dd15c)the crush library is in ~/.red

[12:56](#msg57332be7f16c08510662c904)just found it

pekr

[12:56](#msg57332c0312fa465406ebf6ec)well, there should be also a console executable. Next time you run it, it should just skip the compilation phase ....

elavoie

[12:58](#msg57332c60f36daf63798ea6d1)yes, that must be the console-&lt;date&gt; thing

[12:58](#msg57332c77f16c08510662c942)Red still needs Rebol for bootstrapping?

nodrygo

[13:05](#msg57332e1af16c08510662c9e3)@Zamlox I had think and tryed to put `playground: none` and yes it compile but doesn't work .. probably the reference used in code not the good one

Zamlox

[13:07](#msg57332e87ed393f3409b1d453)@nodrygo it worked for me. I have used latest red binary. I was able to start executable and play it. But I have Windows 7 OS

nodrygo

[13:13](#msg57333014f9a53a60793dd344)@Zamlox I use the today release .. the exe run but the button start don't launch the moving ball for me (red 11/05 and windowsXP )

Zamlox

[13:39](#msg57333601a351d83109530922)@nodrygo try to debug it by displaying messages using

```
probe
```

or

```
print
```

through code.

nodrygo

[13:44](#msg57333733f9a53a60793dd66b)@Zamlox very curious the same EXE work on my Linux with \*\*\*wine\*\** but not on my virtualbox windowsXP. probably specific to environnement

Zamlox

[13:44](#msg5733375bb51b0e2948513fe7)@nodrygo I suspect also something is not ok with environment

nodrygo

[13:45](#msg57333784ed393f3409b1d89b)@Zamlox thanks for your help

Zamlox

[13:45](#msg57333794b51b0e294851400a)@nodrygo ;)

dockimbel

[14:37](#msg573343b3c5ff2e7e29fdd1c4)@elavoie Welcome! Glad to see you were patient enough to follow Red since the conference in 2013. Yes, we've made a lot of progress since then, getting closer to a completed version (should be one of the 0.7.x).

[14:39](#msg5733443bf6f2bcff2b9c42a5)Red can run on Linux/ARM, though we haven't yet tested the toolchain on such platform, as the Rebol2 port to ARM was very recent, and the SDK is still lacking (so the toolchain can run only from sources on that plafform). Though, you can still cross-compile if that's a more convenient option.

[14:44](#msg57334543f6f2bcff2b9c42b3)\*I just installed Red on OSX and got curious about what is happening the first time the executable is launched*  
1\. Red launcher pre-compiles the crush library (&lt; 20KB), which is used by the toolchain to compress some of the compiled data structures (blocks, strings, ...) before linking them to the compiled binary.  
2\. Red then pre-compiles in a hidden folder ($HOME/.red/), the console with the runtime.  
3\. Once the console is generated, it will start it and the Red launcher will quit. On next Red invocation, the console will be launched at once.

[14:46](#msg573345abc5ff2e7e29fdd1db)\*Red still needs Rebol for bootstrapping?* It does, the whole Red toolchain during the bootstrap phase is written in Rebol2 (~20k LOC), while the runtime library is written in a mix of Red and Red/System (~70k LOC). Once 1.0 is released, we start working on the self-hosted version, which should make Red 2.0 once finished.

[14:48](#msg573346302b8be74d22905ad9)@nodrygo We have some reports from time to time about weird behaviors of Red GUI code on virtualized Windows under VirtualBox.

nodrygo

[14:55](#msg573347cba410e6902ab2a1d8)@dockimbel ok that's not important. it's only a way to use it (between wine and vbox each having theirs own problems) waiting futur Linux/gtk ;-)

elavoie

[16:08](#msg573358f07df8adaf347d5c81)@dockimbel Thanks for taking the time to clarify. I am looking forward a self-hosted Rebol-dialect with multi-platform support in &gt;1MB ;-). I remember having showed interest to help with a javascript compiler backend back-then but I am still not in a position to be able to dedicate enough time for that. I still have to finish my PhD and find ways of obtaining funding for research that won't tie all my time so I can have many side projects ;-).

I would love to use Red as a full-stack language in combination with Sandstorm.io for deployment and security of web applications. It would be awesome to have the full environment available client-side in the browser and abstract away much of the complexity of the client-side web stack. Anyway, one step at a time and patience will get us there. Keep up the good work. I will continue to come back periodically. :-)

## Thursday 12nd May, 2016

RnBrgn

[15:24](#msg5734a014c61823687d3b3bfd)Is there a down side to using brackets to combine strings in place of append or rejoin?

```
a: "test"
b: "string"
x: [prin a print b]
do x
```

## Friday 13th May, 2016

meijeru

[16:38](#msg573602eceea93e5742d1a85b)This is for one-off printing. The result will not be available afterwards.

## Monday 16th May, 2016

VEyelets\_twitter

[19:20](#msg573a1d69831fd2d97d9ef783)

[19:29](#msg573a1f871794136a7d092d7e)  
I have an image location and need to concat http in the front, but when I try

img: "xyz.com/blah.png"  
url: \["http://" img]  
print url

returns: "http:// xyz.com/blah.png"

there is a space between them. Join doesn't seem to be working. How do I get rid of that space?  
&gt;

pekr

[20:03](#msg573a2798ae26c1967f9efede)print is a pig

[20:06](#msg573a2839ae26c1967f9eff0c)I thought that `form`would do it, but it does not.

[20:06](#msg573a2853c61823687d3c665c)in Rebol, I would use `rejoin`, but that's not awailable in Red yet

meijeru

[20:16](#msg573a2aa3eea93e5742d269a3)Try `prin "http://" print url` this will not insert a space, and the first `prin` will avoid an extra newline. If you want the concatenation as a new value (to be used e.g. in a `read`) then use `url: append http:// img`

RnBrgn

[23:02](#msg573a5181c61823687d3c72b1)@VEyelets\_twitter  
print append http:// img

## Tuesday 17th May, 2016

mydoghasworms

[07:06](#msg573ac2deae26c1967f9f1fdb)This is probably a question that comes up from time to time, and one I have no doubt asked myself: What does everyone here use to edit Red code? Do you have syntax highlighting?

nodrygo

[07:55](#msg573ace5eae26c1967f9f22b2)@mydoghasworms \[SublimeText3](https://www.sublimetext.com/3) with (old) \[Red package](https://github.com/Oldes/Sublime-Red)

mydoghasworms

[08:17](#msg573ad3ae0cb634927f7f8af3)@nodrygo Wonderful, I am already using Sublime Text 3 and have just installed the package. Looks good. Thanks.

meijeru

[19:12](#msg573b6d23831fd2d97d9f58d6)I use \[Crimson Editor](http://www.crimsoneditor.com/).

## Wednesday 18th May, 2016

endo64

[23:01](#msg573cf45eeea93e5742d335df)I use EditPlus (Windows only, commercial) with Rebol syntax file.

## Monday 23th May, 2016

sergey6661313

[11:36](#msg5742eb21d3f431720bb2db3c)

[11:38](#msg5742eb9ae675315635f9181d)На вашем сайте в записи от March 25, 2016 Второй пример под заголовком "Reactive GUI programming", там где написано: "Change the color of a box and a text using 3 sliders: "  
в gif изображении рядом со слайдерами присутствуют числа. Но при копировании / вставке исходного кода скомпилированная программа получается без чисел. Добавить числа самостоятельно у меня не получилось. Пожалуйста измените исходный код в указанном примере.

dockimbel

[11:44](#msg5742ed30d3f431720bb2dbe8)@sergey6661313 如果你想要用俄语写，我会用中国回复。;-) Please use English to communicate, these are international chat rooms.

[12:14](#msg5742f40dd3f431720bb2de36)@sergey6661313 After using Google Translate to understand your post, this is my anwser to the point you're raising: the Red compiler is a little bit stricter than the interpreter, so, in order to compile and run the color sliders code properly, you need to add a line with declarations of words used in the VID dialect, here is \[a version](https://gist.github.com/dockimbel/05f6f820fbc9c7fde47075cdcacde9bd) which compiles and runs fine. Hope I answered your question accurately.

sergey6661313

[13:30](#msg57430611f240e50046a1811d)Спасибо! Простите за то, что пишу на русском языке.  
Получается пример не работает без строки  
"R: G: B: box: value: none".

iArnold

[13:45](#msg5743098d08a18f700b82d698)Please @sergey6661313 can you use google translate before posting? We are forgiving for your mistakes you make in English. :-)

## Wednesday 25th May, 2016

RnBrgn

[18:38](#msg5745f1296bbc2d1d4dee1d15)what purpose does copy names have in the below code? This is an example from the Red, getting started docs, building a CRUD . The function clears the names block,  
populates the block again using foreach , appending from the contacts block and then it has the copy names line.

```
Red [needs: 'view]
extract-names: func [] [
    clear names
    foreach [name address phone] contacts [append names name]
    copy names
```

## Thursday 26th May, 2016

dockimbel

[02:51](#msg574664c8a0fc3091611b05df)@RnBrgn No purpose in that case, I think that source code of that CRUD example is a bit messed up after been adapted from Rebol to Red. @nickantonaccio should have a look at it. Usually, you use `copy` to create a copy of series (block, string,...) you want to preserve from modifications.

alcavaz

[09:49](#msg5746c68d6bbc2d1d4dee51bf)Hi everybody! I'd like to ask something not directly related to Red, but I think you could help me find an answer. Are there any Rebol/Red web frameworks ready to use?

pekr

[09:59](#msg5746c907da3f93da6f206ec0)Hi. Well, there were some, not sure about their state of development though.

[09:59](#msg5746c91da78d5a256e37fc4d)Dockimbel (author of Red) is author of Cheyenne app/web server for e.g.

[10:00](#msg5746c93880352f204df24a09)Rebolek, also available here, has one called Lest

[10:01](#msg5746c96ba78d5a256e37fc63)Chris Ross Gill has some goodies available too - http://ross-gill.com/page/REBOL

alcavaz

[10:20](#msg5746cdf6da3f93da6f207070)Ok, thank you so much. Is this a good place for this kind of questions? I mean, I'm a total beginner to Red/Rebol and sometimes it's hard to find good palces to learn and to share opinions.

[10:26](#msg5746cf73ec10ddbb09dadd2e)well, it seems all of them aren't in active development.

endo64

[10:31](#msg5746d089a78d5a256e37febd)Cheyenne is not in active development but it is stable for production use. I'm using it for several years on production.

alcavaz

[10:33](#msg5746d101454cb2be094f1ad9)It's good to know, thank you.

endo64

[10:33](#msg5746d102da3f93da6f20716f)And once Red ready Doc will rewrite Cheyenne in Red so we will be able to continue using Cheyenne (probably with relatively small changes).

alcavaz

[10:34](#msg5746d146a78d5a256e37ff08)ok, these are good news.

SoleSoul

[15:21](#msg5747146a454cb2be094f327e)Hi, is it time already to start playing with networking (is there anything in the nightly yet) or is it still to early?

[15:21](#msg57471489ec10ddbb09daf638)\*too

pekr

[15:33](#msg57471758454cb2be094f33cd)Too early. There's just some basic IO, which is temporary. Full IO implementation will come with 0.7.0 version

[15:34](#msg57471769da3f93da6f208bd7)You can do basic file and networking read/writes

SoleSoul

[15:35](#msg574717b0f44fde236e509ed2)Thank you.

dockimbel

[16:06](#msg57471eeda0fc3091611b0aed)@SoleSoul Same networking stuff as in 0.6.0, with just some bugfixes.

## Friday 27th May, 2016

alcavaz

[15:50](#msg57486cda10f0fed86f48d10b)Hi everybody, I'd like to ask if it's possible to run Rebol on ubuntu. It's installed but I always get \** User Error: Bad face in screen pane!  
\** Near: size-text self

endo64

[16:10](#msg57487187a78d5a256e387b8d)@alcavaz You need to install xfonts then you might need to reboot.

dockimbel

[16:11](#msg574871a14a49504d6099e88d)@alcavaz Rebol/Core runs fine on Linux, Rebol/View requires some extra libs.

endo64

[16:15](#msg5748729e454cb2be094f93af)Have a look here as well: http://rebol2.blogspot.com.tr/2012/09/linux-packages.html

Zamlox

[18:51](#msg5748972af44fde236e510d50)@alcavaz for Ubuntu 14.04 you can try following commands with root permissions:

```
dpkg --add-architecture i386
apt-get update

apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
apt-get install -y libx11-6:i386
apt-get install -y libxext6:i386
apt-get install -y libxt6:i386
apt-get install -y libxaw7:i386
apt-get install -y libfreetype6:i386

add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
apt-get update
apt-get install -y xfonts-100dpi
apt-get install -y xfonts-75dpi
```

then reboot your system.

iArnold

[20:33](#msg5748af2c10f0fed86f48e6e7)http://www.rebol.com/article/0545.html Carl "promised" to fix this and some other things. But like most of us life takes the better part of our efforts. In Carl's case one can argue he has already done enough for all of us :fishing\_pole\_and\_fish:

alcavaz

[20:38](#msg5748b0606bbc2d1d4deee14c)thank you @endo64 @dockimbel @Zamlox @iArnold

[20:39](#msg5748b09c454cb2be094fa7f9)everything is working now

## Sunday 29th May, 2016

vdsfr

[19:38](#msg574b452b10f0fed86f4947fa)Hi, How to assign a name to a face? I could not find an equivalent of "to-set-word" thanks.

## Monday 30th May, 2016

dockimbel

[05:33](#msg574bd0a7a0fc3091611b1f78)@vdsfr Hi! Do you have a short code example of what you want to achieve? From VID, it is easy to do. If you need to access a face after the layout has been constructed by a VID code, you can navigate the tree of faces (starting from a known face, like the window for example), using `pane` field for accessing children faces, and `parent` to access the parent face.

vdsfr

[10:35](#msg574c176b10f0fed86f496ee8)@dockimbel I have some code from R2/R3 where I use constructs like: rebol\[]  
btn-grid: copy \[across backdrop forest ]  
repeat row 4 [  
repeat col 7 [  
b-var: rejoin \["R" row "C" col]  
append btn-grid compose\[( to-set-word b-var) btn 40x30 (b-var)]  
]  
append btn-grid 'return  
]  
view layout btn-grid ; I just missed the to-set-word. Some modifications and walking the faces should do. Thanks!

dockimbel

[10:43](#msg574c195c6bbc2d1d4def6583)@vdsfr Use `(load append b-var #":")` instead of `(to-set-word b-var)` as `to` is only partially implemented for now.

vdsfr

[10:47](#msg574c1a486bbc2d1d4def65b9)@dockimbel OK. that implies much less modifications.

## Friday 3th June, 2016

RonG69

[03:22](#msg5750f80af44fde236e530771)New to Red/Rebol. Tried to compile "ask" got "Compilation error: undefined word ask". Any ideas?

dockimbel

[03:36](#msg5750fb41a66904962ebbd95b)@RonG69 Welcome! `ask` is not part of the standard runtime library yet (it will be after 0.7.0), so you have to include the `%input.red` file, like this:

```
Red []

#include %environment/console/input.red
...your code here...
```

RonG69

[03:41](#msg5750fc83454cb2be095195ec)Compilation error: word limit not defined in system/console/limit

dockimbel

[03:42](#msg5750fcbf2482004e29f6633c)Let me have a look at it...

RonG69

[03:43](#msg5750fcdef44fde236e530828)Red \[]  
#include %environment/console/input.red  
name: ask "What is your name? "

[03:44](#msg5750fd10a78d5a256e3a8173)I can wait for .70. No problem. Thank you.

dockimbel

[03:55](#msg5750ffa6a66904962ebbd964)@RonG69 I have pushed a fix for that, please \[download](http://www.red-lang.org/p/download.html) the latest build and give it a new try.

Jabab1983\_twitter

[06:34](#msg575124e710f0fed86f4ae54f)Hi everybody! I've playing around with red these days and I'd like to ask you, is rebol the place to start? it's exactly te same syntax? are there any other resources?

[06:34](#msg575124eaec10ddbb09dd5e46)thx

pekr

[06:38](#msg575125f3a78d5a256e3a87c0)You can use Rebol manuals to some extent. Red is, syntax wise, mostly compatible with Rebol. Of course consult help system in console to check, if the feature is available and if it shares the same semantics - there might be slight changes or featuress missing, as we are still not at 1.0

Jabab1983\_twitter

[06:48](#msg5751284df44fde236e530f1d)Ok, I'll try this way and see how it works. Thx.

Mat2

[21:48](#msg5751fb20824488852c4ebee0)hello, I'd like to ask what's the current status toward self building Red and which time estimation therefor is foreseeable ?

## Saturday 4th June, 2016

dockimbel

[03:43](#msg57524e7da30177644b997d0f)@Mat2 Hi! Red is currently bootstrapped using Rebol language for the toolchain implementation (the runtime library is entirely written in Red) which should hold until 1.0 release. After that, we'll start working on Red 2.0 which is the self-hosted Red (basically re-writting the toolchain in Red). No ETA for 2.0 for now, as reaching 1.0 is our current focus and it's already a big work. Though, more help into getting 1.0 done would speed it up. ;-)

SteeveGit

[07:36](#msg57528511cfb72da835efa1a1)

## Tuesday 7th June, 2016

SannInnovations

[23:14](#msg5757555a662b042b7e595c51)Hello all, am new to RED/REBOL and must say I am loving this programming platform like my life depended on it :smile: I have a question on how to get all RED's syntax in one place? It seems the information is scattered all over the internet (with the exception of Github), but it will make more sense if there is a one go to source to quickly type and look up a RED syntax and how to use it in a block of code. I come from the LiveCode (smallTalk) background and have been spoiled for having every platform syntax in one "Dictionary" (accessed via the IDE of course), so I will volunteer my time to create a companion app/software, acting more like a dictionary, as a companion of RED syntaxes. I will need the raw syntax files to begin with and will appreciate pointed in the right direction. Thanks

## Wednesday 8th June, 2016

dockimbel

[04:01](#msg5757988b9b49138f12800ddf)@SannInnovations Welcome! You can start exploring the existing documentations from \[here](http://www.red-lang.org/p/documentation.html), maybe \[this one](http://www.red-by-example.org/) is what you are looking for? Using the built-in `help` command from the console is also a good way to get a quick look at a word definition or function usage instructions. You can also ask @Arie-vw in \[red/red](https://gitter.im/red/red/) channel if you want to contribute to his work on providing an exhaustive dictionary.

pekr

[04:04](#msg5757994f45cf128e5f1d6f4d)And `source`to inspect mezzanine (Red level) function source code in console ...

iArnold

[06:15](#msg5757b80a45cf128e5f1d7449)@SannInnovations What you are looking for is http://try.rebol.nl

endo64

[07:32](#msg5757c9f9970521a45839f570)Is it a regression or block!s can't be used as below example?

```
red>> x: [print "ok"]
red>> view [button "test" x]
*** Script error: copy does not allow word! for its value argument
```

Zamlox

[07:36](#msg5757caf517856dc5179b51da)@endo64 if you compose, it works:

```
view compose/deep [button "test" [(x)]]
```

dockimbel

[07:38](#msg5757cb5917856dc5179b51f4)@endo64 Was that working before (I can't remember)? If so, do you know roughly when that changed?

endo64

[07:54](#msg5757cf2875a601a158b0d3ae)I cannot remember if it was working before, probably I'm confused with R2.

[07:57](#msg5757cfda75a601a158b0d3df)But I can checkout an older version and test if you like?

dockimbel

[08:07](#msg5757d23a92fc7c915f57d07c)@endo64 No need, I can search the git history. According to VID source code, it should be supported, so it might well be a regression, or it just was broken since the beginning as I don't remember ever testing that.

[08:10](#msg5757d2dbb5122bc217788b47)Someone can open a ticket for it, and submit a PR if the fix is simple enough.

SteeveGit

[09:16](#msg5757e2669b49138f12800ef7)I think it's recurrent within VID dialect, (IIRC, path! didn't work at some point). We could use the same trick than Rebol (a do/next on whatever follows and is not a reserved VID word or a style). It would also pemit regular code as data without the need to define words first. As in:

[09:16](#msg5757e289c6414c76528c10ed)`view [text form 1 + 1]`

dockimbel

[09:28](#msg5757e53ac2a6e42f7e99704b)@SteeveGit Yes, that's what we plan to do once we have support for `do/next` (will come this week).

[09:29](#msg5757e58392fc7c915f57d78f)@endo64 @SteeveGit Could we keep those discussions in red/red room, this room is really for welcoming newcomers, not for old'timers chats. ;-)

SteeveGit

[09:30](#msg5757e5b2c6414c76528c1103)I was following the flow :baby\_chick:

dockimbel

[09:31](#msg5757e5ddc2a6e42f7e997082)@SteeveGit I know, no problem. I should have answered endo's question in red/red. ;-)

SteeveGit

[09:33](#msg5757e66607e77197794fffcd)Welcome to newcomers! :sparkles:

dockimbel

[09:33](#msg5757e675662b042b7e597be7):-)

iArnold

[09:37](#msg5757e76a75a601a158b0dc01)Booh! Oldtimers! ;-P

endo64

[11:44](#msg5758052a662b042b7e598510)Oldtimer! Me! I'm flattered :) I thought that I might missed some simple point hence asked here.

## Friday 10th June, 2016

dheerajsoorma\_twitter

[06:24](#msg575a5d041cf76dd64535c7da)hi

[06:24](#msg575a5d0c064b9e7266f12a31)i am new \\

pekr

[06:28](#msg575a5e02a1be01c01a7892cc)Welcome here and enjoy Red :-) You can ask questions here, but there are also some other channels/rooms available

[06:28](#msg575a5e25814a56807141ac3c)The main one, for developers, is - https://gitter.im/red/red

## Thursday 16th June, 2016

Phryxe

[13:16](#msg5762a6b0da1c26b04536c3b3)I wonder what changed in Red for me to get this in latest build while I didn't get it in 0.6.0 ... I hesitate to show my amateur code ;^p

```
*** Script error: modify does not allow none! for its target argument
*** Where: modify
```

dockimbel

[14:42](#msg5762bacc09a91a8d73d6e819)@Phryxe Without your code, how can we reproduce it?

Phryxe

[14:43](#msg5762bb2adfb1d8aa45a42208)

```
Red [title: "Toggle" needs: 'view]
a1: "Alternative 1"
a2: "Alternative 2"
view [
	title: "Toggle"
    below
    t: text 80x20 "Two alternatives"
    f1: field 80x20 data [random [a1 a2]]
	f2: field 80x20 data [random [a2 a1]]
	button 80x20 "Toggle" [
        either f1/text = a1 [f1/text: a2] [f1/text: a1]
		either f1/text = a1 [f2/text: a2] [f2/text: a1]
	]
]
```

dockimbel

[14:57](#msg5762be48ea84f717479b9db4)The error is legitimate, but not very helpful, I've opened a ticket to improve that. You are passing a block to the fields, but fields are expecting strings not blocks, so the content of your `data` blocks is never evaluated.

[15:02](#msg5762bf8709a91a8d73d6e847)@Phryxe Your initialization code needs to go into a separate `do` section in your VID code:

```
Red [title: "Toggle" needs: 'view]
a1: "Alternative 1"
a2: "Alternative 2"
view [
    title: "Toggle"
    below
    t: text 80x20 "Two alternatives"
    f1: field 80x20
    f2: field 80x20
    button 80x20 "Toggle" [
        either f1/text = a1 [f1/text: a2] [f1/text: a1]
        either f1/text = a1 [f2/text: a2] [f2/text: a1]
    ]
    do [
    	f1/text: get first random [a1 a2]
    	f2/text: get first random [a2 a1]
    ]
]
```

Phryxe

[16:15](#msg5762d0b952352c840282e50c)@dockimbel Thanks for taking the time to look at it.

dockimbel

[16:18](#msg5762d1496111a28c047b873b)You're welcome. ;-)

## Thursday 23th June, 2016

RnBrgn

[12:28](#msg576bd5e0c7061d590d537605)Is there a shorter way to write each element of a block to a file? Write/append does not take a block as an argument.

```
foreach [name address phone] users [
 write/append %users.csv mold name 
 write/append %users.csv mold address
 write/append %users.csv mold phone
 write/append %users.csv "^/"
]
```

dockimbel

[13:29](#msg576be42d3b4cb6687034b2c1)@RnBrgn One possible way to achieve it:

```
foreach [name address phone] users [
	write/append %users2.csv form reduce [
		mold name mold address mold phone "^/"
	]
]
```

RnBrgn

[14:57](#msg576bf8c40ede04dc49049047)that worked fine. Form converts the block contents to a string and reduce evaluates contents of the block. I wouldn't have thought to try that with the limited experience I have with all the functions/words Red provides. Thanks.

dockimbel

[15:09](#msg576bfb9e89c0b3b310de9d82)@RnBrgn Another important point with `form` is that it will insert an extra space between values. So, useful feature to remember. ;-)

RnBrgn

[18:54](#msg576c306cc7594b5f0dd29f68)Thanks. `form` caused an issue for me because Excel had a hard time with spaces before and after the commas I was inserting to create the csv file so I used `append ""` instead.  
I'm not sure how `append "" [block]` works . Why appending an empty string to a block removes spaces and converts the block to a string?

```
foreach [name address phone] users [
x: reduce [mold name","mold address","mold phone"^/"]
y: append copy "" x
    write/append %users2.csv y 
	]
```

## Friday 24th June, 2016

dockimbel

[02:59](#msg576ca22389c0b3b310dea327)@RnBrgn You are appending a block to a string, so `append` will process all the block elements one by one, appending them to the string one after the other. If a value in the block is not a string, `append` will convert it using `form`.

## Sunday 26th June, 2016

daddie888\_twitter

[19:30](#msg57702d59bb1de91c5472b530)Hello, justy installed and tried Red, nice! One problem, I have only the guid-console-...exe, no red.exe. If I try to execute a .red script with this exe the console starts and shows \*\** Error: cannot access argument file

[19:32](#msg57702dd9632b75030f744ff4)Can run it from the console with do %hello.red, but how to execute it from the CMD prompt ?

iArnold

[19:33](#msg57702e01a0c12d110f8bbf37)You need to compile your script first for that.

daddie888\_twitter

[19:36](#msg57702eb0265214c1306b1795)Thnx, but how ? I only have gui-console-2016-3-26-9662.exe

iArnold

[19:37](#msg57702ee8bb1de91c5472ce82)(And you compile using the Rebol/View program from http://www.rebol.com/downloads.html )

[19:38](#msg57702f32632b75030f746251)Say you put that in program and have red-master in there too. So start Rebol/View push the Console button and type

```
cd red-master
do %red.r
rc "-t Windows -o %output.exe %inputscript.red"
```

daddie888\_twitter

[19:43](#msg577030588441a8124d53d860)renamed red-060.exe, what I initially download and that compiled the console to red.exed and now I can compile, but I'm a bit disappointed: 418Kb for hello.red-&gt;hello.exe, is there no way to execute the script itself from the command line like with ruby and python ?

[19:52](#msg577032651ac8bd1a4d5eaa78)hah, found it: red hello.red, but the console is started and the output displayed in there, not in the CMD console itself like you would suspect for a non-graphical script ..

RnBrgn

[20:24](#msg57703a02632b75030f74e0bb) good link below explaining different ways to run Red.  
https://github.com/red/red/blob/master/README.md

[20:44](#msg57703e938441a8124d548469)@daddie888\_twitter from terminal window or dos prompt type:  
red --cli hello.red

## Monday 27th June, 2016

dockimbel

[02:53](#msg5770951bfd5f24f519be5815)@daddie888\_twitter The Red runtime is a necessity in order to support all the language semantics. Remember that Red is before all, a rich data format with about 50 datatypes that you can load or create at runtime at will. If final exe footprint is a big concern, you can reduce it drastically using \[UPX](http://upx.sourceforge.net/) for example. Also, another approach for very small executables is to use only the \[Red/System DSL](http://static.red-lang.org/red-system-specs-light.html), which is for system programming. An helloworld in Red/System will just wait a few kilobytes once compiled (but you'll give up then all the main Red language niceties).

iArnold

[05:31](#msg5770ba3597171715545a5f65)That is why the GUI-console.red is such a small script and still can handle to run all those scripts you tell it to execute.

dockimbel

[05:33](#msg5770bac653cf814d72742d9d)@dockimbel  
&gt; @daddie888\_twitter An helloworld in Red/System will just wait a few kilobytes ...

I meant "weight", sorry for the typo.

pekr

[05:36](#msg5770bb588c9263ba30fe4566)@daddie888\_twitter "is there no way to execute the script itself from the command line like with ruby and python ?" .... I somehow don't get it. If you execute those script from the command line, you call their interpreter anyway, which surely is not of small size either? Even today you can run `gui-console.exe hello.red`as a parameter. Not sure with console.exe, as it does not work for me ...

[05:37](#msg5770bb94a0c12d110f923594)@dockimbel should console.exe compiled from sources work? It compiles here, but pressing enter, nothing happens (even when run from cmd.exe)

dockimbel

[05:49](#msg5770be5b86609e810f51bee2)@pekr It works fine here. I don't get what you mean by "pressing enter".

pekr

[05:50](#msg5770bea4bb1de91c54796344)Enter/double click in Total Commander. Then I reverted back to cmd exe, typing console.exe (pressing enter) does not launch it here. gui-console.exe works ok ... Win10 here - should we move to Red channel?

[05:56](#msg5770c029265214c13071f0c9)@daddie888\_twitter Here's my output of what you try to achieve:

```
c:\!rebol\!Red\red>console hello.red
Hello, world!
Χαῖρε, κόσμε!
你好, 世界
Dobrý den světe
```

[06:00](#msg5770c1061ac8bd1a4d64d217)Now how to get the console.exe compiled:

1\) download rebol/view interpreter and place it into the Red distro root  
2\) run rebol  
3\) run: do %red.r (with the security requester, select Allow all")  
4\) run: rc %environment/console/console.red  
5\) for gui console, run: rc "-t Windows %environment/console/console.red"  
6\) your console.exe and gui-console.exe is going to be created in the Red repo root

dockimbel

[07:42](#msg5770d8e5632b75030f7c57a4)@pekr What @daddie888\_twitter needs is just `red --cli hello.red` as given by @RnBrgn.

pekr

[08:33](#msg5770e4e78c9263ba3000981e)Well, I don't like red.exe, dunno why, I am looking forward to when red is self hosted :-)

## Tuesday 28th June, 2016

Respectech

[20:23](#msg5772dcbaa0c12d110fb27816)How much longer before 0.6.1 is announced? ;-p

pekr

[20:24](#msg5772dcf0a0c12d110fb27d58)depends upon your timezone - we europeans are already enjoying the release. Most probably slow connection to US ... just kidding :-)

Respectech

[20:27](#msg5772ddcb265214c130912ee6)I'm going to be in Zurich, Vienna, Munich and L'viv starting in a week, so I'll be able to enjoy those early releases as well, right?

pekr

[20:28](#msg5772ddf6bb1de91c5498cba4)Exactly. And remember - Prague and Brno always get an early access, but - that's only for big boys :-)

## Wednesday 29th June, 2016

iArnold

[06:27](#msg57736a57bb1de91c549fe53e)&gt; Well, I don't like red.exe, dunno why, I am looking forward to when red is self hosted :-)

Same here, GUI-console to test scripts directly and a Rebol/View to compile scripts suffices.

pekr

[06:28](#msg57736a8f1ac8bd1a4d8bb6b8)Simply put - GUI console is too good to miss - it is a base for all my Red related experiments!

iArnold

[06:28](#msg57736aa99717171554818b79)&gt; How much longer before 0.6.1 is announced? ;-p

It was a "couple of days" that became a few weeks, so "a few hours" translates as "end of the week" ;-)

pekr

[06:29](#msg57736ae0bb1de91c549feb61)We are still in the middle of the week. Iron Maiden has one song, called - The longest day. Each release date is a longest day :-)

[06:30](#msg57736b03bb1de91c549feba3)However, this is welcome channel, I miss a bit general - friends channel, it could be called Red Coffee :-)

dockimbel

[06:31](#msg57736b27fd8a28fd3d37f13a)&gt;&gt; It was a "couple of days" that became a few weeks, so "a few hours" translates as "end of the week" ;-)

This is how you consider "helping" Red project? And you post that in red/welcome channel? You seem to like the Ren-C project a lot, maybe you should consider joining it for good!

iArnold

[06:31](#msg57736b3abb1de91c549fec46)@Respectech Bit too south for me. Have a good trip.

[06:35](#msg57736c238441a8124d8126ce)@dockimbel Is that showing your true face on the welcome channel then?

pekr

[06:37](#msg57736ca8bb1de91c549ffe46)@dockimbel pardon me, but you really start to be a too picky. I know that this channel is linked to Red lang website. But - I think that most of ppl are capable enough to understand information in context. And the context here is - pre-release waiting, which is mostly a relaxing for us, not a tension. I can notice such rather picky reaction over multiple channels, being it Github comments, Google groups and please consider it as a constructive feedback - NOONE is here to hurt Red project, to put it into bad light or anything like that ...

dockimbel

[06:38](#msg57736ce5bff9f48f6a75baa8)@pekr If you think that's a "constructive" feedback, you should check the definition of that word again. Arnold is clearly bashing the Red team or the Red project regularly using passive-aggressive posts, moreover doing it in the channels which we use for newcomers, like here or the ML. As he seems to be a great supporter of Ren-C project, I can see the logic of his behavior.

pekr

[06:39](#msg57736d26bb1de91c54a00260)Really ... I can feel that ppl start to fear to put some questions, to not be accussed of wasting your time. Noone here's really proposing Ren-C or R3 or anything like that. That's why I just said some relax/chatter group might be welcomed, where jokes around the release dates are allowed, as imo, it was just that - a friendly joking ...

[06:40](#msg57736d551ac8bd1a4d8bd800)@dockimbel - I really can't work like that, sorry. The only measure for our intentions is, if the intention was good, or not. And once again - noone here tried to put Red into bad shape .... Enough of that ... from me ...

mydoghasworms

[06:41](#msg57736da9a0c12d110fba1f95)Hello, I am quickly dropping by because I have not been here for a long time. Work takes up all my time and things are very pressurised. But it looks like I came at a bad time, sorry :worried: Will check back later.

dockimbel

[06:46](#msg57736eb9fd8a28fd3d37f1da)@mydoghasworms Sorry for that.

mydoghasworms

[08:35](#msg5773883abb1de91c54a164fa)@dockimbel Not to worry. I just wanted to ask about documentation. When I get time again, I would like to add a getting started guide to the docs. But GitBook is not like GitHub, is it? You cannot just clone a project and submit pull requests, right?

dockimbel

[09:39](#msg5773973d8c9263ba30279ae0)@mydoghasworms Sure you can, the source code for our Red gitbook is there: https://github.com/red/docs

[09:41](#msg577397b7971717155483e442)About the format, the documents are currently using Markdown, though we should switch to Asciidoc format at some point (I just need to find time to learn it). Though, Markdown should be straightforward to convert as IIRC, most of MD syntax is supported by Asciidoc.

mydoghasworms

[09:56](#msg57739b6aa0c12d110fbcbd9b)@dockimbel That is great, thanks! :+1:

mindv0rtex

[13:42](#msg5773d044971717155486cf23)@dockimbel pandoc can convert Markdown to Asciidoc, FWIW. I'm sure you knew about it already :-) Awesome job with Red, btw. I am a regular corporate coder of scientific applications in C++ and Python, but Red is the only language that made me interested in learning something different! Good luck with the release and don't let the pressure get the best of you!

dockimbel

[13:45](#msg5773d0e10898e10d2395a5fb)@mindv0rtex Hi, thank you for your kind words! Markdown has many limitations with, e.g. tables or even just centering an image horizontally, so I guess I will not escape learning Asciidoc if I want better looking docs. C++ / Python, that's interesting, so I guess you're sold to the "fullstack" approach of Red? ;-) NumPy-like library is certainly something I would be glad to add to the Red basket someday, hopefully, someone would contribute it first. ;-)

mindv0rtex

[13:53](#msg5773d2f3bb1de91c54a5a267)I am not entirely sure about your use case, I found the pandoc markdown with occasional raw HTML sprinkled here and there to be sufficient, but then again, I just use it to produce stand alone HTML: \[http://elementsofphysics.com/kinematics.html](http://elementsofphysics.com/kinematics.html) Yes, I am very much sold on the fullstack thing. I dislike C++ warts, but the problem with Python is that, despite its "prototyping speed", it actually imposes lots of cognitive load when doing scientific computing, because once you use too many of its niceties, it kills all the performance. So then you have to throw most of it away to work with the subset that is supported by numba or Cython.

[13:55](#msg5773d3401ac8bd1a4d915953)But on the flip side its hard to argue against the amount of awesome libraries Python has :-)

dockimbel

[14:00](#msg5773d49bf52768dc0cae76bc)Thanks for the insights. Nice documentation, so Asciidoc is good at math formulas support it seems. Yes, libraries are the great advantage of Python's ecosystem. We'll see how much we can catch up with Python after 1.0. If Red is up to the expectations, maybe we can make a few miracles happen. ;-)

Respectech

[19:26](#msg577420e597171715548c05dc)@dockimbel I understand the frustrations of adding features to an existing codebase and the difficulties that can happen because of it. However, I have no experience with this on a project of the scale of Red. I just wanted to say "good job" and that I am eagerly awaiting the upcoming releases because I'm looking forward to switching most of my development to use Red.

[19:27](#msg5774210497171715548c067e)I have two companies that use software written primarily in Rebol2 and Rebol3 with a bit of Red here and there, plus other languages.

[19:28](#msg5774214a8441a8124d8bf132)I'm expecting that Red will become the primary language for our company infrastructure in the near future!

[21:34](#msg57743ed28441a8124d8dc2c2)Let me be the first to say "congratulations" on the 0.6.1 release!

dockimbel

[21:34](#msg57743eefcd7efd77149822de)@Respectech Thanks Bo! ;-)

SteeveGit

[22:18](#msg57744923cd7efd7714982393)Congratz Nenad (t'as fait ta nuit blanche finalement ;-) )

Respectech

[22:51](#msg577450e1bb1de91c54ad35bf)It's going to be a new trick for my brain to start thinking in reactive programming. I'm very familiar with reactions in spreadsheets, so maybe that will help somewhat. :-)

[23:01](#msg5774535e632b75030fb0b347)Is the 25 ball limit on the follow example a memory or stack limitation?

RnBrgn

[23:11](#msg577455bea0c12d110fc813ba)@dockimbel Congrads on 0.6.1. and thanks again for all the help in the Red/Welcome room.

Respectech

[23:23](#msg577458841ac8bd1a4d9975be)I'm impressed by how much faster the worm.red demo is when it is compiled, as compared to interpreted. To be expected, I guess, but nice anyway!

dander

[23:41](#msg57745c938441a8124d8f5641)Congrats to the Red team! :clap: I hope you all will be enjoying some much deserved rest :smile:

## Thursday 30th June, 2016

ghost~5680c5f416b6c7089cc058a5

[03:33](#msg57749323632b75030fb3c032)@Respectech Regarding the 25 ball stack limitation -&gt; :point\_up: \[June 29, 2016 8:42 AM](https://gitter.im/red/red?at=57733c990898e10d2395642a)

Phryxe

[14:51](#msg5775320da0c12d110fd3ba93)Is there a limitation to where you can use a `comment { }`? Doesn't seem to work inside a `view` block ...

dockimbel

[15:11](#msg57753693186ccb534502cadf)@Phryxe Yes, `comment` is a function, not a syntactic contruction like `;`, so it doesn't get removed. The need for a multiline comment syntax comes from time to time, though, we haven't reached consensus so far on what such syntax should be. Moreover, many code editors support multiline commenting using `;`, so the incentive is not strong to find a suitable solution.

DarioX1973\_twitter

[15:46](#msg57753eba1ac8bd1a4da57e04)is this the channel for newbie?

dockimbel

[15:46](#msg57753ee63da1a2ce671ca5ac)Welcome! Yes it is. ;-)

DarioX1973\_twitter

[15:49](#msg57753f7f97171715549b9a17)Ok. I thinks Red is amazing and perfect for what i need. I was trying to port a simple algoritm i had in python, to check the Red performance in elaborating text. Very simple algotrm, i only don't understand ho to do this

[15:49](#msg57753fa4265214c130b21948)mycheck = t.isalpha() or t.isnumeric() # where t is my char i am poiining now

[15:50](#msg57753fd9632b75030fbcf1e8)ho do i check if a char of a utf8 string i have in memory is a letter or numeic (and not symbol, for example)? i did'nt find it in documentation ...

[15:51](#msg57753fe5632b75030fbcf6ad)or i am a dummy :-/

[15:51](#msg57753ffe632b75030fbcfc1b)how

[15:51](#msg57754018265214c130b22337)sorry for very stutid question :-/

[15:53](#msg577540808c9263ba303fa28c)i tryed rebol many times ago, but today i see Red is becamed really mature and would like to learn it

dockimbel

[15:54](#msg5775409c3da1a2ce671ca61a)You need to create a bitset! value for alpha and another for numbers. Let me find you some docs pointers.

[15:55](#msg577540f6f58c9dea732afcfb)Is your alpha range limited to ASCII or Latin?

DarioX1973\_twitter

[15:57](#msg57754168632b75030fbd1ea8)i have text in italian, french, spanish ... no other type of texts ... in python i use utf8 ... in pascal , i use utf16 (2 byte for a char, i mean, as you know).

[15:57](#msg577541728c9263ba303fbaf6)no asian texts i mean

[15:58](#msg577541928c9263ba303fbdf8)i elaborate utf8 texts ...

dockimbel

[15:58](#msg5775419b186ccb534502cd42)So your data in memory is a string or an array of bytes (not the same thing in a Unicode-aware language)?

DarioX1973\_twitter

[16:00](#msg5775422e632b75030fbd31ed)mmmmmh ... i explain better: i read an utf8 text in Red. Ok it works! I walk on char after char, and if the char is a letter or a numeric, or a symbol, i have to do different tasks.

[16:00](#msg57754239a0c12d110fd4fc19)a string, in memory

[16:01](#msg57754248a0c12d110fd4fc3a)text: read %./pippo.txt

dockimbel

[16:01](#msg5775425c186ccb534502cd54)Ok, got it. The fastest and simplest way is to use the \[Parse](http://www.rebol.com/docs/core23/rebolcore-15.html) dialect for that.

DarioX1973\_twitter

[16:01](#msg5775425d632b75030fbd353a)where pippo.txt is a utf8 text (italian, french, ecc)

[16:04](#msg57754327a0c12d110fd51261)Thank you so much Nenad, I saved the page and I will study. :-)

dockimbel

[16:05](#msg5775433df58c9dea732afd6b)Here is a skeleton code you can start with:

```
alpha: charset [#"a" - #"z" #"A" - #"Z"]
digit: charset "012345789"
parse text [some [s: alpha (taskA s/1) | digit (taskB s/1)]]
```

[16:06](#msg57754384186ccb534502d031)That parsing rule will iterate over all the string characters and trigger different tasks depending on the matched charset (you can extend them and add more of them).

DarioX1973\_twitter

[16:08](#msg5775440e97171715549befa5)Ok, thank you very much. I will try and i will inform you on my benckmarks (i have the same algoritm in pascal and python). :-)

[16:09](#msg5775443297171715549bf29f)Goodbye :-)

dockimbel

[16:09](#msg577544323da1a2ce671ca8e2)Additional mention: the \[splitting](http://www.rebol.com/docs/core23/rebolcore-15.html#section-2) feature of Rebol Parse is implemented as a separate `split` function in Red, it's not supported directly by our Parse.

[16:09](#msg57754442186ccb534502d055)Have fun! ;-)

DarioX1973\_twitter

[16:10](#msg57754490a0c12d110fd53089)I don't understand, bu i saved the "mention":-)

greggirwin

[16:11](#msg577544b41ac8bd1a4da5d873)I'll have a sample in a sec Dario

dockimbel

[16:11](#msg577544b63da1a2ce671ca8f9)You'll get it when you'll go through that doc. ;-)

pekr

[16:11](#msg577544bc1ac8bd1a4da5d89d)Split is another function to work with text (dividing it by defined separator). Split is not using PARSE

DarioX1973\_twitter

[16:11](#msg577544bd8c9263ba303fe6c1)Goodbye from Florence :-)

[16:11](#msg577544cb8c9263ba303fe6ea)oh...i wait ...if you are so kind, Gregg

dockimbel

[16:12](#msg577544dcf58c9dea732afd9c)@DarioX1973\_twitter Lucky you, such a beautiful city and delicious food!

greggirwin

[16:12](#msg577544dc97171715549c008b)

```
alpha: charset [#"a" - #"z" #"A" - #"Z"]
digit: charset "012345789"

task-a: func [ch][print ['alpha ch]]
task-d: func [ch][print ['digit ch]]
text: "a1b2cd34"
parse text [some [s: alpha (task-a s/1) | digit (task-d s/1)]]
```

[16:12](#msg577545001ac8bd1a4da5e365)If you paste that into the gui console, you'll see it step through and print each char it identified.

DarioX1973\_twitter

[16:12](#msg577545018c9263ba303ff0f7)Thanks for Florence :-)

[16:15](#msg5775459d8c9263ba303ff590)Yes Greg, it give me:

[16:15](#msg5775459e8c9263ba303ff594)alpha a  
digit 1  
alpha b  
digit 2  
alpha c  
alpha d  
digit 3  
digit 4

greggirwin

[16:16](#msg577545e68441a8124d9bec0b)You can also extract data from the input stream, rather than using the current index:

```
alpha: charset [#"a" - #"z" #"A" - #"Z"]
digit: charset "012345789"

task-a: func [ch][print ['alpha ch]]
task-d: func [ch][print ['digit ch]]
text: "a1b2cd34"
parse text [some [copy ch alpha (task-a ch) | copy dg digit (task-d dg)]]
```

[16:16](#msg577545f697171715549c0d8b)Is that enough to get you started?

DarioX1973\_twitter

[16:19](#msg577546781ac8bd1a4da5f298)Yes, really enough. Many thanks also to yo, Gregg !

greggirwin

[16:19](#msg5775468c8441a8124d9bf05d)Great! Have fun.

DarioX1973\_twitter

[16:21](#msg577546f5632b75030fbd74ef)Goodbye! i cam back to my daily office work (in Delphi ... great support, thanks. :clap:

Phryxe

[17:20](#msg577554e097171715549d09d8)@dockimbel Thanks for the explanation.

## Friday 1st July, 2016

grahamf21

[08:59](#msg577630fc8441a8124da7576b)Hi, I tried cloning a reactor! object but the clone doesn't seem to be reactive. I've tried 'make' and 'copy' to clone.

dockimbel

[09:01](#msg577631858441a8124da760e5)@grahamf21 Did you use `is` operator to set up the reactions?

grahamf21

[09:05](#msg5776324fa0c12d110fe05209)Hi Doc, yes I did use 'is'. The original object works fine.

dockimbel

[09:08](#msg577632f6265214c130bdc612)@grahamf21 After defining the first object, just PROBE it, what you clone is what you see (just a simple object). `reactor!` is not a new datatype, it's just a template for creating objects, the reactive formulas are not stored into the object itself, so you need to re-apply them in the spec block in MAKE case. COPY cannot work on a reactive object, as it will just copy the "result" of the reactions.

grahamf21

[09:09](#msg5776332e632b75030fc8dec2)Thanks, Doc. I'll try again.

dockimbel

[09:10](#msg5776337f632b75030fc8e42a)Though, you are raising an interesting question about the reflectivity of reactive objects. That's something we might be able to improve, so that you can get the reactive formulas back using BODY-OF accessor. This is anyway a new territory we are exploring, so feel free to share your findings and issues in red/red channel.

pekr

[09:12](#msg57763412632b75030fc8ef5b)When probing an object, and testing e.g. a/total, it returns integer. It can't be seen it is a reactor at first sight. Could that be improved somehow? I e.g. tried `react? a 'total`, but it returns none

[09:13](#msg577634278c9263ba304bb3cf)In above referring to the Blog article example

dockimbel

[09:15](#msg577634cd1ac8bd1a4db11648)@pekr `react?`can only check for reactive sources for now (it's in its docstring), not yet reactive targets. Though, it should be trivial to add support for that. I'm making some improvements right now on the reactive framework, so I'll include that too.

pekr

[09:16](#msg577634e19717171554a7e099)Thanks ...

[09:17](#msg5776351ca0c12d110fe071e2)Don't want to be picky on details, but will ask anyway - would not `reactor?`, even if longer, sound better? (non an englishman here, just some feeling)

dockimbel

[09:19](#msg577635a78441a8124da7a06b)It could, but 1) a reactor in our terminology means a reactive source, we would need another function then for checking for targets, 2) it's too close to `reactor!`, so user would be confused about why it doesn't check if an object is a `reactor!` or not. So it could maybe be used for that last feature instead.

pekr

[09:23](#msg57763689265214c130bdfbad)One observation - I tried to use a reactor example, and the second one, I used object! instead of reactor! ... from probing both, I could not tell the difference. The `total`field is an integer. In that sense, I tried `a/total: 100 b/total: 100`- both allowed that. Both probed the value. Then I used `a/x: 10`and its total was reset .... My feeling is, that reactive object field could return an error, when one tries to set it directly? It would help to see, it's a reactor?

dockimbel

[09:26](#msg57763740632b75030fc9185f)That's an option, though in practive, I'm not sure if it's a good idea or not to block that, users could be willing to set a default value, and even change it later, before triggering any reaction.

pekr

[09:29](#msg5776380e9717171554a80b7a)Yes, basically it works ... until you set some of reactive fields. At first sight, I was surprised (althought it might be an intention), that type? a/total is an integer! I expected, when probing an object, to see the formula. But - that would not work, if one thinks about it as an Excel sheet, wher you want to see a value and don't care about the formula behind. OTOH, I would like to have some way, apart from sources, to see the code block, as I can see it via F2 in Excel. What about some reflector? e.g. `reactor-of object`

[09:31](#msg5776387b9717171554a80ebe)Ah, that' what probably `react?`is for ...

DideC

[09:53](#msg57763da9265214c130be5aa4)Saying that reactivity allow things "like Excel formula" does not mean it's the same thing.

[09:57](#msg57763e9bbb1de91c54c61710)It's just to help people understand what is it. But Red is not a spreadsheet ;-) Just that reactivity allow to make a spreadsheet like app pretty easilly now.

dockimbel

[10:19](#msg577643b18c9263ba304c6c60)@DideC Just wait to see the demo that I'm cooking, which I will release after this weekend. ;-)

PeterWAWood

[10:25](#msg577645128441a8124da868ef)@dockimbel It's the weekend here ;-)

DideC

[10:45](#msg577649daa0c12d110fe175d6)I will saw that later : holidays time just right now. Away from the Web for one week. Hmmm.

pekr

[10:46](#msg57764a18a0c12d110fe178e7)You need a Red mobile :-)

## Monday 4th July, 2016

DarioX1973\_twitter

[09:31](#msg577a2d09bdf63af92df7c9aa)Hello!

[09:31](#msg577a2d0bbdf63af92df7ca37)https://snag.gy/51jeqx.jpg

[09:32](#msg577a2d1fcdab7a1f4fe60967)i paste the red code ...

[09:32](#msg577a2d36cdab7a1f4fe60c70)http://pastebin.com/tBraU4QG

[09:33](#msg577a2d6026ff03984ac825df)i didn't use parsing becasue i am too much newbie ...

[09:34](#msg577a2d9135bfead3797c21de)the time to elaborate great text file, not that in the example, is very good for me. So, i have decided to continue with Red! a question, i have ...

[09:35](#msg577a2dc65c023e194f771a65)why wcb: copy "" works, but if i use wcb: "" it seems to not work ? because "" is an object?

[09:37](#msg577a2e4abdf63af92df7d87a)another quaestion: surely my first code is horrible for you ... and I have done a lot of style errors or optimization ... some suggestions? :-D

[09:39](#msg577a2ed101d3c8d8793026d3)i love the little executable! using python converted in executable, i had big files ... and i love the speed : i obtain, for example, 3 sec for elaborating a text file of 1,3MByte. The same speed of executable made in python. Bery good i think, because my red code is surely not optimized!

dockimbel

[09:41](#msg577a2f326a8f789e4a20bc84)@DarioX1973\_twitter Glad you have fun with Red! Yes, it is not optimized yet, expect much faster execution for 1.0.

DarioX1973\_twitter

[09:41](#msg577a2f3bbdf63af92df7dd0d)i didn't use parsing because i implemented a simple "finite state automaton", walking char after char and producing table as you see

[09:42](#msg577a2f7ecdab7a1f4fe627a4)really impressed because programming and testing is rapid as in python, or better, but the executable to simply shared is another way to live!

dockimbel

[09:42](#msg577a2f916a8f789e4a20bfaf)@DarioX1973\_twitter I think that's the right way, learning Parse will be easier then, as you'll be able to relate it to the manual parsing code you wrote before.

DarioX1973\_twitter

[09:44](#msg577a2fe526ff03984ac84bf3)yes, i will study parsing after more important fundamentals

[09:46](#msg577a30845c023e194f77425a)but x: copy "" is better than x: "" ?

dockimbel

[09:52](#msg577a31f55c023e194f775dd0)`x: ""` always makes word `x` refer to the same empty string `""`. If you want a new string each time, you need to use `copy` or build it manually using: `make string!`, where `n` is the number of characters to want to pre-allocate for the string's buffer.

[09:55](#msg577a329d26ff03984ac870be)Also, you can simplify `( (length? trim x-string) = 0)` by using just: `empty? trim x-string`. So instead of:

```
either ( (length? trim x-string) = 0) [
    append wpb " "
][
    append wpb x
]
```

you can write it as:

```
append wpb either empty? trim x-string [""][x]
```

DarioX1973\_twitter

[09:56](#msg577a32c935bfead3797c7aed)i will try preallocating string, perhaps it will produce a faster conversion. i will try.

[09:57](#msg577a33055c023e194f7770b2)uau ...

[09:57](#msg577a3314d4b6d5012ecbe55a)i will try these tips ..

dockimbel

[09:57](#msg577a33255c023e194f77738d)@DarioX1973\_twitter You should preallocate only when big buffers are used, otherwise you won't see any speed difference (though, memory usage will be lower).

DarioX1973\_twitter

[09:58](#msg577a333dcdab7a1f4fe65a02)ah ok thanks

dockimbel

[09:59](#msg577a3373d4b6d5012ecbeda1)@DarioX1973\_twitter `empty?` is an alias of `tail?`, returning `true` if the tail of the series is reached (equivalent to testing for an empty series).

DarioX1973\_twitter

[10:02](#msg577a341f6a8f789e4a20f878)append wpb either empty? trim x-string \[""]\[x] ok i understand it, really concise and readable to write

dockimbel

[10:07](#msg577a35626a8f789e4a21090f)Everything is an expression in Red, so you can pipe them as you want.

DarioX1973\_twitter

[10:10](#msg577a360b6a8f789e4a210f9e)I remember trying it - the piping i mean - with Rebol, many years ago now. i abandoned Rebol as there was version 3 , also if i liked rebol sintax. Ok thanks for all Nenad. I'll come back here after have made some other tests. :-D

dockimbel

[10:11](#msg577a3640bdf63af92df83e04)You're welcome. ;-)

DarioX1973\_twitter

[10:14](#msg577a3702d4b6d5012ecc13d5)Ciao, alla prossima. :-D

SteeveGit

[10:20](#msg577a387074aad3585384105a)Welcome Dario, as a reward, here a version of your code using parse:

```
s: "Mise subito mano alla stesura dell'opera, dallo scoppio della guerra, che prevedeva sarebbe stata grave, anzi la più degna di memoria tra le precedenti."
char: charset [#"a" - #"z" #"A" - #"Z" "012345789" "àèéìòù"]
r: make string! length? s 
parse s [
	any [
		copy t some char (append append r t "|") 
		copy t to char (append append r t "|^/")
	]
] 
print r
```

DarioX1973\_twitter

[20:28](#msg577ac6de4fd3816109959192)https://snag.gy/TgVcHn.jpg

[20:28](#msg577ac6df584c2e775bdad1b1)Hello Steeve, really concise but powerfull. How con i convert the CRLF into a space char " " with the parse method you write me? to obtain this, i mean:

[20:28](#msg577ac6eb646385620974b4ee)How can i

[20:37](#msg577ac926584c2e775bdae411)Thanks for the code you send me Steeve! really interesting Red, and I'm sorry to have abandoned Rebol years ago. To have an executable with so few lines of code, it is really impressive for me ... so now i will come back in the Rebol style of programming! also the decision to have a GUI based on OS widgets (i'm reading documentation...), i think is a great point. I didn't liked the Rebol GUI that some see as a graphics of 80 age ...

greggirwin

[20:40](#msg577ac9d84bee5c570923719e)Is this what you want @DarioX1973\_twitter ?

```
s: {Mise subito mano alla stesura 
dell'opera, dallo scoppio della 
guerra, che prevedeva sarebbe stata grave, 
anzi la più degna di memoria tra le precedenti.}
char: charset [#"a" - #"z" #"A" - #"Z" "012345789" "àèéìòù"]
r: make string! length? s 
parse s [
    any [
        copy t some char (append append r t "|") 
        copy t to char (append append r replace/all t "^/" " " "|^/")
    ]
] 
print r
```

DarioX1973\_twitter

[20:41](#msg577ac9e5f06cda5d0983cbef)I work every day on a management done in Delphi and Firebird database. I think, red would be perfect for small external small programs to our management main program. Red by random has something to allow me to use Firebird?

greggirwin

[20:41](#msg577aca03584c2e775bdaf4b5)There is no ODBC or other external DB access at this time.

[20:42](#msg577aca304fd381610995d093)Note that my change doesn't try to do anything fancy with `parse`, but just uses `replace` on what `parse` already extracted.

[20:44](#msg577acaa169ed53d8142a5d35)It does make that line very dense and hard to read now though. I think `repend` will support strings before long, and we'll probably get `join` too, to help with this kind of thing. You could also break up the `append`s for clarity. Steeve's code packs a lot of power in a small space.

DarioX1973\_twitter

[20:50](#msg577acc1e4bee5c57092399b7)Ok for the ODBC. :-/

[20:50](#msg577acc2c584c2e775bdb16df)Thank you! I tried it, it works perfectly Greg. Still I do not understand so well written code, but it impresses me a lot. I sit down with the documentation of Red ...

greggirwin

[20:51](#msg577acc5369ed53d8142a7012)`parse` takes some time to learn, but then you can't live without it. :^)

DarioX1973\_twitter

[20:51](#msg577acc6f69ed53d8142a705d)I imagine it

[20:52](#msg577acc846463856209752816)I go to study Red now, thanks for help!

greggirwin

[21:00](#msg577ace6a64638562097534eb)This breaks apart some of the chaining, to make it easier to explain.

```
parse s [                   ; S is our input string
    any [                   ; Do the following 0 or more times
        copy t some char    ; Copy 1 or more matched charset values into 't
        (
            append r t      ; Append the copied chars to our result (r)
            append r "|"    ; Then add the pipe to r
        ) 
        copy t to char      ; We stopped at the last charset match, so now
                            ; we use TO to copy *to* where the next charset
                            ; match starts, so now t contains the things 
                            ; between the alpha characters.
        (
            replace/all t "^/" " "  ; replace newlines with spaces
            append r t      ; Append it to our result
            append r "|^/"  ; Then add the pipe and newline to r
        )
    ]
]
```

DarioX1973\_twitter

[21:15](#msg577ad1f44fd3816109962320)It works fine. At a glance I thought you had written different code, instead I see that it is precisely the same although less concise. Really nice as then becomes concise ...

[21:16](#msg577ad23964638562097562f2)how can i paste code here and obtain the same sintax coloring as you, greg?

[21:16](#msg577ad23def3990705baa3680)syntax

[21:18](#msg577ad298584c2e775bdb766e)However, the great thing is that I copy and paste Red Code, and in spite of how it is formatted (spaces, tabs, trolleys etc.) works perfectly, and even in the shell window!

greggirwin

[21:21](#msg577ad34a4fd3816109963103)Click the little M dn-arrow next to the edit box. single backticks for short code, open/close triple backticks for longer code.

[21:21](#msg577ad3634fd3816109963142)Yes, one of the key things about the style guide, and how to format code, is to allow that.

[21:22](#msg577ad3833ac2a2dc143a549f)We all slip up sometimes, but it's really nice how often it just works.

[21:23](#msg577ad3b63ac2a2dc143a550c)ctrl+shift+M is the syntax help hot key.

[21:23](#msg577ad3e6ef3990705baa45fe)You can also click the ellipsis (...) next to your messages to edit them and fix typos.

DarioX1973\_twitter

[21:27](#msg577ad4ac69ed53d8142aef19)

[21:29](#msg577ad51eef3990705baa4e81)

[21:29](#msg577ad51e3ac2a2dc143a60d7)

[21:29](#msg577ad533584c2e775bdb9215)

[21:30](#msg577ad55eef3990705baa4f5c)/f: "prova"

[21:31](#msg577ad5c0584c2e775bdba1b3)mmmm ...  
I did not understand, I can not paste color code

greggirwin

[21:33](#msg577ad61269ed53d8142b0749)I don't know where the backquote is on the Italian keyboard. :^\\ For me it's the unshifted tilde key.

[21:33](#msg577ad630ef3990705baa5c1a)Can you see the example in the help?

[21:34](#msg577ad683ef3990705baa5f54)Oy. http://superuser.com/questions/667622/italian-keyboard-entering-the-tilde-and-backtick-characters-without-cha

DarioX1973\_twitter

[21:35](#msg577ad6a6f06cda5d09847574)\`f: "ciao"

greggirwin

[21:35](#msg577ad6b8f06cda5d0984783e)Now add another one at the end.

DarioX1973\_twitter

[21:36](#msg577ad6e1584c2e775bdbb268)`f: "ciao"`

[21:37](#msg577ad6fdf06cda5d09847e0f)

greggirwin

[21:37](#msg577ad71169ed53d8142b1d63)There you go. Now, do three in a row, a newline put in some code, then a newline and three more in a row.

DarioX1973\_twitter

[21:37](#msg577ad7174bee5c5709241e90)

[21:38](#msg577ad739f06cda5d09847ea1)

```
parse s [                   ; S is our input string
    any [                   ; Do the following 0 or more times
        copy t some char    ; Copy 1 or more matched charset values into 't
        (
            append r t      ; Append the copied chars to our result (r)
            append r "|"    ; Then add the pipe to r
        ) 
        copy t to char      ; We stopped at the last charset match, so now
                            ; we use TO to copy *to* where the next charset
                            ; match starts, so now t contains the things 
                            ; between the alpha characters.
        (
            replace/all t "^/" " "  ; replace newlines with spaces
            append r t      ; Append it to our result
            append r "|^/"  ; Then add the pipe and newline to r
        )
    ]
]
```

[21:38](#msg577ad73c4fd3816109966f4a)uau!

greggirwin

[21:38](#msg577ad74f4bee5c570924214d)Woohoo! :^)

DarioX1973\_twitter

[21:38](#msg577ad756ef3990705baa6ef1)Thank you very much, Greg!

greggirwin

[21:38](#msg577ad75e646385620975ada8)Happy to help.

[21:39](#msg577ad7824bee5c570924260f)Maybe delete some of them that didn't work. Destroy the evidence. ;^)

DarioX1973\_twitter

[21:43](#msg577ad86a646385620975b757)Ok, it's time to go to sleep in Italy. I will return soon. good night Gregg. :smile:

[21:43](#msg577ad8924bee5c57092434fc)

## Tuesday 5th July, 2016

DarioX1973\_twitter

[07:27](#msg577b614af06cda5d098aa0a9)A question in my mind. I read that Red users can not use database because of the capabilities of handling data of Red. I try ax example of little address book. Ok, but in case of many clients, in the classic server/client application, how can one can use Red without a classic database to share and modify data in case of concurrency between clients? when you use a database, you have many clients executing query on many tables ... two clients write data in the same table ... let mi be more clear ... i dont' understand how Red do this without using a normal sql database ... can you give me some ideas? i think this because it seems to me the Red is not database oriented ... for example, as the language Delphi is.

[07:28](#msg577b61834fd38161099ce0b3)Second question, is there a repository with many example?or a Red cookbook?

[07:28](#msg577b61924bee5c57092a2e06)a general Red cookbook, i mean.

[07:31](#msg577b626e69ed53d81431c9d1)Thanks, i go back to my ordinary work. I will return here in the day.

Phryxe

[08:41](#msg577b72c9ef3990705bb1e375)@DarioX1973\_twitter You will finds some code examples at https://github.com/red/code

PeterWAWood

[09:10](#msg577b798a4fd38161099e19f6)@DarioX1973\_twitter I have no doubt that Red will have SQL database support. Nenad published both MySQL and PostgreSQL schemes for Rebol - \[Softinnov schemes](http://softinnov.org).

I ma confident that he will come up with something even better for Red but it will need the full IO support of Red 0.7.0 first.

ingdariogiacomelli

[11:21](#msg577b983f584c2e775be49788)

```
Red [needs: 'view]

view [
    below
	text "Internet link"
	internet-link: field 500
	
	text-list 90x160 data [
        "Home" "Work" "Eurekaweb2" "bugs" "telephon calls"
    ] [append append link-tags/text ";" (pick face/data face/selected) ]
	
	text "Tags (ex: home;interesting;work)"
	link-tags: field 500 ""
	 
	text "Personal note"
	link-note: area 500x200 "WRITE_HERE"
	
	b: button "Save" [
		t: copy ""
		append t "LINK: "
		append t internet-link/text
		append t "^/"
		
		append t "TAGS: "
		append t link-tags/text
		append t "^/"
		
		append t "NOTE: "
		t-rep: copy link-note/text
		replace/all t-rep "^/" "|||"
		
		append t t-rep
		append t "^/"
		
		t-new: read %memolink-list.txt 
		
		append t-new t
		write %memolink-list.txt t-new
		append t "^/"
		
		]
]
```

[11:23](#msg577b98cff06cda5d098d8b81)This is a simple my example form to save interesting links i find in internet, associating them some tags, and commenting the link. I just was trying Red ... it's a stupid form. But ... this is an "insert" form. How can i visualize it from a prior form that had a meno "Read links", "Inser new link", ecc ? thanks for help me

[11:24](#msg577b98f6ef3990705bb3c66e)i am the same of DarioX1973\_twitter, i will use twitter account next time (not confusion ...)

[11:26](#msg577b996a64638562097ebb9e)a problem is also that if memolink-list.txt do not exists, it gives error ... i don't know how to check file exists ... i am starting from some gui instructions, because i like to have something visual from the beginning, because i remember a litte Rebol sintax ..

[11:28](#msg577b99ddef3990705bb3cff4)i think, by default, between the labels and the field, there are vertically too much space. It's normal or i wrong something?

[11:29](#msg577b9a1f4fd38161099fe8ab)ok thanks, i go to lunch. Good lunch!

SteeveGit

[11:53](#msg577b9fcab7a853a204148d0b) @ingdariogiacomelli you can use `write/append`to append data to an existing file. And in case the file doesn't exist, it's created automaticly.  
Don't hesitate to use `help` on functions to discover practical options.

greggirwin

[16:45](#msg577be41d9d3eadd72369a882)@DarioX1973\_twitter, patience. :^) Red is young and the things being built in now are what Red needs to show commercial viability and also to become self-hosted. That said, There is a SQLite binding at http://www.red-lang.org/p/contributions.html. So it's not that you won't be able to use any DB you want, you will, but you may not need one all the time.

[16:45](#msg577be43c9d3eadd72369b04a)Delphi didn't start out as a DB-oriented tool either. :^)

[16:48](#msg577be4e39d3eadd72369b692)You can control the spacing. See http://doc.red-lang.org/gui/VID.html and the `space` keyword. I'm sure some UI guru will show up and offer suggestions before long.

DarioX1973\_twitter

[22:50](#msg577c399d51724d8078bda9ff)Ok thanks, i'm reading the gui doc you have linked, Greg. For the DB support, i will wait.

[22:50](#msg577c39b20c16867678c77a93)For now, however, how can i show a second form from a initial form, for example pressing a button?

greggirwin

[22:54](#msg577c3abcc6b33f904a8cde04)@rebol2red has a small example doing just that in https://gitter.im/red/red

DarioX1973\_twitter

[23:13](#msg577c3f3651724d8078bde77b)i hope to not abuse of your patience. how do this, eliminate the CRLF?

[23:13](#msg577c3f37ddcdcee623f6518e)https://snag.gy/gJiIsB.jpg

[23:14](#msg577c3f3a51724d8078bdea18)'''

[23:14](#msg577c3f5bc6b33f904a8d0f2a)'''  
Red \[needs: 'view]

view [

below  
text "Internet link"  
internet-link: field 500

text "Tag list (click on it to add)"  
text-list 90x160 data [  
"home" "work" "important links" "red programming" "telephon calls" "memo" "to see"  
] \[append append link-tags/text ";" (pick face/data face/selected) ]

text "Tags (ex: home;interesting;work)"  
link-tags: field 500 ""

text "Personal note"  
link-note: area 500x200 "WRITE\_HERE"

b: button "Save" [  
t: copy ""  
append t "LINK: "  
append t internet-link/text  
append t "^/"

append t "TAGS: "  
append t link-tags/text  
append t "^/"

append t "NOTE: "  
t-rep: copy link-note/text  
replace/all t-rep "^/" "|||"  
print t-rep

append t t-rep  
append t "^/"  
write/append %memolink-list.txt t

]  
]  
'''

[23:14](#msg577c3f734e50bf894a208048)

[23:15](#msg577c3f7ae22c1b816ae1044e)'''

[23:15](#msg577c3f9b0c16867678c7bafc)

[23:16](#msg577c3fb251724d8078bdf453)

```
replace/all t-rep "^/" "|||"
```

[23:17](#msg577c3ff1c6b33f904a8d12a6)it seems to me that this kill only the LF but not the CR ...

[23:23](#msg577c41540c16867678c7dfec)Gregg ... perfeeeeeeeeeect ... it open a second window, perfect ... :-)

[23:33](#msg577c43af4e50bf894a20b909)I do not know if you believe in coincidences , but this morning at the bar I eye fell on this bottle ...

[23:33](#msg577c43bd0c16867678c7fba5)http://www.evigneto.com/ProductsResources/549/000627\_0\_ori.jpeg

[23:34](#msg577c440151724d8078be28f9)and I said " wow!"

virtualAlan

[23:46](#msg577c46bb9d3eadd7237021e1)Hi, I just joined here .... My site has some Red pages, some examples, a simple reference guide, a few apps created with Red, take a look: http://www.mycode4fun.co.uk/About-Red-Programming

greggirwin

[23:51](#msg577c48134e50bf894a20f25c)Welcome Alan!

[23:52](#msg577c4840c6b33f904a8d7a4a)@DarioX1973\_twitter, it seems to work fine here. I enter text with newlines in the area, save it, and the file just has the ||| in their place.

virtualAlan

[23:53](#msg577c488764f940856a178e75)Hi Gregg, thanks

[23:57](#msg577c496d4e50bf894a20ff04)@greggirwin I need to check for typo's

## Wednesday 6th July, 2016

DarioX1973\_twitter

[00:05](#msg577c4b3e64f940856a17b632)@greggirwin https://snag.gy/7IQTPo.jpg

[00:05](#msg577c4b4951724d8078be8e66)notepad++ show chars ...

[00:05](#msg577c4b6651724d8078be8eb4)in notepad, one see all on a single line, but CR is still there ...

[00:06](#msg577c4b774e50bf894a2116cb)perhaps you see the file from notepad?

[00:06](#msg577c4b8951724d8078be93ba)i work on windows, perhaps you are on linux or mac?

[00:08](#msg577c4becc6b33f904a8db45a)@virtualAlan Hi alan, thanks, i have downloaded your pdf of Red, i will see it, very interesting.

greggirwin

[00:17](#msg577c4e0264f940856a17d7ac)I'm on Windows, but I don't see them even in hex mode in my editor. Before long we'll probably have `enline/deline` funcs. In the meantime the char for CR is #"^M", so you can try manually replacing that in the string.

DarioX1973\_twitter

[00:29](#msg577c50f1ddcdcee623f74162)ok thanks, that's works.

## Thursday 7th July, 2016

dockimbel

[03:37](#msg577dce88bdafd19107205521)@virtualAlan Welcome and thank you for your nice Red intro pages! ;-)

DarioX1973\_twitter

[08:57](#msg577e1981b79455146f562f56)@dockimbel What "Red" stand for? what does it means R E D ?

[09:11](#msg577e1cbc064f828707d0d7d2)Does Red work on the raspberry?

pekr

[09:12](#msg577e1d10bdafd19107241ad7)@DarioX1973\_twitter RED stands for Rebol Enhanced Dialect, or something like that I remember. I am not sure it will be like that in future.

PeterWAWood

[09:27](#msg577e20883eaf66535e3804d6)@DarioX1973\_twitter Yes Dario. Rebol works on Raspberry Pi. There is no GUI yet as so far View has only been implemented on Windows. The GTK+ 3 implementation of View will run on Raspberry Pi.

There is not a Red binary for Raspberry Pi yet. That will probably only come with Red 1.x.

There are two ways to create Red programs for the Raspberry Pi. The first is to take advantage of Red's easy to use cross-compilation features to compile a Red program for Raspberry Pi and then copy the binary executable to a Raspberry Pi. You could compile the Red console (non-GUI version) for Raspberry Pi and then use it on a Raspberry Pi.

[09:29](#msg577e20e53eaf66535e3805bf)The second way is to install the experimental Rebol Raspberry Pi version then you can compile any Red program on the Raspberry Pi. (Rebol only runs on Raspberry Pi 2 and 3).

[09:36](#msg577e22a1bdafd19107245e33)Here is how I compiled the command-line console, using the latest Red source:

```
red peter$ rebol -qs red.r -t RPi -o RaspberryRed environment/console/console.red
-=== Red Compiler 0.6.1 ===- 

Compiling /Users/peter/VMShare/Red/red/environment/console/console.red ...
...compilation time : 733 ms

Compiling to native code...
...compilation time : 23862 ms
...linking time     : 224 ms
...output file size : 1096728 bytes
...output file      :~/VMShare/Red/red/RaspberryRed
```

And here it is running on a Raspberry Pi Model A:

```
~/Red $ ./RaspberryRed
--== Red 0.6.1 ==-- 
Type HELP for starting information. 

red>> system/version
== "0.6.1"
red>> system/platform
== Linux
red>> system/build
== "7-Jul-2016/17:32:18+8:00"
red>>
```

DarioX1973\_twitter

[10:29](#msg577e2f26c9b49c1d6fc65997)Thanks Peter, these are very good news for me, because I did this craft maker to record jump in and out of personnel. Now i have used Python for the scripting that wait for inserting usb pen and write who is the realtive person ... so, i can convert the script in as a Red executable, and test it. Fantastic ...

[10:29](#msg577e2f273eaf66535e3897ea)http://eurekanews.altervista.org/archipass-2/

[10:31](#msg577e2f6b7aeb0805276b55d9)also i think, for this kind of device, programmine the VID directly will be fantastic, when VID in raspberry will work ...

[10:35](#msg577e308459cfbd4c5e39c605)i know that there are many way to bingd external gui engines, but i think - perhaps it is for my delphi background - that the intergrated GUI, in a language, is a very great point. Python developers, for examples, didn't understand this ... that having a decent and simple to write GUI inside a language itself, is a great point ... the GUI integrated in Red - simple to write and easy to have in a single executable - now is the best point that make me deciding to abandon Python and adopt Red, for example.

[10:38](#msg577e31241ca34a944eb23767)As a newbie, for sure this is also a risk ... but for what i see now in Red, Red seems to have all the right credentials to smash!

[10:39](#msg577e31471ca34a944eb237a6)Whereas I know still little ... i mean

[10:39](#msg577e3153b79455146f57519a)Ok, thanks for now, Peter! :-D

mindv0rtex

[14:39](#msg577e69897aeb0805276e8d97)Good morning! (it is morning here in Houston, at least) Am I correct to assume that the best place to start learning Red is to learn Rebol2? What materials would you recommend in this case? There is a prolific Rebol teacher on the internet, Nick Antonaccio, are his websites a good start? The reason I ask is that after a cursory look they felt like emphasizing the "copy-paste-and-marvel" approach a little bit too much... I hope my comments do not offend him if he reads this channel...

grahamf21

[15:55](#msg577e7b57b79455146f5b5217)Hi Ian - welcome! As a relative newcomer myself I heartily recommend Nick's tutorials. They got me off to a good start with Rebol. And along with a bit more research, particularly on www.rebol.com I was able to create business apps for my local credit union.

mindv0rtex

[16:45](#msg577e87131ca34a944eb71d48)@grahamf21 Thanks, I'll follow Nick's tutorials then! :-)

greggirwin

[20:41](#msg577ebe64064f828707da1d65)Nick's stuff is great. He wrote them with a target audience in mind, which might not be you. In any case, you can ask questions here and a lot of Rebol docs will apply. The fundamentals are the same, and if a function is missing, that you need, ask and someone will probably provide one.

[20:43](#msg577ebedab79455146f5f4b1b)Red \*could* dump a lot of things in just to be more compatible, but the designer wants to consider everything, learn from Rebol, and make sure Red is the best it can be So if it seems like some things would be easy, or progress is slow in some areas, don't worry. We can almost always patch in the things we need at the higher level while we wait for them to become standard. Low level stuff we do have to wait for, or contribute ourselves.

[20:44](#msg577ebf3e3eaf66535e409afb)Even http://www.rebol.com/docs.html is worth your time to explore.

virtualAlan

[22:53](#msg577edd80bdafd191072f2e4a)@dockimbel Thank you

## Friday 8th July, 2016

DarioX1973\_twitter

[08:51](#msg577f69a759cfbd4c5e49ae96)https://snag.gy/GKlhwL.jpg

[08:54](#msg577f6a3559cfbd4c5e49b7e8)WOW ... while programming at my ordinary works at office (Delphi), i write my first Red program: insert a web link classified by tags and notes, and the finder of what i have written ... fantastic!!! with so many efforts!!

[08:57](#msg577f6ae6064f828707e205f1)ops, "so few" i wanted do write !

[08:57](#msg577f6b15c9b49c1d6fd65900)so few efforts, and while programming the ordinary work at office ... just fantastic!

greggirwin

[08:58](#msg577f6b1b7aeb0805277b0c57)Congratulations Dario. :^)

DarioX1973\_twitter

[08:58](#msg577f6b35b79455146f6717c2)WOW

[09:03](#msg577f6c593eaf66535e47fbb8)I just missing something to get to write and read data from firebird database ... perphaps not optimized but something that works ... if i do an executable with Delphi that read the database results of query passed and give back result in csv format, and after read it with Red and manipolate it, and after a similar way to do modified in csv passed to this executable, i can try to use Red with firebird - at a very basic level, obsviously, but it should works ...

[09:21](#msg577f70afc9b49c1d6fd6a493)how can i open a link in a web browser if i click it?

[09:21](#msg577f70b059cfbd4c5e4a00cf)https://snag.gy/JPdc86.jpg

pekr

[09:27](#msg577f71e6c9b49c1d6fd6b141)Try to use `browse`function ...

DarioX1973\_twitter

[09:32](#msg577f731e7aeb0805277b73be)Thanks Petr, it works.

[09:49](#msg577f77181ca34a944ec262ca)Ops, how to convert a http in a string to a http type?

[09:49](#msg577f773c1ca34a944ec26323)"www.google.it" to pass to browse, i mean

pekr

[09:57](#msg577f7915b79455146f67acec)`browse to url! "www.google.com"`

DarioX1973\_twitter

[11:05](#msg577f891759cfbd4c5e4b0e76)

```
Red [needs: 'view]

view [
	text "Go to link"
	go-to-link: field 500 [
			go-to: face/text
			print go-to
			browse to url! go-to
	]
]
```

don'w works ... where is the erro?

[11:06](#msg577f8940bdafd19107368b57)https://snag.gy/jJuxrF.jpg

[11:07](#msg577f8975c9b49c1d6fd7cc40)but if i write as you suggeted in Red Console, it works Petr ...

[11:09](#msg577f89e2c9b49c1d6fd7cda7)mmm if i copy and paste in console the script above, it works. if i double cliccked on the file go-to.red ... it gives me that error

[11:10](#msg577f8a2bb79455146f687331)mmm ... if i run the .red file from CMS in windows `red.exe go-to.red` it works

[11:10](#msg577f8a397aeb0805277cafc7)CMD

[11:11](#msg577f8a603eaf66535e495029)so the error came only if i double clicked the .red script ... ??

[11:17](#msg577f8bc7c9b49c1d6fd7e373)if i run the window that open another window, from the dos prompt, and in the second window there is the exactly field in witch i hit return to open the web browser, it dont' works again

[11:19](#msg577f8c2a59cfbd4c5e4b34b1)https://www.dropbox.com/s/7weu9evzfn8k41f/testweb.zip?dl=0

[11:19](#msg577f8c3f59cfbd4c5e4b36fa)this is the 3 .red files i am testing to open a browser

pekr

[11:23](#msg577f8d40c9b49c1d6fd7f8b0)what does it mean, to double click? What is that script associated with? Red.exe?

DarioX1973\_twitter

[12:44](#msg577fa01b59cfbd4c5e4c32f9)Sorry Petr i was wrong, i mean hit return in the field, not duble click on ...

[12:44](#msg577fa04b1ca34a944ec45efc)when i hit in the field it should open browser...

pekr

[12:57](#msg577fa3333eaf66535e4a9ee7)I run the script from the gui-console. That is the only way so far, I work with Red.

DarioX1973\_twitter

[15:33](#msg577fc7ad064f828707e7410a)https://snag.gy/w85Mt0.jpg

[15:34](#msg577fc813c9b49c1d6fdb40de)i found that i have problems on my machine ... if i click on .red file, it open a red version that is no the latest i am running by DOS ... so i must have a red in some other part of my pc and windows run it and not that in my c:\\red directory where i was testing all ... :-/

[15:35](#msg577fc83a1ca34a944ec6b17d)so the problem is mine petr, sorry ...

[15:35](#msg577fc8437aeb0805278043e6)and thanks

[15:52](#msg577fcc537aeb08052780892d)OOOOOK all works perfect now! windows was angry and threw me red.exe from a differente folder where I had a copy ... so Red is ok! well i go on ...

[15:54](#msg577fcc9d1ca34a944ec6f657)a question ... this my questions are correct in this /welcome or it is better another char room? is there a Red/newbie ? i dont' see it ... perhaps the case to open it???

[15:56](#msg577fcd1e3eaf66535e4d5e55)Ehi @dockimbel ... perhaps red/newbie? can you open so i can strafe without limits?

rebolek

[15:56](#msg577fcd4bf9cb022a33ef6623)@DarioX1973\_twitter I think this is the best room for such questions.

RnBrgn

[17:10](#msg577fde91064f828707e8c12f)@DarioX1973\_twitter When you install the Windows version .exe file ,it will place the gui-console.exe file in c:\\programdata\\red. Each time you download the latest build and run the install it will add that versions gui-console to the c:\\programdata\\red directory. I usually delete the contents of c:\\programdata\\red before I install the newest release just to keep it clean. Probably not necessary.. Just another place to look if you run into issues...

## Saturday 9th July, 2016

hellcoderz

[03:44](#msg57807339bdafd19107429767)@hellcoderz  
hi. I am new to Red. I got an error trying to compile a source file in linux/ubuntu  
\-=== Red Compiler 0.6.1 ===-

Compiling /home/hellcoderz/soft/tests/red/read.red ...  
\*\** Compilation Error: undefined word ask  
\*\** in file: %/home/hellcoderz/soft/tests/red/read.red  
\*\** near: [  
ask "&gt;"  
]  
code is:  
Red \[]  
ask "&gt;"  
Does it require any more dependency?  
"ask" is not working otherwise i am able to compile a file

[03:47](#msg578073b6bdafd19107429b16)and same script is working if running without compiling

[03:47](#msg578073c2bdafd19107429b1d)am i missing some runtime code?

ghost~5680c5f416b6c7089cc058a5

[03:51](#msg578074c7c9b49c1d6fe2f3c8)@hellcoderz

hellcoderz

[03:51](#msg578074cfc9b49c1d6fe2f3d2)hey

ghost~5680c5f416b6c7089cc058a5

[03:52](#msg578075031ca34a944ece36a1)The current I/O in Red is temporary, full I/O will come in 0.7.0 release.  
Till then, you need to

```
#include %input.red
```

to use `ask` in compiled code.

[03:53](#msg5780751f59cfbd4c5e56e97f)this is the required file  
https://github.com/red/red/blob/master/environment/console/input.red

[03:53](#msg57807540064f828707eeeb55)just put `input.red` in the same folder

hellcoderz

[03:53](#msg578075481ca34a944ece3733)oh ok

ghost~5680c5f416b6c7089cc058a5

[03:53](#msg5780754a7aeb08052787f143)and then

```
Red []

#include %input.red

ask ">"
```

hellcoderz

[03:53](#msg57807551bdafd1910742b372)thanks

ghost~5680c5f416b6c7089cc058a5

[03:54](#msg5780755cb79455146f72f122)Your welcome. :smile:

dockimbel

[03:54](#msg57807590064f828707eeebd9)@nc-x @hellcoderz Actually, %input.red has many dependencies, so you need most of the files from \[this folder](https://github.com/red/red/tree/master/environment/console).

hellcoderz

[03:55](#msg578075adb79455146f72f1a6)yeah just saw the code

[03:55](#msg578075b97aeb08052787f496)will do thnx @dockimbel

## Monday 11st July, 2016

DarioX1973\_twitter

[09:34](#msg5783681959cfbd4c5e751bc9)At today, is there a function in Red that, give it a char, it returns the unicode classification, as in this list?

http://www.fileformat.info/info/unicode/category/index.htm

I remeber Carl, in the past years, said something on it for Rebol, in the sense that it was complicated for some reasons (load all unicode tables?), but i dont' remember well ...

[09:36](#msg578368907aeb080527a5dd1d)Another question (more important): is there a plan to compile red code to javascript code and the gui, so one convert vid gui in gui working in browser?

dockimbel

[09:41](#msg578369bdb79455146f8fc836)@DarioX1973\_twitter Unicode categories: looks like a job for an external library, I don't see it a need general enough for that to put it in the standard library. For JS support, it's on our roadmap for 1.0, but not scheduled yet.

DarioX1973\_twitter

[10:11](#msg578370d97aeb080527a6544f)@dockimbel For unicode, i supposed that, ok. Good news for JS, thanks.

[12:27](#msg57839095b79455146f918dbc)Working on the string (elaborating them, splitting, slicing, appending ecc) is there some rules to care about,to have an efficient, fast implementation? for example, Delphi has a good way to manipolate them directly as string, but i know other languages works better if using variuos stringbuilder object of functions (for example appending string with string directly in python3 is not efficient), and only at initial and final stage convert them in strings. In Red is there some tips on string manipolation, to have fast processing? i'm sorry but text processing is one of my important goals ...

dockimbel

[12:39](#msg578393727aeb080527a7ed12)1. Forget about how other languages do, it is irrevelant in Red.  
2\. String are series in Red, which means they have an implicit index, rely on it for shorter and faster code.  
3\. Preallocate strings, especially when the strings are bigs.  
4\. Re-use existing strings instead of creating new ones when possible.  
5\. Use `/into` where available (soon to be added to `form` and `mold`).  
6\. As last resort, drop to Red/System to speed up some expensive string processing.

greggirwin

[12:56](#msg578397771ca34a944eed4332)Adding to what Doc said, and not to contradict him, do some tests with familiar processing and transformations you need. I say, start by writing the clearest code possible. If you need to optimize after that, do what Doc outlined. Preallocation never hurts, but can also add extra code for not much gain, so you don't need to do it every time. Of course, now that we \*do* have Red/System, I'm going to be tempted to use it.

maximvl

[14:41](#msg5783b015b79455146f933a9a)@dockimbel wow, a lot of plans here for 1.0. Could it be done in this year?

dockimbel

[14:47](#msg5783b1671ca34a944eeed323)If I can find a way to avoid sleeping, certainly. ;-) Otherwise, it mostly depend on how much time we'll put into adding Android support, we have a working prototype, but adding hundreds of features requires significant and hardly predictable time. Fortunately, the Android API is higher level than the Windows one, so I hope we can reach 80% of planned features in a short amount of time.

DarioX1973\_twitter

[15:20](#msg5783b93e3eaf66535e76d1dc)Is there a refinement to append a value to a series avoiding duplicates? i dont' understand well the HELP APPEND.

[15:20](#msg5783b9587aeb080527aa11c8)Thanks for previous tips, Nenad and Gregg.

x8x

[15:24](#msg5783ba211ca34a944eef67fc)

```
b: [1 2]
unless find b v: 1 [append b v]
```

or

```
b: [1 2]
b: unique append b v: 1
```

DarioX1973\_twitter

[15:25](#msg5783ba783eaf66535e76f1b0)Another question: in the HELP command in console red&gt;&gt; ... there are USAGE, DESCRIPTION, ARGUMENTS, REFINEMENTS .. but i think adding "EXAMPLES" should ve very very usefull for newbie because nothing is better than an exmple to understand..

[15:28](#msg5783bb0a1ca34a944eef71e0)@x8x oh perfect, thanks!

[15:52](#msg5783c0b5bdafd1910765fd0c)I am doing a lot of errors in writing code without the "copy" keyword, for example this is good

```
append results/data x
append results/data (append copy "------- from " r)
append results/data copy " "
```

but this is not good

```
append results/data x
append results/data (append "------- from " r)
append results/data copy " "
```

now i understand why ... but it's frustrating ... all the times i append something to a literal string, i must remeber to use copy, isn't it ?

x8x

[15:53](#msg5783c1027aeb080527aa6edf)@DarioX1973\_twitter use `join`:

```
join: func [a b][append copy a b]
```

[15:56](#msg5783c192064f82870711fa20)and if you use latest red, `rejoin` has been added

DarioX1973\_twitter

[15:58](#msg5783c213c9b49c1d6f05a4a6)latest red is red-061.exe or another one?

x8x

[15:59](#msg5783c250bdafd1910766169d)just add it:

```
rejoin: func [
    "Reduces and joins a block of values." 
    block [block!] "Values to reduce and join"
][
    if empty? block: reduce block [return block] 
    append either series? first block [copy first block] [
        form first block
    ] next block
]
```

DarioX1973\_twitter

[16:03](#msg5783c33a064f828707121428)if i add functions to my %utils.red file, for example these two functions you write, what will happened if for example a function "join" will be added to future release of Red? how can i tutelate my utils.red file to avoid conflicts?

[16:06](#msg5783c4033eaf66535e778413)again question: if i had "append" function that is in Red built in ... can i , for example, add my /literal refinement to do what your "join" version do?

[16:07](#msg5783c456bdafd19107663e03)ops, "tutelate" (italianized was "protect" ... not just perfect english!) ...

x8x

[16:09](#msg5783c4d559cfbd4c5e7a3a7d)the one set in your `%utils.red`would be used

[16:11](#msg5783c528c9b49c1d6f05ca82)humm we have `unset?` but I'm not sure it's working, anyway you could use something like this:

```
unless find words-of system/words 'join [
    set 'join func [a b][append copy a b]
]
```

[16:14](#msg5783c5cd59cfbd4c5e7a407f)This will set `join` only if it's not already defined

DarioX1973\_twitter

[16:24](#msg5783c834064f828707126b0d)WOW ...

dockimbel

[16:32](#msg5783ca0d3eaf66535e77e326)`unless value? 'join [...` should be enough. ;-)

DarioX1973\_twitter

[16:33](#msg5783ca4c7aeb080527ab0207)from console, i see the usefull command "what" that display all Red tokens with description ... how can i do my %utils.red and have the same token list extrated from it, to build a little help/documentation of my personal functions?

x8x

[16:35](#msg5783caebbdafd1910766b17d)@dockimbel why not `if unset? 'join [...`

dockimbel

[16:36](#msg5783cb1559cfbd4c5e7a999f)@x8x Both options are equivalent.

greggirwin

[17:09](#msg5783d2acb79455146f956980)@DarioX1973\_twitter, this is a \*very* quick hack of some old R2 code. The idea is that you run this before any of your other externals, it will look at the set of system words, then do your stuff and when you call `mark-my-words/dump` it will exclude the originals from the list, and just show yours.

```
mark-my-words: context [
    std-words: words-of system/words
    dump: has [val] [
        print ['Word tab 'Type tab 'Value]
        foreach word exclude words-of system/words std-words [
            print [
				word tab 
				type? set/any 'val get/any word tab 
				if value? 'val [
					either not any [object? :val  function? :val]  [mold :val] [
						copy/part mold first :val 60
					]
				]
			]
        ]
    ]
]
```

x8x

[17:13](#msg5783d3b13eaf66535e787172)

dockimbel

[17:16](#msg5783d472c9b49c1d6f06ccd2)

```
lisp
red>> unset? :not-set
== true
```

x8x

[17:16](#msg5783d487c9b49c1d6f06d3ec)HA! the colon... 8-P

dockimbel

[17:17](#msg5783d4aeb79455146f957b19)Yeah, a lit-word evaluates to a word, so it can never test TRUE with `unset?`. ;-)

x8x

[17:18](#msg5783d4ea064f828707130de9)Thanks!

## Tuesday 12nd July, 2016

jink

[00:41](#msg57843ca5c9b49c1d6f0beae5)Hi, I'm new to Red, but looked a Rebol a while back. I tried the http://www.red-lang.org/p/getting-started.html page and ran into some minor issues. On Windows 10, I downloaded red-061.exe to a folder and tried the console examples. They worked fine. Then I tried moving the exe to another folder and created the hello.red file. Running from the terminal made me try renaming red-061.exe to red.exe. Then I realized I had some problem with the path and that led to the message "PROGRAM ERROR: Invalid encapsulated data." Fortunately, Google came the rescue with the forum response https://groups.google.com/forum/#!searchin/red-lang/Invalid$20encapsulated$20data./red-lang/EmPyxe06AWw/6mKn9-VFfwUJ

[00:43](#msg57843d233eaf66535e7d8360)Also, ./hello had to be changed to .\\hello - I thought Windows could handle forward slashes.

dockimbel

[03:44](#msg578467a7bdafd191076e43a0)@jink Welcome! We need to had that information to the GettingStarted page, indeed.

[03:46](#msg57846812c9b49c1d6f0dadbb)@jink For ./hello, the instructions should be clear enough?

```
$ red -c hello.red
    $ ./hello

    or from DOS:
    > red -c hello.red
    > hello
```

nicolas42

[04:44](#msg57847593064f8287071a69c6)This might be a stupid question but how do you change an int to a char?

[04:44](#msg578475b8bdafd191076ec690)to char! 23  
Script Error: TO cannot convert char! from: 23  
Where: to

x8x

[04:45](#msg578475fb7aeb080527b2dded)

```
make char! 23
;   #"^W"
```

nicolas42

[04:46](#msg5784761d064f8287071a6fc7)thanks :)

greggirwin

[06:12](#msg57848a617aeb080527b3aa94)`To` will get there, it just isn't all ready yet.

DarioX1973\_twitter

[06:19](#msg57848bf93eaf66535e80d324)

```
my-code: [print ["i =" i]]
i: 10
f: func [x /local i] [ i: 30 print ["Local i is" i] do my-code]
```

i was testing the variable scope ... i can't understand why in this case, the variable in the "f" function is not used by my-code, while "i" in my-code seems to be related to global scope ... because the block my-code is defined there?

rebolek

[06:39](#msg5784909e0a7cb23428a5d6bd)There is no global scope. `my-code` is defined in scope where `i` is `10`. However, you can rebind that code to `f` scope:  
`f: func [x /local i] [ i: 30 print ["Local i is" i] do bind my-code 'i]`

DarioX1973\_twitter

[09:59](#msg5784bf83bdafd19107723e06)Thanks Bolesav, it works. Not really a newbie questionm but it was interesting understand how to solve ...

rebolek

[10:02](#msg5784c02e85418bf56db7ba70)@DarioX1973\_twitter Red's binding is interesting and funny:

```
red>> o1: object [a: 20]
== make object! [
    a: 20
]
red>> a: 10
== 10
red>> b: []
== []
red>> append b 'a
== [a]
red>> append b in o1 'a
== [a a]
red>> reduce b
== [10 20]
```

DarioX1973\_twitter

[10:02](#msg5784c031bdafd19107724585)I would like to understand ... it's better to look for documentation on Rebol3 or Rebol2 to understand Red? i prefer to have the executable capabilities, so i really prefer the Red way, but there are a lot of documents on Rebol ... what is better?

x8x

[10:05](#msg5784c0ccb79455146f9fd612)@DarioX1973\_twitter You may find this one interesting https://en.wikibooks.org/wiki/Rebol\_programming/Advanced/Bindology

maximvl

[11:24](#msg5784d363064f8287071e7511)I found this article (and blog) having good explanation of Rebol-related things http://blog.revolucent.net/2009/07/deep-rebol-bindology.html

PeterWAWood

[13:07](#msg5784ebab1ca34a944efe2d0d)I'm

[13:10](#msg5784ec563eaf66535e856576)Sorry. The mobile web interface of Gitter keeps defeating me and there seems to be no way to delete a message from it.

[13:28](#msg5784f087c9b49c1d6f1447a5)P

pekr

[13:38](#msg5784f2bcb79455146fa26a3e)Yes ... and no way to enter multiline?

greggirwin

[14:23](#msg5784fd6159cfbd4c5e891d31)@DarioX1973\_twitter while Red docs are in the works, which will take time, you can read Rebol docs for a lot of things. Not 100% compatible, but a lot of things will be close, and the definitional scoping design should be very similar.

[14:24](#msg5784fd98c9b49c1d6f151ec1)It's a very advanced thing to dive into if you're new. Different from other langs, and powerful, but not always intuitive when you evaluate things in different contexts.

DarioX1973\_twitter

[14:27](#msg5784fe5d1ca34a944eff627c)mmm binding is too much for now, i will study later.

[14:28](#msg5784fe907aeb080527b9c218)

```
a: 10
until [
	prin "COUNT " 
	print a
	a: a - 1
	a > 0
]
```

why this doesn't print  
COUNT 10  
COUNT 9  
COUNT 8  
ans so on ?

[14:29](#msg5784fed11ca34a944eff6456)however thanks for bindings links Maxim and x8x, i have saved the link (with my Red GUI script i have made exactly for this :-D)

[14:33](#msg5784ffc859cfbd4c5e893dbd)ops, sorry stupid i am, was a &lt; 0 at end of block!

[14:36](#msg5785005c7aeb080527b9d935)why there isn't a FOR loop statement?

[14:36](#msg5785007d3eaf66535e869c44)

```
for i 1 10 2 [ 
  print i
]
```

doesn't works

x8x

[14:43](#msg5785022d59cfbd4c5e895d33)`for` has not been implemented in Red, there are still discussions on it..

[14:44](#msg5785023dbdafd1910775b4f9)use:

```
repeat i 5 [print i * 2]
```

pekr

[14:59](#msg578505c41ca34a944effc0b7)if we are not going to provide `for`, we are going to get lots of similar questions ...

[14:59](#msg578505de3eaf66535e86d9a9)`for`might be also usefull, when you need to access series by index, and use a skip value ....

[15:00](#msg578505fa1ca34a944effc414)not including it in a distro, will cause more harm to Red imo, than the vice versa ...

meijeru

[15:07](#msg57850795bdafd1910775ff36)Is there a great penalty in efficiency if a `function` (mezzanine) is provided that takes what most people expect to be the parameters: start/end/optional step?

[15:10](#msg57850854bdafd191077608fe)For not too large sequences of indexes a semi-native solution is possible if one provides a generator for blocks filled with consecutive numbers (with an optional step again). Then one has `foreach i [...]`

greggirwin

[15:15](#msg5785098e59cfbd4c5e89cc93)I'm not clear on the question. Do you mean is there a lot of overhead the more parameters there are?  
You could certainly do it by generating blocks, but "not too large" may be the issue. My `for` proposal is out there. If people look at it, and reject it, at least we'll know what we \*don't* want.

DarioX1973\_twitter

[15:28](#msg57850c957aeb080527ba9eaa)So this is the second very strange thing i found in Red: 1) the classic IF doesn'nt have the else part but one must use EITHER ... 2) the classic FOR is not used but one must use other statements ... it's too much for me ... I'm kidding ... just know that there are not classic IF and FOR ... :-D

meijeru

[15:30](#msg57850d1bb79455146fa3fa50)I mean is there an overhead in having a mezzanine instead of a native. `foreach` is native, and so is `repeat`. The semi-native solution would be `foreach i [1 2 3 4 ... ][...]`but this begs the question how one generates (on the fly?) the block `[1 2 3 4 ...]` or `[1 3 5 7 ...]` etc.. If that can be done efficiently, then there is no need for `for`.

greggirwin

[15:31](#msg57850d5cbdafd19107766b70)Rebol used to have an `/else` refinement for `if`, but it was deprecated. It didn't take me long before I completely forgot about it. But you could always create your own `if-else` for comfort while you adjust. :^)

meijeru

[15:32](#msg57850daa1ca34a944e003fc0)I seem to remember that some languages (APL?) use `iota` for the desired sequence.

greggirwin

[15:36](#msg57850e7d59cfbd4c5e8a1c58)We don't have a fast native range generator, so that's one thing. I \*assume* argument passing overhead is roughly the same for natives and mezz. `Range` has come up a couple times, and may be accepted if we design it well. I have simple, old funcs for it, but it needs more design thought. Anyway, the block overhead may offset any gain, depending on how people use it. e.g. if they don't memoize it, inner loops will do a lot of work, as will the GC. Hence, a DP approach to `range` may be worthwhile.

[15:37](#msg57850eb9bdafd191077688c2)My `for` proposal delegates to natives internally when possible.

pekr

[15:48](#msg57851166c9b49c1d6f162021)@greggirwin - where's your `for`proposal, please?

DarioX1973\_twitter

[15:59](#msg578513fabdafd1910776d345)to be honest, i have difficult on understanding parsing ... but i would like to use Red for text processing ... where is the simplest ever documentation on parsing for very-new-bie ??

pekr

[16:01](#msg57851449064f828707221d65)You can start with the old Rebol 2 parse docs - http://www.rebol.com/docs/core23/rebolcore-15.html

DarioX1973\_twitter

[16:01](#msg57851465c9b49c1d6f1646f6)but is compatible with Red ?

pekr

[16:02](#msg578514ad3eaf66535e87b1f5)to some extent, yes. Basic principles, syntax. Red uses some parse extensions/improvements, which were also implemented in R3.

[16:03](#msg578514e53eaf66535e87ba90)http://www.red-lang.org/2013/11/041-introducing-parse.html

[16:04](#msg5785151c1ca34a944e00af01)Or come with some concrete need and we will try to create some parse rules. That's the best way to learn - first read some docs, then try with the simple examples ...

DarioX1973\_twitter

[16:05](#msg57851546c9b49c1d6f1652fd)

```
red>> probe parse "The trip will take 21 days" none
*** Script Error: parse does not allow none! for its rules argument
*** Where: parse
red>>
```

i was trying the firs things for you link ... :-(

pekr

[16:06](#msg5785159fb79455146fa46fb1)Well, that's the R2 stuff - it breaks the string into a block of words ...

[16:07](#msg578515d77aeb080527bb2b96)In Red, we've got `split`function for that ...

[16:08](#msg57851608b79455146fa473bb)We might also move to the /help channel later, so that we don't flood general welcome channel ... but so far, so good

[16:09](#msg57851648bdafd1910776eca4)

```
red>> split "The trip will take 21 days" " "
== ["The" "trip" "will" "take" "21" "days"]
```

DarioX1973\_twitter

[16:10](#msg5785166559cfbd4c5e8a8d6d)ok ok , but it is not possible to try parsing from a Rebol documentation if parsing in Red it is not compatible ... there is not a Red parsing doc?

pekr

[16:10](#msg578516873eaf66535e87d3a6)I posted a link to one - introducing parse

[16:11](#msg57851694c9b49c1d6f1663b5)you just tried first example. To some 90% it is compatible!

[16:11](#msg578516a6bdafd1910776efdb)don't use the additional `none`argument, but define a rule

DarioX1973\_twitter

[16:11](#msg578516c9bdafd1910776f038)ooooooooo sorry, i didnt' see it !

[16:19](#msg578518af064f8287072267a9)mmm, your red link is good Petr ... but i'm on this and i don't understand ...

```
parse "aaabbb" [copy letters some "a" (n: length? letters) n "b"]
```

the previous examples, instead, are ok ... but t his, what does it mean ?

pekr

[16:24](#msg578519a559cfbd4c5e8ab8b5)It is a bit more advanced example. Simply put, it mentally translates to this: copy to the variable `letters`some occurance of "a" ... then it executes Red code (in parens), setting `n`to 3, which is the length of `letters` ... then it supplies `3 "b"`, which matches the input ... and then it ends with the success ...

DarioX1973\_twitter

[16:28](#msg57851abeb79455146fa4c009)oh ... very powerfull sintax ... i have understood now, thanks Petr. So it seems to me that Red parsing is perhaps really good to do text elaborations ...

pekr

[16:30](#msg57851b2b064f828707229d12)Yes, it is. In fact - I was not able to do any regular expressions, but am able to do some parse. It is readable for me. Once you get into it, you will just love it ....

DarioX1973\_twitter

[19:13](#msg5785415ac9b49c1d6f190b96)A question. If i have a test wherei Wang torno extracomunitari poins wherei

pekr

[19:14](#msg5785418159cfbd4c5e8d4b09)eh, mixed up englihs with italian?

DarioX1973\_twitter

[19:15](#msg578541e359cfbd4c5e8d4c2e)Ah ah no i can not edit text from tablet or delete it.. i had italian work revision enabled here ... blaaaaa....

[19:16](#msg578541f41ca34a944e036dc8)word

[19:16](#msg5785420eb79455146fa72fdd)stupid word auto corec

[19:16](#msg578542187aeb080527be0022)Corrector ... sorry

[19:17](#msg5785423259cfbd4c5e8d4fe7)i will formulate questions on pc later...

pekr

[19:17](#msg57854233064f8287072546ee)yes, you can not edit your entries via the mobile app ....

DarioX1973\_twitter

[20:01](#msg57854cb27aeb080527be95f2)If i have a text, for example this one:  
https://www.dropbox.com/s/ra5maufmi4dq7zz/tucidide-first-3-points.txt?dl=0

How can i use parsing of text to find all points of the text that have the two word "Troia" and "Grecia" that are close to each other , but only within a certain number of words? in my example these two words have 4 words between. Sometimes, when one do textual searching, wants to find all points in a largetext, where some given word (1,2,3 words or any number of words) close to each other, so one express the distance in terms of max numbers of words between the searched words. I do not know if I explained well ... i hope so. So, how can i use parsin gto obtain this? It can be that a single "line" of text can contain an arbirtary numer of words before having a CRLF ... so ho to parse such text? in python i implemented a FSM, now i think if i could do it with Red parsing ...

[20:02](#msg57854cdc59cfbd4c5e8deaa9)ops, here the example of the point to find  
https://snag.gy/MawS7m.jpg

greggirwin

[20:11](#msg57854eef7aeb080527beb45f)@pekr :point\_up: \[July 12, 2016 9:48 AM](https://gitter.im/red/red/welcome?at=57851166c9b49c1d6f162021): https://github.com/red/red/wiki/REP-FOR-loop-function

[20:13](#msg57854f6f1ca34a944e044fb4)@DarioX1973\_twitter, probably best to move to Help for more in-depth coding.

[20:51](#msg57855836b79455146fa860e4)Join the Help room Dario. I'll post a quick hack for you there.

dahu

[22:02](#msg578568da7aeb080527c0028f)I support the idea of having a general `for` in Red, and @greggirwin 's implementation looks versatile. Programmers coming to Red will expect a `for` and complain if one is missing. As they learn and progress, they'll see more real Red code and discover the non-`for` alternatives. Learning materials for non-programmers can stress these non-`for` native approaches to looping from the outset.

DarioX1973\_twitter

[22:37](#msg5785711a064f82870727c760)

```
Red [needs: 'view]

t: read request-file/title "Select a utf8 pure text file"
print ["Loaded text in memory, of" length? t "chars."]

give-words: func [t] [
	punctation: charset [ #" " #"," #"." #":" #";" #"!" #"?" #"(" #")" #"]" #"[" #"<" #">" #"‹" #"›" #"^/" #"'" #"^L" #"«" #"»" #"|"]
	s: split t punctation
]

prin "Extracting words, please wait ... " tw: sort unique give-words t print "OK."

view [
    origin 4x4 space 2x2
	below text "Extracted words (not repeated)"
	extracted-words: text-list 300x200 font-size 10 data tw
	button "Save" [ save request-file/save/title "Save extracted word list" tw ]	
	text "Show words cointaining" my-search: field  
	button "Find" [ris: copy [] foreach x tw [ if find x my-search/text [append ris x] ] f-find/data: ris ]	 
	text "Searched words" f-find: text-list 300x200 font-size 10 data []
	button "Save" [save request-file/save/title "Save searched words" f-find/data]
]
```

https://snag.gy/gj1dGb.jpg

WOW a lot of fun in doing this my first text elaboration (extraction of words an search substring contained)! :-D

Sorry for invading the forum with my enthusiasm! :-D

[22:40](#msg578571cdc9b49c1d6f1b736a)But, i have a question. What can i use to make programs with labels in italian, but also in english with a little effort? is there something specific? some other language have external resource file to traslate labels from a language to another one ... what do you use, if you use a such thing?

[22:42](#msg57857246b79455146fa99423)Another thing. I have to say that the compact way of putting many command on a single line, is beautifull, and once one is entered in the red style of writing code, is also not so unreadable as it look me the first times ...

greggirwin

[22:45](#msg578573111ca34a944e060459)You're ramping up fast Dario. :^) Red becomes natural very quickly, but sometimes we all get a little overzealous in condensing our code. Great for writing, but not always good for reading later. Fortunately, it's easy to reformat and unfold (or pretty-print).

DarioX1973\_twitter

[22:47](#msg57857375064f82870727d6ec)@greggirwin Mmmm ok ... i take your suggestion ...

greggirwin

[22:47](#msg5785737abdafd191077c5b44)As far as localization, a few different approaches were done in Rebol but I don't know of a way that is "little effort". Localization is not easy, and not always simple string replacement.

[22:47](#msg5785738d7aeb080527c06dfb)Don't forget to join the Help room to see my word distance hack for you.

DarioX1973\_twitter

[22:47](#msg5785739759cfbd4c5e8fe1ed)Greg, you said about the "Help room" ... but i don't see it a red/Help room in gitter ...

greggirwin

[22:49](#msg578573f7c9b49c1d6f1b85e6)I might have just added you. If not, try https://gitter.im/red/help in your address bar.

## Wednesday 13th July, 2016

DarioX1973\_twitter

[08:37](#msg5785fdc5b79455146faf4d7f)Good morning. Any italian, here in the Red community?

pekr

[09:04](#msg5786041fc9b49c1d6f21a8c4)Not sure. We had a Gabriele Santilli, an excellent reboller, but he's not much active nowadays neither with Rebol nor Red.

endo64

[09:33](#msg57860ad1b79455146fafe4ef)@DarioX1973\_twitter Also check these documents, they are for R2 but useful for Red too:  
http://blog.revolucent.net/2009/07/deep-rebol-bindology.html  
http://www.pat665.free.fr/doc/bind.html  
http://www.codeconscious.com/rebol/deeper-techniques.html  
http://www.codeconscious.com/rebol/  
About `bind`ing and other useful stuff.

[09:39](#msg57860c531ca34a944e0c3eee)And here is a great explanation from BrianH, a must read!  
http://stackoverflow.com/questions/14818324/what-is-the-summary-of-the-differences-in-binding-behaviour-between-rebol-2-and

DarioX1973\_twitter

[10:41](#msg57861af47aeb080527c76c8e)@pekr Ok, so no italians here.

[10:42](#msg57861b0e59cfbd4c5e96cf85)@endo64 Many thanks for the links i have saved ...

maximvl

[12:00](#msg57862d64b79455146fb17a0b)I'm not sure, but isn't Nick italian?

DarioX1973\_twitter

[12:54](#msg57863a061ca34a944e0e7d17)Have a question, but probably i have yet request it.

I have two windows made with VID and i would like to program and test them separately. I mean, i have

window1.red

```
Red [needs: 'view]

view [
	button "Open second window" [
		;view load %window2.red
		x: load %window2.red
		view x
	]
]
```

and window2.red

```
;RED []    

;view [	
	text "This is a label"
	field "This is a field"
	button "Back to first" [unview]
	
;]
```

Well, here i have commented in window2 the lines RED \[], view \[, ], because i have an error if i don't comment them, while the window2.red is loaded by the window1.red. How can i avoid this behavior? i was thinking to manipolate the block 'x' of window2.red dinamically and delete in it , and after pass it to view function ... but can i do this?

maximvl

[13:19](#msg57863ff2b79455146fb26b52)which error?

DarioX1973\_twitter

[13:21](#msg5786404d7aeb080527c9861b)

```
*** Script Error: VID - invalid syntax at: [RED [] view]
*** Where: do
```

[13:23](#msg578640c2b79455146fb27305)but if i delete the ; in the window2.red, it works. Ok, but i think is good to have a .red with a gui inside that i can run directly or from another gui, without to change nothing ..

[13:27](#msg578641d43eaf66535e964e4c)i can do

```
view load %window2.red
```

from the console, to test separatelly the GUI, ok ... but i would prefer to have Red\[] header and so on on it, to be able to double click it with mouse and test it

maximvl

[13:31](#msg578642c07aeb080527c9a59b)wait

[13:32](#msg578642d11ca34a944e0ee728)@DarioX1973\_twitter shouldn't you use 'view in the second script's header too?

[13:32](#msg578642f659cfbd4c5e98cf38)@DarioX1973\_twitter and also write `Red`, not `RED`

[13:33](#msg57864318c9b49c1d6f25372b)I think the second one is not supported anymore

DarioX1973\_twitter

[13:40](#msg578644eabdafd19107856dcc)Ok, Red instead of RED, but i dont' works ...

maximvl

[13:42](#msg57864540c9b49c1d6f25602d)@DarioX1973\_twitter ye, I just tried myself. What about \[needs 'view] ?

[13:42](#msg5786454a59cfbd4c5e98f2a2)(I don't have Windows to try that)

pekr

[13:43](#msg578645723eaf66535e968502)I can see the error

[13:44](#msg578645a51ca34a944e0f1290)Just type into console: `x: load %window2.red` .... you will see, that the code is going to be loaded into bloc. You can't do that and call `view`directly

[13:45](#msg578645f3064f82870730c1fe)try just `do x`

DarioX1973\_twitter

[13:45](#msg578645f5bdafd19107857b46)it seems strange to me. There isn't a way to have a .red running separaterlly and callable from other .red without efforts?

pekr

[13:45](#msg57864607c9b49c1d6f257175)Or even better - don't load it, just do it ... `do %window2.red`

DarioX1973\_twitter

[13:46](#msg57864650b79455146fb2be83)i want load because i want a single gui program "windows2.red", but also i want run it from a GUI menu from other window ...

pekr

[13:47](#msg5786468eb79455146fb2c038)If you want to just load it, don't store the source along with the `Red []` header. That's for the direct execution by `do`

DarioX1973\_twitter

[13:51](#msg57864767196179690ebc5e35)oh, stupid i am!! ... you are right, Petr ... infact it's enought to do

```
Red [needs: 'view]

view [
	button "Open second window" [
		;view load %window2.red
		;x: load %window2.red
		;view x
		do %window2.red
	]
]
```

pekr

[13:52](#msg578647803c5129720e0cfd3c)Simply put - you either want to store just the UI source in a file, or you want to have separately callable window2.red

[13:52](#msg57864784d11cd2881200a5c7)exactly ...

DarioX1973\_twitter

[13:53](#msg578647c3d11cd2881200a714)However, this is an incredible fast way to program GUI windows (i speak as Delphi coder ...) !

maximvl

[13:53](#msg578647f2196179690ebc67c8)@pekr so what is the difference between two?

pekr

[13:54](#msg578647fb9f79ee4f2b93fb81)Well, I guess (from what I remember seeing my friend doing), that Delphi has an IDE advantage. On the other hand, Red + VID is so much simpler to start with ...

[13:54](#msg57864808196179690ebc6842)Difference between what excactly?

maximvl

[13:54](#msg57864823914c51592bf87856)`do` and `load`

[13:55](#msg57864838d11cd2881200b1f1)btw, from Rebol `load` docs:  
&gt;The text is first searched for a REBOL header, and if a header is found, it os evaluated first. (However, unlike the DO function, LOAD does not require that there be a header.)

pekr

[13:56](#msg57864881d11cd2881200b72d)When you `do`a script, it needs a header. When you just `load`a script, it loads the code and puts it into a block. Then you can `do`it, but not `view`it: `do load %window2.red`- this is first loaded into a block (or you can store it into some word reference), then it is executed by `do`

[13:57](#msg578648c03c5129720e0d0b82)

```
red>> load %window2.red
== [view [
    text "This is a label" 
    field "This is a field"...
```

[13:57](#msg578648e29f79ee4f2b9402fa)can you see an outer block there? It is simply a file loaded into a block .... just a source code, nothing more .... you can directly do it, or insert there something, etc.

[13:58](#msg578648fe9f79ee4f2b94056e)note: in above case I removed the Red header ...

maximvl

[13:59](#msg5786492f3cb52e8b249bcf3b)@pekr ok, it is clear now, thanks!

[14:00](#msg57864967d11cd2881200c26d)@pekr so, @DarioX1973\_twitter was doing `view` two times, what's why it didn't work

[14:00](#msg57864996196179690ebc7c8d)it was like `view [view [text "This is a label" ...]]`

pekr

[14:02](#msg57864a069f79ee4f2b941634)exactly!

[14:04](#msg57864a583cb52e8b249bf618)The proof that loaded scipt into a block is just source code:

```
red>> do append load %window2.red {print "End of the script"}
== {print "End of the script"} ;--- appears, once you close the window
```

greggirwin

[15:55](#msg5786648e8423d0842416400c):point\_up: \[July 13, 2016 7:45 AM](https://gitter.im/red/red/welcome?at=578645f5bdafd19107857b46) Red has `do` and `call`, which let you load and run things in your current script, or run a system command. You could use `call` if you want. In between those levels, however, Rebol had a `run` command and a `launch` command. `Run` was like a friendly wrapper over call for known file types (at least on Windows), and `launch` would launch a new interpreter session. It was a bit confusing, but useful.  
I'm sure Team Red has thought about this, because coordinating processes, creating supervision trees, setting up comm channels, etc. are all ways to scale (and we can probably make it easier to understand than Haskell ;^).

[15:56](#msg578664b43c5129720e0f850e)And, to help with using call `system/options/boot` contains the full path of the current Red exe.

DarioX1973\_twitter

[16:03](#msg5786663f8423d08424166502)Oh, you remember me that real nighmare of Haskell i studied many months ago, to abandon it after a lot ot time spent on ... but now with Red is another living ... after many months oh haskell, i was able to do ... pratically nothing ... :-( :-( :-( one who leave office and come back home at 19.00 o clock, and two childrens ... can learn haskell at 43 years? ... viva Red! already a minimal operative!

[16:04](#msg57866682914c51592bfb21ee)do, call, run, lanch, i sign on my notebook...

dander

[23:59](#msg5786d5c6914c51592b017383)I have been wondering (perhaps this is peripherally related to referencing external things) what exactly does the `Needs:` header do? Is it related to bare-bones module stuff, or is it something else entirely? Is there anything currently besides `'view` that can be added to `Needs:`?

## Thursday 14th July, 2016

PeterWAWood

[02:13](#msg5786f53dd11cd288120b519a)@dander Nothing has been announced about how modules will be implemented. However, if you look at the Red source directory structure, you will see that the source for view is in

```
red/modules/view
```

. You will also see that there are no other folders in

```
red/modules
```

at the moment.

That said, there is nothing to suggest that the way

```
View
```

is currently implemented is how its final implementation will look once modules have been introduced.

dockimbel

[03:06](#msg578701cb914c51592b0332bc)@dander @PeterWAWood is correct, this is our current way to handle modules, and we have only one for now.

dander

[04:39](#msg5787176a9f79ee4f2b9fbab7)@PeterWAWood @dockimbel great! Thanks for the explanation.

dsgeyser

[05:07](#msg57871e17196179690ec863d6)Another suggestion for a killer app. Seeing that the semantic web hasn't been implemented yet on a big scale (anyone with a normal website neds to update it), what if one builds a scraper for unstructured data that is easy to use. Just highlight the text needed and it builds an API to this info. This API allows flexible insertion into any app, etc.

dockimbel

[05:14](#msg57871faa9f79ee4f2ba0081c)@dsgeyser I've built such kind of app a long time ago. I think they are some online services already proposing that.

dsgeyser

[06:06](#msg57872bfad11cd288120d9947)@dockimbel If I am not mistaken, reading a page into red will not do. There are elements on a page being updated by Javascript, as well as hidden elements. Also, I am looking at the r3xml.r script by Christopher Ross-Gill. What is your view on this, and where can I start? Great work so far on Red, so addictive!

x8x

[06:36](#msg578732f98423d0842420553e)@dsgeyser have a look at Portia https://blog.scrapinghub.com/2016/07/07/scrapely-the-brains-behind-portia-spiders/

dockimbel

[06:48](#msg578735a0914c51592b0547e6)@dsgeyser Thanks. ;-) You can embed a small JS engine for that, not a big deal. Also, writting a JS to Red compiler could also be an option.

dsgeyser

[07:21](#msg57873d6dd11cd288120e52c8)@dockimbel Many thanks. I will have a look. Anyway possible to have a look at that script of yours? Also, can I embed JS code in red code?

rebolek

[07:24](#msg57873e3a8ca92f7d13d911b5)@dsgeyser  
&gt; can I embed JS code in red code?

You can definitely "embed" it as string, if that is what you mean.

DarioX1973\_twitter

[07:29](#msg57873f779f79ee4f2ba158a0)how compute how much time a .red elaboration has consumed? i'm looking for something like "time" or "now" in the help but i can't find. In Rebol, i see, there is 'now' command ...

[07:31](#msg57873fdbd11cd288120e779a)oh, "now" works only with refinements, ok sorry :-)

rebolek

[07:31](#msg57873fe34217a988760029ab)@DarioX1973\_twitter Current `time!` implementation is limited and `date!` is not implemented at all yet. Therefore you can use `now/time` only yet:

```
red>> now
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: now
red>> now/time
== 9:31:24
```

DarioX1973\_twitter

[07:32](#msg578740169f79ee4f2ba1665d)oh yes, i got that error and i tought now was not active as command ... ok now, thanks Boleslav

[07:40](#msg578741d93c5129720e1a1357)but now/time is the only refinements working? how i get date of today? now/date doesn't work

rebolek

[07:41](#msg578742178ca92f7d13d91205)@DarioX1973\_twitter As I wrote, `date!` is not implemented at all yet, that’s the reason why only `now/time` works. Plain `now` and `now/date` etc. should return date also.

DarioX1973\_twitter

[07:45](#msg5787432c3cb52e8b24a938f1)You writed it, sorry. So to get date i have to do it by calling date from OS ?

rebolek

[07:48](#msg578743da8bd95af005655d9f)@DarioX1973\_twitter Currently yes, that’s only way.

dsgeyser

[08:00](#msg578746843c5129720e1a4e89)But how to execute JS code as engine to use its functionality wrt scraping a webpage? Any way to do it? With Ref to @dockimbel earlier reply.

dockimbel

[08:14](#msg578749eee4375c9212cf8e52)@dsgeyser My old scraper is 16 years old and it was not a public project. You can search online about embeddable JS engines, they usually expose a C API to which you can bind easily from Red/System.

Zamlox

[08:15](#msg57874a333cb52e8b24a98ec5)@dsgeyser as @dockimbel mentioned, here is one example: http://duktape.org/

DarioX1973\_twitter

[08:40](#msg578750193c5129720e1acc1e)@rebolek This is not a problem because I think I have figured out how Red is being carried out . It's ok for me.

[08:46](#msg578751678423d0842421c769)it seems to me, not having a function to have currente date, not functions to use DBMS, that Red is not build like a pyramid , but as a puzzle. This is not a negative criticism. I'm trying parsing for example, and is asbolutely interesting for text elaborations i have in my mind ... :-D

[08:48](#msg578751d83cb52e8b24a9f6f9)so, what the Red logo does it means? :smile:

pekr

[08:49](#msg57875233196179690ecaafbc)Each of us have different priorities. DBMS definitely should not be the first feature to support, sorry ...

dockimbel

[08:51](#msg57875290914c51592b06b6c6)@DarioX1973\_twitter Think of it as constructing a house, you focus first on the infrastructure parts, not the "nice to have" parts. So, using that analogy, you wouldn't install light or care about the furniture in a room which has no ceiling yet. Moreover, why would you expect a 0.6 software to be as complete as a 1.0?

pekr

[08:51](#msg57875298e4375c9212cffcad)btw - there is some SQLite early binding done by Kaj De Vos, IIRC. Not sure, if it is still operable. Look into the contribution section - http://www.red-lang.org/p/contributions.html

[08:52](#msg578752e9196179690ecab495)I also expect, that once CALL is generally available, it allows us to pipe to RDBMS systems. I do remember, one of the R2 SQLite drivers, was just parsing results of sqlite.exe calls ....

[08:56](#msg578753ce3c5129720e1ae8f2)Anyway, for any DBMS app to be generally useful, you need multi-columnt widget, which is not there yet too, but I am sure will come soon :-)

[08:57](#msg5787540dd11cd288120f6e6c)@dockimbel with 0.6.0, and especially (apart from cool GUI) with the addition of simple-io, you made Red too good to be considered pre 1.0 and naturally ppl are tempted to use it more productively :-)

DarioX1973\_twitter

[09:25](#msg57875a91914c51592b071c5e)@dockimbel "why would you expect a 0.6 software to be as complete as a 1.0 ?" ... because the 0.6 staff seems to be to much good !! :-D as Petr said "you made Red too good to be considered pre 1.0 and naturally ppl are tempted to use it more productively" ... :-D

endo64

[15:04](#msg5787a9fe196179690ecf619c)That's right, for every new project I get, I think in this order: 1-Can I do it with Red? 2-with Rebol2 or Cheyenne? 3-PHP or C# :(

pekr

[15:06](#msg5787aa638423d0842426814f)Maybe Doc should put back some bugs into the mainline, so that we know, it is still an alpha software. It is really tricky - I can have the console being opened for ages, and it just refuses to crash :-)

## Monday 18th July, 2016

DarioX1973\_twitter

[07:52](#msg578c8ad9914c51592b3be68d)Hello, is there a way to avoid the opening of the Red Console when i double click directly on the .red file of windows?  
https://snag.gy/UBEY4f.jpg

[07:53](#msg578c8afd914c51592b3be724)Another question. i use snag.gy,but in gitter is there another way to put images?

SteeveGit

[08:28](#msg578c932e4e0aa786459ab687)1) To get rid of the console: `red -c -t Windows %my-file.red`  
2\) Just drag &amp; drop your local image in gitter

DarioX1973\_twitter

[08:38](#msg578c95768423d08424589bf9)Are you generating a .exe in that way? it is possible avoid Red Console without generating an exe?

SteeveGit

[08:40](#msg578c96174e0aa786459ab6ff)Ah sorry, I didn't properly read your request

[08:56](#msg578c99a6dbf44d911d5c4e68)You can use this trick:

```
console: system/view/screens/1/pane/-1
console/visible?: false
```

DarioX1973\_twitter

[09:00](#msg578c9ac48423d0842458e7ef)Good, it works. Thanks Steeve.

SteeveGit

[09:06](#msg578c9c18c732138e6b0fec93)But be aware of the fact that if you don't quit properly your app (with \*\*quit\*\*). The console is still alive (also the attached processus)

DarioX1973\_twitter

[09:11](#msg578c9d2b9f79ee4f2bd8e9c5)

[09:12](#msg578c9d61e4375c9212059b86)

[09:13](#msg578c9dd3e4375c921205a69c)

[09:17](#msg578c9e938423d08424591784)I'm not sure to understand how "don't quit properly your app (with quit)". How to do it??

[09:17](#msg578c9eafe4375c921205b2d7)I see only the window without console ...

SteeveGit

[09:18](#msg578c9ed54e0aa786459ab8c5)The console is just hidden but still running.

[09:19](#msg578c9f1bdbf44d911d5c5279)You need to use the fonction `quit` to terminate the process. Just closing your windows will not suffice.

DarioX1973\_twitter

[09:23](#msg578ca0173c5129720e518b4f)\[!\[console-closing.png](https://files.gitter.im/red/red/welcome/Pe4O/thumb/console-closing.png)](https://files.gitter.im/red/red/welcome/Pe4O/console-closing.png)

[09:25](#msg578ca087e4375c921205c2a6)Ah, i didn't notice i had a lot of gui-console- process stil active, but using quit now i have the only one active as process.

```
Red [Needs: 'View]
console: system/view/screens/1/pane/-1 console/visible?: false
view [text "ciao dario" button "quit" [quit]]
```

So this is good?

[09:26](#msg578ca0d93c5129720e519d85)Yes if i click on my button, but no .. gui-console process remain if i close the X of the window. How avoid it???

SteeveGit

[09:31](#msg578ca1e3cb81a7d1426337e6)The trick I used to hide the console, is just a temporary trick. There is no official support to terminate the process when the console is hidden. So, you have to code it by yourself. See how to use the `òn-close` event

[09:52](#msg578ca6ed4e0aa786459abd10)As a side Note: I think it's a bad idea to hide the console when you do tests or new developpments. You will not be able to catch errors. When your app is stable enough and you are ready to deploy it. You'll want to compile it anyway and so, get rid of the console.

DarioX1973\_twitter

[12:15](#msg578cc85c8423d084245ae42f)@SteeveGit 1) how can i find `on-close` documentation? i haev some difficult (i mean, respect to other well known languages) to find docs on line ... 2) mmmm ... i understand you Steeve, and for same task i am aware of it, but i would like to use Red also, some times, as pure scripting way, and i will run without console...

SteeveGit

[14:48](#msg578cec4c179b42515e21c47e)@DarioX1973\_twitter You can use gitter to forrage informations. Sometimes you're lucky. :point\_up: \[April 9, 2016 6:02 AM](https://gitter.im/red/red?at=57087ee705e328bb386d0525)

[14:59](#msg578ceedc179b42515e21c63f)Also, If your intention is to run scripts without the gui-console, look at the --cli option (not sure about that one). Else, I would compile my own executable working as a launcher for my scripts to bypass the gui console by default.

## Tuesday 19th July, 2016

sergey6661313

[09:30](#msg578df31b75045f8767f9e080)Hello. How can create windows without frames?

pekr

[09:31](#msg578df3550720fd587a98553c)`view/flags [button "unview" [unview]][no-border]`

[09:31](#msg578df3859f35137e67d5a91b)another flag is `no-title`

sergey6661313

[09:32](#msg578df3b2841e619d160871c3)Thank you so much :)

pekr

[09:32](#msg578df3c19f35137e67d5aa09)maybe I would welcome the mixture - showing a title-bar, but not border. Not sure it is possible.

sergey6661313

[10:05](#msg578dfb4fac85f2507ac90943)And where is possible to see all the flags?  
I want to clock as in the example but without frames and window to appear in the upper right corner.

pekr

[10:12](#msg578dfcf0ac85f2507ac91bf9)http://doc.red-lang.org/gui/View.html - see the link to the Window section ....

sergey6661313

[10:18](#msg578dfe92841e619d1608e522)how to write correctly? "View / flags and offset"

pekr

[10:29](#msg578e01139f35137e67d62dfa)`view/options/flags [button "ok" [unview]][offset: 0x20 size: 500x200][no-border]`

sergey6661313

[11:48](#msg578e13929f35137e67d7080a)somehow not intuitive... but it works!

pekr

[11:53](#msg578e14d20720fd587a99c7cf)Why don't you consider it being non-intuitive?

[12:00](#msg578e16670720fd587a99d6f5)Well, I am not good at following the proper Red coding rules (should re-read the docs), but you might as well write it not just like a one-liner:

```
view/options/flags [
	below
	base 200x200 red
	field "..."
	area "..."
	button "OK" [unview]
][
	offset: 0x20
][
	no-border
]
```

greggirwin

[13:35](#msg578e2cb69f35137e67d845e6)Is `options` documented? Maybe that's what is confusing.

@sergey6661313 , you could use `/size` and `/offset` separately if that's clearer to you.

[13:39](#msg578e2da69f35137e67d8545d)A block is flexible and extensible, as an interface mechanism. For example, if they add options to limit the min and max size of a resiazable window, that wouldn't break existing code. You could also write Petr's example this way:

```
view/options [button "ok" [unview]][offset: 0x20 size: 500x200 flags: 'no-border]
```

pekr

[13:40](#msg578e2dd02d04e058518817ed)Not sure if flags need to be a block, or can ba a literal value too ...

greggirwin

[13:41](#msg578e2e150720fd587a9b0d77)It can be a lit-word! if it's only one item.

One downside to blocks as interfaces is that there's no built-in processing for documentation, unless you can fit it all in a very short string. Long doc strings don't work well with `help`.

pekr

[13:43](#msg578e2e973d74e5a016621048)but - maybe options are a bit confusing. Respetively - I do remember R3 GUI, options meant values, you, as a style author exposed to be inlined in VID dialect. Window options are more like direct object field settings, while in docs we can find: "Options facet holds optional facets which are used for specific behaviors" whereas in the face section, options are described as "Extra face properties in a \[name: value] format."

[13:44](#msg578e2ed10720fd587a9b13be)I do remember, we wanted to set almost anything and we used direct object access in R2. R3 GUI prohibited that, and introduced set-facet/get-facet wrappers.

greggirwin

[13:45](#msg578e2eec9f35137e67d86632)I don't have any ideas of how to make it better just now.

pekr

[13:46](#msg578e2f1f75045f8767fd1419)No suggestions here either. I am not able to mentally embrace it all right now and forgot almost everything re R3 GUI ....

greggirwin

[13:46](#msg578e2f4d2d04e058518826fd)The R2 model was bad, beyond basic use, because you needed to understand how every style worked. Accessors were great in that regard, so you didn't have to learn and remember which facet did what, or how they interacted. Not needing to `show` in Red, with every change, is a huge step up.

[13:47](#msg578e2f770720fd587a9b1fa9)I think Team Red is on the right track, and will listen if someone posts brilliant improvements.

pekr

[13:47](#msg578e2f800720fd587a9b1fbd)we could move as well to gui-branch group

greggirwin

[13:48](#msg578e2fa22d04e0585188327c)Except I don't have anything more to add. ;^)

[13:48](#msg578e2fbfac85f2507acbdd0c)...right now.

pekr

[13:52](#msg578e309316487c5e51531c14)So I was right - options were used to allow user to set them in VID, facets held some values used in the style. Tags were used for what we calll flags and/or options ... http://development.saphirion.com/rebol/r3gui/styles/index.shtml#sect5.4

[13:52](#msg578e30b7ac85f2507acbe9a4)The best things is to probably forget about old GUIs, as it creates only a confusion ..... :-(

greggirwin

[13:54](#msg578e30fa2d04e05851884ab8)I imagine Doc has a lot of it in his head from so many years of use, so he will learn lessons from the past.

pekr

[13:54](#msg578e312a16487c5e51532148)Yes, he studied all Rebol available GUIs .... GUIs are not easy to be done in a big scale, and staying always consistent ....

[13:55](#msg578e31479f35137e67d89b23)It's a still long way towards 1.0, so we can come up with some improvements .... of course based upon practical testing ....

dander

[16:42](#msg578e586f841e619d160ddcda)I still don't quite understand the syntax for specifying multiple refinements. Maybe that is where @sergey6661313 thought it seemed non-intuitive too?

[17:18](#msg578e60fc0720fd587a9e321c)I think I should explain a little better. The way I interpret a `path!` is like a directory path or object hierarchy where each successive part is a child of the previous part, but unless I am mistaken, both `options` and `flags` are children of `face!`. I am having trouble reconciling that in my head

[17:20](#msg578e61662d04e058518b42e4)It makes total sense that you'd want to be able to do something like that, but I don't get what the rules are for it (or if not rules, convention for it?)

pekr

[17:36](#msg578e6509ac85f2507acf54bb)While they might be a children of face, you don't access them via path to the face here.

[17:36](#msg578e652675045f8767008fa7)Simply put, it is a different concept, which visually looks identical to path, but not sure, it could/should be regarded being one?

[17:37](#msg578e654d2d04e058518b7af8)It is simply a means to switch the function behaviour. Something like you run some command line tool, using -r param1 -t param2 etc.

[17:38](#msg578e658e841e619d160ec06d)It just uses different order: `function/param-x/param-y 1 2 x y`

[17:39](#msg578e65c40720fd587a9e7262)note, that function itself accepts some parameters. Refinements, might accept another ones. Does not look much readable though.

dander

[17:40](#msg578e65ff841e619d160ecbe6)so standard arguments always come first, followed by each refinement and its parameter (if there is one), in the order they are given?

pekr

[17:40](#msg578e660f9f35137e67dbd410)exactly

[17:40](#msg578e6621ac85f2507acf5fad)look at the console help, it might help. Or at the sources of functions, which provide one ...

[17:42](#msg578e66800720fd587a9e858f)

```
red>> help insert

USAGE:
    insert series value /part length /only /dup count

DESCRIPTION:
     Inserts value(s) at series index; returns series past the insertion. 
     insert is of type: action!

ARGUMENTS:
     series  [series! bitset! map!]
     value  [any-type!]

REFINEMENTS:
     /part => Limit the number of values inserted.
         length  [number! series!]
     /only => Insert block types as single values (overrides /part).
     /dup => Duplicate the inserted values.
         count  [number!]
```

[17:43](#msg578e66b2ac85f2507acf64c8)as you can see, `insert` accepts two values, those must be always there. Then it can consume some refinements, and two of them consume their own parameter ....

dander

[17:43](#msg578e66bb841e619d160edbc7)yes, so maybe part of what confused me is that there are different forms

[17:43](#msg578e66df16487c5e51568a1f)so from your example, you could equally do `function 1 2 /param-x x /param-y y`?

pekr

[17:44](#msg578e66f4ac85f2507acf65c5)yes. There's some problem with refinements order in Red still, but in Rebol, you can specify them in whatever order. You just have to keep their eventual parameters properly ordered ...

greggirwin

[17:45](#msg578e672fac85f2507acf6695)It's another aspect of the context-sensitive nature of Redbol. Paths in the context of function calls, can almost be thought of as dialected. That is, rather than thinking of it as nested elements in a tree, they are treated as a top-level element with a list of flags as a second level.

pekr

[17:46](#msg578e677816487c5e515694fc)as for your example - no - you have to type `function/param-x 1 2 x` I can admit, that long Rebol-like language refinement statements, might seem unreadable, especially if you compute parameters inline ...

greggirwin

[17:46](#msg578e677c75045f876700b22b)Your example won't work Dave. Refinements have to be attached to the function call itself.

[17:47](#msg578e67c275045f876700b5df)Coincidentally, I recently wrote https://gist.github.com/greggirwin/53ce7d1228422076e142fa5a061e7649, which may help you visualize things. I'm also working on a design to let you compute function calls with refinements. A nicer `apply` concept.

[17:48](#msg578e67fa9f35137e67dbe6a8)You can think of refinements like named parameters, except that the name is attached to the call, not the argument that goes with it (except when it's consumed).

[17:49](#msg578e683d0720fd587a9e99a0)&gt; so standard arguments always come first, followed by each refinement and its parameter (if there is one), in the order they are given?

That is exactly right. And refinements can take multiple parameters.

pekr

[17:53](#msg578e692f2d04e058518bb704)My remark, that refinements might not be considered a path, might not be true. You can have function inside the object, or function inside the function. There's just a trouble with refinement propagation to the lower level. But basically you can do:

```
red>> obj: context [add: func [a b /double][either double [(a + b) * 2][a + b]]]
== make object! [
    add: func [a b /double][either double [(a + b) * 2] [a + b]]
]
red>> obj/add 1 2
== 3
red>> obj/add/double 1 2
== 6
```

dander

[18:18](#msg578e6efc75045f8767010d67)Thanks for all the explanation on this! To double back a little bit, it seems like the help format might be a little misleading, as I generally take "usage" to mean "this is an example of how you would use this".

```
USAGE:
    insert series value /part length /only /dup count
```

[18:20](#msg578e6f7a841e619d160f64a6)it seems like it would be nice to allow the refinements to be placed in that way, but I guess there would be no way to know to which word the refinement applies

pekr

[18:23](#msg578e703075045f876701219b)That would require some deep change and not sure it would be possible.

[18:25](#msg578e70859f35137e67dc70b5)Most probably with Red's `do`evaluator ... but who knows, that's a question to language designer :-)

dander

[18:40](#msg578e740c841e619d160fa1b4)Yeah, I'm suggesting a change to the language. Just guessing at the reason that it isn't allowed.

[18:44](#msg578e74f13d74e5a01666a437) I think it might be worth considering removal of the refinements from the "USING" section... but I don't know if others would be tripped up by this as well

[18:44](#msg578e751c16487c5e51576686)maybe it's just one of "the things you learn". I'll add it to my list :)

[18:56](#msg578e77da75045f8767019012)...\*not* suggesting a change to the language (mistyped)

dockimbel

[19:03](#msg578e799716487c5e5157aaf9)@dander Agreed that the `help` output format for USAGE is misleading. I think it could be easily fixed by moving every refinement+arguments new lines, indented.

greggirwin

[21:30](#msg578e9c013d74e5a0166891df)My exact thought Nenad.

## Wednesday 20th July, 2016

dockimbel

[03:56](#msg578ef65d841e619d1616082e)@dander Please open a ticket about it.

dander

[06:31](#msg578f1ab175045f8767085796)@dockimbel created #2127

sergey6661313

[07:01](#msg578f21d50720fd587aa678ce)page not found

dander

[07:08](#msg578f23642d04e0585193e978)hmm.. I just entered the number. I think gitter picked the wrong url. should be this:  
https://github.com/red/red/issues/2127

[07:09](#msg578f23ab3d74e5a0166e0b22)I guess I needed to include the repo name

pekr

[07:18](#msg578f25d716487c5e515f2fec)I proposed another solution to 2128

dockimbel

[08:27](#msg578f35e73d74e5a0166eb2ce)@dander I think that if you are posting in a room which is related to a github repo, the right prefix would be automatically prepended to your issue number.

pekr

[08:29](#msg578f366b2d04e0585194d8de)btw - activity feed is attached to only a red/red room? Just asking, as I have constant problems with Gitter, sometimes not seeing icons, having to frequently refresh (f5, shift + reload)

dockimbel

[08:30](#msg578f36929f35137e67e53428)Github activity of a repo is visible in the chat room which corresponds to that repo.

## Thursday 21st July, 2016

spyder\_designs\_twitter

[15:09](#msg5790e5a13d74e5a016836c6a)I am new to Programming except some lite PowerShell scripting, are there any e-books or PDF's for newbies? "Red Programming for Dummies"

greggirwin

[15:10](#msg5790e5e116487c5e517394a6)Not yet. In the meantime, you could scan some old Rebol docs along those lines. Red is only at 0.6, so not feature complete, but a lot of what you learn will translate.

spyder\_designs\_twitter

[15:11](#msg5790e60f0720fd587abbacf9)ok cool, Thanks

greggirwin

[15:11](#msg5790e61275045f87671d825d)http://re-bol.com/rebol.html

[15:11](#msg5790e6233d74e5a016837279)http://www.rebol.com/docs.html

## Monday 25th July, 2016

maximvl

[13:01](#msg57960dba93148c6b21dc97df)the clock example is simply awesome

dockimbel

[13:33](#msg57961542d155b0294e08680b)@maximvl Indeed ;-), too bad we didn't make it on HN or Reddit with this article and demo.

maximvl

[14:22](#msg579620a4ad8f331f4e46af0f)@dockimbel do you mean it wasn't accepted or just wasn't published?

pekr

[14:23](#msg579620cd00c8ebdd0e225828)Is there any acceptance process? I think I saw it published (via the SO feed), but it depends how many "likes" it gets ....

dockimbel

[14:35](#msg579623b7ad8f331f4e46b7e4)@maximvl Two guys posted on HN, but at wrong time, so the posts didn't make it on front page.

maximvl

[15:59](#msg579637487c9324e20efcf683)ah

[15:59](#msg579637698fb4820a4662d1fa)a bit sad, though previous red posts did a lot of noise anyway

pekr

[16:05](#msg579638da3383eb6221423382)We can repost, no? Does the blog article need to be of an recent date?

dockimbel

[16:52](#msg579643b47c9324e20efd170a)@maximvl It's unfortunate, yes. Usually I monitor the new entries on HN after I publish a blog post, so I can alert our community to upvote it enough for it to make it on front page.

[16:53](#msg579643f63383eb6221425075)@pekr No, the date doesn't matter. Though, it is usually harder to cross the threshold if the poster has a low karma (I guess your karma on HN is not high).

[16:54](#msg5796445a7c9324e20efd18f3)Also posting on /r/programming is a good way to get the attention of the HN crowd too.

## Thursday 28th July, 2016

RnBrgn

[02:04](#msg57996818d155b0294e10060e)csnn

maximvl

[09:31](#msg5799d0db3383eb62214a32fe)&gt;It's not just you! http://rebol.com looks down from here.

[09:31](#msg5799d0e03383eb62214a3309)=(

dockimbel

[09:45](#msg5799d434ad8f331f4e4f2ffb)@maximvl In case you need to access the Rebol docs, they are available through Google cache or Web archive: http://web.archive.org/web/20160604190646/http://www.rebol.com/docs.html

maximvl

[10:00](#msg5799d7bdd155b0294e10e825)@dockimbel yep, thanks)

## Monday 1st August, 2016

gour

[15:43](#msg579f6e359e85d3e8267d77c6)i read two articles at \[Red Programming](http://redprogramming.com/) site, but wonder which docs would you recommend to continue with real learning process? (\[Official](http://doc.red-lang.org/) docs looks ok, although more GUI-oriented atm and therefore not the best resource for someone familiar with neither Rebol nor Red?

dockimbel

[15:55](#msg579f70fcc915a0e426b33e2f)@gour Definitely the \[Rebol Core Manual](http://web.archive.org/web/20160322081114/http://www.rebol.com/docs/core23/rebolcore.html), it's the best doc I know for learning the Rebol/Red basics.

gour

[16:09](#msg579f7441e2ff9ec76e4d4cf0)@dockimbel thank a lot!! looks great

[18:30](#msg579f954e47659bfb1085f50c)iirc, Red binary had to be in the current directory to be properly launched. is it still the same or it can work from the $PATH?

[18:30](#msg579f9563c915a0e426b3a2bc)hmm, it seems it's still the latter

greggirwin

[19:16](#msg579fa01f00663f5b1b425290)I believe that issue is related to Rebol Encap, so will be there until Red is self-hosted.

gour

[19:22](#msg579fa193e2ff9ec76e4dcb1e)@greggirwin ok, we can live with that, or there are more pressing issued to be done before

## Tuesday 2nd August, 2016

dockimbel

[04:23](#msg57a02028e2ff9ec76e4ec4d2)@gour You need to wrap it in a shell script in such case, as a workaround. See https://github.com/red/red/issues/543.

gour

[04:41](#msg57a0248a0bd017c16e341f11)@dockimbel thank you. on my Linux I use \[fish shell](http://fishshell.com/) and here is workaround for fish users:

```
cat .config/fish/functions/red.fish 
function red
    ~/bin/red-lang $argv
end
```

[04:42](#msg57a024c79e85d3e8267f1c50)(my Red binary \_-- red-lang_ is in `$HOME/bin`)

geekyi

[05:03](#msg57a029bde2ff9ec76e4ed47d)I see you're already running red.. my bad @gour . Just started with gitter.. not familiar with everything yet

gour

[05:04](#msg57a029ea00663f5b1b435762)np ;)

[05:06](#msg57a02a4a9e85d3e8267f24ee)i believe the current Red can serve me well while learning...i even did try to cross-compile to Linux and running executable via wine worked (dunno about the last version, but i assume no regressions here)

geekyi

[05:10](#msg57a02b3f00663f5b1b43598a)Red has come such a long way since I started.. it was missing a lot of rebol functions.. so a lot of code wasn't working (you had to rely on rebol docs for most everything)

[05:11](#msg57a02b8b1c2bf6621bb46210)Thanks Doc and Qtixie

greggirwin

[16:25](#msg57a0c9930bd017c16e35a738)@geekyI, we could look at a community repo for R2 compatibility mezzanines, to aid porting. I have a gist up where I'm dumping mezz ideas, but many are new and not just for porting purposes. Let's see what 0.7.0 brings, because I/O is a big piece and may be better to write to match Red's model if it differs from R2.

Respectech

[21:34](#msg57a111ebe2ff9ec76e511c9e)R2 compatibility mezzanines would be great because then I could compile a lot of my R2 tools that are used in our businesses

greggirwin

[22:03](#msg57a1189c1c2bf6621bb6b160)We probably need a place where people can list the mezzanines they want, with a way to sort by aggregate need.

## Wednesday 3th August, 2016

geekyi

[05:31](#msg57a181a6836d2d02115f7076)@greggirwin cool, I see you have listed some in the red wiki

[05:32](#msg57a181d29e85d3e82682442e)What's the current workflow to port from R2 to Red?

greggirwin

[06:30](#msg57a18f86e2ff9ec76e520e68)There is no workflow yet, that I know of, unless you're porting things that don't involve I/O. In that case, my workflow is to look for big obvious that can't be ported, or will take a lot of work. Don't try those. Next, copy, change %.r to %.red, find the things I know don't match up, pull from my stock of ported mezzanines for others, try it, throw out old stuff, think more in Red and don't worry about R2 compatibility.

gour

[06:55](#msg57a195660bd017c16e3772fb)Eve-like demos do not work here with wine?

[07:02](#msg57a197151c2bf6621bb79858)i'm using latest master build...tried also to produce executables by cross-compiling to win xp target and then run, but same thing. does it mean that linux users still have to be patient with gui stuff?

[07:07](#msg57a1983c0bd017c16e377987)does windows in this case means something like &gt;= win7

dockimbel

[08:36](#msg57a1ad110bd017c16e37a5c0)@gour IIRC, people reported it working on XP. The spreadsheet demo was working fine on Wine, so I see no reasons the clock wouldn't, unless there's a regression caused by latest commits. Does Wine support SSE3 (or at least the x87 FISTPP instruction)?

gour

[09:16](#msg57a1b67f9e85d3e82682b69c)@dockimbel well, i don't have XP, no Windows at all, neither via vbox, but just cross-compiled to WinXP target and/or tried with Wine...spreadsheet demo works, but those Eve-like ones do not

dockimbel

[09:17](#msg57a1b6ac1c2bf6621bb7de72)@gour Can you be more specific about "does not work"? Any screenshot?

gour

[09:21](#msg57a1b7b6c915a0e426b8521e)@dockimbel here is the \[link](http://pasteboard.co/pCWGx2FB.png)

[09:22](#msg57a1b7df836d2d02115fdd48)for clock demo

dockimbel

[09:27](#msg57a1b8ea836d2d02115fdff1)@gour Thanks. Odd behavior. Do you have any errors in the Wine logs? @qtxie What do you think of that?

gour

[09:29](#msg57a1b9969e85d3e82682be51)@dockimbel i do not see any log file...

[09:34](#msg57a1ba9c9e85d3e82682c0c1)i get similar thing with worm-demo

dockimbel

[09:42](#msg57a1bc7d0bd017c16e37c7c9)@Gour You should rather report such issues in red/red room, where more people who are using Wine could help you.

gour

[09:43](#msg57a1bcc70bd017c16e37c86d)ok

DarioX1973\_twitter

[13:54](#msg57a1f790e2ff9ec76e5306b2)Hi Nenad. Did you find a good gif editor? i am curious... :)

gour

[15:09](#msg57a2092a00663f5b1b47aba7)reading/skimming through Rebol's \[Core Users Guide](http://www.rebol.com/docs/core23/rebolcore.html) (as recommended by @dockimbel ) and encountering not (yet) defined stuff like `remold`, `protect` etc. Can one ecpect that all these things are going to be implemented in Red eventually or some stuff is not going to be needed in Red?

[15:24](#msg57a20caae2ff9ec76e53450b)the above-mentioned Guide gives the following example `if age > 10 [print "Older"] [print "Younger"]` for common mistake which is hard to detect. however, for whatever value of \_age_ Red gives result of `[print "Younger"]`. is that same one would get from Rebol?

greggirwin

[15:29](#msg57a20dc7836d2d021160b877)@gour, not all Rebol words will be ported. Some wont' be needed, and some will be done in such a different way that it wouldn't make sense. For example, while some old VID docs may apply, anything related to View at the lower level will not. Some concepts will be similar, but that's all.

[15:31](#msg57a20e49e2ff9ec76e534ab1)For the `if` example, Rebol would give the same result in the console. If `age` is &gt; 10, you should also see "OLder" printed out.  
The reason you get the second block as the "result" is because Red returns the last evaluated expression, and that block is not consumed by `if`.

gour

[15:36](#msg57a20f8c9e85d3e82683a10b)i see the code as example where programmer forgot to use \_either_ instead of \_if\_, but wonder if Red compiler could be taught to report something instead of just returning last expression?

[15:37](#msg57a20fc8c915a0e426b93747)like in `either age > 10 [print "Older"]` example where it reports:

```
*** Script Error: either is missing its false-blk argument
*** Where: either
```

greggirwin

[15:39](#msg57a2104bc915a0e426b938e2)Short answer: No, it can't.

gour

[15:40](#msg57a21088c915a0e426b939bb)by design?

greggirwin

[15:41](#msg57a2108d47659bfb108b7821)As far as Red is concerned, `if age > 10 [print "Older"] [print "Younger"]` is perfectly valid.

[15:41](#msg57a2109500663f5b1b47c146)Yes, by design.

gour

[15:41](#msg57a210980bd017c16e38aaf4)ok

[15:42](#msg57a210ce1c2bf6621bb8cc26)programmer still has to use his/her brain :-)

greggirwin

[15:42](#msg57a210de47659bfb108b7903)By design, and because it can't know what you're thinking. :smile: ^)

[15:43](#msg57a211339e85d3e82683a5b0)

```
red>> if age > 10 [print "Older"] [print "Younger"]
Older
== [print "Younger"]
red>> if age < 10 [exit] [print "Younger"]
== [print "Younger"]
```

gour

[15:44](#msg57a2116000663f5b1b47c3ae)well, my naive thinking is that it should know that \_if_ block should not receive more than one block?

greggirwin

[15:46](#msg57a211c8836d2d021160c4dd)It does know that. And `if` is only consuming one block. My example above isn't good. No coffee yet.

gour

[15:46](#msg57a211d01c2bf6621bb8cf20)of course, i admit i'm polutted by other langauges :-)

[15:47](#msg57a211f747659bfb108b7bb7)and reading the Guide brings new light into Rebol/Red which i really like

greggirwin

[15:47](#msg57a2121d836d2d021160c5e4)Red evaluates `if`, sees that it needs a condition, so evaluates enough for that, and then its body block. Now Red is done with `if`. What should it do next?

[15:48](#msg57a21254836d2d021160c67a)There is more data to evaluate (the second block). Should it stop without doing that?

gour

[15:49](#msg57a2127700663f5b1b47c6f2)parse error? extra block?

greggirwin

[15:49](#msg57a21283836d2d021160c709)And it may not be a "second" block, it could be anything.

gour

[15:49](#msg57a2129f00663f5b1b47c790)similar how \_either_ detects missing block?

greggirwin

[15:50](#msg57a212b700663f5b1b47c7dd)

```
red>> if age > 10 [print "Older"] print "Done"
Older
Done
```

gour

[15:51](#msg57a212ee9e85d3e82683aa8c)in any case, it's interesting

[15:51](#msg57a212f10bd017c16e38b1d6);)

greggirwin

[15:52](#msg57a2132100663f5b1b47c920)Ahh, big difference. When Red evaluates `either` it knows, by its function signature (as evaluated in the context of `do`) that it needs 2 more values. If it gets less, that it can tell. If there are more, `either` just doesn't care about them. It's called free ranging evaluation and is a very important part of how Red works.

[15:52](#msg57a2134ee2ff9ec76e535953)So you can detect "not enough", but there is no such thing as "too much". :^)

gour

[15:52](#msg57a2135a836d2d021160c9be)i accept what you say being ignorant about the mechanisms how Rebol/Red do work

[15:53](#msg57a213619e85d3e82683abdd):-)

[15:53](#msg57a213819e85d3e82683ac30)in any case, it's good to know about that (possible) gotcha :cool:

greggirwin

[15:56](#msg57a21413836d2d021160cc7a)

```
red>> fn-1: func [v][print v v]
== func [v][print v v]
red>> fn-2: func [v vv][print [v vv] reduce [v vv]]
== func [v vv][print [v vv] reduce [v vv]]
red>> caller: func [fn][res: fn 1 2 3  res]
== func [fn][res: fn 1 2 3 res]
red>> caller :fn-1
1
== 1
red>> caller :fn-2
1 2
== [1 2]
```

[15:58](#msg57a214c047659bfb108b8501)This is a bit advanced, so don't worry if it's confusing. First, we define 2 funcs of different arities (number of args they take). Then we write a wrapper that can be passed any function. It supports functions up to an arity of 3 (because we hardcoded 3 args in the call). Note what happens when we call the two different funcs we defined. No errors occur. They each consume the number of arguments they expect, and the extras are just ignored. Red evaluates them, but they don't "do" anything.

gour

[15:59](#msg57a214c99e85d3e82683b024)what does block `res: fn 1 2 3 res]` do? i'm not sure i've got it

greggirwin

[15:59](#msg57a214ec0bd017c16e38b7bc)It calls the function we passed in with the args `1 2 3`, then returns the result of that function call.

gour

[15:59](#msg57a214f79e85d3e82683b0cc)ok

greggirwin

[16:01](#msg57a21544c915a0e426b94910)But also consider that `if` could be redefined in another context, in your example. Suppose (and you should NOT do this in general) that you wanted to always supply a second block to `if` as an `else` block, because you don't like `either`. You can do that.

gour

[16:02](#msg57a215a2c915a0e426b94a6e)that's power of language meant to create DSL-s, right?

greggirwin

[16:03](#msg57a215c447659bfb108b884a)This was done under R2, because you can't do it under Red this way right now.

```
>> if: :either
>> age: 10
== 10
>> if age > 10 [print "Older"] [print "Younger"]
Younger
```

gour

[16:03](#msg57a215c9836d2d021160d16e)@gour was recently interested to use Racket...

greggirwin

[16:03](#msg57a215cc47659bfb108b885f)Correct.

gour

[16:04](#msg57a215f30bd017c16e38baad)got it. thanks

geekyi

[16:29](#msg57a21be20bd017c16e38cf03)@geekyI is wondering how to write like gour. Guess this doesn't work

[17:16](#msg57a226d547659bfb108bb71f)@geekyI thinks again

gour

[17:31](#msg57a22a7e9e85d3e82683f36f)@geekyI to write what?

geekyi

[18:21](#msg57a2360d0bd017c16e3917b6)@geekyI knows now, thanks

## Thursday 4th August, 2016

WiseGenius

[00:52](#msg57a291df6085a4026515f3bf)@WiseGenius still doesn't how to write that way... or why he should.

[01:17](#msg57a297a48c8b3c3c1e05fba0)@WiseGenius finally understands.

maximvl

[11:24](#msg57a32603c915a0e426bbc2f8)guys, why do we have concurrency and GC support in the bottom of milestones list? these things can have great impact on everything else, like I/O, can't they?

dockimbel

[13:59](#msg57a34a38e2ff9ec76e5635e3)@maximvl If the roadmap was purely tech-driven, I would do I/O last, I agree. Then I would have also pushed things like GUI, ARM or even float support at the end too. But as you can guess, we cannot have a purely tech-driven roadmap, otherwise, we wouldn't have been able to fund the work on it, and the community around it would have grown much more slower. So we need to account for growth/marketing, business, funding needs too in setting up a successful roadmap.

For the technical concerns, here is how we will handle them:  
\* Concurrency: I/O will be fully asynchronous, so whatever concurrency abstraction we design for Red, I/O should not be a big concern.  
\* For the GC, we will carefully design the I/O memory usage in order to minimize the burden for the GC, and make it flexible enough to adapt to different possible GC strategies (incremental vs stop-the-world).

gour

[14:02](#msg57a34afbc915a0e426bc2433)iow. concurrency &amp; GC although not coming earlier, are still not after-thought, right?

maximvl

[14:06](#msg57a34bf1c915a0e426bc26ea)@dockimbel yep, I though so, thanks for clarification!

dockimbel

[14:06](#msg57a34bf5836d2d021163a91b)@gour We have the global design for them, though we'll need to do some additional work for the details. Also, since those designs are almost 5 years old now, we'll need to revisit them anyway.

## Friday 5th August, 2016

gour

[13:57](#msg57a49b2f48422f8b49718e62)i continue reading REBOL's User Guide and the Chapter-6 about 'Series' gives the following example:

[14:03](#msg57a49c9748422f8b4971930b)

```
print-it: func [/local str] [
    str: ""
    insert str "ha"
    print str
]
```

showing it as example that one has to use `str: copy ""`  
to avoid side effects when repeatedly invoking the function. Still, I'd like to hear some explanation of the following: "Although str is a local variable, its string value is global. ", iow. is such semantic common with some other (popular) langauges?

RnBrgn

[14:50](#msg57a4a7cc48422f8b4971b5da)@gour

```
red>> print-it: func [/local str] [
        str: ""
        insert str "ha"
        print str
    ]

red>> str: "test"
== "test"
red>> print-it
ha
red>> print-it
haha
red>> print str
test
```

gour

[15:07](#msg57a4abad857442dc0f56036b)@RnBrgn hmm, even more confused. :-) so it looks that `str: 'test' is allocated from the other part of memory or simply belong to different 'namespace'...still, curious why it is required to use`str: copy ""`when the variable is declared as`local\` for the function?

greggirwin

[15:09](#msg57a4ac34483751d50f2c280e)https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

gour

[15:11](#msg57a4acb8978997001e9912fc)@greggirwin ohh, that will explain it, thanks. :thumbsup:

greggirwin

[15:13](#msg57a4ad156bf4dff61d362e1b)There are others out there, too, which go more into the details of `bind`, but Doc wrote a great explanation there.

RnBrgn

[15:16](#msg57a4adc648422f8b4971c87f)@gour red-by-example.org has a good explanation as well. check out "series" section 3.3 http://www.red-by-example.org/series.html

gour

[15:17](#msg57a4ae022f03cf8749c9c45f)@RnBrgn thanks...just reading same chapter in Rebol's UsersGuide :-D

dockimbel

[15:43](#msg57a4b42fd097eb6b2cc80cfb)@gour There is no "variable" in Rebol/Red, only values, among which are \*word* values, having the property to refer to another value in a given context (which you can freely change for each word instance, at runtime). All values are strictly anonymous, functions and objects have no \*name\*. You can manipulate values directly, or indirectly through words referring to them. That extra indirection level does not exists in most other languages.

gour

[15:48](#msg57a4b5606bf4dff61d364476)@dockimbel right, so instead of 'variable' it is better to say 'binding', right?

dockimbel

[15:49](#msg57a4b57dd097eb6b2cc8108b)@gour Right, that's closer to how it works. I should really find time to write an intro to Red, explaining the big picture and foundational concepts.

gour

[15:49](#msg57a4b5936bf4dff61d3644f4)i'll go through your 'wiki' articles ...

geekyi

[15:57](#msg57a4b76dfb162b752ca104f4)&gt; http://www.red-by-example.org/series.html#6

That's the most complete Red guide I've seen so far. Didn't see that before. How did I miss?

dockimbel

[16:05](#msg57a4b948978997001e993486)@geekyI Just keep in mind that such third-party doc is written from his author own's perspective and is not authoritative.

JacobGood1

[17:29](#msg57a4cce66bf4dff61d368439)&gt; @dockimbel I should really find time to write an intro to Red, explaining the big picture and foundational concepts.

Please find that time. =) It can take a lot of time to comprehend the big picture of a language.

[17:50](#msg57a4d1d16bf4dff61d368faf)Wow, this is the best explanation I have seen of the rebol/red way of thinking.

https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

geekyi

[18:03](#msg57a4d4e2857442dc0f56737f)

```
red>> do code
== func [input /local s][s: "hello world" append s input]
red>> test "x"
== "hello worldx"
red>> body-of :test
== [s: "hello worldx" append s input]
```

I'm lost at how `body-of :test` changed..

[18:10](#msg57a4d681d097eb6b2cc865cf)Ok, I so `s` is bound to the.. func? Like a closure sort of? No confusion there

```
[s: "hello world" append s input]
```

but "hello world" is bound to `s`? Still fine..

greggirwin

[18:12](#msg57a4d72b857442dc0f567933)"hello world" is not bound to `s`. `S` \*refers to* it. Strings don't have bindings, words do.

geekyi

[18:13](#msg57a4d73f2f03cf8749ca309d)So, I think that's what I missed,  
&gt; "hello world" is bound to `s`

whenever you use `:`, it is bound to something?

greggirwin

[18:14](#msg57a4d776483751d50f2c9a3a)&gt; it binds the word to the result of next expression.

[18:14](#msg57a4d7986bf4dff61d369e34)Maybe I misread the order of what you meant by "bound".

[18:16](#msg57a4d7e4857442dc0f567b07)It's a tricky subject when we want to reuse words like "bind". :^)

geekyi

[18:16](#msg57a4d7ea857442dc0f567b0e)Ugh yeah, the string is bound to `s`, so `s` refers to the string?

[18:17](#msg57a4d845fb162b752ca15b1a)I think of bind like `s <- "hello world"` not `s -> "hello world"`  
Think it is the way rebol/red works yeah?

greggirwin

[18:17](#msg57a4d846d097eb6b2cc86a1a)Just don't think that the string \*contains* the binding. Because more than one word can refer to it.

[18:18](#msg57a4d8772f03cf8749ca331a)Like I said, it's tricky. Because we also have the binding, real `bind`ing of words and contexts.

[18:18](#msg57a4d885978997001e9986c0)But the string just exists in the block.

geekyi

[18:19](#msg57a4d8af978997001e998736)Ok, so I might have been using bind in my own meaning, no the way red intends it..

greggirwin

[18:20](#msg57a4d8f46bf4dff61d36a177)Even my explanation "exists in the block" isn't quite correct. The block has slots, but that doesn't mean the actual string data is there. But let's not go there right now. :^)

geekyi

[18:22](#msg57a4d960978997001e998899)

```
red>> t: s: "hello world" append "d" t
== "dhello world"
red>> s
== "hello world"
```

This wasn't what I expected.. so I'm still not sure.. shouldn't both s and t refer to the same string?

greggirwin

[18:22](#msg57a4d9682f03cf8749ca3609)Right. Binding is how Red works without scoping like other languages. But you may never need to know that, because it \*looks* like it has scoping.

[18:24](#msg57a4d9d0fb162b752ca15f34)You have multiple expressions in there.

[18:24](#msg57a4d9ec2f03cf8749ca3747)`t: s: "hello world"` and `append "d" t`

geekyi

[18:25](#msg57a4da0dfb162b752ca15fe5)That was by intention

```
red>> t: s: "hello "
== "hello "
red>> append "w" s
== "whello "
red>> t
== "hello "
```

greggirwin

[18:25](#msg57a4da26483751d50f2ca0d3)`t` and `s` do refer to the same string, but you aren't appending to that. You're appending to "d" which you only see as the result, but don't set a word to refer to it.

geekyi

[18:26](#msg57a4da53857442dc0f568110)You're right!

[18:32](#msg57a4dbb0d097eb6b2cc87331)So the golden rule is `:` binds, which sorts of works like call by reference. Red has "denotational" semantics, which roughly means it has no scope. Anyway, that's what I've learnt so far.. could be all wrong :neutral\_face:

[18:32](#msg57a4dbc8483751d50f2ca4de)I'll need a day to contemplate this..

[18:35](#msg57a4dc61857442dc0f568685)For the unaware, there is a tendency to think `s: "hello world"` working like assignment

[18:35](#msg57a4dc77857442dc0f5686c1)Actually, that won't be wrong either

[18:36](#msg57a4dc9c48422f8b497241b3)The literal string is getting modified here.. sort of

[18:37](#msg57a4dcf62f03cf8749ca3e91)Red.. even the literal values are mutable :tongue:

[18:45](#msg57a4dec92f03cf8749ca4362)Ok, I think I get it now.. perhaps that might be the most important concept to understand, something at the heart of red

[18:46](#msg57a4df1bfb162b752ca16bdc)The answer to the question of how do variables/scope/metaprogramming work

greggirwin

[20:26](#msg57a4f65d48422f8b497289ec)@geekyI , take some time to digest. `:` doesn't "bind" in Red parlance, and it's not like call by reference. Some values, like series types, are mutable, others are not.

## Saturday 6th August, 2016

PeterWAWood

[00:01](#msg57a528df483751d50f2d5d5e)@geekyI "even the literal values are mutable" - this is not correct in all cases. For example, integers are not mutable, words are not mutable. There is a category of values considered

```
immediate
```

which are not mutable. You can list them in the console:

```
red>> probe immediate!
make typeset! [datatype! none! logic! char! integer! float! word! set-word! lit-word! get-word! refinement! issue! typeset! pair! percent! tuple! time!]
```

geekyi

[02:48](#msg57a55016d097eb6b2cc96ae1)@PeterWAWood so immediate! is the closest thing you have to primites

greggirwin

[03:17](#msg57a556c648422f8b49734392)I guess that depends on your definition of primitive. I would say all Red datatype values are primitives to some extent, with objects being the least primitive. e.g. they don't have a lexical form. We also have a `scalar!` typeset.

geekyi

[03:19](#msg57a5573a48422f8b4973442c)Out of curiosity, I was wondering if I could get the list of types

```
red>> body-of immediate!
*** Script Error: reflect does not allow typeset! for its value argument
*** Where: reflect
```

reflect doesn't work on data types in general?

[03:20](#msg57a55788483751d50f2da842)Looking for a good reference to understand functional/meta programming

[03:24](#msg57a558672f03cf8749cb3e41)I'm used to haskell style functional programs, with `fold`, `zip` and `map`, where the main data type is a list (probably the same for lisp)

[03:24](#msg57a5587d6bf4dff61d37a6cb)I've found `map-each` works like `map`

dockimbel

[04:49](#msg57a56c7348422f8b49736371)@geekyI `body-of` does not work on immediate! types (typeset! is an immediate!). Just `probe` it, like @PeterWAWood did.

[05:03](#msg57a56fb26bf4dff61d37cbc1)@JacobGood1 I should be able to write an even better explanation now. I've started writing a draft for a Red intro.

geekyi

[06:20](#msg57a581b1483751d50f2de86c)`probe immediate!` returns a typeset! (only in Red tho, in Rebol it is a block)

[06:21](#msg57a581e248422f8b4973824b)I was able to do this:

```
red>> third load form immediate!
== [datatype! none! logic! char! integer! float! word! set-word! lit-word! get-word! refinement! iss...
```

[06:22](#msg57a58224483751d50f2de8f1)`load form` looks like a good hack when everything else fails :smile:

dockimbel

[07:56](#msg57a59829483751d50f2e0bf2)@geekyI Ah, sorry, I misunderstood what you wanted. Once `to` will be fully implemented, you'll be able to just do a `to block! immediate!`.

geekyi

[07:59](#msg57a598e92f03cf8749cb9c88)@dockimbel doing metaprogramming in red is fun! :smile:

[08:00](#msg57a59914d097eb6b2cc9d5da)Is there a difference in typeset! between version? Red's seem more complete

[08:02](#msg57a59989d097eb6b2cc9d672)R2:

```
>> ? typeset!
No information on typeset! (word has no value)
>>
```

Red's `help` function feels more helpful in this regard

meijeru

[09:00](#msg57a5a729483751d50f2e21da)@geekyI `typeset!` is a real datatype in R3. In R2, it is identical to `block!` and I presume this is for compatibility with R3.

[09:01](#msg57a5a76648422f8b4973b847)Instead of `? typeset!`try just `typeset!`at the R2 prompt, and you will get `block!`.

JacobGood1

[13:26](#msg57a5e586483751d50f2e8618)@dockimbel excellent, the other write up was really good, looking forward to another one.

Senenmut

[15:44](#msg57a605d2483751d50f2ec222)TCP/IP

[15:47](#msg57a606a2d097eb6b2cca9286)I am no Network Programmer

[15:49](#msg57a606f02f03cf8749cc57a6)Have a simple question about that.

[15:50](#msg57a6075dd097eb6b2cca9418)Can anybody help ?

maximvl

[15:51](#msg57a6077ffb162b752ca377f0)@Mennohexo ask questions, don't ask to ask

greggirwin

[15:51](#msg57a6077fd097eb6b2cca94a7)Red only has a few basic I/O features right now. Not raw TCP yet. But feel free to ask your question.

Senenmut

[15:53](#msg57a607ec2f03cf8749cc594f)Hi Gregg , i have posted it on google forum too. What do i have to prepare that a networkprogrammer can bind my complete Application in a network , let us say with TCP/IP ?

[15:55](#msg57a6086b48422f8b4974648a)The App is already. Perhaps i have nothing to prepare because a network programmer can access every application on a computer.

[15:56](#msg57a608c0857442dc0f58a669)In fact i want have nothing to do with networking. Only a application programmer i am.

greggirwin

[16:05](#msg57a60abc48422f8b4974688a)I'm not sure what you mean by "bind my complete application in a network." Do you want to write a DLL, or communicate with your app via TCP?

Senenmut

[16:08](#msg57a60b666bf4dff61d38c3b8)You have a application and a data file on a computer. Now a network programmer wants to put that datafile of the application in the LAN network . Not matter what protokoll. I say to the networker : "Please put my app in the network"

[16:10](#msg57a60be5483751d50f2ecd29)So every Computer can access the datafile .

greggirwin

[16:12](#msg57a60c64483751d50f2ece1c)If you have a network share, your app can just write to a network location.

[16:13](#msg57a60c8f2f03cf8749cc624b)It has nothing to do with networking, except what the OS does to make shares available.

[16:14](#msg57a60ce8978997001e9ba4c1)Ah, I see it's more than that in your ML message.

Senenmut

[16:15](#msg57a60d15483751d50f2ecf3e)Thats good. Then i only have to program my application and the rest can be done by the network programmer.

greggirwin

[16:16](#msg57a60d47fb162b752ca382f4)&gt; In such a way that all the main data files of every application is synchroniced automaticly with everyone else.

This makes it a bit more involved. Now something on the server needs to monitor files for changes, and your file is acting like a messaging system, so your data needs to be designed to support data (e.g. which way is data going).

Senenmut

[16:17](#msg57a60d8348422f8b49746d7d)Gregg , does that mean that a main controlling com puter that is also connected in the network , can send data (pictures etc) to the datafile of my application ?

greggirwin

[16:18](#msg57a60df3857442dc0f58af88)Only if each machine also exposes a share for the server to connect to. You could also use the share on the server and have each machine read from that, so all data is on the server.

It's really hard to say, because there are so many ways this could be done.

Senenmut

[16:19](#msg57a60e13483751d50f2ed0ee)Do i have do program that or can that all be done by the networker ?

greggirwin

[16:21](#msg57a60e92483751d50f2ed21b)Either way. For a simple app, or to experiment, a simple network share should be enough. So your admin just has to set up a share on a server and then you need to (on Windows) create a network drive mapping.

Senenmut

[16:25](#msg57a60f7c483751d50f2ed439)Ok, youre right. It is complex and there are many methods. I will do that the network programmer better and concentrate on my application. The background of this questions here are more described on Red Lang Google Group postings. Mechanical Assembly Information Systems. Thank you very much for your attention Gregg.

[16:27](#msg57a60ffc978997001e9bab96)Altogether i only want to program so deep , as it is necessary to reach goal in work. That is enough , if the work is successful done.

[16:28](#msg57a61031d097eb6b2ccaa5aa)Have a nice day. See you next time on this place too. WBR Hans

[16:43](#msg57a613abd097eb6b2ccab346)i dont know how to logout from this chatroom , so i have to logged in here for the next 20 years . ha ha

geekyi

[16:54](#msg57a6162bfb162b752ca3998c)@Mennohexo don't have to logout, but if you really want to, you can leave by clicking the room icon, then the setting graphic, then leave

Senenmut

[19:05](#msg57a634f8d097eb6b2ccaf97e)ok

[19:08](#msg57a635c4483751d50f2f284f)I have read the information here that there has to be a client server with a forever loop that is scanning the threads from every client computer on the LAN to handle parallel processing TCP/IP. In fact a case for a networkprogrammer !

[19:11](#msg57a63659fb162b752ca3db29)One socket for every client.

## Sunday 7th August, 2016

geekyi

[02:37](#msg57a69eecd097eb6b2ccbb5cc)@Mennohexo so far so good.. I think. Your problem seems to be very generic, you are trying to make a big leap from application programming to network programming? Since your question is very generic and not limited to red, I'd suggest you ask about it on a site like stackoverflow.com ; it will give you a wider audience and more exposure  
Actually, I don't know at what stage of learning you are at?

[02:48](#msg57a6a177978997001e9cb9aa)For example. What is your experience? What have you programmed in before?  
I'd looked at your \[Google groups question](https://groups.google.com/forum/#!topic/red-lang/01gW1w0IHM4) and it looks like you are a complete beginner? Sorry if I misunderstood  
It is better to ask specific questions in here, preferably, showing your code. And if it isn't red or rebol specific (and perhaps it even is!) I'd suggest you look at stackoverflow.com. Checkout http://rebol.info for resources

[02:52](#msg57a6a28b2f03cf8749cd766d)@Mennohexo This is what I suggest you do:  
Take a look at the resources at http://rebol.info, In particular, start with:  
1\. \[REBOL in Ten Steps](http://rebol.com/rebolsteps.html)  
2\. \[Learn Rebol](http://re-bol.com/)  
3\. \[Rebol programming wikibook](https://en.wikibooks.org/wiki/Rebol\_programming)

[02:57](#msg57a6a38b857442dc0f59c5d0)Then keep going through those 3 websites simultaneous till you are familiar, also checking out the other resources at other sites

[02:59](#msg57a6a402d097eb6b2ccbbcdc)You don't have to go through things in that order; all 3 are pretty good as an introduction. You can pick and choose and start with what suits your preferred way of learning best, only the pacing is different in each

## Monday 8th August, 2016

Senenmut

[08:57](#msg57a84989978997001e9fa4db)I hate APIs

[09:02](#msg57a84aa6483751d50f32e9b5)The best OS is that OS that only displays the data of programmed application , just do display. And the thousands of API programmers are biting on granit. ha ha

[14:09](#msg57a89283ff82b9fc7e6bb5cf)ok . one more that is really funny for you profs. Then i leave here for normal code conversation. Question : What is a good programmed application and the API of a operating system standing for ? Answer : A good application must act as a better moderator than the Os-API itself. When the program .exe is starting it takes all over the whole API of the OS by itself and saying : You are not the API , I am the API now. ha

dockimbel

[14:15](#msg57a8940eae838f6f568da7c5)@Mennohexo As a reminder: this chat room and the other ones under the "red/" umbrella are dedicated to discussions about the Red programming language.

Senenmut

[14:20](#msg57a8953046610f1739489f89)Sir. Yes Sir!

## Tuesday 9th August, 2016

CALorenzF\_twitter

[13:52](#msg57a9e018d7087a017fa597eb)Can I use RED in CGI mode as I used to do with Rebol 2?

endo64

[15:26](#msg57a9f61816b0696856a68ce2)You cannot I think, as `port` implementation is not yet ready. So you don't have stdin / stdout yet. I don't know if it is possible with Kaj's bindings.

[15:28](#msg57a9f68346610f17394bed1d)But of course later you can. And better, when Doc rewrite his great `Cheyenne web server` in Red you will be able to run your Red scripts directly inside the web server.

dockimbel

[15:33](#msg57a9f7e2613cc1803673ec2c)`input` is able to read on stdin, so it should be possible to make it work.

## Thursday 11st August, 2016

JacobGood1

[23:09](#msg57ad059ff7f11a7936b73a8d)@greggirwin hey gregg, how do you make an object that contains another object without the inner objects being linked?

PeterWAWood

[23:53](#msg57ad1004bc688a133910e84c)@JacobGood1 Like this:

```
red>> o: make object! [a: 1]
== make object! [
    a: 1
]
red>> oo: make object! [ooo: copy o]
== make object! [
    ooo: make object! [
        a: 1
    ]
]
red>> o/a
== 1
red>> oo/ooo/a
== 1
red>> o/a: 2
== 2
red>> oo/ooo/a
== 1
```

[23:55](#msg57ad1057f7f11a7936b74eae)You will need to use

```
copy/deep
```

if the included object binds to nested values.

## Friday 12nd August, 2016

JacobGood1

[00:08](#msg57ad1368ff82b9fc7e76e4aa)

```
red>> a: object [a: object [x: 1]]
== make object! [
    a: make object! [
        x: 1
    ]
]
red>> a/a/x
== 1
red>> b: make a []
== make object! [
    a: make object! [
        x: 1
    ]
]
red>> b/a/x: 100
== 100
red>> b
== make object! [
    a: make object! [
        x: 100
    ]
]
red>> a
== make object! [
    a: make object! [
        x: 100
    ]
]
```

[00:09](#msg57ad13b4ae838f6f5698e4ec)

[00:09](#msg57ad13b9d7087a017fadc2d1)

PeterWAWood

[00:09](#msg57ad13d0f7f11a7936b754f4)You need the quotes to be on a separate line

JacobGood1

[00:11](#msg57ad141816b0696856ae62a0)ty

PeterWAWood

[00:14](#msg57ad14f7ae838f6f5698e778)

```
make
```

does not perform a copy so

```
a/a
```

and

```
b/a
```

are bound to the same value.

[00:19](#msg57ad15f4f7f11a7936b75933)This is one way of creating a new object for b/a to be bound to:

```
red>> a: object [a: object [x: 1]]
== make object! [
    a: make object! [
        x: 1
    ]
]
red>> b: do mold/all a
== make object! [
    a: make object! [
        x: 1
    ]
]
red>> b/a/x: 100
== 100
red>> a/a/x
== 1
```

JacobGood1

[00:27](#msg57ad17dcf7f11a7936b75da9)thanks, is there any plan to add a make/deep that would ensure all inner objects are copied?

greggirwin

[01:08](#msg57ad219a16b0696856ae7ac8)It's possible, but since that is object specific, it would kind of pollute `make` I think. It's not a big problem since we can easily write a `clone` function at the mezz level.

JacobGood1

[03:21](#msg57ad40cabc688a1339113e99)clone would be nice =)

SteeveGit

[09:09](#msg57ad9262db39cbe0712d6689) Moreover, It would be good to have a typeset! as argument for the \*\*clone\** function to have fine control on wich data types are deep copied.

[09:12](#msg57ad930107d5cea43a271078)First we should work on a prototype with Red and then rewrite it with red/system for max speed. Gregg, do you have something in your bag as a starter?

greggirwin

[16:25](#msg57adf873625cb3d845418f5e)It wasn't in my bag, but here's something we can use for discussion.

```
clone: function [
	"Deep make an object"
	object [object!]
	/with
		spec [block!] "Extra spec to apply"
][
	cloners!: union series! make typeset! [object! map! bitset!]
	new: make object any [spec clear []]
	foreach word words-of new [
		val: get in new word
		if find cloners! type? :val [
			new/:word: either object? val [ clone val ][ copy/deep val ]
		]
	]
	new
]

o1: object [n: 1 a: "A" b: #() sub-o: object [aa: "AA" bb: #()] fn: func [x][x]]
o2: clone o1
append o2/a "a"
append o2/sub-o/aa "aa"
o2/b/c: #c
o2/sub-o/bb/c: #cc
append body-of get in o2 'fn [ensure x]
?? o1
?? o2
```

I'm all for profiling an R/S version, but this could be very nice to keep as a mezz, to show people how it's done.

[16:29](#msg57adf950a00c6adb45e14ba1)I worked that up before seeing your typeset idea Steeve. A refinement for that would be to \*exclude* certain types, as you see it? That is, by default it would deep clone everything.

[16:39](#msg57adfbbbae0554d04c93332e)We could almost do it just with `copy/deep`, but that won't catch maps in sub-objects. We couldn't do `/with` either, but that may not be important since you could still `make` the cloned object with your spec. Just a little less efficient, but not much different for the user.

[16:41](#msg57adfc57ae0554d04c9334e7)Ah, just looked at WiseGenius's `copy/deep` analysis. Nice.

[16:46](#msg57adfd69a00c6adb45e15754)And +1 on Pekr's amazing memory. :^)

[17:16](#msg57ae045346a301fa5a49e1d1)Carl's blog entry raises a lot of questions. Nenad will have to weigh in on the big stuff there (e.g. object specs). I imagine this will lead to ideas on Red meta-object protocols as well.

SteeveGit

[20:57](#msg57ae38484073ee634d25b40e)@greggirwin I'changed few things.  
\- I use \*\*copy\** instead of make because I don't want the series copied by default. Most of the time, we want to deep copy objects but not series.  
\- The copied types are always required. If you don't need it, just use copy instead.  
\- I optimized the loop a little.

```
clone: function [
    "Deep copy an object based on types"
    obj [object!]
    types [typeset!] "types copied"
][
    foreach word words-of obj: copy obj [
        if find types type? val: get/any :word [
            set word either object? :val [clone :val types][copy :val]
        ]
    ]
    obj
]
```

greggirwin

[20:59](#msg57ae38b4aee33d7241e8fb21)Nice Steeve.

SteeveGit

[21:05](#msg57ae3a146cd7d05c37c25804)We should switch to red/mezz if this discussion continues.

greggirwin

[21:05](#msg57ae3a23364ad7fc5acec912)Agreed.

## Sunday 21st August, 2016

Senenmut

[19:13](#msg57b9fd72187885ef4f668e89)Menno

[19:18](#msg57b9fea0cd00bdff6e69df5c)I am learning Rebol and can't find good instructions how to make a windows executable from rebol script. There are two tools : Xpacker and NSIS. I missed some working scripts for that programs XML or videos on youtube etc. normally it is no problem to make a .exe file. There must be some real working examples anywhere because thesse tools are in work for many years. Does anyone have an idea for a link to that stuff ? Menno , i can't find it.

[19:28](#msg57ba00ed187885ef4f669968)Menno

[19:49](#msg57ba05cbbb6fad403cf30bf8)ok. No idea yet. Nevertheless thanks for attention. Stay dry. ECHELON over and out.

## Monday 22nd August, 2016

geekyi

[04:46](#msg57ba838bed79c5ee4f267713)@Mennohexo Making Red .exe files are really easy. Rebol on the other hand.. from what I've read, you need the rebol/sdk to make .exes

greggirwin

[04:46](#msg57ba83b1ed79c5ee4f26775e)Someone just answered on the mailing list about this. The Rebol SDK was the official way to make exes, but I don't know the status of buying a license now.

maximvl

[11:12](#msg57bade286981f5f26909f248)@gour the thing with red/rebol syntax is there is no expression separator and line end is not special in any way

[11:12](#msg57bade36ed79c5ee4f278e6d)practically this means you can write any program in Red/Rebol in one line

Senenmut

[19:48](#msg57bb57296981f5f2690c145a)Hello Red Planet , i got it. I make a post with the whole script incl. Version Ressources on Rebol Forum Page. It is running. 1. Make the script 2. Make the compiling script. Rock'n Roll !!!

## Tuesday 23th August, 2016

DideC

[08:03](#msg57bc035ccd00bdff6e70b357)@Mennohexo A link maybe ?

Senenmut

[09:40](#msg57bc19fcb64a3a016f5c1fcf)Just right online. I load it up today here german time at rebol google forum. https://groups.google.com/forum/#!forum/rebol Thank you for your attention. Over and out.

[21:25](#msg57bcbf5bbb6fad403cfd13de)NSIS 3.0 REBOL script is online at Rebol Google Group

Trance Techno

WBR Hans

greggirwin

[21:32](#msg57bcc0e2ed79c5ee4f2ef26d)Thanks for updating us Hans.

Senenmut

[21:39](#msg57bcc28ced79c5ee4f2ef910)Thank you for your help is the coding for the script The win .exe is running fantastic here. Full success on the line.

## Saturday 27th August, 2016

Senenmut

[23:13](#msg57c21e8e2a7bd0e920575c37)http://www.rj-texted.se/index.html

This Editor is interesting.  
Tool link to Rebol works. Many hightning options too.

WBR  
Hans

[23:13](#msg57c21eab5b11de77215956ad)Found it today. See you.

[23:18](#msg57c21face353af447b3653b9)Give a try for RED coding .

geekyi

[23:21](#msg57c220958877dae620a0a183)@Mennohexo pretty big size for a redboler tho :tongue: is it a node webkit app?

[23:34](#msg57c223903cdeb6467b779735)@Mennohexo what are you currently using as editor? I'm using sublime3. It has support for Red and Rebol syntax highlighting

Senenmut

[23:35](#msg57c223ab2a7bd0e92057673e)I don't know. Have unpacked it with 7zip. Definetly one of my Editor with the most functions and options. Currently i use SYNWRITE.

[23:43](#msg57c225bae353af447b365f28)taste the following options in the rj editor 1. Environment-Themes-Charcoal Dark Slate 2. open a red script from menue 3. open it then in a new folder and maximize to full screen. Very pretty. Dark Black and full screen style. My style. Black Universe - RED code. ha

geekyi

[23:55](#msg57c2287c2a7bd0e920577051)@Mennohexo I just tried it out, it needed 211 MB space! :worried: After installing, first thing it prompted was that update was available. Ok...

[23:56](#msg57c228c78877dae620a0af60)So I updated to latest version, and now there is an error, "application is unable to start correctly" :worried:

[23:58](#msg57c229125b11de77215969df)Install Version is 32-bit 11.10, updated to 11.12

[23:59](#msg57c2297bf6fe00361e069085)Reinstalled (overwrite) Initial version and working now

## Sunday 28th August, 2016

geekyi

[00:02](#msg57c22a195b11de7721596c21)But no highlighter for Red?

[00:05](#msg57c22aaf5b11de7721596d22)@Mennohexo you should also try sublime text 3, pretty good editor, relatively fast with large community and lots of addons

[00:07](#msg57c22b24e353af447b36683a)Also, if you like lot of features and are not afraid to try a new editor with mostly keyboard commands, emacs / spacemacs might be interesting.. can't beat it for features haha. It also should have highlighting for Red I think

Senenmut

[13:25](#msg57c2e6533cdeb6467b78fabe)hello geekyl , yesterday it was late and i break the line. I use only the portable version of the rj Editor. It's another option for a progamming editor. I will sublime text 3 give a try. Thanks.

[15:13](#msg57c2ff99d872312a1e84e567)Hi geekyl , i have checked out that editor. It's ok. For me personal i prefer rj-Editor. Why ? Alien Style.

## Saturday 3th September, 2016

oystedal

[15:36](#msg57caeded928ae0e73473ecfc)Hi, just stumbled over red lang by accident

[15:40](#msg57caeef7861faa7f07b3979f)I've never seen the concept of reactive programming before, but it looks really interesting

greggirwin

[15:46](#msg57caf041958e6f4729e5ce92)Welcome to Red!

Systems use the term to mean different things. e.g. the ReactiveX movement has a very specific API, while "event driven", "dataflow", and "Flow-based" programming are more general terms that are in line with Red's model.

geekyi

[15:47](#msg57caf08e928ae0e73473f53c)@oystedal it's also in principle, the same concept as React from facebook I think, but using a simpler, object-oriented implementation

oystedal

[15:50](#msg57caf13a958e6f4729e5d0dd)I've only heard of React, never used it

[15:52](#msg57caf1d0d52261ec344e5265)the only thing I'm missing at this point is a concise introduction. I've read http://doc.red-lang.org/reactivity.html and I'm currently reading http://re-bol.com/rebol\_quick\_start.html

[15:54](#msg57caf23cff95228007aa33e0)it's just a bit of a paper-cut to find that things in the rebol intro doesn't appear to work in red

greggirwin

[15:55](#msg57caf275861faa7f07b3a187)Yes, we're lacking that right now. In the meantime, we refer people to Rebol docs, which provide design thoughts and language fundamentals. @Arie-vw and Mike Parr are working on Red reference docs as well.

oystedal

[15:56](#msg57caf2a4ff95228007aa3530)is there an equivalent of request-text in red?

greggirwin

[15:57](#msg57caf2ccd52261ec344e555f)http://www.rebol.com/docs.html  
http://www.rebol.com/docs/core23/rebolcore.html

[15:57](#msg57caf2e76bf4c26505ca2e87)Not yet...

oystedal

[15:58](#msg57caf3256bf4c26505ca2f63)I just found "? function!"

greggirwin

[15:58](#msg57caf33e861faa7f07b3a3ce)Yeah! Help to find all available types is great.

oystedal

[15:59](#msg57caf34529ee4a67058b7217)10/10 on that one

geekyi

[16:01](#msg57caf3d0958e6f4729e5d7bb)@oystedal see also just `?` it shows a lot of useful things there, like `source`

oystedal

[16:01](#msg57caf3ec6efec7117ca45e1b)yeah, that's how I found ? function!

[16:02](#msg57caf4276bf4c26505ca31ae)why on earth does not other scripting languages do this

geekyi

[16:03](#msg57caf459958e6f4729e5d902)between `?` and `source` I hardly need to look at the docs.. I think `source` can be made more useful too

greggirwin

[16:04](#msg57caf4756efec7117ca45f5e)

```
request-text: function [][
    view/options [
        across
        text "Enter text:" f-fld: field return
        button "OK" [res: 'ok  unview]
        button "Cancel" [res: none  unview]
    ] ['modal]
	all [res f-fld/text]
]
```

oystedal

[16:05](#msg57caf4b1928ae0e73474034c)but view is windows-specific atm, afaict?

geekyi

[16:05](#msg57caf4bd6efec7117ca46014)@oystedal yes

greggirwin

[16:05](#msg57caf4bfff95228007aa3a29)Correct.

geekyi

[16:05](#msg57caf4cb6bf4c26505ca333d)note that red is still aplha, rebol2 works where it doesn't right now, but red is definitely the future!

oystedal

[16:05](#msg57caf4da861faa7f07b3a876)yes, I got that

greggirwin

[16:05](#msg57caf4e4958e6f4729e5da55)You can use `ask` in the console, for non GUI work.

oystedal

[16:07](#msg57caf52c6efec7117ca46105)ah, ask does what I wanted

[16:07](#msg57caf55e958e6f4729e5db89)great to see yet another language doing unicode the right way

## Sunday 4th September, 2016

randrew

[08:03](#msg57cbd546861faa7f07b5841f)this might be a silly question, but i looked around on the Red site and didn't any mention of it: red doesn't have a working GC? all of the demos i tried grow in memory usage over time

geekyi

[08:12](#msg57cbd750928ae0e73475fe76)yes, it's to be implemeted I think, check the roadmap

randrew

[08:13](#msg57cbd7a1861faa7f07b588a2)yeah i'm looking at it now. but since it's a list of upcoming stuff, i'm having a hard time telling what is actually in Red right now

geekyi

[08:15](#msg57cbd838958e6f4729e7b5bf)still alpha, that's why, but things are improving rapidly; when I started `read` wasn't working

[08:15](#msg57cbd83f29ee4a67058d780a)what are you looking for?

randrew

[08:16](#msg57cbd853958e6f4729e7b5d8)ah, nothing in particular. i was just playing around with it for fun and noticed that memory was never being reclaimed

[08:18](#msg57cbd8b96efec7117ca662ad)is there supposed to be some other way to deal with memory right now or is everyone just terminating their processes and restarting them after a while?

geekyi

[08:18](#msg57cbd8bb29ee4a67058d78ac)well, there is this on \[trello](https://trello.com/c/jcA3eEcs/52-memory-management)

[08:19](#msg57cbd8fd29ee4a67058d7906)don't know about others, but I'm not using red for any long running programs, using rebol for that

randrew

[08:19](#msg57cbd911d52261ec345027d0)ah ok

geekyi

[08:19](#msg57cbd911d52261ec345027d2)using red for gui programs and experimentation mostly

randrew

[09:41](#msg57cbec51928ae0e73476254d)ah i see. so i guess i should use rebol2 for anything long-running?

geekyi

[10:37](#msg57cbf97dd52261ec34506437)I suppose so, @dockimbel can probably tell you more; for anything in production I'm using rebol2 until red is ready

randrew

[10:47](#msg57cbfbaf6bf4c26505cc5694)i didn't realize they were so compatible, i guess that makes sense though

[10:47](#msg57cbfbc329ee4a67058dbe64)apparently it's not possible to make standalone rebol2 programs without a commercial sdk that's now discontinued

[10:48](#msg57cbfbfbd52261ec3450695f)ah, and you can't dynamically link external shared libraries either

[10:49](#msg57cbfc22958e6f4729e7fced)still worth playing around with for fun i guess

[12:56](#msg57cc19e3928ae0e7347680cb)ah, can't build a red binary without a license, that's really too bad :/

geekyi

[13:04](#msg57cc1bd3ff95228007aca86e)@randrew what do you mean? You can

[13:05](#msg57cc1c31958e6f4729e845d2)are you trying to build the red tool chain itself, or your own code? Red is really permissively licensed, and your own code is copyright yourself

randrew

[13:06](#msg57cc1c636bf4c26505cc9d52)i mean if you want to build your own red.exe, and not run it via rebol2.exe + script sources

[13:06](#msg57cc1c6b6bf4c26505cc9d5e)unless i'm misreading the github docs

[13:07](#msg57cc1c86d52261ec3450b514)i guess that's not such a big deal since effectively it's evaluating the same way

geekyi

[13:15](#msg57cc1e8d928ae0e734768bc1)@randrew  
&gt;Both Red and Red/System are published under BSD license, runtime is under BSL license. BSL is a bit more permissive license than BSD, more suitable for the runtime parts.

That? Pretty permissive I think?

[13:16](#msg57cc1ea7d52261ec3450b962)Also, I don't think you can build red.exe without rebol2 currently

randrew

[13:16](#msg57cc1ebad52261ec3450b990)right, that's what i saying. sorry if i communicated it wrong

[13:17](#msg57cc1eccd52261ec3450b9ae)it's not possible to make your own red.exe because it requires a license for a product that's no longer sold

geekyi

[13:17](#msg57cc1ee76efec7117ca6f15a)Oh, you are talking about rebol? @randrew

randrew

[13:18](#msg57cc1f0b958e6f4729e84daf)yes, since building red requires rebol2

geekyi

[13:19](#msg57cc1f46928ae0e734768d55)the owner of red has obtained the appropriate licenses.. ah yes I think you mean using the rebol sdk right?

[13:19](#msg57cc1f5d29ee4a67058e0c83)I see.. it's not really a problem in practice because red daily(?) builds are available

randrew

[13:20](#msg57cc1fb6928ae0e734768e61)yeah, i was going to look into seeing how hard it would be to finish a simple mark &amp; sweep GC

geekyi

[13:22](#msg57cc1ffaff95228007acb25b)@randrew should talk on red/red channel about things related to the language itself

[13:32](#msg57cc227fd52261ec3450c1f8)@randrew about building red, I think that's a too pedantic view for various reasons;  
\* rebol3 is open source  
\* doc and carl (the owners of red and rebol) are on good terms, carl doesn't mind  
\* and red can almost compile itself now

randrew

[13:38](#msg57cc23d1958e6f4729e85975)pedantic about what?

JacobGood1

[14:10](#msg57cc2b3e29ee4a67058e285c)red will be bootstrapped and independent of rebol in the future, for now, it is attached to rebol

randrew

[14:11](#msg57cc2b98861faa7f07b63aab)it looks like it's pretty far along already

[14:12](#msg57cc2bb2861faa7f07b63aca)from what i've seen playing around. it does a ton of stuff

JacobGood1

[14:12](#msg57cc2bd4928ae0e73476a9ec)Yea, it is a full featured alpha =)

randrew

[14:15](#msg57cc2c89861faa7f07b63c0a)it's really fun to play with, i wish i could keep a process running for longer. should i ask in red/red about how hard it is to finish getting a basic mark &amp; sweep gc working? i've implemented gc in the past and simple ones like that are usually not too hard, but i've really only played around with red today with no prior experience

JacobGood1

[14:43](#msg57cc332ed52261ec3450e780)Have you implemented such a gc in c before? Red/System is similar to c imo

[14:45](#msg57cc3388928ae0e73476bd7b)&gt; should i ask in red/red about how hard it is to finish getting a basic mark &amp; sweep gc working?

I think that is a great idea =)

randrew

[14:47](#msg57cc341a861faa7f07b64e40)yeah, in c.

geekyi

[14:56](#msg57cc36176bf4c26505ccdec2)@randrew I mean, nothing should stop you from building red for development purposes :smile: all you need is there in the Red README

[14:58](#msg57cc367a29ee4a67058e45ad)you should definitely see the \[Red/System docs](http://static.red-lang.org/red-system-specs.html) any version of rebol2 should work(it's a bug otherwise); I'm using "REBOL/View 2.7.8.3.1 1-Jan-2011"

randrew

[15:01](#msg57cc37516bf4c26505cce0f8)Prerequisite

You need a Rebol SDK copy with a valid license file in order to rebuild the Red binary, this is a constraint from using Rebol2 for the bootstrapping. Once selfhosted, Red will not have such constraint.

geekyi

[15:02](#msg57cc37686efec7117ca72f6a)Rebol/view is free

[15:02](#msg57cc379f958e6f4729e88859)See \[this](https://github.com/red/red#running-red-from-the-sources) 2nd step

[15:03](#msg57cc37c26efec7117ca72ff1)@randrew  
&gt; Download a Rebol interpreter suitable for your OS:

randrew

[15:03](#msg57cc37dfd52261ec3450f324)i think you keep misunderstanding

geekyi

[15:04](#msg57cc37fd29ee4a67058e4846)@randrew maybe I am :smile: what are you trying to do?

randrew

[15:04](#msg57cc380829ee4a67058e4853)i'm not trying to do anything right now

geekyi

[15:04](#msg57cc380d958e6f4729e88914)those are the things needed to run red from sources

randrew

[15:04](#msg57cc3814ff95228007aceb2a)yeah, i know

geekyi

[15:05](#msg57cc3850928ae0e73476c817)what I'm trying to say is in practice, there isn't a problem with the license, I can build and run red

[15:06](#msg57cc385e958e6f4729e889b9)then use it to compile red programs

randrew

[15:07](#msg57cc38b9ff95228007aceccb)how do you end up with a red.exe if you don't have a rebol2 sdk license? i'm already aware you can run red in rebol2 via calling the interpreter on the red sources

geekyi

[15:10](#msg57cc3949958e6f4729e88cdc):point\_up: \[September 4, 2016 8:01 PM](https://gitter.im/red/red/welcome?at=57cc37516bf4c26505cce0f8) where is this from btw? I remember this, but can't find it now

randrew

[15:10](#msg57cc3972861faa7f07b65d27)https://github.com/red/red/tree/master/build

geekyi

[15:13](#msg57cc3a21958e6f4729e88ea4):point\_up: \[September 4, 2016 8:02 PM](https://gitter.im/red/red/welcome?at=57cc37686efec7117ca72f6a) I simply follow the instructions in the top readme, I'll check it again

JacobGood1

[15:14](#msg57cc3a6929ee4a67058e508b)I have not tried to build the(not a) red binary myself but unless something changed, one needed a rebol license to create the red binary.

randrew

[15:15](#msg57cc3a77958e6f4729e8946b)yeah, i think geekyl is misunderstanding

geekyi

[15:21](#msg57cc3bdf928ae0e73476d11b)@JacobGood1 @randrew ok, so it doesn't directly build a red binary, but uses rebol as an interpreter to run.. `red.r` compiler to compile red code

randrew

[15:22](#msg57cc3c1b928ae0e73476d215)yes

geekyi

[15:22](#msg57cc3c42d52261ec345109f4)I'm not sure you'd call that already bootstrapped.. but I've used it to compile the red console which can compile red executable files

[15:31](#msg57cc3e456bf4c26505ccf890)@JacobGood1 So the integration tests are interpreted? I'm all confused :satisfied:

[15:31](#msg57cc3e52ff95228007acfdde)what does encap do anyway?

randrew

[15:31](#msg57cc3e66958e6f4729e8a1a5)technically all rebol2 scripts are interpreted. it doesn't have a static compilation phase

[15:32](#msg57cc3e7dff95228007acfe3e)encap takes all of the resources and scripts that a rebol2 program requires and packages it into a single self-contained executable

geekyi

[15:34](#msg57cc3f22958e6f4729e8a380)@randrew thanks. What's your background? Have you programmed in rebol before?

randrew

[15:35](#msg57cc3f3b6bf4c26505ccfb4c)no, but i've used various lisp and lisp derivatives in the past

[15:35](#msg57cc3f5e6efec7117ca74337)i used to do high-frequency trading in haskell but these days i work on game engines

JacobGood1

[15:37](#msg57cc3fa829ee4a67058e5c3e)@geekyI I do not know much about anything pertaining to Red's tool chain as that has not been a concern for me. @randrew already sounds like he is digging a lot more into it than I ever did. I don't really program too much in Red anyway, I just know that until Red is bootstrapped one cannot build the red.exe themselves.

Think of encap as encapsulation, all requirements/ dependencies are wrapped together

geekyi

[15:37](#msg57cc3fd7958e6f4729e8a509)@JacobGood1 yeah, it seems like a bundler

JacobGood1

[15:39](#msg57cc40146efec7117ca7459c)@randrew the only difference that I have noticed between rebol and lisp is the contextual data semantics... also known as definitional scoping.

geekyi

[15:39](#msg57cc4037d52261ec345117d9)@randrew I've only started with rebol at the beginning of this year, and red pretty recently, you are more qualified to work on the internals than me :tongue:

JacobGood1

[15:41](#msg57cc408e861faa7f07b67c2c)@randrew also, from Haskell to Red, that is a large difference lol. I programmed for a while in Haskell as well, I do not like it.

randrew

[15:41](#msg57cc4099d52261ec345118bf)haha

JacobGood1

[15:42](#msg57cc40f96bf4c26505ccff12)@randrew sorry for all the jargon btw, here is an actual explanation of those random words I was spewing earlier: http://stackoverflow.com/questions/21964110/is-there-a-overall-explanation-about-definitional-scoping-in-rebol-and-red

randrew

[15:44](#msg57cc417229ee4a67058e6188)mathematica works in a similar way

[15:44](#msg57cc417bff95228007ad071f)for some its scoping modes/rules

JacobGood1

[15:49](#msg57cc426d6bf4c26505cd0323)@randrew so what brings you to Red, over a lisp or Haskell?

randrew

[15:49](#msg57cc4286928ae0e73476e7e0)oh, i was just killing time today and looking at trending repositories on github

[15:50](#msg57cc42ba928ae0e73476e8c4)some of the short demos looked interesting

JacobGood1

[15:50](#msg57cc42bb928ae0e73476e8c7)Hehe, I was hoping for a more objective/technical reason... I do like the honesty though =)

geekyi

[15:50](#msg57cc42bdd52261ec34511e61)@randrew oh, it was trending? I wonder what happened?

randrew

[15:51](#msg57cc42e7928ae0e73476e94f)it's actually easy to get on the trending list, you only need to get like 10 stars in a day unless it's one of the overcrowded languages like javascript

JacobGood1

[15:53](#msg57cc43766efec7117ca7510a)@randrew you said you develop games, what language do you use for that?

randrew

[15:54](#msg57cc43a3ff95228007ad0c33)mostly c and c++

geekyi

[15:54](#msg57cc43c7ff95228007ad0c73)I was going to say "lua with love".. pun wasted..

JacobGood1

[15:54](#msg57cc43d3958e6f4729e8b0c6)that is surprising...

[15:56](#msg57cc4438ff95228007ad0d28)I was being sarcastic of course(well not of course it is hard to tell with text)

randrew

[15:56](#msg57cc444229ee4a67058e6bd1)haha

geekyi

[16:07](#msg57cc46ddd52261ec34512d20)From casually reading things, it looks like encap does little more than bundling everything together? (and maybe encrypting)

randrew

[16:09](#msg57cc4734d52261ec34512e0b)that's what it does, yeah

geekyi

[16:09](#msg57cc474e928ae0e73476f4b8)This clears it up.. I'd thought something was wrong with the red binary before, I can't open it up as a normal PE executable using any of my programs..

randrew

[16:09](#msg57cc474fff95228007ad1594)i don't really care about the encryption part

geekyi

[16:10](#msg57cc4790958e6f4729e8bca0)@randrew what do you care abbout then? bundling of all the files :tongue:

[16:13](#msg57cc483a928ae0e73476f699)packaging could be done by other means, there was another guy who was able to do it successfully before

randrew

[16:14](#msg57cc485dff95228007ad1797)being able to run your compiler without having to use a wrapper script or multiple path-sensitive commandline arguments is kinda important

geekyi

[16:15](#msg57cc48b029ee4a67058e7bdb)@randrew I see, red isn't just there yet, not yet completely bootstrapped, but almost all of it works even now

[16:17](#msg57cc490c29ee4a67058e7ca8)a stable toolchain is more important at the moment

[16:21](#msg57cc4a1929ee4a67058e7ee7)@randrew for the \*vast majority* of cases, you don't need to compile from source

[16:22](#msg57cc4a32d52261ec345134bb)remember that red is like a lisp, you can easily modify the code

randrew

[16:23](#msg57cc4a65928ae0e73476febb)ok?

geekyi

[16:25](#msg57cc4b0029ee4a67058e811b)I was thinking of the reasons people haven't complained about this before now, and why I hadn't needed to compile it :smile:

randrew

[16:27](#msg57cc4b616bf4c26505cd1b08)oh

[16:27](#msg57cc4b8a29ee4a67058e829e)i'm assuming it's because anyone who has done serious work on red already has a rebol2 license key or had someone give one to them

greggirwin

[17:12](#msg57cc56086efec7117ca78301)I think you're all caught up here with correct info. Red still relies on Rebol, and that does still need a license to encap and build Red.exe. @randrew, you're correct on most of us having keys already, and that it looks like there's no way to get one from Rebol Technologies currently.

[17:14](#msg57cc56846efec7117ca784c2)Also correct that there is no GC in place yet. Coming soon we hope. In the meantime, you can control memory use somewhat with careful use of block allocations. Of course, that defeats how easy Red makes some things. Since you know C, you could also use Red/System, depending on your needs. Then you're back in charge of memory, basically working at a C level.

## Monday 5th September, 2016

randrew

[02:10](#msg57ccd42d958e6f4729ea193b)ah ok, thanks

[02:11](#msg57ccd45c6bf4c26505ce7b0a)i was looking at doing GUI things in Red, and that's an area where manual memory management vs. GC is not a winning fight most of the time

greggirwin

[02:43](#msg57ccdbd36efec7117ca8c63b)Agreed.

## Wednesday 7th September, 2016

lpvm

[14:21](#msg57d0227d1baa312a6bdf3e77)Hi, for syntax highlighting in vim, I have a rebol.vim file. Is there a red.vim file already or should I stick to the rebol syntax highlighting?

greggirwin

[14:57](#msg57d02aed68f483b41cac6c84)I don't know of one for Red yet.

## Thursday 8th September, 2016

Senenmut

[13:15](#msg57d16454f33967fc643bae40)Hello Ipvm , may i give you a tip ? There are many editors out with individual and personal syntax highlightning feature. ok , it sometimes cumbersome to insert all the keywords etc.. Thus if you have done it the programmer still use this tool for a longer time.

[13:22](#msg57d1660a68f483b41cafefe0)I am just a little lazy too. Here i have 10 different editors with that option and not done that adjustments ? hooooo

TomConlin

[22:04](#msg57d1e064cdbf820f7faa5963)Hi All, been away from the R word the last several years, see it is now mostly a quiscent forest of forks , is this R indeed the last best hope these days?

greggirwin

[22:08](#msg57d1e15577c1b70d7ff75ccf)Hi Tom! Nice to see you again. You must be well rested. I don't know the status of other projects, so can't comment there. Red is alive, well, and churning forward. The basic Windows GUI is in place, OSX GUI underway, lots of datatypes implemented, with Date coming soon we hope, as well as GC. Trello has the status of various sub elements and a roadmap.

[22:09](#msg57d1e1b5fe284f6c3035e730)If you haven't seen the reactive system in Red, check it out. Fun stuff.

[22:11](#msg57d1e22598f8df994d499e98)The community here is growing, and a number of people seem to arrive with deep skills, which is nice. Certainly a lot of folks waiting for Red to be usable in production, but there's a lot to play with today, while we work to get it there.

TomConlin

[22:24](#msg57d1e514cdbf820f7faa659a)we still linking to 32bit libs, is this just legacy bootstrapping or a limitation throughout?

PeterWAWood

[23:36](#msg57d1f5ec68f483b41cb1e293)The current version of the Red compiler is written in Rebol and only emits 32 bit code. It would be difficult to add a 64 bit emitter. It will be much easier to add 64 bit emitters to the self- hosted compiler.

## Friday 9th September, 2016

Yamiyamiyami

[02:30](#msg57d21eb098f8df994d4a36ff)I'm still new to progamming in red, can anyone tell me how i can get an integer input from user?

TomConlin

[02:48](#msg57d2230d68f483b41cb2545a)foo: ask "gimmi an int: "  
gimmi an int: 5  
\== "5"

&gt;&gt; foo  
\== "5"

[02:52](#msg57d223d889655972304fd8dd)I am new to Red too (a couple hours so far) but things I use to know from http://www.rebol.com/docs.html seem to still work .

qtxie

[02:52](#msg57d223eb4d72ea2864eeb13e)@TomConlin You can do it like this:

[02:52](#msg57d223f54d72ea2864eeb141)

```
foo: to integer! ask "gimmi an int: "
```

TomConlin

[02:57](#msg57d22537fe284f6c303691f2)or handle checking after ... when you can do something about it

```
>> foo: 'bar                                                     
== bar
>> either error? err: try [foo: to-integer foo] ['BOO]['YEA] 
== BOO
>> foo: 5                                                        
== 5
>> either error? err: try [foo: to-integer foo] ['BOO]['YEA] 
== YEA
```

[03:04](#msg57d226d477c1b70d7ff81b18)I am \_very_ rusty but our R is still the most fun language

Senenmut

[11:31](#msg57d29d9bc475164703c100a3)R

geekyi

[11:37](#msg57d29f141aacfaf84b03a861)@TomConlin by `R` you mean `Rebol`? Or the common subset of Red and Rebol so named Redbol (because there is already another unrelated language called `R` for stats)

Senenmut

[11:50](#msg57d2a1f2f4360c6818204306)Red + Rebol = Redbol = Red Bull Hooooooo

[11:58](#msg57d2a3f5c475164703c11736)Results oriented rapid programming RB

## Saturday 10th September, 2016

Dimonax

[20:58](#msg57d4740aef19fa3f4075861e)Been checking the Rebol website for the SDK so I can get the Encap lib; but apparently it isn't available anymore. How do I go about rebuilding Red without Encap?

geekyi

[21:40](#msg57d47dc3d274dbdf3507de13)@Dimonax you don't need it; any rebol 2 implementation would do. Check out the Red README for one

[21:43](#msg57d47e69b37816b14fa8cd02)and that is needed only if you are trying to build from source

Dimonax

[21:43](#msg57d47e94b8d4c1384082fb28)I'd like to port it to 64bit Linux. And make an OpenGL extension.

geekyi

[21:45](#msg57d47ee9b37816b14fa8ce11)as far as I know, all encap does is pack many binary blobs into one file, like a windows .cab, and then encrypt it

[21:45](#msg57d47efad274dbdf3507e142)Rebol 2 is interpreted, unlike Red which is compiled

[21:46](#msg57d47f3783c1556511b7f43a)From what I know of linux packaging, you don't need to pack files like a .cab (am I right?)

Dimonax

[21:47](#msg57d47f74a0e8dbb04f29b699)Depends on whether your making a static or dynamically linked executable.

geekyi

[21:49](#msg57d47fcca0e8dbb04f29b73b)I think rebol 3 doesn't use encap either, and it has 64bit on linux

Dimonax

[21:49](#msg57d47fd0ef19fa3f4075a84b)Actually there's a bunch of different ways to pack them. Depending on what you want to do with them.

geekyi

[21:49](#msg57d47fe9b8d4c1384083049a)I can confirm it works, I tried a static Rebol 3 on NIXOS

[21:49](#msg57d48001b37816b14fa8d5e9)Should check it out for inspiration :smile:

Dimonax

[21:49](#msg57d48007d274dbdf3507e3dd)I'd also like to try linking it against musl-libc

[21:50](#msg57d48033a0e8dbb04f29b881)We could probably get the whole thing down under a meg.

geekyi

[21:50](#msg57d4803aef19fa3f4075a9a6)There is a fundamental difference between Red and Rebol tho..

[21:51](#msg57d480557b9f8167113af081)@Dimonax It's already under a meg, what's the use? :smile:

Dimonax

[21:51](#msg57d4807fd274dbdf3507e4f9)Well, once the "view" extension is working.(on Linux) it wont be.

[21:52](#msg57d48096a0e8dbb04f29b96f)Could probably use it to write 64k demos.

geekyi

[21:52](#msg57d480a0a0e8dbb04f29b97d)Fundamental difference between Red and Rebol.. Red has a low-level \[Red/System](http://static.red-lang.org/red-system-specs.html) dialect, an alternative to c

[21:53](#msg57d480bed274dbdf3507e58b)I think there's nothing stopping us from borrowing ideas from musl and other tiny c libraries

Dimonax

[21:55](#msg57d4813583c1556511b7f9fd)Right, but if we want to do graphics programming for example, we will have to link against the native system C library.

geekyi

[21:55](#msg57d48167ef19fa3f4075acdb)@Dimonax and the problem we will have in that case is?

[21:56](#msg57d4817e83c1556511b7fb3c)Do you mean static linking?

[21:56](#msg57d4819ab37816b14fa8da70)Can write a Red/System binding right?

Dimonax

[21:56](#msg57d481aaa0e8dbb04f29bbf0)Well, I was wondering if the intent was write a complete replacement for the System C library.

geekyi

[21:58](#msg57d4821fb37816b14fa8dbc1)I \*think* the intent is to go as fat free as possible.. whichever works

[22:00](#msg57d4827eef19fa3f4075af16)Actually I shouldn't be the one to answer, best ask a lead dev

[22:05](#msg57d483a27b9f8167113afa56)@Dimonax some examples of current bindings are on the \[Red contributions page](http://www.red-lang.org/p/contributions.html)

greggirwin

[23:28](#msg57d49701b37816b14fa91377)I think you're on track. Not being self-hosted yet is a sticking point for OS ports right now. R3 encap is only in the Atronix build I think. The only R2 64-bit was post-SDK. Porting Red to R3 to use Atronix will likely be a large effort.

Nenad can give his thoughts, but those porting to other OSs may either need to wait for self-hosting or find someone with an SDK license to work with.

## Sunday 11st September, 2016

PeterWAWood

[01:01](#msg57d4acd4b8d4c1384083717d)@Dimonax "I'd like to port it to 64bit Linux" The current bootstrap compiler written in Rebol hasn't been designed with portability in mind. The self-hosted compiler will be designed to make porting easier. I suspect it will be quite a challenge to port the Rebol-based compiler to 64-bit for anyone who is not very familiar with it.

## Monday 12nd September, 2016

maximvl

[09:09](#msg57d670decba69fe73507248e)@Dimonax especially with things like rebmu demo writing should be fun ;)

Respectech

[14:31](#msg57d6bc5bb37816b14fae97fb)As I recall, Hostilefork got Red to build on R3. Does anyone else remember that?

rebolek

[14:33](#msg57d6bcb68efc3f2006960482)@Respectech IIRC he was porting Red to R3, but I’m not sure if he was successful. Weren’t there some R3 bugs that prevented it? But maybe I’m wrong.

pekr

[17:48](#msg57d6ea5b83c1556511be7330)He was porting a toolchain, which most probably is ongoing changing target, so he left the effort ...

## Tuesday 13th September, 2016

Senenmut

[17:19](#msg57d83516b37816b14fb3f2f4)I have a special question ?

[17:23](#msg57d8362ab8d4c138408dddd7)Hello again ,

if you want the user to make a input only in the custom  
range of 1 till 1000 and otherwise redirect to the input  
again ?

How to arrange that ?

code : value: ask "Give me a number"

[17:23](#msg57d8362d83c1556511c2c5df)only 1 till 1000 is allowed.  
nothing else. No strings or other keystrokes.  
In the case of other keystrokes or out of range 1-1000  
the user is promt to make the input again.

maximvl

[17:25](#msg57d836927b9f81671145f181)fyi: gitlab presentation about software development processes of past and future:  
https://youtu.be/KrF7jNfDSnI

Senenmut

[17:27](#msg57d83714a0e8dbb04f34b866)Hi Maxim , this seems to be a methotology.

[17:31](#msg57d837efd274dbdf3512d9e1)My question is about the keystroke error handling. The user can stroke the false key , or he can stroke out of the custom range. It seems simple. The solutions isn't.

greggirwin

[17:32](#msg57d8382eef19fa3f40808c0f)@Mennohexo, I don't think Maxim was answering you. But I am. :^)

```
in-range: func [val][all [val >= 1  val <= 1000]]
get-num: does [to integer! ask "Give me a number: "]
until [attempt [in-range n: get-num]]
```

Senenmut

[17:35](#msg57d838f283c1556511c2d481)Hi Gregg , superhacker personal answer again. I will try it. \\

[17:37](#msg57d83961a0e8dbb04f34c286)Its not easy to fix any number from 1 till 1000. Out of range yes , but not every digit in the range. plus every other keystroke. Thanks. I will think about that code.

[17:45](#msg57d83b26b37816b14fb40a3f)Yes it works.

[17:46](#msg57d83b7783c1556511c2de45)have a nice day gregg. over and out.

geekyi

[17:53](#msg57d83d15cba69fe7350d631f)@maximvl ah the world has gone live. Can you post the summary here? :tongue:

[17:55](#msg57d83d7aa0e8dbb04f34d1ee)On a more serious note, gitlab has a host of cool new features, like koding and a kanban issues board. Could be a good idea to have.. at least a mirror there in the future

JacobGood1

[18:42](#msg57d848a5a0e8dbb04f350587)I think gitlab is a lot better than github, been using it for a while now

geekyi

[18:54](#msg57d84b6483c1556511c32d10)@JacobGood1 I'd used it for a private project with a friend a couple of months ago. It had nice features, but was a bit slow at times

maximvl

[18:58](#msg57d84c4bcba69fe7350da92f)they received 20M in a second funding round, they are going to focus on everything from project management, tasks, milestones etc up to CI, QA, deployment, automate everything and get a lots of new features

[18:58](#msg57d84c64b37816b14fb46264)and still be open and collaborative with the community

## Monday 19th September, 2016

DavidMatuszek

[20:01](#msg57e0440dc8af41d45f2ba323)Hi! I became infatuated with REBOL/VIEW a few years back, and have taught it as part of my Programming Paradigms class. I will probably do so again this semester. I'd love to teach Red instead, but most of my students use Macs. Is there any likelihood of getting Red/Draw available soon?

maximvl

[20:02](#msg57e04451c3e7045a3061849d)he he

[20:02](#msg57e04459fa660dd95ff3806c)there is some :) https://twitter.com/red\_lang/status/771268451314696193

greggirwin

[20:03](#msg57e04476c3e7045a30618587)Welcome David. I recall seeing Rebol on your syllabus in the past. Can't remember who linked to it, but very cool.

To answer your question, Team Red is hard at work on the OS X GUI system as we speak.

maximvl

[20:04](#msg57e044c2c3e7045a30618647)what is this place where people learn Rebol?

greggirwin

[20:05](#msg57e044f618291e1048856b86)University of Pennsylvania: http://www.cis.upenn.edu/~matuszek/

maximvl

[20:06](#msg57e0456318291e1048856d1e)Clojure, Prolog, Haskell, Scala, Rebol

[20:07](#msg57e0456618291e1048856d29)wow

[20:08](#msg57e045bc27a8458f7f2ad5a9)I'm really envy I didn't have this when I was a student

greggirwin

[20:09](#msg57e04601fa660dd95ff38c9c)I remember thinking Redbol langs would be a great fit for that kind of class, because you can easily implement toy languages that use different paradigms.

iArnold

[20:18](#msg57e04806c8af41d45f2bb23a)(Sttt---Still not here--)(Perhaps @DavidMatuszek will be Just In Time to stop the Red team from finishing up the MacOS GUI branch, as it would make an excellent task for the students! ;-) )

## Tuesday 20th September, 2016

geekyi

[11:05](#msg57e1180f18291e10488827b3)@DavidMatuszek that is interesting. What are your opinions on teaching Rebol (or Red) as a full fledged introduction to programming course?

dockimbel

[11:08](#msg57e1189a33c63ba01a195e6a)@DavidMatuszek I'm also very curious about that. ;-)

maximvl

[11:12](#msg57e11991c3e7045a306440fa)@DavidMatuszek I can't find the course on your page, is there anything available for people outside the university?

geekyi

[11:13](#msg57e119eb18291e1048882d83)@maximvl it's there on http://www.cis.upenn.edu/~matuszek/cis554-2016/index.html (search for rebol) \[also web search](https://duckduckgo.com/?q=site%3Awww.cis.upenn.edu%2F~matuszek%2F+rebol&amp;t=ffab&amp;ia=web)

maximvl

[11:37](#msg57e11f77df21a75730111530)@geekyi thanks!

[11:37](#msg57e11f82c8af41d45f2e843b)such a nice guides you have there

geekyi

[11:57](#msg57e1242b33c63ba01a1985e1)I've taught programming before. The main advantage I see over something like `python` is faster time to results, i.e "hello world" to working prototype. The only other alternative I've found is `javascript` for fast iteration (reloading) and low setup overhead (web browser and text file). Javascript introduces other complexities tho (html, dom, weirdness in the language itself).  
Actually, I may have been searching for better alternatives when I found out about Rebol (Or was I looking for something to quickly deploy a web server on windows?)

maximvl

[11:58](#msg57e1247227a8458f7f2dc615)ye, this is something I've found in python vs java vs c++ many years ago

geekyi

[12:07](#msg57e1269327a8458f7f2dcd92)So what are the hurdles to teaching rebol2 for \*me* in particular? In order of priorites:  
\- Faculty is not at all happy with non-mainstream langs (mainstream is `java`, `python`, `c`)  
\- Vastly different concepts (sometimes it's very similar, but subtly different)  
\* This is a problem with familiarity  
\* Less of a problem for people who haven't programmed before (even in an introductory course)  
\- Dispersed documentation (altho, nick's tutorials and wikibooks are pretty good I later found)  
\- Not a large community (or a closed one)

[12:09](#msg57e126deaabc89857fb9621b)\*\*tl;dr\** Majority just don't like change and non-mainstream; also relevant: Innovator's Dilemma

maximvl

[12:13](#msg57e127f0fa660dd95ff6a240)@geekyi yep, thats right

[12:13](#msg57e12807df21a757301132f3)@geekyi about nick's tutorials, I tried to read them, but they are not like usual programming books

[12:14](#msg57e1282ffa660dd95ff6a334)which one should I read if I have programming background and just need to dive into language?

geekyi

[12:19](#msg57e12960df21a75730113793)Advanced stuff in rebol is harder; I wouldn't teach things like macros (for e.g.) in an introductory course (maube gloss over). Having an open mind and learning about other advanced concepts in other languages might help too, and actually using the language (this being how I learn it mostly, different people learn different ways)

maximvl

[12:21](#msg57e129bec3e7045a30647b42)but rebol doesn't have macros.. and anyway, I've learned macros from CL

geekyi

[12:22](#msg57e12a1127a8458f7f2dd99c)@maximvl for you then, I suppose you can continue experimenting on your own :wink:

maximvl

[12:24](#msg57e12a8833c63ba01a19a129)now I found Cheyenne as something working and moderately complex I can dig into

geekyi

[12:24](#msg57e12a9b18291e1048886a37)@maximvl Have you read \[wikibooks Advanced Rebol](https://en.wikibooks.org/wiki/Rebol\_programming/Advanced) (I've yet to read completely)

maximvl

[12:25](#msg57e12ab1c3e7045a30647e80)only the `parse` chapter

geekyi

[12:27](#msg57e12b1627a8458f7f2dde72)I've got to go, my system has some problems with it's display

maximvl

[12:29](#msg57e12ba227a8458f7f2de14c)sure, thank you for advice )

greggirwin

[15:57](#msg57e15c85aabc89857fba57db)Teaching with Rebol may be hard to put in one category. You could use it like schools that focused on Scheme (or Logo in the case of Brian Harvey at Berkeley), which teaches important concepts but doesn't get you a job. Now, a lot of curricula seem to focus on languages that will get you jobs, and teach the concepts those languages support in the process.

Redbol langs won't get you jobs today, but they can be used to teach \*so many* important concepts (simplicity not being the least of them), and to teach thinking, as is Logo's goal. Their practicality in the business world comes from using them as support tools. I believe we can change that, and make Red a first-class language in a big way.

endo64

[16:33](#msg57e164cdfa660dd95ff7c7bf)Hi @TimeSeriesLord I think Doc prefer to use `Red` instead of `RED`

DavidMatuszek

[16:47](#msg57e1681a27a8458f7f2efe06)@geekyi and @dockimbel asked my opinion about teaching REBOL or Red as an introductory course in programming. Whew!  
Let me first say that in my experience, students who already know Java really appreciate Scala. But in a course where I taught Scala first, then Java, both languages were new and difficult and equally liked/disliked.  
IMNSHO it would be a terrible idea to teach Red as a first language to programmers, because (1) they wouldn't be able to get internships or jobs with it, and (2) they would really hate Java when they got to it. (Maybe Python would be okay...)  
When I first encountered REBOL, it felt to me like a very \_personal_ language, one that could be my own "secret weapon." I'm hoping Red will fill that gap.  
In a way, I think Red would be a great only language for casual programmers. OTOH the syntax is (please forgive me!) somewhat unnatural, more akin to Lisp, so probably quite a stumbling block for novices.  
So basically, I don't really know where REBOL/Red would fit in the current programming ecosystem. I've taught REBOL as an object lesson in what languages \_ought_ to be like--small, simple syntax, and very, very expressive.

rebolek

[16:48](#msg57e16868a3c0cb1b6a21c0b2):+1:

[16:49](#msg57e1689e06bdca3327080a40)I just hope that "they wouldn't be able to get internships or jobs with it" will change soon enough :)

DavidMatuszek

[16:50](#msg57e168cc27a8458f7f2f0095)Global warming is faster. :(

rebolek

[16:51](#msg57e16902d66f1a7967e1e8b9)Come on, Red development is not that slow ;)

DavidMatuszek

[16:52](#msg57e16932aabc89857fba8f21)Good! But I was referring to the marketplace.

JacobGood1

[18:46](#msg57e1841faabc89857fbb00a6)Red will, hopefully, carve out it's own niche but the fact that is not hosted, like so many new languages today, creates a hurdle for it's uptake. Clojure, for example, would have probably been another lisp that was quickly forgotten, had it not been for the jvm.

maximvl

[18:49](#msg57e1849dc8af41d45f30570e)JVM gave it quick start, but what now? All progress Clojure can make is going up, it can't do anything with a platform, VM, etc

JacobGood1

[18:52](#msg57e1856fdf21a7573012d507)Yea, I am not advocating for Red to be hosted, just saying that Red will, and already does, have a harder path to take. I respect the Red team for their willingness to create a language without it being hosted, it is a very hard thing to do.

greggirwin

[22:23](#msg57e1b6cec8af41d45f312927)The benefits will be clear to a small number of people at first. I had an ex-silicon valley sales rep ask me why the world needs another programming language. He doesn't know programming \*at all\*; it's just a question he's familiar with.

JacobGood1

[22:28](#msg57e1b807fa660dd95ff93f35)There are a lot of programmers that ask that same question... I have no idea why programmers think we have arrived, it must be the case that they do not even try other languages than their own.

## Wednesday 21st September, 2016

randrew

[00:50](#msg57e1d96627a8458f7f30a4e5)rebol calls floating point numbers decimal numbers. is that due to its heritage as being marketed towards non-programmers originally?

greggirwin

[04:11](#msg57e20879df21a757301475b0)I believe so. Red will also have decimals which will have a different implementation than `float!`.

randrew

[04:26](#msg57e20c0caabc89857fbcc37b)ah, nice

[04:31](#msg57e20d3cfa660dd95ffa3602)i saw there's a github issue about this, but is there a plan (or a way) to treat math types like vector! always as values instead of mutable sequences when doing math?

[04:32](#msg57e20d5fdf21a75730148182)i think the argument for mutating in place is efficiency, but i think if you're adding single vectors together, you are really worried about efficiency and instead are going for convenience

[04:33](#msg57e20da1df21a757301481eb)when i have to optimize some numerics stuff i almost always flatten it out into buffers and then work over them linearly, one component at a time per SIMD register (e.g. AVX-512, with many x and y components at a time, then write to a third location)

[04:34](#msg57e20dc5c3e7045a3067c1fb)mutating in place definitely makes sense for lists and things you would treat as an actual sequence though

[04:35](#msg57e20e0718291e10488bd722)i guess it would not be too difficult to just write my own wrapper around the built-in vector!

greggirwin

[16:36](#msg57e2b728c3e7045a306a62d4)I'm sure Nenad is open to input from people who work in specific domains, but your last point is a key element in Red's design. If you can \*add* functionality/behavior you need, that's good. If you can't \*remove* it, that's sometimes a limitation. There are always tradeoffs of course, but the common idiom of series' being modified (`append, insert, change,remove`) and letting the user `copy` first if they don't want that behavior is an important example.

randrew

[16:52](#msg57e2bae6df21a75730173615)right

[16:53](#msg57e2baf9aabc89857fbf95ab)are the vector! types heap allocated?

greggirwin

[16:56](#msg57e2bba9c8af41d45f34eb52)Yes.

randrew

[16:57](#msg57e2bbe0df21a75730173a02)ah ok, that makes more sense

[17:01](#msg57e2bceac8af41d45f34f129)for scripting languages, if there's no built-in primitives for handling vectors/matrices as value or stack/register types, there's a trick that some game engines and physics simulations use

[17:02](#msg57e2bd1ac3e7045a306a7b79)where you allocate some large buffer (~ few mb depending on platform) in pages, sort of like an arena or rope, for holding vectors

[17:03](#msg57e2bd61fa660dd95ffd01ac)whenever the scripting runtime requests a new vector, you bump a pointer or index into the buffer and hand off that index/pointer to the scripting layer. math ops on the vector types just operate over the buffer. it typically has a lot better cache locality than handling the vectors directly as boxed types in the scripting layer

[17:04](#msg57e2bd9890ba43d217367d0c)you can also do some small optimizations for SIMD in some cases (though not as good as doing it by hand)

[17:04](#msg57e2bdaf27a8458f7f33e914)the major drawback is that the user in the scripting layer has to occasionally reset the buffer otherwise you'll run out of memory :P

[17:05](#msg57e2bdc818291e10488ea7ca)in game and physics engines this is usually pretty easy, you just reset it at the end of a video frame or simulation tick

[17:05](#msg57e2bdd218291e10488ea7f0)if you need to save vectors between frames you explicitly box them on the heap

[17:05](#msg57e2bdeb18291e10488ea844)i might try something like that for red if i get far enough along with playing with it

greggirwin

[17:05](#msg57e2bdf1c3e7045a306a8071)I imagine we'll see some creative solutions, pooling and others, and it sounds like you'll be one creating them. The nice thing with Red is that you can create those in Red/System, so you can get clean integration and consistent representation between layers.

randrew

[17:06](#msg57e2bdfe18291e10488ea884)yeah

greggirwin

[17:06](#msg57e2be27df21a75730174279)And then create a new, specialized datatype for your dialects. :^)

randrew

[17:07](#msg57e2be3ec3e7045a306a81a2)the first time i saw that trick i thought it was a stupid idea, but it was baffling how much faster it was in practice

[17:08](#msg57e2be7718291e10488eaab0)right now, red/system doesn't have anything like LLVM intrinsics, right?

[17:08](#msg57e2be95c8af41d45f34f907)e.g. ways to access semi-platform-specific instructions for things like SIMD

[17:08](#msg57e2bea9fa660dd95ffd07e5)it looks like you get a lot of control over alignment already, though

greggirwin

[17:09](#msg57e2beb4aabc89857fbfa47b)Correct, but it's still very early days. Nenad has a lot of very interesting ideas for the future.

randrew

[17:09](#msg57e2bec9df21a75730174753)yeah

[17:09](#msg57e2bed0c8af41d45f34fafd)i'm not in any rush

greggirwin

[17:11](#msg57e2bf24c8af41d45f34fd18)One of the best things, IMO, is that design is given deep thought, so what we learn now has long term leverage. Some things will change, especially when Red is self-hosted.

[17:13](#msg57e2bfc3aabc89857fbfa81e)I get really excited thinking about the line \*between* Red and Red/System. We tend to think in terms of high level dialects for people, but they are just as applicable when they are, themselves, layers and translation targets.

randrew

[17:15](#msg57e2c01f27a8458f7f33f27c)yeah

[17:15](#msg57e2c029fa660dd95ffd0d83)terra is similar, i don't know if you've seen it before

[17:15](#msg57e2c03727a8458f7f33f2c0)it uses lua as the high-level layer, though, which is considerably less suited for making compact DSLs

[17:15](#msg57e2c04390ba43d2173688d5)it's just fine for scripting, though

[17:16](#msg57e2c05d18291e10488eb441)there's also SymbolicC (i think that's the name?) as a part of mathematica. it's properietary, though, and also requires a full C compilation step (really slow)

greggirwin

[17:51](#msg57e2c8a927a8458f7f3414a9)I haven't seen terra, but I'll check it out.

[17:55](#msg57e2c9ae90ba43d21736af52)Very cool at a glance. There's probably a lot we can learn from that.

## Thursday 22nd September, 2016

TimeSeriesLord

[00:05](#msg57e32054fa660dd95ffe9990)@endo64  
&gt; Hi @TimeSeriesLord I think Doc prefer to use `Red` instead of `RED`

Thanks. Red is a horrible name. It's so commie sounding.

Blox would have been much better.

## Sunday 25th September, 2016

Dimonax

[19:00](#msg57e81ec24ae02c250fc5f01e)Alot of good ideas floating around here. Have you considered going halfway between a "malloc()" model and a full GC system? i.e. A Region Based memory allocation scheme? Been doing this for my own experiments with the other extreme end of the "full stack language" and "simplicity" spectrum.(www.projectoberon.com) Thinking Red should be a good compliment to the rest of the system I'm building on my Spartan 8 board.

[19:01](#msg57e81f15efb670246664ba2a)Could even design a Red chip in VHDL.

greggirwin

[19:15](#msg57e822377ee098d615f2632f)I've always thought Oberon was a cool system. Of course, it was one of the first "from the ground up" system designs I read a book on. I had a Windows install, years ago, but never quite got comfortable enough to use it daily. Toolboxes were a great idea, and I did write an experimental track layout system at one point. Even still have Wirth's Compiler Construction with a 3.5" floppy in the back. :^)

[19:15](#msg57e8224bcf47cb9071f87521)

[19:17](#msg57e822aef80c11f15caf7430)It is surely possible to implement things at different levels in Red, just has to be prioritized, or have someone champion it and do it on their own.

[19:17](#msg57e822b07ee098d615f263c7)Gitter having issues here.

[19:17](#msg57e822e73ce594735ca1b05b)Glad to see someone keeping the Oberon flame alive.

[19:18](#msg57e823126459dcbc731bda99)Shoot. Gitter seems to have lost my message entirely now, once I tried to delete what looked like a dupe post.

[19:19](#msg57e8235d7ee098d615f267c1)To recap my long post: Oberon, yes! Cool. ;^)

Dimonax

[19:22](#msg57e823ee0a0d295a2c491d70)Well, I was actually thinking about integrating Red into the Oberon system so thoroughly that we really dont have to think about where one ends and the other begins. They seem to be a perfect compliment for different programming tasks. Red excels at a lot of tasks that Oberon doesn't; and vice versa.

greggirwin

[19:23](#msg57e824403ce594735ca1b3d9)Very cool!

Dimonax

[19:28](#msg57e825423ce594735ca1b777)Right now I have somewhat functional version of ColorForth + Oberon v 7. Red might just be the tool that rounds out my triangle.

greggirwin

[19:29](#msg57e825a2f36c42d5182a8546):^)

Dimonax

[19:30](#msg57e825eedb049da32cc93f14)Really wont know until after the holidays though. Burning the candle at both ends right now.

greggirwin

[19:31](#msg57e826199df4ea9630e6b40c)Is there a quick and easy way to play with your Oberon on Windows?

Dimonax

[19:33](#msg57e826929df4ea9630e6b679)Not really. The boss says he's going to give me permission to post it up under the GPL. Gotta wait for it though. My "professional" job is doing in-house industrial machine controls.

greggirwin

[19:33](#msg57e826a4db049da32cc940cb)Or is the better way to set up a RasPi, et al?

[19:34](#msg57e826c89df4ea9630e6b836)Ah. Are you following Atronix's R3 version? That's what they do as well.

[19:34](#msg57e826d97ee098d615f27959)Keep us posted in any case.

Dimonax

[19:36](#msg57e8274210b1e2e3780f1d15)Yeah. But I wouldn't take Red quite as far as they do. The primary system is all written in Spark/VHDL. Everything needs to be proven.(Using Altelier B for that.)

[19:37](#msg57e827743ce594735ca1c127)I wont have one of my co-workers going home without a limb.

[19:40](#msg57e82815f254af9778666316)Now the boss want's to be able to control some of his machines through his smartphone. Grrrrr....Well those are the challenges we live for, right? ;-&gt;

greggirwin

[19:52](#msg57e82af810b1e2e3780f2864):^) I've always told my kids to respect power tools. Limbs don't grow back yet. Safety first. But maybe using DSLs for code generation could still be useful in places. Clearly not telling \*you* something you don't already know.

Dimonax

[19:56](#msg57e82bf8db049da32cc9520b)DSLs, when used in the correct places, actually contribute to safety and security. But too often people just use them to cut down on the workload without actually considering the consequences.

greggirwin

[19:59](#msg57e82c9e7ee098d615f291d7)It's a wide topic, and DSLs are far from clearly defined. The risks, then, are in the design and implementation of the DSL, to make things safer and more performant, as well as easier.

[20:00](#msg57e82cd7f36c42d5182aaef0)DSLs, in recent history, have been a lot like 3D in GUIs in the 90s IMO. ;^)

Dimonax

[20:03](#msg57e82dabf254af977866733a)Agreed. They certainly have a lot of potential. I think Red has a lot of potential in this regard. We could make Red subsettable. i.e. Let the developer optionally select certain features of the runtime/language to turn off so as to facilitate a more streamlined runtime and safer language subset.

greggirwin

[20:06](#msg57e82e44db049da32cc95c3a)Yup. And in your field, constraints and controls on values built in.

Dimonax

[20:08](#msg57e82ed47ee098d615f29bf6)Make certain things statically checkable at compile time, as an option. I think Red and Rebol are great as is, but adding these things would be a big boost in the new "security" conscious internet.

greggirwin

[20:09](#msg57e82ef9f36c42d5182ab43a)Agreed. Dialects can tightly constrain what you're allowed to say, for your own good.

Dimonax

[20:12](#msg57e82fa1f254af97786678da)Don't get me wrong. I don't think we should be re-inventing Spark in Red. But making a lot of common security flaws at least detectable would be a nice selling point.

greggirwin

[20:12](#msg57e82fb67ee098d615f29e75)Absolutely.

Dimonax

[20:15](#msg57e8304510b1e2e3780f3824)Hrrrmmm....since you obviously have more experience with Red, Rebol, and other DSLs than I do...what features from other tools/languages do you think would be a benefit to Red developers?

greggirwin

[20:44](#msg57e83738939bfe3342f91281)That's a tough one. Unfortunately, it's not as easy as importing ideas from other languages. You'll find that we argue, er, \*discuss* function naming and word choice very heavily, hoping to maintain something like conceptual integrity in the language. People can, and should, try all kinds of things, that they've used elsewhere. We learn from those. The biggest wins come from classic principles in how to create better software, but those have to be updated to match trends we know will come and go.

For example, a module system will come, but what's the best example for how to structure things? There is no one best way. Do we do it like Ada, or do we do it like Linda? Do we do it like Java, or like JS/NPM? The same is true for methodologies and bigger picture tools like orchestration and workflow. Can we push back, hard, to make simplicity a feature? Can we put YAGNI on steroids (which has to be some kind of inversion principle ;^)?

We can learn from modern efforts in functional languages, and how helpful it can be to be able to inspect systems. Live Coding is all the rage, which is a bit funny to me.

What I don't know, is why people cling to the \*~6 datatype* model in languages.

To conclude this unintentional mini-essay, I don't know. :^) We can build things that might aid adoption, for those who think they need \*Thing X\*, but we run the risk of people not changing their thinking, and limiting their ability to get the most out of Red. Maybe the answer lies in that. We need tools to help people transition to Red, to explore it, to play.

I went to a talk by Andy Hunt not long ago, and he is going post-Agile. Seeing this happen in a lot of areas, my extrapolation is that there is no "one size fits all" solution. \*Rebolers* have a long history of rolling their own tools, ad hoc, and we don't push them and try to make them NPM-ish packages (don't get me started). Maybe it's the Forth mindset for some. We build what we need, when we need it.

To conclude my conclusion (oy), we need to empower people; make them believe that they can do it \*themselves\*, rather than relying on a huge, generic ecosystem. Let's find things that help us do that, and learn from them. Logo may be the best examplar for that.

Dimonax

[20:51](#msg57e838bd16132d3143926bb1)Excellent points! It really depends on WHO the developer is( what their primarily interested in coding ) a not necessarily what tool their using to do it. A demoscene hacker will have far different taste in tools than a corporate database developer.

greggirwin

[21:01](#msg57e83b1a2d01d3ff191fe5ed)Right, and because we're a small team and community, we have to pick targets carefully.

## Wednesday 28th September, 2016

maximvl

[08:01](#msg57eb78e4ca69aeb745b87fb2)@greggirwin  
&gt;What I don't know, is why people cling to the ~6 datatype model in languages.

This is interesting point, are there any plans to support custom datatypes in Red?

rebolek

[08:17](#msg57eb7c89e045d19955069a6e)I think yes (I can’t support it with any citation now, sorry), but definitely not before Red reaches 1.0 and even then I think it’s not very high priority.

maximvl

[08:32](#msg57eb801c857ab70f7d49cae6)ok, that's all I wanted to know )

dockimbel

[09:14](#msg57eb8a0c54302caa6f26a489)@maximvl We'll try to add support for it after 0.8.0, once we have modules support.

rebolek

[09:31](#msg57eb8dd7c90661384a6e3577)Wow, that’s much sooner than I though :)

maximvl

[10:03](#msg57eb958cab9ba81255edc6d7)hm, how much code currently is written in Red? Red/System? what do you use for GUIs?

rebolek

[10:05](#msg57eb95f5c90661384a6e366f)For GUI? Red/View ;)

maximvl

[10:06](#msg57eb9629ab9ba81255edc91e)@rebolek I mean, what Red/View is written in?

rebolek

[10:07](#msg57eb9646e045d19955069d89)@maximvl I am not sure I understand. Red/View is written in Red(/System).

[10:07](#msg57eb9650d02791686c3fa2f5)It uses standard OS GUI libraries.

geekyi

[10:10](#msg57eb971454302caa6f26d521)@maximvl for example, in windows, it links to win32 api, winGDI, which is written in c, (c++?)

[10:10](#msg57eb9730e4e41c6a4afe0fd7)If you look at the source, you can find lots of Red/System

maximvl

[10:11](#msg57eb9737857ab70f7d4a1cca)@rebolek ye, I want to understand if Red code is already used in a project

rebolek

[10:11](#msg57eb9753c90661384a6e36a7)@maximvl you mean in some other project than Red itself?

maximvl

[10:11](#msg57eb975dab9ba81255edcd97)since there are still no big numbers and decent IO

[10:11](#msg57eb976aca69aeb745b8ebb2)@rebolek nope, in Red itself

geekyi

[10:12](#msg57eb97710096141655224c98)There are a lot of bindings on contrib page on official website

rebolek

[10:12](#msg57eb97a4e5887b81555d2f3d)@maximvl Red is written in Red and Red/System. Only the R/S compiler is written in Rebol (that will change after 1.0 when the compiler will be rewritten in Red).

[10:13](#msg57eb97d1e5887b81555d2f40)No other language is used.

maximvl

[10:13](#msg57eb97d4857ab70f7d4a1e7f)hm, okey, I see

rebolek

[10:15](#msg57eb9836d02791686c3fa317)According to GitHub, it’s Red 78.7% and Rebol 21.2%

maximvl

[10:20](#msg57eb997035e0f31c6c4c5e78)@rebolek I think most of it is still R/S

rebolek

[10:22](#msg57eb99e6c90661384a6e36dc)@maximvl of course

dockimbel

[11:22](#msg57eba80f0096141655228990)@maximvl The Red toolchain is written in Rebol (+ a compression library written in R/S). The Red runtime library is mostly written in R/S (\[red/runtime](https://github.com/red/red/tree/master/runtime)) and partially in Red (\[red/environment](https://github.com/red/red/tree/master/environment)). For \[View module](https://github.com/red/red/tree/master/modules/view/), it is written in Red, only the OS-specific backends are in R/S (like Windows \[one](https://github.com/red/red/tree/master/modules/view/backends/windows))

maximvl

[12:25](#msg57ebb69d35e0f31c6c4cc5b6)@dockimbel thanks! I was wondering if Red is already suitable for code with all those issues, but apparently it is

dockimbel

[12:49](#msg57ebbc3cca69aeb745b96ac6)@maximvl See by yourself in the source code from the links I posted. We have several thousands LOCs written in Red in the runtime library.

JacobGood1

[15:33](#msg57ebe2df783fe9b945a44447)@dockimbel speaking of custom data-types will we also be able to introduce syntax for these? If the red users find that a they are using someones data type quite often would it have a chance to become part of the Red standard?

dockimbel

[15:38](#msg57ebe3feca69aeb745ba27c8)@JacobGood1 Custom Syntax: I would like to add such support, though, it won't be easy to use, as one would need to be aware of all the syntactic rules in order to avoid introducing ambiguous syntax. Expanding our core runtime library with more datatypes is in the plans, though, such new datatype really need to be useful to a great number of users in order to make it in. Anyway, you'll be able to load dynamically your own custom datatypes, so this wouldn't be a limitation.

greggirwin

[15:55](#msg57ebe7ec54302caa6f2828f3)@maxim, my point wasn't about user defined types, but about the number of native types a language understands. Most langs have just a few, while Redbol has ~45.

maximvl

[16:06](#msg57ebea80857ab70f7d4b73d9)@greggirwin few builtin, but almost every language has a way to introduce new types

[16:07](#msg57ebeac8ca69aeb745ba475f)since Red approach is kind of unique - have a separate syntax representation of every type, I was wondering how will it work with user defined types

[16:09](#msg57ebeb1eca69aeb745ba4957)the only similar thing that comes to my mind is Lisps reader macros, they allow you to insert custom code right into parsing algorithm, producing everything you want

greggirwin

[16:27](#msg57ebef73e4e41c6a4aff8852)You can introduce new types, but it's very different than having them be part of the language, automatically lexed, etc. For example, a lot of languages have DateTime libs, but how are dates and times represented in code?

I don't know what the plans are for UDTs and how they will fit into the very tight lexical space. As you say, preprocessing may be the way, and Doc has already shown how that can be done.

PeterWAWood

[21:48](#msg57ec3ab7857ab70f7d4ccf20)K

## Friday 7th October, 2016

Mufferaw

[14:19](#msg57f7aeef4fde7203141959f2)Hello everyone. I have this function :

```
point_at_parameter: function [t[float!]][
    return origin + (t * direction)
    ]
```

and it gives this error:

```
*** Script Error: vector! type is not allowed here
*** Where: *
```

However, if I switch the t and direction around, like this:

```
return origin + (direction * t)
```

it works, but what's the difference??

[14:19](#msg57f7af07dfe82a365b067796)oh and direction is a vector!

[14:21](#msg57f7af7884f1db06148e7460)I used make vector! \[float! 32 \[25.0 25.0 25.0]] to make the vector!

DideC

[14:27](#msg57f7b0e0d6251fd1269d30c3)What result do you expect ?

rebolek

[14:28](#msg57f7b0f1470c6bb20f5db720)Hi @Mufferaw it is usual that the result of infix function depends on type of first value.

[14:28](#msg57f7b11714e9dbfd78573f68)So you can multiply `vector!` by something, but not something by `vector!`.

[14:28](#msg57f7b12ba9a0a333752ff905)Also, you do not need to specify `return`, last value is returned automatically.

Mufferaw

[14:31](#msg57f7b1b568f560d80ce67357)@rebolek Ooooh! I didn't know that! Thanks!  
@DideC I got the correct result, if t is 0.5 then the result would be roughly \[12.5 12.5 12.5]

[14:33](#msg57f7b24d4fde72031419695b)origin was roughly \[0 0 0]

DavidMatuszek

[19:53](#msg57f7fd40dfe82a365b07cac2) Hi everybody. I poked my head into this chat a couple of weeks ago; I'm the guy who is teaching a course in programming language paradigms. I don't have a good language to teach to exemplify reactive programming, and I'd love to make Red that language. Most of my students have Macs. Could I get a stable Mac version of View/Vid to try out and see if there's enough of it to make an assignment? The opening I would have for it in my current schedule is October 24.

greggirwin

[19:55](#msg57f7fdbe84f1db06148fda94)The OS X GUI is \*almost* here. Maybe in time for you.

DavidMatuszek

[19:58](#msg57f7fe5784f1db06148fddf9)I admit it, I'm hoping that this will provide a little encouragement. :-)

greggirwin

[19:58](#msg57f7fe6aa7c618cd26f1a679)Nice nudge. :^)

## Saturday 8th October, 2016

Mufferaw

[06:17](#msg57f88f7970fcb5db0c3bf64c)A couple more questions...first, how can I make tuple? (ex to tuple! \[ r g b] )

rebolek

[06:23](#msg57f890e7470c6bb20f5dc89d)@Mufferaw `to` is not done yet, but you can use `make`:

```
red>> make tuple! [1 2 3]
== 1.2.3
```

Mufferaw

[06:31](#msg57f892b568f560d80ce951e3)@rebolek is it possible to use 'variables' ? Like:

[06:31](#msg57f892c984f1db06149173b9)`make tuple! [ r g b]`

rebolek

[06:32](#msg57f89317a9a0a33375300a6e)@Mufferaw Of course, just use `reduce`:

```
red>> make tuple! reduce [r g b]
== 1.2.3
```

Mufferaw

[06:34](#msg57f893694fde7203141c459a):smile: Thanks, I'll catch on someday

[06:51](#msg57f8978adfe82a365b096f54)My other question was about image! I couldn't find much information about it. I've succeed in making totally black image, but I don't know how the values should be formatted.  
`pic: make image! 200x100 img`  
img is a block of tuples

rebolek

[06:54](#msg57f8982e14e9dbfd78575056)@Mufferaw `make` takes two arguments, type and spec

[06:55](#msg57f89846470c6bb20f5dc8ca)So `pic: make image! 200x100 img` is same as `(pic: make image! 200x100) (img)`

[06:55](#msg57f89857470c6bb20f5dc8cd)However, `spec` can be a `block!`:

[06:55](#msg57f8986e470c6bb20f5dc8cf)

```
red>> i: make image! reduce [100x100 red]
== make image! [100x100 #{
FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
F
```

Mufferaw

[09:02](#msg57f8b6360aa72e3c5be49ffa)@rebolek When I make the image! can the spec include a block of many tuples? I've made block with a bunch of tuples, but when I try to make with that I get an error.

[09:04](#msg57f8b68fd6251fd126a03dbb)will i have to loop through the image and change each value one by one?

[09:06](#msg57f8b73184f1db061491c4fc)

```
img: []
; some loops here, inside the loop I have this:
append img make tuple! reduce [ir ig ib 0]
```

[09:08](#msg57f8b77570fcb5db0c3c51de):worried: I'm not very good at explaining myself, sorry. I want to take the img block and make an image from the values

rebolek

[09:15](#msg57f8b92dbb20dfad43c41fa0)@Mufferaw No, you can’t create image from block of tuples.

[09:15](#msg57f8b93714e9dbfd785751b6)You have to put the values in later.

[09:16](#msg57f8b96bbb20dfad43c41fa5)

```
red>> i: make image! 2x2
== make image! [2x2 #{
FFFFFFFFFFFFFFFFFFFFFFFF}]
red>> repeat p length? i [i/:p: random 255.255.255]
== 120.170.151
red>> i
== make image! [2x2 #{
8EDA3A5CE21F7D2F5878AA97}]
```

Mufferaw

[09:29](#msg57f8bc9068f560d80ce9bc47)@rebolek thanks again!

rebolek

[09:36](#msg57f8be2abb20dfad43c41fc5)@Mufferaw Also:

```
red>> i: make image! 2x2
== make image! [2x2 #{
FFFFFFFFFFFFFFFFFFFFFFFF}]
red>> repeat width i/size/x [repeat height i/size/y [i/(as-pair width height): random 255.255.255]]
== 212.35.106
red>> i
== make image! [2x2 #{
845176F48F4EDE505AD4236A}]
```

Mufferaw

[13:34](#msg57f8f5d94fde7203141d456e)Here is the result, it's a very simple raytracer. It draws a single sphere shaded according to surface normals.  
https://gist.github.com/Mufferaw/e1769736a413a2b5fc47b6b11e655b3d

dockimbel

[13:49](#msg57f8f95c0aa72e3c5be55049)@Mufferaw Very nice! :clap: You could greatly speed it up by porting some of the Red functions to routines (Red/System).

Mufferaw

[13:53](#msg57f8fa734fde7203141d5244)@dockimbel Thanks. Oddly, when I compiled this, it didn't work.

greggirwin

[15:56](#msg57f917180aa72e3c5be5b316):point\_up: \[October 8, 2016 12:17 AM](https://gitter.im/red/red/welcome?at=57f88f7970fcb5db0c3bf64c) I recently wrote https://gist.github.com/greggirwin/a52f1c9c197b50f7a1b6e80f69828751 just for fun.

[15:57](#msg57f91753dfe82a365b0acdc9)And really nice work on the ray tracer!

Mufferaw

[16:19](#msg57f91c7568f560d80ceadc6a)@greggirwin thanks for that, you've given me more to think about!

gour

[21:11](#msg57f9611868f560d80cebe0d3)what is the prospect of running Red on FreeBSD?

greggirwin

[22:25](#msg57f97272dfe82a365b0c0403)FreeBSD is a supported target platform, which you can cross-compile to. The current toolchain is in R2, and you'll need a license to build Red with it. That may be a tough. I don't even know if you can get an R2 SDK for FreeBSD. Once Red is self-hosted, that problem will go away.

PeterWAWood

[22:57](#msg57f979c068f560d80cec2103)@gour You don't need an R2 SDK to run Red on FreeBSD. A copy of Rebol/Core for FreeBSD from the Rebol downloads page will suffice as you can run Red from source.

There may be some bugs in Red under FreeBSD. I used to run the tests on a FreeBSD VM but since I've upgraded both the OS and Virtual Box on my machine, I cannot get a FreeBSD VM to run on it.

It would be good if you could install Red under FreeBSD and run the tests from time-to-time.

## Sunday 9th October, 2016

gour

[05:00](#msg57f9cefa84f1db061494ba29)@greggirwin i see...is Red on 'planned schedule' as far as progress to 1.0 (and eventually 2.0) is concerned?

rebolek

[05:14](#msg57f9d24d68f560d80cecd2cf)@gour As @PeterWAWood said, @greggirwin is wrong here, you do not need Rebol SDK license. Red’s compiler needs the free version only on all supported platforms.

[05:17](#msg57f9d30684f1db061494c14d)\*is Red on 'planned schedule' as far as progress to 1.0* - it is, just check \[Trello](https://trello.com/b/FlQ6pzdB/red-tasks-overview) to see the steps to 1.0.

greggirwin

[05:41](#msg57f9d8a0dfe82a365b0ceb1d)I stand corrected, but what I meant was that you can't build Red, not that you can't run it.

PeterWAWood

[05:42](#msg57f9d8b268f560d80cece27c)@rebolek I think @greggirwin was referring to building a red executable.

rebolek

[05:45](#msg57f9d981dfe82a365b0cecf8)@PeterWAWood I see. I misunderstand him, because I never build Red executable. I build (gui-)console or compile scripts from Rebol. Sorry for the confusion.

greggirwin

[05:49](#msg57f9da66dfe82a365b0cef15)No problem. You both made it clear that Red is usable on FreeBSD without a license or SDK, which I muddled a bit.

gour

[06:45](#msg57f9e76d68f560d80ced0f1a)thank you, all, for your input?

[06:46](#msg57f9e7c784f1db061494f9dc)@rebolek i have a feeling that 0.6.2 was supposed to be already relased, but possibly progress has been made in parallel on other sides

[06:47](#msg57f9e812d6251fd126a3739e)however, GUI on Linux (FreeBSD) seems to be still far usability for real use

PeterWAWood

[07:51](#msg57f9f713a7c618cd26f6f978)I think it is unlikely that the Red team will develop a GUI for BSD. Im

[07:52](#msg57f9f758d6251fd126a39704)I'm doubtful that a Linux GTK+3 GUI will run on FreeBSD.

gour

[08:06](#msg57f9fa91a7c618cd26f7007d)@PeterWAWood hmm, FreeBSD has linux comp. layer which enables one (under 11.x) to run even 64bit apps, but in Red-2 everything should be buildable from Red source and therefore possibly running same as tons of other stuff which is otherwise written for Linux...if FreeBSD can use GNOME, KDE...

rebolek

[11:25](#msg57fa29210aa72e3c5be8962e)@gour 0.6.2 will be released when libRed is ready. I can’t say if it takes days or (few) weeks, but it will be Soon™ ;)

geekyi

[12:00](#msg57fa3166a9a0a33375301911)gitter chat FAQs: https://gitter.im/gitterHQ/topics/categories/faqs

[12:04](#msg57fa3241470c6bb20f5dd927)The new gitter Topics turned out to be more heavyweight than I expected; was looking for a more lightweight alternative to rooms, i.e. inline/threaded conversations. May turn out to be a feature like forums, etc..

[12:04](#msg57fa325b14e9dbfd78575fc3)More info about topics: https://gitter.im/gitterHQ/topics/topic/57f378d629de20202ee0d4b1/welcome-to-topics-readme-first

gour

[16:33](#msg57fa7174dfe82a365b0e9ab8)@rebolek ok. thank you. how far is gtk for linux? it's hard to estimate based on trelloboard...

geekyi

[17:30](#msg57fa7ea914e9dbfd785762dd)@gour based on trello board, 13% :p check qtxie's branch

## Thursday 13th October, 2016

Mufferaw

[06:30](#msg57ff2a02b68c1ca566af88cc)

```
red>> a:  HIT-LIST/(:i + 1)/6
== SPHERE-hit
red>> do a
*** Script Error: SPHERE-hit is missing its r argument
*** Where: SPHERE-hit
red>> do a r
*** Script Error: SPHERE-hit is missing its r argument
*** Where: SPHERE-hit
```

I am trying to get the name of a function from a block and then do the function but I can't seem to pass the arguments to the function.

[06:31](#msg57ff2a42614116a2567c1a3b)Am I going about this the wrong way?

endo64

[07:08](#msg57ff32e5614116a2567c3c2f)This is different then Rebol, it works as you did in Rebol but not in Red.

[07:08](#msg57ff32f678bd0d0363bbeba4)You can do like this: `do reduce [b r]`

Mufferaw

[07:10](#msg57ff3367457ae29b71d5ad8f)@endo64 Thanks!

greggirwin

[17:18](#msg57ffc1cf1cc4cda4564a05bb)You could also do it by storing references to the actual funcs. Neither way is better, just different.

```
red>> hit-list: reduce [:append]
== [make action! [[...
red>> a: pick hit-list 1
== make action! [[..
red>> a [] 1
== [1]
red>> hit-list/1 [] 2
== [2]
```

## Friday 14th October, 2016

Mufferaw

[08:17](#msg58009488b68c1ca566b4edb5)@greggirwin That's very nifty! When I was playing around with this I got a crash by trying:  
`reduce :append`

greggirwin

[16:04](#msg5801022a614116a25683405c)That's worth a ticket if there isn't already one there. It should just return the function value.

JackGritt\_twitter

[23:00](#msg58016392891a5301630ed5b3)My boss (regional trucking co) has tasked me with developing our new loads tracking system. He told me to get started coding in one of the Rebols (2 or 3) in code that can be run in Red with the least amount of editing as possible.

Each of the sys objects in Red, Rebol 2 and Rebol 3 have these: `version, build, locale, schemes, options, ports, script, standard, view`

Unique to Red: `lexer, reactivity`  
Unique to R3: `contexts, dialects`  
Unique to R2: `core, components, user, network, error, stats, user-license`

R2 and R3 share these: product, license. Maybe these are here because both supported commercial products at one time.

Red and R2 share these: `words, console`  
Red and R3 share these: `platform, catalog, modules, codecs, state`

The Red `system/catalog` seems empty. So too does the Red `system/modules`. The R3 `system/catalog` has all of the built-in function names in blocks and the system/modules has a bunch of code. Also, the `system/state` between Red and R3 don't match at all.

So does that mean Red is more like R3 in the way R3 copied words into `system/context/user` because of supporting `modules` or is Red more like R2 in there being one global `system/words` because R2 lacked modules?

Red seems to have or intends to have the same built-in functions as R3, except Red 'function replacing R2/R3 'funct and ditching 'function. So Red seems to be more like R3 and less like R2 when it comes to available functions. .

My boss said we can't write in Red yet because Red is missing dates and our scheduling app needs dates. He says we will switch to Red as soon as Red adds protocols and dates.

So given all of that, would it be better to write near production code now in R3 becaues of more overlap in functions or in R2 because of system/words?

Is there something he could read on Red modules and how modularity going to work in Red? And is there something he could read on Red that compares function to function for every function to R3 and R2?

geekyi

[23:09](#msg580165ba94b459a576dccc07)@JackGritt\_twitter Red is alpha. The \*\*tl;dr;\** version of things is use R2 for production code.  
If you want things running up quickly, etc. Even though it is somewhat outdated, it has lots of documentation, maturity, stability etc. Most importantly, it still works!

[23:11](#msg58016637c5e30d6764378684)If that doesn't answer your question, let me know. Also, I'm a bit curious who your boss is and how he found out about rebol :smile:

[23:18](#msg580167c8c5e30d6764378696)Red evolved independently from Rebol2. Then rebol2 was opensourced as rebol3, so it is more or less a continuation. After that, red and rebol3 have developped in parallel, sometimes borrowing from each other(?) I'm not familiar with Rebol3 (haven't used yet) others might now more. But I'd chosen R2 for the sole reason that it was stable while Red and Rebol3 are moving targets

JackGritt\_twitter

[23:22](#msg580168b68eaaaea366988c43)@geekyi Yeah, I read this "The high-level language is very similar to Rebol2 (roughly 95% source-compatible), " from an "official" web page, but one sentence isn't enough for my report to my boss.

I see little things. In R2:

`>> first [] ** Script Error: Out of range or past end ** Near: first []`

In Red:

`red>> first [] == none`

Same in R3:  
`>> first [] == none`

But the big things have to do with the modules functionality in R3 versus what the Red designer has in mind. It's hard to decide when docs are hard to come by.

greggirwin

[23:23](#msg580168ed1cc4cda456504b81)@greggirwin agrees with @geekyi. R3 may be an option, but is also missing important pieces. Not all protocols are in place, no way to encap, etc. There are also R3 forks you need to choose from.

JackGritt\_twitter

[23:24](#msg5801692e1cc4cda456504c01)Hey cool, so R2. But what about the system/words, modularity and context?

greggirwin

[23:24](#msg58016939b68c1ca566b84d1b)There will be differences in all of them, but R3, ironically, changed some fundamental things that Red is going to be R2 compatible with. e.g., R3 defaults to returning binary results, as you would use `read/binary` for in R2.

[23:25](#msg580169661cc4cda456504d1e)The only module in Red right now is `View`, but the bigger module design isn't done yet.

[23:27](#msg580169ea457ae29b71de5aad)Assuming you choose R2 to start with, it should be very compatible with Red. Of course, R2 doesn't have a module system, so you can't write your code using it. My first question is what you use things like system/catalog for today?

[23:28](#msg58016a1e891a5301630ee64f)My current recommendation, like @geekyi, is to use R2. And use vanilla R2 as much as possible.

[23:29](#msg58016a598eaaaea366989077)Isolate the bits you think will need to change, rather than littering them throughout your code, and porting shouldn't be...any harder than porting between v.N and v.N+1 in any other language.

JackGritt\_twitter

[23:45](#msg58016e03614116a25684f690)Cool. Thanks guys.

So system/words in Red is the same as R2?

greggirwin

[23:46](#msg58016e54614116a25684f76a)Pretty much.

[23:47](#msg58016eae891a5301630ef113)i.e. they are both objects with references to defined words. As long as you're not doing funky stuff with binding or trying to redefine things there, you shouldn't have any issues.

[23:48](#msg58016edcb68c1ca566b8664f)What is the current system written in, and roughly how large/complex is it?

[23:53](#msg58016fefb68c1ca566b86919)Also, make sure your boss knows that you may need to wait for GC in Red as well.

JackGritt\_twitter

[23:59](#msg58017150891a5301630ef74f)Cool. You guys have been most helpful. Red news and "docs" seem to be spread everywhere (Gitter, Trello, Blogger , etc), but there isn't any clear schedule of milestones attached to dates that is prevalent in the business world. Red started when, way back in what 2011? Does that mean GC might not be implemented until 2019?

That is why my boss likes deadlines. Is there a hidden site with a release schedule with firm commitments to dates?

## Saturday 15th October, 2016

JackGritt\_twitter

[00:06](#msg580172fa1cc4cda45650664d)The old system is in something called Borland Delphi. But the source isn't available so no LOC count and the old contract coder has died, moved on or retired. The boss says he doesn't want the business stuck that way again.

He found out about Rebol and Red and said that important stuff could be compiled in Red for any speed needs but much of the system could be interpreted and re-written anytime by high school kids after school if need be because he said that Rebol is too easy compared to other languages like Python or Ruby. He said our only other choice would be Lua though he likes the clean look of Rust, but that is compiled.

greggirwin

[03:53](#msg5801a84630abd7997186ae30)GC will be here well before 2019. I'm familiar with Delphi. Priorities in Red are defined by investors and what Team Red feels is most important for getting to the next stage.

ghost~5680c5f416b6c7089cc058a5

[05:06](#msg5801b94e78bd0d0363c52f04)A simple GC is planned for the v0.6.4 which will come in a few months and I guess it will be usable for basic needs.  
Advanced GC will come later, probably by the end of next year(?)

JackGritt\_twitter

[20:01](#msg58028b25891a5301631222e8)Très cool on the GC. But what defines basic needs?

Investors? Is Red then at the mercies of investors in the way Rebol was to Rebol Technologies investors? Could Red never be finished if investors pull out? My boss will want to know about this for sure.

How confident are you guys on the developer team delivering a 1.0 before the end of June, 2017? That is a lot of coding time between now and then.

greggirwin

[22:53](#msg5802b370614116a25688bc61)Initial basic needs are what Red needs to bootstrap and become self-hosting.

Red is fully open source. As with all things, someone either does it because they're getting paid or because they want to. If we want it to proceed, we need to help fund it, contribute our time, or both.

I'm not concerned about a hard 1.0, but am confident they will get it there as soon as they can. So far, they've done very well so far. I have full faith in Team Red.

## Sunday 16th October, 2016

Mufferaw

[12:25](#msg580371ce891a530163147705)Hi everyone, I'm trying Red/System and I need some help!

```
Red/System [
]


vector3!: alias struct! [
    x [float!]
    y [float!]
    z [float!]
]
vec3-Dfloat: func [
    vec [vector3!]
    f [float!]
    return: [vector3!]
    /local a
    ][
        a: declare vector3!
        a/x: vec/x / f
        a/y: vec/y / f
        a/z: vec/z / f
        a  
    ]

aa: declare vector3!
aa/x: 10.0
aa/y: 5.5
aa/z: 1.2555

b: 50.0

c: vec3-Dfloat aa b
print ["C: " c/x " " c/y " " c/z]
```

The output is  
`C: 5.0 9.090909090909092 39.8247710075667`

[12:28](#msg5803727430abd799718ba31e)It's doing f / a/x instead of a/x /f

[12:43](#msg580375d5b68c1ca566be26de)oops, I meant to write - f / vec/x instead of vec/x /f

rcqls

[13:10](#msg58037c4f30abd799718bbe62)

```
Red/System [
]


vector3!: alias struct! [
    x [float!]
    y [float!]
    z [float!]
]
vec3-Dfloat: func [
    vec [vector3!]
    f [float!]
    return: [vector3!]
    /local a vx vy vz
    ][
        a: declare vector3!
        vx: vec/x vy: vec/y vz: vec/z
        a/x: vx / f a/y: vy / f a/z: vz / f
        a
    ]

aa: declare vector3!
aa/x: 10.0
aa/y: 5.5
aa/z: 1.2555

b: 50.0

c: vec3-Dfloat aa b
print ["C: " c/x " " c/y " " c/z lf]
```

seems to fix the problem but I am waiting like you the explanation of expert.

Mufferaw

[13:13](#msg58037d0d1cc4cda456562b56)@rcqls Thanks!

rcqls

[13:25](#msg58037fb378bd0d0363ca3a07)@Mufferaw BTW, same trouble with `-`.

qtxie

[14:24](#msg58038d8cb68c1ca566be6f1d)Looks like a bug...

## Monday 17th October, 2016

dockimbel

[06:48](#msg580474261cc4cda456593c04)@Mufferaw Please open a ticket about it in the bugtracker on github. We'll fix it at once.

Mufferaw

[07:50](#msg580482a8614116a2568e1822)@dockimbel Ok I've added it.

## Sunday 23th October, 2016

thirdy

[04:28](#msg580c3c835af5969e7ef06cd2)hi. Using windows 7, can I run a `foo.red` script just by double clicking on it? Ala AHK

[04:30](#msg580c3cd256121b9c7eaf4adc)ok, I can drag and drop a script unto the `red-061.exe`

[04:31](#msg580c3d0856121b9c7eaf4b2f)awesome, just had to register the file type and run with the exe by default

rebolek

[06:10](#msg580c5446714642af22cca4f9):+1:

## Friday 28th October, 2016

Andrew-College

[21:47](#msg5813c78a482c168b22c80c43)Hello there. Apologies if this is the wrong channel, but can I ask about the VS-Code plugin?

dander

[22:05](#msg5813cba583a2008d22e450f9)Welcome! I'm sure it would be fine to ask about it here

## Saturday 29th October, 2016

Andrew-College

[14:49](#msg5814b715482c168b22cb7b7e)Hi Dave.  
I just wanted to check, is the vscode plugin compatible with current Stable of Red or current unstable? I've been looking into using it with current stable which all seems to work well, but the hover seems to crash silently.

dockimbel

[16:09](#msg5814c9c05a1cfa016e5d8e34)@Andrew-College Latest VSCode plugin features require the latest auto-build version.

Andrew-College

[16:10](#msg5814c9eb482c168b22cbc9f3)Cool, I wouldn't need to build the plugin and red locally?

redredwine

[18:35](#msg5814ebe85a1cfa016e5e0eab)@redredwine  
Hello, I am new to red. I tried the red/help room - I downloaded the red-061.exe on my windows 10 machine. and ran red-061 -- cli , it gave me access denied (although i ran it as an administrator). when I tried running just red-061.exe it does nothing, I don't get any red console.  
was wondering if anyone has come across same problem before, and could help me get started. I must say that my antivirus did not raise any alert while running the command below.  
Directory of F:\\red

10/27/2016 10:38 PM &lt;DIR&gt; .  
10/27/2016 10:38 PM &lt;DIR&gt; ..  
10/25/2016 09:29 AM 968,539 red-061.exe  
1 File(s) 968,539 bytes  
2 Dir(s) 100,930,060,288 bytes free

F:\\red&gt;red-061.exe --cli  
Access is denied.

F:\\red&gt; F:\\red&gt;red-061.exe  
F:\\red&gt;

greggirwin

[18:45](#msg5814ee4ac3569a036e317721)Have you tried just double clicking the exe in Explorer? I don't have Win10, so just looking at what behavior might be different.

[18:46](#msg5814ee978ed1c0ff5c40ea89)Some locations can be problematic if you have Data Execution Prevention on (Win 7 anyway).

[18:48](#msg5814eeed0e25dbfa1175d67a)If you right-click the exe and look at properties, is there a security area at the bottom of the General tab that says it came from the net and is blocked?

geekyi

[19:52](#msg5814fde6482c168b22cc9a6a)@greggirwin @redredwine I just followed the same steps on windows 10 and it worked for me, didn't need to unblock even tho it is set to \*came from another computer\*, also didn't need admin rights

[19:53](#msg5814fe2b0e25dbfa117610ce)@redredwine Do you have access to `C:\ProgramData\Red`? And is there any files?

[19:54](#msg5814fe747b15d16e55c153e2)\[!\[image.png](https://files.gitter.im/red/red/welcome/3Sns/thumb/image.png)](https://files.gitter.im/red/red/welcome/3Sns/image.png)

[20:00](#msg5814ffdb0e25dbfa117616c2)&gt;also, when you say "maybe your anti virus delete it" , what is it deleting exactly ? the red-061.exe is still in F:/red/ folder.

My antivirus (avira) deleted the original red.exe and the other files in `C:\ProgramData\Red`, and nothing but disabling and uninstalling it solved the problem

Andrew-College

[20:32](#msg581507645a1cfa016e5e831c)Installing to the Documents folder may resolve this.

[20:33](#msg5815077ec3569a036e31ee3c)I believe its less 'locked down' than you root drive would be

[20:33](#msg581507b5806316005dd3ac7b)oh

[20:34](#msg581507c07b15d16e55c17eab)you're if the f drive

[20:34](#msg581507d7482c168b22ccc688)is this your OS drive by chance?

[20:35](#msg5815081a482c168b22ccc7c8)actually, nevermind, apologies ^^;

greggirwin

[20:50](#msg58150b7c8ed1c0ff5c415944)I thought the same thing @Andrew-College.

## Sunday 30th October, 2016

endo64

[10:41](#msg5815ce71482c168b22cf46ca)And try disabling on-demand scan feature of your virus program, many virus programs don't allow generating an executable and block access.

redredwine

[15:06](#msg58160c625a1cfa016e61f099)Thanks to all for your replies.

yes there is a c:\\programdata\\red hidden folder , there are 3 files,console-2016-6-30-23134.exe, gui-console-2016-6-30-23134.exe, crush-2016-6-30-23134.dll

when I log in as a user with Admin rights:-  
Using windows explorer and I go to c:\\programdata\\red folder, and click on each of the 2 .exe files, console-2016-6-30-23134.exe, gui-console-2016-6-30-23134.exe  
I get the message - windows cannot access the specified device, path or file. you may nothave the appropriate permissions to access the item.

Using command prompt in the c:\\programdata\\red folder/directory, when I type each of the .exe and press enter for each command this is what I get  
console-2016-6-30-23134.exe - it gives the red repl console.  
redgui-condole-2016-6-30-23134.exe - it gives me access denied.

when I move all 3 files from the c:\\programdata\\red to my F:/red drive folder, it does not matter whether I am going to command prompt and typing the command or using windows explorer and double click, it gives me the following message- "windows cannot access the specified device, path or file. you may not have the appropriate permissions to access the item". (despite having logged in as an Admin user)

Please note I try to keep only my Windows OS on my c drive. Everything else I want them to be in my F:drive . I want to keep my os files and my own files separate, for easier maintenance. Also for my day to day activities, I log in a NON admin user . I am kind of wondering, if the the file that we download from the RED site is going to recreate 3 files on our system - why don't we just download the 3 files from the Red site, it will be more obvious to the newbie to understand that he needs 3 files. instead of them thinking that the the RED-061.EXE downloaded is the only and actual red executable needed to actually run red. 2) why not provide a prompt to select which folder I want to use to " extract" the 3 files console-2016-6-30-23134.exe, gui-console-2016-6-30-23134.exe, crush-2016-6-30-23134.dll . just my humble suggestions to make it easier on newbies. Cheers.

[15:14](#msg58160e6b7b15d16e55c4df2e)@greggirwin - Yes I unblocked the red-061.exe , it says it is coming from another computer . when I doubleclick it just open a command prompt for one second and then closes it. when I go to command prompt, and type red-061.exe, it just does nothing, same as in my first post. @geekyi , weird mine is on windows 10, but it does not work.

greggirwin

[18:49](#msg581640c383a2008d22ed1523)I keep things off my OS drive when I can as well, including Red. The stuff in ProgramData is (I think) due to Red trying to be compliant with their rules. Tricky stuff there.

If you right click on the exe and look at the Security settings, are you the owner and is it set to allow execition?

## Monday 31st October, 2016

RnBrgn

[01:03](#msg58169873c3569a036e379095)@redredwine Try deleting the Red folder under c:\\ProgramData. Then double click on  
F:\\Red-061.exe.

geekyi

[03:24](#msg5816b9608ed1c0ff5c475041)@redredwine  
&gt;why don't we just download the 3 files from the Red site

:point\_left: \[Quoting doc](https://gitter.im/red/red/gui-branch?at=58141efb83a2008d22e5787f)  
&gt; @geekyi The `red.exe` only contains the source code for the gui-console, which gets compiled on first invocation of the REPL.

1\. crush.dll is the compressor, based on the \*crush* algorithm (to decompress the contents?)  
2\. you just need one of `console` and `gui-console`, they are just slightly different implementations (can have the `console` when you don't have a gui  
3\. to actually run the red interpreter, you can just double click the `gui-console`, it's the only thing you need afaik

In short, red.exe is a packaging mechanism, it is 1 file for convenience of the newbie (1-click start) :smile:

[03:30](#msg5816bac9482c168b22d2f828)@redredwine it \*looks* like it is compiling correctly, just not running, which is weird. Does it happen with other `.exe`s?

[03:35](#msg5816bbf2806316005dd9b515)&gt;console-2016-6-30-23134.exe - it gives the red repl console

Oh, ok so it works kinda? What if you type `view [button "hi"]` in the console? It looks like only the gui-console gives error.. which is \*really* weird.. either your download is corrupted, you have some strange security setup (antivirus or other) or something else strange going on :worried:

[03:38](#msg5816bcb25a1cfa016e64c863)Also try, gregg's suggestion, :point\_up: \[October 30, 2016 11:49 PM](https://gitter.im/red/red/welcome?at=581640c383a2008d22ed1523) more \[info](https://support.microsoft.com/en-us/kb/2669244)

redredwine

[20:47](#msg5817adfa8ed1c0ff5c4c5bbb)Thanks Guys for your help.  
The full control permissions were all there, when I checked yesterday. I did go in and switched a couple of times ownership back and forth between between the 2 users( one with admin rights, and with normal rights) yesterday night, to try the different combinations, and it was still not working . Somehow this morning, it seems to be working . I suspect that maybe the relogging in or rebooting may have done something. I can play with it now. the 2 files console\*\*\*.exe and the gui-console\*\*\*.exe have been copied to my F:\\red\\ folder, and are running from there.  
Thanks again :smile:

greggirwin

[23:07](#msg5817ceb6c3569a036e3e0d2a)Ah, the reboot. ;^)

## Saturday 5th November, 2016

sergey6661313

[17:41](#msg581e19c331c5cbef43bd48ff)Прямо сейчас (в текущей реализации) возможно ли создать приложение на red под android (самое простое - две кнопочки и поля ввода с сохранением текста на flash память) ? Если нельзя - когда ожидать? Если можно - "ткните меня носом". Спасибо.

greggirwin

[18:09](#msg581e205ae462097a30115af5)@sergey6661313 Мне очень жаль, что я не читаю по-русски. Не могли бы вы опубликовать на английском языке?

[18:11](#msg581e20e4c2f2cf7275d3e2c5)Nevermind, I can just translate and post for you. :^)  
&gt; Right now (in the current implementation) is it possible to create an application for android on red (the most simple - two buttons and input fields with preservation of the text on flash memory)? If you can not - when to expect? If you can - "poke my nose." Thank you.

[18:12](#msg581e212645c9e3eb43008cc0)Though I have no idea what "poke my nose" means. :^\\

sergey6661313

[19:02](#msg581e2cddeed0c3125f3e7036)This is Russian slang expression. It means a request: specify directly on the desired response.

## Sunday 6th November, 2016

greggirwin

[03:28](#msg581ea35deed0c3125f403fd4)Good to know. Thanks!

redredwine

[03:33](#msg581ea489c2f2cf7275d5f919)I am using the context editor for learning red, it is very light about 4 MB disk space, however it cannot do debug. I can only write a red script, then run it by calling the console.exe.  
Do a lot of people here use the Visual studio code editor ? I downloaded it and find it a bit confusing to setup the debugger.

qtxie

[04:17](#msg581eaec0e462097a301384e5)@redredwine No debugging support in VSCode currently.

geekyi

[07:48](#msg581ee044e097df7575775ae0)@redredwine what is the "context editor"? I'm using sublimetext3 with red plugin

rebolek

[07:56](#msg581ee22f0d42ea911cbe77e0)Maybe this? http://www.contexteditor.org/index.php

greggirwin

[16:49](#msg581f5f32e097df7575796033)I used ConTEXT for a number of years. Now I use UltraEdit as my main editor. It still surprises me that after so many years in IDEs how I moved to a "plain" editor with only a minor sense of loss at times. The modern features people speak of are, to me, just minor changes to old ones. Watching a program progress, and inspecting the output, is just step-tracing. Being able to go back in time is the modern twist, which is cool. Nobody is yet (AFAIK) talking about viewing many possible futures or pasts, and comparing them side by side.  
One thing I thought I couldn't live without is \*jump to definition\*, having had it available to me from 1989 to 2001 when I changed my focus to Rebol. I still miss at times, though the function list in UE works fairly well in its stead. Haven't missed it enough to configure a CTAGS setup.  
I am anxious to see the future we'll create with Red in this regard.

redredwine

[18:33](#msg581f776bdf5ae9664521f5a8)@geekyi - it is a small free editor - same as link provided by @rebolek - http://www.contexteditor.org/index.php  
@qtxie - ok thanks for the confirmation that vscode does not support debugging for Red.

[20:48](#msg581f971b45c9e3eb43064534)I am seeing something weird with the UI.  
1\) button does not take colour. the example below does not give a blue button  
view \[ button blue 70x20]

2\) " below " works weird, in the following example , I was expecting to see "second" on the next line under "First", but it is "third" that goes on the next line.

view [  
style btnStyl: button blue 70x20  
btnStyl "First"  
below  
btnStyl "Second"  
btnStyl "third"  
btnStyl " fourth"  
]

rebolek

[20:50](#msg581f978b0d42ea911cbe9cdd)1) That’s not supported (yet).

[20:53](#msg581f98504aeee0634dc1daf5)2) `below` and `across` just sets actual direction. What you are looking for is `return`.

[20:55](#msg581f98ccb4046d90642c589f)I’m not sure where do you expect "third" and "fourth" to be, but try something like this:

```
view [
	style btnStyl: button blue 70x20
	below
	btnStyl "First"
	btnStyl "Second"
	return
	btnStyl "third"
	btnStyl " fourth"
]
```

[20:56](#msg581f98fdb4046d90642c58ab)Also change `below` to `across` in that example, to see how it works.

redredwine

[21:19](#msg581f9e6331c5cbef43c358ee)thanks @rebolek , "return" works better than "below". exactly as what I was trying to do. i.e to place the next button following the "return" word to a new line.

rebolek

[21:22](#msg581f9f11aa8f8c4b328f5091)@redredwine It’s not that it works better, `below` and `across` just set the direction for the placement. `return` starts next row or column, depending on the direction. It may be little unusual, but it’s effective. And you can always enclose faces in panel, when trying to do something more complicated.

redredwine

[21:27](#msg581fa02831c5cbef43c36026)Ok thanks for the explanation @rebolek , I will keep this in mind going forward.  
I was reading the "red by example" page - there it defined "below" as "The function below is used to position GUI elements following that word below the previous GUI element."  
So I was wrong thinking that any widget I placed after "below" will be "below" the previous widget.

rebolek

[21:46](#msg581fa4a14aeee0634dc1de5f)@redredwine I agree that the wording may be confusing - previous element does not mean the element preceding the word `below`, but every previous element after the word `below`.

## Monday 7th November, 2016

dsgeyser

[07:09](#msg582028aae462097a30198f9e)From Wikipedia:

' Stroustrup describes C++ as "a light-weight  
abstraction programming language \[designed] for building and using efficient and  
elegant abstractions"; \[5] and "offering both hardware access and abstraction is  
the basis of C++. Doing it efficiently is what distinguishes it from other  
languages"'

Really? Isn't elegant abstractions and being light-weight something more in line with what Red is able to accomplish. C++ is not so.

[07:12](#msg58202951c2f2cf7275dc7a88)@dsgeyser And accessing the hardware...

[07:19](#msg58202af8eed0c3125f46ad33)What is "operator overloading " in Red terms? An example is most welcome.

greggirwin

[17:50](#msg5820bed878ec59ab05441088)\*light-weight* and \*abstraction* are so subjective and context dependent, that I don't think we can compare against them. Red provides both, of course, and is not like C++ at all. I can't wait to see what kind of tools people build for the lower levels. Not only what Team Red creates to build Red 2.0, but for hardware driver development, embedded systems, etc.

[17:57](#msg5820c08645c9e3eb430bf0c3)Operator overloading is implicit in Red's design. You use it every time you write an `op!`. e.g. `1 < 2`. The op maps to an action (though it can also map to a function) and actions are handled by each datatype. The \*overloading* part is yet to be defined, though you can do it today at the Red/System level, or possibly even hack at the mezz level. I don't recommend that. Wait to see that Nenad proposes for UDTs.

For new infix ops, this is Nenad's example of how to write them: https://github.com/red/red/wiki/Guru-Meditations#define-infix-operators

dsgeyser

[19:47](#msg5820da6b6cb720763049f368)@greggirwin Appreciate time taken to answer me. As always, complete and to the point. :-)

endo64

[21:32](#msg5820f2e5e462097a301e55ed)How can I find the first non-zero char in a `binary!`? It didn't work with `charset`

```
red>> find x complement charset #"^@"
== #{0000000016180300}
```

greggirwin

[22:29](#msg5821005adf5ae966452a27ce)

```
red>> x: #{0000000016180300}
== #{0000000016180300}
red>> parse x [some [#"^@" | pos: break] to end]
== true
red>> pos
== #{16180300}
```

## Tuesday 8th November, 2016

endo64

[06:53](#msg5821767331c5cbef43cc9262)This is different than R2/R3, is it expected?

```
red>> find #{0000000016180300} complement charset "^@"
== #{0000000016180300}
R2/3>> find #{0000000016180300} complement charset "^@"
== #{16180300}
```

dockimbel

[07:10](#msg58217a5f45c9e3eb430fa025)@endo64 Most probably not yet implemented, you can fill a wish ticket for it.

endo64

[07:25](#msg58217de5e462097a3020d250)@dockimbel Thank you, done. #2308

## Thursday 10th November, 2016

Rebol2Red

[11:21](#msg582458276cb72076305c26bf)@Mufferaw  
I just read your code:

```
s: now/time/precise ; added for timing

i: make image! 800x400
repeat width i/size/x [repeat height i/size/y [i/(as-pair width height): random 255.255.255]]

probe now/time/precise - s ; added for timing
view [image i] ; just to show the image
```

You can do this in one loop (faster):

```
s: now/time/precise

image: make image! 800x400
repeat pixel image/size/x * image/size/y [
	image/:pixel: random 255.255.255
]

probe now/time/precise - s
view [image image]
```

dockimbel

[11:26](#msg5824594d6cb72076305c2c28)Can be even simpler:

```
s: now/time/precise

image: make image! 800x400
forall image [image/1: random 255.255.255]

probe now/time/precise - s
view [image image]
```

Rebol2Red

[11:29](#msg58245a086cb72076305c2faf)@dockimbel Yes, even better, thanks.

Mufferaw

[11:32](#msg58245ac5df5ae966453c0a7b)@Rebol2Red What's that from? I don't recognize it :worried:

Rebol2Red

[11:35](#msg58245b9e31c5cbef43db8f74)Well, i added some code, this is your original code

```
i: make image! 2x2
repeat width i/size/x [repeat height i/size/y [i/(as-pair width height): random 255.255.255]]
```

Mufferaw

[11:38](#msg58245c4d45c9e3eb431ed1da)@Rebol2Red Are you sure that's me?

Rebol2Red

[11:40](#msg58245cb6e462097a302fed26)Sorry, it was related to you by Bolislav

Mufferaw

[11:42](#msg58245d32e462097a302ff05e)@Rebol2Red oh I see it in my notes, now I have two more examples for my notes! thanks!

TomGrey303

[23:34](#msg582503ee65485ebc677db94e)Just started with Red, everyone is really helpful, where can i get more samples or examples, I find that is the easiest way to learn. Love it

qtxie

[23:37](#msg5825049fe097df75759767a9)@TomGrey303 Welcome! You can find some good exmaples here: https://github.com/red/code

TomGrey303

[23:41](#msg582505926cb72076306056c4)@qtxie thanks will take a look, and thanks with your help on the 'Call' problem i had the other day, you're answer was one hundred percent perfect.

## Friday 11st November, 2016

justjenny

[00:32](#msg5825118965485ebc677df787)Hi @TomGrey303 This site can seem a bit clinical sometimes - but everyone is always very helpful - If you are into GUI things, you should look at: http://www.mycode4fun.co.uk/About-Red-Programming - I learned a lot from there and he's always willing to help.

TomGrey303

[01:04](#msg58251933c2f2cf7275f6ff66)Thanks @justjenny looks good - great site, really exited about Red, so much to learn.

endo64

[07:04](#msg58256d626cb720763061da0a)Some other sources:  
http://redprogramming.com/Home.html  
http://www.red-by-example.org/

rebolek

[07:16](#msg5825705a818fbb8a63c28ccd)I’ve added some basic index for my articles: http://red.qyz.cz/

JacobGood1

[20:16](#msg58262708ec38b45556f5456d)I find the Red community to be far less cynical than pretty much any other programming community. I think that is because we are still a small group. Once it gets larger, I am sure it will normalize with the rest of the programming world =)

## Saturday 12nd November, 2016

redredwine

[15:29](#msg5827355031c5cbef43e8d23e)What is the best doc when it comes to explaining word as a symbol? I'm a little bit stumped :worried: on the use of word as a symbol , I was researching the rebol site (http://www.rebol.com/r3/docs/guide/code-words.html, http://www.rebol.com/docs/core23/rebolcore-16.html#section-3.10) and reading about it, but still not sure how to use that literal feature.

rebolek

[18:08](#msg58275a83e462097a303e202c)@redredwine take a look at this:

```
red>> a: 1
== 1
red>> o: object [a: "one"]
== make object! [
    a: "one"
]
red>> type? a
== integer!
red>> type? first [a]
== word!
red>> reduce [a]
== [1]
red>> block: [a]
== [a]
red>> append block first words-of o
== [a a]
red>> block
== [a a]
red>> reduce block
== [1 "one"]
```

[18:10](#msg58275b2188fa21d53c12a3df)I am going to write something about it to help people understand it, but don’t expect it today ;)

## Sunday 13th November, 2016

redredwine

[04:38](#msg5827ee6165485ebc678a8e08)Thanks @rebolek, it would be great if you could write soemthing, that would make it easier for a newbie. I'm trying to wrap my head around the sample you posted. I'm trying to understand, under what circumstances,would I need to use word as a symbol. what are the benefits of using word as a literal/symbol rather than using a word as a variable.

rebolek

[07:36](#msg5828181be462097a30413055)@redredwine Word is always a symbol. You need to evaluate it to get its value. And that value depends on context.

dsgeyser

[10:47](#msg582844b931c5cbef43ed24bf)

endo64

[14:07](#msg5828738945c9e3eb43314aae)redbin format spec is ready but `save/as redbin` is not I think, right?

JacobGood1

[15:17](#msg5828841fec38b45556f5804c)@redredwine  
with time you will understand, it can be hard to learn multiplication before addition

rebolek

[15:24](#msg582885a9fd9dc2742bbf2b7f)@endo64 AFAIK yes.

Senenmut

[15:42](#msg582889dcdf5ae966454f8cf3)EVOLVER 20 Bonus Points

dockimbel

[15:51](#msg58288c1ee462097a304321c5)@endo64 Correct. Saving hasn't been implemented yet, only loading. We plan to make a R/S implementation for it, but in the meantime, it wouldn't be difficult to make a quick implementation in pure Red, if someone is up to it.

## Tuesday 15th November, 2016

redredwine

[03:11](#msg582a7ce1e097df7575b1350c)Format What It Does

word Evaluates the word. This is the most natural and common way to write words. If the word holds a function, it will be evaluated. Otherwise, the value of the word will be returned.

word: Defines or sets the value of a word. It is given a new value. The value can be anything, including a function. See Setting Words below.

:word Gets the word's value, but doesn't evaluate it. This is useful for referring to functions and other data without evaluating them. See Getting Words below.

'word Treats the word as a symbol, but does not evaluate it. The word itself is the value.

[03:20](#msg582a7eec31c5cbef43f8aecc)the above comes from chapter 4 in the REbol core docs. I'm clear on the first 3 i.e word, word:, :word  
the 'word is the one that seems to be tripping me a little bit.

Also n chapter 4 of Rebol core docs it says "Words are used in two ways: as symbols or as variables." am clear with the variables part.  
anyway needs to go look for examples where the 'symbol/literal" is being used to really understand its full potential.

rebolek

[08:32](#msg582ac815ec698d3d289bb4c2)@redredwine  
You can set word to some value. This word then gets evaluated to that value:

```
red>> a: 1
== 1
red>> a
== 1
```

But the word does not get evaluated every time, for example in block (unless you want it):

```
red>> b: [a]
== [a]
red>> first b
== a
```

See? It’s still `a`, not `1`. To get `1`, you need to evaluate that word somehow, i.e. with `do`:

```
red>> do first b
== 1
```

`lit-word!` evaluates to `word!`, so it is very similar to above example. See:

```
red>> w: 'a
== a
red>> do w
== 1
```

DideC

[15:59](#msg582b30f931c5cbef43fc6fa6)@redredwine Word are often used as symbol.  
In parse dialects , `to`, `thru`, `collect`, `keep` and so on are just words, they have no value.  
In VID dialect, `origin`, `title`, `across`, `return` and so on are just words.  
In Draw dialect, `pen`, `box`, `circle`, `translate` are just words too.  
Not only in dialects, ie: `View/flags` optional argument is a word or a block! of words : `view/flags [text "test"] 'resize`.  
Need more examples ?

geekyi

[20:17](#msg582b6d3cc2f2cf727515ebc7)@redredwine It's useful for meta-programming and dialects

[20:18](#msg582b6d79bd2f135f1a20dd58)(all) Just for clarification, a `symbol` is the same as a `lit-word!` right?

[20:27](#msg582b6f9d31c5cbef43fdfa62)My understanding is that the `symbol` is same as the `'quoted` words in lisp and other languages with similar constructs. Using

```
`back-tics`
```

..to denote code is another example of \*referring to a symbol without evaluating the code* inside gitter itself

Having such a construct makes it easier to do symbolic manipulation.  
A concrete example of symbolic manipulation is differentiation and integration.

[20:30](#msg582b705831c5cbef43fe002b)It might help reading up on quoting in other languages I think. Lisp has the same syntax, Factor uses `[ brackets with code ]`. Redbol seems to use both!

[20:35](#msg582b71a6c2f2cf727516132b)

```
red>> ? foreach

USAGE:
      foreach 'word series body
```

there is a `lit-word!`, `'word` which `foreach` does not evaluate, so you can use it in the body without defining it at first

[20:39](#msg582b726fe097df7575b6d9bc)

```
test: [word word: :word 'word]
```

There seems to be a slight difference in the evaluation models of Red and Rebol (REBOL/View 2.7.8.3.1)

[20:39](#msg582b729c88fa21d53c27c26f)

```
red>> collect [foreach thing test [keep type? thing]]
== [word! set-word! get-word! lit-word!]
```

JacobGood1

[20:40](#msg582b72a34c9177c45e313c53)it can be really hard to think about symbolic programming when most other programming languages don't have anything like it

geekyi

[20:41](#msg582b72e6c2f2cf7275161aee)Rebol:

```
>> collect [foreach thing test [keep type? thing]]
== [word! set-word! get-word! word!]
```

JacobGood1

[20:41](#msg582b730537fbab5354b90682)I suggest just programming in red, eventually, things will make sense… It's like speaking in a foreign language, it is best to immerse yourself instead of trying to understand each vocabulary word individually, every concept in a vacuum, every cultural nuance void of it's implications

## Wednesday 16th November, 2016

dsgeyser

[07:01](#msg582c0446e462097a30564f0a)So 'a (lit-word) like to, thru, are implemented as syntactic sugar?

[07:16](#msg582c07b3e097df7575b9d3e8)@JacobGood1 I second that. I tried to understand Rebol by studying Factor, Lisp, Logo, a bit of Self,etc. I picked up something here and there. But its like someone being used to another language and trying to adapt to Red. No need to introduce bad programming habits. Its seems to be easier for me to focus on general concepts. Dividing your attention just limits you. Rather stay focused on Red.

[07:43](#msg582c0e0fe097df7575b9f1c6)With concepts I mean 'Computer Science' terms, like for instance objects in general, all related to Red.

rebolek

[08:18](#msg582c1664d5990a176b99b15a)No, `lit-word!` is not a syntactic sugar.

dsgeyser

[09:10](#msg582c226831c5cbef43016926)@rebolek Example of syntactic sugar? Doc mentioned this wrt parse, if my recollection is correct.

rebolek

[09:11](#msg582c22a537fbab5354b92e0d)How is it syntactic sugar?

[09:16](#msg582c23e64c9177c45e3165f9)No, see. Let’s make some simple dialect:

```
red>> dialect: func [input] [parse input ['my 'simple 'dialect]]
== func [input][parse input ['my 'simple 'dialect]]
red>> dialect [my simple dialect]
== true
red>> my
*** Script Error: my has no value
*** Where: catch
red>> simple
*** Script Error: simple has no value
*** Where: catch
red>> dialect
*** Script Error: dialect is missing its input argument
*** Where: dialect
```

In my simple dialect, words `my`, `simple` and `dialect` are just symbols, they hold no value. But my simple dialect can parse and understand them. Outside of my simple dialect, `my` and `simple` still hold no value, so they throw an error, when I try to evaluate them. OTOH `dialect`has value - function to parse my simple dialect. But not in the dialect itself, there it is just a symbol still.

dsgeyser

[09:47](#msg582c2b2631c5cbef43019f54)@rebolek Thanks. So a good consideration is to use lit-words sparingly, until fully understood.

rebolek

[09:48](#msg582c2b7b4c9177c45e3166e9)@dsgeyser That’s a good idea. And if you have some code in which you think you may use lit-words, just ask, I and others are willing to help.

dsgeyser

[09:55](#msg582c2d21c2f2cf727519d718)@rebolek lit-words and parse can be used in NLP?

rebolek

[09:56](#msg582c2d66715933bd5573a2db)Yes, you can use PARSE for natural language processing.

## Thursday 17th November, 2016

maximvl

[11:27](#msg582d940e88fa21d53c336040)@dsgeyser I see a lit-word in function arguments as mandatory quoting on the function side

[11:27](#msg582d942688fa21d53c3360c6)you can't do it in lisps (at least I'm not aware of ways of doing it)

[11:28](#msg582d944edf5ae966456bc7ce)so, you still can quote word as in lisps: `f 'a`, but `f` may already be made to quote it's arguments as it wants

[11:29](#msg582d94a1df5ae966456bc8d3)and quoted word is analogue to symbol in lisps, as a symbol it may have or have not any `symbol-value`

## Friday 25th November, 2016

virtualAlan

[03:02](#msg5837a9b689d179bf4dc08349)I did this just for fun, but it could be useful .... http://www.mycode4fun.co.uk/red-apps

## Monday 28th November, 2016

greggirwin

[19:11](#msg583c815d381827c24d90b6a6)Nice Alan! Thanks for posting.

## Thursday 1st December, 2016

Senenmut

[17:26](#msg58405d58444b3778767e15b1)Hi there.

[17:29](#msg58405de58255fe6b76f17a2b)I have a program here called NetMeter. That is a app to monitor the Internet Volume in MB and GB to see how much GB you have consumed. The limit is configured to 500MB , so every 500MB of alrady consumed internet volume you get a Message on the desktop.

[17:29](#msg58405e0516207f7b0ecdde1e)Does anyone know a program that can CUT the internet connection automatic IF the 500MB volume is reached ?

greggirwin

[17:34](#msg58405f1a89d179bf4deca577)It will be OS specific. I haven't done it, but `ifconfig` on \*nix and `netsh` on Windows?

Senenmut

[20:07](#msg584082fe8d65e3830ec63f19)Hello Gregg i am working on it. first : Networx second: Netlimiter , dont know if they work , i will try. Functions : if 150MB is reached , close all internet connections.

[20:12](#msg5840842616207f7b0eced596)i have a 5GB prepaid surf stick. Today i made an espresso during a short break. Looking on my netmeter and have seen : 1 GB consumption for nothing. Just blown in the space. ha ha

## Friday 2nd December, 2016

Senenmut

[18:07](#msg5841b872bc32453c288023f6)Hello again Gregg , i got it.

[18:21](#msg5841bbc00da034021b5dbb77)I have done the following steps : installing networx and have the sterjo firewall portable version on the desktop. In the sterjo firewall i make a new policy file and saved it under BLOCKER. Then the only rule i put in is to block all communication. If you start the exe of this portable program then the firewall blocks ALL. Now i configure the networx traffic tool that is already normal installed in the option "start external program if an amount of 150 MB is reached". I take here the option more than 5MB in one minute. Now when you are online in the net and a permanent download is running that you are not aware of , the Networx starting the firewall ans boooooooomm. ALL traffic is down. Yes that works. Yes the two programs are freeware. This is a way to make a denied limit of internet consumtion. Over and out.

[19:01](#msg5841c516f666c5a138c01a72)Configuration is 10MB per one Minute. Surfing on the desktop computer works normal. If a permanent download occurs itself , the firewall stops ALL traffic. This information isnt about programming but useful for everyone who is surfing with a volume limit. See you in programming matters again. Menno

Respectech

[22:14](#msg5841f250b4ffd59e38d99b8e)Where would I find out when serial port support is planned for Red?

geekyi

[22:21](#msg5841f3d66b32e870497acd94)@Respectech https://trello.com/c/BW1SPeOU/48-i-o-support ?

## Saturday 3th December, 2016

dockimbel

[04:24](#msg5842490f44f3e83528cf42f0)@Respectech Hi Bo, serial port will come with IO support, and will support async mode. It should be possible to implement it right now (in sync mode), using Red/System.

koba-yu

[15:07](#msg5842dfab1eb3d648694ecce3)Hello, may I ask a question here?

How can I convert "c-string!" to "string!"?  
I checked the red repository and found that "red/runtime/datatypes/string.reds" has string/rs-load function.  
I guessed it may be the function I need. However, when I compiled the code with using rs-load function,  
a compile error reported that function was not found.  
(even though string/rs-head function that is also defined in string.reds can be compiled.)

dockimbel

[16:52](#msg5842f8551eb3d648694f47b0)@koba-yu A `c-string!` is just a zero-terminated array of bytes defined in Red/System. A `string!` is a Red series representing an array of Unicode codepoints. To do the conversion (supposing your c-string is UTF-8 encoded, you can use in your Red/System code:

```
str: string/load <c-string> <size> UTF-8
```

where is the size in bytes of your c-string (excluding terminal zero).

greggirwin

[19:00](#msg58431637b4ffd59e38deae16)@Mennohexo, thanks for posting your solution.

## Sunday 4th December, 2016

koba-yu

[00:27](#msg584363041eb3d64869514ff8)@dockimbel  
Thank you very much for your reply!  
I tried to use string/load, with this code: \[string-conversion-test.red](https://gist.github.com/koba-yu/720400b99b95b20b9a195603f9149219)  
but compilation error raised:

```
*** Compilation Error: undefined symbol: red/string/load  
*** in file: %/X/temp/tesseract/tesseract-api.red  
*** in function: exec/ctx355~get-utf8-text  
*** at line: 326  
*** near: [string/load ret (length? ret + 1) UTF-8
```

Does it require any #include or do I have any misunderstanding?

Also, I tried to make the code of Red/System version: \[string-conversion-test.reds](https://gist.github.com/koba-yu/f07eba2165b6920c1333611ebe65f45d)  
this one raises error :

```
undefined symbol: routine
```

For this error, I guess I have some misunderstanding about Red/System and routine.

typeless

[00:39](#msg584365dd90f847041bf4e5a8)Hi, is `#!/usr/local/bin/red` scripting not supported currently?

qtxie

[00:48](#msg584367c57e2af9d12299f9cb)@koba-yu Try to add `-u` when compiling it. Check \[here](https://github.com/red/red/blob/master/usage.txt) for detail.

typeless

[00:49](#msg5843681c1eb3d648695165c6)@qtxie Thanks.

koba-yu

[00:57](#msg58436a156b32e87049818731)@qtxie I tried it but I get the same error..  
But thank you! I keep in mind about the opition and will try if something seems wrong!

qtxie

[01:07](#msg58436c4c03554185047a03dd)@koba-yu Seems `-u` doesn't `clear` the old libRedRT files. :worried: The solution is manually clear it first, then use `-u` to compile it.

koba-yu

[01:09](#msg58436cc40da034021b65a0b1)@qtxie Thank you, I was just trying it now, and seems I could compile it!  
I think I can progress. Thank you very much!

qtxie

[01:10](#msg58436ced03554185047a03e0)Another way to check if it's libRedRT's issue, is to use `release mode` (`-r`). If it can be compiled in release mode, then something is wrong in libRedRT.

koba-yu

[01:12](#msg58436d6044f3e83528d49828)@qtxie Thanks, I will try it that way too, when I have some kinds of similar problem.

ludx

[02:16](#msg58437c69f666c5a138c83207)@qtxie how text in `area` could be wrapped? e.g. I use

```
view layout [
    a: area 200x200 "Here's some text, lots and lots of text. Here's some text, lots and lots of text."
        para[
	wrap?: on
        ]
    return
    button "wrap？" [print a/para/wrap?]
]
```

or

```
view layout [area 200x200 "Here's some text, lots and lots of text. Here's some text, lots and lots of text." wrap]
```

but did not work.

qtxie

[03:46](#msg584391ae9750c95b4f895b43)@ludx It should work. I think it's a bug.

koba-yu

[04:10](#msg58439731b4ffd59e38e10577)Seems this code behaves differently between on GUI console and complied exe:

```
Red [
    Title: "main"
    File: "%main.red"
]

test-context!: context [
    inner: context [
        get-ret: func [return: [integer!]][
            0
        ]
    ]
    do-test: func [/local ret] [     
        ret: inner/get-ret   
        unless ret = 0 [
            throw rejoin ["error. value of ret is " ret] 
        ]
    ]
]

test-con: make test-context! [] 
test-con/do-test
```

When I execute it on GUI console, it returns none.(I think this is correct.)  
On compiled, it shows the error: "error. value of ret is 0".  
I feel it's weird because if ret is 0, it should not go into throw block.  
I am afraid compilation is not correct, so may I open the issue?  
(by the way, when I replace "unless" with "if", it also behaves oppositely when compiled.)

typeless

[07:09](#msg5843c124bc32453c2889a4f6)@qtxie Hey, maybe I misunderstood you, did you mean I should type "#!/usr/bin/env red -u"?

geekyi

[08:50](#msg5843d8e66b32e87049834aef)@typeless @qtxie was answering another person. Although, I don't find any reason for that to not work. Any details? (platform, code, etc) Is the red binary in the location you specify?

[09:25](#msg5843e11b6b32e87049836aac)@typeless btw, I'm not on unix, so haven't actually tested it out

maximvl

[10:09](#msg5843eb480da034021b6794cf)hey guys, how should one install `libcurl.so.4` on linux host to run Red?

dockimbel

[10:09](#msg5843eb6af666c5a138c9fe74)@maximvl Have you looked at the bottom of the Download page for instructions?

maximvl

[10:10](#msg5843eb7eb4ffd59e38e248c8)probably not )

[10:12](#msg5843ebf190f847041bf70102)@dockimbel thanks, I was going to suggest to add these instructions on website =)

geekyi

[10:25](#msg5843ef1af666c5a138ca0e1c)@typeless Didn't notice the issue you opened..so it was a missing `Red[]` header

## Friday 9th December, 2016

9214

[00:52](#msg584a00650da034021b887ed0)Howdy guys, I'm poking around with Rebol right now and have a couple of newbie questions:

Is there a better way to "collect" a series of values?

```
sum: 0
foreach  i [1 2 3] [sum: sum + i]

product: 0
foreach i [1 2 3] [product: product * i]
```

and et cetera. What I want basically is something like `foldr + [1 2 3]`. Of course I can build simple function for this, but I wonder if it can be done in some tricky Rebol-way with basic language constructs?

I can't wrap my head around this one here:

```
print repeat i 10 [if i = 5 [break/return i]] ; >> 5
print for i 1 10 1 [if i = 5 [break/return i]] ; >> none
```

why `for` returns `none`, what I'm missing?

How can I break from multiple nested loops at one time?

```
print for i 1 5 1 [
    for j 1 5 1 [
        if "whatever" [break from j-loop AND from i-loop, while returning something to print]
    ]
]
```

I've found Rebol documentation to be really scarse :(  
Any suggestions, except for Nick's guides and rebol dot com books/resources?

Finally, some quote by memory:  
&gt; Truly, a holy programming language is a homoiconic one.  
&gt; Whenever God speaks to a man, he uses Lisp with inline Assembly.

And that's what Red is, huh? ;) I'm so excited to find such a gem.

Thanks in advance!

[00:54](#msg584a00caf666c5a138ec2b18)whoops, I'm bad at formatting

[00:57](#msg584a016a0da034021b88839d)fixed

[02:31](#msg584a1786be9d43bc6338c577)Also, I've found what preface ain't working in Red like it does in Rebol:

```
text that appears before the header is called the preface and is ignored during evaluation.
REBOL []
1 + 2
```

```

```

text that appears before the header is called the preface and is ignored during evaluation.  
Red \[]  
1 + 2

````
```
*** Script Error: text has no value
*** Where: do
````

Even if I enclose script in square brackets, it still produce this error. Bug or feature? Sure I can enclose preface in quotes or curly braces, but still.

Ah, and one more question about Red/Rebol header - it's free-formatted as far as I know, but which fields are reserved and possibly can be used as metadata for compiled executable (Author, Date, Version, Language, etc)?

By the way, is it possible to change app icon of compiled Red script?

Thanks again!

dockimbel

[07:44](#msg584a60e8be9d43bc633a0e5d)@9214 Welcome! No built-in HOF in Rebol, though, they can be trivially implemented in a couple lines of code (as you figured out yourself). Red will provide common built-in HOF, most probably next year.

[07:45](#msg584a6135c29531ac5d3df3f2)&gt; why for returns none, what I'm missing?

Looks like a bug in Rebol's `for`.

9214

[07:46](#msg584a6153f666c5a138edd5d0)dang!

dockimbel

[07:46](#msg584a6172f666c5a138edd5ef)&gt; How can I break from multiple nested loops at one time?

Use exceptions, see`throw`and `catch` in the Rebol docs.

[07:48](#msg584a61e828d755bf14e2c496)&gt; Any suggestions, except for Nick's guides and rebol dot com books/resources?

The \[Rebol/Core manual](http://www.rebol.com/docs/core23/rebolcore.html) remains the go-to documentation, even if it's not 100% complete. Don't miss its \[updates](http://www.rebol.com/docs/changes.html), and especially \[this one](http://www.rebol.com/docs/changes-2-5.html).

[07:52](#msg584a62c0b4ffd59e3806b22b)Indeed, Red could fit that definition. ;-)

[07:53](#msg584a6312be9d43bc633a196a)For the text preceeding the Red header, I made a fix recently for that, are you using the stable version or the latest automated build from master branch? If it's still not working properly, please open a ticket about it.

9214

[07:55](#msg584a636abe9d43bc633a1b4f)I'm using 0.6.1, no worries

dockimbel

[07:56](#msg584a6396f666c5a138ede1b9)&gt; Ah, and one more question about Red/Rebol header - it's free-formatted as far as I know, but which fields are reserved and possibly can be used as metadata for compiled executable (Author, Date, Version, Language, etc)?

From Rebol console: `help system/standard/script`, from Red'one: `help system/standard/header` (though the Red one is not complete yet).

[07:56](#msg584a63bef666c5a138ede273)@greggirwin has implemented many HOF functions for Rebol, I let him provide you with the link to his library.

[07:58](#msg584a640ef666c5a138ede53f)Feel free to ask here any question about Red (though we can also answer questions about Rebol).

9214

[08:01](#msg584a64f4b4ffd59e3806ba09)Thank you, Nenad! Rebol/Core updates is a spot-on. Keep it up and cheers for your work.

Currently I'm solving Project Euler problems in Red, so, I think I'll come up with my own mezzanines (that's what user-defined functions in Rebol are called?) and HOFs... ah, the joy of poking around with lovely language &lt;3

dockimbel

[09:08](#msg584a74a1bb7d528222d72f8b)Mezzanines: yes, that's the term used in Rebol world. Keep us posted about your progress on solving Project Euler's challenges. Have fun! ;-)

9214

[09:19](#msg584a772fb4ffd59e38071c75)hm, Rebol users are Rebolers, and Red users are ..?

pekr

[09:20](#msg584a7748f666c5a138ee5262)Redders :-)

dockimbel

[09:20](#msg584a7765b4ffd59e38071d94)No official name yet, you are welcome to propose some (IIRC, @greggirwin offered some good ones).

[09:21](#msg584a7783bb7d528222d7417b)Reducers ;-)

9214

[09:21](#msg584a7789b4ffd59e38071e7d)neat!

[09:56](#msg584a7fcdc29531ac5d3ea769)@dockimbel I've checked Red preface on automated build from red-lang.org, same thing:

```
preface should be here

Red []

14 + (14 * 2)
```

```
*** Script Error: preface has no value
*** Where: do
```

Should I fill the ticket? Any additional information needed?

dockimbel

[10:09](#msg584a82f7be9d43bc633ad226)@9214 So you have that code in a file and you run it from the console with a `do %`, right?

9214

[10:10](#msg584a830cc29531ac5d3eb983)correct

dockimbel

[10:10](#msg584a8317f666c5a138ee8fee)Then, please open a ticket for it.

9214

[10:12](#msg584a837b28d755bf14e36b00)uh-oh, first github ticket, when a boy becames a man :man:

dockimbel

[10:12](#msg584a83a428d755bf14e36c83)We all went through the same path, soon you'll make your first PR. ;-)

[10:50](#msg584a8c891eb3d6486978db5c)@9214  
&gt; By the way, is it possible to change app icon of compiled Red script?

It is, just provide a `Icon: %.ico` entry in your Red header (you need a new icon in .ICO format).

9214

[10:51](#msg584a8ccf1eb3d6486978dc65)ty Nenad

[11:42](#msg584a98b3bb7d528222d7f220)How could one specify that one argument should be of the same type as the other?  
Example:

```
for: function [
    'holder [word!]  
	start [any-type!]
    bump [same as 'start' type then function is actually in use (could be integer! for example)]
    step 	[same as above]
    block [block!]
    ] [
    set holder start
    while [(get holder) <= bump] [
        do block
        set holder (get holder) + step
	]
]
```

maximvl

[11:54](#msg584a9b62bb7d528222d8007f)I would do it differently: abstract comparation and updating steps to give caller control over them:  
`for x 0 [x < 10] [x + 1] [...]`

[11:55](#msg584a9b9cbb7d528222d800eb)then you can do things like  
`for b copy [] [5 < length? b] [] [ ; append things to b ]`

[11:56](#msg584a9c0a0da034021b8b414b)then you don't need to check same types and you can do all kinds of loops

9214

[11:59](#msg584a9ca5bb7d528222d80623)Nice one! But still, is it possible to do such thing in Red?

maximvl

[12:00](#msg584a9cf628d755bf14e3ee6f)from here: http://static.red-lang.org/red-system-specs-light.html#section-6.1  
&gt;&lt;datatype&gt; : integer! | byte! | logic! | pointer! \[integer! | byte!] |  
float! | float32! | c-string! | struct! \[&lt;members&gt;]

[12:01](#msg584a9d0dc29531ac5d3f4821)I would say it's not possible unless you use macros

9214

[12:02](#msg584a9d55be9d43bc633b5b33)high-level stuff, thank you

maximvl

[12:03](#msg584a9d86f666c5a138ef199d)@9214 do you call macros high-level stuff?

9214

[12:06](#msg584a9e380da034021b8b5250)well, I just didn't used them that much ;)

maximvl

[12:06](#msg584a9e550da034021b8b52b6)@9214 due to Redbol nature macros are pretty much functions

[12:07](#msg584a9e7bbe9d43bc633b5fa0)it is not something wild/complex/strange, nothing to be afraid of

9214

[12:08](#msg584a9ebd1eb3d64869793798)\[LOL](http://letoverlambda.com/)

maximvl

[12:09](#msg584a9ef0c29531ac5d3f5103)lol is great thing, but it has a lot of overwhelming macro usages

9214

[12:09](#msg584a9f0828d755bf14e3fe3d)they're basically functions which "expands" at compilation time?

maximvl

[12:10](#msg584a9f3fb4ffd59e3807f316)yes, however usual functions do not "expand", this can lead to confusion

[12:11](#msg584a9f58b4ffd59e3807f387)macros are functions which take code and return code

9214

[12:11](#msg584a9f7cb4ffd59e3807f3df)and since in Red code = data ... \*wink-wink*

maximvl

[12:13](#msg584a9fcf28d755bf14e401fb)this makes things a lot easier, yes, but whole idea is not tied to a language, you can do this with any of them, the amount of work is different

[12:17](#msg584aa0eb28d755bf14e40978)@9214

```
Red []

#macro same-type: func [spec /local tmp] [
   forall spec [
      if block? spec/1 [
         either spec/1/1 = 'same! [
            ; replace with current spec type
            spec/1: copy tmp
            ] [
            ; save current spec type
            tmp: spec/1
         ]
      ]
   ]
   head spec
]

probe [same-type [a [integer!] b [same!]]]
```

prints:  
&gt;\[a \[integer!] b \[integer!]]

[12:19](#msg584aa13a28d755bf14e40b48)since function spec is just a block, as most of things in Redbol are, you can manipulate it at will

[12:19](#msg584aa15c0da034021b8b63a2)so ,`same-type` just loops over it and looks for special `same!` type

[12:20](#msg584aa1a31eb3d64869794794)I think you understand what happens next, so `#macro` just says compiler to run this function before compiling

[12:21](#msg584aa1c4b4ffd59e3807fff4)and substitute `same-type` call with it's result, which is called `expansion`

9214

[12:24](#msg584aa29abb7d528222d8292a)got that, ty

maximvl

[12:26](#msg584aa2e70da034021b8b6bb0)@9214 there is a small bug in my code - in this particular case return should be wrapped into one more block

[12:26](#msg584aa2fbb4ffd59e380808b2)then you can use it like this:

```
Red []

#macro same-type: func [spec /local tmp] [
   forall spec [
      if block? spec/1 [
         either spec/1/1 = 'same! [
            ; replace with current spec type
            spec/1: copy tmp
            ] [
            ; save current spec type
            tmp: spec/1
         ]
      ]
   ]
   reduce [head spec]
]

f: func same-type [a [integer!] b [same!]] [
   probe [a b]
]

probe spec-of :f
```

[12:26](#msg584aa3061eb3d6486979522a)&gt;\[a \[integer!] b \[integer!]]

[12:29](#msg584aa3c11eb3d648697955ed)@9214 exercise for you is to add new type, it should work like this:

```
[a [integer!] b [string!] c [same-as a]] ;; => [a [integer!] b [string!] c [integer!]]
```

[12:30](#msg584aa3c928d755bf14e417ba):P

9214

[12:30](#msg584aa3e0bb7d528222d83002):muscle:

[12:34](#msg584aa4c8be9d43bc633b8d8d)is `func` with `/local` preferred over `function`?

rebolek

[12:35](#msg584aa50f03554185047aea26)@9214 That depends on you user case.

maximvl

[12:35](#msg584aa51cbb7d528222d83748)very good question, I prefer `func` since it's shorter to type, but then typing `/local` doesn't make difference

rebolek

[12:35](#msg584aa5229ce5147013cd0a39)`function` is usually good enough.

9214

[12:36](#msg584aa540c29531ac5d3f75f6)IMO it's too verbose to have two constructs for one thing

maximvl

[12:36](#msg584aa54cf666c5a138ef4a09)@rebolek what are the cases for both of them?

rebolek

[12:36](#msg584aa5509750c95b4f8a40d5)But there may be some cases where `function` cannot catch all your local words.

[12:37](#msg584aa57b9750c95b4f8a40d7)@maximvl It’s not the cases for both of them, it’s where `function` can leak words.

maximvl

[12:37](#msg584aa59128d755bf14e41fd1)I see, so just use `func` and don't worry :)

9214

[12:38](#msg584aa5b00da034021b8b7a0e)use `func` and have `fun`

maximvl

[12:38](#msg584aa5b2bb7d528222d83b64)it's also more verbose, so you know all local words upfront when reading the source code

geekyi

[12:39](#msg584aa5fc1eb3d64869796366)@9214 `function` is just a high level wrapper over `func`; If `func` works for you then no problem there

rebolek

[12:40](#msg584aa62203554185047aea3e)Here’s one example:

```
red>> f: function [x][parse x [set y string!]]
== func [x][parse x [set y string!]]
red>> f ["asdf"]
== true
red>> y
== "asdf"
```

maximvl

[12:40](#msg584aa6361eb3d64869796465)

```
red>> f: function [] [a: 1 b: 2]
== func [/local a b][a: 1 b: 2]
```

[12:40](#msg584aa63a1eb3d64869796479)pretty much clear

rebolek

[12:40](#msg584aa65203554185047aea47)@maximvl Yes, `function` is good enough IMO in most of cases.

geekyi

[12:40](#msg584aa657be9d43bc633b9555)C-C-C combo

9214

[12:40](#msg584aa65bf666c5a138ef4ee3)masaka!

rebolek

[12:41](#msg584aa65d03554185047aea4c)It makes things easier.

maximvl

[12:42](#msg584aa69bc29531ac5d3f7dc3)@rebolek interesting, I think it's easier and better to use `func` to get used to specify all local words

[12:43](#msg584aa6d5bb7d528222d84014)I would say `function` creates unnecessary illusion of scope

[12:43](#msg584aa7021eb3d648697967ce)which was confusing, at least for me, in the beginning

rebolek

[12:44](#msg584aa7157e2af9d1229af016)@maximvl I was used to specify all my local words since I started using Rebol. But if I changed something in the code, added some new word, I usually forgot to add it to local words.

[12:44](#msg584aa7259750c95b4f8a410a)So `funct(ion)` was a big improvement IMO.

9214

[12:44](#msg584aa7381eb3d648697969e2)@rebolek yes, that's usually the case

rebolek

[12:46](#msg584aa7b17e2af9d1229af01f)Also, I love function constructors. I think that we should have more of them.

[12:47](#msg584aa7c69750c95b4f8a411c)They can make your code more safer.

9214

[12:47](#msg584aa7dbbb7d528222d8461a)`func`, `function`, `do`, `does`, `routine` ... ?

rebolek

[12:47](#msg584aa7fd9ce5147013cd0acf)@9214 not just the built-in ones, but custom constructors. See http://red.qyz.cz/dependent-types.html

[12:48](#msg584aa8259ce5147013cd0ad5)BTW, `do` does not belong there. `has` does.

[12:48](#msg584aa8349ce5147013cd0ae4)Also `routine` is special case.

9214

[13:35](#msg584ab32db4ffd59e38086a91)@maximvl I'm stuck :(

```
Red []

#macro same-type-as: function [spec] [
	forall spec [
		if block? spec/1 and spec/1/1 = 'same-as! [
				type: select head copy spec spec/1/2
				poke spec 1 reduce [type]
		]
	]
	
	reduce [head spec]
]

f: func same-type-as [a [integer!] b [string!] c [same-as! a] d [same-as! b] e [same-as! c]] [
	probe [a b c d e]
]

probe spec-of :f
```

```
*** Script Error: path spec/1/1 is not valid for word! type
*** Where: =
```

maximvl

[13:39](#msg584ab4200da034021b8bc9bf)interesting

[13:40](#msg584ab46bb4ffd59e38087147)

```
red>> false and (print "hi" false)
hi
== false
```

[13:41](#msg584ab482b4ffd59e38087204)@9214 it seems Red doesn't have short-circuit evaluation on `and`, `or` words

9214

[13:41](#msg584ab496be9d43bc633beae9)use `all` ?

maximvl

[13:41](#msg584ab4a7c29531ac5d3fce94)I didn't run into this problem because I had two separate ifs ;)

[13:42](#msg584ab4cbbe9d43bc633bec14)

```
red>> all [false (print "hi" false)]
== none
```

[13:42](#msg584ab4d4be9d43bc633bec46)@9214 yep, `all` looks good here

9214

[13:43](#msg584ab4ffb4ffd59e3808745c)sigh

```
Red []

#macro same-type-as: function [spec] [
	forall spec [
		if all [block? spec/1 spec/1/1 = 'same-as!] [
				type: select (head copy spec) spec/1/2
				poke spec 1 reduce [type]
		]
	]
	
	reduce [head spec]
]

f: func same-type-as [a [integer!] b [string!] c [same-as! a] d [same-as! b] e [same-as! c]] [
	probe [a b c d e]
]

probe spec-of :f
```

```
*** Script Error: invalid type specifier: none
*** Where: func
```

maximvl

[13:44](#msg584ab5300da034021b8bcfd9)try to run just `same-type-as [a [integer!] b [string!] c [same-as! a] d [same-as! b] e [same-as! c]]`

[13:44](#msg584ab543bb7d528222d892fa)looks like it works, but outputs something that `func` doesn't like

9214

[13:45](#msg584ab561bb7d528222d8936f)

```
[a [integer!] b [string!] c [none] d [none] e [none]]
```

[13:45](#msg584ab573b4ffd59e380876a3)indeed! `poking` act unexpected

maximvl

[13:45](#msg584ab576b4ffd59e380876ad)okey, I can see three things to be improved here ;)

9214

[13:45](#msg584ab581c29531ac5d3fd343):D

maximvl

[13:46](#msg584ab5c7c29531ac5d3fd52b)@9214 just to be sure, you can get help for all words/functions in Repl, eg `help poke`

9214

[13:47](#msg584ab5e9f666c5a138efa532)I think the problem is in `type` setting

[13:47](#msg584ab5f2c29531ac5d3fd5c9)it sets to `none` before `poking`

[13:49](#msg584ab654be9d43bc633bf443)

```
[a [integer!] b [string!] c [[integer!]] d [[string!]] e [[[integer!]]]]
```

[13:49](#msg584ab6700da034021b8bd5d8)can't remember how to get rid out of brackets

maximvl

[13:50](#msg584ab6881eb3d6486979c317)good, try to find out where you create block layers

9214

[13:50](#msg584ab6a4bb7d528222d89bcf)

```
[a [integer!] b [string!] c [integer!] d [string!] e [integer!]]
```

ta-daaaaa! :confetti\_ball:

maximvl

[13:51](#msg584ab6e91eb3d6486979c559)great! show us the final version :)

9214

[13:52](#msg584ab710f666c5a138efab4a)

```
Red []

#macro same-type-as: function [spec] [
	forall spec [
		if all [block? spec/1 spec/1/1 = 'same-as!] [
				type: select head copy head spec spec/1/2
				poke spec 1 reduce type
		]
	]
	
	reduce [head spec]
]

f: func same-type-as [a [integer!] b [string!] c [same-as! a] d [same-as! b] e [same-as! c]] [
	probe [a b c d e]
]

probe spec-of  :f
```

maximvl

[13:54](#msg584ab77ff666c5a138efad97)@9214 I would check one thing - that `copy`, it feels unnecessary here, since you assign reduced value in the end

9214

[13:54](#msg584ab7a4be9d43bc633bfd48)`forall` doesn't mutate series?

maximvl

[13:54](#msg584ab7abbe9d43bc633bfd52)nope

[13:56](#msg584ab807c29531ac5d3fe19c)to understand how `forall` works you need a good understanding of `series!`

[13:57](#msg584ab8381eb3d6486979cff1)@9214 this whole documentation applies to Red: http://www.rebol.com/docs/core23/rebolcore-6.html

9214

[13:57](#msg584ab839f666c5a138efb169)I remember from Rebol/Core docs that some of `for`-functions mutate series and you need to `head` them

maximvl

[13:58](#msg584ab8730da034021b8be4d3)ah, ok, depends on how you define "mutate"

[13:58](#msg584ab8850da034021b8be53c)I would say that just moving index around is not mutation

9214

[13:58](#msg584ab8911eb3d6486979d267)you're right

[13:59](#msg584ab8c7b4ffd59e3808891b)

```
Red []

#macro same-type-as: function [spec] [
	forall spec [
		if all [block? spec/1 spec/1/1 = 'same-as!] [
				poke spec 1 select head spec spec/1/2
		]
	]
	
	reduce [head spec]
]

f: func same-type-as [a [integer!] b [string!] c [same-as! a] d [same-as! b] e [same-as! c]] [
	probe [a b c d e]
]

probe spec-of :f
```

maximvl

[14:00](#msg584ab90428d755bf14e48f7b)very short and nice, congratz :clap:

[14:01](#msg584ab931f666c5a138efb667)now you can return to your loop

[14:02](#msg584ab967be9d43bc633c07d8)be sure to notice what you did - you added completely new feature to the language

9214

[14:02](#msg584ab985be9d43bc633c0846)thank you for your mentoring  
now, where's my wizard hat... :tada:

[14:03](#msg584ab99bbb7d528222d8ad0e)indeed, but it's quite hard to debug a macro

maximvl

[14:03](#msg584ab9a6bb7d528222d8ad29)and this is something that differs Redbol from many other languages

[14:03](#msg584ab9c70da034021b8bebc1)&gt;but it's quite hard to debug a macro

write few and let things settle in your head, it will be a no-brainer soon

9214

[14:04](#msg584ab9e8c29531ac5d3febc1)Can't get why we need `reduce [head spec]` at the end

maximvl

[14:04](#msg584ab9fb28d755bf14e495e5)good question, let me show

[14:05](#msg584aba3c0da034021b8bee17)@9214 try this code:

```
Red []

#macro expand-me: func [] [
   [1 2 3]
]

probe [a b expand-me c]
```

9214

[14:07](#msg584abab40da034021b8bf0f2)compiler substitute any occurence of `expand-me` with `[1 2 3]` series at compile-time?

maximvl

[14:08](#msg584abac00da034021b8bf127)so, what will be the output?

9214

[14:08](#msg584abacec29531ac5d3ff74f)`[a b 1 2 3 c]`

[14:08](#msg584abae1bb7d528222d8b38c)hm, why not `[a b [1 2 3] c]`?

maximvl

[14:09](#msg584abb1a28d755bf14e49f8b)exactly, this is how it is done in Red - it requires macro function to return a `block!` and then inserts it into parent block

9214

[14:10](#msg584abb4fbe9d43bc633c13fb)since code = data, it's just a matter of perspective?

maximvl

[14:10](#msg584abb52bb7d528222d8baa9)this is why I did mistake in my first try - because in Common Lisp macro would insert whole thing, and you need to tell it specifically to insert inside

[14:10](#msg584abb710da034021b8bfaeb)@9214 this is just decision made by Red authors

9214

[14:11](#msg584abb74bb7d528222d8bb49)it make sence, since whole Red script is just a block

maximvl

[14:11](#msg584abb8df666c5a138efc3e0)and, what will happen if you just return `head spec` in your macro?

9214

[14:11](#msg584abb96b4ffd59e38089f0d)and if I want to insert `[1 2 3]` i need to re-define macro with `[[1 2 3]]` ?

maximvl

[14:11](#msg584abba028d755bf14e4a2e9)exactly

9214

[14:12](#msg584abbcf1eb3d6486979e7bd)it will return all arguments and types as-is, not enclosed in block?

[14:13](#msg584abc01be9d43bc633c1849)I get why we need `[head spec]`, I don't get `reduce` purpose. What should be reduced?

maximvl

[14:13](#msg584abc14be9d43bc633c18b3)yep, it will insert them into top-level block, resulting in something like  
`f: func a [integer!] b [string!] c [integer!] d [string!] e [integer!] []`

[14:13](#msg584abc27b4ffd59e3808a2ad)which is where you will get an error at some point

[14:14](#msg584abc430da034021b8bff2b)@9214 do you know what `reduce` does?

9214

[14:14](#msg584abc5428d755bf14e4a64d)evaluates all expressions in a block and return that block

maximvl

[14:15](#msg584abc751eb3d6486979ebb4)because block are not evaluated by default, so you can't return `[head spec]`

9214

[14:15](#msg584abc8fc29531ac5d4000fa)jeez!

[14:15](#msg584abc97be9d43bc633c1bc6)how could I miss that

maximvl

[14:16](#msg584abcc90da034021b8c0208)I hope everything makes sense now =)

9214

[14:16](#msg584abcd028d755bf14e4a948)indeed

[14:18](#msg584abd1abe9d43bc633c1f22)is it possible to get through LOL with Red macros?

maximvl

[14:19](#msg584abd61c29531ac5d400703)hm, I don't know all things they are doing in LOL, but I would say it is possible, and much more important - it must be very exciting!

[14:20](#msg584abdae0da034021b8c069a)there are so called reader-macros in CL, but Red has equally powerful pattern-matching ones

9214

[14:21](#msg584abddaf666c5a138efd1bd)this one which I just coded?

maximvl

[14:22](#msg584abe0dbe9d43bc633c242c)nope, you've coded a named one, pattern-matching don't have names, they are invoked by the reader when it reads something macros is set to replace =)

9214

[14:23](#msg584abe791eb3d6486979f798)`add 1 2` =&gt; `1 + 2`?

maximvl

[14:24](#msg584abeac0da034021b8c0be9)@9214 check the latest post on Red's blog, it explains macros very good with examples etc: http://www.red-lang.org/2016/12/entering-world-of-macros.html

9214

[14:24](#msg584abeb8bb7d528222d8cfad)I will

maximvl

[14:27](#msg584abf5dc29531ac5d4014a0)@9214 if you find any complex/interesting macros in LOL feel free to post and discuss them here, it would be rather interesting to see how good the Red macro system is ;)

9214

[14:29](#msg584abfb1c29531ac5d40169c)Sure! Thanks Max, I appreciate your mentoring.

maximvl

[14:32](#msg584ac07dbb7d528222d8d9c6)you welcome, when I was exploring these fields, I faced a lot of push backs and hatred from people

[14:32](#msg584ac0940da034021b8c18e7)what's why I'm trying to show how easy and useful it can be

9214

[14:33](#msg584ac0bac29531ac5d401e03)so far Redbol community is very nice

[14:33](#msg584ac0cc28d755bf14e4bffe)first day in this chat and tons of joy

[14:34](#msg584ac0e0be9d43bc633c3487)gotta go, c ya!

maximvl

[14:34](#msg584ac0eab4ffd59e3808c2ac)have fun :)

dockimbel

[15:27](#msg584acd5fb4ffd59e38091424)@maximvl Thanks for helping a newcomer find his way through Red, that was an enjoyable reading. :+1:

geekyi

[18:07](#msg584af2c5b4ffd59e380a14fc)@9214 @maximvl It would be good to post your explorations as a blog series

greggirwin

[18:08](#msg584af30c28d755bf14e5fc1a)Great chat. Cool macro @9214. I'm going to keep that one for future reference. And really nice mentoring @maximvl.

[18:21](#msg584af63228d755bf14e60bc4)@9214, there might be an HOF or two in https://gist.github.com/greggirwin/d0412f0c3d8e1ce4dfe26afc643742f1, a fun experiment in https://gist.github.com/greggirwin/9fc085a8b6b2ca38f756e9285c389674, and I have a number of things like `foldr/accumulate` and `filter`. You'll find that Red allows you to think in different ways, and there is a lot of discussion about the design of even simple funcs. Ask away and you'll probably start good discussions.

[18:22](#msg584af651b4ffd59e380a2b37)Welcome to Red!

9214

[18:23](#msg584af69e0da034021b8d6515)@greggirwin thanks Gregg, I'll take a look at it

## Saturday 10th December, 2016

redredwine

[13:47](#msg584c0788b4ffd59e380eb0a6)Question about poke function

red&gt;&gt; s: "abcdefghijklmnop"  
\== "abcdefghijklmnop"

red&gt;&gt; poke s 3 #"C"  
\== #"C"

why do we need a "#" in there? why can we not use poke 3 "C" ?

[13:57](#msg584c09caf666c5a138f5fbc1)USAGE:  
poke series index value

DESCRIPTION:  
Replaces the series value at a given index, and returns the new value.  
poke is of type: action!

ARGUMENTS:  
series \[series! bitset! tuple!]  
index \[scalar! any-string! any-word! block! logic!]  
value \[any-type!] &lt;------ this \*\*any-type\** is a bit confusing, if poke cannot take a character value as is and need some special "# " in front of the character value.

DideC

[14:01](#msg584c0acac29531ac5d4642e0)Good to know: #"C" is a character value. "C" is a string of one character.

[14:04](#msg584c0b7628d755bf14ea7d11)With `poke` you change a value in a serie! so you have to use a value compatible with the serie type. If serie is any-string! you must use char! value (ence the #). For block! you can use any type AFAIK.

[14:05](#msg584c0bc4be9d43bc6342458d)If you want to change more than one value, use `change/part`.

redredwine

[14:30](#msg584c1190f666c5a138f61f84)thanks @DideC . how would you do change "abcdef" to "abZXef" with change/part ?  
I tried the following  
red&gt;&gt; c: "abcdef"  
\== "abcdef"  
red&gt;&gt; change/part c "ZX" 3  
\== "def"  
red&gt;&gt; c  
\== "ZXdef"

I lose the "a" in the original "abcdef"

[14:32](#msg584c120428d755bf14ea985f)sorry I mean how to change "abcdef" to "aZXdef" ?

dockimbel

[16:10](#msg584c28e90da034021b9278db)@redredwine You need to move the series offset to the right position first:

```
red>> c: "abcdef"
== "abcdef"
red>> change at c 2 "ZX"
== "def"
red>> c
== "aZXdef"
```

redredwine

[18:38](#msg584c4bb6b4ffd59e380ffcc6)thanks @dockimbel , this is cool :smile:

## Sunday 11st December, 2016

9214

[01:02](#msg584ca5aec29531ac5d49523c)Turns out it's really simple to create lazy sequences in Red:

```
Red []

fib: [0.0 1.0 [append fib fib/1 + fib/2 fib: next fib]]

force: function [seq] [
	promise: last seq
	remove back tail seq
	do promise
	append seq reduce [promise]
]

loop 10 [force fib] fib: head fib
; == [0 1 1 2 3 5 8 13 21 34 55 89 promise]
```

[01:31](#msg584cac560da034021b94b7d1)well, if you can call it that :D

[02:24](#msg584cb8f3bb7d528222e20c6d)Ha, looks like I've found clever way to `fold` series!

```
; first PE problem:
do collect/into [repeat i 999 [if any [i // 3 = 0 i // 5 = 0] [keep '+ keep i]]] [0]
```

dander

[06:01](#msg584ceba2aeb49008047252c1)@9214 those are both really cool!

greggirwin

[18:29](#msg584d9af028d755bf14f1138c)Indeed. Red is really fun to play with.

## Monday 12nd December, 2016

maximvl

[11:13](#msg584e8677c29531ac5d51bf69)

```
red>> 1 or 2
== 3
```

[11:14](#msg584e867a0da034021b9c77d4)wat?)

[11:14](#msg584e869db4ffd59e3819c150)

```
red>> 5 or 6
== 7
```

[11:15](#msg584e86b5f666c5a13800d01d)ah, it's not boolean `or`, no worries

rebolek

[11:15](#msg584e86c19ce5147013cd5979):)

PavelVozenilek

[17:31](#msg584eded8b4ffd59e381be80c)I have question about documentation: is there plan to write down something for the beginners? Not beginners in programming (I used C family language for 20 years) but for people who never ever heard about Rebol and would like to evaluate the language seriously. I imagine something like: integer is 32 bits/64 bits/unlimited, in memory it is stored natively/boxed/as an object. Here's compilable example with integers, it should do this and that. And so on and on. Currently I can see either texts filled with jargon for the already initiated or shortest-program-ever tricks which are mystery for me. If the answer is "yes": is it in reality "it would be nice to have someday" or is there real intent and plan to create such documentation?

9214

[19:35](#msg584efc14f666c5a13803b591)I also want to see something in the vein of rust-lang docs

[19:38](#msg584efca1be9d43bc63501c4f)Rustonomicon vs. The Horror at Red Hook :D

maximvl

[20:01](#msg584f0229be9d43bc63504489)@PavelVozenilek this is the closest thing to what you are asking: http://static.red-lang.org/red-system-specs-light.html#section-4

[20:03](#msg584f029c0da034021b9f5187)it would be also nice to have other things you are asking, of course ;)

9214

[20:20](#msg584f0684aeb49008047d3588)Can someone experienced share his mindset regarding of writing Rebol/Red code? Since these languages are quite different, I wonder how seasoned Reducers solve problems and think in terms of language semantics.

rebolek

[20:25](#msg584f07c09750c95b4f8aba19)That’s hard to tell when most of the code I write is in Red ;)

9214

[20:30](#msg584f08f9f666c5a1380411a7)@rebolek any line of wisdom then? :)

rebolek

[20:34](#msg584f09d07e2af9d1229b5b97)@9214 Have fun and don’t be afraid =D

endo64

[21:14](#msg584f1339aeb49008047d9038)@9214 I think the best way is examining the scripts/functions written by gurus. I learnt a lot from mezz.s in Rebol mostly written by Carl S., Brain H., Ladislav, Gabriele's power-mezz, Henrik's VID Ext., DocKimble's Cheyyene/Uniserve etc.

dander

[21:19](#msg584f145df666c5a138045d86)@endo64 it would be great to see links to any of those if you have them

rebolek

[21:23](#msg584f15659ce5147013cd76ff)https://sourceforge.net/projects/rebol-power-mez/  
https://en.wikibooks.org/wiki/Rebol\_programming/Advanced/Bindology

[21:24](#msg584f158c9ce5147013cd7703)This is gives you nice overview http://www.rebol.com/docs/core23/rebolcore.html

endo64

[21:39](#msg584f192db4ffd59e381d7a58)Some more `bindology` documents:  
http://blog.revolucent.net/2009/07/deep-rebol-bindology.html  
http://www.pat665.free.fr/doc/bind.html

And see BrianH's answers on SO:  
http://stackoverflow.com/users/2016426/brianh

[21:42](#msg584f19e0f666c5a138047e2f)Most easiest way: open Rebol or Red console type `? function!` pick an interesting function (let's say `last`) then type `?? last` and see the source code:

```
last: func ["Returns the last value in a series" s [series!]][pick back tail s 1]
```

rebolek

[21:44](#msg584f1a3b9ce5147013cd7807)also, this is great resource with examples and similar functions http://www.rebol.com/docs/dictionary.html

endo64

[21:46](#msg584f1ab3bb7d528222ed6698)Ah yes, and of course these old but still useful Rebol docs:  
http://www.rebol.net/cookbook/  
http://www.rebol.com/oneliners.html

[21:49](#msg584f1b4ef666c5a138048bab)These two are also very good:  
http://www.codeconscious.com/rebol/  
http://blog.revolucent.net/

greggirwin

[21:51](#msg584f1be5aeb49008047dca3d)There are a lot of ways to think in Red. Learning low level guru tricks, details of binding, etc. are \*very* important for some people. Others can use Red effectively without knowing deep internals.

All Red users, IMO, need to understand the basics of how series work, how to manipulate them, and when/how/where values are evaluated.

As Bolek said, play and don't be afraid. Don't forget that Red is data and use those datatypes. Learn how to express your data with the most appropriate types.

And don't be afraid to ask questions here. The community is the "Great Redbol Optimizer" and it's really fun to see how different people solve problems or express solutions.

9214

[21:52](#msg584f1c1cf666c5a138049333)thanks guys, I appreciate that :)

greggirwin

[21:55](#msg584f1cc8bb7d528222ed759e)And because Red \*is* different, some things may not be obvious. Until you see a guru's answer. :^)

[21:57](#msg584f1d45c29531ac5d55a330)I've had a few big \*clicks* in my head through the years, as I understood Red/Rebol in a new way. But I still get little clicks all the time. Seeing Nenad's macro version of a `loop` dialect was one recent example.

dander

[22:38](#msg584f26e828d755bf14f8f0e8)Thanks for all the links!

[22:41](#msg584f27b1b4ffd59e381dd78b)speaking of data representation, I recently discovered that pair! type doesn't seem to work with float!s. I got the general impression from github issues that it should be supported eventually, but it wasn't clear to me on there.  
If that is not expected to be supported, is there another obvious way of doing it besides using a block or object?

## Tuesday 13th December, 2016

PavelVozenilek

[00:19](#msg584f3e96aeb49008047e9753)@maximvl Thanks, text like this ( http://static.red-lang.org/red-system-specs-light.html#section-4 ) is what I had in my mind.

[00:36](#msg584f429cf666c5a1380566b8)When I am here, one more question. Can Red engine be embedded? Naturally any code could be embedded with proper effort, so which description fits more the reality/near plans? (1) "Yes, it can be embedded. There's one big amalgamated C file plus one header, add them anywhere into the project and you are done. Many people did it w/o troubles. " (the SQLite way), or (2) "Yes, it can embedded. You just need to build static library from dozens of source files with a make tool which requires Python 2.6, copy handful of DLLs into system directory, populate several registries, create hidden configuration file in your $HOME, carefully modify localisation files in their proper place and it is ready. Please report the result, nobody had tried yet."

geekyi

[01:37](#msg584f50da0da034021ba0eee3)@PavelVozenilek regarding embedding, that's one of the goals of the recently introduced libred. I remember doc showing some code related to that

9214

[02:01](#msg584f5660c29531ac5d56d9e1)in `Rebol`

```
>> remove-each i [1 2] [even? i]
== [1]
```

in `Red`

```
red>> remove-each i [1 2] [even? i]
red>>
```

Is this intended? I think remove-each should return changed series.

PeterWAWood

[03:02](#msg584f64abaeb49008047f4fd9)@9214 It is a bug. Help states that

```
remove-each
```

returns the "removal count" but it doesn't return a value:

```
red>> type? remove-each i [1 2] [even? i]
== unset!
```

9214

[03:03](#msg584f64e6aeb49008047f509a)@PeterWAWood hm, should I fill the ticket?

PeterWAWood

[03:05](#msg584f658bf666c5a138060017)The behaviour of

```
remove-each
```

is consistent with Rebol3:

```
>> remove-each i [1 2] [even? i]
== 1
```

@dockimbel Clearly chose to follow the R3 approach. The rationale of this behaviour is probably documented somewhere in the R3 bug tracker.

[03:06](#msg584f659faeb49008047f5231)@9214 Yes, It would probably be best to open a ticket.

9214

[03:06](#msg584f65b3aeb49008047f52ce)alrighty then

[03:07](#msg584f65f5bb7d528222eee72c)@PeterWAWood in your example `remove-each` returns the only element left in a series?

PeterWAWood

[03:10](#msg584f6699c29531ac5d572244)@PavelVozenilek One big difference between languages like C and Red-like languages is typing. Data in C is untyped; variables are typed. Data in Red is strongly typed; words are "untyped" references to data values.

[03:11](#msg584f66dbbe9d43bc63527085)@9214 No, it returns a count of the number of elements removed. Here is a better example:

```
>> remove-each i [1 2 3 4] [even? i]
== 2
```

9214

[03:12](#msg584f67310da034021ba152af)@PeterWAWood so, in Rebol2 it returns series, and in Rebol3 it returns a count, right? In any case it should return something (IMO Rebol2 approach is more suitable)

PeterWAWood

[03:14](#msg584f67b2f666c5a1380611d0)@9214 Correct. I'm sure that there is a good reason for the change to returning the count.

[03:18](#msg584f687528d755bf14fa2d15)It seems that you are not alone in favouring the Rebol2 approach - \[Rebol3 bug report](http://curecode.org/rebol3/ticket.rsp?id=931&amp;cursor=6)

9214

[03:19](#msg584f68d00da034021ba15e1d)@PeterWAWood perhaps there should be a refinement, `/count` or something

[06:58](#msg584f9c0128d755bf14faf9b2)How could one use `func` as lambda in Red? Something like that:

```
((lambda (n) (+ n 1336) 1)

; => 1337
```

rebolek

[07:00](#msg584f9c7d7e2af9d1229b69be)@9214 It’s not something I would use, but here you go:

```
red>> do reduce [func [n][n + 1336] 1]
== 1337
```

9214

[07:02](#msg584f9d0c28d755bf14fafef6)@rebolek interesting, I should meditate more on `reduce` then

rebolek

[07:04](#msg584f9d797e2af9d1229b69de)`reduce` will evaluate each value, so in this case it will turn source of function to `function!`:

```
red>> block: [func [n][n + 1336] 1]
== [func [n] [n + 1336] 1]
red>> length? block
== 4
red>> reduced: reduce block
== [func [n][n + 1336] 1]
red>> length? reduced
== 2
red>> type? first reduced
== function!
```

[07:06](#msg584f9ddd9750c95b4f8ac8be)Then you just `do` that block, to evaluate it again. Or you can `reduce` it again, if you want (but the output will be bit different):

```
red>> reduce reduce [func [n][n + 1336] 1]
== [1337]
```

9214

[07:09](#msg584f9eaeb4ffd59e382008c0)@rebolek before `reduce` `func [n] [n + 1336]` is just a pile of words, but after evaluation with `reduce` it will be a `function!` object?

rebolek

[07:15](#msg584f9ff903554185047b657d)@9214 not a pile of words, but `[word! block! block!]`. Every value in Red has its datatype.

9214

[07:16](#msg584fa05b28d755bf14fb0e7d)@rebolek and `[word! block! block!]` become a `[function!]` because of `reduce`?

rebolek

[07:17](#msg584fa0789ce5147013cd83e0)Yes.

macmoebius

[07:17](#msg584fa0940da034021ba24e8c)@PavelVozenilek and other noobs like myself. just found a good, free book: http://www.lulu.com/shop/olivier-auverlot-and-peter-william-alfred-wood/rebol-a-programmers-guide/ebook/product-17515075.html . Red is a little diff'rent, but this'll help...

rebolek

[07:18](#msg584fa0de03554185047b6589)@9214 But only because first `word!`'s value is `func`. And when you evaluate `func` you get `native!` that turns two `block!`s into `function!`.

[07:19](#msg584fa0ef7e2af9d1229b6a3c)

```
red>> type? first block
== word!
red>> type? get first block
== native!
```

9214

[07:20](#msg584fa14af666c5a1380703cd)@rebolek very interesting, thank you!

rebolek

[07:20](#msg584fa14d9750c95b4f8ac8fb)We are used to say that `func` creates `function!`, but that’s just illusion, all functions are anonymous, it’s just that word `func` usually holds that value.

[07:21](#msg584fa18b7e2af9d1229b6a4f)@9214 you’re welcome, hope it helps!

9214

[07:22](#msg584fa19cc29531ac5d583c41)so, `reduce` sees `func`, evaluates it, gets `native!` that should evalute next two `block!`s and produce a `function!`?

rebolek

[07:22](#msg584fa1c09ce5147013cd83f2)@9214 Exactly.

[07:23](#msg584fa1e49750c95b4f8ac912)`do` does the same, the only difference is that `do` returns just last value in the block.

[07:23](#msg584fa2087e2af9d1229b6a57)See this example:

```
red>> block: [x: 1 y: x + 2 y * 3]
== [x: 1 y: x + 2 y * 3]
red>> do block
== 9
red>> reduce block
== [1 3 9]
```

9214

[07:25](#msg584fa25af666c5a13807077b)everything has a value, and every value has a type, am I correct?

rebolek

[07:25](#msg584fa26403554185047b65b2)Exactly!

9214

[07:25](#msg584fa2870da034021ba257af)and what's the value of evaluated `func` then?

[07:26](#msg584fa290aeb490080480833b)Red/System magic?

rebolek

[07:26](#msg584fa29603554185047b65b7)`native!`

[07:26](#msg584fa29f7e2af9d1229b6a65)Yes, Red/System magic :)

9214

[07:26](#msg584fa2b8c29531ac5d584166)Red/System magic with type `native!`, gee

rebolek

[07:27](#msg584fa2cd9750c95b4f8ac938)something like `make function! ...`

9214

[07:27](#msg584fa2ecb4ffd59e38201bc7)how can I get this "magic" and examine it?

rebolek

[07:28](#msg584fa3229750c95b4f8ac948)By looking at the source, of course: https://github.com/red/red/blob/master/runtime/natives.reds#L388

[07:30](#msg584fa3837e2af9d1229b6a82)But starting with Red/System by looking at the source of `func` may not be the best idea ;)

9214

[07:30](#msg584fa3b20da034021ba25d3d)yup, I see that :joy:

rebolek

[07:31](#msg584fa3e49750c95b4f8ac95c)If you are interested in Red/System, write a simple routine and compile it. It’s really easy.

9214

[07:38](#msg584fa579c29531ac5d584eb3)@rebolek should I use `--red-only` option?

rebolek

[07:39](#msg584fa5b103554185047b65ef)No

9214

[07:40](#msg584fa5ee0da034021ba2656d)@rebolek then I don't get how to get `.reds` file from `.red` compilation :(

rebolek

[07:40](#msg584fa6007e2af9d1229b6ade)@9214 wait a bit, I show you a simple example.

[07:44](#msg584fa6e79750c95b4f8ac997)

```
Red [
	Title: "My first routine"
]

my-routine: routine [
	x [integer!]		
	return: [integer!]	; you have to define return type in Red/System
] [
	x + 1
]

print my-routine 1336
```

[07:45](#msg584fa6fd9750c95b4f8ac99d)This is Red source, but what is inside of `routine` is Red/System code.

[07:45](#msg584fa70b9ce5147013cd849b)So compile this like normal Red program.

9214

[07:47](#msg584fa7a9aeb4900804809b7d)okay, now I have an exe

rebolek

[07:48](#msg584fa7c103554185047b6606)Run this exe and it will print 1337.

[07:48](#msg584fa7d59750c95b4f8ac9ae)But the point is that printing goes on Red level, while the addition goes on Red/System level.

[07:48](#msg584fa7e79750c95b4f8ac9b0)The code here looks the same, but it is Red/System code.

[07:49](#msg584fa7fe9750c95b4f8ac9b2)You can of course put much complicated R/S code inside routine, not just a + b :)

9214

[07:49](#msg584fa820be9d43bc63539659)`Red` -&gt; `Red/System` -&gt; `machine code` ?

rebolek

[07:51](#msg584fa8769ce5147013cd84b0)Yes, exactly.

9214

[07:55](#msg584fa96b28d755bf14fb3907)hm, I've got compilation error because of undefined word `ask`, but inside REPL `ask` works perfectly fine

rebolek

[07:58](#msg584faa4003554185047b6633)Yes, because `ask` is not part of runtime, but defined in the `%console.r` (I think) as part of REPL only.

9214

[08:00](#msg584faa89aeb490080480a8a8)what should I use for interaction with user in compiled console application then?

rebolek

[08:08](#msg584fac807e2af9d1229b6ba0)@9214 Hm, not sure, I think that the easiest way would be to include you program to console and recompile console?

[08:08](#msg584fac977e2af9d1229b6ba3)Or maybe add some simple VID GUI?

[08:09](#msg584faca77e2af9d1229b6ba5)That will be probably easier and faster to compile.

9214

[08:09](#msg584facac0da034021ba289fa)yes, I think GUI is doable

[08:39](#msg584fb3d728d755bf14fb6c75)Red parse and Rebol parse are different, right?

rebolek

[08:40](#msg584fb3fe03554185047b6723)@9214 They are mostly the same. Red adds some new features.

maximvl

[10:09](#msg584fc8d30da034021ba30fe7)@9214  
&gt;how can I get this "magic" and examine it?

```
red>> f: func [x] [x + 1]
== func [x][x + 1]
red>> body-of :f
== [x + 1]
red>> spec-of :f
== [x]
red>> source f
f: func [x][x + 1]
```

[10:10](#msg584fc91fbe9d43bc63544857)@9214

```
red>> source source
source: func [
    "Print the source of a function" 
    'func-name [any-word!] "The name of the function" 
    /local type
][
    print either function? get/any func-name [[append mold func-name #":" mold get func-name]] [
        type: mold type? get/any func-name ["Sorry," func-name "is" a-an type type "so no source is available"]
    ]
]
```

and so on, you can't introspect `native!` values for now, but I thing it will be possible in the future

rebolek

[10:11](#msg584fc95d9750c95b4f8aceec)@maximvl I think that @9214 was more interested in how `func` turns two blocks into `function!` but `source`, `spec-of`, `body-of` are really useful functions, indeed.

9214

[10:11](#msg584fc9630da034021ba31274)@maximvl yeah, I know about body/spec, what I've wanted is to see `native!` value of evaluated `func`

maximvl

[10:13](#msg584fc9aff666c5a13807cb27)I see, hope we will see something like this in Red:

```
* (defun f (x y) (+ x y))

F
* (disassemble 'f)

; disassembly for F
; Size: 40 bytes. Origin: #x10058B0F13
; 13:       498B4C2460       MOV RCX, [R12+96]                ; thread.binding-stack-pointer
                                                              ; no-arg-parsing entry point
; 18:       48894DF8         MOV [RBP-8], RCX
; 1C:       488BD6           MOV RDX, RSI
; 1F:       488BFB           MOV RDI, RBX
; 22:       41BBC0010020     MOV R11D, 536871360              ; GENERIC-+
; 28:       41FFD3           CALL R11
; 2B:       488B5DE8         MOV RBX, [RBP-24]
; 2F:       488B75F0         MOV RSI, [RBP-16]
; 33:       488BE5           MOV RSP, RBP
; 36:       F8               CLC
; 37:       5D               POP RBP
; 38:       C3               RET
; 39:       CC10             BREAK 16                         ; Invalid argument count trap
```

9214

[10:13](#msg584fc9cfbb7d528222f0b873):O

rebolek

[10:14](#msg584fca007e2af9d1229b6fbf)@maximvl :+1:

[10:21](#msg584fcb909ce5147013cd89b5)@9214 you wrote  
&gt; Everything has a value, and every value has a type

I must correct you here, you are almost right, but not everything \*\*has\** a value, but everything \*\*is\** a value.

9214

[10:24](#msg584fcc68aeb490080481741b)

```
Red
blk: [word 'word :word word: 1337]
foreach i blk [print type? i]

word
lit-word
get-word
set-word
integer
```

rebolek

[10:25](#msg584fcca29750c95b4f8acf84)Yes, the second part is right, \*every value has a type\*.

[10:26](#msg584fcccd9750c95b4f8acf90)

```
a: 1
```

[10:26](#msg584fccef03554185047b6bc7)Here, we have two values, `set-word!` and `integer!`. When evaluated, `word!` `a` has value `1`.

[10:27](#msg584fcd289750c95b4f8acfa2)But you can have words that have no value:

```
red>> value? first [i-have-no-value]
== false
```

maximvl

[10:28](#msg584fcd350da034021ba32471)&gt;everything has a value

```
red>> x
*** Script Error: x has no value
*** Where: catch
```

[10:28](#msg584fcd360da034021ba32474):D

9214

[10:28](#msg584fcd4bbb7d528222f0cb81)hm, `1` has type `integer!` and value of `1`

maximvl

[10:28](#msg584fcd4bbe9d43bc63545e40)everything except `x` )

rebolek

[10:28](#msg584fcd5503554185047b6bd9)The `word!` in itself \*is* a value, but \*has not* value.

9214

[10:28](#msg584fcd64be9d43bc63545ebc)and `a:` has type `set-word!` and value of ... ?

rebolek

[10:29](#msg584fcd799ce5147013cd89fb)`a:`

[10:29](#msg584fcd8f03554185047b6bdb)when evaluated it expects another value and sets word to it.

[10:30](#msg584fcdc003554185047b6bec)@maximvl exactly. `x` has no value, but \*is* value.

[10:30](#msg584fcddb9ce5147013cd8a03)

```
red>> value? 'x
== true
```

maximvl

[10:30](#msg584fcddcf666c5a13807de98)@rebolek `x` is not a value, `'x` is :)

9214

[10:31](#msg584fcdf77a58ca605547075f)\*generic psyduck pic here*

rebolek

[10:31](#msg584fce0903554185047b6bf2)@maximvl depends on context :)

[10:32](#msg584fce299ce5147013cd8a0f)`[x]` is `block!` with one value of type `word!`

maximvl

[10:32](#msg584fce2cb4ffd59e3820fd6a)

```
red>> value? x
*** Script Error: x has no value
*** Where: value?
```

is this a bug?

rebolek

[10:32](#msg584fce589750c95b4f8acfb6)No.

maximvl

[10:32](#msg584fce5abe9d43bc635462f9)hm, `value?` does evaluate it's argument

[10:33](#msg584fce707a58ca60554709b8)I would expect it to not do it, but okey

rebolek

[10:33](#msg584fce7003554185047b6c06)Yes.The wording should be something like `x holds no value`

9214

[10:34](#msg584fcea2aeb49008048184c4)to evaluate = to find a value

rebolek

[10:34](#msg584fceab7e2af9d1229b7048)Yep.

9214

[10:34](#msg584fceb2bb7d528222f0d2e5)and what's a value, generally speaking?

rebolek

[10:34](#msg584fcebd7e2af9d1229b704a)or "to get" may be bit more correct.

[10:34](#msg584fced39ce5147013cd8a28)value is anything that can be loaded

[10:35](#msg584fcf049ce5147013cd8a2e)so anything that passes the rules for a Red datatype

[10:36](#msg584fcf249ce5147013cd8a3f)as you wrote, with the small correction, in Red, everything is a value and every value has a type

9214

[10:38](#msg584fcf9e7a58ca605547134f)and every type has a type of `datatype!` :O

rebolek

[10:38](#msg584fcfad9ce5147013cd8a4a);)

[10:39](#msg584fcfe103554185047b6c2e)yes, even the types itself have their own type

maximvl

[10:39](#msg584fcfe9b4ffd59e382107df)yep, type system is kinda simple in this sense

geekyi

[12:03](#msg584fe3a2be9d43bc6354d3bf)libred released :point\_left: \[December 13, 2016 4:49 PM](https://gitter.im/red/red?at=584fe02e28d755bf14fc64ac) @PavelVozenilek

[12:44](#msg584fed21bb7d528222f182e9):point\_up: \[December 13, 2016 3:13 PM](https://gitter.im/red/red/welcome?at=584fc9aff666c5a13807cb27) @maximvl which is that? Julia has a similiar function. I really wish `source` worked on compiled code. I'd been wondering how to go about it, if you have the source of red. . i.e. meaning to write `source/native` for some time. Might be simpler than it looks I think

[12:48](#msg584fee27f666c5a138088305):point\_up: \[December 13, 2016 12:40 PM](https://gitter.im/red/red/welcome?at=584fa6007e2af9d1229b6ade) @rebolek I think there should be a hello world doc for this. Would help newbies (myself included :p ) to get started with red/system. I might write this myself. But not sure how to get started

maximvl

[12:52](#msg584feef9be9d43bc6355122a)@geekyi Common Lisp standard function: http://www.lispworks.com/documentation/HyperSpec/Body/f\_disass.htm

geekyi

[12:54](#msg584fef9ab4ffd59e3821b3bd)which is your go to lisp? I want to have a stab at some lisp

maximvl

[12:59](#msg584ff09d7a58ca605547d687)@geekyi SBCL is most featureful and production-ready thing out there

[12:59](#msg584ff0b6b4ffd59e3821b917)example above was from it

geekyi

[13:00](#msg584ff0dd28d755bf14fcc23f)What about racket and clojure?

maximvl

[13:02](#msg584ff18228d755bf14fcc59e)clojure is mostly s-expressions syntax for java, internals are pretty the same

9214

[13:03](#msg584ff1b628d755bf14fcc69e)@geekyi http://docs.hylang.org

maximvl

[13:04](#msg584ff1f4be9d43bc6355244d)racket is nice, but SBCL is way more optimized and more flexible in terms what you can do with running system

dsgeyser

[13:08](#msg584ff2c1bb7d528222f19ebb):-)

geekyi

[13:12](#msg584ff3acbb7d528222f1a2b3)Funny how I have to think about size of binary and toolchain for almost everything other than red

[13:12](#msg584ff3bdaeb4900804825fd8)I downloaded SBCL

maximvl

[13:19](#msg584ff57d7a58ca605547f810)@geekyi do you know Emacs?

geekyi

[13:20](#msg584ff586f666c5a13808adb2)The disassembly is so cool! Even has comments

maximvl

[13:20](#msg584ff5a8aeb4900804826bd0)wait until you see what SLIME can do

geekyi

[13:21](#msg584ff5c9bb7d528222f1aca6)@maximvl I've used a bit yeah. But I changed my system. Should get started on it again

maximvl

[13:22](#msg584ff5fbf666c5a13808b0b2)@geekyi basically you go here and do what they tell you and you will get working environment right away: https://www.quicklisp.org/beta/

geekyi

[13:22](#msg584ff5febe9d43bc63553a71)The biggest problem with Emacs is.. it's a huge and complex system.. steep learning curve

[13:22](#msg584ff61db4ffd59e3821db11)To be more precise, I've played with spacemacs

maximvl

[13:22](#msg584ff628aeb4900804826e75)it should work too

geekyi

[13:26](#msg584ff7047a58ca605547ff8b)Ok.. lets step back.. in which order should I do the steps? I have sbcl now. Then Emacs.. quicklisp?

dockimbel

[13:30](#msg584ff7dd7a58ca60554808fe)@geekyi You can have the source code of a native, you just need to write a disassembler for that. ;-) But, what is the need for end-users to have such feature built-in? I would say, only the contributors who work on the compiler itself have a use for that.

geekyi

[13:31](#msg584ff824be9d43bc63554f01)@dockimbel not for end users, particularly, red/system developers / contributers. And not built in

dockimbel

[13:31](#msg584ff84d7a58ca6055480b99)@geekyi I use several disassemblers already for that (IDA Pro mostly).

endo64

[13:32](#msg584ff8627a58ca6055480cab)&gt;

```
red>> value? x
*** Script Error: x has no value
*** Where: value?
```

is this a bug?

No, it is not, you should `quote` your word to get rid of evaluation:

```
value? quote x
== false
```

geekyi

[13:32](#msg584ff86bbb7d528222f1bceb)`source` is such a useful feature, I miss that it doesn't work on some words

maximvl

[13:41](#msg584ffa9228d755bf14fd0470)@geekyi yep, that's right, quicklistp is package manager and it also has package to configure connection to Emacs easily

rebolek

[13:44](#msg584ffb23db9cafe91838d3be)@geekyi True, such a doc would be useful. I would try to write something.

geekyi

[13:55](#msg584ffdc80da034021ba41731)@maximvl

```
* (ql:system-apropos "emacs")
#<SYSTEM cl-emacs-if / cl-emacs-if-20120305-git / quicklisp 2016-12-08>
```

maximvl

[13:55](#msg584ffdedf666c5a13808df39)what is this? what are you doing?

geekyi

[13:56](#msg584ffdff0da034021ba4185f)Quicklisp prompt

maximvl

[13:57](#msg584ffe42f666c5a13808e0b8)&gt;sbcl --load quicklisp.lisp  
&gt;(quicklisp-quickstart:install)  
&gt;(ql:add-to-init-file)  
&gt;(ql:quickload "quicklisp-slime-helper")

[13:57](#msg584ffe4cf666c5a13808e0d6)that should be it

[13:57](#msg584ffe5cbe9d43bc63557102)ye, it's called "slime-helper", what's why you couldn't find it

iArnold

[15:24](#msg585012bebb7d528222f267da)&lt;reminder&gt; Dedicated LISP room https://gitter.im/red/red/lisp &lt;/reminder&gt;

geekyi

[15:32](#msg5850148d7a58ca605548d91a)@iArnold thanks

[16:17](#msg58501f360da034021ba50330)Going thru editors I found about Kakune, \[discussion on reddit](https://www.reddit.com/r/vim/comments/5hzls3/why\_kakoune\_the\_quest\_for\_a\_better\_code\_editor/), a vim-like editor  
\*tl;dr* tries to simplify and rethink the vim editing experience.  
\[why kakoune](http://kakoune.org/why-kakoune/why-kakoune.html) has a detailed description of the rationale and philosophy  
&gt;A design goal of Kakoune is to beat vim at its own game, while providing a cleaner editing model

Lots of things I like about his design decisions. Not revolutionary, but tries to simplify a lot of workflows  
\*Cons\*: Unix only. Terminal only

maximvl

[16:22](#msg58502051b4ffd59e3823035e)@geekyi do you know about this guy? http://www.nomodes.com/Larry\_Tesler\_Consulting/CV.html

[16:23](#msg585020960da034021ba50ed7)or, first paragraph here https://en.wikipedia.org/wiki/Larry\_Tesler

geekyi

[16:25](#msg585020e9bb7d528222f2ec07)@maximvl Yes, I've heard of the "nomodes" thing

maximvl

[16:25](#msg585021090da034021ba51218)the guy invented modeless editing years ago

[16:26](#msg5850212628d755bf14fe00be)and people still use vi(m)

geekyi

[16:29](#msg585021e8b4ffd59e38230e0e)Modes are like context-switches.. too much is bad for your health :-p

[16:30](#msg58502222be9d43bc6356906c)I think I first heard it in one of bret victor's talks. About being passionate on something

maximvl

[16:31](#msg585022597a58ca6055496fb3)yep, me too )

greggirwin

[17:14](#msg58502c8b7a58ca605549c84f)Going back to the discussion of evaluation and values, words are special in that they can \*refer to* other values. We sometimes say the \*hold* values or are \*set to* values, but (someone please correct me if I'm wrong here) `context`s \*hold* values and words are used to look up values in contexts. So, a word is, itself, a value, but contains a reference to a context. Given a word, Red looks in the context it is bound to when evaluating the word.

dander

[18:59](#msg5850452cbe9d43bc63578804)Is a `context` basically an `object!`? Or is the `context` word a completely separate concept to an execution/evaluation context? The reason I ask:

```
red>> :context = :object
== true
```

rebolek

[19:00](#msg5850455096a565f844053158)It is the same.

geekyi

[19:02](#msg585045b028d755bf14ff074e)TODO: learn how an object works in rebol

rebolek

[19:03](#msg585045e9db9cafe91838e4bb)@geekyi any questions on object?

[19:03](#msg5850461261e516c1578d669d)see http://www.rebol.com/docs/core23/rebolcore-10.html and feel free to ask

geekyi

[19:04](#msg5850462cb4ffd59e3824079a)Not yet, I've yet to understand how it is different

[19:04](#msg58504641f666c5a1380ad565)Altho, I did wonder how to traveerse objects once

[19:05](#msg58504661f666c5a1380ad5ff)Gtg now tho

rebolek

[19:05](#msg5850467096a565f844053195)ok, later

endo64

[20:07](#msg585054e928d755bf14ff7040)"Words carry their context" and here is a good example:

```
red>> o: context [a: 1]
red>> p: context [a: 1]
red>> b: [ ]
red>> append b in o 'a
red>> append b in p 'a
red>> b
== [a a]
red>> reduce b
== [1 2]

red>> in o 'a
== a
red>> bind in o 'a p
== a
red>> get bind in o 'a p
== 2
```

rebolek

[20:07](#msg5850551961e516c1578d6951)`p: context [a: 1]` needs a fix

endo64

[20:23](#msg585058baf666c5a1380b4d7f)Right, should be `p: context [a: 2]`

maximvl

[23:49](#msg585089180da034021ba79f7b)@endo64 nice example, thanks!

## Wednesday 14th December, 2016

9214

[01:44](#msg5850a3e70da034021ba81d83)How you guys came to Red and Rebol after all?

rebolek

[05:04](#msg5850d2d9db9cafe91838f745)I’ve read an article by @pekr in Amiga Review

endo64

[08:25](#msg5851021528d755bf1402ec66)I was using Amiga 1200 until 2000 for everything; internet, php, mysql.

[08:27](#msg585102717a58ca60554ecf3f)Rebol released on Amiga at 1998. I saw it there, when I see Carl's name on it (he is very famous in Amiga scene) I start following it.

[08:28](#msg5851029bbe9d43bc635baab4)But I could start using Rebol at work at 2007.

geekyi

[12:05](#msg58513597e7bdfe4e29516c56)I read an article on hackernews about red. Then I found about rebol

9214

[14:18](#msg585154d0c5a4e0233b8332cd)As for me, I think I've found Rebol by accident, while searching for languages which were inspired by Forth and Lisp. Then I investigated a little bit more, found Red, and almost peed in my pants out of joy. :joy\_cat:

maximvl

[14:28](#msg5851572ac895451b75d4d22e)want until 1.0, it's not the time yet

dander

[17:42](#msg5851848a589f411830e3fe8d)I found out about Red from an open-source-publicity campaign that was running on Stack Overflow, and it piqued my interest enough to check in every few months, until I was eventually following and learning daily

[17:47](#msg5851859ffb22792b3b62f9c3)if anyone is interested, there are some fun puzzles over at: http://adventofcode.com/  
They all seem to involve generated inputs, so these seem to be good for learning parse (which I have been wanting to do)

greggirwin

[18:37](#msg5851914e058ca9673747cb3c)I found REBOL: The Official Guide at a bookstore in 2001. I was looking for where to go after specializing in VB for 11 years.

## Thursday 15th December, 2016

pekr

[15:01](#msg5852b056e7bdfe4e2959ec14)I found Amiga and followed Carl's footsteps, which leaded to Rebol. After all, if I am not mistaken @dockimbel has an Amiga heritage too :smile:

rebolek

[15:12](#msg5852b2e9af6b364a29b79bf7)@pekr http://amigareview.amiga.sk/amiga-review-26/carl-sassenrath-je-cas-se-vratit :)

dockimbel

[16:14](#msg5852c172589f411830eacaa1)Most of early Rebolers are coming from the Amiga community (including myself), following Carl's new adventure with Rebol. I knew about Rebol since 1997, but joined only in 1999, when I needed a language flexible enough to implement a web scraper from scratch, I was seduced mostly by series concept, rich datatypes, built-in/hackable networking protocols and the amazing Parse dialect.

## Friday 16th December, 2016

DideC

[09:37](#msg5853b5c1e7bdfe4e295f4f36)Same for me. I readed about "LAVA" Carl's project in an Amiga magazine. It was rename Rebol in the end. I think I started playing wih Rebol in 1999 or 2000. Was amazed by what it does an so powerfull it is for so tiny exe and so few code. I jump on it mostly as a hobby. Since then I use it for my work, but mostly for internal uses.

9214

[14:32](#msg5853faea589f411830f148ed)What really hooked me as a newbie is that Rebol grown up on top of ideas which I really adore:  
\* every possible abstraction could be represented as a simple list (series);  
\* every program is just a dialect for a problem it solves (DSL approach);  
\* code and data are the same (homoiconity), and I think this somehow resonates with The von Neumann architecture, which lies at the very core of modern computers;  
\* expressiveness (free-form syntax, multiparadigm) and extensibility (macros... fullstack-ness, eh?) of programming language is important more than anything else;  
\* contexts, environments (can't really tell you what I mean, it just feels like The Right Thing);  
\* language shouldn't bring any accidential complexity with it (no plugin/framework/library crutches, no IDE bells and whistles, nothing being shoved down your throat);  
\* it should be fun! (Of course I have no voice in that, but IMO very few languages are actually fun to hack with and worth an emotional/intellectual investment. PL ain't a tool, it's a mindset -&gt; the actual tool is your brain -&gt; PL is a way you think with your brain about problems -&gt; thinking \*\*definetly\** should be fun).

## Tuesday 20th December, 2016

endo64

[22:09](#msg5859ac36c02c1a395991d0be)@9214 Great comments. Rebol &amp; Red are the last languages that I really enjoy to learn and having fun, the first one was 6502 Assembly on C64 and the second was 68000 Assembly on A500/A1200.

## Wednesday 21st December, 2016

koba-yu

[12:52](#msg585a7b047a3f79ef5d83b888)Hi, does Red have so-called "map function", popular among functional programming languages?

9214

[13:35](#msg585a8522c02c1a39599607bd)@koba-yu AFAIK, no, but you can easily implement one

```
Red []

map: function [
	"ad-hoc map implementation"
	f  [function!] "a function to map over series" 
	xs [series!]   "series, obviously"
] [
	xs*: copy [] ; inner series to store our mapped xs
	foreach x xs [
		append xs* f x
	]
]

; test no. 1
block: [1 2 3 4 5]
mapped-block: map func [x] [x + 1337] block
print mapped-block

; test no. 2
string: "this is red"
mapped-string: map func [char] [form reduce ["[" uppercase char "]" newline]] string
print mapped-string
```

```
1338 1339 1340 1341 1342
[ T ] 
[ H ] 
[ I ] 
[ S ] 
[   ] 
[ I ] 
[ S ] 
[   ] 
[ R ] 
[ E ] 
[ D ]
```

koba-yu

[13:42](#msg585a86b1e7bdfe4e29803151)@9214 Thank you for your reply! What does \\* of xs\\* mean?

9214

[13:44](#msg585a8750c02c1a39599614a3)@koba-yu `xs` is just a naming convention for list-like data in functional languages, or do you mean something else?

koba-yu

[13:47](#msg585a87e1c02c1a39599617e4)@9214 Don't you put asterisk(\\\*) after xs in your function? I wonder it has some meaning.

9214

[13:47](#msg585a87f6058ca9673774f345)@koba-yu ah, no, it's just a valid variable name in Red

koba-yu

[13:48](#msg585a8838c895451b7503bfb7)Oh, OK, I see. :)

[13:49](#msg585a886b058ca9673774f66a)@9214 Thank you very much for your cool example! I was looking for some elegant way for that.

9214

[13:50](#msg585a8893c895451b7503c28f)@koba-yu you're welcome

maximvl

[13:55](#msg585a89c1058ca9673774ffad)@koba-yu same as `-` in `mapped-block`, basically red uses `[]` and space as delimiters, pretty much everything else can be used in names

9214

[13:55](#msg585a89cec895451b7503c8b9)oh, by the way, does Red have tail-call optimization?

maximvl

[13:56](#msg585a8a00c02c1a395996261a)@9214 you tell us :D

[13:58](#msg585a8a8ec02c1a3959962a44)@9214 if you know the definition it should not be hard to come up with a script to test it

koba-yu

[13:59](#msg585a8ab1c5a4e0233bb22ddc)@maximvl Thank you, I misunderstood it was something like a symbol of pointer like C style language

9214

[14:00](#msg585a8ae4c895451b7503cf55)@maximvl sure thing

```
break-stack: does [
	print "we gonna go deeper!"
	break-stack
]

break-stack
```

```
...
we gonna go deeper!
we gonna go deeper!
we gonna go deeper!
we gonna go deeper!
*** Internal Error: stack overflow
*** Where: break-stack
```

[14:02](#msg585a8b5ee7bdfe4e29804f5b)@koba-yu http://www.rebol.com/docs/core23/rebolcore-4.html#section-5.1

koba-yu

[14:08](#msg585a8ce9c02c1a39599638e4)@9214 Thanks, I'll check it. :)

maximvl

[14:16](#msg585a8ebfaf6b364a29dd9120)@koba-yu a little from other languages applies to Redbol, so double check things which you think you understand =)

9214

[14:16](#msg585a8ecac5a4e0233bb24341)@koba-yu perhaps

```
xs*: make type? xs 0
```

will be more valid

koba-yu

[14:27](#msg585a915fc5a4e0233bb25525)@9214 I did not know that way! 0 can be used for make function's spec block?

9214

[14:31](#msg585a925ec895451b7503fa8f)@koba-yu `make` creates a new value with specified type and spec, it may not necessarily be a function.

koba-yu

[14:34](#msg585a930ce7bdfe4e29808399)@9214 I see. I have checked `? make` and now I seen its argument is any-type!

[14:36](#msg585a93730730ce6937f2a10d)sorry, I should go to bed. It becomes midnight in Japan... :(

[14:37](#msg585a938f7a3f79ef5d8452b9)Thank you very much for your advices!

9214

[14:37](#msg585a93ae0730ce6937f2a2cc)@koba-yu good night! :stars:

maximvl

[19:25](#msg585ad726058ca9673776ecef)what do you think about embedded Red? is it possible to make it runable on devices with few KB of memory?

geekyi

[20:55](#msg585aec5d7a3f79ef5d868144)@maximvl not yet I guess.. and a few KB is a lot.. too little rather. Especially these days, when even "embedded" systems have MBs of memory What devices do you have in mind?

maximvl

[21:19](#msg585af1d3c895451b750670fa)I think arduino is pretty popular

geekyi

[21:22](#msg585af2aac895451b75067575)@maximvl as example, typical PI have ~GB of ram

## Thursday 22nd December, 2016

rebolek

[13:55](#msg585bdb4261e516c1578eb5ed)@maximvl for arduino-like machine it would be better to use Red/System.

maximvl

[14:05](#msg585bdda3c5a4e0233bb94f50)@rebolek what do you mean by `use Red/System` ?

rebolek

[14:06](#msg585bdddb96a565f844067aba)I think that Red runtime is too big for Arduino with its 32kB of memory. But you can sure fit Red/System code in such space.

maximvl

[14:33](#msg585be41dc895451b750b3537)@rebolek hm, does that mean that Red/System compiles only direct dependencies of the program?

[14:35](#msg585be4c17a3f79ef5d8b46e2)@rebolek compiled hello world in R/S is 6.6kB, but it's dynamically linked

rebolek

[14:39](#msg585be5a761e516c1578eb738)@maximvl Red compiler currently does not remove unused stuff

[14:39](#msg585be5b3db9cafe9183a3b6b)so R/S programs will always be smaller

maximvl

[15:07](#msg585bec15c02c1a39599dbae1)@rebolek ok, good to know

[15:07](#msg585bec28e7bdfe4e298796d8)for some reason I can't compile code with macros:

```
red -r test.red -o test.bin 

-=== Red Compiler 0.6.1 ===- 

Compiling /home/mvelesyuk/tmp/test.red ...

Target: Linux 

Compiling to native code...
*** Compilation Error: unknown directive macro 
*** in file: %/home/mvelesyuk/tmp/test.red 
*** at line: 3 
*** near: [
    #macro test: func [x] [
        compose [(:x)]
    ] print-line [test z]
]
```

geekyi

[15:36](#msg585bf2f5c5a4e0233bb9d707)@maximvl maybe because it's not red system?

[15:38](#msg585bf371c895451b750b9c28)I haven't tried red/system yet either

[15:41](#msg585bf42ce7bdfe4e2987ccd5)IF @rebolek, @greggirwin, or anyone hasn't got a complete newbie guide to getting started writing r/s .. I'm gonna write one :p

[15:43](#msg585bf48fc02c1a39599df171)@maximvl http://www.red-lang.org/2011/03/having-fun-with-redsystem.html works for you?

[15:43](#msg585bf4af0730ce6937f9ea40)Or am I assuming wrong and you already know R/S?

maximvl

[15:45](#msg585bf520e7bdfe4e2987d32b)@geekyi thanks for links, I don't see usage of `#macro` there though, my script uses the R/S:

```
>cat test.red 
Red/System []

#macro test: func [x] [
   compose [(:x)]
]

probe [test z]
```

geekyi

[15:46](#msg585bf569c02c1a39599df952)I suppose it's not necessary for the file name to end in .reds ?

maximvl

[15:47](#msg585bf577e7bdfe4e2987d69b)hm, let me try

[15:47](#msg585bf589af6b364a29e4f178)nope, same thing

9214

[16:08](#msg585bfa8fc02c1a39599e1c99)@maximvl http://static.red-lang.org/red-system-specs.html#section-14

[16:10](#msg585bfb0d0730ce6937fa1e17)it seems that there's no `macro` directive in R/S

maximvl

[16:17](#msg585bfc90c895451b750bd8b9)@9214 also this document was updated like 2 month ago, so

9214

[16:18](#msg585bfcc3c02c1a39599e2989) ¯\\\_( ツ)\_/¯

greggirwin

[17:35](#msg585c0ec4c02c1a39599ea7b1)@koba-yu, and others, Red does not have tail call optimization at this time.

We can write `map` and all other HOFs in Red. I've posted some, and Nenad has said he has thoughts on the overall design for common HOFs. You could try modifying @9214's example to use `collect` rather than allocating and appending to a block.

Another standard model is to use a body block, rather than a function. e.g.:

```
map-each: function [
	"Evaluates body for each value in a series, returning all results."
	'word [word! block!] "Word, or words, to set on each iteration"
	data [series!]
	body [block!]
][
	collect [
		foreach :word data [
			keep/only do body
		]
	]
]
```

This introduces a few new concepts, but shows some techniques for writing control funcs. Feel free to ask questions.

[17:38](#msg585c0fb2c895451b750c5d76)@geekyi, a newbie guide to R/S would be \*great\*.

## Friday 23th December, 2016

9214

[08:08](#msg585cdb96c5a4e0233bbe98ba)@greggirwin yeah, later I thought that `collect` should be more elegant

[08:11](#msg585cdc3ec02c1a3959a2d33c)and what's `keep/only`? I know how `keep` works, but what this refinement do?

maximvl

[08:13](#msg585cdcbcc5a4e0233bbea272)@9214

```
red>> collect [loop 5 [ keep [x] ] ]
== [x x x x x]
red>> collect [loop 5 [ keep/only [x] ] ]
== [[x] [x] [x] [x] [x]]
```

9214

[08:14](#msg585cdccfc02c1a3959a2d670)@maximvl oh, I see now, thanks!

[08:20](#msg585cde5dc5a4e0233bbeafc8)but how can I "capture" `word` inside `body`?

maximvl

[08:21](#msg585cde950730ce6937fe9eb0)capture?

9214

[08:23](#msg585cdee47a3f79ef5d90adb4)I.e. , in `map-each`, if I want to perform some transformation with every element in `data`

maximvl

[08:26](#msg585cdf98c895451b7510762c)@9214 `word` contains each element, so do what you want with it

9214

[08:26](#msg585cdfc30730ce6937fea461)

```
map-each: function [
    "Evaluates body for each value in a series, returning all results."
    'word [word! block!] "Word, or words, to set on each iteration"
    data [series!]
    body [block!]
][
    collect [
        foreach :word data [
            keep/only do body ; suppose I want do [word + 1]
        ]
    ]
]
```

[08:27](#msg585ce0000730ce6937fea58c)I should pass `[word + 1]` as argument to `map-each`?

maximvl

[08:28](#msg585ce018058ca96737815de8)

```
red>> map-each z [1 2 3] [z + 1]
== [2 3 4]
```

[08:28](#msg585ce01dc02c1a3959a2ee70)is this what you mean?

9214

[08:28](#msg585ce023c02c1a3959a2eea3)yeah!

[08:28](#msg585ce037af6b364a29e99f99)oh, that was stupid question actually :D

maximvl

[08:29](#msg585ce058af6b364a29e9a028)the `word` is just something to be binded inside map-each, so your block needs a name to access it

[08:31](#msg585ce0dcaf6b364a29e9a322)this is actually interesting, so `foreach` binds `word` in this example, is it implemented as recursive search in body block? what if passed block is really big?

9214

[09:48](#msg585cf30ae7bdfe4e298cdf97)inside `foreach` `:word` evaluates to `z` and `body` evaluates to `[z + 1]`, therefore `z` is in one scope?

maximvl

[09:49](#msg585cf3367a3f79ef5d91131c)scopes are something unusual in Redbol world

[09:50](#msg585cf355c895451b7510d691)AFAIK there are no scopes

[09:50](#msg585cf381c895451b7510d728)but let's wait for somebody who can clearly explain how things happen :)

9214

[09:59](#msg585cf58dc02c1a3959a356ea)@maximvl so there's no scope in `foreach`?

maximvl

[10:00](#msg585cf5a6c02c1a3959a3579a)there is probably no scope at all

[10:00](#msg585cf5b0e7bdfe4e298ced9a)it works differently

9214

[10:01](#msg585cf5edc02c1a3959a358f5)but `z` is still binded...?

maximvl

[10:01](#msg585cf5f8c5a4e0233bbf29ed)and all other words, yes

9214

[10:03](#msg585cf66dc895451b7510e804)and why this isn't lexical scope, because we can see `z` from any other part of a program (can we?) ?

maximvl

[10:03](#msg585cf68fc02c1a3959a35b74)try it =)

9214

[10:06](#msg585cf716c895451b7510ebb4)

```
red>> map-each z [1 2 3] [z + 1]
== [2 3 4]

red>> z
red>> 3
```

[10:07](#msg585cf74bc895451b7510ec9a)leaky!

maximvl

[10:09](#msg585cf7d2af6b364a29ea0fcd)check this out

[10:09](#msg585cf7d40730ce6937ff1d61)

```
Red []

my-for-each: function ['word series body] [
   counter: 1
   loop length? series [
      set word first at series counter
      bind body 'counter
      do body
      counter: counter + 1
   ]  
]

my-for-each x [1 2 3] [print x]
```

[10:12](#msg585cf873af6b364a29ea1243)so this one shows that `set` "binds" word to global context:

```
red>> f: func ['x] [probe x]
== func ['x][probe x]
red>> z
*** Script Error: z has no value
*** Where: catch
red>> f z
z
== z
red>> z
*** Script Error: z has no value
*** Where: catch
red>> f: func ['x] [set x 5 probe x]
== func ['x][set x 5 probe x]
red>> f z
z
== z
red>> z
== 5
red>> system/words/z
== 5
```

[10:21](#msg585cfab17a3f79ef5d913891)one more confusing thing here is words evaluation based on context, but `set` doesn't seem to respect it:

```
red>> x: context [y: 5]
== make object! [
    y: 5
]
red>> g: [set 'j y + 5]
== [set 'j y + 5]
red>> reduce g
*** Script Error: y has no value
*** Where: +
red>> bind g x
== [set 'j y + 5]
red>> reduce g
== [10]
red>> j
== 10
red>> x
== make object! [
    y: 5
]
```

[10:23](#msg585cfb1daf6b364a29ea1faa)so `g` could only be reduced if its words bound to `x`, because there is a binding for `y` in `x`, but at same time `j` is still becomes set only in global context

[10:29](#msg585cfc9bc895451b75110a7f)@maximvl going to check `bind` source

[10:35](#msg585cfe0be7bdfe4e298d170d)okey, it's defined as `#get-definition NAT_BIND`

[10:36](#msg585cfe18af6b364a29ea3075)couldn't find anything further

[10:41](#msg585cff6d0730ce6937ff4d04)there are these two definitions, but both have different spec:  
https://github.com/red/red/blob/362f17627df94ed7b476b1f9e414b8a94a2fb0fd/runtime/datatypes/context.reds#L435  
https://github.com/red/red/blob/c8cf446a90e45ccf68e4a4853a443d4c6395119d/runtime/natives.reds#L1053

9214

[11:50](#msg585d0f6ac5a4e0233bbfb89e)@maximvl http://www.pat665.free.fr/doc/bind.html

[11:52](#msg585d0fe40730ce6937ffac28)so you think `j` should be setted in `x` context?

maximvl

[12:00](#msg585d11efc5a4e0233bbfc231)well, I would expect this, but there could be reasons for current behaviour I'm not aware of

9214

[12:01](#msg585d12207a3f79ef5d91cadf)perhaps we should explicitly bind `j` to `x` before setting it

[12:01](#msg585d1222c5a4e0233bbfc2ac)interesting

maximvl

[12:01](#msg585d1235c5a4e0233bbfc361)good, assumption, let's try it

[12:03](#msg585d1289e7bdfe4e298d84b7)

```
red>>  x: context [y: 5 j: 0]
red>> reduce g
== [10]
red>> j
*** Script Error: j has no value
*** Where: catch
red>> x
== make object! [
    y: 5
    j: 10
]
```

[12:03](#msg585d12910730ce6937ffb973)@9214 you are right Oo

[12:04](#msg585d12d6af6b364a29eaa0f6)interesting:

```
red>> x/z: 1
*** Script Error: cannot access z in path x/z:
*** Where: catch
```

[12:04](#msg585d12e50730ce6937ffbb5e)so context seems to be immutable in terms of adding words

[12:06](#msg585d132fe7bdfe4e298d8757)so `set` binds word to the current context if it contains the word or creates a new in global context

9214

[12:06](#msg585d1343af6b364a29eaa297)

```
Red
red>> x: context [y: 1337]
== make object! [
    y: 1337
]
red>> g: [set 'j y + 5]
== [set 'j y + 5]
red>> do g
*** Script Error: y has no value
*** Where: +
red>> bind 'j x
== j
red>> x
== make object! [
    y: 1337
]
red>> do g
*** Script Error: y has no value
*** Where: +
red>> bind g x
== [set 'j y + 5]
red>> do g
== 1342
red>> x
== make object! [
    y: 1337
]
red>> x/j
*** Script Error: cannot access j in path x/j
*** Where: catch
red>> j
== 1342
```

[12:12](#msg585d14a3c02c1a3959a40651)

```
red>> my-context: context [leet: 1337]
== make object! [
    leet: 1337
]
red>> leet
*** Script Error: leet has no value
*** Where: catch
```

[12:12](#msg585d14b5e7bdfe4e298d8e4a)@maximvl now try `probe context? 'leet`

maximvl

[12:13](#msg585d15037a3f79ef5d91da4a)@9214 oh wow

[12:15](#msg585d1544c5a4e0233bbfcdde)but what is it?

9214

[12:15](#msg585d156a0730ce6937ffc52b)@maximvl idk, looks like global context

[12:16](#msg585d159ce7bdfe4e298d96c6)at the very bottom there's

```
...
   my-context: make object! [
        leet: 1337
    ]
    leet: unset
```

rebolek

[12:16](#msg585d15ae96a565f8440695ca)

```
red>> equal? system/words context? 'leet
== true
```

[12:17](#msg585d15ddd99b1dd03d2ddea5)If you declare a word in a context, it is added to `system/words` as `unset!`.

9214

[12:17](#msg585d15e9af6b364a29eab01a)@rebolek yeah, I see that

rebolek

[12:19](#msg585d163cdb9cafe9183a5562)

```
red>> nonsense: [ratatat]
== [ratatat]
red>> find system/words 'ratatat
== true
```

9214

[12:22](#msg585d17110730ce6937ffce5d)

```
red>> blah: 'bleh
== bleh
red>> find system/words 'bleh
== true
red>> uh: context [oh: 'huh]
== make object! [
    oh: 'huh
]
red>> find system/words 'huh
== true
red>> system/words/oh ; returns nothing
red>> system/words/blah
== bleh
red>> type? system/words/oh
== unset!
red>>
```

maximvl

[12:22](#msg585d1714e7bdfe4e298d9f35)@9214 I don't think it's global context:

```
red>> value? system/words/leet
*** Script Error: value? does not allow unset! for its value argument
*** Where: value?
```

[12:24](#msg585d1763e7bdfe4e298da03d)ok, it's global:

```
red>> (context? 'print) = (context? 'leet)
== true
```

9214

[12:24](#msg585d177f0730ce6937ffd107)@maximvl the thing that `probe context? leet` spits out is `system/words` object (?), as @rebolek pointed out

rebolek

[12:24](#msg585d1784d99b1dd03d2ddeb5)It just collects the word. So the word is of type `unset!` and therefore has no value. Also, there is no global context. But you can call `system/words` that, it is most close to a global context.

9214

[12:25](#msg585d17b8058ca96737826eb1)@rebolek yeah, that what I actually mean by saying "global context" - some data structure with all words bindings

rebolek

[12:26](#msg585d17f4db9cafe9183a5585)Yep. Also, `object` and `context` are mostly interchangeable.

9214

[12:32](#msg585d19527a3f79ef5d91ed38)@maximvl

```
red>> x: context [y: 1]
== make object! [
    y: 1
]
red>> x/y: 2
== 2
red>> x
== make object! [
    y: 2
]
red>> x: make x [z: 3]
== make object! [
    y: 2
    z: 3
]
red>> x/z: 4
== 4
red>> x
== make object! [
    y: 2
    z: 4
]
red>>
```

[12:36](#msg585d1a427a3f79ef5d91f352)one thing left now is to learn how to remove binding from context (or object)

[12:44](#msg585d1c25e7bdfe4e298db76b)`x: make x [unset 'z]` doesn't actually remove `z`

rebolek

[12:47](#msg585d1cf9db9cafe9183a55c7)IIRC, in Red, contexts are static. You can’t add or remove words (obviously it is possible to add words to system/words, but with "normal" contexts, Red is not as flexible as R3).

9214

[12:51](#msg585d1dd3c895451b7511af13)http://inception.davepedu.com/

```
red>> inception: context [dicaprio: self]
== make object! [
    dicaprio: make object! [...]
red>> inception/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>> inception/dicaprio/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>> inception/dicaprio/dicaprio/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>> inception/dicaprio/dicaprio/dicaprio/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>> inception/dicaprio/dicaprio/dicaprio/dicaprio/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>>
```

PeterWAWood

[13:02](#msg585d206ee7bdfe4e298dcc47)@maximvl &gt; so `set` binds word to the current context if it contains the word or creates a new in global context

You can use

```
in
```

to specify the context in which you wish to

```
set
```

the word:

```
red>> b: 1
== 1
red>> o: make object! [
[    b: 2
[    set in system/words 'b 3
[    ]
== make object! [
    b: 2
]
red>> b
== 3
red>> set in o 'b 4
== 4
red>> o/b
== 4
red>> b
== 3
```

maximvl

[13:02](#msg585d207dc895451b7511bc16)@rebolek why are they static?

[13:04](#msg585d20ce7a3f79ef5d921e75)@PeterWAWood interesting, but lets say I want to change definition of word in block - I can just `bind` it, right?

[13:04](#msg585d20e47a3f79ef5d921f24)so what if I want block to set words for my context?

[13:05](#msg585d211ec5a4e0233bc00864)let me rephrase, if `set` would work in current context it would be possible to not leak words into global one

[13:06](#msg585d2145c02c1a3959a44825)what are the reasons behind these decisions?

rebolek

[13:08](#msg585d21d0d99b1dd03d2ddfcf)@maximvl static as in you cannot add or remove words. Why? I am not sure, Carl allowed extending objects in R3 (planned also shrinking them but never implemented it AFAIK), but @dockimbel doesn’t like it and prefers R2 way. I can’t tell you why, I don’t know.

PeterWAWood

[13:13](#msg585d22f07a3f79ef5d922ddc)&gt; ... but lets say I want to change definition of word in block - I can just `bind` it, right?

I'm not sure that I understand your question.

maximvl

[13:17](#msg585d23de7a3f79ef5d923522)@PeterWAWood let's say I have blocks of commands like `[send "command"]`, kinda DSL, but I want to print all the commands, so I can do

```
red>> c: context [ send: :print ]
== make object! [
    send: make native! [[
        "Outputs a value ...
red>> b: [send "command"]
== [send "command"]
red>> do bind b c
command
```

PeterWAWood

[13:18](#msg585d2423c895451b7511d646)It is easy to create an extended a context in Red &amp; Rebol2 which is why the decision was taken to make them immutable:

```
red>> o: make object! [a: 1]
== make object! [
    a: 1
]
red>> o: make o [b: 2]
== make object! [
    a: 1
    b: 2
]
```

maximvl

[13:19](#msg585d245f058ca9673782b560)@PeterWAWood ye, but this is not what I'm talking about

[13:20](#msg585d24850730ce6937001dbb)@PeterWAWood imagine there is DSL which actually assigns words like `[cmd: "command" send cmd]`

[13:20](#msg585d2496c5a4e0233bc01bec)and I would like to collect all assignments

[13:21](#msg585d24e90730ce6937001fb8)I have to find all `set-words` and `set` usages, create context containing all of them and then run this block in this context

[13:22](#msg585d24fae7bdfe4e298de509)is it how `function` works, btw?

PeterWAWood

[13:22](#msg585d2515058ca9673782baea)Yes and Yes, as far as I know.

maximvl

[13:23](#msg585d255d7a3f79ef5d923cbb)to me this seems so unnatural compared to having `set` adding words to current context

[13:24](#msg585d257e058ca9673782bc5b)so I wonder why @dockimbel prefers one to another?

[13:27](#msg585d262a058ca9673782bf51)and

[13:27](#msg585d264d058ca9673782c02a)if you would like to force default behaviour on block you can always do

```
bind block system/words
```

koba-yu

[13:40](#msg585d2962058ca9673782cd02)@greggirwin Though being late, thank you Gregg! I'll try it.

endo64

[20:06](#msg585d83dc7a3f79ef5d94328d)I think extending an object in Red will be possible in the future, see `extend` native: `Extend an object or map value with list of key and value pairs.` but when you use it on objects `*** Internal Error: reserved for future use (or not yet implemented)`

[20:13](#msg585d856dc5a4e0233bc22f05)Online dissambler, could be useful for debugging: https://www.onlinedisassembler.com

DideC

[21:35](#msg585d9898e7bdfe4e29901d3a)&gt; @maximvl now try `probe context? 'leet`

One thing to mention ! Playing with the console mean : Red load what you type then do it. So `probe context? 'leet` create the `leet` word at loading time, then evaluate. So the word exists because you ask for its existence ;-)

## Saturday 24th December, 2016

9214

[13:20](#msg585e7634e7bdfe4e29933e1e)@DideC :O sounds like koan

redredwine

[14:03](#msg585e8034c895451b75178708)I am reading the red by example page about series at http://www.red-by-example.org/series.html  
thre is an example  
function \[] [  
list: ""  
append list "huh"  
print list  
]

Now we run this function a few times and see what happens:

red&gt;&gt; huh  
huh

red&gt;&gt; huh  
huhhuh

red&gt;&gt; huh  
huhhuhhuh

This seems a bit counter intuitive to me, although I "get it", after reading the explanation on that page. but I keep asking myself, why allow it to behave this way, meaning the next call basically ignores the reinitialise step on the first line - list: "" ?

I think every programmer would want that every line of my program to be executed according to what I want it to do and when I want it to run.

Do I take it that Series is ALWAYS static although it says in Function, everything is LOCAL? what else is static apart from series?

Would it not be better to let the programmer decides when he needs static ?

Senenmut

[14:21](#msg585e84610730ce693705e535)huuuuuuuuhuuuuuuuuhuuuuuuu - merry christmas

RiVeND

[14:35](#msg585e87c7c5a4e0233bc632ec)@redredwine Change list: "" to list: copy "" to get what you want.

9214

[14:36](#msg585e87ee7a3f79ef5d981e96)@Mennohexo :christmas\_tree:

geekyi

[19:03](#msg585ec6747a3f79ef5d991b8e)&gt; @redredwine Change list: "" to list: copy "" to get what you want.

\*\*tldr;\** Redbol does not copy by default, see \[Copy-on-write](https://en.wikipedia.org/wiki/Copy-on-write)  
It's for performance and simplicity.

[19:04](#msg585ec6bb7a3f79ef5d991d14)We could use alternative strategies. I don't remember where, but I read some discussion somewhere about this

## Sunday 25th December, 2016

rebolek

[07:37](#msg585f773adb9cafe9183a7319)@redredwine  
&gt; the next call basically ignores the reinitialise step on the first line - list: ""

That’s because there is no reinitialize step.  
The important thing here is that the source of your function is loaded into memory once and then you run the function from there - you are not loading the function on each call. `""` is literal string, so it is created \*\*once\** when the function is loaded. When you call the function, it always uses that string.  
`copy ""` works, but IMO the more proper way if you want to reinitialize the string on each call is `make string! 12345` where `12345` is some size to pre-alocate.

maximvl

[08:01](#msg585f7ccec5a4e0233bc9ad5b)@rebolek but I agree that this behavour leaks implementation details to programmer, so one needs to know how literal structures are handled by compiler

[08:01](#msg585f7ce2e7bdfe4e2996fb83)not sure if it's bad or good

rebolek

[08:02](#msg585f7cf9d99b1dd03d2dfc67)@maximvl yes, it is important to understand how it works

9214

[08:02](#msg585f7d210730ce6937096c27)@rebolek and how exactly `copy` works?

maximvl

[08:03](#msg585f7d4ac02c1a3959adec80)

```
DESCRIPTION:
      Returns a copy of a non-scalar value. 
      copy is of type: action!
```

=)

rebolek

[08:03](#msg585f7d4cd99b1dd03d2dfc6a)@9214 it creates and return new string with same content as source string

[08:04](#msg585f7d74d99b1dd03d2dfc6d)so `copy ""` does always return empty string, it is new copy of the initial empty literal string

9214

[08:04](#msg585f7d77058ca967378c0862)now I see that `list: ""` means `list variable points to some allocated memory block`, then what `list: copy ""` mean?

maximvl

[08:04](#msg585f7d8e7a3f79ef5d9bac58)means `copy` will be executed each time

9214

[08:04](#msg585f7d97058ca967378c08af)`hey list variable, please move your pointer to the new freshy allocated memory`?

maximvl

[08:04](#msg585f7d9baf6b364a29f404e9)because it's a function

[08:05](#msg585f7dbc058ca967378c0913)there is nothing to do with `list` variable here

[08:05](#msg585f7dcce7bdfe4e2996fdce)`copy` just copies thing and returns new copy

rebolek

[08:05](#msg585f7dd7db9cafe9183a733f)it copies the literal string and returns new copy each time. you then work with the copy, so the original is string is unchanged and remains always empty

maximvl

[08:07](#msg585f7e480730ce693709705e)@9214 same with `bind`, you sent article link few days ago, it is common to copy block before binding because bind changes block itself

9214

[08:08](#msg585f7e68af6b364a29f407f6)though I need to study memory management :worried:

maximvl

[08:08](#msg585f7e69c895451b751b38b3)so you write `do bind copy block context`

rebolek

[08:09](#msg585f7ea3d99b1dd03d2dfc78)@9214 I don’t think you need to study memory management to understand it. just play with it and you will get it.

9214

[08:10](#msg585f7ef27a3f79ef5d9bb208)@rebolek it's just that I don't feel myself confident enough

rebolek

[08:11](#msg585f7f4edb9cafe9183a7354)@9214 why? don’t be afraid, it’s just a software, you are not going to break anything :)

9214

[08:13](#msg585f7fa40730ce693709752e)is that correct to say `list variable points to some block of memory`?

rebolek

[08:14](#msg585f7fea96a565f84406b3e5)If you want to be correct, you would say something like `word list has value of ...`. There are no variables in Red.

[08:14](#msg585f7ff8d99b1dd03d2dfc87)but basically yes

9214

[08:15](#msg585f800cc895451b751b3e46)just wonder how it works on lower level

maximvl

[08:15](#msg585f8020c5a4e0233bc9b4b9)yes, and on each function invocation this line will also be `list:`

[08:16](#msg585f8041af6b364a29f40d43)so it will create word list with the same pointer as value

rebolek

[08:16](#msg585f804b61e516c1578eee07)On lower level, you have anonymous content, like `block!`, `string!`, `object!`, `function!`, ... and then you have zero or more words pointing to that content.

9214

[08:16](#msg585f804dc5a4e0233bc9b4eb)@maximvl so `copy` just copying empty string to that memory block on every function call?

maximvl

[08:16](#msg585f806dc02c1a3959adf67d)@9214 to a different block, it makes little sense to copy to that memory

9214

[08:17](#msg585f8082af6b364a29f40dd4)@maximvl I thought that `copy` may instead create new block of memory with empty string content and point `list` to that new block

maximvl

[08:17](#msg585f8085058ca967378c1302)empty string is the memory you copy

[08:17](#msg585f80a2c5a4e0233bc9b5c2)@9214 yes, this is exactly what happens

[08:17](#msg585f80b20730ce6937097878)but `copy` doesn't point `list`

[08:18](#msg585f80c4c02c1a3959adf774)copy just returns it

9214

[08:18](#msg585f80c87a3f79ef5d9bb763)@maximvl well, yeah, it assigns word `list` to value `""`

maximvl

[08:18](#msg585f80d1c895451b751b4144)you assign it with `list:`

9214

[08:18](#msg585f80e8058ca967378c1395)oh, I mean `:` assigns, `copy` just returns new value

[08:23](#msg585f81e8c5a4e0233bc9b8f4)@rebolek how can I "point" multiple words to same content?

rebolek

[08:23](#msg585f820b96a565f84406b3f1)@9214 `word1: word2: word3: "same string"`

[08:23](#msg585f8213d99b1dd03d2dfc8b)or something like this

[08:23](#msg585f821f61e516c1578eee09)simply said, when you don’t copy

9214

[08:26](#msg585f829ac5a4e0233bc9bb63)@rebolek

```
red>> word1: word2: "some value"
== "some value"
red>> word1
== "some value"
red>> word2
== "some value"
red>> word1: "other value"
== "other value"
red>> word2
== "some value"
```

on last step I want it to be `"other value"` too

rebolek

[08:27](#msg585f830c61e516c1578eee0b)@9214 that’s not how it works.

[08:28](#msg585f832ad99b1dd03d2dfc98)`word2` does not know about `word1`, they are completely unrelated.

9214

[08:28](#msg585f833ec895451b751b4994)@rebolek so words cannot "point" to same block of memory?

rebolek

[08:29](#msg585f835761e516c1578eee0e)no, they can

[08:30](#msg585f8396db9cafe9183a7357)in `word1: word2: "some value"`, `word2:` not only assigns reference to `"some value"` to `word2`, but it also returns that same reference

[08:30](#msg585f83bc96a565f84406b400)so `word1:` gets that same reference as `word2:`

9214

[08:31](#msg585f83ff0730ce6937098582)`word1 --> "some value" <-- word2`  
`change word1 to "other value" somehow (by refference?)`  
`word1 --> "other value" <-- word2`

[08:32](#msg585f840a0730ce693709858b)that's what I mean

maximvl

[08:33](#msg585f843ec02c1a3959ae02bc)no, what happens in last assignment is

```
word1 --> "other value" word2 --> "some value"
```

[08:34](#msg585f847f058ca967378c1d74)so assignment doesn't change the block of memory where word points to, but points word to another block

9214

[08:34](#msg585f849d0730ce69370987bb)@maximvl but how can I change that block of memory to which word points to?

maximvl

[08:35](#msg585f84b4c5a4e0233bc9c025)you don't change the blocks of memory, since this is low level thing

9214

[08:35](#msg585f84b40730ce69370987fb)I just remember tinkering with SICP and that was funny thing to do

maximvl

[08:35](#msg585f84b8058ca967378c1e07)you change things

[08:36](#msg585f8508af6b364a29f41c30)

```
red>> a: b: "string"
== "string"
red>> a
== "string"
red>> b
== "string"
red>> change/part a "STR" 3
== "ing"
red>> a
== "STRing"
red>> b
== "STRing"
```

9214

[08:36](#msg585f8519c02c1a3959ae04f9)@maximvl

```
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
; (last-pair z) => infinite recursion
```

[08:37](#msg585f8544058ca967378c1f80)now last pair of a list point to its first element and we've got infinite list

[08:37](#msg585f85557a3f79ef5d9bc763)can I do something like that in Redbol?

maximvl

[08:37](#msg585f855ec895451b751b4fc9)yes, but this is different from what you did with strings

[08:38](#msg585f859dc02c1a3959ae06f3)I don't think you can make cycle in block

9214

[08:39](#msg585f85a5c895451b751b508c)@maximvl hm, they're stored differently in memory?

maximvl

[08:39](#msg585f85adc895451b751b5096)because the way they work is different

[08:41](#msg585f8635e7bdfe4e2997155b)

```
red>> x: [1 2 3]
== [1 2 3]
red>> t: tail x
== []
red>> insert t head x
== []
red>> x
== [1 2 3 1 2 3]
```

[08:44](#msg585f8708058ca967378c24f7)because behind `series` is something different than `cons` notation

[08:45](#msg585f871c7a3f79ef5d9bce8c)so you don't have `car`s and `cdr`s

[08:45](#msg585f8727058ca967378c258b)which is good

9214

[08:45](#msg585f873e058ca967378c2633)@maximvl though we can create objects which contain themselves

maximvl

[08:46](#msg585f8761c895451b751b55a1)for example?

9214

[08:46](#msg585f87757a3f79ef5d9bcf8a)&gt; http://inception.davepedu.com/

```
red>> inception: context [dicaprio: self]
== make object! [
    dicaprio: make object! [...]
red>> inception/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>> inception/dicaprio/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>> inception/dicaprio/dicaprio/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>> inception/dicaprio/dicaprio/dicaprio/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>> inception/dicaprio/dicaprio/dicaprio/dicaprio/dicaprio
== make object! [
    dicaprio: make object! [...]
]
red>>
```

maximvl

[08:47](#msg585f87997a3f79ef5d9bcfc6)well, yes, you assigned pointer to this object to one of the object's fields

[08:47](#msg585f87b9c895451b751b562d)it doesn't \*contain* itself, it points to itself

9214

[08:48](#msg585f87d2058ca967378c2792)@maximvl yup

rebolek

[08:49](#msg585f880fdb9cafe9183a735c)

```
red>> inception: [1 2 3]
== [1 2 3]
red>> insert/only tail inception inception
== []
red>> inception
== [1 2 3 [...]]
```

9214

[08:51](#msg585f8895e7bdfe4e29971d83)@rebolek :D

geekyi

[10:00](#msg585f98d1c5a4e0233bca0747)@rebolek that thing ~~doesn't~~ points to itself!

[10:02](#msg585f99317a3f79ef5d9c111b)@9214 Basically what I've understood is, `word!`s point to values, and all values are anonymous

[10:03](#msg585f996daf6b364a29f45d0b)`set-word!` a.k.a. `word1:` only changes what the word points to

[10:03](#msg585f9974058ca967378c5f3f)Correct me if I'm wrong

9214

[10:30](#msg585f9fade7bdfe4e29976807)@geekyi what you mean by `anonymous`?

PeterWAWood

[10:50](#msg585fa47e7a3f79ef5d9c383e)Values, even functions and objects, don't have a name.

9214

[10:51](#msg585fa4a67a3f79ef5d9c390b)@PeterWAWood i.e. value ain't "assigned" to any specific name?

[10:52](#msg585fa4fbc895451b751bba6e)so, `func [x] [x + 1]` and `2` are anonymous values?

PeterWAWood

[10:52](#msg585fa502e7bdfe4e29977b7e)yes

9214

[10:53](#msg585fa50c058ca967378c8d16)got that, ty

PeterWAWood

[10:53](#msg585fa522af6b364a29f48805)We can only address them indirectly using words.

[10:55](#msg585fa596af6b364a29f48962)For example, we can think of

```
i: 1
```

as setting i to reference the value 1. Then

```
i: 2
```

sets i to reference the value 2.

9214

[10:55](#msg585fa5ad7a3f79ef5d9c3bde)@PeterWAWood and we can't "point" to the block of memory where this value is stored?

[10:56](#msg585fa5c97a3f79ef5d9c3c3f)i.e. we can access them only via `words`

PeterWAWood

[10:56](#msg585fa5e4c5a4e0233bca3485)That is my understanding.

9214

[10:56](#msg585fa5e80730ce693709f766)I mean, the only way we can point to this value is to set some word to it?

PeterWAWood

[10:57](#msg585fa62c7a3f79ef5d9c3d78)Yes. Though more than one word can point at the same value ... but only if the values are not

```
scalar
```

.

9214

[10:59](#msg585fa6927a3f79ef5d9c3e41)@PeterWAWood oooooh... that's why my example with strings didn't worked

[10:59](#msg585fa6abc5a4e0233bca374a)and since `block!` isn't scalar, we can create self-reference?

PeterWAWood

[10:59](#msg585fa6af058ca967378c92c3)Strings are not scalar values, they are series! like blocks.

[11:00](#msg585fa6cd058ca967378c93e0)This sort of thing?

```
red>> b: [1 2 3 4 5]
== [1 2 3 4 5]
red>> c: :b
== [1 2 3 4 5]
red>> append b 6
== [1 2 3 4 5 6]
red>> c
== [1 2 3 4 5 6]
red>> c: next next c
== [3 4 5 6]
red>> remove c
== [4 5 6]
red>> b
== [1 2 4 5 6]
```

[11:01](#msg585fa7237a3f79ef5d9c3f89)Here is something similar with

```
string!
```

```
red>> s: "12345"
== "12345"
red>> s2: :s
== "12345"
red>> s2: next next s2
== "345"
red>> remove s2
== "45"
red>> s
== "1245"
```

[11:08](#msg585fa8a6e7bdfe4e299786ed)You can create a self-reference but it appears to be infinite (in R2 &amp; R3 too).

```
red>> b: [1 2 3 4]
== [1 2 3 4]
red>> append/only b b
== [1 2 3 4 [...]]
red>> last b
== [1 2 3 4 [...]]
```

9214

[11:09](#msg585fa8e2c5a4e0233bca3fad)@PeterWAWood yes, @rebolek shown that one

## Monday 26th December, 2016

endo64

[07:30](#msg5860c712c5a4e0233bce44ef)@9214 You can simple check if your value is series by using `series?` and if it is, as long as you use series functions like `append`, `insert`, `clear` etc. all the words pointing to that value will "see" the changes.  
There are just a few non-series types which supported by "some" series functions, like `port!`.  
And also some non-scalar types such as `map!`, not supported by series functions but can be referenced by words (as @PeterWAWood points)

```
red>> m: #(a: 1 b 2)
red>> n: :m
red>> ? n
n is a map! of value: #(
    a: 3
    b: 2
)
```

9214

[08:20](#msg5860d2b80730ce69370e324a)btw, why Redol uses `!` postfix convention for datatype words?

rebolek

[08:21](#msg5860d2fb96a565f84406c945)I don’t think there’s any specific reason why it’s `!` and not some other sign.

9214

[08:27](#msg5860d455af6b364a29f8bece)and we can't create our own datatypes in Red for now?

dander

[08:43](#msg5860d81ac5a4e0233bce7dbc)I don't believe it's possible now, but I seem to remember Nenad hinting at allowing it in the future. However, it seems like it could be complicated since so much of the lexical space is taken up by the existing datatypes.

9214

[08:45](#msg5860d8a37a3f79ef5da098ca)@dander true, though we can just label our objects with fictive types somehow

dander

[08:51](#msg5860da27058ca9673790cf61)yeah, I'm still somewhat new myself, but I wonder how much can be gained by creating new types anyway. There is so much flexibility with what is available already.

PeterWAWood

[13:10](#msg586116af058ca9673791c20f)@dander The lack of free lexical space would makes it difficult to introduce new literal types for new datatypes. User defined datatypes might well be supported without a literal equivalent.

Possibly something like this:

```
sq: make square! [4]
```

[13:13](#msg5861178ec02c1a3959b3cd6b)Having a literal form for every type would be nice but not essential ... in fact object! doesn't have one.

redredwine

[17:49](#msg58615817e7bdfe4e299db4be)@rebolek  
thanks for your explanation about it loading the function only once in memory and not reinitialising.

This got me to try a different test - this time using a number instead of a string/series

red&gt;&gt; huh: function \[] [  
[ list: 2  
[ list: list + 5  
[ print list  
\[ ]

red&gt;&gt; huh  
7  
red&gt;&gt; huh  
7  
red&gt;&gt; huh  
7

However , this time we see it is actually reinitialising the variable list to 2 every time I call the function , even if it loads the function once in memory. I would have expected it to return me 7, 12, 17 same as it did for the series ?

so this is where I am more confused, is there a different rule for series/string and another rule for number ?

this is the same example for series/string.  
red&gt;&gt; huh: function \[] [  
[ list: ""  
[ append list "huh"  
[ print list  
\[ ]

red&gt;&gt; huh  
huh  
red&gt;&gt; huh  
huhhuh  
red&gt;&gt; huh  
huhhuhhuh  
red&gt;&gt;

I am confused :-(

Happy Holidays &amp; Happy New Year to all .

greggirwin

[17:51](#msg58615896c5a4e0233bd098e7)@redredwine , yes, the rules are different for `series` values. It takes a little getting used to, then seems perfectly normal.

rebolek

[17:51](#msg586158af61e516c1578f0b68)@redredwine  
&gt; is there a different rule for series/string and another rule for number

Basically, yes. There are scalar values that fit in one Red memory slot (different numbers, like integer, pair, tuple...) and series that do not fit in that space and they work the way described above.

greggirwin

[17:52](#msg586158f3af6b364a29fae343)@9214  
&gt; I mean, the only way we can point to this value is to set some word to it?

Almost, you can have a block refer to values and reference them that way as well.

[17:53](#msg5861591f058ca9673792f747)So the block is still referred to by a word, but it can refer to multiple values that you can reference by index.

redredwine

[17:55](#msg586159950730ce69371060b1)@greggirwin @rebolek - ok. thanks for the confirmation. I'll have to keep this in mind... that it is a different rule for series.

9214

[19:00](#msg586168d1af6b364a29fb291a)@greggirwin hm, turns out `block!` (perhaps any series?) is just an orginized pile of pointers?

[19:02](#msg5861692c058ca9673793406e)and getting element by index is O(1) I suppose?

MPrieto88011\_twitter

[19:02](#msg5861695b7a3f79ef5da30b15)Hi guys, I am new to the Red, from what I saw so far it looks very interesting, specially the road map to include iOS. In the next month I will hit all of the tutorials. I will also keep an eye on this forum to continue learning.

[19:03](#msg5861698be7bdfe4e299e03c8)Are there any specific people to follow on twitter for Red news, articles, etc??

9214

[19:04](#msg586169b9c02c1a3959b55820)@MPrieto88011\_twitter Hello again! You also may want to stick with Rebol for a while, since Red documentation is scarse for now (and Red is heavily influenced by Rebol in a first place).

[19:05](#msg586169efe7bdfe4e299e05db)https://twitter.com/red\_lang perhaps this one will do, also google groups, this chat, git

[19:05](#msg58616a0dc5a4e0233bd0f605)red-lang.org blog ofc

MPrieto88011\_twitter

[19:07](#msg58616a60c5a4e0233bd0f7f9)Thanks, already following on twitter.

[19:08](#msg58616ac4c02c1a3959b55d98)One more question, preferred IDE to develop on Red??

9214

[19:10](#msg58616b0cc02c1a3959b55f2d)@MPrieto88011\_twitter whatever floats your boat ;)

[19:10](#msg58616b2bc5a4e0233bd0fb42)AFAIK there should be Rebol package for Emacs and Red plugin for VScode

[19:15](#msg58616c42c5a4e0233bd1020e)@MPrieto88011\_twitter https://github.com/red/VScode-extension this one looks really good

greggirwin

[19:20](#msg58616d7dc895451b7522a65c)People use a variety of editors. No leading choice AFAIK.

maximvl

[19:20](#msg58616d97c02c1a3959b56e63)@9214  
&gt;turns out block! (perhaps any series?) is just an orginized pile of pointers?

Any series, series is structure with specific interface: http://www.rebol.com/docs/core23/rebolcore-6.html#section-1

[19:21](#msg58616dbac5a4e0233bd10ad8)it contains pointers, but you shouldn't see them most of the time

[19:21](#msg58616dc7c02c1a3959b56fae)it is just data for you

greggirwin

[19:23](#msg58616e1faf6b364a29fb46aa)@9214, `any-string!` types will be different than `any-block!` types in what values they can refer to. Strings are a series of `char!` values, but do not store each char as a unique value in a slot, as blocks do with values. That would be unnecessary overhead.

[19:24](#msg58616e880730ce693710c227)Blocks don't contain direct pointers. You could think of them as an ordered collection of "value slots".

9214

[19:25](#msg58616ea5c5a4e0233bd10ec0)@greggirwin slot is some allocated memory, correct?

[19:25](#msg58616eb8058ca96737935e9d)like linked list?

maximvl

[19:26](#msg58616ee1c5a4e0233bd11054)something like array with double linked-list interface and few more features :)

[19:27](#msg58616f310730ce693710c585)array because of O(1) access

9214

[19:28](#msg58616f577a3f79ef5da328ff)and double linked list because we can manipulate it freely?

[19:28](#msg58616f64c02c1a3959b57795)add/remove/append/etc

greggirwin

[19:28](#msg58616f67af6b364a29fb4c1f)Details will vary by exact block type.

```
red>> ? any-block!
any-block! is a typeset! of value: make typeset! [block! paren! path! lit-path! set-path! get-path! hash!]
```

A "slot" is, effectively, a value. Some types can fit entirely in the slot (e.g. small scalars), while others will point to data elsewhere (e.g. series).

maximvl

[19:29](#msg58616f7fc5a4e0233bd11324)yes, and you can go to next/prev/first/last index, while linked list can only go to next

greggirwin

[19:29](#msg58616fb5e7bdfe4e299e22f7)I almost never, in many years of Reboling, thought about the internal implementation details. Program against the interface, and be aware that different types have different behaviors and strengths.

[19:30](#msg58616fc6c5a4e0233bd114b7)If you really need to know, look at the source.

9214

[19:30](#msg58616fd6058ca9673793652e)@greggirwin yup, data abstraction, I just wanna grasp the lower details, sort of

greggirwin

[19:31](#msg58617023c895451b7522b3fd)There are a lot of details, because there are a lot of types. One important, clarifying document we need to get out there is a comparison of block!, hash!, map!, and object! so the tradeoffs are clear.

9214

[19:33](#msg58617081c02c1a3959b57e04)@greggirwin map is a key-value list?

greggirwin

[19:33](#msg58617083c5a4e0233bd11887)I mainly think of blocks as arrays of values. Rarely do I have to think in terms of value slots/structures.

[19:34](#msg586170aac02c1a3959b57e7f)Map is a dictionary or associative array, correct.

9214

[19:34](#msg586170cfc5a4e0233bd11a0b)@greggirwin but hash is an associative array too, what's the diffrence then? Hash is more effective?

greggirwin

[19:34](#msg586170d07a3f79ef5da32fb2)\*But* you can use blocks as dictionaries too, just not quite as conveniently.

9214

[19:35](#msg586171000730ce693710cdc3)@greggirwin yeah, I want to ask if `hash!` and `map!` are conceptually the same as `block!` wih key-value pairs

greggirwin

[19:35](#msg58617105c5a4e0233bd11b0b)Hash! is a block type, map! is not. Hashes are not fixed as key-value pairs, maps are.

9214

[19:36](#msg58617127e7bdfe4e299e2a48)@greggirwin `map!` can only store scalar values?

greggirwin

[19:36](#msg586171407a3f79ef5da3328d)

```
red>> ? any-block!
any-block! is a typeset! of value: make typeset! [block! paren! path! lit-path! set-path! get-path! hash!] 

red>> ? any-object!
any-object! is a typeset! of value: make typeset! [object! error!] 

red>> ? any-string!
any-string! is a typeset! of value: make typeset! [string! file! url! tag! email!] 

red>> ? typeset!
     any-block!      :  make typeset! [block! paren! path! lit-path! set-path! get-path! hash!] 
     any-function!   :  make typeset! [native! action! op! function! routine!] 
     any-list!       :  make typeset! [block! paren! hash!] 
     any-object!     :  make typeset! [object! error!] 
     any-path!       :  make typeset! [path! lit-path! set-path! get-path!] 
     any-string!     :  make typeset! [string! file! url! tag! email!] 
     any-type!       :  make typeset! [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! word! set-word! lit-word! get-word! refinement! issue! native! action! op! function! path! lit-path! set-path! get-path! routine! bitset! object! typeset! error! vector! hash! pair! percent! tuple! map! binary! time! tag! email! image! event!] 
     any-word!       :  make typeset! [word! set-word! lit-word! get-word! refinement! issue!] 
     default!        :  make typeset! [datatype! none! logic! block! paren! string! file! url! char! integer! float! word! set-word! lit-word! get-word! refinement! issue! native! action! op! function! path! lit-path! set-path! get-path! routine! bitset! object! typeset! error! vector! hash! pair! percent! tuple! map! binary! time! tag! email! image!] 
     immediate!      :  make typeset! [datatype! none! logic! char! integer! float! word! set-word! lit-word! get-word! refinement! issue! typeset! pair! percent! tuple! time!] 
     internal!       :  make typeset! [unset! event!] 
     number!         :  make typeset! [integer! float! percent!] 
     scalar!         :  make typeset! [char! integer! float! pair! percent! tuple! time!] 
     series!         :  make typeset! [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! image!] 
typeset! is a datatype! of value: typeset!
```

9214

[19:37](#msg58617173058ca96737936cf6)this type system is bizzare, can't get used to it :smile:

greggirwin

[19:37](#msg58617176c5a4e0233bd11d06)Map can refer to any kind of value, but \*keys* in maps can't be of every type.

9214

[19:37](#msg586171840730ce693710cfef)@greggirwin yeah, thats what I mean

[19:37](#msg5861718eaf6b364a29fb57f9)but in `hash!` keys can be of any type

greggirwin

[19:38](#msg58617198e7bdfe4e299e2c79):^) Once you \*do* get used to it, you'll probably like it. There are a lot of Aha! moments with Red.

[19:38](#msg586171cc7a3f79ef5da33598)In `hash!` there aren't really keys, or the concept of paired values. i.e. every value is hashed, and can be of any type.

[19:39](#msg586171da0730ce693710d105)Someone may correct me on that though.

9214

[19:39](#msg58617206058ca96737936ef3)every element has an unique key based on the content of that element?

[19:46](#msg586173abaf6b364a29fb63bf)will Red target WASM at 1.0?

greggirwin

[19:49](#msg58617466c5a4e0233bd12bda)On hashes, yes. e.g. given a block with 100'000 elements, where only the last is "test":

```
red>> time-it/count [find blk "test"] 1000
== 0:00:03.639
```

And with a hash!

```
red>> time-it/count [find hsh "test"] 1000
== 0:00:00.004000001
```

[19:50](#msg586174840730ce693710de8a)I don't think WASM is on the roadmap at this point.

MPrieto88011\_twitter

[22:07](#msg586194a4058ca967379427ce)@9214 You said to "stick with Rebol for a while". Excuse my ignorance, but I thought Rebol was no longer maintained/Developed? Is Red ready to create simple business programs GUI and to connect to database with multiple users?

maximvl

[22:20](#msg5861979fc895451b75238575)@MPrieto88011\_twitter I don't think Red is ready for that, you can probably write what you want, but I wouldn't call it ready

MPrieto88011\_twitter

[22:32](#msg58619a8a7a3f79ef5da405ba)So far this is mi understanding of Red:  
1\) Documentation: Use Rebol's documentation. 95% is the same as Red.  
2\) Red's capabilities: I can program almost anything I want, but it is not ready for commercial purposes.  
3\) Red is fun: I really enjoy the paradigm shift from regular programming languages.

geekyi

[23:18](#msg5861a52ec5a4e0233bd21eaf)@MPrieto88011\_twitter  
1\. yes  
2\. Most people here still use Rebol (version 2 in particular, me included), so there is a community, and it is relatively bug-free (stable, well documented workarounds, etc)  
Red is alpha, but developing rapidly. When I started with it about a year ago, half the functionality it has now wasn't there (such as `read`)

[23:26](#msg5861a721e7bdfe4e299f291f)@9214 you mean \[WebAssembly](https://en.wikipedia.org/wiki/WebAssembly)? Doc talked about it here. So hopefully sometime in the future

[23:27](#msg5861a752058ca96737947c3a)Trello \[roadmap](http://www.red-lang.org/p/roadmap.html) is the best place to look

greggirwin

[23:32](#msg5861a8a00730ce693711d0a7)@MPrieto88011\_twitter, Red has no GC yet, and there are a number of things that we still consider alpha, though it is very robust in most areas. You have to evaluate your needs against it to see if it's usable for you.

## Tuesday 27th December, 2016

9214

[09:33](#msg58623574c5a4e0233bd46fac)@geekyi yup, I was just wondering if Redbol is suitable for web apps.

## Thursday 29th December, 2016

koba-yu

[03:03](#msg58647cf90730ce69371edae3)Hi, I am trying to make an app to save an image by input characters.  
Now I have the code below. It can show input characters as image on view.  
But when I save it for a file, the saved image is just white and blank.  
Could anyone teach me what I am wrong?

```
input: ""
view [  
	text "Input some characters here"
	return
	editor: field 200x500 input focus
	canvas: base 500x500 white react [		
		input: editor/text
		face/draw: compose [			
			text 10x10 (input)
		]	
	]
	button "save as file..." [    		
		save request-file/save draw 500x500 compose [						
			text 10x10 (input)
		]			
  ]  
]
```

[03:52](#msg586488869e6f00e74ad2b4ae)Well, I tried the "Graphics source code" sample on \[this page](https://doc.red-lang.org/gui/Draw.html#graphics-source-code).  
Also in this example, text objects seems not to be drawn though lines drawn.  
Something's wrong with text object?

endo64

[07:08](#msg5864b6859d4cc4fc53522f48)I think there is a problem in `draw` command &amp; text dialect:

```
red>> i: make image! 50x50
== make image! [50x50 #{
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ;<<< empty white image
red>> draw i [text 0x0 "test"]
== make image! [50x50 #{
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF  ;<<< no change at all
red>> draw i [box 0x0 10x10]
== make image! [50x50 #{
30303000000000000000000000000000000000000000000 ;<<< box ok
```

[07:09](#msg5864b6a40730ce69371fcbe3)Better to raise a ticket for this.

koba-yu

[07:12](#msg5864b75b9e6f00e74ad36ea0)@endo64 Thank you, may I open it?

endo64

[07:13](#msg5864b78fc895451b7531727f)Sure, please do it.

koba-yu

[07:13](#msg5864b7a6af6b364a2909902b)@endo64 Thanks, I do.

[07:28](#msg5864bb2bc02c1a3959c45481)@endo64 I open the issue \[here](https://github.com/red/red/issues/2385).  
Thank you very much for your help!

endo64

[08:25](#msg5864c8857a3f79ef5db275c9)You are welcome!

## Friday 30th December, 2016

MPrieto88011\_twitter

[18:42](#msg5866aaa0c02c1a3959cd038f)I am reading the red language specs and I am looking at the section about casting types \[casting section 4.3.2](http://static.red-lang.org/red-system-specs.html#section-2.1) . I tried the casting example:  
'pi: 3.14159265358979  
pi-32: as float32! pi  
print pi-32'

but I get an error message \** Script Error: as has no value \*\** Where: print

Am I doing something wrong??

[18:44](#msg5866ab039d4cc4fc535b0398)sorry about the way I wrote the last message ignore the ' at the beginning of the code. I was trying to use the markdown for code but I didn't work. :

9214

[18:48](#msg5866abf9af6b364a29125d38)@MPrieto88011\_twitter I think type-casting is available in Red/System only

MPrieto88011\_twitter

[18:53](#msg5866ad2a9d4cc4fc535b0dfa)Sorry guys, I am doing my first steps with Red. What is the difference between Red/red, Red/System. Are those different downloads? I downloaded the executable from the Red website. I imagine I have the Red\\red system. How do I use the other systems? The red\\gui or the red/system?

9214

[18:56](#msg5866adc4058ca96737ab7d85)@MPrieto88011\_twitter Red/System is Red's DSL (domain specific language) for low level stuff. It's also a target language for Red compilation I believe.

[18:56](#msg5866ade59e6f00e74adc0812)http://www.red-lang.org/2011/03/taking-redsystem-pill.html

[18:57](#msg5866ae357a3f79ef5dbb04a0)http://www.red-lang.org/2011/05/redsystem-compiler-overview.html

[18:59](#msg5866ae950730ce693728fbb5)@MPrieto88011\_twitter as for typecasting in Red, I think this one will do:

```
red>> pi: make integer! 3.1415926535897932384
== 3
```

[19:03](#msg5866af930730ce693729011d)and View (the one you've called red/gui) is just another Red's DSL for graphics and UI

MPrieto88011\_twitter

[19:03](#msg5866af9f058ca96737ab86b0)Thanks guys!!

9214

[19:05](#msg5866afef0730ce693729023e)it's ~~turtles~~ dsls all the way down! :turtle:

MPrieto88011\_twitter

[19:09](#msg5866b0e09d4cc4fc535b212f)@9214 That didn't work pi: make integer! 3.141592653589  
I get an error message nternal Error: reserved for future use (or not yet implemented)  
\*\** Where: make

endo64

[19:54](#msg5866bb5dc895451b753a507b)You can also try `to` for type casting: `pi: make integer! 3.1415926535897932384`

[19:54](#msg5866bb88c02c1a3959cd5702)But `make` should also work, did you download Red console earlier and didn't get the latest one?

greggirwin

[21:34](#msg5866d2f27a3f79ef5dbbb99c)A lot of type casting improvements were added recently Mario. If you build from source, or wait a bit for the 0.6.2 release, it will work.

geekyi

[21:42](#msg5866d4dec02c1a3959cdc9f0)@MPrieto88011\_twitter and it all works from the same binary download! ;)

[22:05](#msg5866da150730ce693729c35e)@MPrieto88011\_twitter btw, it should work with the unstable "nightly" build, same page as you probably downloaded (stable 0.6.1) red from

[22:05](#msg5866da339d4cc4fc535c032b)And `cntrl shift m` for markdown help ;)

iArnold

[22:09](#msg5866db04c895451b753ad745)π ?  
https://github.com/red/red/search?utf8=%E2%9C%93&amp;q=pi%3A  
https://github.com/red/red/pull/1982  
τ !  
https://www.tauday.com/

geekyi

[22:20](#msg5866dd9bc02c1a3959cdebfc):+1:

maximvl

[22:22](#msg5866de0f058ca96737ac6340)@9214 there is a shortcut ;)

```
red>> source to-integer
to-integer: func ["Convert to integer! value" value][to integer! :value]
```

## Saturday 31st December, 2016

9214

[09:35](#msg58677bfdc02c1a3959d015ff)I don't get why we need `to-type`shortcuts

[09:44](#msg58677e057a3f79ef5dbe1247)IMO it's too verbose

maximvl

[12:14](#msg5867a131af6b364a2915e6e7)@9214 there are a lot of shortcuts in Redbol and they all are useful:

```
red>> off = false
== true
red>> no = false
== true
```

geekyi

[21:09](#msg58681e88c02c1a3959d2882d)&gt; `to-type`shortcuts

@9214 you mean you'd rather `to integer!`? I'd agree. But if it wasn't for those being auto-completed, I wouldn't have know all the many `to` conversions. Just a small counter point. I agree with you otherwise


#5314: Unexpected file differencies between multiple runs, and File write error. 
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 8 comment(s).
<https://github.com/red/red/issues/5314>

To find new words between an old and a new Red version, I use the following script:

```
;Red []
Rebol [
	Title: "NewWords.red"
]

mee: [
	system/script/args: to-file system/script/args
	write system/script/args "" 
	words-defined: words-of system/words
	forall words-defined [
		if value? first words-defined [

			if any-function? get first words-defined [
				WRITE/append/lines system/script/args TO-STRING first words-defined
			]

		]
	]
]

do/args mee "words-red.txt"

save %save-words.r head insert tail insert copy/deep mee reduce ['Red []] reduce ['quit]

;---------------vvvvvvvvvvv---Change-here-----------------
call/wait "red-old.exe save-words.r words-red-old.txt"

foreach word sort exclude read/lines %words-red.txt read/lines %words-red-old.txt [
	Print ["New-word: " word]
]

delete %words-red-old.txt
;delete %words-red.txt (uncommenting this removes the problem)
delete %save-words.txt

halt
```

The concept is simple:
It starts the code block defined in `mee:` passing the destination filename `words-red.txt` as ARG, then this code saves all the words defined as `any-function?` to a file. 
Then, it saves `mee` to a script and starts an old version of RED (or Rebol) passing the saved code block as argument with another destination filename for the old Red word file using `call/wait "red.exe saved-script.r words-red.old.txt"

**The bug**

Well, the problem are 2:

1) Red cannot open a just saved `words-red.old.txt` file reporting an error

2) On multiple runs we have different results returned from the code which compares the two wordfiles. In this specific case, the words `to` and `not` in the saved wordfile(s) appear to be joined into `tonot`, while they shouldn't, because the script starts with the following code to clear the saved wordfiles: `write to-file system/args ""`. Also, sometime `to` and `not` are not saved and do not appear in the wordfile. 
**Note: my dev enviroment is into a streamed google drive windows directory which could cause this second problem.**

@hiiamboris confirms the write error but he cannot test it further because the code doesn't go beyond this step.

**To reproduce**
Run the code multiple times.

**Expected behavior**
Run and always display the same difference 

**Platform version**
Please specify the operating system, Red version, and build date with Git commit.
```
---RED and PLATFORM VERSION---

RED: [ branch: "master" tag: #v0.6.4 ahead: 4668 date: 17-Apr-2023/12:25:59 commit: #59eaf9a634c8ce701748068629d25594086ca044 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22621 ]
```

I run the code from windows CMD




Comments:
--------------------------------------------------------------------------------

On 2023-05-06T22:34:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5314#issuecomment-1537235416>

    Sorry if I made you feel this way, but I never confirmed any write error. My problem was "INVALID ENCAPSULATED DATA" crash resulting in your script not producing any file, and https://github.com/red/red/issues/5315 misleading me into thinking it's related to the `call`. I also told you this code is too complicated to figure anything out and you shouldn't post it until you make an effort to minimize it. At this point you have no idea who's the culprit - new Red, old Red, Google or Windows, and my assumption is a bug in the old build you're testing should be the working hypothesis until you can prove otherwise. 

--------------------------------------------------------------------------------

On 2023-05-07T00:04:21Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5314#issuecomment-1537248419>

    Let's start isolating the first problem: `cannot open: words-red-old.txt`
    
    1) I have put the script outside google drive and the problem persists, so it is not a google drive related one.
    
    2) I have changed `red-old.exe` into `red.exe` and the problem disappears running the new red version impersonating the old one
    
    3) Red-0.63.exe shows the same behaviour, so it could be a BUG that has already been fixed... (I am continuing testing)
    
    
    `
    
    
    

--------------------------------------------------------------------------------

On 2023-05-07T00:20:10Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5314#issuecomment-1537251224>

    You can close the ticket, the bug causing these behaviours does not show when the the called version is a recent one.

--------------------------------------------------------------------------------

On 2023-05-07T09:14:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5314#issuecomment-1537366418>

    > Let's start isolating the first problem: `cannot open: words-red-old.txt`
    > 
    >     1. I have put the script outside google drive and the problem persists, so it is not a google drive related one.
    > 
    >     2. I have changed `red-old.exe` into `red.exe` and the problem disappears running the new red version impersonating the old one
    > 
    >     3. Red-0.63.exe shows the same behaviour, so it could be a BUG that has already been fixed... (I am continuing testing)
    > 
    > 
    > `
    
    #5315


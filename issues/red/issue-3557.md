
#3557: Simple hello world program on docs fails to run
================================================================================
Issue is closed, was reported by liminalitythree and has 50 comment(s).
<https://github.com/red/red/issues/3557>

### Expected behavior
The hello world program runs

### Actual behavior
it outputs the error
```
*** Script Error: view has no value
*** Where: ???
```

### Steps to reproduce the problem
Write the following into a text file
```
Red [Needs: 'View]

view [text "Hello World!"]
```

run
```
red -c hello.red
./hello
```

### Red and platform version
```
Run below code in Red Console and replace these 3 lines enclosed in ``` with the result:
  any [attempt[about/debug] about]
(add OS version if not in above command result)
```
```
>> any [attempt[about/debug] about]
Red for Linux version 0.6.3 built 10-Oct-2018/14:00:16-06:00
*** Script Error: block did not return a value
*** Where: any
*** Stack:  
```
I'm using solus linux


Comments:
--------------------------------------------------------------------------------

On 2018-10-10T21:54:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3557#issuecomment-428746868>

    The stable and dev (master branch) versions of Red don't include a GUI backend for Linux. There is a WIP backend for GTK on [this branch](https://github.com/red/red/tree/GTK) which implements roughly 50% of the features.

--------------------------------------------------------------------------------

On 2018-10-10T22:52:24Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428760175>

    oh. It would be nice if the getting started page mentioned this somewhere. 
    
    edit: it actually does, but not in a very noticable way. I don't think it makes sense to say red has a cross platform gui library in the about page when it only works on windows. 

--------------------------------------------------------------------------------

On 2018-10-10T23:42:35Z, qtxie, commented:
<https://github.com/red/red/issues/3557#issuecomment-428769171>

    @liminalitythree It works on macOS too.

--------------------------------------------------------------------------------

On 2018-10-11T00:24:05Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428776180>

    not working on linux means it's not cross platform. 

--------------------------------------------------------------------------------

On 2018-10-11T00:27:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-428776794>

    @liminalitythree working on Windows and Mac means it is cross platform. :^)

--------------------------------------------------------------------------------

On 2018-10-11T00:28:30Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-428776910>

    And while Android is an experimental branch, it also works there.

--------------------------------------------------------------------------------

On 2018-10-11T00:32:13Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428777465>

    No, that means it works on windows and mac. Even though technically working on two platforms may mean cross platform when people say cross platform they mean windows, linux, and osx. If I said I made a cross platform library but it only actually runs on iOS and windows for ARM you would say I'm being dishonest and using semantics to make my library seem better than it is. 

--------------------------------------------------------------------------------

On 2018-10-11T00:36:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-428778099>

    So if we run on Windows, MacOS, Android, iOS, and any number of other GUI capable systems, we still can't say we're cross platform if we don't support Linux GUIs? What specific Linux GUIs meet that requirement? Not everyone will agree that GTK is enough.

--------------------------------------------------------------------------------

On 2018-10-11T00:37:19Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428778246>

    being able to use the gui library on linux like you would any of those other platforms. the implemention details don't matter. 

--------------------------------------------------------------------------------

On 2018-10-11T00:38:44Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-428778469>

    The implementation details *do* matter, as not all Linux's are created equal. It would just lead to another semantic argument from someone.

--------------------------------------------------------------------------------

On 2018-10-11T00:39:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-428778670>

    Let us consult the oracle: https://en.wikipedia.org/wiki/Cross-platform_software

--------------------------------------------------------------------------------

On 2018-10-11T00:40:12Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428778700>

    being able to run on an average linux installation like all cross platform programs do. you're the one arguing tiny details.

--------------------------------------------------------------------------------

On 2018-10-11T00:41:42Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-428778948>

    >  like all cross platform programs do
    
    No, you're defining something to meet your needs.
    
    Per Wikipedia: Cross-platform programs may run on as many as all existing platforms, or on as few as two platforms. 

--------------------------------------------------------------------------------

On 2018-10-11T00:45:26Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-428779597>

    And, as noted above, it **is** supported on Linux, in a branch, in progress, and incomplete. :^)

--------------------------------------------------------------------------------

On 2018-10-11T00:45:41Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3557#issuecomment-428779633>

    This issue should be closed. The GTK+ backend is not scheduled to be worked on by the Red Team until after the Alpha 0.9.0 release (at the earliest). That the current GTK+ branch is roughly 50% complete is a great credit to those members of the Red community that have taken it that far (with much appreciated guidance from @qtxie).

--------------------------------------------------------------------------------

On 2018-10-11T00:46:12Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428779727>

    Yeah, technically they can. But when you're advertising a cross platform desktop GUI library everyone expects it to work on linux, windows, and osx. Those are the three major desktop platforms. Many gui libraries also support lesser-known platforms but supporting all three of those is basically a requirement for being called a cross platform gui library. Can you name any "cross-platform" gui library that's moderately popular, in any language that doesn't support one of those three? (other than red of course)

--------------------------------------------------------------------------------

On 2018-10-11T00:47:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3557#issuecomment-428780000>

    Worthwhile contributions from the community to the GTK+ backend are always welcome.
    

--------------------------------------------------------------------------------

On 2018-10-11T00:48:22Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428780076>

    and its fine to be in development, I'm just meaning that its a bit misleading to say it's cross platform right now when it isn't yet

--------------------------------------------------------------------------------

On 2018-10-11T00:49:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-428780212>

    I agree with Peter, and will close this. 
    
    > supporting all three of those is basically a requirement for being called a cross platform gui library
    
    My point is, where is that written? "Everybody knows..." is not justification. Aaaaannnd, we *do* run on Linux, don't we? In a branch....in alpha software.

--------------------------------------------------------------------------------

On 2018-10-11T00:50:19Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428780381>

    Words don't have to be written down in a dictionary to have meaning. Their meaning is how they're used. If you can't find any library that's called cross platform but doesn't support one of those, that means that word isn't used that way.

--------------------------------------------------------------------------------

On 2018-10-11T00:53:16Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-428780855>

    Oh, wouldn't it also be better to give an error when I try to import the `View` library that doesn't exist, rather than when I try to use the imported library? That might make it a bit more clear

--------------------------------------------------------------------------------

On 2018-10-11T09:35:22Z, 9214, commented:
<https://github.com/red/red/issues/3557#issuecomment-428888634>

    @liminalitythree what would be better is for you to stop imposing ad-hoc concepts and breed polemic on a bug tracker. This doesn't solve any problems, raises tension and puts you in a bad light.
    
    Accusing developers of being dishonest for calling cross-platform alpha software, well, _cross-platform_, and labeling info about graphical engine an "advertisement" is quite impolite, don't you think?
    
    @greggirwin I suggest to put info about Red being alpha (50% finished GTK backend and respective branch of development, missing functionality, link to roadmap &c) somewhere, explicitly and with due emphasis, to nip potential cases like that in the bud.

--------------------------------------------------------------------------------

On 2018-10-11T15:30:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3557#issuecomment-429000339>

    Sounds good @9214. Where is the best "somewhere"?

--------------------------------------------------------------------------------

On 2018-10-11T16:10:26Z, 9214, commented:
<https://github.com/red/red/issues/3557#issuecomment-429016770>

    @greggirwin I believe at the bottom of [this](https://github.com/red/red#red-programming-language) section, a general "caveat emptor" with a link to Trello roadmap.

--------------------------------------------------------------------------------

On 2018-10-11T17:43:52Z, liminalitythree, commented:
<https://github.com/red/red/issues/3557#issuecomment-429051636>

    I was talking about your website. I think that would be fair to call an advertisement for the language. 



#3325: Latest console has trouble with dead keys
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3325>

### Expected behavior

Dead keys like `"` (there are about six on my keyboard) should be handled correctly, i.e. a `"` keypress should not give an echo, and the `"` character should appear after a subsequent `space` keypress. Likewise, a `"` followed by an `a`  should result in an `ä` appearing.
### Actual behavior

The first `"` keypress echoes a `"`, and the following `space` gives another `"`. Likewise, `"` followed by `a` gives `"ä`.

### Steps to reproduce the problem

Do the keypresses as shown above, on a keyboard with dead keys (mine is a Logitech K270).

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 595 date: 6-Apr-2018/13:49:30 commit: #f53f9073931e1acc7ee00e9ddad4615e14326a68 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 16299 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-11T12:15:48Z, meijeru, commented:
<https://github.com/red/red/issues/3325#issuecomment-380430705>

    I should say that this error makes it almost impossible to type anything with quotes into the console.
    
    The latest (Rich Text) download has not solved this.

--------------------------------------------------------------------------------

On 2018-04-11T13:48:15Z, qtxie, commented:
<https://github.com/red/red/issues/3325#issuecomment-380458169>

    @meijeru Does the old gui console has this issue?

--------------------------------------------------------------------------------

On 2018-04-11T13:50:42Z, meijeru, commented:
<https://github.com/red/red/issues/3325#issuecomment-380458984>

    Not that I remember.

--------------------------------------------------------------------------------

On 2018-04-11T16:43:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3325#issuecomment-380518888>

    @meijeru is there a "dead key" reference somewhere? I'm not familiar with the term and can't dupe this (win7 ATM). 

--------------------------------------------------------------------------------

On 2018-04-11T16:50:42Z, meijeru, commented:
<https://github.com/red/red/issues/3325#issuecomment-380521190>

    On my keyboard the single and double quotes (as well as a few other keys) do not immediately yield a character. Instead, the system waits for the next key, and types the quote over the next character if that is a space, or turns it into an accent (for ') or diairesis (for ") when that next character is a vowel. That is a way to produce accented letters (á, ä etc.). Works also with back-tick `, tilde ~ and caret/circumflex (^) . It even does '+c = ç, ~+n=ñ and a few more.

--------------------------------------------------------------------------------

On 2018-04-11T16:52:36Z, meijeru, commented:
<https://github.com/red/red/issues/3325#issuecomment-380521780>

    See also [wikipedia](https://en.wikipedia.org/wiki/Dead_key)
    
    I have set my keyboard for Windows 10 to US International - this is necessary to generate the desired dead key behaviour (US standard does not know dead keys).

--------------------------------------------------------------------------------

On 2018-04-11T23:50:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3325#issuecomment-380630535>

    Interesting. I'm transitioning to Win10, but maybe someone else will chime in to confirm before I do.


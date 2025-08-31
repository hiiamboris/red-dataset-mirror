
#893: latest release 0.4.3 (commit 1ddcdc66e8) pre-compiles console everytime
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/893>

Whenever I start red.exe, it pre-compiles the console.



Comments:
--------------------------------------------------------------------------------

On 2014-08-03T23:26:32Z, qtxie, commented:
<https://github.com/red/red/issues/893#issuecomment-51006719>

    @meijeru It's work fine on my Win 7. What OS are you using?

--------------------------------------------------------------------------------

On 2014-08-04T07:02:29Z, dockimbel, commented:
<https://github.com/red/red/issues/893#issuecomment-51023967>

    I cannot reproduce that issue either. @meijeru Can you give us more info about your configuration?

--------------------------------------------------------------------------------

On 2014-08-04T07:06:54Z, dockimbel, commented:
<https://github.com/red/red/issues/893#issuecomment-51024383>

    There is a possible explanation for that. To decide whether or not to re-compile the console, Red compares the modification date of the console binary with its internal "build-date" value. Given that I have changed my server timestamp to match my new timezone (China), the build-date value might have been in the future for you for a few hours. During that time, your console binary timestamp will be always behind, triggering new recompilation each time.
    
    If this is the right explanation, I guess it should work fine for you now, isn't it?

--------------------------------------------------------------------------------

On 2014-08-04T07:19:47Z, meijeru, commented:
<https://github.com/red/red/issues/893#issuecomment-51025187>

    To answer your first question: I am running Windows 8.1, with red.exe residing in C:\Program Files (x86)\Red\red.exe. To react to your second one: yes it works now. So we can close this, except that I suspect others not residing in China timezone might encounter the same issue....

--------------------------------------------------------------------------------

On 2014-08-04T07:36:27Z, dockimbel, commented:
<https://github.com/red/red/issues/893#issuecomment-51026226>

    I will leave it open for now, as I need to think about a workaround for that annoying issue that will repeat itself on each new release...

--------------------------------------------------------------------------------

On 2014-11-04T21:28:13Z, kealist, commented:
<https://github.com/red/red/issues/893#issuecomment-61717707>

    This happens to me as well


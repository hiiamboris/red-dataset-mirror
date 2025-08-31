
#2772: Quoted cmd arguments on Windows are not converted correctly
================================================================================
Issue is closed, was reported by Oldes and has 6 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/2772>

Using code:
```
argument: system/args-list + 1
home-dir: argument/item
print-line ["Julia home dir: " home-dir]
```
and than:
```
c:\dev\GIT\Red>julia "c:\dev\Julia-0.5.2\bin\"
Julia home dir: c:\dev\Julia-0.5.2\bin"
```
Notice that there should be: `c:\dev\Julia-0.5.2\bin\` not `c:\dev\Julia-0.5.2\bin"`


Comments:
--------------------------------------------------------------------------------

On 2017-06-09T17:41:10Z, dander, commented:
<https://github.com/red/red/issues/2772#issuecomment-307453485>

    Command-line escaping is somewhat complex on Windows. I think this is a useful reference:
    https://blogs.msdn.microsoft.com/twistylittlepassagesallalike/2011/04/23/everyone-quotes-command-line-arguments-the-wrong-way/

--------------------------------------------------------------------------------

On 2018-11-20T23:41:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/2772#issuecomment-440468850>

    According to https://docs.microsoft.com/en-us/previous-versions//17w5ykft%28v=vs.85%29 and https://docs.microsoft.com/en-us/windows/desktop/api/shellapi/nf-shellapi-commandlinetoargvw this is standard for programs using msvc libs. You have to escape the last slash: "c:\dev\Julia-0.5.2\bin\\\\".
    
    Although it is also true that many of MS' own tools (those from System32/ for instance) all handle the arguments differently, and I should say that more often than not they do not do any backslash escaping at all (hence the ticket).
    
    In fact I too consider this escaping harmful to the filenames: not so apparent with Julia, but if you write `move source destination\` then the last backslash determines the meaning of the action.
    
    In any case, we should either close this ticket and follow the msvc standard, or (preferably) resort to simpler argument processing: no escaping, args are delimited by unquoted space and tab chars, like the cmd.exe itself does.
    
    Community votes anyone?

--------------------------------------------------------------------------------

On 2018-11-21T00:49:33Z, greggirwin, commented:
<https://github.com/red/red/issues/2772#issuecomment-440485682>

    I'm all for simpler. Please post a link to this on gitter to get more input as well. While we're in the code, let's get the most out of it.
    
    We don't have a page/docs for command line handling yet, which would be good to start, and make sure cross platform behavior is as consistent as possible. I'll also post my very old cmdline dialect stuff for any value it might have.


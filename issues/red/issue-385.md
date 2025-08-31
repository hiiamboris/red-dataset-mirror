
#385: Complex #include path bug
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/385>

This is a variant of #252 involving multiple files. Please have a look at the SQLite binding.

%SQLite.red includes %SQLite.reds. That works, but when examples/do-sql.red includes ../SQLite.red, SQLite.reds is suddenly searched for in examples/SQLite.reds so it needs to be fixed by adding the full path in SQLite.red.

The same happens when common/examples/console-pro.red includes ../../C-library/C-library.red which includes %C-library.reds.

I think this regressed with the latest changes to the path fixes, because I think earlier, #252 was fixed. Or perhaps it was only fixed when compiling the main %C-library.red/%SQLite.red standalone.



Comments:
--------------------------------------------------------------------------------

On 2013-01-19T21:43:12Z, dockimbel, commented:
<https://github.com/red/red/issues/385#issuecomment-12461708>

    _There are absolute paths specific to your config left in `%C-library.red` and `%SQLite.red`._
    
    Anyway, I have reproduced the issue.

--------------------------------------------------------------------------------

On 2013-01-19T22:30:59Z, dockimbel, commented:
<https://github.com/red/red/issues/385#issuecomment-12462411>

    It seems that this is not possible to solve it as is. As Red/System code compilation is deferred, the Red "current script" path is lost when Red/System compiler hits one of these #include directives. Are you sure such complex files inclusion layout has ever worked? _Simple cases might have worked though._
    
    The long term approach (Red/System v2) of having some form of packaging or modules for such libraries would avoid such class of issues. Also a modular compilation approach should also help avoid such issues. Currently, all Red code is compiled to a single Red/System program in memory with everything (runtime + user code) inside.
    
    For the short term, the only solution I can see is adding a new #system-include directive to Red that should be used to include Red/System files from Red programs. In order to let Red/System compiler still be able to process existing Red/System bindings, a conditional compilation directive (#if) should be used around #include directives for Red/System libraries that need to run both embedded in Red programs and standalone. It is not a very elegant solution, but I don't see, right now, any better one. I would add a new testable compilation option to indicate if a given Red/System script is compiled from Red or standalone. Other propositions/solutions are welcome.

--------------------------------------------------------------------------------

On 2013-01-20T08:03:22Z, dockimbel, commented:
<https://github.com/red/red/issues/385#issuecomment-12467415>

    Actually, there is an alternative option I am considering, to avoid making too many additions and changes: preprocess #system\* directives for adding contextual current path to included files. It is not efficient, but as long as the code in #system\* directives is not huge, it shouldn't slow down the compilation noticeably.

--------------------------------------------------------------------------------

On 2013-01-20T08:54:40Z, dockimbel, commented:
<https://github.com/red/red/issues/385#issuecomment-12467787>

    I made a fix for this issue, but I am not sure it is working fine as it is not possible to compile the %console-pro.red script due to `input` identifier being declare twice, once in %C-library.red as routine and once in %C-library.reds as a function.

--------------------------------------------------------------------------------

On 2013-01-20T15:40:00Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/385#issuecomment-12472207>

    The paths specific to my machine are there exactly because of this bug, and previously because of #252. I can't check in code that wouldn't work for people. At least there's an indication now what they would have to change.
    
    When I remove my specific path from common/input-output.red in the Red-common repository, I now get:
    
    -= Red Compiler =- 
    Compiling /users/administrator/Red/common/input-output.red ...
    **\* Red Compiler Internal Error: Script Error : clean-path expected target argument of type: file url 
    **\* Where: process-include-paths 
    **\* Near:  [file/1: clean-path join script-path file/1]
    
    Same with the other occurrences.
    
    In addition, my fix of using full paths is now broken. console-pro now says:
    
    -= Red Compiler =- 
    Compiling /users/administrator/Red/common/examples/console-pro.red ...
    **\* Red Compiler Internal Error: Access Error : Bad file path: /users/administrator/Red/C-library//home/kaj/Red/C-library/C-library.reds 
    **\* Where: clean-path 
    **\* Near:  [get-modes target 'full-path]

--------------------------------------------------------------------------------

On 2013-01-20T21:39:34Z, dockimbel, commented:
<https://github.com/red/red/issues/385#issuecomment-12478011>

    I have made a fix for absolute include paths. I cannot reproduce your error with relative include paths here, it passes correctly until the compiler hits the `input` identifier redefinition error.

--------------------------------------------------------------------------------

On 2013-01-20T22:56:06Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/385#issuecomment-12479349>

    It's the other way around here. :-) I'm still getting the clean-path error when I use a relative path. console-pro compiles fine, as the INPUT routine compiles into the exec context, while the Red/System INPUT function in C-library is in the global context. I use that construct in many places.

--------------------------------------------------------------------------------

On 2013-01-20T23:06:25Z, dockimbel, commented:
<https://github.com/red/red/issues/385#issuecomment-12479487>

    Any better for the relative path error with this new change?

--------------------------------------------------------------------------------

On 2013-01-21T00:03:10Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/385#issuecomment-12480309>

    When I enable the relative path in common/input-output.red now, it doesn't crash anymore, but console-pro.red says:
    
    Compiling to native code... 
    
    **\* Compilation Error: alias name already defined as: [struct! [
            low [integer!] 
            high [integer!]
        ]] 
    **\* in file: %common.reds 
    **\* at line: 38 
    **\* near: [
        integer64-reference!: alias struct! [
            low [integer!] 
            high [integer!]
        ] 
        handle!: alias struct! [dummy [integer!]]
    ]
    
    This is usually double inclusion of common/common.reds.


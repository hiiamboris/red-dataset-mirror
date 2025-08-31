
#2327: Compiling gui-console from latest sources will crash when executing a test application
================================================================================
Issue is closed, was reported by Zamlox and has 2 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2327>

Test application executed from repository:
```https://github.com/Zamlox/red-tools```
branch: 
```defaults```
application:
```svg/tests/test-svg.red```

It works when gui-console compiled using commit ```FEAT: generates some runtime library functions definitions using the```  commit hash ```02c0ddd217de2dd0567331771b51f4c600243b93```

Bisecting gives the following first bad commit: 
```FIX: improve TO action dispatcher function definition.``` commit hash ```e78db68067fad7399a658259600d8598b6fecb59```


Comments:
--------------------------------------------------------------------------------

On 2016-11-19T06:36:16Z, Zamlox, commented:
<https://github.com/red/red/issues/2327#issuecomment-261697118>

    Thank you for fixing it ;)


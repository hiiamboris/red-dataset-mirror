
#619: #include doesn't work inside a context
================================================================================
Issue is closed, was reported by meh and has 18 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/619>

`lol.red`:

``` red
Red []

a: context [
    b: context [#include %omg.red]
]

do [ probe a/b/c ]
```

`omg.red`

``` red
Red []

c: 42
```

Compiling and running `lol.red` will result in `*** Error: word 'c has no value`.



Comments:
--------------------------------------------------------------------------------

On 2013-12-17T19:58:51Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/619#issuecomment-30785108>

    Objects aren't compiled yet, so the content of CONTEXT is executed by the interpreter. #include is a compiler directive; the interpreter just ignores it.

--------------------------------------------------------------------------------

On 2013-12-17T20:27:08Z, meh, commented:
<https://github.com/red/red/issues/619#issuecomment-30787583>

    @Kaj-de-Vos oh I see, I was told to open this issue so I did, sorry if this was redundant.

--------------------------------------------------------------------------------

On 2013-12-17T20:48:24Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/619#issuecomment-30789370>

    It's not redundant, but it currently has a good explanation. #include could be supported in the interpreter, although it wouldn't be exactly equivalent to the compiler. I guess this case will soon work in compiled code when objects/contexts can be compiled.
    
    However, the classic way in REBOL to include extra files in the interpreter is to use DO. My version of DO in input-output.red allows including files, like in REBOL:
    
    http://red.esperconsultancy.nl/Red-common/dir?ci=tip
    
    You can also include from URLs a bit more clumsily:
    
    do read "URL"

--------------------------------------------------------------------------------

On 2013-12-17T20:54:11Z, meh, commented:
<https://github.com/red/red/issues/619#issuecomment-30789846>

    Yes I saw that, I'm working on my _project management_ thing, and I needed that kind of `#include` usage to make things saner from a modularization perspective.
    
    Thanks for all those sources, they're very helpful.

--------------------------------------------------------------------------------

On 2013-12-17T22:02:08Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/619#issuecomment-30795809>

    If you want your modular code to be compiled, you need to use #include. But you would typically use it near the highest level of the code, in any case not in an interpreted part.
    
    If you want to load extra code as plug-ins at runtime, you can use DO. But then again, that code will be interpreted, so it's slower and you can't use any compiled constructs in that extra code.

--------------------------------------------------------------------------------

On 2013-12-17T22:20:44Z, meh, commented:
<https://github.com/red/red/issues/619#issuecomment-30797457>

    My plan is to have a binary that can evaluate scripts or compile projects having the importing stuff I implement available to those scripts/projects.
    
    I'm using `#include` to modularize the main binary itself, and I'm going to compile that and provide binaries.
    
    I'm also compiling because some of that stuff is written in Red/System and it can't be interpreted (yet).

--------------------------------------------------------------------------------

On 2013-12-17T22:36:29Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/619#issuecomment-30798757>

    That's a good model. My Red console versions and my GTK+ Internet browser have that architecture:
    
    http://red.esperconsultancy.nl/Red-common/dir?ci=tip&name=examples
    
    http://red.esperconsultancy.nl/Red-GTK/dir?ci=tip&name=examples

--------------------------------------------------------------------------------

On 2013-12-18T16:46:33Z, dockimbel, commented:
<https://github.com/red/red/issues/619#issuecomment-30858047>

    @meh, I thought you were talking about #include in Red/System contexts...For Red, it is too early as the Red compiler doesn't support objects yet.

--------------------------------------------------------------------------------

On 2014-02-13T13:30:55Z, dockimbel, commented:
<https://github.com/red/red/issues/619#issuecomment-34977599>

    I am closing this ticket with a "dismissed" status as it is related to a not yet implemented feature.


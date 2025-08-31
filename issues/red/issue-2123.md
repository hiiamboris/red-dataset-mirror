
#2123: HELP adds trailing dot if func doc string ends with a dot.
================================================================================
Issue is closed, was reported by greggirwin and has 22 comment(s).
[type.review] [status.contribution]
<https://github.com/red/red/issues/2123>

```
red>> dirize: func [
[        "Returns a copy of a filespec with a trailing path marker."
[        path [file! string! url!]
[    ][
[        ; Always return a copy of the path.
[        path: copy path
[        either slash = last path [path][append path slash]
[    ]
== func [
    {Returns a copy of a filespec with a trailing path marker.} 
    path [file! string! url!]
][path: copy path 
    either s...
red>> ? dirize

USAGE:
    dirize path

DESCRIPTION:
     Returns a copy of a filespec with a trailing path marker.. 
     dirize is of type: function!

ARGUMENTS:
     path  [file! string! url!]

REFINEMENTS:
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-17T16:24:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2123#issuecomment-233190154>

    That is the convention we adopted, docstrings do not need an ending dot, as the end is delimited by the closing double quote. Adding a dot when printing it is up to the docstring processor, which is currently only HELP function.

--------------------------------------------------------------------------------

On 2016-07-17T17:47:55Z, greggirwin, commented:
<https://github.com/red/red/issues/2123#issuecomment-233194291>

    I know it's the convention (some doc strings may need cleaning), but some people may want to write their doc strings to be more grammatically correct. If they do, this will look like an error on HELP's part.

--------------------------------------------------------------------------------

On 2016-07-17T17:49:55Z, greggirwin, commented:
<https://github.com/red/red/issues/2123#issuecomment-233194376>

    Unless you want to be strict in this convention, no matter whose code it is. i.e. is the convention that they MUST NOT have an ending dot, or that they MAY have one?

--------------------------------------------------------------------------------

On 2016-07-17T18:02:25Z, dockimbel, commented:
<https://github.com/red/red/issues/2123#issuecomment-233194977>

    Making HELP a little smarter about that wouldn't hurt. You can make a PR to take an eventual ending dot into account. Though, the convention stays for red/red repo.

--------------------------------------------------------------------------------

On 2016-07-17T18:04:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2123#issuecomment-233195073>

    Just as a side-note: also, maybe rewriting the HELP code would be nice too, as it was contributed by someone, by directly porting the R2 version, not taking into account R3's improvements. I tried to put back some of those improvements, but the whole HELP code is not very well architectured, a cleaner and shorter version would be welcome.

--------------------------------------------------------------------------------

On 2016-07-17T21:06:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2123#issuecomment-233204132>

    I'm good with Red deciding its own repo rules. :^)

--------------------------------------------------------------------------------

On 2017-03-24T09:37:51Z, Oldes, commented:
<https://github.com/red/red/issues/2123#issuecomment-288975713>

    @dockimbel I can give it a try to rewrite the current help.

--------------------------------------------------------------------------------

On 2017-03-24T15:06:38Z, greggirwin, commented:
<https://github.com/red/red/issues/2123#issuecomment-289048894>

    I stopped working on my version when Ingo's was included with Red. I can post it somewhere if you want to collaborate Oldes.

--------------------------------------------------------------------------------

On 2017-03-24T15:10:39Z, greggirwin, commented:
<https://github.com/red/red/issues/2123#issuecomment-289050125>

    Or I could tackle this so you can focus on deeper issues from the R/S side. You've been doing a lot there lately.

--------------------------------------------------------------------------------

On 2017-03-24T15:29:53Z, Oldes, commented:
<https://github.com/red/red/issues/2123#issuecomment-289055721>

    It's ok.. I already have it.. just some clean up needed.

--------------------------------------------------------------------------------

On 2017-03-24T19:51:14Z, rebolek, commented:
<https://github.com/red/red/issues/2123#issuecomment-289126831>

    I have help parse done for `helpr`, VID help, it would probably make sense to share the code.


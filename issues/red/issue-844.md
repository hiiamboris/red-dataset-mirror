
#844: add an easy way to compile Red as an extension language
================================================================================
Issue is closed, was reported by IngoHohmann and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/844>

My idea is to add a sourcefile to the distribution, which defines an api to use red as an extension language.

Someone wanting to could add his own source files, and then compile it as a (dynamic) library to be used in his own projects.

I would like to have 2 api levels 

easy, e.g. just something like 'do_red_string

and another level with more direct access, and probably higher speed.

Things to keep in mind 
- internal interpreter/jit state 
- being able to reset  the state
- maybe several states in one module?



Comments:
--------------------------------------------------------------------------------

On 2014-06-05T15:15:46Z, IngoHohmann, commented:
<https://github.com/red/red/issues/844#issuecomment-45232374>

    This is a "keep in mind for later" wish.

--------------------------------------------------------------------------------

On 2014-06-06T04:41:15Z, hostilefork, commented:
<https://github.com/red/red/issues/844#issuecomment-45302388>

    You might consider adding these kinds of suggestions to the [Red Project Ideas Trello](https://trello.com/b/tCypaglW/ideas-for-red-contributors).  My impression is that for focus reasons, the GitHub issues are to be kept as close to all-closed as possible...and "keep in mind for later" wishes would stack up.
    
    Under that line of thinking, a "wish" that makes sense here is a concrete _"I wish you would change the way this function acts or what return result it gives"_ vs. _"I wish you/someone would implement a large new subsystem not currently on the Red schedule"_.  Such GitHub wishes are not necessarily bugs, but something that could be reacted to relatively quickly after a decision is made about it.

--------------------------------------------------------------------------------

On 2014-06-18T04:16:25Z, dockimbel, commented:
<https://github.com/red/red/issues/844#issuecomment-46394431>

    Ingo, it is in the plans of the Red project, from the beginning, to provide an external API to integrating in third-party softwares. This bugtracker is not the right place to post such messages, better open a wiki page (on github) to describe your ideas, and then add the link to a new Trello card as explained by HostileFork. You can also post the link to the Red chat rooms and ML, so that others can discuss it. 



#4733: [VID] Late switching of layout direction
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[GUI] [type.design]
<https://github.com/red/red/issues/4733>

**Describe the bug**

I was drawing a stair (;
`view [base base below base across base below base across base]`

| Produces | Expected |
| --- | --- |
| ![](https://i.gyazo.com/c82acc6064c2fadf66999e6532641d84.png) | ![](https://i.gyazo.com/403083d14a552879a7546e48f1900204.png) |

**Platform version**
```
Red 0.6.4 for Windows built 11-Nov-2020/5:05:03+03:00 commit #738c45d
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-19T19:33:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4733#issuecomment-730590909>

    I guess this can be considered a (non human friendly) feature. Close it if it is (;

--------------------------------------------------------------------------------

On 2020-11-19T20:23:58Z, greggirwin, commented:
<https://github.com/red/red/issues/4733#issuecomment-730616373>

    Well, R2 just creates a vertical stack with your code, which would be even harder to climb. :^) At a glance it made sense to me, because the cursor (next position) is set when a face is placed, so when you get to a direction keyword it doesn't go back and recalc from the previous face. Design wise, this could be justified either way. But when I looked at the code for `below/across`, I saw that you could trick it. e.g. `view [base base below base across base below across below across base across base]` by alternating direction keywords is keeps applying spacing even though no new face is added. That's a bug for sure, as they should be idempotent.
    
    ![image](https://user-images.githubusercontent.com/460079/99718846-c3826480-2a68-11eb-8bef-791843dc6dc9.png)
    
    I don't have time to think through effects on grid layout mode, but I don't think changing this will break much code. It's possible someone leverages it, especially in combination with R2 code using the `here: at` idiom. The other word I used in R2 quite a bit was `guide`, when making layouts with complex rows or columns. 
    
    The stair layout is a great example for this, if a bit pathological. ;^)

--------------------------------------------------------------------------------

On 2020-11-19T21:48:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4733#issuecomment-730657680>

    Yeah well. I see why it is like this too. But it's not that hard to keep both the offset & size of the last laid out face, and then walk forth from it along the across/below chosen axis (in size+spacing increments). Almost the same complexity but more predictable.

--------------------------------------------------------------------------------

On 2020-11-19T22:55:13Z, greggirwin, commented:
<https://github.com/red/red/issues/4733#issuecomment-730687568>

    If you create a branch to do that, I'll press Nenad to evaluate it.

--------------------------------------------------------------------------------

On 2020-11-20T19:35:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4733#issuecomment-731367796>

    I'll rescind my pathological comment as well, because this could apply directly to tree view layouts.


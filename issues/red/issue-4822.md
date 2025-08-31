
#4822: [Draw] `ellipse` command syntax is inconsistent with the rest
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.design]
<https://github.com/red/red/issues/4822>

**Describe the bug**

Most Draw commands expect absolute **point coordinates**:
```
line <point> <point> ...
triangle <point> <point> <point>
box <top-left> <bottom-right>
polygon <point> <point> ...
spline <point> <point> ...
image <image> <top-left> <bottom-right>
pen linear <color1> <offset> ... <colorN> <offset> <start> <end> <spread>       ;) <start> and <end>
pen bitmap  <image> <start> <end> <mode>
... and so on
```

Ellipse is the only command that breaks the rule and wants **size**:
```
ellipse <top-left> <size>
```

---
It's also unclear why ellipse drawn by `circle` cannot accept a pair as radius:
```
circle <center> <radius>
circle <center> <radius-x> <radius-y>

<radius>   : radius of the circle (integer! float!).
<radius-x> : (ellipse mode) radius of the circle along X axis (integer! float!).
<radius-y> : (ellipse mode) radius of the circle along Y axis (integer! float!).
```
Why pair! `<radius>` is not allowed?

It becomes even more suspicious when reading this:
> TIP
ellipse provide a **more compact** and box-oriented way to specify a circle/ellipse compared to circle command.

So why `ellipse` can be compact and `circle` cannot?

**Expected behavior**

I expect `ellipse <top-left> <bottom-right>` format for the ellipse.
And I would like justification for the absence of pair radius support to be documented.

Alternatively, I propose `circle` command to be removed and only `ellipse` left with the following semantics that would cover both box and center/radius notations:
```
ellipse <top-left> <bottom-right>
ellipse <center> <radius>         ;) round, radius = int/float
ellipse <center> <radius-x> <radius-y>
```
Or make `circle` and `ellipse` full aliases of one another with the syntax above.

**Platform version**
```
Red 0.6.4 for Windows built 28-Jan-2021/14:26:17+03:00 commit #bae0c34 
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-10T18:41:00Z, greggirwin, commented:
<https://github.com/red/red/issues/4822#issuecomment-776925587>

    - +1 for consistent use of TL+BR
    - +1 for adding `pair!` radius support
    - -1 for removing `circle`. It's a nice word with a clear meaning. What about removing the dual radius option for it though, so it's always just `circle center radius`? Otherwise it's not really a circle. :^)
    
    

--------------------------------------------------------------------------------

On 2021-02-10T18:48:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4822#issuecomment-776930146>

    > -1 for removing circle. It's a nice word with a clear meaning. What about removing the dual radius option for it though, so it's always just circle center radius? Otherwise it's not really a circle. :^)
    
    In R2 it accepted pair-radius.
    
    But what about
    > Or make circle and ellipse full aliases of one another with the syntax above.
    
    ?


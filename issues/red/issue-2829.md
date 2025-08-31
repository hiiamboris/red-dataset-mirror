
#2829: [View] Wish: Renaming the "enable?" facet to "enabled?"
================================================================================
Issue is closed, was reported by JenniferLee520 and has 8 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2829>

The face! object has a facet named "enable?". I would like it to be renamed to "enabled?".


Comments:
--------------------------------------------------------------------------------

On 2017-06-22T05:41:15Z, dockimbel, commented:
<https://github.com/red/red/issues/2829#issuecomment-310281129>

    @greggirwin @PeterWAWood What do you think?

--------------------------------------------------------------------------------

On 2017-06-22T08:31:06Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2829#issuecomment-310313232>

    I think the answer lies in the expected use pattern of the facet. 
    
    If its primary use is to set whether the inputs events are enabled or disabled then "enable?" makes most sense to me.
    
    If its primary use is for querying to see if a face responds to input events or not "enabled?" seems the better choice.

--------------------------------------------------------------------------------

On 2017-06-22T15:29:06Z, greggirwin, commented:
<https://github.com/red/red/issues/2829#issuecomment-310415291>

    Peter's answer is excellent. I'll add that the trailing `?` makes it look like a query. Another point is that all the facets are nouns/properties, not methods. `Selected` is used as a pseudo-method, e.g., for `text-list`, so `enabled?` seems the better choice to me. It's a state-changing noun.

--------------------------------------------------------------------------------

On 2017-07-25T07:26:01Z, dockimbel, commented:
<https://github.com/red/red/issues/2829#issuecomment-317653417>

    Done.


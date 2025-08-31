
#2519: even?/odd? actions are foreseen for time! but argument type not allowed
================================================================================
Issue is closed, was reported by meijeru and has 18 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/2519>

This is the converse of the previous issue...


Comments:
--------------------------------------------------------------------------------

On 2017-04-28T17:01:57Z, greggirwin, commented:
<https://github.com/red/red/issues/2519#issuecomment-298052381>

    Looks like this isn't as simple as adding the type to the spec. INHERIT_ACTION doesn't produce correct results for time.

--------------------------------------------------------------------------------

On 2017-04-28T17:29:34Z, greggirwin, commented:
<https://github.com/red/red/issues/2519#issuecomment-298058771>

    Hmmm...thought I could do it with GET_SECONDS internally, but it didn't work. Then found this:
    ```
    >> t: 0:0:2
    == 0:00:02
    >> t/second
    == 2.0
    >> to integer! t/second
    == 1
    
    >> t: 0:0:4
    == 0:00:04
    >> to integer! t/second
    == 3
    >> t/second
    == 4.0
    >> to integer! round t/second
    == 4
    ```

--------------------------------------------------------------------------------

On 2017-04-28T17:33:16Z, greggirwin, commented:
<https://github.com/red/red/issues/2519#issuecomment-298059743>

    See also #2134

--------------------------------------------------------------------------------

On 2017-04-28T21:44:52Z, greggirwin, commented:
<https://github.com/red/red/issues/2519#issuecomment-298113885>

    The issue seems to be due to scaling and truncating. FORM/MOLD uses a 1E-6 check as a lower bound for seconds. Nano (1E-9) wasn't enough, but 1E-6 is. If we increase the time value by that, when checking, we can get correct results (small spot checks so far). At least up to the point where FORM trips as well. e.g. 
    ```
    >> even? 0:0:4.99999999999999
    4.99999999999999
    == true
    >> 0:0:4.99999999999999
    == 0:00:05
    ```
    I don't like empirical hacks like this, without fully understanding the underlying design (which I don't). What I have now is the following:
    ```
    	even?: func [
    		tm		[red-time!]
    		return: [logic!]
    		/local
    			t [float!]
    	][
    		t: tm/time + 1E-6								;@@ 1E-6 is a temporary, empirical workaround
    		not as-logic (as integer! GET_SECONDS(t)) and 1
    	]
    
    	odd?: func [
    		tm		[red-time!]
    		return: [logic!]
    		/local
    			t [float!]
    	][
    		t: tm/time + 1E-6								;@@ 1E-6 is a temporary, empirical workaround
    		as-logic (as integer! GET_SECONDS(t)) and 1
    	]
    ```
    If that's acceptable, I can submit a PR. Otherwise, maybe this will save Team Red some R&D time.

--------------------------------------------------------------------------------

On 2017-04-28T22:02:02Z, greggirwin, commented:
<https://github.com/red/red/issues/2519#issuecomment-298116839>

    It holds up well in a quick test against using `round/down` on `t/second` with `even?/odd?`. e.g.
    ```
    loop 1000000 [<compare result> t: t + 0:0:0.00001]
    ```
    Also with smaller incr values.

--------------------------------------------------------------------------------

On 2017-04-28T22:08:51Z, greggirwin, commented:
<https://github.com/red/red/issues/2519#issuecomment-298117995>

    Given the above `to integer!` behavior, it's probably GET_SECONDS that needs to change, as both `eval-path` and `pick` are affected by it.

--------------------------------------------------------------------------------

On 2017-05-01T22:55:03Z, greggirwin, commented:
<https://github.com/red/red/issues/2519#issuecomment-298454250>

    I went ahead and submitted a PR on this. Extra commits in it are due to...me and git. :^\

--------------------------------------------------------------------------------

On 2017-07-28T17:02:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2519#issuecomment-318708606>

    @greggirwin I don't see the PR for that in red/red?

--------------------------------------------------------------------------------

On 2017-07-28T23:57:05Z, greggirwin, commented:
<https://github.com/red/red/issues/2519#issuecomment-318786989>

    Was back from May-1. https://github.com/greggirwin/red/commit/c0635a76c5cf09559435837f9429ca16c2577b27 in my clone. Looks like pos/neg checks added later, but this is in place in red/master.



#55: WISH: `empty?` to accept typesets/bitsets
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
<https://github.com/red/REP/issues/55>

I was doing set-arithmetic on typesets, and then checking if there's an intersection.

`empty?` didn't accept my result so, either I have to convert typeset to block first `empty? to block! typeset`, or make a brand new typeset: `typeset = make typeset! []`

Would like `empty?` to do that for me.


Comments:
--------------------------------------------------------------------------------

On 2019-11-07T19:25:31Z, greggirwin, commented:
<https://github.com/red/REP/issues/55#issuecomment-551226762>

    One of those tough questions. Not a huge code change, and a precedent has been set by having `map!` there already. Use cases will be rare, and easy to work around, but typesets make more sense to support than path types (based on the gyrations needed to create empty paths). Wet ops on typesets make perfect sense, and are supported, and may facilitate automated testing and code generation. Seems worth doing.
    
    ```
    empty?: func [
    	"Returns true if a series is at its tail, or a map! or typeset! is empty" 
    	series [series! none! map! typeset!] 
    	return: [logic!]
    ][
    	case [
    		series? series [tail? series] 
    		map? series [series = #()] 
    		none? series [true]
    		typeset? series [tail? to block! series]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-07-30T16:47:58Z, 9214, commented:
<https://github.com/red/REP/issues/55#issuecomment-666519057>

    https://github.com/red/red/issues/614

--------------------------------------------------------------------------------

On 2024-02-19T17:48:54Z, hiiamboris, commented:
<https://github.com/red/REP/issues/55#issuecomment-1952948530>

    For bitsets all naive test for emptiness approaches seems doomed, because converting `make bitset! 1'000'000'000` something will be unwieldy.


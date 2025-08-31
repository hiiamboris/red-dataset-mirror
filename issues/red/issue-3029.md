
#3029: PARSE/CASE wrongly parses WORD! values
================================================================================
Issue is open, was reported by 9214 and has 14 comment(s).
[type.bug]
<https://github.com/red/red/issues/3029>

Actual:
```Red
>> parse/case [a]['a]
== false
>> parse/case [a][quote a]
== true
>> parse/case [a A]['a 'A]
== false
>> parse/case [a A][quote a quote A]
== true
```
Expected:
```Red
>> parse/case [a]['a]
== true
>> parse/case [a][quote a]
== true
>> parse/case [a A]['a 'A]
== true
>> parse/case [a A][quote a quote A]
== true
```

Potential bug location :point_right: [somewhere here](https://github.com/red/red/commit/94704aa6db4e0690133629de2e14b77d14be5cd1#diff-1887889cb99ae2e2424362bd4bb1d136R1742).


Comments:
--------------------------------------------------------------------------------

On 2018-11-06T22:52:01Z, 9214, commented:
<https://github.com/red/red/issues/3029#issuecomment-436438710>

    @dockimbel I think there is a potential regression, could also be related to #3554:
    ```red
    >> parse [a]['a]
    == true
    >> parse [a]['A]
    == false
    >> parse [a][quote a]
    == true
    >> parse [a][quote A]
    == true
    ```

--------------------------------------------------------------------------------

On 2019-03-15T23:04:50Z, endo64, commented:
<https://github.com/red/red/issues/3029#issuecomment-473467845>

    @9214 It looks like it is intentional:
    
    See the line 185 in `runtime/parse.reds` file:
    It switches to strict mode for `lit-word!` and `lit-path!` values
    ```
    	compare-values: func [
    		value2	[red-value!]
    		value	[red-value!]
    		comp-op [integer!]
    		return: [logic!]
    		/local
    			type [integer!]
    	][
    		type: TYPE_OF(value)
    		if any [type = TYPE_LIT_WORD type = TYPE_LIT_PATH][
    			comp-op: COMP_STRICT_EQUAL_WORD
    		]
    		actions/compare value2 value comp-op
    	]
    
    ```

--------------------------------------------------------------------------------

On 2019-03-15T23:42:30Z, 9214, commented:
<https://github.com/red/red/issues/3029#issuecomment-473474019>

    @endo64 I highly doubt that this is an intentional feature. And even if it is - there's an inconsitency with `quote`. 
    
    Strict comparison of words and paths makes sense only in `parse/case` mode or inside `case` rule, given that only symbols are compared and information about bindings is ignored.

--------------------------------------------------------------------------------

On 2019-05-05T22:31:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/3029#issuecomment-489469277>

    There's more. I wanted to parse an expression where `|` has a special meaning, but can't distinguish it from literal `'|` word (which has no meaning).
    ```
    >> parse ['|] ['|]
    == true
    >> parse [|] ['|]
    == true
    >> parse ['|] [quote '|]
    == true
    >> parse [|] [quote '|]
    == true
    >> parse ['|] [quote |]
    == true
    >> parse [|] [quote |]
    == true
    >> parse/case ['|] ['|]
    == true
    >> parse/case [|] ['|]
    == true
    >> parse/case ['|] [quote '|]
    == true
    >> parse/case [|] [quote '|]
    == true
    >> parse/case ['|] [quote |]
    == false
    >> parse/case [|] [quote |]
    == true
    ```
    
    Last 2 lines at first seemed like a solution, but it's actually mind-blowing:
    ```
    >> parse [1] [quote | | skip]
    == false
    >> parse [1] [quote | skip]
    == true
    >> parse [1] [[quote |] | skip]
    == false
    >> parse [1] [[quote |] skip]
    == true
    >> parse/case [1] [quote | | skip]
    == false
    >> parse/case [1] [quote | skip]
    == true
    >> parse/case [1] [[quote |] | skip]
    == false
    >> parse/case [1] [[quote |] skip]
    == true
    ```
    
    Using the construct `[set w word! if (w == '|)]` for now.

--------------------------------------------------------------------------------

On 2019-07-26T20:48:45Z, dockimbel, commented:
<https://github.com/red/red/issues/3029#issuecomment-515594897>

    @hiiamboris There is a simpler solution for that, by avoiding the usage of a literal `|` character in the rule, you can make it work as expected (and make it also more readable):
    ```
    >> pipe: '|
    == |
    >> parse [1] [quote pipe | skip]
    == true
    ```

--------------------------------------------------------------------------------

On 2019-07-31T19:01:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/3029#issuecomment-516978775>

    @dockimbel unfortunately it does something else (:
    ```
    >> parse [1] [quote pipe | quote 1]
    == true
    >> parse [|] [quote pipe | quote 1]
    == false
    >> parse [|] [pipe | quote 1]
    *** Script Error: PARSE - invalid rule or usage of rule: |
    *** Where: parse
    *** Stack:  
    >> parse [pipe] [quote pipe | quote 1]
    == true
    ```
    
    `Red 0.6.4 for Windows built 27-Jul-2019/1:58:18+03:00 commit #6890912`

--------------------------------------------------------------------------------

On 2019-12-19T16:09:41Z, 9214, commented:
<https://github.com/red/red/issues/3029#issuecomment-567554163>

    It seems that `path!` matching is always case-sensitive.
    ```red
    >> parse [a/b]['a/b]
    == true
    >> parse [a/B]['a/b]
    == false
    ```



#2279: WISH foreach should be allowed on maps
================================================================================
Issue is closed, was reported by meijeru and has 20 comment(s).
[status.built] [status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2279>

It is quite common to have to step through all elements of a map. Currently, one has to write:

```
foreach key keys-of map-value [
    element: select map-value key ; or element: map-value/(key)
    <some processing using key and element>
]
```

Wouldn't it be nice to be able to write:

```
foreach [key element] map-value [<some processing using key and element>]
```

The first argument of foreach should then always be a block of two words, but this is easy to enforce. Blocks of words are already allowed in that position.



Comments:
--------------------------------------------------------------------------------

On 2019-05-22T11:19:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/2279#issuecomment-494760681>

    Would've been also great if foreach implemented that iteration on R/S level, without having to look up every item.

--------------------------------------------------------------------------------

On 2019-05-22T18:03:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2279#issuecomment-494906197>

    There are always tradeoffs and constraints. You may have seen a new map PR show up, which will change the interface in some important ways, but making maps act like series is not one of them. During the design process, that came up a lot, and there's no perfect answer. It was also heavily discussed about how much a user should know or care about the implementation, and how best to treat blocks as if they were maps. That is, `map` is a symbolic construct and interface, which requires extra work when using blocks as key-value structures. You have to use `/part/skip 2 2` consistently, which is best done in wrapper funcs.
    
    @dockimbel @qtxie @giesse and myself spent a lot of time talking about this, and the next version of the `map!` interface may not be the final one, related to wishes like this. In the meantime, how painful (and slow) is it to do something like this:
    ```
    for-map: function [
    	"Iterate over a map, making each `key` and `value` available to the body."
    	data [map! series!]
    	body [block!]
    ][
    	either series? data [
    		foreach [key value] data [do body]
    	][
    		foreach key keys-of data [
    			value: data/:key
    			do bind body 'key
    		]
    	]
    ]
    blk: [a: 1 b: 2 c: 3]
    for-map m [print [key value]]
    m: #(a: 11 b: 22 c: 33)
    for-map m [print [key value]]
    ```
    I think we still need function attributes to making writing control funcs easy, WRT `break/continue`, which is also important for HOFs. We also can't profile the above versus and R/S version without building that, but we can see how the mezz version(s) perform against a clock. They may not work for everything, but my guess is that they'll be fast enough for all but the largest datasets.

--------------------------------------------------------------------------------

On 2019-05-23T17:20:28Z, greggirwin, commented:
<https://github.com/red/red/issues/2279#issuecomment-495308373>

    @meijeru if https://github.com/red/red/pull/3896 looks good to you, please close this ticket.

--------------------------------------------------------------------------------

On 2019-05-23T17:23:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2279#issuecomment-495309496>

    Or not. Seems it was closed, not merged. 

--------------------------------------------------------------------------------

On 2019-05-28T18:04:55Z, greggirwin, commented:
<https://github.com/red/red/issues/2279#issuecomment-496626000>

    #3899 is the new PR for this.

--------------------------------------------------------------------------------

On 2019-12-02T13:21:49Z, 9214, commented:
<https://github.com/red/red/issues/2279#issuecomment-560393981>

    @meijeru if you are happy with this change, we'd like to close the issue.

--------------------------------------------------------------------------------

On 2019-12-02T14:31:02Z, meijeru, commented:
<https://github.com/red/red/issues/2279#issuecomment-560420485>

    YES you can close it!

--------------------------------------------------------------------------------

On 2019-12-02T14:31:47Z, 9214, commented:
<https://github.com/red/red/issues/2279#issuecomment-560420756>

    @qtxie ☝️ 

--------------------------------------------------------------------------------

On 2019-12-04T13:37:26Z, 9214, commented:
<https://github.com/red/red/issues/2279#issuecomment-561648984>

    Late-stage observation:
    * If `foreach` supports `map!`, then it ought to support `any-object!`, for consistency (https://github.com/red/red/issues/617, https://github.com/red/REP/issues/58)
    * I find this feature quite reduntant:
    ```red
    >> c: object [a: 1 b: 2] foreach [key value] body-of c [print [key '=> value]]
    a => 1
    b => 2
    >> c: #(a: 1 b: 2) foreach [key value] body-of c [print [key '=> value]]
    a => 1
    b => 2
    ```
    * The only upsides are block length checking and absence of extra allocation by `body-of`:
    ```red
    >> c: #(a: 1 b: 2) foreach [key value ?] body-of c [print [key '=> value]]
    a => 1
    2 => none
    >> c: #(a: 1 b: 2) foreach [key value ?] c [print [key '=> value]]
    *** Script Error: invalid argument: [key value ?]
    *** Where: foreach
    *** Stack:  
    ````
    * Block's format (which should be `[2 word! any word!]`) is ignored if 2nd argument of `foreach` is empty, so as the body itself:
    ```red
    >> foreach [1 2 /whatever][][...]
    >> foreach [1 2 /whatever][whoops][...]
    *** Script Error: invalid argument: 1
    *** Where: foreach
    *** Stack: 
    ```

--------------------------------------------------------------------------------

On 2019-12-04T19:06:30Z, giesse, commented:
<https://github.com/red/red/issues/2279#issuecomment-561793137>

    It's not redundant - `body-of` has to allocate an extra block that is then immediately thrown away.



#3218: Map!s inside object!s seem to be shared
================================================================================
Issue is closed, was reported by nd9600 and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3218>

### Expected behavior
Nothing is returned

### Actual behavior
Key/value pairs inside the map are returned

### Steps to reproduce the problem

```
e: make object! [m: make map! []]
a: make e []
b: make e []

a/m/x: 1
probe b/m/x ; == 1, should be 'none
```

You can see the problem here (it also occurs with the `hash!` type:
```
e: make object! [m: make map! [x: 1]] 
same? get in copy/deep e 'm get in copy/deep e 'm ; == true, should be false

e: make object! [m: make hash! [x: 1]] 
same? get in copy/deep e 'm get in copy/deep e 'm ; == true, should be false
```

The bug doesn't appear if you use a `block!` instead:
```
e: make object! [m: []]
a: make e []
b: make e []

append a/m 1
probe b/m ; == []
```

The bug occurs on both Linux and Windows.

### Red version and build date, operating system with version.
0.6.3, 8-Oct-2017/21:50:01+01:00, Linux or Windows


Comments:
--------------------------------------------------------------------------------

On 2018-02-02T15:12:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3218#issuecomment-362612846>

    `hash!` and aggregate data structures like objects and maps are not deep-copied when an object is cloned. This is an old pratical optimization since the early days of Rebol. `copy/types` will provide a finer-grained control over deep-copying, so could be used (once implemented) instead of `make <proto> []`.

--------------------------------------------------------------------------------

On 2018-02-03T20:05:53Z, nd9600, commented:
<https://github.com/red/red/issues/3218#issuecomment-362850104>

    Thanks, I thought it was something like that.
    Would the correct way to workaround it be something like returning the `e` object from a function, like `make_e: function [return make ....]` and using that function to make a new object instead?

--------------------------------------------------------------------------------

On 2018-02-04T19:11:06Z, greggirwin, commented:
<https://github.com/red/red/issues/3218#issuecomment-362931333>

    Until `copy/types` is in place, you can use a function to do it:
    ```
    clone: function [
    	"Deep make an object"
    	object [object!]
    	/with
    		spec [block!] "Extra spec to apply"
    ][
    	cloners!: union series! make typeset! [object! map! bitset!]
    	new: make object any [spec clear []]
    	foreach word words-of new [
    		val: get in new word
    		if find cloners! type? :val [
    			new/:word: either object? val [ clone val ][ copy/deep val ]
    		]
    	]
    	new
    ]
    ```

--------------------------------------------------------------------------------

On 2018-02-04T20:46:04Z, nd9600, commented:
<https://github.com/red/red/issues/3218#issuecomment-362938150>

    Thanks Gregg

--------------------------------------------------------------------------------

On 2022-10-27T18:17:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/3218#issuecomment-1293898893>

    Just linking it here https://github.com/red/red/issues/2167


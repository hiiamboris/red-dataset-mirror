
#4576: text-list data change, advanced use case, may lead to crash sometimes.
================================================================================
Issue is closed, was reported by greggirwin and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4576>

**Describe the bug**

See comments in code below

**To reproduce**

```
Red []

; This came from using key-val data (originally a map converted to a block)
; as `data` for a list face, so when you select an item (key), the associated
; value was available. 

; What happened is that sometimes the list entries would change, with one
; being removed. TL;DR is that is seems a combination of any loop construct
; combined with a series change is the culprit.

; To test, select the any item that isn't `yikes!`, click or scroll and all
; is well. As soon as a yikes! item is selected, things go haywire. Sometimes
; eventually clearing the list or crashing.

temp-blk: copy []

groups: [
;	"yikes!"	(collect [foreach [name obj] [a b c d e f] [keep name]])
;	"yikes!"	(collect/into [foreach [name obj] [a b c d e f] [keep name]] temp-blk)
;	"yikes!"	(blk: clear [] foreach [name obj] [a b c d e f] [append blk name])
;	"yikes!"	(blk: clear [] foreach [n o] [a b c d e f] [append blk n])
;	"yikes!"	(blk: clear [] vals: [a b c d e f] forall vals [append blk vals/1])
;	"yikes!"	(foreach [name obj] [a b c d e f] [take append [] 1])
;	"yikes!"	(foreach [name obj] [a b c d e f] [append [] 1])
;	"yikes!"	(foreach [v] [1] [append [] v])
;	"yikes!"	(repeat i 1 [append [] i])
	"yikes!"	(loop 1 [append [] 1])
	
; Perhaps a clue here, with on-face-deep-change*
;	"yikes!"	(foreach [name obj] [a b c d e f] [append [] ()])
;1 	paren 	(foreach [name obj] [a b c d e f] [append [] ()])
;*** Script Error: new has no value
;*** Where: on-face-deep-change*
;*** Stack: view do-events do-actor do-safe group-selected on-face-deep-change* 
	
	"no-yike-0"	([append [] 1])
	"no-yike-1"	(blk: clear [] [append blk 'name])
	"no-yike-2"	([1])
	"no-yike-3"	(foreach [name obj] [a b c d e f] [1])
	"no-yike-4"	(foreach [name obj] [a b c d e f] [[]])
	"no-yike-5"	(foreach [name obj] [a b c d e f] [take []])

	"favorite" 	[parse append rejoin if either func]
	"all" 		#all ; what do we use to say "all docs, whether in current build or not?
	"sys-words"	(words-of system)
	"system"	system
	"comparison" [< > <= >= <>]
	"functions" :any-function?
	"native!" 	:native?
	"ops"		op!
	"dialect" 	[parse draw vid math format]
	"char!"		char!

;	"yikes!"	(blk: clear [] foreach [n o] [a b c d e f] [append blk n])
]

;-------------------------------------------------------------------------------

get-sys-words:    func [x][none]
get-vals-by-type: func [x][none]

group-selected: function [face] [
	grp-name: kv-list-pick/key face face/selected
	v: selector: kv-list-pick/val face face/selected
	v: either any-word? :v [get :v][:v]
	print [face/selected tab  type? :v tab  mold/part :v 50]
	words: case [
		:v = #all        [words-of system/words]
		any-function? :v [get-sys-words :v]
		paren? :v        [do v]
		object? :v       [words-of v]
		datatype? :v     [get-vals-by-type :v]
		block? :v        [copy :v]
		'else            [[]]
	]
]

kv-list-pick: func [
	"Given a list face with data of key-val pairs, return from the data based on index"
	face [object!] 
	index [integer!]
	/key "(default)"
	/val
][
	pick face/data either val [index * 2][index * 2 - 1]
]

;-------------------------------------------------------------------------------

view [
	text-list 100x300 data groups [group-selected face]
]
```

**Expected behavior**

text-list data should not change.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 16-Jul-2020/12:24:13-06:00 commit #a2f7c08
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-16T20:19:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4576#issuecomment-659649189>

    @greggirwin ;)
    Minimal example helps everyone, even me when I write tests for such issues.
    
    For disappearance of the contents (click on any items twice):
    ```
    Red []
    recycle/off
    d: ["1" "2" "3" "4" "yikes!" []]
    view [text-list 100x300 data d [insert clear last d 1]]
    ```
    ![](https://i.gyazo.com/f28ceb09fce4c457b9e8795ca2c869bf.gif)
    
    For triggering the unset-related error message in on-deep-change (it's bugged in multiple places - all `new` should be `:new`):
    ```
    Red []
    recycle/off
    d: ["1" "2" "3" "4" "yikes!" []]
    view [text-list 100x300 data d [append last d ()]]
    ```
    ```
    *** Script Error: new has no value
    *** Where: on-face-deep-change*
    *** Stack: dorc view do-events do-actor do-safe on-face-deep-change* 
    ```
    
    

--------------------------------------------------------------------------------

On 2020-09-26T06:33:59Z, bitbegin, commented:
<https://github.com/red/red/issues/4576#issuecomment-699439287>

    ```
    d: ["1" "2" "3" "4" "yikes!" [] "xxx"]
    view [text-list 100x300 data d [remove skip d 5]]
    ```
    
    ```
    d: ["1" "2" "3" "4" "yikes!" [] "xxx"]
    view [text-list 100x300 data d [poke d 5 "t"]]
    ```
    
    ```
    d: ["1" "2" "3" "4" "yikes!" [] "xxx"]
    view [text-list 100x300 data d [poke d 1 5]]
    ```

--------------------------------------------------------------------------------

On 2022-08-06T14:08:18Z, dockimbel, commented:
<https://github.com/red/red/issues/4576#issuecomment-1207221155>

    The changes made in those commits have messed up the `text-list` handling as they are based on the wrong assumption that the widget only displays values of type `string!` from the `/data` facet, while `any-string!` is permitted. The `text-list` related code seems to have been repatched several times later ending up with bad code architecture, like this [odd function](https://github.com/red/red/blob/master/modules/view/backends/windows/text-list.reds#L175). Also I don't agree with several changes in the View code made in this commit and later [related commit](https://github.com/red/red/commit/6e386dd079cc6e0f49ac34b2ea95d11d57abc833)(s).
    
    This also makes very difficult to make improvements on `text-list` data handling, like supporting user-selected types for the `/data` facet. I just tried to implement such feature and gave up, as it's not possible without rewritting all the `text-list` handling code...
    
    Also, I do not agree with the `unset!` swipping under the carpet adhoc injection [there](https://github.com/red/red/blob/master/modules/view/view.red#L493). We should let it error out, as it's anyway an invalid value to pass to the `text-list`. `unset` values should not be propagated but let to error out as early as possible.
    
    
    The `text-list` widget should be rewritten from scratch in order to clean up all those issues.


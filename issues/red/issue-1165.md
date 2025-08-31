
#1165: Console: Feature request for TAB autocomplete
================================================================================
Issue is closed, was reported by x8x and has 6 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/1165>

Following enhancement to console TAB autocomplete's behaviour would be much appreciated.
Given:

```
red>> compl
```

pressing `TAB` currently returns:

```
red>> complement complement? complete-from-path 
red>> compl
```

it would be very useful if in addition to words proposal, it would also autocomplete the common part of the proposed words, in above case:

```
red>> complement complement? complete-from-path 
red>> comple
```

even better would be if further `TAB` pressed would cycle thru the proposed words until the `ENTER` key is pressed.

```
red>> compl
```

`TAB`:

```
red>> complement complement? complete-from-path 
red>> comple
```

`TAB TAB`:

```
red>> complement complement? complete-from-path 
red>> complement
```

`TAB TAB TAB`:

```
red>> complement complement? complete-from-path 
red>> complement?
```

`TAB TAB TAB TAB`:

```
red>> complement complement? complete-from-path 
red>> complete-from-path
```

`TAB TAB TAB TAB TAB ENTER`:

```
red>> complement complement? complete-from-path 
red>> complement 
```

With a `SPACE` char auto added after the selected word.



Comments:
--------------------------------------------------------------------------------

On 2015-05-08T03:41:59Z, dockimbel, commented:
<https://github.com/red/red/issues/1165#issuecomment-100091292>

    This would be a nice improvement, but this is very low-priority for now, so probably after we reach beta stage (unless @qtxie tells me that this can be done in less than 30mn) ;-)

--------------------------------------------------------------------------------

On 2015-05-08T07:06:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1165#issuecomment-100128682>

    Such features would take too much time to implement right now, so we are deferring it to a later stage in the future. I have put a reference to this ticket to the wiki, so I am closing the ticket now as there is no point in leaving it open until we get back to it (then we can re-open it).

--------------------------------------------------------------------------------

On 2017-04-16T13:16:16Z, geekyi, commented:
<https://github.com/red/red/issues/1165#issuecomment-294351286>

    Now fixed with https://github.com/red/red/commit/61efdadd9dc2f2da9d46da6cf0cb72e1fff9f055


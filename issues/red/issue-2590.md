
#2590: macOS encoding problem with simple-io
================================================================================
Issue is closed, was reported by x8x and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2590>

Here is a wired encoding behaviour:
```
   a: {Ingénierie}
;   "Ingénierie"
  write to-file a ""
  b: read %.
;   [%Ingénierie]
  read b/1
;   ""
  a: {620 Ingénierie}
;   "620 Ingénierie"
  write to-file a ""
  b: read %.
;   [%620%20Inge%00nierie %Ingénierie]
  read b/1
*** Access Error: cannot open: %620%20Inge%00nierie
*** Where: read
```
Also, it would be nicer to have:
`%"file name with space"`
instead of url-escaped:
`%file%20name%20with%20space`
in the result.


Comments:
--------------------------------------------------------------------------------

On 2017-04-17T05:12:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2590#issuecomment-294406388>

    The URL-escaped version is the proper file format, the `%"..."` form is accepted by the lexer and converted to the canonical form. What is missing is proper encoding of the file name when written back in the filesystem.

--------------------------------------------------------------------------------

On 2017-04-17T11:56:49Z, x8x, commented:
<https://github.com/red/red/issues/2590#issuecomment-294471773>

    Thank you! Works correctly now. 👍 


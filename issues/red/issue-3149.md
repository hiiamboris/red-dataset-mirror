
#3149: GUI Console: Cursor misaligned when using input or when using ask with an empty string
================================================================================
Issue is closed, was reported by gltewalt and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3149>

### Expected behavior
`input` goes to the beginning of the new line before capturing input,
### Actual behavior
Cursor position is lined up with the end of the previous line, awaiting input.
### Steps to reproduce the problem
Type `input` then Enter, or `input`, then any string, then Enter.
`ask` with an empty string has the same behavior, and it looks like `input` is just a wrapped `ask` call with an empty string.
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 19-Dec-2017/15:46:56-07:00

Possibly related issue #2978



Comments:
--------------------------------------------------------------------------------

On 2018-04-25T07:34:06Z, qtxie, commented:
<https://github.com/red/red/issues/3149#issuecomment-384188674>

    Fixed in the new gui console.


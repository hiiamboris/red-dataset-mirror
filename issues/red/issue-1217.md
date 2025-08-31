
#1217: Compile time lexer accepts #"<tab>", and run time lexer refuses it
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1217>

The construct indicated above is a real tab character, preceded by #" and followed by ".

If the tab character is enclosed in string quotes " " it is accepted by both lexers.




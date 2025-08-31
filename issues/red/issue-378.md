
#378: Interpreter silently doesn't execute ROUTINE
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/378>

kaj@Kaj-Portable-PC ~/Red/Red $ red/tests/console 
Red Console (Xmas demo edition!)

-=== Red Console pre-alpha version ===-
(only Latin-1 input supported)

red>> quit-return 0
== 0
red>>



Comments:
--------------------------------------------------------------------------------

On 2013-01-11T09:55:06Z, dockimbel, commented:
<https://github.com/red/red/issues/378#issuecomment-12137854>

    Routine execution is not yet supported from the interpreter. I will try to add it quickly, but it will only work for compiled routines, the interpreter will never be able to support the creation of new routines at runtime (only the JIT-compiler will be able to do that).


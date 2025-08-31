
#2574: Console hangs with call/output to file
================================================================================
Issue is closed, was reported by mikeparr and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2574>

Standard console hangs (Win 7 0.62) when redirecting 'call' to a file, as in:

      call/output "dir" %out.txt

Redirecting to a string works OK.



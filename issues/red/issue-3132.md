
#3132: replace/all infinite loop
================================================================================
Issue is closed, was reported by pijoter and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3132>

### Expected behavior
>> replace/all "test" charset [#"t" #"e"] ""
== "s"
### Actual behavior
infinite loop 
### Steps to reproduce the problem
as above
### Red version and build date, operating system with version.
red 0.63
25-Nov-2017/16:24:59+01:00
Windows 10.0.16299.64



Comments:
--------------------------------------------------------------------------------

On 2017-12-03T10:54:26Z, meijeru, commented:
<https://github.com/red/red/issues/3132#issuecomment-348755825>

    Not a recent problem, confirmed also on W10 of 9-Aug-2017.


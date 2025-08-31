
#3265: Unexpected results when casting values to float! or float32! in a math expression
================================================================================
Issue is closed, was reported by Zamlox and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3265>

### Expected behavior
Casting values to ```float32!``` or ```float!``` in math expression should give correct results
### Actual behavior
Casting values to ```float32!``` or ```float!``` in math expression does not give correct results
### Steps to reproduce the problem
```
Red/System []

a: as float32! 2
a: a - as float32! 1
print ["a: " a lf]
a: a - as float32! 1 - as float32! 1
print ["a: " a lf]

b: 2.0
b: b - as float! 1
print ["b: " b lf]
b: b - as float! 1 - as float! 1
print ["b: " b lf]
```
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 13-Mar-2018/8:17:15+02:00
Windows 7 


Comments:
--------------------------------------------------------------------------------

On 2018-03-20T12:04:00Z, dockimbel, commented:
<https://github.com/red/red/issues/3265#issuecomment-374573339>

    Actually, it's an unimplemented feature (integers are not supported in such expressions) as described by the [docs](http://static.red-lang.org/red-system-specs-light.html#section-4.4.1):
    
    > There is no literal form for float32! datatype values. To load a float32! constant, the method consists of providing a float! literal and prefixing it with a type casting to float32!.
    > Example:
    > pi32: as float32! 3.1415927
    
    Though, the compiler is not signaling any error because that it was planned to support that feature later.
    
    So, I think it's the right time to support it now.


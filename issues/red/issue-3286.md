
#3286: R/S Literal array does not work properly
================================================================================
Issue is closed, was reported by qtxie and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3286>

### Code
Code snippet in R/S document.
```
Red/System []
e: [1.23e10 "Hello" 789 "World!" 3.14]
pf: as float-ptr! e
probe pf/1                             ;-- outputs 1.23e+010
```
### Expected behavior
outputs 1.23e+010
### Actual behavior
outputs -7.8804e+115
### Steps to reproduce the problem
Compile the code and run it.
### Red version and build date, operating system with version.
Red master branch commit [ef5711e19a39259dc253c38d596008e6fbb49ef1].
Win 7 64bit.


Comments:
--------------------------------------------------------------------------------

On 2018-03-27T03:59:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3286#issuecomment-376389580>

    @qtxie Isn't the correct syntax for dereferencing a value `/value` not `/1`?
    
     

--------------------------------------------------------------------------------

On 2018-03-27T04:08:19Z, qtxie, commented:
<https://github.com/red/red/issues/3286#issuecomment-376390789>

    @PeterWAWood Both should work.

--------------------------------------------------------------------------------

On 2018-03-28T09:53:10Z, dockimbel, commented:
<https://github.com/red/red/issues/3286#issuecomment-376829107>

    Regression caused by https://github.com/red/red/commit/013b8831a2e7d6916f517b10e5b65f439cf667d4


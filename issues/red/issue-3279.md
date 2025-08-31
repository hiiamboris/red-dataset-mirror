
#3279: 'check' value not changed on clicking
================================================================================
Issue is closed, was reported by toomasv and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3279>

### Expected behavior
On clicking
```
>> view [check [probe face/data]]
true
false
true
```
### Actual behavior
On clicking
```
>> view [check [probe face/data]]
false
false
false
```
### Steps to reproduce the problem
^
### Red version and build date, operating system with version.
W10 console, build 2018-03-23


Comments:
--------------------------------------------------------------------------------

On 2018-03-24T09:22:25Z, toomasv, commented:
<https://github.com/red/red/issues/3279#issuecomment-375859184>

    This worked correctly until recently. E.g. on my build of March 17th this works correctly.

--------------------------------------------------------------------------------

On 2018-03-26T07:12:43Z, toomasv, commented:
<https://github.com/red/red/issues/3279#issuecomment-376067913>

    @dockimbel Now default actor doesn't react at all! Tried with
    ```
    view [check [probe face/data]]
    ; No reaction on clicking
    ```
    as well as 
    ```
    >> view [check on-change [probe face/data]]
    ; No reaction on clicking
    ```
    Other actors do react, but in wrong way, as previously, e.g.
    ```
    >> view [check on-down [probe face/data]]
    false
    false
    false
    ```



#3258: FEAT: Show system/catalog/accessors when using `help` on `datatype!`.
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.contribution]
<https://github.com/red/red/issues/3258>

### Expected behavior

See: https://github.com/red/red/commit/595464b02646baab71d4ef3dcbbc94e0a8622454 for accessors.

```
>> ? datatype!
...
    pair!           => [x y]
    percent!        => "No accessors"
    time!           => [hour minute second]
    email!          => [user host]
    date!           => [
    date year month day zone time hour minute second weekday yearday 
    timezone week isoweek julian
]
    image!          => [size argb rgb alpha]
    event!          => [
    type face window offset key picked flags away? down? mid-down? 
    alt-down? aux-down? ctrl? shift?
]
...
```

Need to decide whether to wrap or truncate date! and event! accessor blocks. Doesn't look as nice full, but omitting info here seems like a bad idea. Help doesn't have multiline output support, but we can improve it later.

### Actual behavior
```
>> ? datatype!
...
    pair!
    percent!     
    time!          
    email!         
    date!          
    image!
    event!         
...
```
### Steps to reproduce the problem
```
? datatype!
```
### Red version and build date, operating system with version.

0.6.3 on all platforms.



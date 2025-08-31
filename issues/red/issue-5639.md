
#5639: LOAD-CSV wront /as-record docstring
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 0 comment(s).
[type.documentation]
<https://github.com/red/red/issues/5639>

**Describe the bug**
Docstring for `load-csv` is wrong:

`/as-records  => Returns records instead of rows; implies /header.`

This refinement does not implies the `/header`, it must be added manually, otherwise it self assign column names as `A`,`B`,`C`...

It should be something like: `default names if /header is not used`
 
Discussion [here](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$n8JL2d2dnyadL6u7EidazuvQxf9H82tqIXpE_2u7jgE?via=gitter.im&via=matrix.org&via=tchncs.de):


**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 75 date: 13-Jul-2025/13:27:17 commit: #31205e5c6189648cfa852e73c71be1afc18445d0 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 26100 ]
--------------------------------------------
```





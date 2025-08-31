
#4737: literal file! is encoded differently between interpreter and compiler
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4737>

**To reproduce**
1. Open the Red console, type: 
```
>> probe pick %"///^@:<>?*" 5
#"@"
```
2. Compile the following code:
```
Red []
do [probe pick %"///^@:<>?*" 5]
```
Run the executable, output:
```
#":"
```
**Expected behavior**
Same output in both interpreter and compiler.

**Platform version**
Please specify the operating system, Red version, and build date with Git commit.
```
All platforms, commit 9b937c19a2befe87d5c7f225621836d893763eb0
```




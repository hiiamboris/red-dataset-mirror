
#5231: Empty string breaks LAYOUT parsing
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5231>

**Describe the bug**

VIEW / LAYOUT / RTD-LAYOUT/WITH breaks at times when empty strings are included

**To reproduce**
 
```
unview/all view/no-wait [
      rich-text 100x100 data [
          font 9  i "" /i /font
          ]]
*** Script Error: f has no value
*** Where: either
*** Near : f
*** Stack: view layout fetch-options rtd-layout pop

```

**Expected behavior**

It'd be nice if it worked......Or gave a meaningful errors message like it does if the empty string is not there:

```
view/no-wait [rich-text 100x100 data [font 9  i  /i /font]]
*** Script Error: RTD - invalid syntax at: [/i /font]
*** Where: do
*** Near : spec: fetch-options face opts style spec 
*** Stack: view layout fetch-options rtd-layout cause-error  

```


**Platform version**

     
    RED: [ branch: "master" tag: #v0.6.4 ahead: 4547 date: 21-Oct-2022/9:42:09 
    commit: #728a4508f6044e40d275a4d27f271ad600df6087 ]
    PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22000 ]



Comments:
--------------------------------------------------------------------------------

On 2022-10-22T10:01:16Z, dockimbel, commented:
<https://github.com/red/red/issues/5231#issuecomment-1287699512>

    Minimal code to reproduce: 
    ```
    view [rich-text 100x100 data [font 9  i "" /i /font]]
    ```


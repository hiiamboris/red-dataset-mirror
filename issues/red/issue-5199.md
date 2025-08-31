
#5199: Wrong text length calculation
================================================================================
Issue is closed, was reported by luce80 and has 10 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5199>

**Describe the bug**
For some values of font size the calculated text length is wrong and the text is clipped. I am on Win11

**To reproduce**
```
>> view [text "targets react to slider , slider reacts to field" bold font [size: 10]]
```
**Expected behavior**
No text clipping

**Screenshots**
![image](https://user-images.githubusercontent.com/17967405/188314466-0f286fec-508d-45aa-89c8-cb5554fcf2a0.png)


**Platform version**
```
>> about
Red 0.6.4 for Windows built 4-Sep-2022/12:59:01+02:00  commit #d85b2ef
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-04T13:14:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/5199#issuecomment-1236339021>

    :point_up: [September 4, 2022 3:46 PM](https://gitter.im/red/bugs?at=63149e297ccf6b6d45bb8ad5)

--------------------------------------------------------------------------------

On 2022-09-09T18:08:13Z, luce80, commented:
<https://github.com/red/red/issues/5199#issuecomment-1242309570>

    NIce ! But...is it possible to have the text length calculated **exactly** ?
    ```
    >> about
    Red 0.6.4 for Windows built 9-Sep-2022/17:02:57+02:00  commit #2a77792
    >> view [text red yellow "targets react to slider , slider reacts to field" bold font [size: 23]]
    ```
    ![image](https://user-images.githubusercontent.com/17967405/189415404-7baaa26e-2cbf-44f3-911f-3634a7630201.png)

--------------------------------------------------------------------------------

On 2022-09-09T18:51:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/5199#issuecomment-1242348595>

    on W10 works fine: ![](https://i.gyazo.com/d0be9399c20e7b4a9b217288a682828a.png)

--------------------------------------------------------------------------------

On 2022-09-09T18:54:42Z, greggirwin, commented:
<https://github.com/red/red/issues/5199#issuecomment-1242351595>

    Confirmed @hiiamboris' result on Win10.
    ![image](https://user-images.githubusercontent.com/460079/189423678-793f30ed-b1c6-41e5-aa93-f0d6dec8e4a6.png)

--------------------------------------------------------------------------------

On 2022-09-09T22:33:22Z, qtxie, commented:
<https://github.com/red/red/issues/5199#issuecomment-1242530432>

    @luce80 Confirmed on Win11.


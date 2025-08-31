
#3660: Decompress crashes
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.dismissed] [type.bug]
<https://github.com/red/red/issues/3660>

**To reproduce**
Run the following code in the console.
```
data: #{
    CC94DF6AC23014C6EF077B8792DBD1441D8C31AC5EECCFE526CC3D40D69CDA60
    9A849CE8F4ED771A758CD129A2B0DD34B4C9F9BE5F4F926F385E35265B4240ED
    6CC1FABCC732B0A553DACE0AF6367DCA6F5986515A258DB350B035201B8F2E2F
    86D3B507CCA8DA62C1EA18FD9D1058D6D048E4CE83A599CA8546467A0D33E165
    39973310835EEF4694CE46B0318FAD061B0D1FA0920B13B3C7157DDE900430C8
    B2FBCDC2D6AB60D27BA34B1989542CADFAE1926F1D3855A635586B8F5784C144
    A7433BF3BBC1B6EE855A13B4826C22437C960D618895111F2ECCDF9D9BF3FD22
    1D94AEAA7409CA958B863AC0D107900A6B80D8189E46DE486D77DC7BFCD36214
    69E89F19A4FDBF247C24C7E09F705CFF1147A4F30F223D4FDF922473600330AE
    0DE0B98F61123DE45CCB00EA35064A8AB3037CD7DEC741F768129C474A9400C7
    776117196D75EE490842D4F0151A5D97EFCB91D2E8E4B6439B770A5487B748F9
    3AFA040000FFFF0300
}

crc: #{7C6C9816}
size: #{A0050000}
bytes: 1440
decompress/deflate rejoin [#{789C} data copy crc] bytes
```

**Expected behavior**
Decompress the data correctly.

**Platform version (please complete the following information)**
red v0.6.4 all platforms



Comments:
--------------------------------------------------------------------------------

On 2019-11-24T14:28:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/3660#issuecomment-557893785>

    I'm getting this:
    ```
    >> decompress/deflate rejoin [#{789C} data copy crc] bytes
    *** Script Error: data not in correct format: none
    *** Where: decompress
    *** Stack:  
    ```
    `Red 0.6.4 for Windows built 17-Nov-2019/7:36:01+03:00 commit #640c00e`
    `Red 0.6.4 for Windows built 24-Nov-2019/17:34:37+03:00`

--------------------------------------------------------------------------------

On 2019-11-24T17:26:43Z, qtxie, commented:
<https://github.com/red/red/issues/3660#issuecomment-557909529>

    The `data` is wrong. I don't remember why I open this issue. I'll close it.


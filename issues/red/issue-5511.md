
#5511: VID on Ubuntu doesn't right align
================================================================================
Issue is closed, was reported by SkySpiral7 and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5511>

**Describe the bug**
VID right alignment doesn't work on Ubuntu. Works fine on Windows 10.

**To reproduce**
```red
view [
   text right "Short" return
   text right "Much longer text"
]
```

**Expected behavior**
The texts are centered but should be right aligned.

**Screenshots**
![image](https://github.com/red/red/assets/7716584/e25ce4c2-8bef-492c-832d-e1af9f7f9547)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 166 date: 16-Jun-2024/0:59:09 commit: #08d41eeae7c90cf9b32ad3caf9de842c659f619b ]
PLATFORM: [ name: "Ubuntu 22.04.4 LTS" OS: 'Linux arch: 'x86_64 version: 6.5.0 build: {#35~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue May  7 09:00:52 UTC 2} ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-06-17T09:30:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5511#issuecomment-2172864494>

    This is not the case. 
    ![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/78VcCE3.png)
    You are mistaking default `text` width with center alignment.
    Try instead:
    ```
    view [
       text 200 right "Short" return
       text 200 right "Much longer text"
    ]
    ```

--------------------------------------------------------------------------------

On 2024-06-17T18:39:25Z, greggirwin, commented:
<https://github.com/red/red/issues/5511#issuecomment-2174173605>

    I was misled by a quick viz check as well. The original example was in a container, and looked correct. but adding the extra colors as @hiiamboris did shows what's going on even more.
    ```
    view [
      group-box 3 [
        text blue white right "Before Stream: "
        beforeStreamDisplay: text blue white "None"
        button "Select file" [beforeStreamDisplay/text: (to string! request-file)]
    
        text blue white right "Delta Stream: "
        deltaStreamDisplay: text blue white "None"
        button "Select file" [deltaStreamDisplay/text: (to string! request-file)]
      ]
      panel 3 [
        text blue white right "Before Stream: "
        f-3: text blue white "None"
        button "Select file" [f-3/text: (to string! request-file)]
    
        text blue white right "Delta Stream: "
        f-4: text blue white "None"
        button "Select file" [f-4/text: (to string! request-file)]
      ] return
    ]
    ```
    ![image](https://github.com/red/red/assets/460079/8a27fe88-9fa4-4a08-9f82-cf0782e13b17)
    
    But if we make the first text longer, it becomes clear.
    ```
    view [
      group-box 3 [
        text blue white right "XXXX Before Stream: "
        beforeStreamDisplay: text blue white "None"
        button "Select file" [beforeStreamDisplay/text: (to string! request-file)]
    
        text blue white right "Delta Stream: "
        deltaStreamDisplay: text blue white "None"
        button "Select file" [deltaStreamDisplay/text: (to string! request-file)]
      ]
      panel 3 [
        text blue white right "XXXX Before Stream: "
        f-3: text blue white "None"
        button "Select file" [f-3/text: (to string! request-file)]
    
        text blue white right "Delta Stream: "
        f-4: text blue white "None"
        button "Select file" [f-4/text: (to string! request-file)]
      ] return
    ]
    ```
    ![image](https://github.com/red/red/assets/460079/000b6050-cfd9-4a92-8526-d1db875d4d91)
    
    When columns are aligned in containers, the offset is adjusted, but not the width.
    
    


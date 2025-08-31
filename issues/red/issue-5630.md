
#5630: [VID] Window placement is not consistent across platforms
================================================================================
Issue is open, was reported by PeterWAWood and has 10 comment(s).
<https://github.com/red/red/issues/5630>

**Description**
When multiple windows are opened via VID using `view/no-wait`, the windows are placed differently on the OS Desktop. I have three examples, on Windows they are place one on top of each other, on Ubuntu(WSL2) they seem to be placed randomly on the OS Desktop and on PiOS they are neatly cascaded.

**To reproduce**
In the Red gui console, input:
```
loop 50 [ wait 0.01 view/no-wait [ size 200x200  button "clear" [ unview/all ] ] ]
```

**Expected behavior**
Consistent behaviour would be preferred.

**Screenshots**
50 windows displayed by Red on Windows
<img width="1915" alt="Image" src="https://github.com/user-attachments/assets/07c16c31-1817-4799-a632-443178212ba5" />

50 windows displayed by Red on Ubuntu(WSL2)
<img width="1810" alt="Image" src="https://github.com/user-attachments/assets/3cda653c-fadc-4c50-af7f-b54ece30ff90" />

50 windows displayed by Red on PiOS
![Image](https://github.com/user-attachments/assets/56dcfec1-9c50-4dc7-8109-c67ef8792be8)

Additionally, I wrote a short C program to display 50 windows via Win32 API using defaiult placement:
<img width="1915" alt="Image" src="https://github.com/user-attachments/assets/d9d0c55e-08c2-4ab5-870f-c8c67f061420" />

I also wrote a short C program to display 50 windows via GTK-3 on Ubuntu(WSL2)
<img width="1803" alt="Image" src="https://github.com/user-attachments/assets/243ba455-9cce-4ab0-9c8e-42215a1080a9" />

I have not yet been able to compile the GTK-3 program on PiOS.

**Platform version**
Windows: RED & PLATFORM VERSION
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 26100 ]
  
Ubuntu(WSL): RED & PLATFORM VERSION
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Ubuntu 22.04.5 LTS" OS: 'Linux arch: 'x86_64 version: 6.6.87 build: {#1 SMP PREEMPT_DYNAMIC Thu Jun  5 18:30:46 UTC 2025} ]

PiOS: RED & PLATFORM VERSION
RED: [ branch: "master" tag: #v0.6.6 ahead: 67 date: 30-May-2025/6:49:11 commit: #979d8e1bf808fd0c43ebe58806404f1be010f9c1 ]
PLATFORM: [ name: "Raspbian GNU/Linux 12 (bookworm)" OS: 'Linux arch: 'aarch64 version: 6.12.25 build: {#1 SMP PREEMPT Debian 1:6.12.25-1+rpt1 (2025-04-30)} ]

** Attachments**
Windows C program 
[many-windows.c.txt](https://github.com/user-attachments/files/20997014/many-windows.c.txt)
Remove .txt extension

GTK-3 program
[many-gtk-windows.c.txt](https://github.com/user-attachments/files/20997027/many-gtk-windows.c.txt)


Comments:
--------------------------------------------------------------------------------

On 2025-07-01T12:08:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5630#issuecomment-3023720106>

    Is there a reason to override the OS-default placement strategy?

--------------------------------------------------------------------------------

On 2025-07-01T20:51:15Z, PeterWAWood, commented:
<https://github.com/red/red/issues/5630#issuecomment-3025466597>

    The default strategy for Windows is being overridden. The C program clearly uses the default for window position. The x and y positions are both set to CW_USEDEFAULT. Red does not appear to display windows using default positioning.
    
    Why does Red position windows differently on Ubuntu and PiOS? they are both based on Debian.

--------------------------------------------------------------------------------

On 2025-07-02T00:26:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/5630#issuecomment-3025915053>

    I have compiled, linked and run the GTK C program on PiOS. It displays the windows as Red does.
    ![Image](https://github.com/user-attachments/assets/868f2687-9635-4732-a17c-45b15b961e7b)

--------------------------------------------------------------------------------

On 2025-07-02T00:33:56Z, PeterWAWood, commented:
<https://github.com/red/red/issues/5630#issuecomment-3025931632>

    To summarise, it seems that:
    
    1. On Windows,Red does not use default OS window placement.
    2. On Ubuntu(WSL2) and PiOS, Red uses default OS window placement.
    3. Default window placement appears to be different between Ubuntu(WSL2) 22.04 and PiOS though both versions are based on Debian Bookworm. 

--------------------------------------------------------------------------------

On 2025-07-02T00:38:36Z, PeterWAWood, commented:
<https://github.com/red/red/issues/5630#issuecomment-3025938714>

    User Experience Issues
    
    1. If a user opens five windows running on Windows OS, they can only see the top window. It they have to drag 4 windows to see the bottom window. If the windows are cascaded, they would be able to immediately drag the bottom window os that it could be seen.
    
    2. Even though it is due to the OS, the placement of windows under GTK-3 looks very untidy. Sadly some people will take that as a reflection of Red not Ubuntu (installed with WSL2).


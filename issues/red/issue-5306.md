
#5306: GTK GUI does not support IBus keyboards
================================================================================
Issue is closed, was reported by bradrn and has 42 comment(s).
<https://github.com/red/red/issues/5306>

**Describe the bug**

Red text input fields do not support IBus keyboard layouts. Rather than producing the expected character, pressing keys just produce characters from the underlying XKB layout — e.g. if I have a Hebrew layout enabled, it might show `akuo` instead of the expected  `שלום`.

Note: I can only test with keyboard layouts using the m17n IME, since other IBus layouts simply don’t seem to work at all on my machine. However, I strongly suspect this a problem with IBus, rather with m17n, since only the former is used directly by GUI toolkits.

**To reproduce**

1. Install IBus if not already installed, and select a keyboard layout (non-Latin keyboards give the most obvious effect)
2. Open Red
3. Start a GUI with a text input, using e.g. `view [area]`
4. Type into it

**Expected behavior**

The keyboard layout in IBus is used to enter characters into the text input.

**Screenshots**

N/A

**Platform version**

Using Red 0.6.4 on EndeavourOS (so basically Arch Linux). Not sure about other info since running `about` causes Red to crash with an ‘access violation’ error.


Comments:
--------------------------------------------------------------------------------

On 2023-04-16T15:48:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510417874>

    > running `about` causes Red to crash with an ‘access violation’ error.
    
    That's where your investigation should start then :) Must be something very wrong on your setup.
    
    Can you try to build a debug version of the console, as explained [here](https://github.com/red/red/#running-red-from-the-sources-for-contributors) but adding a `-d` flag, and then crash it with `about` and show us the trace?

--------------------------------------------------------------------------------

On 2023-04-16T16:06:51Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510421945>

    I just rediscovered a series of comments I made on a Discord server when I installed Red, and I found this:
    
    > … looks like [Red is] built as a 32-bit executable … Had to install 32-bit GTK, and patch the RPATH (though I’m not sure if that second step is needed or not, actually) but [now] it does work
    
    So maybe that’s the cause of my problems — it seems reasonable that 32-bit GTK wouldn’t work too well with the rest of my installation. Is it even possible to build Red as 64-bit on Linux?
    
    (That being said, Wine uses 32-bit libraries too, and it seems to work fine with IBus. So it’s quite possible this isn’t the problem.)

--------------------------------------------------------------------------------

On 2023-04-16T16:12:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510423081>

    Red shouldn't even run if 32-bit GTK is missing. Red is strictly 32-bit for now.

--------------------------------------------------------------------------------

On 2023-04-16T16:16:05Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510423819>

    > Red shouldn't even run if 32-bit GTK is missing.
    
    As I recall, this is indeed what happened before I installed it. I’m using Red with 32-bit GTK now.
    
    > Red is strictly 32-bit for now.
    
    Aw, pity… if this really is the problem, guess I’ll have to wait till v1.1 (according to the Roadmap). I’ll leave this issue open for now in case anyone else has any other ideas.

--------------------------------------------------------------------------------

On 2023-04-16T16:24:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510425363>

    There shouldn't be any problem having both 32- and 64-bit libs in your system at once.

--------------------------------------------------------------------------------

On 2023-04-16T19:16:23Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510464908>

    I know, and there isn’t any problem with it; I’m just wondering if 64-bit IBus might not interface well with 32-bit GTK.

--------------------------------------------------------------------------------

On 2023-04-16T19:23:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510466055>

    So probably the issue is that you don't have 32-bit IBus installed?

--------------------------------------------------------------------------------

On 2023-04-16T19:25:49Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510466435>

    Perhaps, but it’s more difficult than that, because IBus is auto-started with my Xfce desktop environment, so I’d have to switch from 64-bit to 32-bit IBus whenever I want to use Red — and potentially back to 64-bit when I want to do anything else! Also, I’m not even sure if IBus is distributed as 32-bit…

--------------------------------------------------------------------------------

On 2023-04-17T09:15:38Z, qtxie, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510989953>

    Tested on a VM. It works fine.
    Steps:
    1. Install EndeavourOS_Cassini_Nova-03-2023_R1
    2. Install 32-bit packages.
    ```
    sudo pacman -S lib32-curl lib32-gtk3
    ```
    3. Install iBus and setup
    ```
    sudo pacman -S ibus ibus-libpinyin
    ```
    4. reboot
    5. Download `red-view-16apr23-d36108eef`
    
    ![image](https://user-images.githubusercontent.com/1673525/232439115-dca9d52c-2a9e-4f95-8dcb-59c64743cac2.png)

--------------------------------------------------------------------------------

On 2023-04-17T09:16:57Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1510991838>

    OK, that’s really interesting! What happens if you try an m17n keyboard? (https://wiki.archlinux.org/title/Input_method#List_of_available_input_method_editors)

--------------------------------------------------------------------------------

On 2023-04-17T09:28:20Z, qtxie, commented:
<https://github.com/red/red/issues/5306#issuecomment-1511006980>

    @bradrn How to set to this (m17n) keyboard?

--------------------------------------------------------------------------------

On 2023-04-17T12:43:34Z, qtxie, commented:
<https://github.com/red/red/issues/5306#issuecomment-1511267864>

    
    https://user-images.githubusercontent.com/1673525/232487439-17b61961-f9a9-4ef1-b446-38a9ccd6a1bd.mp4
    

--------------------------------------------------------------------------------

On 2023-04-17T13:22:29Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1511339777>

    Interesting… so it must be a problem on my side. I’ll keep on investigating this issue.

--------------------------------------------------------------------------------

On 2023-04-18T07:49:50Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1512617477>

    @qtxie Quick question… what does `view [area on-key-down [print event/key]]` print for you when you’re using `ja-tcode`?
    
    (Also, now that I think about it, is a GitHub issue even the right place to talk about this now? Happy to close it and move discussion elsewhere if that would work better.)

--------------------------------------------------------------------------------

On 2023-04-18T08:15:21Z, qtxie, commented:
<https://github.com/red/red/issues/5306#issuecomment-1512656037>

    @bradrn It prints the raw characters from the keyboard. I type 'c', 'c' on the keyboard, it prints 'C', 'C' rather than `ゆ`. That's expected. While `view [area on-key [print event/key]]` prints 'c', 'c', which is wrong. It should print `ゆ`.
    
    It's Ok to discuss it on the Github issue.

--------------------------------------------------------------------------------

On 2023-04-18T08:36:41Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1512684641>

    I’m not sure I understand what you’re saying… what is the wrong behaviour exactly?

--------------------------------------------------------------------------------

On 2023-04-18T08:41:04Z, qtxie, commented:
<https://github.com/red/red/issues/5306#issuecomment-1512691457>

    @bradrn `on-key-down` event is Ok. `on-key` event is wrong.

--------------------------------------------------------------------------------

On 2023-04-20T18:22:37Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1516760926>

    @qtxie A couple more quick questions: what value do you have for the `GTK_IM_MODULE` environment variable? And which command-line arguments was the `ibus-daemon` process launched with?

--------------------------------------------------------------------------------

On 2023-04-22T03:36:43Z, qtxie, commented:
<https://github.com/red/red/issues/5306#issuecomment-1518494385>

    @bradrn I set those 2 variables after installed ibus.
    
    ```
    GTK_IM_MODULE=ibus
    XMODIFIERS=@im=ibus
    ```
    Then I run `ibus-setup` to setup it. I didn't run `ibus-daemon`. Maybe `ibus-setup` run it automatically.

--------------------------------------------------------------------------------

On 2023-04-22T07:15:26Z, bradrn, commented:
<https://github.com/red/red/issues/5306#issuecomment-1518543656>

    `ibus-setup` should start `ibus-daemon` if it’s not running. (For me it pops up a dialog box asking whether I want to start it or not.)

--------------------------------------------------------------------------------

On 2024-01-15T07:26:56Z, qtxie, commented:
<https://github.com/red/red/issues/5306#issuecomment-1891459457>

    It should be an issue of the OS settings rather than on Red GTK backend. I'll close this issue.


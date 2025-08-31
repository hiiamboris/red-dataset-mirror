
#1547: [linux/fish-shell] Red either fails or runs depending on the way it is called
================================================================================
Issue is closed, was reported by xaduha and has 16 comment(s).
<https://github.com/red/red/issues/1547>

```
one@voidlinux ~> pwd
/home/one
one@voidlinux ~> which red
/usr/bin/red
one@voidlinux ~> red
PROGRAM ERROR: Invalid encapsulated data.
one@voidlinux ~> /usr/bin/red
--== Red 0.5.4 ==--
Type HELP for starting information.

red>>
```

I'm using fish-shell, so it probably has something to do with the environment. Still, something is fishy.

```
one@voidlinux ~> env | sort > env1.txt
one@voidlinux ~> bash
[one@voidlinux ~]$ env | sort > env2.txt
[one@voidlinux ~]$ diff env*
16c16
< SHLVL=2

---
> SHLVL=3
22a23
> _=/usr/bin/env
```

Bottomline, works under bash, doesn't work under fish when called without specifying the absolute path.

~~Doesn't happen with `red-054` or the automated build that I previously used, commit 7526673.~~

EDIT: Having a red binary in a current folder allows it to launch normally, `red` and `./red` both.



Comments:
--------------------------------------------------------------------------------

On 2016-01-23T13:04:50Z, xaduha, commented:
<https://github.com/red/red/issues/1547#issuecomment-174185084>

    I don't know if it's in any way helpful, but other errors I had with this
    
    ```
    bash-4.3# red -d
    *** Driver Internal Error: Access Error : Bad file path: //.red/
    *** Where: throw-on-error
    *** Near:  [make-dir temp-dir]
    ```
    
    and 
    
    ```
    # red -d
    ** Script Error: Invalid compressed data - problem: -3
    ** Near: script: decapsulate
    if none? script
    ```

--------------------------------------------------------------------------------

On 2016-01-28T11:23:35Z, xaduha, commented:
<https://github.com/red/red/issues/1547#issuecomment-176131157>

    Looks like it's an old issue, related to #543.

--------------------------------------------------------------------------------

On 2017-09-14T15:06:18Z, spinningarrow, commented:
<https://github.com/red/red/issues/1547#issuecomment-329511839>

    I just got this issue on macOS with the fish shell. Should I reopen it?

--------------------------------------------------------------------------------

On 2017-09-15T09:48:32Z, dockimbel, commented:
<https://github.com/red/red/issues/1547#issuecomment-329735829>

    @spinningarrow Have you looked at the linked issue https://github.com/red/red/issues/543 ?

--------------------------------------------------------------------------------

On 2017-10-15T14:09:53Z, spinningarrow, commented:
<https://github.com/red/red/issues/1547#issuecomment-336714067>

    Yes, I did. That one is closed too and I couldn't really find a proper resolution for it (other than creating an alias to red, if I understood correctly). What I'm trying to say is - is this something red can fix from its side; or failing that, provide an error message to the user when it's started incorrectly what the workaround is?
    
    I'm also not sure why it works fine with bash but not with fish - what's the difference in the way the binary is invoked?

--------------------------------------------------------------------------------

On 2018-02-09T11:35:10Z, gour, commented:
<https://github.com/red/red/issues/1547#issuecomment-364410527>

    > I'm also not sure why it works fine with bash but not with fish - what's the difference in the way the binary is invoked?
    
    I also wonder about it?
    
    For now, I solved the issue, by having Red executable in my `PATH` and creating fish function `~/.config/fish/functions/red.fish` with the following content:
    
    ```
    function red
        ~/bin/red-063 $argv
    end
    ```

--------------------------------------------------------------------------------

On 2025-05-12T10:34:45Z, programandala-net, commented:
<https://github.com/red/red/issues/1547#issuecomment-2871995494>

    > I'm also not sure why it works fine with bash but not with fish - what's the difference in the way the binary is invoked?
    
    i have tried all shells i usually have installed.  beside fish (my default shell), the problem happens also with dash, es and rc, while bash, nu and zsh work fine:
    
    - [x] bash
    - [ ] dash
    - [ ] es
    - [ ] fish
    - [x] nu
    - [ ] rc
    - [x] zsh 
    
    as @gour suggested, a workaround is creating a fish wrapper function in <~/.config/fish/functions/> for the red compiler.  in my case:
    
    ```fish
    function redc
       ~/.local/bin/redc $argv
    end
    ```

--------------------------------------------------------------------------------

On 2025-05-12T16:45:52Z, greggirwin, commented:
<https://github.com/red/red/issues/1547#issuecomment-2873272979>

    Thanks for the test results!


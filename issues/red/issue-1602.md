
#1602: *** Error: cannot access argument file - When I start in Wine under Ubuntu 15.10
================================================================================
Issue is closed, was reported by Josh1-rtd and has 10 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1602>

`**\* Error: cannot access argument file
--== Red 0.5.4 ==-- 
Type HELP for starting information. 

red>>
`

Not critical issue maybe, since GUI console opens



Comments:
--------------------------------------------------------------------------------

On 2016-02-10T05:39:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1602#issuecomment-182207530>

    How do you start it in Wine? Could you provide the full command-line?

--------------------------------------------------------------------------------

On 2016-02-11T06:29:31Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1602#issuecomment-182735751>

    satish@satish-Aspire:~/Downloads/red$ ./red-11feb16-9ff1262.exe
    (Lots of messages on fixme Keyboard
    .....
    fixme:hnetcfg:fw_profile_get_FirewallEnabled 0x13f300, 0x33fd6c
    Compiling compression library...
    Compiling Red GUI console...
    satish@satish-Aspire:~/Downloads/red$ fixme:dwmapi:DwmIsCompositionEnabled
    0x33fc78
    
    ## Thereafter.. separate Red GUI Console opened. Below is what seen in it.-
    
    **\* Error: cannot access argument file
    --== Red 0.5.4 ==--
    Type HELP for starting information.
    
    ## red>>
    
    Same error if I open it by double-click on application file.
    
    regards
    
    On Wed, Feb 10, 2016 at 11:09 AM, Nenad Rakocevic notifications@github.com
    wrote:
    
    > How do you start it in Wine? Could you provide the full command-line?
    > 
    > —
    > Reply to this email directly or view it on GitHub
    > https://github.com/red/red/issues/1602#issuecomment-182207530.
    
    ## 
    
    regards
    Satish Joshi

--------------------------------------------------------------------------------

On 2016-02-21T11:12:21Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1602#issuecomment-186799150>

    This issue did not occur in the latest build of 21 Feb. There were no starting messages also, except these two..
    Compiling compression library... 
    Compiling Red GUI console...
    
    @dockimbel Did you solve this or it corrected on its own due to some other changes in code?
    
    ![a](https://cloud.githubusercontent.com/assets/17100026/13202251/0d877288-d8ba-11e5-9f20-fbb40f9b76e2.png)

--------------------------------------------------------------------------------

On 2016-02-21T11:26:18Z, dockimbel, commented:
<https://github.com/red/red/issues/1602#issuecomment-186803236>

    @RedJosh It was probably solved by [this fix](https://github.com/red/red/commit/04deb73e0d2a1915735c73d1c404db7bd9508691) from @qtxie.

--------------------------------------------------------------------------------

On 2016-02-21T11:46:33Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1602#issuecomment-186808147>

    @dockimbel Although I do not understand why the other black terminal remains open. I cannot do any thing with it. If I close it, Red Gui closes. I started Red by double-click on the Red exe. 
    
    If I start Red from X terminal - with this command ..
    wine /home/satish/Downloads/red/red-21feb16-667d309.exe
    I get lots of messages after which Red Gui console opens properly as above but it is detached from X terminal. Thereafter, I can close the X terminal and Red Console remains open.
    
    Just an observation. 


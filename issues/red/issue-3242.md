
#3242: system/build/date in compiled Red program (.exe file) does not reflect toolchain date
================================================================================
Issue is closed, was reported by meijeru and has 20 comment(s).
[type.review]
<https://github.com/red/red/issues/3242>

### Expected behavior
`system/build/date` should reflect the build date of the toolchain, so that users may know which version of the toolchain was used (especially important in the current state of flux)
### Actual behavior
in compiled Red programs `system/build/date` reflects the date/time of generation of the `.exe` file 
### Steps to reproduce the problem
compile any program that uses `system/build/date`
### Red version and build date, operating system with version.
0.6.3 W10

Note: if this is intentional (feature rather than bug) it should be documented.


Comments:
--------------------------------------------------------------------------------

On 2018-03-02T17:39:09Z, rebolek, commented:
<https://github.com/red/red/issues/3242#issuecomment-369994732>

    @meijeru While I understand what is your concern, I can't imagine how it would work without Git integration in Red. In that case I guess it would be good idea to introduce `system/build/commit` which would reflect toolchain version better than build date (and leave build date like it is).

--------------------------------------------------------------------------------

On 2018-03-02T19:37:13Z, meijeru, commented:
<https://github.com/red/red/issues/3242#issuecomment-370029658>

    But in the GUI console, the build date is correct! So the red.exe file contains the right build-date. It could transmit that into the .exe file resulting from the compilation of the user program, no?

--------------------------------------------------------------------------------

On 2018-03-02T21:36:43Z, greggirwin, commented:
<https://github.com/red/red/issues/3242#issuecomment-370059662>

    Along the lines of Bolek's thinking, what if we have a `system/build/tag` field, which could be just a git commit, or something else informative? Imagine the bigger picture, where people have custom runtimes, maybe more than one in a company, etc. Then, as Rudolf notes, we need to document how it's set.

--------------------------------------------------------------------------------

On 2018-03-03T15:24:44Z, meijeru, commented:
<https://github.com/red/red/issues/3242#issuecomment-370155370>

    I understand that you find it desirable that `system/build/date` in a compiled Red program (executable) reflects the creation of the executable rather than the creation of the toolchain version. If that is the case, than you indeed need a separate field to store what I wanted to keep, namely the creation data/time of the toolchain version, chiefly to be able to say, from within an executable: "created by Red version xxx".

--------------------------------------------------------------------------------

On 2018-03-13T10:07:12Z, dockimbel, commented:
<https://github.com/red/red/issues/3242#issuecomment-372612336>

    `system/build/date` is for the current executable, the info for toolchain used to build it should be carried by other fields.
    
    @x8x is working on it, maybe he can paste here the proposed changes.

--------------------------------------------------------------------------------

On 2018-03-18T11:02:45Z, x8x, commented:
<https://github.com/red/red/issues/3242#issuecomment-373989231>

    # Git versioning integration
    
    **Note:** `system/build/date` returns the build time of the current running binary, either Console or any other compiled red script, not related to the red binary build time itself!
    
    **Timestamp used for naming support files:**
    
        %build/precap.r
        	sets build-date from %build/timestamp.r
        
        %red.r/redc/decorate-name
        	uses build-date
        %red.r/redc/build-compress-lib
        	uses decorate-name
        %red.r/redc/run-console
        	uses decorate-name
        %red.r/redc/needs-libRedRT?
        	uses build-date
    
    **Timestamp used by Red Console or any Red compiled script:**
    
        %compiler.r/red/compiler/comp-directive
        	sets #build-date from now
        %system/compiler.r/system-dialect/compiler/comp-directive
        	sets #build-date from now
        
        %runtime/datatypes/common.reds/get-build-date
        	uses #build-date
        %red.r/redc/needs-libRedRT?
        	uses "red/get-build-date"
        %environement/system.red/system/build/date
        	uses #build-date
    
    # Why
    
    - Use git commit timestamp for nightly binaries name
      - currently use local datetime at build start, ex: red-**10mar18**-ba1f87d2
    - ~~Build Red binaries that have fixed checksum for each git commit:~~
      - ~~Binaries can be regenerated at different time but maintain same checksum~~
      - ~~Users can verify locally built binaries with checksum provided on Red website~~
      - ~~currently that is not the case because the timestamp included in the binary from `%build/timestamp.r` is the local datetime at build time which changes at every run altering the binary checksum~~
    
      **Unfortunately, encapping identical sources produce different binaries at each run :-(**
    
    - Add `system/build/git` to provide information about git status at build time
    - Fix issue [https://github.com/red/red/issues/3242](https://github.com/red/red/issues/3242)
    - Change `system/build/date` to UTC zone to prevent leak of zone ( privacy )
    - There are hints that Carl will make the SDK available for free, more users will want to build their owns
    
    # How
    
    - Build from local git repo, build script **can** query git
      - `system/build/git` would return:
    
            object [
            	branch: {master}
            	tag: {v0.6.3-348-gbffefe9d}
            	date: 16-Oct-2048/0:14:49+00:00
            	hash: {bffefe9d483f5e31f91fbb4317b3584f96acb639} ;short or long?
            	info: {commit message here}                      ;info or msg ?
            ]
    
    
    - Build from local downloaded sources, build script **can not** query git
      - `system/build/git` would return:
    
            none
    
    # Implementation
    
    [https://github.com/x8x/red/commit/277c0d3ce62f8568fcb741463dbe665174ea3246](https://github.com/x8x/red/commit/277c0d3ce62f8568fcb741463dbe665174ea3246)
    
    ## Problems:
    
    - ~~not tested on Windows !~~
    
    # Further improvements
    
    **date** returned by `system/build/date` and `system/build/git/date` should be localized at run time, below function should be added to Red
    
        to-local-date: func [date][
        	date/timezone: now/zone
        	date
        ]
    
    `%environement/system.red` should be updated to use such function for both value above

--------------------------------------------------------------------------------

On 2018-03-18T11:09:31Z, x8x, commented:
<https://github.com/red/red/issues/3242#issuecomment-373989611>

    Feedback and Windows testing would be much appreciated !

--------------------------------------------------------------------------------

On 2018-03-19T12:08:10Z, x8x, commented:
<https://github.com/red/red/issues/3242#issuecomment-374190378>

    Updated with fixes for Windows: https://github.com/x8x/red/commit/277c0d3ce62f8568fcb741463dbe665174ea3246
    
    Note that date when the Red binary has been built is used only for naming the support files (crush, console, etc) and it is not localised (zone stays at UTC) , it is not available for querying.
    The reasoning for not localising is the file name doesn't include zone info. Would it still be more friendly/useful to have it localised?
    Should red binary build date also be available and if yes under which path?

--------------------------------------------------------------------------------

On 2018-03-19T12:25:25Z, x8x, commented:
<https://github.com/red/red/issues/3242#issuecomment-374194395>

    Git `hash` long or short? For git commit message use `info` or `msg` ?

--------------------------------------------------------------------------------

On 2018-03-20T04:14:10Z, dockimbel, commented:
<https://github.com/red/red/issues/3242#issuecomment-374468703>

    > Note that date when the Red binary has been built is used only for naming the support files (crush, console, etc) and it is not localised (zone stays at UTC) , it is not available for querying.
    The reasoning for not localising is the file name doesn't include zone info. Would it still be more friendly/useful to have it localised?
    
    The reason for putting the date in the file names is just to have unique names, that correspond to a unique Red binary, so those file versions don't get mixed up. It's not meant to be an information for the user.


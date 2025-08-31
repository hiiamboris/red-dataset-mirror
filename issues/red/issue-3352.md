
#3352: Programs compiled for RPi target fail with runtime access violation
================================================================================
Issue is closed, was reported by PeterWAWood and has 22 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3352>

### Expected behavior
Programs execute properly on Raspberry Pi
### Actual behavior
I ran the Red tests on Raspberry Pi  and they all failed with access violations.
### Steps to reproduce the problem
Compile the following program with `-t RPI` and run it on a Raspberry Pi (hard float).
```text
Red []

print "Hello World"
```
I get this result:
```text
pi@pi2b:~/Code/Red $ ./hello-pi

*** Runtime Error 1: access violation
*** at: 00058DECh
```

### Red and platform version
I compiled the program using:
```
>> system/build
== make object! [
    date: 28-Apr-2018/7:51:00+08:00
    git: none
    config
>> probe system/build/config
make object! [
    config-name: 'Darwin
    OS: 'macOS
    OS-version: 10.12
    ...
```
The Raspberry Pi was running "Raspbian GNU/Linux 9 (stretch)"


Comments:
--------------------------------------------------------------------------------

On 2018-04-28T07:52:09Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3352#issuecomment-385150399>

    A Red/System "Print Hello" runs correctly.
    
    ```text
    $ ./hello-pi
    Hello World
    ```

--------------------------------------------------------------------------------

On 2018-04-28T07:57:04Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3352#issuecomment-385150698>

    The Red/System test pass though the two tests requiring dynamic libs fail. (I need to look into the test build script.)

--------------------------------------------------------------------------------

On 2018-04-28T10:37:52Z, dockimbel, commented:
<https://github.com/red/red/issues/3352#issuecomment-385164170>

    I wish we had CI support for RPi builds... @x8x Do you think we use Travis for that?

--------------------------------------------------------------------------------

On 2018-04-29T00:35:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3352#issuecomment-385215636>

    Quick R&D links, to maybe save some time:
    
    - https://www.tomaz.me/2013/12/02/running-travis-ci-tests-on-arm.html
    - http://blog.kragniz.eu/raspbian-on-travis-ci/
    - Use a real RPi, which will be slow

--------------------------------------------------------------------------------

On 2018-05-02T21:26:45Z, x8x, commented:
<https://github.com/red/red/issues/3352#issuecomment-386126791>

    @dockimbel There is sure a way to run the test suite for RPi, I'm not familiar with the test suite, would that mean running this https://github.com/red/red/blob/master/.travis.yml in a RPi environment ? And the Rebol "Linux ARM libc6" found here http://www.rebol.com/downloads.html should run on RPi ? @PeterWAWood as curator of the test suite would you have instructions/suggestions?

--------------------------------------------------------------------------------

On 2018-05-02T22:48:37Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3352#issuecomment-386145079>

    @x8x There isn't a version of Rebol 2 that can be run reliably on most ARM environments. The tests need to be cross-compiled in an Intel environment, transferred to the ARM environment and then run.
    
    The manual process is:
    1. Run red/tests/build-arm-tests.r
    2. Transfer the contents of red/quick-test/runnable/arm-tests/red to the ARM host.
    3. Run ./run-all.sh BASH script
    4. Run red/system/tests/build-arm-tests.r
    5. Transfer the contents of red/quick-test/runnable/arm-tests/system to the ARM host
    6. Run ./run-all.sh BASH script
    
    Notes.
    1. The build-arm-test scripts take a parameter - "Linux", "Android" or  "RPi"
    2. Linux is for ARM soft float, RPi is for ARM hard float
    3. The BASH script is very crude, my first and only BASH script

--------------------------------------------------------------------------------

On 2018-05-02T23:33:06Z, x8x, commented:
<https://github.com/red/red/issues/3352#issuecomment-386152649>

    @PeterWAWood Thank you for those details, they are of great help! Got  RPi running but still unable to run the Rebol ARM on it, I'll do as you say, should be good! :-)

--------------------------------------------------------------------------------

On 2018-07-01T11:54:04Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3352#issuecomment-401601834>

    @dockimbel Against the latest master, the ARM tests are no longer crashing with an access violation. Two of them, decompress-test.red and load-test.red are crashing with segmentation faults. 
    
    (I will try to isolate the actual code that is causing the crash as soon as I have time.)

--------------------------------------------------------------------------------

On 2018-07-02T04:46:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3352#issuecomment-401671356>

    @dockimbel I have isolated the test in load-test.red the is giving a segmentation fault:
    
    ```text
    --test-- "load-41"	--assert "1.0e23"		= mold load "0.99999999999999999999999999999999999999999e+23"
    ```
    
    Here is confirmation in a Red console running on ARM:
    ```text
    >> mold load "0.99999999999999999999999999999999999999999e+23"
    Segmentation fault
    
    ```

--------------------------------------------------------------------------------

On 2018-07-02T04:50:13Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3352#issuecomment-401671811>

    This is also causing a segmentation fault:
    ```text
    mold load "2183167012312112312312.23538020374420446192e-370"
    ```

--------------------------------------------------------------------------------

On 2018-07-02T08:03:52Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3352#issuecomment-401704348>

    The tests causing segmentation faults in decompress-test.red are:
    ```text
    	--test-- "dynamic trees"
    		data: #{1F8B08088C57A6590400746573743531000DC6C10DC0200C03C0553C40978A086A2DA5B8020A627BB8D775BDAA55136C3084468E05B77581988CC02DE8EF8D9E61C5F1D838C1C7549836AB6E73E93D000000}
    		origin: #{746F6D6F72726F772069732061206C6F76656C79206461792C20692077696C6C20676F206F75747369646520616E6420686176652061207069636E6963}
    		--assert origin = decompress data
    ```
    
    and
    
    ```text
    --test-- "zlib 1"
    		data: #{789C35C6C10980301005D156A6009B5AD8A00BAB1F929890EECD45E6F0A6EB56AD9A44C3488D920BB77510CCC8E4147A7B0B2FD8E35C36F66CFE3E0CC71765}
    		origin: "tomorrow is a lovely day, i will go outside and have a hahahahaha"
    		--assert origin = to-string decompress/zlib data 65
    ```


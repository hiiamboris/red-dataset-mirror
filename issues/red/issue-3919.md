
#3919: cannot install Red into Ubuntu 18.04 WSL under Windows 10 Home
================================================================================
Issue is closed, was reported by mxdpeep and has 6 comment(s).
<https://github.com/red/red/issues/3919>

1. I have added the libraries
> apt-get install libc6:i386 libcurl4:i386

2. when trying to run the downloaded binary
> cannot execute binary file: Exec format error



Comments:
--------------------------------------------------------------------------------

On 2019-06-18T08:23:31Z, mxdpeep, commented:
<https://github.com/red/red/issues/3919#issuecomment-503001225>

    We don’t currently have plans to support running ELF-32 binaries on WSL x64.
    

--------------------------------------------------------------------------------

On 2019-06-18T08:24:11Z, rebolek, commented:
<https://github.com/red/red/issues/3919#issuecomment-503001444>

    It seems that WSL doesn't support 32bit apps: https://github.com/Microsoft/WSL/issues/2468

--------------------------------------------------------------------------------

On 2019-07-23T13:59:10Z, mxdpeep, commented:
<https://github.com/red/red/issues/3919#issuecomment-514222287>

    > It seems that WSL doesn't support 32bit apps: [microsoft/WSL#2468](https://github.com/microsoft/WSL/issues/2468)
    
    makes sense 👍 



#3078: Windows compilation of script failed with "undefined word input"
================================================================================
Issue is closed, was reported by nd9600 and has 12 comment(s).
[status.resolved]
<https://github.com/red/red/issues/3078>

### Expected behavior
Compilation succeeded

### Actual behavior
Compilation failed with the error `undefined word input`

### Steps to reproduce the problem

Compile [this file](https://gist.github.com/nd9600/3d8c1e92e39fe76c29dbba7c0018104e) on Windows:
`red.bat -c x.red`, `red.bat -c -r x.red`, `red.bat -c -r -t Linux x.red` all fail with the same error.

Is it not possible to compile files that need user input to run yet?

I tried to compile it on Red 0.6.2 and got the same error

### Red version and build date, operating system with version.
`Red for Windows version 0.6.3 built 8-Oct-2017/21:50:01+01:00`, Windows 10


Comments:
--------------------------------------------------------------------------------

On 2017-10-11T07:00:29Z, 9214, commented:
<https://github.com/red/red/issues/3078#issuecomment-335701964>

    `ask` and `input` are not part of Red runtime library (yet), they're only available from console and interpreter. 
    
    If you want to use them, you need to include proper files with functions definitions. See [`how to compile ask?`](https://github.com/red/red/wiki/Guru-Meditations#how-to-compile-ask) entry in wiki.

--------------------------------------------------------------------------------

On 2020-01-07T13:40:13Z, hamzamu, commented:
<https://github.com/red/red/issues/3078#issuecomment-571590141>

    > `ask` and `input` are not part of Red runtime library (yet), they're only available from console and interpreter.
    > 
    > If you want to use them, you need to include proper files with functions definitions. See [`how to compile ask?`](https://github.com/red/red/wiki/Guru-Meditations#how-to-compile-ask) entry in wiki.
    
    Hello, I know this is a long issue, but is it resolved yet, Also the wiki entry is empty. Is there any related documents? 

--------------------------------------------------------------------------------

On 2020-01-07T13:53:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3078#issuecomment-571595324>

    https://github.com/red/red/wiki/[DOC]-Guru-Meditations#how-to-compile-ask

--------------------------------------------------------------------------------

On 2020-01-07T21:48:29Z, hamzamu, commented:
<https://github.com/red/red/issues/3078#issuecomment-571788510>

    > [https://github.com/red/red/wiki/[DOC]-Guru-Meditations#how-to-compile-ask](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#how-to-compile-ask)
    
    Thank you

--------------------------------------------------------------------------------

On 2020-01-07T21:55:06Z, hamzamu, commented:
<https://github.com/red/red/issues/3078#issuecomment-571790956>

    > [https://github.com/red/red/wiki/[DOC]-Guru-Meditations#how-to-compile-ask](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#how-to-compile-ask)
    
    I tried and it didn't work. I am using Solus Linux, I am still getting 
    
    
    `*** Compilation Error: undefined word ask 
    `
    

--------------------------------------------------------------------------------

On 2020-01-07T21:59:24Z, 9214, commented:
<https://github.com/red/red/issues/3078#issuecomment-571792518>

    @hamzamu please use [community chat](https://gitter.im/red/help) if you need any assistance with that. The issue tracker is mainly for bug reporting and collaboration with contributors.
    
    Also, don't forget to provide a minimal code example with the problem that you encountered, that will help others to identify the culprit.


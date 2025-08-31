
#3166: How to use write/info to set HTTP POST parameters?
================================================================================
Issue is closed, was reported by JunyanHe and has 10 comment(s).
[status.resolved] [type.documentation]
<https://github.com/red/red/issues/3166>

I want to use write/info to set HTTP POST parameters. 
write/info http://httpbin.org/post  [post [] "name=Tom"]
The server can not get the args.


Comments:
--------------------------------------------------------------------------------

On 2017-12-25T13:42:11Z, dockimbel, commented:
<https://github.com/red/red/issues/3166#issuecomment-353870377>

    You should ask such question in the [chat room](https://gitter.im/red/help). Github issues are for reporting issues.

--------------------------------------------------------------------------------

On 2017-12-25T13:45:42Z, dockimbel, commented:
<https://github.com/red/red/issues/3166#issuecomment-353870545>

    @qtxie Where did we put the doc for that? :-)

--------------------------------------------------------------------------------

On 2017-12-26T12:54:38Z, 9214, commented:
<https://github.com/red/red/issues/3166#issuecomment-353965707>

    [This one](https://github.com/red/red/wiki/Guru-Meditations#how-to-make-http-requests) will do?

--------------------------------------------------------------------------------

On 2017-12-26T14:00:27Z, qtxie, commented:
<https://github.com/red/red/issues/3166#issuecomment-353971862>

    @JunyanHe Please check the document in @9214's reply.

--------------------------------------------------------------------------------

On 2017-12-27T06:02:38Z, JunyanHe, commented:
<https://github.com/red/red/issues/3166#issuecomment-354058023>

    When I put head "Content-Type", it works.
    write/info http://httpbin.org/post  [post [Content-Type: "application/x-www-form-urlencoded"] "name=Tom"]
    
    Thanks @9214 , @qtxie 


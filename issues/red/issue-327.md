
#327: wish: option to perform first pass of Red only
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/327>

Very small programs, such as the ones I write to test a feature and come up with an issue, compile in some 300 ms (1st pass) and 12000 ms (2nd pass) on my box. I suppose that the ratios will be similar on other H/W. For quick checking it might be useful to have the 1st pass performed only.



Comments:
--------------------------------------------------------------------------------

On 2012-12-01T22:31:36Z, dockimbel, commented:
<https://github.com/red/red/issues/327#issuecomment-10923143>

    Actually, the main cause for the slowness of the second pass (native compilation) is that all the runtime Red and Red/System library and boot.red script are recompiled totally each time. Adding modular compilation will solve that.
    
    In the meantime, I will provide you with a compilation option that will stop after first pass.

--------------------------------------------------------------------------------

On 2012-12-02T13:28:41Z, dockimbel, commented:
<https://github.com/red/red/issues/327#issuecomment-10929587>

    See the commit log for more information about the verbose level.

--------------------------------------------------------------------------------

On 2012-12-03T11:28:55Z, meijeru, commented:
<https://github.com/red/red/issues/327#issuecomment-10949476>

    Thanks! It works fine.


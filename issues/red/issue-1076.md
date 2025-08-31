
#1076: Does Compiled Red know now/precise?
================================================================================
Issue is closed, was reported by iArnold and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1076>

I was trying to randomize results using random/seed using the integer! input from now/precise
(random/seed now/precise) 
But after using that the program did not produce any output. 
Even a program consisting only of 

Red []
print form type? now/precise

Does not produce result (with or without form)



Comments:
--------------------------------------------------------------------------------

On 2015-03-31T15:37:56Z, kealist, commented:
<https://github.com/red/red/issues/1076#issuecomment-88136858>

    `now` is not implemented in Red at this point.  You would have to use a library call to get the time.    


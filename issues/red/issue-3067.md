
#3067: [libRed] redRoutine seems not to be working correctly on Windows.
================================================================================
Issue is closed, was reported by Oldes and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3067>

As I was not able to make it running [using Red/System only](https://github.com/red/code/pull/68), I decided to use Win32 desktop app to embedd Red library, but the `redRoutine` related code is not working too.

In my test I have defined routine like:
```
extern "C" red_integer add(red_integer a, red_integer b) {
	redProbe(a);
	redProbe(b);
	printf("add called! %ld %ld\n", redCInt32(a), redCInt32(b));
	return redInteger(redCInt32(a) + redCInt32(b));
}
```

and than in `WinMain` I used code which is in test.c from Red repository:
```
	red_error err;

	redOpen();
	redOpenLogWindow();
	redRoutine(redWord("c-add"), "[a [integer!] b [integer!]]", (void*)&add);
	if (err = redHasError())
		redPrint(err);
	else
		redDo("probe c-add 2 3 probe :c-add");
```
In console I can see:
```
integer!
false
4050156
routine [[extern] a [integer!] b [integer!]] none
```
where only the last line seems to be correct. I expect to have:
```
2
3
5
```
for the 3 first lines.

Above is for libRed.dll with `cdecl`. When used `stdcall` version, I get this error:
```
*** Script Error: LIBRED - invalid argument for redRoutine
*** Where: ???
```


Comments:
--------------------------------------------------------------------------------

On 2017-10-10T12:12:21Z, dockimbel, commented:
<https://github.com/red/red/issues/3067#issuecomment-335452497>

    What is the calling convention used by your `libRed.dll`?
    What is "Win32 desktop app"?

--------------------------------------------------------------------------------

On 2017-10-10T12:20:28Z, Oldes, commented:
<https://github.com/red/red/issues/3067#issuecomment-335454312>

    As mentioned above, I tried both... for cdecl I get the strange values and with stdcall invalid argument.

--------------------------------------------------------------------------------

On 2017-10-10T12:23:41Z, Oldes, commented:
<https://github.com/red/red/issues/3067#issuecomment-335455033>

    Hm... with the recent sources with `stdcall`  libRed.dll, I get a new error:
    ```
    *** Access Error: invalid UTF-8 encoding: #{8BEC568B}
    *** Where: redRoutine
    *** Stack:
    ```

--------------------------------------------------------------------------------

On 2017-10-10T13:01:42Z, dockimbel, commented:
<https://github.com/red/red/issues/3067#issuecomment-335464731>

    You should not use stdcall lib with an app using cdecl.

--------------------------------------------------------------------------------

On 2017-10-10T13:13:29Z, Oldes, commented:
<https://github.com/red/red/issues/3067#issuecomment-335467993>

    When I use `cdecl`, I still get:
    ```
    integer!
    false
    ```
    when I do:
    ```
    extern "C" red_integer add(red_integer a, red_integer b) {
    	redProbe(a);
    	redProbe(b);
    ...
    ```
    which is not good and main problem, because I cannot communicate with libRed as I would like to.

--------------------------------------------------------------------------------

On 2017-10-10T14:01:13Z, Oldes, commented:
<https://github.com/red/red/issues/3067#issuecomment-335482165>

    @dockimbel I can confirm that it is working now on my side with the latest fix.


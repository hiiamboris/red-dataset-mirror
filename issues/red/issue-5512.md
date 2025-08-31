
#5512: Bases draw slowly since issue #5253
================================================================================
Issue is closed, was reported by mikeyaunish and has 4 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5512>

**Describe the bug**
Bases draw slowly one after another since issue #5253 

**To reproduce**
See: [base-slow-draw.red](https://gist.github.com/mikeyaunish/6dce7477c4fb9a4c64da33a4f73797a2)

**Expected behavior**
Bases to draw all at the same time with no delay

**Platform version**
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 165 date: 15-Jun-2024/7:46:42 commit: #b9c77bcedebba8016a4060ba1cfd6538279f0f81 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2024-06-19T08:04:48Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5512#issuecomment-2178029853>

    Why don't we expose the RATE_LIMIT value, so we can set It until the Microsoft fix?

--------------------------------------------------------------------------------

On 2024-06-19T09:07:54Z, dockimbel, commented:
<https://github.com/red/red/issues/5512#issuecomment-2178162489>

    @qtxie FYI, on `font-gc` branch, the drawing is almost instant.


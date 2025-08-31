# Canonical OpenGL triangle demo written using Red/System

**Gist ID:** d3b0e5c6fdbc4f19ff7a
**Created:** 2012-02-27T22:21:58Z
**Last updated:** 2019-09-12T17:46:58Z

## File: `triangle.reds`

```Red
Red/System [
    Title:   "Simple OpenGL (+GLUT) demo written using Red/System"
    Author:  "Andreas Bolka"
]

#import [
    "libGL.so.1" cdecl [
        gl-clear-color: "glClearColor" [
            r [float32!]
            g [float32!]
            b [float32!]
            a [float32!]
        ]
        gl-clear: "glClear" [
            mask [integer!]
        ]
        gl-load-identity: "glLoadIdentity" []
        gl-matrix-mode: "glMatrixMode" [
            mode [integer!]
        ]
        gl-ortho: "glOrtho" [
            left [float!]
            right [float!]
            bottom [float!]
            top [float!]
            near [float!]
            far [float!]
        ]
        gl-translate-d: "glTranslated" [
            x [float!]
            y [float!]
            z [float!]
        ]
        gl-rotate-d: "glRotated" [
            angle [float!]
            x [float!]
            y [float!]
            z [float!]
        ]
        gl-begin: "glBegin" [
            mode [integer!]
        ]
        gl-flush: "glFlush" []
        gl-end: "glEnd" []
        gl-viewport: "glViewport" [
            x [integer!]
            y [integer!]
            w [integer!]
            h [integer!]
        ]
        gl-color-3d: "glColor3d" [
            r [float!]
            g [float!]
            b [float!]
        ]
        gl-vertex-2d: "glVertex2d" [
            x [float!]
            y [float!]
        ]
    ]
    "libglut.so.3" cdecl [
        glut-init: "glutInit" [
            argcp [pointer! [integer!]]
            argv [str-array!]
        ]
        glut-init-display-mode: "glutInitDisplayMode" [
            mode [integer!]
        ]
        glut-init-window-size: "glutInitWindowSize" [
            w [integer!]
            h [integer!]
        ]
        glut-create-window: "glutCreateWindow" [
            name [c-string!]
        ]
        glut-display-func: "glutDisplayFunc" [
            func [function! []]
        ]
        glut-reshape-func: "glutReshapeFunc" [
            func [function! [w [integer!] h [integer!]]]
        ]
        glut-keyboard-func: "glutKeyboardFunc" [
            func [function! [key [integer!] x [integer!] y [integer!]]]
        ]
        glut-special-func: "glutSpecialFunc" [
            func [function! [key [integer!] x [integer!] y [integer!]]]
        ]
        glut-post-redisplay: "glutPostRedisplay" []
        glut-swap-buffers: "glutSwapBuffers" []
        glut-main-loop: "glutMainLoop" []
    ]
]

#define GL_COLOR_BUFFER_BIT 00004000h
#define GL_DEPTH_BUFFER_BIT 00000100h
#define GL_TRIANGLES        00000004h
#define GL_MODELVIEW        00001700h
#define GL_PROJECTION       00001701h

#define GLUT_DOUBLE         00000002h
#define GLUT_KEY_LEFT       00000064h
#define GLUT_KEY_UP         00000065h
#define GLUT_KEY_RIGHT      00000066h
#define GLUT_KEY_DOWN       00000067h

#define F32 [as float32!]

rotx: 0.0
roty: 0.0
zoom: 1.0

display: func [[cdecl]] [
    gl-clear-color F32 0.3 F32 0.3 F32 0.3 F32 0.0
    gl-clear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT)

    gl-matrix-mode GL_PROJECTION
    gl-load-identity
    gl-ortho zoom * -30.0 zoom * 30.0 zoom * -30.0 zoom * 30.0 -30.0 30.0

    gl-matrix-mode GL_MODELVIEW
    gl-load-identity

    gl-rotate-d rotx 1.0 0.0 0.0
    gl-rotate-d roty 0.0 1.0 0.0

    gl-translate-d -15.0 -15.0 0.0
    gl-begin GL_TRIANGLES
        gl-color-3d 1.0 0.0 0.0     ;; Coloured red, from ...
        gl-vertex-2d 0.0 0.0        ;; ... 0x0 to ...
        gl-color-3d 0.0 1.0 0.0     ;; ... (green) at ...
        gl-vertex-2d 30.0 0.0       ;; ... 30x0 to ...
        gl-color-3d 0.0 0.0 1.0     ;; ... (blue) at ...
        gl-vertex-2d 0.0 30.0       ;; ... 0x30.
    gl-end

    gl-flush

    glut-swap-buffers
]

reshape: func [[cdecl] w [integer!] h [integer!]] [
    gl-viewport 0 0 w h
]

keyboard: func [[cdecl] key [integer!] x [integer!] y [integer!]] [
    switch key [
        #"+" [zoom: zoom / 1.01]
        #"-" [zoom: zoom * 1.01]
    ]
    glut-post-redisplay
]

special: func [[cdecl] key [integer!] x [integer!] y [integer!]] [
    switch key [
        GLUT_KEY_LEFT   [roty: roty - 1.0]
        GLUT_KEY_RIGHT  [roty: roty + 1.0]
        GLUT_KEY_UP     [rotx: rotx - 1.0]
        GLUT_KEY_DOWN   [rotx: rotx + 1.0]
    ]
    glut-post-redisplay
]

args-count-ptr: declare pointer! [integer!]
args-count-ptr/value: system/args-count

glut-init args-count-ptr system/args-list
glut-init-display-mode GLUT_DOUBLE
glut-init-window-size 640 480
glut-create-window "Triangle"
glut-display-func :display
glut-reshape-func :reshape
glut-keyboard-func :keyboard
glut-special-func :special
glut-main-loop
```

## Comments

No comments.

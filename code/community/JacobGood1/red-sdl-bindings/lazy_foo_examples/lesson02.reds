Red/System []

#include %../red-sdl-bindings.reds

window: declare sdl-window!
screen-surface: declare sdl-surface!
hello-world: declare sdl-surface!

init: func [return: [logic!]] [
	success: true

	either (sdl-init SDL_INIT_VIDEO) < 0 [
		print "sdl could not be initialised!"
		success: false
	] [
		;create window
		window: sdl-create-window "sdl tut" SDL_WINDOWPOS_UNDEFINED SDL_WINDOWPOS_UNDEFINED 640 480 SDL_WINDOW_SHOWN
		either window = null [
			print ["window could not be created! sdl-error: " sdl-get-error]
			success: false 
		] [
			;get window surface
			screen-surface: sdl-get-window-surface window
		]
	]

	success
]

load-media: func [return: [logic!]] [
	success: true
	path: "C:\Users\Ariel\Documents\GitHub\red-sdl-bindings\lazy_foo_examples\assets\hello_world.bmp" ;replace this with your own path
	;load splash image
	hello-world: sdl-load-bmp(path) ; macro call
	if hello-world = null [
		print ["unable to load image! sdl-error: " sdl-get-error]
		success: false
	]
	success
]

close: func [] [
	;deallocate surface
	sdl-free-surface hello-world
	hello-world: null

	;destroy window
	sdl-destroy-window window
	window: null

	;quit sdl subsystems
	sdl-quit
]

main: func [] [
	either not init [
		print "failed to init!"
	] [
		;load media
		either not load-media [
			print "failed to load media"
		] [


			;apply the image
			sdl-blit-surface(hello-world null screen-surface null) ;macro call

			;update the surface 
			sdl-update-window-surface window

			;wait two seconds
			sdl-delay 2000
		]
	]

	close
]

main
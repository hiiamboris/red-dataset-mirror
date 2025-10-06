Red [
	Title:   "CLI Screen Grabber"
	Author:   @hiiamboris
	License: 'BSD-3
	Needs:   'View
	Config:  [config-name: 'MSDOS  sub-system: 'console]
]

#include %grab-core.red
#include %console-on-demand.red
#include %../../cli.red

system/script/header: object [	 						;@@ workaround for #4992
	Title:   "CLI Screen Grabber"
	Author:   @hiiamboris
	License: 'BSD-3
]

wrap [cli/process-into grab]

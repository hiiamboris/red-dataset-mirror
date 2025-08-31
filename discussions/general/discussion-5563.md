URL: <https://github.com/red/red/discussions/5563>
Date created: 2024-11-25T10:03:40Z

# libRed as a scripting language

Hello,

I need guidance on how to compile libRed without including any UI or platform-specific components. I want to run Red scripts that utilize my exposed C APIs but without access to other Red features like the UI, or platform access like IO (although I do need Parse to be available). Is this achievable? I looked at the build scripts, but they don't seem to support this setup.

Thank you very much for this great language

## Comments

### dockimbel commented at 2024-11-25T14:56:39Z:

Thanks for the kind support!

For the UI part, just remove `Needs: 'View` from the header in `%libRed.red`.  For the rest, there's no direct support and I'm not sure it's possible to easily remove other parts, though we never tried that. `%red.reds` is your starting point. Try first removing all image-related inclusions. For IO, you can try removing the inclusion of `%simple-io.reds`, then remove the related function calls inside `%runtime/datatypes/file.reds`.

Also, remember that Red is currently 32-bit only, so your C code needs to be compiled for a 32-bit target.

### kariem2k commented at 2024-11-26T11:19:41Z:

Thank you very much for your quick answer and help


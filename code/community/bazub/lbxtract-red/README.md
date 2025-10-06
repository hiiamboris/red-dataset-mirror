# LBXtract-Red #

LBXtract-Red is a script designed to read and extract data from the proprietary .LBX archive format, used by Simtex/Microprose in some of their old games, namely those in the Master of Magic/Orion series.

The script is a rewrite in Red programming language of my previous similar [tool](https://codeberg.org/vazub/lbxtract-go) in Go.

This application has been made possible thanks to the efforts of those who had previously investigated and documented major parts of the LBX format, as provided [here](http://www.shikadi.net/moddingwiki/LBX_Format).

## Games supported ##
- Master of Magic (1994)
- Master of Orion (1993)

## Usage ##
It is assumed that you have the latest executable of Red programming language installed and configured properly.

Run the script from within the same folder where LBX files are located. Files will be unpached to the <**EXTRACTED/**> sub-folder and named according to the original metadata info provided and given specific file extentions like **.voc** or **.xmi** when applicable, or **.none** otherwise.

## License ##
Use of this source code is governed by the [Blue Oak Model License](https://blueoakcouncil.org/license/1.0.0), an exact copy of which can be found in the relevant [LICENSE](./LICENSE.md) file of the current repository.

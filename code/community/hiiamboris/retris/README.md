# RETRIS -- RED-lang Tetris Demo

## <a href="retris/wiki/RETRIS-Explained"> >> A full step-by-step explanation is now available << </a>
<br>

<table><tr height="300">
<td width="25%"><img src="https://codeberg.org/hiiamboris/retris/raw/branch/binary/media/sshot.jpg"></td>
<td><h2>FILES</h2>
<table>
<tr> <td> File <td> Description <td> Binary<a href="#footnote1">*</a>
<tr> <td> <a href="retris/raw/branch/master/retris.red">retris.red</a> <td> <b>The 210-line original, including: </b><ul>
    <li> Score calculation & Hall of Fame
    <li> Difficulty increase
    <li> Stats & next piece display
    <li> Ability to Pause & Restart
    <li> Support of various sets of keys (WASD, Digits)
    <li> Standard-compliant piece rotation & positioning
    <li> Grid for better snapping
    <li> Fancier graphics
    <li> RAM usage optimizations (in the lack of GC)
    </ul> <td> <a href="retris/raw/branch/binary/retris.exe">binary/win32</a>
<tr> <td> <a href="retris/raw/branch/master/retris-xs.red">retris-xs.red</a> <td>
    <b>The minified 100-line version</b>
    <br>It's kept at the very minimum and does not include any of the advanced features
    <td> <a href="retris/raw/branch/binary/retris-xs.exe">binary/win32</a>
</table>
<p id="footnote1"><small>* graphics support on other platforms doesn't yet allow running Retris. YOU can help by isolating the problems and <a href="https://github.com/red/red/issues/new">filing new tickets</a></small></p>
<h2>TESTING</h2>
In case any problem occurs in the binary, try downloading the source and executing `do %retris.red` from the Red console. You can raise issues in this repo or <a href="https://matrix.to/#/@hiiamboris:tchncs.de">chat me on Matrix</a>.
</tr></table>


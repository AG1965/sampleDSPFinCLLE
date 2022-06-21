# sample showing how to use a display file record format in CLLE
Quite simple sample showing how to use a display file record in CLLE to display the contents of a data area.

## prerequisites and installing
A source library for the display file source and a object library for the created dispay file and the CLLE program.

The source library has to have a source physical file QDSPSRC, as command CRTDSPF still has no STMF-parameter.

You can create it with
`CRTSRCPF FILE(<source library>/QDSPSRC)`         

### the copy-and-paste-way

Click on the above links for QCLLESRC and QDSPSRC to see the files inside them, click on them and copy the contents to a source member in source files of your choice.

### the github-way
If you have installed the GNU-make utility from Open-Source-Software, you can avoid copy and paste.

Start a shell with e.g. `QSH` on the IBM i or connect to it with `ssh <your userid>@<ibm i>`.

Check that your current directory is something appropiate like `/home/<your userid>`.

Enter `git clone https://github.com/AG1965/sampleDSPFinCLLE` to download the source files into a directory sampleDSPFinCLLE in the current directory.


## creating the objects

### use the makefile
If you want to use the included makefile, change the name of the library `ANGO1` in line 1 and 2 to names of your choice.

You can do that in the shell with e.g. `nano makefile` or use any PC editor or use `EDTF '/home/<your userid>/sampleDSPFinCLLE/makefile'` to make the changes.

You should then be able to create the objects with just typing `make`.

### use the commands

`ADDLIBLE <object library>`
`CRTDSPF FILE(<object library>/DSPDA1FM) SRCFILE(<source library>/QDSPSRC) SRCMBR(DSPDA1FM)`      
`CRTBNDCL PGM(<object library>/DSPDA1) SRCFILE(<source library>/QCLLESRC) SRCMBR(DSPDA1)`         


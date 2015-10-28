@ECHO OFF
REM Creates a *.fzpz file for a single Fritzing part. For further information
REM run:
REM make-file --help

REM Check for help options:
IF "%1" == "/?" GOTO HELP
IF "%1" == "-h" GOTO HELP
IF "%1" == "--help" GOTO HELP

REM Remove partname.fzpz file if it already exists, without warning
IF EXIST %1.fzpz DEL %1.fzpz

REM Prepare copies of files for archive, silently
COPY part\%1.fzp part.%1.fzp >NUL
COPY svg\icon\%1_icon.svg svg.icon.%1_icon.svg >NUL
COPY svg\breadboard\%1_breadboard.svg svg.breadboard.%1_breadboard.svg >NUL
COPY svg\schematic\%1_schematic.svg svg.schematic.%1_schematic.svg >NUL
COPY svg\pcb\%1_pcb.svg svg.pcb.%1_pcb.svg >NUL

REM Add the files to the zip archive partname.fzpz, silently
7z a -tzip %1.fzpz part.%1.fzp svg.icon.%1_icon.svg svg.breadboard.%1_breadboard.svg svg.schematic.%1_schematic.svg svg.pcb.%1_pcb.svg >NUL

REM Clean up
DEL part.%1.fzp svg.icon.%1_icon.svg svg.breadboard.%1_breadboard.svg svg.schematic.%1_schematic.svg svg.pcb.%1_pcb.svg

REM Report
ECHO %1.fzpz has been created.

GOTO END

:HELP
ECHO Creates a *.fzpz file for a single Fritzing part. Requires application
ECHO 7-Zip (7z.exe) to be in the path.
ECHO.
ECHO.  make-fzpz [/?^|-h^|--help] ^<partname^>
ECHO.
ECHO ^<partname^>     Name of the Fritzing part.
ECHO./?^|-h^|--help   Displays this message.
ECHO.
ECHO The *.fzp and *.svg files for the part are assumed to exist in folders
ECHO \part, \svg\icon, \svg\breadboard, \svg\schematic and \svg\pcb, with names
ECHO ^<partname^>.fzp
ECHO ^<partname^>_^<view^>.svg
ECHO.
ECHO Where ^<view^> is one of icon, breadboard, schematic or pcb.
ECHO.

:END
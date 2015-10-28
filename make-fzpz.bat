REM 

IF EXIST %1.fzpz DEL %1.fzpz

COPY part\%1.fzp part.%1.fzp
COPY svg\icon\%1_icon.svg svg.icon.%1_icon.svg
COPY svg\breadboard\%1_breadboard.svg svg.breadboard.%1_breadboard.svg
COPY svg\schematic\%1_schematic.svg svg.schematic.%1_schematic.svg
COPY svg\pcb\%1_pcb.svg svg.pcb.%1_pcb.svg

7z a -tzip %1.fzpz part.%1.fzp svg.icon.%1_icon.svg svg.breadboard.%1_breadboard.svg svg.schematic.%1_schematic.svg svg.pcb.%1_pcb.svg

DEL part.%1.fzp svg.icon.%1_icon.svg svg.breadboard.%1_breadboard.svg svg.schematic.%1_schematic.svg svg.pcb.%1_pcb.svg
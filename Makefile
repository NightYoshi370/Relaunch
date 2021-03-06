#----------------------------------------------------------------------------------------
# Goals for Build
#----------------------------------------------------------------------------------------

.PHONY: all

all: buildAA makecia

buildAA:
	@$(MAKE) -C main
	@$(MAKE) -C menu
	@mkdir "Relaunch/"
	@mkdir "Relaunch/_nds"
	@mkdir "Relaunch/_nds/Relaunch"
	@mv "menu/menu.nds" "Relaunch/_nds/Relaunch/menu.bin"
	@mv "main/Relaunch.nds" "Relaunch/Relaunch.nds"

makecia:
	@./make_cia --srl="Relaunch/Relaunch.nds"

clean:
	@echo clean build directories
	@$(MAKE) -C main clean
	@$(MAKE) -C menu clean
	@rm -r Relaunch/

	@echo clean package files

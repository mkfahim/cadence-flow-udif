# Makefile for atsh University Digital Implementation Flow (udif)
# Ataus Shafi
# https://github.com/atsh 

.PHONY: setup

# Checking if enviornment is setup correctly
ifndef PROJECT 
$(error PROJECT variable not found. Please make sure to update the variable and source env.sh. Please read README.md for detailed instructions)
endif

setup:
	@if [ ! -d projects/$(PROJECT) ] ; then \
	echo "Project directory for $(PROJECT) not found; Creating directory..." ; \
	mkdir projects/$(PROJECT) ; \
	else  \
	echo "Project directory for $(PROJECT) found; Proceeding with setup..." ; \
	fi ; \
	cd projects/$(PROJECT) ; \
	$(which bash) ../../util/setup.sh

#EOF

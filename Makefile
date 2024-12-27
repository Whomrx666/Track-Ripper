INSTALL_SCRIPT = install.sh
PYTHON_SCRIPT = Track-Ripper.py

all: install run

install:
	@echo "Running install.sh to install dependencies..."
	@chmod +x $(INSTALL_SCRIPT)
	@./$(INSTALL_SCRIPT)

run:
	@echo "Running Track-Ripper.py..."
	@python3 $(PYTHON_SCRIPT)

clean:
	@echo "Cleaning temporary files..."

help:
	@echo "Makefile for running Track-Ripper By Mr.X"
	@echo "Available targets:"
	@echo "  all       : Install dependencies and run main.py"
	@echo "  install   : Install dependencies using install.sh"
	@echo "  run       : Run Track-Ripper.py"
	@echo "  clean     : Clean temporary files (if any)"
	@echo "  help      : Display this information"
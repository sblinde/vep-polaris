.PHONY: all test install clean help

all: help

install:
	@echo "🔧 Installing vep-polaris to /usr/local/bin"
	ln -sf $(PWD)/bin/vep-polaris /usr/local/bin/vep-polaris
	chmod +x bin/*

test:
	@echo "🧪 Running test suite..."
	bash run-tests.sh

clean:
	rm -rf .pytest_cache __pycache__

help:
	@echo "Usage:"
	@echo "  make install      - Install CLI tool to /usr/local/bin"
	@echo "  make test         - Run test suite"
	@echo "  make clean        - Remove temp/test files"

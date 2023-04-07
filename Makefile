.PHONY: help  # List phony targets
help:
	@cat "Makefile" | grep '^.PHONY:' | sed -e "s/^.PHONY:/- make/"

.PHONY: install  # Install developement environment
install: venv/bin/pip
	venv/bin/pip install -r requirements.txt -c constraints.txt

.PHONY: build  # Build HTML version
build: venv/bin/jupyter-book
	venv/bin/jupyter-book build .

.PHONY: html  # View HTML version
html: _build/html/index.html
	open _build/html/index.html

.PHONY: docs  # Copy HTML version to docs folder
docs: build
	rm -rf docs
	mv _build/html docs
	touch docs/.nojekyll

.PHONY: clean  # Clean developement environment
clean:
	rm -rf venv

venv/bin/jupyter-book: venv/bin/pip
	venv/bin/pip install -r requirements.txt -c constraints.txt

venv/bin/pip:
	python3.9 -m venv venv


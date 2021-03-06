.PHONY: all
all: test

.PHONY: build
build: node_modules
	NODE_ENV=production ./node_modules/.bin/babel src --out-dir lib --copy-files
	./node_modules/.bin/flow-copy-source src lib

.PHONY: test
test: venv node_modules
	venv/bin/pre-commit install -f --install-hooks
	venv/bin/pre-commit run --all-files
	yarn typecheck
	yarn test

venv: Makefile requirements-dev.txt
	rm -rf venv
	virtualenv venv --python=python3.6
	venv/bin/pip install -r requirements-dev.txt

node_modules: package.json
	yarn

.PHONY: clean
clean:
	rm -rf coverage
	rm -rf lib
	rm -rf node_modules
	rm -rf venv

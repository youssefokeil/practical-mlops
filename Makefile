.PHONY: venv install install-dev format lint test all

VENV_DIR = .venv

venv:
	python3 -m venv $(VENV_DIR)

	@echo "Virtual Environment Installed, activate it!"

install:
	./$(VENV_DIR)/bin/pip install --upgrade pip &&\
		./$(VENV_DIR)/bin/pip install -r requirements.txt

	@echo "Installed the project dependencies successfully"

install-dev:
	./$(VENV_DIR)/bin/pip install --upgrade pip &&\
		./$(VENV_DIR)/bin/pip install -r requirements-dev.txt

	@echo "Installed the development dependencies successfully."

format:
	./$(VENV_DIR)/bin/black .

lint:
	./$(VENV_DIR)/bin/pylint --disable=R,C remainder.py

test:
	./$(VENV_DIR)/bin/pytest -vv --cov=remainder ./test_remainder.py

all: venv install install-dev format lint test

	@echo "Everything is executed"
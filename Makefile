# Install dependencies
VENV = .venv
PYTHON = python3

install:
	$(PYTHON) -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip
	$(VENV)/bin/pip install -r requirements.txt flake8

# Run linting
lint:
	$(VENV)/bin/flake8 --exclude=.venv .

# Run tests
test:
	PYTHONPATH=$(PWD) $(VENV)/bin/pytest


# Build Docker image
docker-build:
	docker build -t flask-app:latest .

# Run Docker container
docker-run:
	docker run -d -p 5000:5000 flask-app:latest

# Clean up Docker images and containers
clean:
	docker ps -aq | xargs -r docker rm -f || true
	docker images -q flask-app | xargs -r docker rmi -f || true

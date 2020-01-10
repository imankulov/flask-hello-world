# Flask Hello World

![](https://github.com/imankulov/flask-hello-world/workflows/tests/badge.svg)

Hello World Flask Application, served with uwsgi

## Getting Started

Make sure you have poetry installed.

Clone the repo.

```
git clone git@github.com:imankulov/flask-hello-world
cd flask-hello-world
```

Install all the dependencies.

```
poetry install
```

Run tests with pytest

```
poetry run pytest
```

Run the application

```
poetry run uwsgi --ini=uwsgi.conf
```

## Building a Docker image

```
docker build -t flask-hello-world .
```

## Running the image

```
docker run --rm -i -p 5000:5000  -t flask-hello-world
```

# Flask Hello World

![](https://github.com/imankulov/flask-hello-world/workflows/tests/badge.svg)

Hello World Flask Application, served with uwsgi

## Getting Started

Clone the repo.

```
git clone git@github.com:imankulov/flask-hello-world
cd flask-hello-world
```

Install all the dependencies.

```
make deps
```

Run tests with tox

```
tox -e py38
tox -e mypy
```

Run the application

```
uwsgi --ini=uwsgi.conf
```

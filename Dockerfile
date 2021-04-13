# Note: the image is built from https://stackoverflow.com/a/57886655/848010
# and https://pmac.io/2019/02/multi-stage-dockerfile-and-python-virtualenv/
# instructions.
#
# Base image
FROM python:3.9 as base

ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Builder
FROM base as builder

ENV PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    POETRY_VERSION=1.1.5 \
    POETRY_VIRTUALENVS_CREATE=false

RUN pip install "poetry==$POETRY_VERSION"
RUN python -m venv /venv

COPY pyproject.toml poetry.lock ./
RUN poetry export -f requirements.txt | /venv/bin/pip install -r /dev/stdin

COPY . .
RUN poetry build && /venv/bin/pip install dist/*.whl

# Final image
FROM base as final

EXPOSE 5000
ENV PATH=/venv/bin/:$PATH
COPY --from=builder /venv /venv
COPY uwsgi.conf ./
CMD ["uwsgi", "--ini", "uwsgi.conf"]

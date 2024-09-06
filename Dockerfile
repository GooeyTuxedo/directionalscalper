FROM python:3.11-slim as build

ENV PIP_DEFAULT_TIMEOUT=100 \
    # Allow statements and log messages to immediately appear
    PYTHONUNBUFFERED=1 \
    # disable a pip version check to reduce run-time & log-spam
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    # cache is useless in docker image, so disable to reduce image size
    PIP_NO_CACHE_DIR=1

ARG POETRY_VERSION=1.8

RUN set -ex \
    # Create a non-root user
    && addgroup --system --gid 1001 appgroup \
    && adduser --system --uid 1001 --gid 1001 --no-create-home appuser

RUN chown -R appuser:appuser /code/

RUN set -ex \
    && apt-get update \
    && apt-get upgrade -y

# Clean up
RUN set -ex apt-get autoremove -y \\
    && apt-get clean -y \\
    && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /code/requirements.txt
RUN pip3 install -r /code/requirements.txt

COPY ./ /code/
WORKDIR /code


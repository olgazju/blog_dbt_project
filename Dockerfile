FROM python:3.10-slim-buster as builder

USER root

RUN apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y --no-install-recommends \
  git \
  curl \
  ssh-client \
  software-properties-common \
  make \
  build-essential \
  ca-certificates \
  libpq-dev \
  openjdk-11-jre \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade pip setuptools

WORKDIR /dbt_project

ENV DBT_PROFILES_DIR=/dbt_project

COPY . /dbt_project
RUN pip3 install -r requirements.txt
RUN dbt deps

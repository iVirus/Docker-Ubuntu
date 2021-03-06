FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/Denver \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN apt-get update \
 && apt-get dist-upgrade --yes \
 && apt-get install --yes --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    locales \
    tzdata \
 && c_rehash \
 && locale-gen en_US.UTF-8 \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

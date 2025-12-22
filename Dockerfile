FROM ubuntu:22.04

RUN apt update && apt install -y \
  bash git curl shellcheck sudo \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace


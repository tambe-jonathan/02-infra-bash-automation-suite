#!/bin/bash

PACKAGES="curl git unzip jq"

sudo apt update -y
sudo apt install -y "$PACKAGES"

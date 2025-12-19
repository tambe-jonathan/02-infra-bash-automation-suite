#!/bin/bash

SERVICE=$1
[ -z "$SERVICE" ] && echo "Usage: $0 <service>" && exit 1

systemctl status "$SERVICE"


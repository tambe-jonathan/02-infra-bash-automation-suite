#!/bin/bash

case $1 in
  create)
    sudo useradd -m "$2"
    echo "User $2 created"
    ;;
  delete)
    sudo userdel -r "$2"
    echo "User $2 deleted"
    ;;
  *)
    echo "Usage: $0 {create|delete} <username>"
    ;;
esac


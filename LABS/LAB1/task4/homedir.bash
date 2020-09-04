#!/bin/bash
if [ "$HOME" = "$(pwd)" ]; then
    exit 0
else 
    echo "Error, running not in a home dir!"
fi

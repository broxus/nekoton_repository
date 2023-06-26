#!/bin/bash

if git diff --exit-code; then
    echo "No changes, all ok"
    exit 0
else
    echo "Changes detected, please commit them before running tests"
    exit 1
fi

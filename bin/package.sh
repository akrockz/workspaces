#!/bin/bash

set -e

echo "coreservices-workspaces package script running."

# This script's directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup, cleanup.
STAGING="${DIR}/../_staging"
echo "STAGING=${STAGING}"
cd $DIR
mkdir -p $STAGING 
rm -rf $STAGING/*

# Generate deployspec based on template
REPO_DIR="${DIR}/.."
echo "REPO_DIR=${REPO_DIR}"
cd $REPO_DIR
pip install --upgrade pip
pip install -U PyYAML
python3 generate.py

# Copy deployspec and CFN templates into staging folder.
cp -pr $DIR/../*.yaml $STAGING/

echo "coreservices-workspaces package step complete, run.sh can be executed now."

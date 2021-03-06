#!/bin/bash

set -euo pipefail

if [[ $# -eq 0 ]] ; then
    echo "Usage: bash run_server.sh <IP>"
    exit 1
fi

echo "###########################"
echo "Connecting to remote server"
ssh -A -i st219-key-pair-2021-02-07.pem ubuntu@${1} << EOF
  echo "Connection successful"

  echo "###########################"
  echo "Installing packages"
  sudo apt update
  sudo apt -y install g++
  sudo apt -y install make
  sudo apt -y install flex
  echo "Packages installed successfully"

  echo "###########################"
  echo "Cloning repo"
  git clone git@github.com:LangProc/langproc-2020-lab-sts219.git
  echo "Repo cloned successfully"

  echo "###########################"
  echo "Running code"
  cd langproc-2020-lab-sts219/1-regexes
  ./test_lexer.sh
  echo "Ran successfully"
EOF

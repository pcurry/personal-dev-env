#!/bin/bash

env_type=$2
nomi_box_type=${1:?'Error - specify a box type'}
venv_name=${nomi_box_type}_box${env_type:+_$env_type}

echo "Making virtual environment:" $venv_name

# mkvirtualenv $venv_name

if [ $env_type = 'dev' ]; then
    echo "I think this is a dev box."
    echo "Installing dev tools."
    # pip install -r dev_requirements.txt
fi

if [ $env_type = 'test' ]; then
    echo "I think this is a test box"
    echo "Installing test tools."
    # pip install -r test_requirements.txt
fi



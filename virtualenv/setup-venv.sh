#!/bin/bash

# Run internal to the virtual environment to set up the tools to work in said env.
pip install pep8
pip install ipython
pip install -e hg+https://bitbucket.org/agr/rope#egg=rope
pip install -e hg+https://bitbucket.org/agr/ropemacs#egg=ropemacs
pip install -e hg+https://bitbucket.org/agr/ropemode#egg=ropemode
pip install -e git+https://github.com/pinard/Pymacs.git#egg=pymacs

pushd $VIRTUAL_ENV/src/pymacs
make
make install
popd

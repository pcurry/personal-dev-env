
# Defines functions for use in keeping track of current dev branch
function check_python_dev() {
    head -1 ~/.current-python-dev
}

function check_salt_dev() {
    head -1 ~/.current-salt-dev
}

function test_set() {
    echo $1 > test-set
}

function set_python_dev() {
    echo $1 >  ~/.current-python-dev
}

function set_salt_dev() {
    echo $1 >  ~/.current-salt-dev
}

function check_dev() {
    echo Current Python dev branch: $(check_python_dev)
    echo Current salt dev branch: $(check_salt_dev)
}


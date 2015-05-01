#!/bin/bash

ssh() {
	cat <<- _EOF_ >> ~/.ssh/config
		Host aur-dev
		    User aur
		    Hostname aur-dev.archlinux.org
		    IdentityFile ~/.ssh/keys/aur-dev
		    Port 2222
_EOF_
}

modules() {
    echo "Setting up sub-repos..."
    git submodule update --init && git submodule foreach 'git checkout master'
    echo "Adding .gitignore to sub-repos..."
    git submodule foreach --quiet 'cp ../gitignore .gitignore'
}

hooks() {
    echo "Adding commit hooks..."
    shopt -s nullglob
    for folder in .git/modules/*/hooks/ */.git/hooks/; do
        for hook in *.hook; do
            ln -sf "$(pwd)/${hook}" "${folder}/${hook%.hook}"
        done
    done
}

all() {
    ssh
    modules
    hooks
}

${1}

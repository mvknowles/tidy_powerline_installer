#!/bin/zsh
set -x
#set -eu

echo "Creating temporary working directory"
WORKING=$(mktemp -d)
echo "Working directory is ${WORKING}"

function cleanup {
    echo type = $2
    type=$2
    exitcode=$1
    echo exitcode=${exitcode}

    if [ "${type}" = "error" ]; then
        echo removing exit trap handler
        trap - EXIT
    fi

    # some errors are harmless
    if [ "${exitcode}" = 1 ]; then
        exitcode=0
    fi

    if [ -d "${WORKING}" ]; then
        echo "directory exists, exiting"
        rm -fr ${WORKING}
    else
        echo "directory already gone, not doing anything"
    fi
    echo "Exiting with ${exitcode}"
    exit ${exitcode}
    popd
}
trap 'cleanup $? error' ERR
trap 'cleanup $? exit' EXIT

pushd ${WORKING}

echo "Installing Powerline Fonts"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "Installing fontwrangler"
git clone https://github.com/mvknowles/fontwrangler.git
cd fontwrangler
swift ./fontwrangler/main.swift Powerline powerline
cd ..
rm -fr fontwrangler

# exit trap handler should run now

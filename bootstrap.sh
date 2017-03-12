#!/bin/sh
GOPATH=/workspace	# c9ide/devenv/gitlab
SRC_TARGET=${GOPATH}/src/github.com/minishift/
NAME_TARGET=minishift
REPO_URL=https://github.com/minishift/minishift.git

mkdir -p ${GOPATH}/bin
if [ ! -x "${SRC_TARGET}${NAME_TARGET}" ]
then
    mkdir -p ${SRC_TARGET}
    cd ${SRC_TARGET}
    git clone ${REPO_URL} ${NAME_TARGET}
else
    cd ${SRC_TARGET}/${NAME_TARGET}
    git pull --reb
fi

export GOPATH

cd ${SRC_TARGET}/${NAME_TARGET}
glide install -v

make cross

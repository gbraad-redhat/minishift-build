#!/bin/sh
#GOPATH=/var/workspaces	# shared workspace
GOPATH=/workspace	# c9ide/devenv/gitlab
GO_TARGET=/opt
GLIDE_TARGET=/opt
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

if [ ! -x "${GO_TARGET}/go" ]
then
    OS=linux
    ARCH=amd64
    GO_VERSION=1.7.1
    GO_RELEASE_URL="https://storage.googleapis.com/golang/go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
    curl -sSL ${GO_RELEASE_URL} -o /tmp/go.tar.gz
    mkdir -p ${GO_TARGET}/go
    tar --directory=${GO_TARGET} -xvf /tmp/go.tar.gz
    #rm /tmp/go.tar.gz
fi
export GOROOT=${GO_TARGET}/go/
export PATH=$PATH:${GO_TARGET}/go/bin

GLIDE_OS_ARCH=`go env GOHOSTOS`-`go env GOHOSTARCH`
if [ ! -x "${GLIDE_TARGET}/glide" ]
then
    GLIDE_TAG=$(curl -s https://glide.sh/version)
    GLIDE_LATEST_RELEASE_URL="https://github.com/Masterminds/glide/releases/download/${GLIDE_TAG}/glide-${GLIDE_TAG}-${GLIDE_OS_ARCH}.tar.gz"
    curl -sSL ${GLIDE_LATEST_RELEASE_URL} -o /tmp/glide.tar.gz
    mkdir -p ${GLIDE_TARGET}/glide
    tar --directory=${GLIDE_TARGET}/glide -xvf /tmp/glide.tar.gz
    #rm /tmp/glide.tar.gz
fi

export PATH=$PATH:${GLIDE_TARGET}/glide/${GLIDE_OS_ARCH}
export GOPATH

cd ${SRC_TARGET}/${NAME_TARGET}
glide install -v

make cross

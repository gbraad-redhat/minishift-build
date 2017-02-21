#!/bin/sh
#GOPATH=/var/workspaces	# shared workspace
GOPATH=/workspace	# c9ide/devenv/gitlab
GO_TARGET=/opt
GLIDE_TARGET=/opt
SRC_TARGET=${GOPATH}/src/github.com/minishift/
NAME_TARGET=minishift

export GOROOT=${GO_TARGET}/go/
export PATH=$PATH:${GO_TARGET}/go/bin

GLIDE_OS_ARCH=`go env GOHOSTOS`-`go env GOHOSTARCH`

export PATH=$PATH:${GLIDE_TARGET}/glide/${GLIDE_OS_ARCH}
export GOPATH

cd ${SRC_TARGET}/${NAME_TARGET}

make

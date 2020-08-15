APPLICATION := $(shell basename `pwd`)
BUILD_RFC3339 := $(shell date -u +"%Y-%m-%dT%H:%M:%S+00:00")
PACKAGE := $(shell git remote get-url --push origin | sed -E 's/.+[@|/](.+)\.(.+).git/\1.\2/' | sed 's/\:/\//')
REVISION := $(shell git rev-parse HEAD)
VERSION := $(shell git describe --tags)

GO_LDFLAGS := "-w -s \
	-X github.com/jnovack/release.Application=${APPLICATION} \
	-X github.com/jnovack/release.BuildRFC3339=${BUILD_RFC3339} \
	-X github.com/jnovack/release.Package=${PACKAGE} \
	-X github.com/jnovack/release.Revision=${REVISION} \
	-X github.com/jnovack/release.Version=${VERSION} \
	"

all: build

.PHONY: build
build:
	go build -ldflags $(GO_LDFLAGS) main.go

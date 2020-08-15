APPLICATION := $(shell basename `pwd`)
BUILD_RFC3339 := $(shell date -u +"%Y-%m-%dT%H:%M:%S+00:00")
COMMIT := $(shell git rev-parse HEAD)
VERSION := $(shell git describe --tags)

GO_LDFLAGS := " \
	-X github.com/jnovack/release.Application=${APPLICATION} \
 	-X github.com/jnovack/release.BuildRFC3339=${BUILD_RFC3339} \
	-X github.com/jnovack/release.Revision=${COMMIT} \
	-X github.com/jnovack/release.Version=${VERSION} \
	-s -w"

all: build

.PHONY: build
build:
	go build -ldflags $(GO_LDFLAGS) main.go

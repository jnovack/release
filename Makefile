include variables.mk
include go.mk

all: build

.PHONY: build
build:
	go build -ldflags $(GO_LDFLAGS) main.go

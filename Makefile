include variables.mk

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

.PHONY: update
update:
	curl https://sum.golang.org/lookup/github.com/${PACKAGE}@${VERSION}
# release

## Introduction

In all of my programs, I like to have a pretty little line at the top stating
some key facts about the programs compile.

Example:

```
cloudkey v1.0.0-rc2 git revision fe3428954dfd97d850ca687badcace28102e351d go version go1.12
```

I was tiring of writing this over, and over, and over again, so I just made a
package.

## Usage

At the top of `main.go`

```go
import (
	_ "github.com/jnovack/release"
)
```

Then, when you build, add these variables to the command line:

```sh
APPLICATION=$(shell basename `pwd`)
BUILD_RFC3339=$(shell date -u +"%Y-%m-%dT%H:%M:%S+00:00")
COMMIT=$(shell git rev-parse HEAD)
VERSION=$(shell git describe --tags)

GO_LDFLAGS=" \
	-X github.com/jnovack/release.Application=${APPLICATION} \
 	-X github.com/jnovack/release.BuildRFC3339=${BUILD_RFC3339} \
	-X github.com/jnovack/release.Revision=${COMMIT} \
	-X github.com/jnovack/release.Version=${VERSION} \
	-s -w"

go build -ldflags $(GO_LDFLAGS) main.go
```

or use a `Makefile` and do not be a scrub.

## Variables

All the variables are exported, so you can reference them within your code.

```go
var (
	// Application supplied by the linker
	Application = "go-application"
	// BuildRFC3339 supplied by the linker
	BuildRFC3339 = "1970-01-01T00:00:00+00:00"
	// Version supplied by the linker
	Version = "v0.0.0"
	// Commit supplied by the linker
	Commit = "00000000"
	// GoVersion supplied by the runtime
	GoVersion = runtime.Version()
)
```

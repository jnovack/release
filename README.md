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
	"fmt"
	"github.com/jnovack/release"
)

func main() {
	fmt.Println(release.Info())
}
```

Then, when you build, add these variables to the command line:

```sh
APPLICATION=$(shell basename `pwd`)
BUILD_RFC3339=$(shell date -u +"%Y-%m-%dT%H:%M:%S+00:00")
PACKAGE=$(shell git remote get-url --push origin | sed -E 's/.+[@|/](.+)\.(.+).git/\1.\2/' | sed 's/\:/\//')
REVISION=$(shell git rev-parse HEAD)
VERSION=$(shell git describe --tags)

GO_LDFLAGS="-w -s \
	-X github.com/jnovack/release.Application=${APPLICATION} \
	-X github.com/jnovack/release.BuildRFC3339=${BUILD_RFC3339} \
	-X github.com/jnovack/release.Package=${PACKAGE} \
	-X github.com/jnovack/release.Revision=${REVISION} \
	-X github.com/jnovack/release.Version=${VERSION} \
	"

go build -ldflags $(GO_LDFLAGS) main.go
```

or use a `Makefile` and do not be a scrub.

## Variables

All the variables are exported, so you can reference them within your code.

```go
var (
	// Application is the name of the executable
	Application = "myapp"
	// BuildRFC3339 is the build date in RFC 3339 format
	BuildRFC3339 = "1970-01-01T00:00:00+00:00"
	// GoVersion is the version of go that built this executable
	GoVersion = runtime.Version()
	// Package name
	Package = "go/myapp"
	// Revision is the source control hash
	Revision = "00000000"
	// Version of the application (following semver.org standards)
	Version = "v0.0.0"
)
```

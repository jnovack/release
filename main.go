package release

import (
	"fmt"
	"runtime"
	"time"
)

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

func init() {
	if BuildRFC3339 == "1970-01-01T00:00:00+00:00" {
		BuildRFC3339 = fmt.Sprintf("%s", time.Now().UTC().Format("2006-01-02T15:04:05+00:00"))
	}
}

// Info returns a formatted version string
func Info() string {
	return fmt.Sprintf("%s %s git commit %s go version %s build date %s", Application, Version, Revision, GoVersion, BuildRFC3339)
}

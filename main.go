package release

import (
	"fmt"
	"runtime"
	"time"
)

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

// init returns the version
func init() {
	if BuildRFC3339 == "1970-01-01T00:00:00+00:00" {
		BuildRFC3339 = fmt.Sprintf("%s", time.Now().UTC().Format("2006-01-02T15:04:05+00:00"))
	}
	fmt.Printf("%s %s git commit %s go version %s build date %s\n", Application, Version, Commit, GoVersion, BuildRFC3339)
}

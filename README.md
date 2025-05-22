# Go Multiplatform Hello App

This repository contains a simple Go application that demonstrates cross-platform building and testing for various operating systems and architectures (Linux, macOS, Windows, ARM).

## Features

- Cross-compilation of Go code for multiple platforms using Makefile
- Automated build and testing in a Docker container (using quay.io images)
- Supported platforms: linux/amd64, linux/arm64, darwin/amd64, darwin/arm64, windows/amd64

## Usage

### Format code

```sh
make format
```

### Run locally

```sh
make run
```

### Build for all platforms

```sh
make all
```

### Build for a specific platform

```sh
make linux_amd64
make linux_arm64
make darwin_amd64
make darwin_arm64
make windows_amd64
```

### Clean build artifacts

```sh
make clean
```

### Build Docker image

```sh
make image
```

## Structure

- `app/` — Go source code and tests
- [`Makefile`](Makefile) — build scripts for different platforms
- [`Dockerfile`](Dockerfile) — build and test in a container (multi-platform ready)

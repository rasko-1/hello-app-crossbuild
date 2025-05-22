FROM quay.io/projectquay/golang:1.24 AS tester

ARG TARGETPLATFORM

WORKDIR /app
COPY ./app/*.* .

RUN go mod download

RUN --mount=type=cache,target=/root/.cache/go-build \
    go test -v ./...

RUN --mount=type=cache,target=/root/.cache/go-build \
    GOOS=$(echo ${TARGETPLATFORM} | cut -d'/' -f1) \
    GOARCH=$(echo ${TARGETPLATFORM} | cut -d'/' -f2) \
    go build -o /hello_app .